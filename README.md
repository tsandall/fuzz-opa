# fuzz-opa

Install the fuzzer:

```bash
go get -u github.com/dvyukov/go-fuzz/...
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

Or just `make`.
