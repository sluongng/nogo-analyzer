package gofmt

import (
	"fmt"

	"github.com/golangci/gofmt/goimports"
	"golang.org/x/tools/go/analysis"
)

var Analyzer = &analysis.Analyzer{
	Name: "goimports",
	Doc:  "In addition to fixing imports, goimports also formats your code in the same style as gofmt.",
	Run:  run,
}

func run(pass *analysis.Pass) (any, error) {
	var fileNames []string
	for _, f := range pass.Files {
		pos := pass.Fset.PositionFor(f.Pos(), false)
		fileNames = append(fileNames, pos.Filename)
	}

	for _, f := range fileNames {
		diff, err := goimports.Run(f)
		if err != nil {
			return nil, fmt.Errorf("could not run goimports: %v", err)
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
