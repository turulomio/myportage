EAPI="1"
inherit subversion autotools eutils

DESCRIPTION="Vega Strike is an Open Source 3D Action-Space-Sim that lets you trade, fight, and explore in a vast universe."
SRC_URI=""

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"

ESVN_REPO_URI="svn://mtp-target.org/trunk"

src_unpack() {
        subversion_src_unpack
        cd ${S}/mtp-target
        make update

}


src_compile() {
        cd ${S}/mtp-target
        emake || die "make failed"
}

src_install () {
        cd ${S}/mtp-target
        emake DESTDIR="${D}" install || die "install failed"
        dodoc ChangeLog* README*  AUTHORS
}

