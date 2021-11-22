# Copyright 1999-2018 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit git-r3

DESCRIPTION="Simple script to compress mkv with ffmpeg "
LICENSE="GPL-3"

KEYWORDS="x86 amd64"
IUSE=""
EGIT_REPO_URI="https://github.com/turulomio/mkvcompressor.git"
HOMEPAGE="https://github.com/turulomio/mkvcompressor"
LICENSE="GPL-3"

SLOT="0"

RDEPEND="
media-video/ffmpeg
"
DEPEND="${RDEPEND}
"

src_install(){

    dobin mkvcompressor
}