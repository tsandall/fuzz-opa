# fuzz-opa

## The long way...
Install the fuzzer:

```bash
go get -u github.com/dvyukov/go-fuzz/go-fuzz github.com/dvyukov/go-fuzz/go-fuzz-build
```

Update OPA mod file to point to local repo:

```bash
go mod edit -replace github.com/open-policy-agent/opa=$(go env GOPATH)/src/github.com/open-policy-agent/opa
```

Build the fuzzer package. The fuzzer package includes the code to run and the corpus:

```bash
go-fuzz-build github.com/open-policy-agent/fuzz-opa
```

Run the fuzzer:

```bash
go-fuzz -bin=fuzz-fuzz.zip -workdir=workdir
```

The last command will start the fuzzer and output the results to the workdir.

See [go-fuzz/README.md](https://github.com/dvyukov/go-fuzz) for details on the
fuzzer output. Pay attention to the `restarts` output field. This value should
be around 1/10,000. If it's higher than this and the `crashers` field is greater
than zero, check the output directory for crash output.


## Easy Mode
Or just `make`, with optional path for OPA source like:

```bash
make OPA_TARGET=/path/to/opa/src/dir
```
