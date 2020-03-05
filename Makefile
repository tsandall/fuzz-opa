OPA_TARGET?=$(shell go env GOPATH)/src/github.com/open-policy-agent/opa

all:
	rm -f *.zip
	rm -fr workdir
	go mod edit -replace github.com/open-policy-agent/opa=$(OPA_TARGET)
	go get -u github.com/dvyukov/go-fuzz/go-fuzz github.com/dvyukov/go-fuzz/go-fuzz-build
	go-fuzz-build github.com/open-policy-agent/fuzz-opa
	go-fuzz -bin=fuzz-fuzz.zip -workdir=workdir
