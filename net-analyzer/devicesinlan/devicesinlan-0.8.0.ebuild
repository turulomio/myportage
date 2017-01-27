# Copyright 1999-2011 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="5"
DESCRIPTION="Show devices in a lan. You can enter your known devices, in order to detect strange devices."
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"


IUSE="gui"
SRC_URI="mirror://sourceforge/project/devicesinlan/devicesinlan/${PV}/devicesinlan-${PV}.tar.gz"

DEPEND="
gui? ( dev-python/PyQt5[widgets,gui] )
!gui? ( dev-python/PyQt5 )
dev-python/netifaces
"


src_compile(){
        einfo "Nothing to compile"
}

src_install(){
        emake DESTDIR="${D}" install || die "Install failed"
}
