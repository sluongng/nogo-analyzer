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

	issueCount := 0

	for _, f := range fileNames {
		b, err := gofmt.Run(f, needSimplify)
		if err != nil {
			return nil, err
		}
		if b == nil {
			continue
		}

		fmt.Printf("gofmt diff: \n%s", string(b))
		issueCount++
	}

	if issueCount > 0 {
		return nil, fmt.Errorf("gofmt check failed on some files")
	}

	return nil, nil
}
