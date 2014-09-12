# Copyright 1999-2010 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

IUSE=""
SRC_URI="mirror://sourceforge/project/recovermypartit/recovermypartit/${PV}/recovermypartit-${PV}.tar.gz"
DESCRIPTION="Makes forensics from a partition"
HOMEPAGE="http://recovermypartition.sourceforge.net"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
app-forensics/sleuthkit
app-forensics/foremost
"
S=${WORKDIR}/recovermypartit-${PV}

RDEPEND="${DEPEND}"

src_compile(){
     emake compile|| die "Error compiling"
}

src_install(){
     emake DESTDIR="${D}/usr" install || die "Install failed"
}
