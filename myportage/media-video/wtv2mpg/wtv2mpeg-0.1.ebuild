# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Converter wtv to mpg"
HOMEPAGE=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~86"

DEPEND="
media-video/mjpegtools
media-video/ffmpeg
"


src_install(){
	dobin ${FILESDIR}/wtv2mpeg
}
