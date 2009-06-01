# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Leptonica: An open source C library for efficient image processing and image analysis operations."
HOMEPAGE="http://www.leptonica.com/index.html"
SRC_URI="http://www.leptonica.com/source/${P}.tar.gz"

LICENSE="Leptonica"
SLOT="0"
KEYWORDS="~x86"
IUSE="tiff"

DEPEND="tiff? ( media-libs/tiff )
	sys-libs/zlib
	media-libs/libpng
	media-libs/jpeg
	media-libs/giflib"
RDEPEND="$DEPEND"

src_compile() {
	econf $(use_with tiff libtiff ) || die "econf failed"
	emake || die "econf failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dohtml README.html version-notes.html
}
