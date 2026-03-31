.PHONY: all go go-http dart python merge

all: clean go dart python

merge:
	@chmod +x http/merge.sh
	@bash http/merge.sh

go:
	buf generate --template codegen/go.yaml

go-http: merge
	buf generate --template codegen/go_http.yaml

dart:
	buf generate --template codegen/dart.yaml

python:
	buf generate --template codegen/python.yaml

clean:
	rm -rf gen
