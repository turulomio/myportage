inherit  autotools eutils games

DESCRIPTION="Heroes of Wesnoth is a free, turn-based strategy game where you have to guide a hero through a fantasy world."
SRC_URI="mirror://sourceforge/heroesofwesnoth/heroes-${PV}.zip"

LICENSE="LGPL-2"
SLOT="0"

KEYWORDS="~x86 ~amd64"

DEPEND="
media-libs/sdl-gfx
media-libs/sdl-image
media-libs/sdl-ttf
"
RDEPEND=${DEPEND}

S=${WORKDIR}/heroes-${PV}/src

src_install(){
	cp ${FILESDIR}/heroes.sh ./heroes.sh
	dogamesbin heroes.sh heroes
	cd ${WORKDIR}/heroes-${PV}/
        insinto "${GAMES_DATADIR}"/heroesofwesnoth/font
        doins -r font/* || die "doins failed"
        insinto "${GAMES_DATADIR}"/heroesofwesnoth/img
        doins -r img/* || die "doins failed"
        insinto "${GAMES_DATADIR}"/heroesofwesnoth/maps
        doins -r maps/* || die "doins failed"

	prepgamesdirs
}
