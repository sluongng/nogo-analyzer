package analyzer

import "testing"

func TestAnalyzer(t *testing.T) {
	if name != Analyzer.Name {
		t.Errorf("want %s, got %s", name, Analyzer.Name)
	}
}
