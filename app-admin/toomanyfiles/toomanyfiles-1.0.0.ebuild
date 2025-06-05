# Copyright 1999-2018 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1
DESCRIPTION="Remove innecesary files finding datetime patterns in filename"
LICENSE="GPL-3"

IUSE=""
SRC_URI="https://github.com/Turulomio/toomanyfiles/archive/toomanyfiles-v${PV}.tar.gz"
HOMEPAGE="https://github.com/Turulomio/toomanyfiles"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
dev-python/colorama
dev-python/poetry-core
"

RESTRICT="test" #Test for developer not needed

S="${WORKDIR}/toomanyfiles-toomanyfiles-v${PV}"
