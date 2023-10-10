package util

import (
	"go/token"
	"path/filepath"
	"strings"

	"golang.org/x/tools/go/analysis"
	"honnef.co/go/tools/analysis/lint"
)

type ignore interface {
	match(pos token.Position) bool
}

type lineIgnore struct {
	File string
	Line int
}

func (li lineIgnore) match(pos token.Position) bool {
	return pos.Filename == li.File && pos.Line == li.Line
}

type fileIgnore struct {
	File string
}

func (fi fileIgnore) match(pos token.Position) bool {
	return pos.Filename == fi.File
}

// asIgnores parses the staticcheck directives and returns a list of ignores. It takes inspiration
// from https://github.com/dominikh/go-tools/blob/4ec1f474ca6c0feb8e10a8fcca4ab95f5b5b9881/lintcmd/lint.go#L324-L373
// and https://github.com/dominikh/go-tools/blob/4ec1f474ca6c0feb8e10a8fcca4ab95f5b5b9881/lintcmd/directives.go
// Although not expicitly documented, staticcheck directives can be specified as path-like patterns: e.g. ST1*
func asIgnores(fs *token.FileSet, analyzerName string, lds []lint.Directive) []ignore {
	var igs []ignore
	for _, ld := range lds {
		for _, c := range strings.Split(ld.Arguments[0], ",") {
			if m, _ := filepath.Match(c, analyzerName); m {
				pos := fs.Position(ld.Node.Pos())
				switch ld.Command {
				case "ignore":
					igs = append(igs, lineIgnore{
						File: pos.Filename,
						Line: pos.Line,
					})
				case "file-ignore":
					igs = append(igs, fileIgnore{
						File: pos.Filename,
					})
				}
			}
		}
	}

	return igs
}

func isIgnored(fs *token.FileSet, igs []ignore, d analysis.Diagnostic) bool {
	pos := fs.Position(d.Pos)
	for _, ig := range igs {
		if ig.match(pos) {
			return true
		}
	}

	return false
}
