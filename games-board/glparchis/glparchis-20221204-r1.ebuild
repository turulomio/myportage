# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..15} )
inherit distutils-r1 desktop

DESCRIPTION="OpenGL Parchis"
HOMEPAGE="https://github.com/turulomio/glparchis"
SRC_URI="https://github.com/turulomio/glparchis/archive/glparchis-${PV}.tar.gz"

S="${WORKDIR}/glparchis-glparchis-${PV}"
LICENSE="GPL-3"
SLOT="0"
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
