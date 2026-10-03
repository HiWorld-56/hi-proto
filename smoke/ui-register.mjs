// 真界面:扫码 → 邀请码页 → 输码认证 → 进内页。node ui-register.mjs <ai|did>
// 在 Mac 上跑(本机 Chrome 无头 + 经 frp 端口 ssh 到 .64/.65/.66);截图落在第二个参数给的目录。
// 新身份、邀请码现造;收尾 purge(.66 purge.py)+ 删助记词文件(+ 商户扩展表)。
import { spawn, execSync } from 'node:child_process';
import { mkdtempSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

const MODE = process.argv[2] || 'ai';
const OUT = process.argv[3] || '.';
const SITE = MODE === 'ai' ? 'https://hiai.hi.lan/' : 'https://hisrv.hi.lan/';
const APP = MODE === 'ai' ? 'HiAI' : 'HiDID';
const DB = MODE === 'ai' ? 'hi_ai' : 'hi_did';
const TBL = MODE === 'ai' ? 'hi_ai_invitecode' : 'hi_invitecode';
const SELF = 'eb9f3a5c-9632-4d5e-b14d-e385825efe12';
const S64 = 'ssh -o BatchMode=yes -p 56864 lo@183.129.178.205';
const S65 = 'ssh -o BatchMode=yes -p 56865 lo@183.129.178.205';
const S66 = 'ssh -o BatchMode=yes -p 56866 lo@183.129.178.205';
const RUN = Date.now().toString(36);
const MN = `/tmp/ui_reg_${MODE}_${RUN}.txt`;
const sh = (c) => execSync(c, { encoding: 'utf8', stdio: ['ignore', 'pipe', 'pipe'] }).trim();
const log = (...a) => console.log('  ', ...a);
const sleep = (ms) => new Promise((r) => setTimeout(r, ms));
const words = [];
let failed = false;
const check = (name, cond, detail = '') => { console.log(`  ${cond ? '✓' : '✗'} ${name}${cond ? '' : '  (' + detail + ')'}`); if (!cond) failed = true; };

function didtok(env) { return sh(`${S66} 'cd /tmp/didtok && ${env} ./target/release/didtok'`); }

async function main() {
  // 新身份
  sh(`${S66} 'rm -f ${MN} && install -m600 /dev/null ${MN}'`);
  const did = (didtok(`MN_FILE=${MN} DID_ONLY=1`).match(/^DID=(.*)$/m) || [])[1];
  if (!did) throw new Error('造身份失败');
  words.push(did);
  log('新身份', did);
  if (MODE === 'did') {
    // hidid 的 web 登录要求人已在 hidid 建号:先用 app 登录一次
    const q = sh(`${S64} 'export PATH=$HOME/go/bin:$PATH; grpcurl -protoset ~/ci/hi-proto-code/lua/hi.pb -d "{\\"did\\":\\"${SELF}\\",\\"node\\":{\\"app\\":\\"HiDID\\",\\"dev\\":\\"app\\",\\"mac\\":\\"ui-reg\\"}}" hidid-grpc-api.hi.lan:443 hi.did.Auth/GenerateReqId'`);
    const rid = JSON.parse(q).reqId;
    didtok(`MN_FILE=${MN} REQ_ID=${rid} NODE_APP=HiDID NODE_DEV=app MAC=ui-reg`);
  }

  const prof = mkdtempSync(join(tmpdir(), 'uireg-'));
  const port = 9300 + Math.floor(Math.random() * 500);
  const chrome = spawn('/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',
    ['--headless=new', `--remote-debugging-port=${port}`, `--user-data-dir=${prof}`, '--ignore-certificate-errors', '--no-proxy-server', '--window-size=1400,900', 'about:blank'],
    { stdio: 'ignore' });
  try {
    let targets;
    for (let i = 0; i < 50; i++) { try { targets = await (await fetch(`http://127.0.0.1:${port}/json/list`)).json(); break; } catch { await sleep(200); } }
    const page = targets.find((t) => t.type === 'page');
    const ws = new WebSocket(page.webSocketDebuggerUrl);
    await new Promise((r) => ws.addEventListener('open', r, { once: true }));
    let id = 0; const pending = new Map(); const handlers = [];
    ws.addEventListener('message', (ev) => {
      const m = JSON.parse(ev.data);
      if (m.id && pending.has(m.id)) { pending.get(m.id)(m); pending.delete(m.id); }
      else if (m.method) handlers.forEach((h) => h(m));
    });
    const cdp = (method, params = {}) => new Promise((r) => { const i = ++id; pending.set(i, r); ws.send(JSON.stringify({ id: i, method, params })); });
    const evalJs = async (expr) => (await cdp('Runtime.evaluate', { expression: expr, returnByValue: true, awaitPromise: true })).result?.result?.value;
    const shot = async (name) => { const r = await cdp('Page.captureScreenshot', { format: 'png' }); const f = join(OUT, `${MODE}-${name}.png`); writeFileSync(f, Buffer.from(r.result.data, 'base64')); log('截图', f); };
    const waitHash = async (frag, ms) => { for (let t = 0; t < ms; t += 300) { const h = await evalJs('location.hash'); if (h && h.includes(frag)) return true; await sleep(300); } return false; };

    await cdp('Network.enable'); await cdp('Page.enable'); await cdp('Runtime.enable');
    let reqId = null;
    handlers.push(async (m) => {
      if (m.method === 'Network.responseReceived' && m.params.response.url.includes('generate_req_id') && !reqId) {
        await sleep(100);
        const b = await cdp('Network.getResponseBody', { requestId: m.params.requestId });
        try { reqId = JSON.parse(b.result.body).data.reqId; } catch { }
      }
    });
    await cdp('Page.navigate', { url: SITE + '#/login' });
    for (let t = 0; t < 20000 && !reqId; t += 200) await sleep(200);
    check('登录页申请到 reqId', !!reqId, '没截到 generate_req_id');
    await sleep(1500);
    await shot('1-login');

    // 扮 app 扫码:用新身份签这个 reqId
    // 新人在 hi-ai 没账号:回调回「该账号不是商户」(9)—— 这正是要走邀请码那条路,didtok 退出码非 0 是预期
    try { didtok(`MN_FILE=${MN} REQ_ID=${reqId} NODE_APP=${APP} NODE_DEV=web MAC=ui-reg`); } catch (e) { log('扫码回包:', (e.stderr || e.message).split('\n').filter(Boolean).pop()); }
    const onVerify = await waitHash('/verify', 20000);
    check('扫码后跳到邀请码页(not_merchant)', onVerify, await evalJs('location.hash'));
    const q = await evalJs('location.hash');
    check('  邀请码页带的 did 是扫码的人', q.includes(did), q);
    await sleep(800);
    await shot('2-verify');

    // 现造邀请码
    const code = 'uireg' + RUN + Math.random().toString(36).slice(2, 8);
    sh(`${S65} "mysql -h127.0.0.1 -ulo -p568568 ${DB} -e \\"insert into ${TBL}(value,did,is_active,note,created_at,updated_at) values('${code}','${SELF}',1,'ui-register',now(),now())\\" 2>/dev/null"`);
    words.push(code);

    await evalJs(`(()=>{const i=document.querySelector('.verify_wrap input');i.focus();return true})()`);
    await cdp('Input.insertText', { text: code });
    await sleep(300);
    await evalJs(`document.querySelector('.verify_wrap .btn').click()`);
    const onHome = await waitHash('/home', 20000);
    check('输码认证后进了内页 /home', onHome, await evalJs('location.hash'));
    await sleep(3000);
    const info = await evalJs(`(()=>{try{const k=Object.keys(localStorage).find(k=>/Info$/.test(k));let v=JSON.parse(localStorage.getItem(k));if(typeof v==="string")v=JSON.parse(v);return JSON.stringify({key:k,did:v.did,hasToken:!!v.token})}catch(e){return String(e)}})()`);
    log('localStorage', info);
    check('  本地存的 did 是扫码的人、有 token', info.includes(did) && info.includes('"hasToken":true'), info);
    const tipErr = await evalJs(`Array.from(document.querySelectorAll('.el-message--error')).map(e=>e.innerText).join('|')`);
    check('  页面没有错误提示', !tipErr, tipErr);
    await shot('3-home');
    const st = sh(`${S65} "mysql -h127.0.0.1 -ulo -p568568 ${DB} -N -e \\"select is_active from ${TBL} where value='${code}'\\" 2>/dev/null"`);
    check('  邀请码已用', st === '2', st);
    ws.close();
  } finally {
    chrome.kill();
  }
}

try { await main(); } catch (e) { console.log('  ✗ 出错', e.message); failed = true; }
// 收尾
try {
  if (MODE === 'did' && words[0]) sh(`${S65} "mysql -h127.0.0.1 -ulo -p568568 hi_did -e 'drop table if exists DBUserInformationExtension_${words[0]}' 2>/dev/null"`);
  sh(`${S66} 'rm -f ${MN}; ! test -e ${MN}'`);
  if (words.length) console.log(sh(`${S66} 'python3 /home/lo/wip/hinj-brain/tools/probes/purge.py ${words.join(' ')}'`).split('\n').filter((l) => /前|后/.test(l)).join('\n'));
} catch (e) { console.log('  ✗ 收尾失败', e.message); failed = true; }
process.exit(failed ? 1 : 0);
