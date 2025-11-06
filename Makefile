.PHONY: all go dart merge

all: clean go dart

merge:
	@chmod +x merge_http_yaml.sh
	@bash merge_http_yaml.sh

go: merge
	buf generate --template buf.gen.go.yaml

dart:
	buf generate --template buf.gen.dart.yaml

clean:
	rm -rf gen
