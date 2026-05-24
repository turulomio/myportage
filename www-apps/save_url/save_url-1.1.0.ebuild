# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..15} )
DISTUTILS_USE_PEP517="poetry"
inherit distutils-r1

DESCRIPTION="Save URL in a single file with a structured name using monolith backend"
HOMEPAGE="https://github.com/turulomio/save_url"
SRC_URI="https://github.com/turulomio/save_url/archive/save_url-${PV}.tar.gz"

S="${WORKDIR}/save_url-save_url-${PV}"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/mechanize[${PYTHON_USEDEP}]
	www-apps/monolith
"
DEPEND="${RDEPEND}"
BDEPEND="dev-python/poetry-core[${PYTHON_USEDEP}]"
