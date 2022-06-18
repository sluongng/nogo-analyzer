package gofmt

import (
	"go/ast"

	"github.com/golangci/prealloc"
	"golang.org/x/tools/go/analysis"
)

var Analyzer = &analysis.Analyzer{
	Name: "prealloc",
	Doc:  "Finds slice declarations that could potentially be pre-allocated",
	Run:  run,
}

var (
	simple     bool
	rangeLoops bool
	forLoops   bool
)

func init() {
	Analyzer.Flags.BoolVar(&simple, "simple", true, "Report preallocation suggestions only on simple loops that have no returns/breaks/continues/gotos in them")
	Analyzer.Flags.BoolVar(&rangeLoops, "range-loops", true, "Report preallocation suggestions on range loops")
	Analyzer.Flags.BoolVar(&forLoops, "for-loops", false, "Report preallocation suggestions on for loops")
}

func run(pass *analysis.Pass) (any, error) {
	for _, f := range pass.Files {
		hints := prealloc.Check([]*ast.File{f}, simple, rangeLoops, forLoops)

		for _, hint := range hints {
			pass.Report(analysis.Diagnostic{
				Pos:     hint.Pos,
				Message: hint.String(),
			})
		}
	}

	return nil, nil
}
