# Copyright 1999-2011 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="5"

DESCRIPTION="Convert ttyrec to animated gif"
LICENSE="GPL-3"
SRC_URI="https://github.com/icholy/ttygif/archive/${PV}.zip"
SLOT="0"
KEYWORDS="x86 amd64"


IUSE=""
DEPEND="
"

src_install(){
        PREFIX=${D}/usr emake install || die
}

einfo "WININFO you can get with xwinfo and making click in the screen"