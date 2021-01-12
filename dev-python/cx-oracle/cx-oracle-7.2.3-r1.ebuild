# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{3_7,3_8,3_9} )
inherit distutils-r1

MY_PN="cx_Oracle"
DESCRIPTION="Python extension module that allows access to Oracle Databases"
HOMEPAGE="https://github.com/oracle/python-cx_Oracle/archive/7.2.3.zip"
#https://github.com/oracle/python-cx_Oracle/archive/7.2.3.zip
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_PN}-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="test doc"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}-${PV}"

src_install() {
	distutils-r1_src_install
	if use test;then
		docinto tests/
		dodoc test/*
	fi
	if use doc;then
		dodoc html/*
	fi
}
