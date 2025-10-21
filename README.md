```shell
# git switch dev
make clean
make go
git add .
git commit -m "xxxxxx"
git tag -a v1.1.10 -m "v1.1.10"
git push --follow-tags
```