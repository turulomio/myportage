EAPI=7

COMMIT="62c378292c92378a5f30f7a2c56b484897a80f73"

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
