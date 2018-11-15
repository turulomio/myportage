# Copyright 1999-2018 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
PYTHON_COMPAT=( python{3_5,3_6,3_7} pypy )

inherit distutils-r1
DESCRIPTION="OpenGL Parchis"
LICENSE="GPL-3"

IUSE=""
SRC_URI="https://github.com/Turulomio/glparchis/archive/glparchis-${PV}.tar.gz"
HOMEPAGE="https://github.com/Turulomio/glparchis"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
dev-python/PyQt5[gui,multimedia,opengl,network,printsupport,webengine,widgets]
dev-python/pyopengl
"
S="${WORKDIR}/glparchis-glparchis-${PV}"
