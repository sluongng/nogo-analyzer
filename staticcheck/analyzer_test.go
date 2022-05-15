package analyzer

import "testing"

func TestAnalyzer(t *testing.T) {
	if Analyzer.Name != name {
		t.Errorf("want %s, got %s", name, Analyzer.Name)
	}

	if Analyzer.Run == nil {
		t.Errorf("analyzer.Run is missing for: %s", name)
	}
}
