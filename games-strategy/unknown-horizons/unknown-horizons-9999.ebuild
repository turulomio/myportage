# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit git-2 distutils

DESCRIPTION="Anno-like real time strategy game"
HOMEPAGE="http://unknown-horizons.org/"

EGIT_REPO_URI="git://github.com/unknown-horizons/unknown-horizons.git"

SRC_URI=""

LICENSE="GPL-2"
KEYWORDS=""
SLOT="0"
IUSE=""

DEPEND="
	>=dev-lang/python-2.5[sqlite]
	<dev-lang/python-3
	=games-engines/fife-9999
	dev-python/pyyaml
	dev-python/python-distutils-extra
"
RDEPEND="$DEPEND"
