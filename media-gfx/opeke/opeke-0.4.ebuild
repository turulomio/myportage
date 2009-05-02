# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils cmake-utils

DESCRIPTION="Brik building"
HOMEPAGE="http://opeke.sourceforge.net/"
SRC_URI="mirror://sourceforge/opeke/Opeke-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

S=${WORKDIR}/Opeke

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
