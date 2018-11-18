# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit games eutils

DESCRIPTION="Ardentryst is an action/RPG sidescoller, focused not just on fighting, but on story, and character development."
HOMEPAGE="http://jordan.trudgett.com/"
SRC_URI="mirror://sourceforge/ardentryst/ardentryst1.71.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
<dev-lang/python-3.0.0
dev-python/pygame
"

S="${WORKDIR}/ardentryst1.71/"

src_install() {
        sed -i -e 's/python/python2/' ${S}/ardentryst
        sed -i -e 's/Icon=ardentryst/Icon=\/usr\/share\/pixmaps\/icon.png/' ${S}/Ardentryst.desktop
        doicon ${S}/icon.png
        dobin ${S}/ardentryst
        dodir "${GAMES_DATADIR}/${PN}/"
        cp -r ${S}/* "${D}/${GAMES_DATADIR}/${PN}/"
        insinto "/usr/share/applications"
        doins ${S}/Ardentryst.desktop
        prepgamesdirs
}

