package analyzer

import "github.com/sluongng/nogo-analyzer/staticcheck/util"

var (
	// Value to be added during stamping
	name = "dummy value please replace using x_defs"

	// Exported analyzer to be consumed by rules_go's nogo
	Analyzer = util.FindAnalyzerByName(name)
)
