package main

import (
	"fmt"
	"sort"

	"github.com/sluongng/nogo-analyzer/golangci-lint/util"
)

func main() {
	names := make([]string, 0, len(util.Analyzers))
	for name := range util.Analyzers {
		names = append(names, name)
	}
	sort.Strings(names)

	for _, name := range names {
		fmt.Println(name)
	}
}
