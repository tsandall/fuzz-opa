package fuzz

import "github.com/open-policy-agent/opa/ast"

func Fuzz(data []byte) int {
	str := string(data)
	_, _, err := ast.ParseStatements("", str)
	if err == nil {
		ast.CompileModules(map[string]string{"": str})
		return 1
	}
	return 0
}
