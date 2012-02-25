# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/sagan-rules/sagan-rules-999999999999.ebuild,v 1.1 2011/08/31 08:30:15 maksbotan Exp $

EAPI=3
inherit games git-2

MY_PV=${PV//./} 
DESCRIPTION="Fachoda Complex is a lightweight airplane arcade simulator, free to use/copy/modify under the terms of the GPLv3."
HOMEPAGE="https://github.com/rixed/fachoda-complex/wiki"

EGIT_REPO_URI="git://github.com/rixed/fachoda-complex.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

#S=${WORKDIR}/${P}/src/src

DEPEND="
"
RDEPEND="${DEPEND}"


src_configure(){
   sed -i 's:PREFIX   \:= /usr/local:PREFIX   \:= /usr:' src/Makefile
   sed -i 's:BINDIR   \:= $(PREFIX)/games:BINDIR   \:= $(PREFIX)/games/bin:' src/Makefile
}

src_compile(){
	cd src
	emake || die 'Error compiling'
}

src_install() 
{
        cd src
        make DESTDIR="${D}" install || "make po install failed"
        cd "${S}"
        doicon complex.jpg
        make_desktop_entry 'fachoda fullscreen x 1024 y 768' 'Fachoda Complex'
        prepgamesdirs
}


