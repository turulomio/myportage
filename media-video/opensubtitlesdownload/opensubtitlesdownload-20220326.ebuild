# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

COMMIT="e517bd0de9cbc93d43169903c4f117533c388d79"

PYTHON_COMPAT=( python3_{11..15} )
inherit python-single-r1

DESCRIPTION="Automatically find and download the right subtitles for your favorite videos!"
HOMEPAGE="https://emeric.io/OpenSubtitlesDownload"
SRC_URI="https://github.com/emericg/OpenSubtitlesDownload/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/OpenSubtitlesDownload-${COMMIT}"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="${RDEPEND}"

src_install() {
	newbin OpenSubtitlesDownload.py opensubtitlesdownload
}
