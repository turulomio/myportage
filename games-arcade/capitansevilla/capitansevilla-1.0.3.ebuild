# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit flag-o-matic games

DESCRIPTION="Remake of Capitán Sevilla"
HOMEPAGE="http://computeremuzone.com/ficha.php?id=754"
SRC_URI="http://computeremuzone.com/cezgs/remakes/Capitan.tar.bz2"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
DEPEND="
media-libs/alogg
media-libs/allegro
"

DIR=${WORKDIR}/capitan-1.0.3

src_conf(){
	cd ${DIR}
	make depsclean
	make deps
}

src_compile() {
        cd ${DIR}
	make clean
        sed -i -e "s:-Iinclude:-Iinclude -I/usr/include/alogg:" Makefile
        emake || die "make failed"
}



src_install () {
        cd ${DIR}
        emake DESTDIR="${D}" install || die "install failed"
}



