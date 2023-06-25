# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{10,11,12} )

inherit distutils-r1

DESCRIPTION="We have made you a wrapper you can't refuse"
HOMEPAGE="https://python-telegram-bot.org/"
SRC_URI="https://github.com/python-telegram-bot/python-telegram-bot/releases/download/v${PV}/python-telegram-bot-${PV}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="
dev-python/APScheduler 
dev-python/cachetools
dev-python/httpx
dev-python/rfc3986
dev-python/tornado
"