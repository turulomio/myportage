EAPI="1"
inherit subversion autotools eutils

DESCRIPTION="Vega Strike is an Open Source 3D Action-Space-Sim that lets you trade, fight, and explore in a vast universe."
SRC_URI=""

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
MAKE_OPTS="-j1"
ESVN_REPO_URI="https://vegastrike.svn.sourceforge.net/svnroot/vegastrike/trunk"

src_unpack() {
        subversion_src_unpack
        cd ${S}/vegastrike
        cmake . || die "cmake . failed"

}


src_compile() {
        cd ${S}/vegastrike
        emake || die "make failed"
}

src_install () {
        cd ${S}/vegastrike
        emake DESTDIR="${D}" install || die "install failed"
        dodoc ChangeLog* README*  AUTHORS
}

