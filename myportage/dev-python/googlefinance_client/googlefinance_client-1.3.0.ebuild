# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} pypy )
inherit distutils-r1


MYP=googlefinance
DESCRIPTION="Python client library for google finance api"
HOMEPAGE="https://pypi.python.org/pypi/googlefinance.client"
#SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
SRC_URI="https://pypi.python.org/packages/7d/93/045c1387698fbad410d9c65090321dc8ba8805727879596130364f8c6231/googlefinance.client-1.3.0.tar.gz"
S=${WORKDIR}/googlefinance.client-${PV}/
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	dev-python/pandas"
DEPEND="${RDEPEND}"


