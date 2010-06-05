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
        mkdir ${D}/usr/share/pixmaps
        cp src/images/edb48-logo.png ${D}/usr/share/pixmaps/
        make_desktop_entry ${PN} "Edebugger" /usr/share/pixmaps/edb48-logo.png 
        mkdir ${D}/usr/bin
        echo "#!/bin/bash" > ${D}/usr/bin/edb
        echo "mypwd=`pwd`" >> ${D}/usr/bin/edb
        echo "cd /usr/share/edebugger" >> ${D}/usr/bin/edb
        echo "./edb" >> ${D}/usr/bin/edb
        echo "cd ${mypwd}" >> ${D}/usr/bin/edb
        chmod 755 ${D}/usr/bin/edb
        mkdir ${D}/usr/share/edebugger
	cp edb  ${D}/usr/share/edebugger 
        cp lib*   ${D}/usr/share/edebugger
}
