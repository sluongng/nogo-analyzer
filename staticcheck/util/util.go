package util

import (
	"fmt"

	"golang.org/x/tools/go/analysis"
	"honnef.co/go/tools/analysis/lint"
	"honnef.co/go/tools/quickfix"
	"honnef.co/go/tools/simple"
	"honnef.co/go/tools/staticcheck"
	"honnef.co/go/tools/stylecheck"
	"honnef.co/go/tools/unused"
)

var Analyzers = func() map[string]*analysis.Analyzer {
	resMap := make(map[string]*analysis.Analyzer)

	for _, analyzers := range [][]*lint.Analyzer{
		quickfix.Analyzers,
		simple.Analyzers,
		staticcheck.Analyzers,
		stylecheck.Analyzers,
		{unused.Analyzer},
	} {
		for _, a := range analyzers {
			resMap[a.Analyzer.Name] = a.Analyzer
		}
	}

	return resMap
}()

func FindAnalyzerByName(name string) *analysis.Analyzer {
	if a, ok := Analyzers[name]; ok {
		return wrapWithIgnores(a)
	}

	panic(fmt.Sprintf("not a valid staticcheck analyzer: %s", name))
}

// wrapWithIgnores modifies the original staticcheck's analyzer report and filters out
// issues on lines or files that are marked as ignored by a staticcheck directive.
func wrapWithIgnores(a *analysis.Analyzer) *analysis.Analyzer {
	originalRun := a.Run
	a.Run = func(pass *analysis.Pass) (interface{}, error) {
		originalReport := pass.Report
		ignores := asIgnores(pass.Fset, a.Name, lint.ParseDirectives(pass.Files, pass.Fset))
		if len(ignores) > 0 {
			pass.Report = func(d analysis.Diagnostic) {
				if !isIgnored(pass.Fset, ignores, d) {
					originalReport(d)
				}
			}
		}

		return originalRun(pass)
	}

	return a
}
