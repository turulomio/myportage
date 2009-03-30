EAPI="1"
inherit subversion autotools eutils

DESCRIPTION="Physics game"
SRC_URI=""

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"

ESVN_REPO_URI="https://garage.maemo.org/svn/numptyphysics"

src_unpack() {
        subversion_src_unpack
        cd ${S}/trunk
        aclocal
        autoconf
        ./autogen.sh || die "autogen.sh failed"
        eautoreconf || die "configure failed"

}


src_compile() {
        cd ${S}/trunk
        econf || die "configure failed"
        emake || die "make failed"
}

src_install () {
        cd ${S}/trunk
        emake DESTDIR="${D}" install || die "install failed"
        dodoc ChangeLog* README*  AUTHORS
}

