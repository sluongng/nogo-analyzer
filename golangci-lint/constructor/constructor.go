package constructor

import (
	"github.com/golangci/golangci-lint/pkg/goanalysis"

	"github.com/golangci/golangci-lint/pkg/golinters/asciicheck"
	"github.com/golangci/golangci-lint/pkg/golinters/bodyclose"
	"github.com/golangci/golangci-lint/pkg/golinters/canonicalheader"
	"github.com/golangci/golangci-lint/pkg/golinters/containedctx"
	"github.com/golangci/golangci-lint/pkg/golinters/contextcheck"
	"github.com/golangci/golangci-lint/pkg/golinters/durationcheck"
	"github.com/golangci/golangci-lint/pkg/golinters/err113"
	"github.com/golangci/golangci-lint/pkg/golinters/errname"
	"github.com/golangci/golangci-lint/pkg/golinters/execinquery"
	"github.com/golangci/golangci-lint/pkg/golinters/exportloopref"
	"github.com/golangci/golangci-lint/pkg/golinters/fatcontext"
	"github.com/golangci/golangci-lint/pkg/golinters/forcetypeassert"
	"github.com/golangci/golangci-lint/pkg/golinters/gocheckcompilerdirectives"
	"github.com/golangci/golangci-lint/pkg/golinters/gochecknoglobals"
	"github.com/golangci/golangci-lint/pkg/golinters/gochecknoinits"
	"github.com/golangci/golangci-lint/pkg/golinters/gochecksumtype"
	"github.com/golangci/golangci-lint/pkg/golinters/goprintffuncname"
	"github.com/golangci/golangci-lint/pkg/golinters/ineffassign"
	"github.com/golangci/golangci-lint/pkg/golinters/intrange"
	"github.com/golangci/golangci-lint/pkg/golinters/mirror"
	"github.com/golangci/golangci-lint/pkg/golinters/nilerr"
	"github.com/golangci/golangci-lint/pkg/golinters/noctx"
	"github.com/golangci/golangci-lint/pkg/golinters/nosprintfhostport"
	"github.com/golangci/golangci-lint/pkg/golinters/sqlclosecheck"
	"github.com/golangci/golangci-lint/pkg/golinters/testableexamples"
	"github.com/golangci/golangci-lint/pkg/golinters/tparallel"
	"github.com/golangci/golangci-lint/pkg/golinters/zerologlint"
)

var LinterConstructors = []func() *goanalysis.Linter{
	asciicheck.New,
	bodyclose.New,
	canonicalheader.New,
	containedctx.New,
	contextcheck.New,
	durationcheck.New,
	err113.New,
	errname.New,
	execinquery.New,
	exportloopref.New,
	fatcontext.New,
	forcetypeassert.New,
	gocheckcompilerdirectives.New,
	gochecknoglobals.New,
	gochecknoinits.New,
	gochecksumtype.New,
	goprintffuncname.New,
	ineffassign.New,
	intrange.New,
	mirror.New,
	nilerr.New,
	noctx.New,
	nosprintfhostport.New,
	sqlclosecheck.New,
	testableexamples.New,
	tparallel.New,
	zerologlint.New,
}
