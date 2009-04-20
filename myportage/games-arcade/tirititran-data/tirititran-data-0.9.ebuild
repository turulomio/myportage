# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit flag-o-matic games

DESCRIPTION=""
HOMEPAGE="http://www.super-tirititran.com/"
SRC_URI="mirror://sourceforge/supertirititran/tirititran-data-0.9.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
DEPEND=""

DIR=${WORKDIR}

src_conf(){
	cd ${DIR}/${PN}-data-${N}
	econf
}

src_compile() {
        cd ${DIR}/${PN}-data-${N}
	emake
}

src_install () {
        cd ${DIR}/${PN}-data-${N}
        emake DESTDIR="${D}" install || die "install failed"
}



