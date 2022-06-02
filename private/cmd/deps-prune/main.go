package main

import (
	"flag"
	"log"
	"os"
	"path/filepath"
	"strings"

	"github.com/bazelbuild/buildtools/build"
)

type arrayFlags []string

func (af *arrayFlags) String() string {
	return strings.Join(*af, "\n")
}

func (af *arrayFlags) Set(value string) error {
	*af = append(*af, value)
	return nil
}

func main() {
	// Handle args
	var pruneRules arrayFlags
	var file string
	flag.StringVar(&file, "file", "", "path to deps.bzl file")
	flag.Var(&pruneRules, "prune-rule", "go_repository's name to prune from file, can be used multiple times")
	flag.Parse()

	if file == "" {
		log.Fatalln("missing --file argument")
	}
	if len(pruneRules) == 0 {
		log.Println("no rule to prune. Use -prune-rule to provide rules' name.")
	}

	// ensure that if we are called from bazel, we would change directory accordingly
	// because file could be relative to root of the repo
	if wd := os.Getenv("BUILD_WORKING_DIRECTORY"); wd != "" {
		os.Chdir(wd)
	}

	// Parse up the file
	f, err := os.ReadFile(file)
	if err != nil {
		log.Fatalf("file %s could not be read: %v", file, err)
	}

	name := filepath.Base(file)
	ast, err := build.Parse(name, f)
	if err != nil {
		log.Fatalf("file %s could not be parsed: %v", file, err)
	}

	// Here we make a naive assumption that all the rules are declared in
	// a macro declaration in a simple manner, no if/else supported.
	//
	// Modeled after buildtools/build.DelRules()
	// https://github.com/bazelbuild/buildtools/blob/a43aed7014c840a4c20c84958f3f15df5da780f5/build/rule.go#L92-L95
	for _, stmt := range ast.Stmt {
		switch st := stmt.(type) {
		case *build.DefStmt:
			var j int
			for _, b := range st.Body {
				call, ok := b.(*build.CallExpr)
				if !ok {
					continue
				}

				if containString(pruneRules, build.NewRule(call).Name()) {
					continue
				}

				st.Body[j] = b
				j++
			}
			// prune the array
			st.Body = st.Body[:j]
		default:
			// Do nothing
		}
	}

	// Pruning AST nodes often leave behind empty line for each node.
	//
	// To avoid that, we simply render the ast to text, then removing all empty
	// lines from the text and then parse/reformat it once more to add only the
	// needed new lines.
	prunedFile := strings.ReplaceAll(string(build.Format(ast)), "\n\n", "\n")
	ast, err = build.ParseBzl("pruned_parse.bzl", []byte(prunedFile))
	if err != nil {
		log.Fatalf("could not parse pruned file: %v", err)
	}

	// Write result back to file
	if err := os.WriteFile(file, build.Format(ast), 0o666); err != nil {
		log.Fatalf("could not write result to file %s: %v", file, err)
	}
}

// should be replaced when generic slice.Contain hits stdlib
func containString(as []string, s string) bool {
	for _, a := range as {
		if a == s {
			return true
		}
	}
	return false
}
