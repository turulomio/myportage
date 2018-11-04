# Copyright 1999-2018 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
PYTHON_COMPAT=( python{3_5,3_6,3_7} pypy )

inherit distutils-r1

DESCRIPTION="Home and financial accounting system"
LICENSE="GPL-3"

IUSE=""
SRC_URI="https://github.com/Turulomio/xulpymoney/archive/xulpymoney-v${PV}.tar.gz"
HOMEPAGE="https://github.com/Turulomio/xulpymoney"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${RDEPEND}
dev-python/psycopg
dev-python/PyQt5[printsupport,webengine,gui,widgets]
dev-python/pytz
dev-python/officegenerator
dev-qt/linguist-tools
dev-python/PyQtChart
dev-python/colorama
"

S="${WORKDIR}/xulpymoney-xulpymoney-v${PV}"
