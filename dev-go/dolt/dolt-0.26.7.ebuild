# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

#inherit go-module 

#EGO_SUM=(
#    "cloud.google.com/storage v1.12.0/go.mod"
#    "github.com/mattn/go-runewidth v0.0.9/go.mod"
#)

EGO_PN="github.com/dolthub/dolt"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
#	${EGO_SUM_SRC_URI}"



KEYWORDS="~amd64"

DESCRIPTION="Dolt – It's Git for Data "
HOMEPAGE="https://github.com/dolthub/dolt"

LICENSE="Apache-2.0"
SLOT="0"

#go-module_set_globals

#RESTRICT="test"

#S=${WORKDIR}/${P}/go/

DEPEND="dev-lang/go"
RDEPEND="${DEPEND}"

## COMPILE WITH THIS COMMAND
## FEATURES="-network-sandbox" emerge -v dolt


src_compile(){
    cd go/cmd/dolt
    go build
}


src_install() {
	dobin go/cmd/dolt/dolt
}
