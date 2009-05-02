# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Mariano Muñoz

EAPI=2

inherit  autotools eutils

DESCRIPTION="Hosts3D is a 3D real-time network monitor, displaying hosts & packet traffic. "
HOMEPAGE="http://hosts3d.sourceforge.net/"
SRC_URI="mirror://sourceforge/hosts3d/hosts3d-098.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S=${WORKDIR}/hosts3d-098

#DEPEND="dev-perl/sdl-perl"

#src_configure() {
#	econf --prefix=/usr/games || die "Fallo el econf"
#}

#src_install() {
#	emake DESTDIR="${D}" install || die "emake install failed"
#	prepgamesdirs
#}

