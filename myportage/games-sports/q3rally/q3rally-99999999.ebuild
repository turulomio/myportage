# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit games subversion
DESCRIPTION="An ioq3 based Racing Game."
HOMEPAGE="http://www.q3rally.com"

ESVN_REPO_URI="https://q3rallysa.svn.sourceforge.net/svnroot/q3rallysa"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
"
RDEPEND="${DEPEND}"

src_configure(){
	sed -i 's:./$BIN +set fs_basepath "." +set vm_game 2 +set vm_cgame 2 +set vm_ui 2 $@::' run.sh
	sed -i 's:make -C:emake -C:' run.sh
	sed -i 's:ln :#ln :' run.sh
}

src_compile(){
	./run.sh
}


src_install(){
        mkdir -p ${D}/usr/games/q3rally
	mkdir -p ${D}/usr/games/bin
        mv baseq3r/  ${D}/usr/games/q3rally/

	cd engine/build/relea*
	cp q3rally.* ${D}/usr/games/q3rally
	cp renderer_op* ${D}/usr/games/q3rally
	cp baseq3r/vm/*.qvm ${D}/usr/games/q3rally/baseq3r/vm/
	elog "Falta mejorar la instalación en bin y el destop file"	

}
