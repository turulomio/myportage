# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit git
EAPI=2

 #MY_PV=${PV//./} 
#Quita el punto con bash


DESCRIPTION="JNGL aims to be one of the easiest 2D game libraries for C++ and Python."
HOMEPAGE="http://jngl.watteimdocht.de/Home/"
EGIT_REPO_URI="https://github.com/jhasse/JNGL.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""


DEPEND="
dev-vcs/git
dev-util/scons
"

RDEPEND="${DEPEND}"

S=${WORKDIR}/JNGL

src_compile(){
   scons
   sed -i "s:-py27::" SConstruct
}

src_install(){
   ./install.sh ${D}/usr

   scons python=1|| die
   mkdir -p ${D}/usr/lib/python2.7/site-packages/
   cp python/libjngl.so ${D}/usr/lib/python2.7/site-packages/jngl.so

}
