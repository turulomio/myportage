# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Game development"
HOMEPAGE="http://fblend.sourceforge.net/"
SRC_URI="http://heanet.dl.sourceforge.net/sourceforge/fblend/fblend-0.5-beta01.zip"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"



src_compile() {
        cd fblend
        cp make/makefile.unx makefile
        emake || die "make failed"
}



src_install () {
        cd fblend
        emake DESTDIR="${D}" install || die "install failed"
}



