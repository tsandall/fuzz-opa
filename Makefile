all:
	rm -f *.zip
	rm -fr workdir
	go get -u github.com/dvyukov/go-fuzz/...
	go-fuzz-build github.com/open-policy-agent/fuzz-opa
	go-fuzz -bin=fuzz-fuzz.zip -workdir=workdir
