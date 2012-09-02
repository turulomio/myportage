EAPI=3
inherit autotools eutils
DESCRIPTION="OpenGL Parchis"
HOMEPAGE="http://glparchis.sourceforge.net"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86 amd64"

SRC_URI="mirror://sourceforge/project/${PN}/${PN}/${P}/${P}.tar.gz"
DEPEND="
dev-python/PyQt4
dev-python/pyopengl
media-sound/vorbis-tools[ogg123]
"
RDEPEND=${DEPEND}

src_compile(){
        emake compile || die "Error compiling"
}

src_install(){
        emake DESTDIR="${D}" install || die "Install failed"
}
