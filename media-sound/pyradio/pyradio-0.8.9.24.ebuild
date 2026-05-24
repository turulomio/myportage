# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Command line internet radio player"
HOMEPAGE="https://github.com/coderholic/pyradio"
SRC_URI="https://github.com/coderholic/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="+mpv mplayer vlc"

RDEPEND="
	mpv? ( media-video/mpv net-misc/socat )
	mplayer? ( media-video/mplayer )
	vlc? ( media-video/vlc )
"
