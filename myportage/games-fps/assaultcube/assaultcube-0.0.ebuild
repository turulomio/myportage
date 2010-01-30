EAPI=2
inherit subversion autotools eutils games


DESCRIPTION="Free first-person-shooter based on the game Cube"
HOMEPAGE="http://assault.cubers.net/"
LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
DOCS="ChangeLog* README* AUTHORS"

ESVN_REPO_URI="https://actiongame.svn.sourceforge.net/svnroot/actiongame/trunk"

DEPEND="media-libs/openal
        media-libs/sdl-image"

src_unpack() {
        subversion_src_unpack
	cd ${S}
        cp ${FILESDIR}/assaultcube ${S}
}


src_compile() {
        cd ${S}/ac/source/src
        make clean
        emake -j 1|| die "make failed"
}

src_install () {
	cd ${S}
	dogamesbin assaultcube || die "error"

	cd ${S}/ac/source/src
	emake install || die "install failed"

        cd ${S}/ac/
        dogamesbin  bin_unix/native_client || die "doins failed"
        dogamesbin  bin_unix/native_server || die "doins failed"

        insinto "${GAMES_DATADIR}/${PN}/packages"
        doins -r packages/* || die "doins failed"

        insinto "${GAMES_DATADIR}/${PN}/config"
        doins -r config/* || die "doins failed"

        insinto "${GAMES_DATADIR}/${PN}/bot"
        doins -r bot/* || die "doins failed"

        insinto "${GAMES_DATADIR}/${PN}/docs"
        doins -r docs/* || die "doins failed"

	cp icon.ico assaultcube.ico
	doicon assaultcube.ico
	make_desktop_entry assaultcube AssaultCube /usr/share/pixmaps/assaultcube.ico

        prepgamesdirs
}
