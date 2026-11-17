# hi-proto

Protobuf definitions for the HiDID platform, shared across backend, mobile, hardware, and third-party clients.

## Prerequisites

- [buf](https://buf.build/docs/installation)
- [yq](https://github.com/mikefarah/yq) v4+ (required for HTTP interface generation only)

```shell
# Install yq (Linux)
wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/local/bin/yq
chmod +x /usr/local/bin/yq

# Install yq (macOS)
brew install yq
```

## Code Generation

| Target | Command | Output |
|--------|---------|--------|
| Go (gRPC) | `make go` | `gen/go/` |
| Go (gRPC + HTTP) | `make go-http` | `gen/go/` |
| Dart | `make dart` | `gen/dart/` |
| Python | `make python` | `gen/python/` |
| All | `make` | `gen/` |

```shell
# Clean generated files
make clean

# Generate Go gRPC code
make go

# Generate Go gRPC + HTTP gateway code
# Requires: yq, and http/*.yaml rules defined
make go-http

# Generate Dart code
make dart

# Generate Python code
make python
```

## HTTP Interface Rules

HTTP routing rules live in `http/` — one file per service module:

- `http/did.yaml` — DID service
- `http/ai.yaml` — AI service
- `http/club.yaml` — Club (IM) service
- `http/media.yaml` — HiMedia service

To merge all rules into a single file for grpc-gateway:

```shell
make merge
# outputs: http/merged.yaml
```

## Update Dependencies

```shell
buf dep update
```

## Explicit tool selection and boolean outcomes

The tool_choice fields in hi.ai.ChatReq and the Club forwarding request accept
auto, none, required, or a JSON string in the shape
{"type":"function","function":{"name":"installed_tool_name"}}.
The choice is consumed when the first actual tool request is produced; Resume
continues the normal tool loop without forcing the same call again.

For a named function whose schema permits only an empty object (type: object,
no properties or required fields, additionalProperties: false), the coordinator
may produce the real tool request directly, without an additional model request.
The regular dispatch, caller provenance, permissions, execution, Resume, and
tool history still apply. This does not authorize a function or imply success.

Boolean tool values remain false or true, including compact history.
Transport acceptance, a completed prompt, and a successful business operation
are distinct facts.
