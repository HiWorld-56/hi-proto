"""python 冒烟往 _endpoints.sh 的收尾清单里登记 —— 只是**写那两份文件**,收尾本身只在 _endpoints.sh 一处。

清单文件由外层 shell `source _endpoints.sh` 时建好、经环境变量传下来(SMOKE_MADE_FILE / SMOKE_UNDO_FILE),
所以 python 冒烟一律经它的 .sh 壳跑;直接 `python3 xxx.py` 会在第一次登记时报错退出(而不是造了东西却没人收)。

    made(did_or_uuid, ...)          退出时交给 purge.py 按词删行
    undo(shell_cmd)                 退出时在外层 shell 里 eval(后进先出)
    undo_club(token, route, body)   = undo("club_do <token> <route> <json>")
"""
import json
import os
import shlex
import sys


def _reg(env, line):
    path = os.environ.get(env)
    if not path:
        sys.exit(f"缺 {env} —— 要经同名的 .sh 壳跑(收尾机制在 _endpoints.sh)")
    with open(path, "a", encoding="utf-8") as f:
        f.write(line + "\n")


def made(*words):
    for w in words:
        if w:
            _reg("SMOKE_MADE_FILE", w)


def undo(cmd):
    _reg("SMOKE_UNDO_FILE", cmd)


def undo_club(token, route, body):
    undo("club_do %s %s %s" % (shlex.quote(token), route,
                               shlex.quote(json.dumps(body, ensure_ascii=False, separators=(",", ":")))))


def undo_src_rm(url):
    undo("src_rm %s" % shlex.quote(url))
