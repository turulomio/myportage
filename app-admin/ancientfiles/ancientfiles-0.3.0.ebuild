# Copyright 1999-2018 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517="poetry"
inherit distutils-r1
DESCRIPTION="Moves ancient files from a directory to another selecting is age. Then you can backup them"
LICENSE="GPL-3"

IUSE=""
SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://github.com/turulomio/${PN}"

SLOT="0"
KEYWORDS="x86 amd64"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
"
