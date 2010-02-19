# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit games cmake-utils

DESCRIPTION="JVGS is an open source platform game that is not like the others. It is build on simple line structures loaded from svg files, giving the whole game a "sketched" and minimalistic look."
HOMEPAGE="http://jvgs.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}-src.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
media-libs/sdl-mixer
media-libs/sdl-image"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${P}-src

src_configure(){
	cmake .
	echo "#!/bin/bash" >> jvgs.sh
	echo "mypwd=`pwd`" >> jvgs.sh
#	echo "mkdir -p ~/.jvgs" >> jvgs.sh
        echo "cd /usr/share/games/jvgs" >> jvgs.sh
	echo "./jvgs" >> jvgs.sh
        echo "cd $mypwd" >> jvgs.sh


}

src_install(){
	dogamesbin jvgs.sh
	dodir /usr/share/games/${PN}
	cp src/jvgs "${D}/usr/share/games/${PN}/"
	cp main.lua "${D}/usr/share/games/${PN}/" 
        cp -R resources/ "${D}/usr/share/games/${PN}/"
}
