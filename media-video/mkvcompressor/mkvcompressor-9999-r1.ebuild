# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Simple script to compress mkv with ffmpeg"
HOMEPAGE="https://github.com/turulomio/mkvcompressor"
EGIT_REPO_URI="https://github.com/turulomio/mkvcompressor.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

RDEPEND="media-video/ffmpeg"

src_install() {
	dobin mkvcompressor
}
