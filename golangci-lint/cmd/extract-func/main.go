package main

import (
	"go/ast"
	"go/parser"
	"go/token"
	"html/template"
	"log"
	"os"
	"sort"
	"strings"
)

const tmpl = `package constructor

import (
	"github.com/golangci/golangci-lint/pkg/golinters"
	"github.com/golangci/golangci-lint/pkg/golinters/goanalysis"
)

var LinterConstructors = []func() *goanalysis.Linter{
	{{.Constructor}},
}`

func main() {
	t, err := template.New("constructor.go").Parse(tmpl)
	if err != nil {
		log.Fatalf("could not parse template: %v", err)
	}

	packs, err := parser.ParseDir(token.NewFileSet(), os.Args[1], nil, 0)
	if err != nil {
		log.Fatalf("Could not parse directory: %v", err)
	}

	funcs := []string{}
	for _, pack := range packs {
		for _, file := range pack.Files {
			for _, d := range file.Decls {
				if fn, isFn := d.(*ast.FuncDecl); isFn {
					// Function should have a 'New' prefix
					if strings.HasPrefix(fn.Name.Name, "New") &&
						// and take in zero param
						len(fn.Type.Params.List) == 0 &&
						// and only have 1 output
						len(fn.Type.Results.List) == 1 {
						funcs = append(funcs, "golinters."+fn.Name.Name)
					}
				}
			}
		}
	}
	sort.Strings(funcs)

	constructor := strings.Join(funcs, ",\n\t")
	if err := t.Execute(
		os.Stdout,
		struct {
			Constructor string
		}{constructor},
	); err != nil {
		log.Fatalf("Could not execute template: %v", err)
	}
}
