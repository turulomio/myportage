# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

DESCRIPTION="The Free Heroes II project (FHeroes 2) aim to create a free implementation of Heroes of Might and Magic II engine using SDL"
HOMEPAGE="http://sourceforge.net/apps/mediawiki/fheroes2/index.php?title=Main_Page"
SRC_URI="mirror://sourceforge/project/${PN}/${PN}/${PN}-src-r${PV}.tgz
http://juegosabiertos.com/cgi-bin/download.pl?file=HMM2GOLD_(juegosabiertos.com).rar"
LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT=0

DEPEND="
app-arch/unrar
dev-libs/libcdio"

RDEPEND="${DEPEND}"

S=${WORKDIR}/fheroes-src

src_install(){
        iso-read -i '${WORKDIR}/Heroes of Might and Magic II (Gold).iso' -e RDS_${V}_A.ZIP -k -o ${WORKDIR}/RDS_${V}_A.ZIP
}
