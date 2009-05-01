# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Mariano Muñoz

EAPI=2

inherit eutils autotools

DESCRIPTION="Rar password cracker"
HOMEPAGE="http://rarcrack.sourceforge.net/"
SRC_URI="mirror://sourceforge/rarcrack/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

#S=${WORKDIR}/${P}-rc2/

#src_prepare(){
#	eautoconf
#}

#src_compile() {
#	emake || die "emake failed"
#}

src_install() {
        dobin rarcrack || die "dogamesbin failed"

#        insinto "${dir}"
#        doins -r fonts/*.ttf || die "doins failed"

#	make_desktop_entry ${PN} Kartofel


#	prepgamesdirs
}
