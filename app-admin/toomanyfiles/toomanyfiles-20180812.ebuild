# Copyright 1999-2018 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python{3_5,3_6,3_7} pypy )

inherit distutils-r1

DESCRIPTION="Remove innecesary files finding datetime patterns in filename"
LICENSE="GPL-3"

IUSE=""
SRC_URI="mirror://sourceforge/project/too-many-files/toomanyfiles/${PV}/toomanyfiles-${PV}.tar.gz"
HOMEPAGE="http://too-many-files.sourceforge.net"
LICENSE="GPL-3"


SLOT="0"
KEYWORDS="x86 amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
>=dev-lang/python-3.0.0
dev-python/colorama
dev-python/mangenerator
dev-python/ttyrecgenerator
"
