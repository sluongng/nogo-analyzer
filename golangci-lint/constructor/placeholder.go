// This file is needed to ensure toolings such as `go mod tidy` and gazelle works
package constructor

import (
	_ "github.com/golangci/golangci-lint/pkg/golinters"
	_ "github.com/golangci/golangci-lint/pkg/golinters/goanalysis"
)
