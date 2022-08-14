# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

PYTHON_COMPAT=( python{3_9,3_10,3_11} pypy )

inherit distutils-r1

DESCRIPTION="Python module to save console output and create GIF or video"
HOMEPAGE="https://sourceforge.net/projects/ttyrecgenerator/"
SRC_URI="mirror://sourceforge/project/${PN}/${PN}/${PV}/${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
    dev-python/mangenerator
    dev-python/colorama
    media-video/ffmpeg
    x11-terms/xterm
    media-video/ttygif
    app-misc/ttyrec
    "
DEPEND="${RDEPEND}"
