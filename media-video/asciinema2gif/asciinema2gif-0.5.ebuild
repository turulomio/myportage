# Copyright 1999-2011 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="5"

DESCRIPTION="Convert asciinerama cast to animated gif"
LICENSE="GPL-3"
SRC_URI="https://github.com/tav/asciinema2gif/archive/v${PV}.zip"
SLOT="0"
KEYWORDS="x86 amd64"


IUSE=""
DEPEND="
    media-gfx/gifsicle
    media-gfx/imagemagick
    net-libs/nodejs[npm]
"


src_compile(){
    einfo "Nothing"
}

src_install(){
    if use gui ; then
        python3 Makefile.py --install_all "${D}" || die "Install failed"
    else
        python3 Makefile.py --install_console "${D}" || die "Install failed"
    fi
}

