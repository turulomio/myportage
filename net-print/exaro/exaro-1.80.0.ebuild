# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils cmake-utils

DESCRIPTION="It's a free reporting solution"
HOMEPAGE="http://exaro.sourceforge.net/"
SRC_URI="mirror://sourceforge/exaro/${P}.tar.lzma"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

S=${WORKDIR}/${P}

