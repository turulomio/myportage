EAPI=2
inherit autotools eutils games

DESCRIPTION="Yo frankie"
HOMEPAGE="http://www.yofrankie.org/"
LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86 amd64"

SRC_URI="http://download.blender.org/apricot/yofrankie_1_1b_bge.zip"

DEPEND="
media-gfx/blender
"
S=${WORKDIR}/yofrankie_1_1b_bge

src_compile(){
	elog "Nada que compilar"
        cp ${FILESDIR}/yo-frankie ${S}

}

src_install(){
	dogamesbin yo-frankie

        insinto "${GAMES_DATADIR}/${PN}"
        doins -r * || die "doins failed"

        prepgamesdirs
}
