# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_3,3_4,3_5} pypy )
inherit distutils-r1


DESCRIPTION="Sphinx utility that makes it easy to translate and to apply translation."
HOMEPAGE="https://pypi.python.org/pypi/sphinx-intl"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="-transifex"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	dev-python/six
	dev-python/Babel
	dev-python/click
	dev-python/sphinx
	transifex? ( app-i18n/transifex-client )"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"


