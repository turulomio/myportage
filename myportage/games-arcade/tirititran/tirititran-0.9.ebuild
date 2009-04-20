# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit flag-o-matic games

DESCRIPTION=""
HOMEPAGE="http://www.super-tirititran.com/"
SRC_URI="mirror://sourceforge/supertirititran/tirititran-0.9.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
DEPEND="
games-arcade/tirititran-data
"

DIR=${WORKDIR}

src_conf(){
	cd ${DIR}/${P}
	econf
	}

src_compile() {
        cd ${DIR}/${P}
	emake
#        sed -i -e "s:-Iinclude:-Iinclude -I/usr/include/alogg:" Makefile
 #       emake || die "make failed"
}



src_install () {
        cd ${DIR}/${P}
        emake DESTDIR="${D}" install || die "install failed"

}



