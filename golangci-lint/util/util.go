package util

import (
	"fmt"

	"golang.org/x/tools/go/analysis"

	"github.com/sluongng/nogo-analyzer/golangci-lint/constructor"
)

var Analyzers = func() map[string]*analysis.Analyzer {
	result := make(map[string]*analysis.Analyzer, len(constructor.LinterConstructors))
	for _, constructor := range constructor.LinterConstructors {
		analyzer := constructor().GetAnalyzers()[0]
		result[analyzer.Name] = analyzer
	}

	return result
}()

func FindAnalyzerByName(name string) *analysis.Analyzer {
	if a, ok := Analyzers[name]; ok {
		return a
	}

	panic(fmt.Sprintf("not a valid staticcheck analyzer: %s", name))
}
