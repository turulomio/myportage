# Copyright 1999-2018 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517="poetry"
inherit distutils-r1

DESCRIPTION="Rename files using patterns"
LICENSE="GPL-3"
IUSE=""
SRC_URI="https://github.com/turulomio/renamebyreplace/archive/renamebyreplace-${PV}.tar.gz"
HOMEPAGE="https://github.com/turulomio/renamebyreplace"
SLOT="0"
KEYWORDS="x86 amd64"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
dev-python/colorama
"

RESTRICT="test" #Test for developer not needed

S="${WORKDIR}/renamebyreplace-renamebyreplace-${PV}"
