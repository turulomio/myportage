# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils cmake-utils

DESCRIPTION="Othello Game"
HOMEPAGE="http://www.fovea.cc/index.php?page=details_produits&id=ultimateothello&lang=en"
SRC_URI="http://www.fovea.cc/files/ultimateothello-${PV}-src.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

S=${WORKDIR}/simon-0.2rc1-Source

#src_compile() {
#	cd ${dir}
#	emake || die "emake failed"
#}

#src_install() {
#        dogamesbin kartofel || die "dogamesbin failed"

#        insinto "${dir}"
#        doins -r fonts/*.ttf || die "doins failed"

#	make_desktop_entry ${PN} Kartofel


#	prepgamesdirs
#}
