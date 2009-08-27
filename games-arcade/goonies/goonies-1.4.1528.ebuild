inherit  autotools eutils games

DESCRIPTION="The action takes place in the sleepy seaside town of Cauldron Point - down in an area known as the Goon Docks. The Goonies are a group of local kids - Mikey, Brand, Mouth, Chunk and Data. One day they find an old treasure map in Mikey's attic. Data figures that this must be the fabulous hidden treasure of the notorious local pirate, One-Eyed Willy. The girls, Andy and Stef, join the other Goonies and the adventure begins. But the secret underground tunnels they are exploring are actually the hideout of the Fratelli Gang, and the Goonies are soon trapped! The Goonies have a powerful ally on their side, however, in the form of the huge and amiable Sloth. "
SRC_URI="http://braingames.jorito.net/goonies/downloads/goonies.src_${PV}.tgz"
LICENSE="LGPL-2"
SLOT="0"

KEYWORDS="~x86 ~amd64"

DEPEND="
"
RDEPEND=${DEPEND}

S=${WORKDIR}/goonies-${PV}

src_install(){
	cp ${FILESDIR}/goonies.sh goonies.sh
	dogamesbin goonies.sh
	exeinto /usr/share/games/goonies/; doexe goonies
        insinto /usr/share/games/goonies/maps; doins maps/*
        insinto /usr/share/games/goonies/graphics; doins graphics/*
        insinto /usr/share/games/goonies/sound; doins sound/*
	make_desktop_entry goonies.sh "The Goonies" /usr/share/games/goonies/graphics/ob_blueguy-jump-r.png
}
