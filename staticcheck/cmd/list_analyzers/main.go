package main

import (
	"fmt"
	"sort"

	"github.com/sluongng/nogo-analyzer/staticcheck/util"
)

func main() {
	names := make([]string, 0, len(util.Analyzers))

	for a := range util.Analyzers {
		names = append(names, a)
	}

	sort.Strings(names)

	for _, name := range names {
		fmt.Println(name)
	}
}
