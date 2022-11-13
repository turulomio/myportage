EAPI=7
PYTHON_COMPAT=( python{3_9,3_10,3_11} )

inherit distutils-r1
DESCRIPTION="OpenGL Parchis"
LICENSE="GPL-3"

IUSE=""
SRC_URI="https://github.com/turulomio/glparchis/archive/glparchis-${PV}.tar.gz"
HOMEPAGE="https://github.com/turulomio/glparchis"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
dev-python/PyQt5[gui,multimedia,opengl,network,printsupport,widgets]
dev-python/PyQtWebEngine
dev-python/colorama
dev-python/pyopengl
"
S="${WORKDIR}/glparchis-glparchis-${PV}"


src_install() {
	distutils-r1_src_install
	insinto /usr/share/pixmaps
	doins glparchis/images/glparchis.png
	insinto /usr/share/applications
	doins glparchis.desktop

}
