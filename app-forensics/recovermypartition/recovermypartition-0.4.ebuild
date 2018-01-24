# Copyright 1999-2010 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

IUSE=""
SRC_URI="mirror://sourceforge/project/recovermypartit/recovermypartit/${PV}/recovermypartition-${PV}.tar.gz"
DESCRIPTION="Makes forensics from a partition"
HOMEPAGE="http://recovermypartition.sourceforge.net"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
dev-python/PyQt5
app-forensics/sleuthkit
app-forensics/foremost
dev-python/colorama
"
S=${WORKDIR}/recovermypartition-${PV}

RDEPEND="${DEPEND}"

src_compile(){
     einfo "Nothing to compile"
}

src_install(){
     python3 Makefile.py --install "${D}/" || die "Install failed"
}
