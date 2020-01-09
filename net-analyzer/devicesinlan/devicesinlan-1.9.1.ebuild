# Copyright 1999-2018 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
PYTHON_COMPAT=( python{3_6,3_7,3_8} pypy )

inherit distutils-r1
DESCRIPTION="Show devices in a lan. You can enter your known devices, in order to detect strange devices."

LICENSE="GPL-3"

IUSE="gui"
SRC_URI="https://github.com/Turulomio/devicesinlan/archive/devicesinlan-v${PV}.tar.gz"
HOMEPAGE="https://github.com/Turulomio/devicesinlan"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${RDEPEND}
gui? ( dev-python/PyQt5[widgets,gui] )
dev-python/colorama
dev-python/PyQt5[network]
net-analyzer/scapy
"

S="${WORKDIR}/devicesinlan-devicesinlan-v${PV}"
