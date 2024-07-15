package main

import (
	"fmt"
	"os"

	"github.com/bazelbuild/buildtools/build"
)

// USAGE:
//
//	bazel 2>/dev/null test :golangci_lint.test |\
//	  grep '> ' |\
//	  sed 's/> //' |\
//	  xargs -I{} <buildprune> deps.bzl {}
func main() {
	if len(os.Args) < 3 {
		fmt.Println("Usage: buildprune <filename> <name1> <name2> ...")
		return
	}

	filename := os.Args[1]
	namesToDelete := os.Args[2:]

	// Parse the file
	file, err := parseFile(filename)
	if err != nil {
		fmt.Println("Error parsing file:", err)
		return
	}

	// Find and remove the go_repository rules with the given names
	removeGoRepositories(file, namesToDelete)

	// Format and write the updated file
	err = writeFile(filename, file)
	if err != nil {
		fmt.Println("Error writing file:", err)
		return
	}

	fmt.Println("File updated successfully.")
}

func parseFile(filename string) (*build.File, error) {
	data, err := os.ReadFile(filename)
	if err != nil {
		return nil, err
	}

	file, err := build.Parse(filename, data)
	if err != nil {
		return nil, err
	}

	return file, nil
}

func removeGoRepositories(file *build.File, namesToDelete []string) {
	var stmts []build.Expr

	for _, stmt := range file.Stmt {
		def, ok := stmt.(*build.DefStmt)
		if !ok {
			stmts = append(stmts, stmt)
			continue
		}

		var newBody []build.Expr
		for _, bodyStmt := range def.Body {
			call, ok := bodyStmt.(*build.CallExpr)
			if !ok {
				newBody = append(newBody, bodyStmt)
				continue
			}

			ident, ok := call.X.(*build.Ident)
			if !ok || ident.Name != "go_repository" {
				newBody = append(newBody, bodyStmt)
				continue
			}

			for _, arg := range call.List {
				kwarg, ok := arg.(*build.AssignExpr)
				if !ok {
					continue
				}

				if kwarg.LHS.(*build.Ident).Name == "name" {
					name := kwarg.RHS.(*build.StringExpr).Value
					if contains(namesToDelete, name) {
						goto skip
					}
				}
			}
			newBody = append(newBody, bodyStmt)
		skip:
		}
		def.Body = newBody
		stmts = append(stmts, def)
	}

	file.Stmt = stmts
}

func writeFile(filename string, file *build.File) error {
	output := build.Format(file)
	file, err := build.Parse("", output)
	if err != nil {
		return err
	}
	output = build.Format(file)
	return os.WriteFile(filename, output, 0644)
}

func contains(slice []string, item string) bool {
	for _, v := range slice {
		if v == item {
			return true
		}
	}
	return false
}
