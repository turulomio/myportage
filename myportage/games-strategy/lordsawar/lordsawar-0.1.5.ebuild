EAPI="1"
inherit  autotools eutils

DESCRIPTION="A wardlords II clone game"
SRC_URI="http://download.savannah.gnu.org/releases-noredirect/lordsawar/${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
dev-cpp/gtkmm
dev-cpp/libglademm
net-libs/gnet
"
RDEPEND=${DEPEND}


src_configure() {
        ./autogen.sh || die "autogen failed"
        AT_M4DIR="." eautoreconf
}


src_compile() {
        econf --disable-nls || die "configure failed"
        emake || die "make failed"
}

src_install () {
	cp dat/various/castle_icon.png lordsawar.png
	doicon lordsawar.png
	make_desktop_entry lordsawar "Lordsawar" /usr/share/pixmaps/lordsawar.png
        emake DESTDIR="${D}" install || die "install failed"
        dodoc ChangeLog* README*  TODO AUTHORS NEWS
}

