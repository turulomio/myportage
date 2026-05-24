# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..15} )
DISTUTILS_USE_PEP517="poetry"
inherit distutils-r1

DESCRIPTION="Show devices in a LAN and detect strange ones"
HOMEPAGE="https://github.com/Turulomio/devicesinlan"
SRC_URI="https://github.com/Turulomio/devicesinlan/archive/devicesinlan-v${PV}.tar.gz"

S="${WORKDIR}/devicesinlan-devicesinlan-v${PV}"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="gui"

RDEPEND="
	${PYTHON_DEPS}
	gui? ( dev-python/pyqt6[widgets,gui,${PYTHON_USEDEP}] )
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/pyqt6[network,${PYTHON_USEDEP}]
	net-analyzer/scapy[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="dev-python/poetry-core[${PYTHON_USEDEP}]"
