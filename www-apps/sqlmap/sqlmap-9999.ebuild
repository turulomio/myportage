EAPI="1"
inherit subversion autotools eutils

DESCRIPTION="A SQL Injection Tool"
SRC_URI=""

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"

ESVN_REPO_URI="https://svn.sqlmap.org/sqlmap/trunk/sqlmap"

src_unpack() {
        subversion_src_unpack
        cd ${S}/navit
        ./autogen.sh || die "autogen.sh failed"

}


src_compile() {
        cd ${S}/navit
        econf || die "configure failed"
        emake || die "make failed"
}

src_install () {
        cd ${S}/navit
        emake DESTDIR="${D}" install || die "install failed"
        dodoc ChangeLog* README*  AUTHORS
}

