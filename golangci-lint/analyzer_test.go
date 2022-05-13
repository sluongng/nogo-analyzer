package analyzer

import (
	"testing"
)

func TestAnalyzer(t *testing.T) {
	if Analyzer.Name != name || Analyzer.Run == nil {
		t.Errorf("want %s, got %s", name, Analyzer.Name)
	}
}
