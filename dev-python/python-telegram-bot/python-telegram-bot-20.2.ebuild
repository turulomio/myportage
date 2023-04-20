# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
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
=dev-python/httpx-0.23.3-r1
dev-python/rfc3986
dev-python/tornado
"