EAPI=3
inherit autotools eutils
DESCRIPTION="OpenGL Parchis"
HOMEPAGE="http://glparchis.sourceforge.net"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86 amd64"

SRC_URI="mirror://sourceforge/project/${PN}/${PN}/${P}/${PN}-src-linux-${PV}.tar.gz"
DEPEND="
dev-python/PyQt4[phonon]
dev-python/pyopengl
"
RDEPEND=${DEPEND}

src_compile(){
        emake compile || die "Error compiling"
}

src_install(){
        emake DESTDIR="${D}" install || die "Install failed"
}
