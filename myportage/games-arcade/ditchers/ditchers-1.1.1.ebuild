inherit  autotools eutils games

DESCRIPTION="Ditchers is an action game based on principles of the legendary game Tunneler. Underground tanks dig tunnels in the soil and their goal is to find and destroy the opponent using a variety of weapons."
SRC_URI="mirror://sourceforge/project/ditchers/${P}.tar.gz"
LICENSE="LGPL-2"
SLOT="0"

KEYWORDS="~x86 ~amd64"

DEPEND="
dev-libs/tinyxml
"
RDEPEND=${DEPEND}

S=${WORKDIR}/ditchers

src_compile(){
        sed -i -e 's:/usr/local:/usr:' Makefile
        sed -i -e 's:lua5.1:lua:' ditcher/Makefile
	emake
}
