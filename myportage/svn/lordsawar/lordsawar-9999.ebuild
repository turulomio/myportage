EAPI="1"
inherit subversion autotools eutils

DESCRIPTION="A wardlords II clone game"
SRC_URI=""

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"

ESVN_REPO_URI="svn://lordsawar.com/lordsawar/"

src_unpack() {
        subversion_src_unpack
        cd ${S}/lordsawar/trunk
        ./autogen.sh || die "autogen failed"
        AT_M4DIR="." eautoreconf
}


src_compile() {
        cd ${S}/lordsawar/trunk
        econf --disable-nls || die "configure failed"
        emake || die "make failed"
}

src_install () {
        cd ${S}/lordsawar/trunk
        emake DESTDIR="${D}" install || die "install failed"
        dodoc ChangeLog* README*  TODO AUTHORS NEWS
}

