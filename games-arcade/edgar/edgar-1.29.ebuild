# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: "

EAPI=6

#inherit games
DESCRIPTION="When Edgar's father fails to return home after venturing out one dark and stormy night, Edgar fears the worst: he has been captured by the evil sorcerer who lives in a fortress beyond the forbidden swamp."
SRC_URI="https://github.com/riksweeney/edgar/archive/1.29.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="
media-libs/libsdl[joystick]
media-libs/sdl-mixer
media-libs/sdl-image
media-libs/sdl-ttf
media-libs/sdl-net
"
RDEPEND=${DEPEND}

src_prepare(){
    sed -i -e 's/Exec=edgar/Exec=\/usr\/games\/edgar/' icons/edgar.desktop
    eapply_user
}

#S=${WORKDIR}/edgar-${PV}

#src_compile(){
#        sed -i -e 's:BIN_DIR = $(PREFIX)/games/:BIN_DIR = $(PREFIX)/games/bin/:' makefile
#	emake
#}
