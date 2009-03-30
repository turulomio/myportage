EAPI=2
inherit subversion autotools eutils games


DESCRIPTION="Free first-person-shooter based on the game Cube"
HOMEPAGE="http://assault.cubers.net/"
LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
DOCS="ChangeLog* README* AUTHORS"

ESVN_REPO_URI="https://actiongame.svn.sourceforge.net/svnroot/actiongame/trunk"

src_unpack() {
        subversion_src_unpack
#        cd ${S}/ac/source/src
#        ./autogen.sh || die "autogen.sh failed"
	cd ${S}
        epatch ${FILESDIR}/makefile-modified.patch
        cp ${FILESDIR}/assaultcube ${S}
}


src_compile() {
        cd ${S}/ac/source/src
        make clean
        emake || die "make failed"
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

	doicon icon.ico
	make_desktop_entry assaultcube AssaultCube

        prepgamesdirs
}
