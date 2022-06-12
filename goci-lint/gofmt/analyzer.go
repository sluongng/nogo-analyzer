package gofmt

import (
	"fmt"

	"github.com/golangci/gofmt/gofmt"
	"golang.org/x/tools/go/analysis"
)

var Analyzer = &analysis.Analyzer{
	Name: "gofmt",
	Doc: "gofmt checks whether code was gofmt-ed" +
		"this tool runs with -s option to check for code simplification",
	Run: run,
}

var needSimplify bool

func init() {
	Analyzer.Flags.BoolVar(&needSimplify, "need-simplify", true, "run gofmt with -s for code simplification")
}

func run(pass *analysis.Pass) (any, error) {
	var fileNames []string
	for _, f := range pass.Files {
		pos := pass.Fset.PositionFor(f.Pos(), false)
		fileNames = append(fileNames, pos.Filename)
	}

	for _, f := range fileNames {
		diff, err := gofmt.Run(f, needSimplify)
		if err != nil {
			return nil, fmt.Errorf("could not run gofmt: %w", err)
		}

		if diff == nil {
			continue
		}

		pass.Report(analysis.Diagnostic{
			Pos:     1,
			Message: fmt.Sprintf("\n%s", diff),
		})
	}

	return nil, nil
}
