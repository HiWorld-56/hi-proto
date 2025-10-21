```shell
# git switch dev
make clean
make go
git add .
git commit -m "提交描述"
git tag v1.0.3
git push --follow-tags
```