# Copyright 1999-2010 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Makes forensics from a partition"
HOMEPAGE="https://recovermypartition.sourceforge.net"
SRC_URI="https://downloads.sourceforge.net/project/recovermypartit/recovermypartit/${PV}/recovermypartition-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
S="${WORKDIR}/recovermypartition-${PV}"
KEYWORDS="amd64 x86"

RDEPEND="
	dev-python/pyqt5
	app-forensics/sleuthkit
	app-forensics/foremost
	dev-python/colorama
"
DEPEND="${RDEPEND}"

src_install() {
	distutils-r1_src_install
}
