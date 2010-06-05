# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Mariano Muñoz $

inherit autotools 
EAPI=2

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
	qmake debugger.pro
	emake
}

src_install(){
#	src/images/ed48-logo.png
#        make_desktop_entry ${PN} "Connectagram" /usr/share/pixmaps/${PN}.ico
	emake install
}
