# Copyright 1999-2018 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{11..15} )
DISTUTILS_USE_PEP517="poetry"
inherit distutils-r1

DESCRIPTION="Remove unnecessary files finding datetime patterns in filename"
HOMEPAGE="https://github.com/turulomio/toomanyfiles"
SRC_URI="https://github.com/turulomio/toomanyfiles/archive/toomanyfiles-v${PV}.tar.gz"
S="${WORKDIR}/toomanyfiles-toomanyfiles-v${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
RESTRICT="test"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
	dev-python/colorama
	dev-python/poetry-core
"
