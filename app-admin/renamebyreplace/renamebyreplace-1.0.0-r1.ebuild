# Copyright 1999-2018 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{11..15} )
DISTUTILS_USE_PEP517="poetry"
inherit distutils-r1

DESCRIPTION="Rename files using patterns"
HOMEPAGE="https://github.com/turulomio/renamebyreplace"
SRC_URI="https://github.com/turulomio/renamebyreplace/archive/renamebyreplace-${PV}.tar.gz"
S="${WORKDIR}/renamebyreplace-renamebyreplace-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
RESTRICT="test"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
	dev-python/colorama
"
