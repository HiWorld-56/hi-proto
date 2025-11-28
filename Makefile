.PHONY: all go go-http dart merge

all: clean go dart

merge:
	@chmod +x merge_http_api_yaml.sh
	@bash merge_http_api_yaml.sh

go:
	buf generate --template buf.gen.go.yaml

go-http: merge
	buf generate --template buf.gen.go.yaml

dart:
	buf generate --template buf.gen.dart.yaml

clean:
	rm -rf gen
