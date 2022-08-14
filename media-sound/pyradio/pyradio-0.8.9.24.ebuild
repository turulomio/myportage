# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9,10,11} )
inherit distutils-r1

SRC_URI="https://github.com/coderholic/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION=" Command line internet radio player"
HOMEPAGE="http://www.coderholic.com/pyradio"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="+mpv mplayer vlc"
RDEPEND="mpv? ( media-video/mpv net-misc/socat )
mplayer? ( media-video/mplayer )
vlc? ( media-video/vlc )"
