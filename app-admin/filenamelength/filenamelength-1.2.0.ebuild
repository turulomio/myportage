# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..15} )
DISTUTILS_USE_PEP517="poetry"
inherit distutils-r1

DESCRIPTION="Admin options to work with the max length of the name of your files"
HOMEPAGE="https://github.com/turulomio/filenamelength"
SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	>=dev-python/colorama-0.4.6[${PYTHON_USEDEP}]
	>=dev-python/pydicts-1.5.0[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="dev-python/poetry-core[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
