EAPI=2
inherit subversion games


DESCRIPTION="Red Eclipse a Free and Open Source FPS"
HOMEPAGE="http://www.redeclipse.net/"
LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"

ESVN_REPO_URI="https://redeclipse.svn.sourceforge.net/svnroot/redeclipse"

DEPEND=""
RDEPENDS="${DEPEND}"

S="${WORKDIR}/redeclipse-svn-99999999/src"
src_unpack() {
        subversion_src_unpack
	cd ${S}
}

src_compile(){
	cd ${S}/src
	emake || die
}

src_install(){
   cd ${S}
   insinto ${GAMES_DATADIR}/${PN}
   doins -r  data || die "doins failed"
   dogamesdoc readme.txt license.txt

   cd ${S}/src
   exeopts -m0750
   exeinto ${GAMES_DATADIR}/${PN}
   doexe reclient
   doexe reserver

   dogamesbin ${FILESDIR}/reclient.sh
   dogamesbin ${FILESDIR}/reserver.sh

   doicon redeclipse.ico
   make_desktop_entry reclient.sh "Red Eclipse Client" /usr/share/pixmaps/redeclipse.ico

   prepgamesdirs
}
