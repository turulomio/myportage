# Copyright 2024-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Updated to include more modern Python versions
PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517="hatchling"
inherit distutils-r1

DESCRIPTION="A script to detect swapping while compiling ebuilds in Gentoo"
HOMEPAGE="https://github.com/turulomio/swap-detector"
SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# RDEPEND should contain the libraries needed at runtime
RDEPEND="
    dev-python/colorama[${PYTHON_USEDEP}]
    dev-python/humanize[${PYTHON_USEDEP}]
    dev-python/psutil[${PYTHON_USEDEP}]
"
# BDEPEND is for build-time tools (uv is added via DISTUTILS_USE_PEP517=uv)
BDEPEND="
    ${RDEPEND}
"

