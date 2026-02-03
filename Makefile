.PHONY: all go go-http dart python merge

all: clean go dart python

merge:
	@chmod +x merge_http_api_yaml.sh
	@bash merge_http_api_yaml.sh

go:
	buf generate --template buf.gen.go.yaml

go-http: merge
	buf generate --template buf.gen.go_http.yaml

dart:
	buf generate --template buf.gen.dart.yaml

python:
	buf generate --template buf.gen.python.yaml

clean:
	rm -rf gen
