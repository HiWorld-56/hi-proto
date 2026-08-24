//! 预生成 hi-proto 的 Rust 代码(prost + tonic + pbjson serde)到固定目录,
//! 供 hi-proto-code/rust crate 直接 include!。逻辑复用消费方原 build.rs,只把输出从 OUT_DIR 改成入参目录。
//! 用法: hi-proto-rust-gen <hi-proto 路径> <输出目录 rust/src/gen>
use anyhow::Result;
use std::{collections::HashSet, env, fs::{self, File}, io::{Read, Write}, path::PathBuf, process::Command};
use walkdir::WalkDir;

fn main() -> Result<()> {
    let args: Vec<String> = env::args().collect();
    let repo_root = PathBuf::from(args.get(1).expect("arg1 = hi-proto 路径"));
    let out_root = PathBuf::from(args.get(2).expect("arg2 = 输出目录(rust/src/gen)"));
    let prefix = ".hi";

    // buf export 所有 proto(含第三方依赖)到临时目录
    let buf_out = env::temp_dir().join("hi_proto_gen_export");
    let _ = fs::remove_dir_all(&buf_out);
    fs::create_dir_all(&buf_out)?;
    let output = Command::new("buf")
        .env_remove("HTTPS_PROXY").env_remove("HTTP_PROXY")
        .env_remove("https_proxy").env_remove("http_proxy")
        .args(["export", &repo_root.to_string_lossy(), "--output", &buf_out.to_string_lossy()])
        .output()
        .expect("buf 未安装?");
    if !output.status.success() {
        panic!("buf export 失败:\n{}", String::from_utf8_lossy(&output.stderr));
    }

    let buf_v_root = buf_out.join("hi");
    let mut protos = Vec::new();
    for entry in WalkDir::new(&buf_v_root).into_iter().filter_map(Result::ok) {
        let p = entry.path();
        if p.is_file() && p.extension().and_then(|e| e.to_str()) == Some("proto") {
            protos.push(p.to_string_lossy().to_string());
        }
    }
    if protos.is_empty() { panic!("没找到 .proto"); }
    let includes = vec![buf_out.to_string_lossy().to_string()];

    let _ = fs::remove_dir_all(&out_root);
    fs::create_dir_all(&out_root)?;
    let descriptor_path = out_root.join("hi_proto_descriptor.bin");
    let include_file_name = "hi_proto.rs".to_string();

    let config = tonic_prost_build::configure()
        .build_server(false)
        .out_dir(&out_root)
        .include_file(&include_file_name)
        .file_descriptor_set_path(&descriptor_path)
        .compile_well_known_types(true)
        .extern_path(".google.protobuf", "::pbjson_types");
    config.compile_protos(&protos, &includes).expect("prost-build 失败");

    let descriptor_bytes = fs::read(&descriptor_path)?;
    pbjson_build::Builder::new()
        .register_descriptors(&descriptor_bytes)?
        .out_dir(&out_root)
        .build(&[prefix])?;

    // 入口文件加 #![allow(unused)] + 逐行注入 .serde.rs include
    let entry_file_path = out_root.join(&include_file_name);
    let mut content = String::new();
    File::open(&entry_file_path)?.read_to_string(&mut content)?;
    if !content.starts_with("#[allow(unused)]") {
        content = format!("#[allow(unused)]\n{}", content);
    }
    let mut exists: HashSet<String> = HashSet::new();
    for e in fs::read_dir(&out_root)? {
        if let Some(name) = e?.path().file_name().and_then(|s| s.to_str()) {
            exists.insert(name.to_string());
        }
    }
    let mut out_lines: Vec<String> = Vec::new();
    for line in content.lines() {
        out_lines.push(line.to_string());
        let trimmed = line.trim();
        if let Some(rest) = trimmed.strip_prefix("include!(\"") {
            if let Some(rs_name) = rest.strip_suffix("\");") {
                if rs_name.ends_with(".rs") {
                    let serde_name = format!("{}.serde.rs", rs_name.trim_end_matches(".rs"));
                    if exists.contains(&serde_name) {
                        let indent: String = line.chars().take_while(|c| c.is_whitespace()).collect();
                        out_lines.push(format!("{indent}include!(\"{serde_name}\");"));
                    }
                }
            }
        }
    }
    // ── 描述符也留进 crate ────────────────────────────────────────────────
    //
    // 谁要它:**hinj-brain**。插件经 `ctx.call("hi.club.User/GetOther", body)` 回调 hiclub 时,
    // 宿主要按方法名找出收发类型才能编解码。Go 那侧靠生成代码自动注册的全局表(protoregistry),
    // prost **没有**这种东西 —— 要么手写一张"路径→类型"的表,要么带一份描述符。
    //
    // 🔴 手写表的坏处已经吃过:club 那边的白名单是另一份清单,两份要同步,漂了不报错,
    //    只表现成"文档说能调、实际调不到"。所以带描述符、零表格。
    //
    // ⚠️ **必须随 crate 走,不能让消费方自己去别处取一份** —— 那样描述符与生成代码
    //    会各自漂到不同版本,而症状是"某个字段解出来是空的",查起来毫无头绪。
    //    放这里就与 crate 版本天然锁死。
    out_lines.push(String::new());
    out_lines.push("/// 全量 FileDescriptorSet(含 hi.* 与 imports)。".into());
    out_lines.push("///".into());
    out_lines.push("/// 给需要**按方法名动态编解码**的宿主用(见 hinj-brain 的 ctx.call)。".into());
    out_lines.push("/// prost 不像 protobuf-go 那样有全局注册表,只能带着这份说明书。".into());
    out_lines.push(
        "pub const FILE_DESCRIPTOR_SET: &[u8] = include_bytes!(\"hi_proto_descriptor.bin\");".into(),
    );
    File::create(&entry_file_path)?.write_all((out_lines.join("\n") + "\n").as_bytes())?;
    println!("生成完成 -> {}", out_root.display());
    Ok(())
}
