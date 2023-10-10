package util

import (
	"go/ast"
	"go/parser"
	"go/token"
	"reflect"
	"testing"

	"honnef.co/go/tools/analysis/lint"
)

func TestAsIgnores(t *testing.T) {
	filename := "sample.go"
	sample := `
package fail
//lint:file-ignore ST3000 ignore all of these

func alwaysTrue(a int) string {
	//lint:ignore ST* ignore this
	if a == a {
		return "a"
	}

	return "b"
}
`
	for _, test := range []struct {
		desc, check     string
		expectedIgnores []ignore
	}{
		{
			desc:            "Should capture both directives",
			check:           "ST3000",
			expectedIgnores: []ignore{fileIgnore{File: filename}, lineIgnore{File: filename, Line: 7}},
		},
		{
			desc:            "Should capture only ST*",
			check:           "ST1000",
			expectedIgnores: []ignore{lineIgnore{File: filename, Line: 7}},
		},
		{
			desc:            "Should capture no directives",
			check:           "QF1000",
			expectedIgnores: nil,
		},
	} {
		t.Run(test.desc, func(t *testing.T) {
			fset := token.NewFileSet()
			f, err := parser.ParseFile(fset, filename, sample, parser.ParseComments)
			if err != nil {
				t.Fatal(err)
			}

			lds := lint.ParseDirectives([]*ast.File{f}, fset)
			if len(lds) != 2 {
				t.Errorf("Expected 2 directives, got %d", len(lds))
			}

			igs := asIgnores(fset, test.check, lds)
			if !slicesEquivalent(igs, test.expectedIgnores) {
				t.Errorf("Expected ignores of %+v ignores, got %+v", test.expectedIgnores, igs)
			}
		})
	}
}

func slicesEquivalent(actual, expected []ignore) bool {
	actualAsMap := make(map[ignore]struct{})
	for _, e := range actual {
		actualAsMap[e] = struct{}{}
	}

	expectedAsMap := make(map[ignore]struct{})
	for _, e := range expected {
		expectedAsMap[e] = struct{}{}
	}

	return reflect.DeepEqual(actualAsMap, expectedAsMap)
}
