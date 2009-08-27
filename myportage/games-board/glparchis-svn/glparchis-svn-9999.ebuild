inherit subversion autotools eutils

DESCRIPTION="OpenGL Parchis"
HOMEPAGE="http://glparchis.sourceforge.net"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
DOCS="ChangeLog* README* AUTHORS"

ESVN_REPO_URI="https://glparchis.svn.sourceforge.net/svnroot/glparchis"

DEPEND="
media-libs/ftgl
"
RDEPEND=${DEPEND}

src_unpack() {
        subversion_src_unpack
        ./autogen.sh || die "autogen.sh failed"
}



src_install () {
	cd po
	make update-po
	cd ..
        emake DESTDIR="${D}" install || die "install failed"
	
        doicon glparchis.ico
        make_desktop_entry glparchis "glParchis" /usr/share/pixmaps/glparchis.ico
}
