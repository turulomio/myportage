# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 python3_5 python3_6 )
inherit distutils-r1

MY_PV="${PV}"

DESCRIPTION="Pure python package for reading/writing dBase, FoxPro and Visual FoxPro .dbf files."
HOMEPAGE="http://groups.google.com/group/python-dbase"
SRC_URI="mirror://pypi/d/dbf/dbf-${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

S=${WORKDIR}/${PN}-${MY_PV}
