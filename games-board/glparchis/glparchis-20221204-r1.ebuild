EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1 desktop

DESCRIPTION="OpenGL Parchis"
HOMEPAGE="https://github.com/turulomio/glparchis"
SRC_URI="https://github.com/turulomio/glparchis/archive/glparchis-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
S="${WORKDIR}/glparchis-glparchis-${PV}"
KEYWORDS="amd64 x86"

RDEPEND="
	${PYTHON_DEPS}
	dev-python/pyqt5[gui,multimedia,opengl,network,printsupport,widgets]
	dev-python/pyqtwebengine[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/pyopengl[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

src_install() {
	distutils-r1_src_install
	doicon glparchis/images/glparchis.png
	domenu glparchis.desktop
}
