EAPI=7

COMMIT="e517bd0de9cbc93d43169903c4f117533c388d79"

DESCRIPTION="Automatically find and download the right subtitles for your favorite videos!"
HOMEPAGE="https://emeric.io/OpenSubtitlesDownload"

SRC_URI="https://github.com/emericg/OpenSubtitlesDownload/archive/$COMMIT.zip -> ${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}/OpenSubtitlesDownload-$COMMIT

src_install() {
	einfo $COMMIT
	newbin OpenSubtitlesDownload.py opensubtitlesdownload
}
