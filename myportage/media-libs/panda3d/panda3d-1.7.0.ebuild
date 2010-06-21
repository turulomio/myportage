# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/panda3d/panda3d-1.5.2.ebuild,v 1.3 2010/05/31 15:12:59 arfrever Exp $

inherit eutils python

DESCRIPTION="A 3D framework in C++ with python bindings"
HOMEPAGE="http://panda3d.org"
SRC_URI="http://panda3d.org/download/${P}/${P}.tar.gz"

LICENSE="Panda3D"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc ffmpeg fftw fmod jpeg openal png python ssl tiff truetype zlib"

DEPEND="doc? ( dev-python/epydoc )
		ffmpeg? ( media-video/ffmpeg )
		fftw? ( sci-libs/fftw )
		fmod? ( =media-libs/fmod-3* )
		jpeg? ( media-libs/jpeg )
		openal? ( media-libs/openal )
		png? ( media-libs/libpng )
		python? ( dev-lang/python )
		ssl? ( dev-libs/openssl )
		tiff? ( media-libs/tiff )
		truetype? ( media-libs/freetype )
		zlib? ( sys-libs/zlib )
		virtual/opengl"

use_no() {
	local UWORD="$2"
	if [ -z "${UWORD}" ]; then
		UWORD="$1"
	fi

	if useq $1 ; then
		echo "--use-${UWORD}"
	else
		echo "--no-${UWORD}"
	fi
}


src_compile() {
	./makepanda/makepanda.py \
		$(use_no ffmpeg) \
		$(use_no fftw) \
		$(use_no fmod) \
		$(use_no jpeg) \
		$(use_no png) \
		$(use_no openal) \
		$(use_no python) \
		$(use_no ssl openssl) \
		$(use_no tiff) \
		$(use_no truetype freetype) \
		$(use_no zlib) \
		|| die "build failed"
}

src_install() {
	python makepanda/installpanda.py --destdir=${D}
}

