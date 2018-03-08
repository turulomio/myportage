EAPI=3
inherit autotools eutils
DESCRIPTION="OpenGL Parchis"
HOMEPAGE="http://glparchis.sourceforge.net"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86 amd64"

SRC_URI="mirror://sourceforge/project/${PN}/${PN}/${P}/${PN}-${PV}.tar.gz"
DEPEND="
dev-python/PyQt5[gui,multimedia,opengl,network,printsupport,webengine,widgets]
dev-python/pyopengl
"
RDEPEND=${DEPEND}

src_compile(){
        elog "Nothing to compile"
}

src_install(){
        python3 Makefile.py --destdir "${D}/" || die "Install failed"
}
