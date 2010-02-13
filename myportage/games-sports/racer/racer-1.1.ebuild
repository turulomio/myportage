# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit games eutils

DESCRIPTION="It is about car racing. 7 different tracks, many cars, night racing and many more"
HOMEPAGE="http://hippo.nipax.cz/download.en.php"
SRC_URI="http://hippo.nipax.cz/src/${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
media-libs/allegro
"

src_compile(){
        sed -i -e "s:DESTDIR=/usr/local:DESTDIR=${D}/usr:" Makefile
        emake all
}

src_install(){
	emake install
}
