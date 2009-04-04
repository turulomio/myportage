EAPI=2
inherit autotools eutils games


DESCRIPTION="CG Madness is based on the classic game Marble Madness. "
HOMEPAGE="http://cgmadness.sourceforge.net/"
LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
DOCS="ChangeLog* README* AUTHORS"

SRC_URI="mirror://sourceforge/cgmadness/${P}_Xmas-src.tar.bz2"

DEPEND=""
MY=${WORKDIR}/${PN}


src_compile() {	
	cd ${MY}
        cp ${FILESDIR}/cgmadness.sh ${MY}
        emake || die "make failed"
}

src_install () {
	cd ${MY}
	dogamesbin cgmadness.sh

	exeinto "${GAMES_DATADIR}/${PN}/"
	doexe cgmadness || die "error"

#	emake install || die "install failed"

#        cd ${MY}
#        dogamesbin  bin_unix/native_client || die "doins failed"
#        dogamesbin  bin_unix/native_server || die "doins failed"

        insinto "${GAMES_DATADIR}/${PN}/data/"
        doins -r data/* || die "doins failed"

        insinto "${GAMES_DATADIR}/${PN}/levels/"
        doins -r levels/* || die "doins failed"

	prepgamesdir
}
