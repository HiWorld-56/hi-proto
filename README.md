```shell
# git switch dev
make clean
make go
git add .
git commit -m "xxxxxx"
git tag -a v1.1.10 -m "v1.1.10"
git push --follow-tags
```

buf dep update

依赖: yq v4+

安装yq

wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/local/bin/yq

chmod +x /usr/local/bin/yq