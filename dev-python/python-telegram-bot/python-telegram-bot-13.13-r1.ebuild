# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# Classifier: Programming Language :: Python :: 2 :: Only
# py3 fails one test, pypy anpother.
# Notes on page of home repo reports support of python3.
PYTHON_COMPAT=( python{3_9,3_10,3_11} )

inherit distutils-r1

DESCRIPTION="We have made you a wrapper you can't refuse"
HOMEPAGE="https://python-telegram-bot.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="
dev-python/APScheduler 
dev-python/cachetools
dev-python/httpx 
www-servers/tornado 
dev-python/rfc3986
"
