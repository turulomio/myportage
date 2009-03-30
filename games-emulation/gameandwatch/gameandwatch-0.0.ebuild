EAPI="1"
inherit subversion autotools eutils

DESCRIPTION="Old machines game"
SRC_URI=""

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"

ESVN_REPO_URI="https://gameandwatch.svn.sourceforge.net/svnroot/gameandwatch"

src_unpack() {
        subversion_src_unpack
        cd ${S}/gamewatch/trunk
        ./autogen.sh || die "autogen.sh failed"

}


src_compile() {
        cd ${S}/gamewatch/trunk
        econf || die "configure failed"
        emake || die "make failed"
}

src_install () {
        cd ${S}/gamewatch/trunk
        emake DESTDIR="${D}" install || die "install failed"
        dodoc ChangeLog* README*  AUTHORS
}

