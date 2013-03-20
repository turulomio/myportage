# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Mariano Muñoz $
EAPI=2

inherit autotools 

DESCRIPTION="EDB (Evan's Debugger) is a QT4 based binary mode debugger with the goal of having usability on par with OllyDbg"
HOMEPAGE="http://freshmeat.net/projects/edebugger/"
SRC_URI="http://www.codef00.com/projects/debugger-${PV}.tgz"
KEYWORDS="~amd64 ~x86"
SLOT=0
RDEPEND="
"
DEPEND="${RDEPEND}"
S=${WORKDIR}/debugger

src_compile(){
	qmake -o Makefile debugger.pro
	emake
}

src_install(){
	make INSTALL_ROOT=${D}/usr install || die 'Error al instalar'
        mkdir ${D}/usr/share/pixmaps
        cp src/images/edb48-logo.png ${D}/usr/share/pixmaps/
        make_desktop_entry ${PN} "Edebugger" /usr/share/pixmaps/edb48-logo.png 
}
