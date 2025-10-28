# Copyright 1999-2018 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517="poetry"

inherit distutils-r1
DESCRIPTION="Show devices in a lan. You can enter your known devices, in order to detect strange devices."

LICENSE="GPL-3"


IUSE="gui"
SRC_URI="https://github.com/Turulomio/devicesinlan/archive/devicesinlan-v${PV}.tar.gz"
HOMEPAGE="https://github.com/Turulomio/devicesinlan"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
gui? ( dev-python/pyqt6[widgets,gui] )
dev-python/colorama
dev-python/pyqt6[network]
net-analyzer/scapy
"

S="${WORKDIR}/devicesinlan-devicesinlan-v${PV}"
