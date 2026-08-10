//go:build tools
// +build tools

package staticcheck_tools

import (
	_ "golang.org/x/tools/cmd/goimports"
	_ "honnef.co/go/tools/cmd/staticcheck"
)

// This file is used to track tool dependencies.
