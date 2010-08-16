# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
 
EAPI="2"
 
inherit qt4-edge

DESCRIPTION="Tubularix is a free game similar to Tetris seen from a tubular perspective. "
HOMEPAGE="http://tubularix.sourceforge.net"
SRC_URI="mirror://sourceforge/tubularix/tubularix/0.4/tubularix-${PV}-src.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

#S=${WORKDIR}/${PN}
 
DEPEND="
"
RDEPEND="${DEPEND}"
 
src_install(){
	dobin tubularix
}
