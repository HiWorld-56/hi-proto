.PHONY: all go dart

all: clean go dart

go:
	buf generate --template buf.gen.go.yaml

dart:
	buf generate --template buf.gen.dart.yaml

clean:
	rm -rf gen
