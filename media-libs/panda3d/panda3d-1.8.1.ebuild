# Copyright 2008-2012 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit base eutils python

DESCRIPTION="A 3D game engine and framework for Python and C++."
HOMEPAGE="http://www.panda3d.org"
SRC_URI="http://www.panda3d.org/download/${P}/${P}.tar.gz"

LICENSE="Panda3D"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="artoolkit bullet doc eigen ffmpeg fftw fmod jpeg openal opencv png python ssl tiff truetype zlib"

DEPEND="
	artoolkit? ( media-libs/artoolkit )
	bullet? ( sci-physics/bullet )
	doc? ( dev-python/epydoc )
	eigen? ( dev-cpp/eigen:3 )
	ffmpeg? ( media-video/ffmpeg )
	fftw? ( sci-libs/fftw:2.1 )
	fmod? ( media-libs/fmod )
	jpeg? ( virtual/jpeg )
	openal? ( media-libs/openal )
	opencv? ( media-libs/opencv )
	png? ( media-libs/libpng )
	python? ( dev-lang/python )
	ssl? ( dev-libs/openssl )
	tiff? ( media-libs/tiff )
	truetype? ( media-libs/freetype )
	zlib? ( sys-libs/zlib )
	virtual/opengl"
RDEPEND="${DEPEND}"

PATCHES=(
    "${FILESDIR}/${P}-pkgconfig.patch"
)

use_no() {
	local UWORD="$2"
	if [ -z "${UWORD}" ]; then
		UWORD="$1"
	fi

	if use $1 ; then
		echo "--use-${UWORD}"
	else
		echo "--no-${UWORD}"
	fi
}

src_compile() {
	./makepanda/makepanda.py \
		$(use_no artoolkit) \
		$(use_no bullet) \
		$(use_no eigen) \
		$(use_no ffmpeg) \
		$(use_no fftw) \
		$(use_no fmod) \
		$(use_no jpeg) \
		$(use_no png) \
		$(use_no openal) \
		$(use_no opencv) \
		$(use_no python) \
		$(use_no ssl openssl) \
		$(use_no tiff) \
		$(use_no truetype freetype) \
		$(use_no zlib) \
		--no-fcollada \
		--no-gles \
		--no-gles2 \
		--no-osmesa \
		--no-ode \
		--no-rocket \
		--no-squish \
		--no-vrpn \
		|| die "build failed"
}

src_install() {
	local DEST=/opt/${PN}

	into ${DEST}
	dobin "${S}"/built/bin/*
	dolib.a "${S}"/built/lib/*.a
	dolib.so "${S}"/built/lib/*.so
	cp "${S}"/built/lib/*.so.* "${D}"/"${DEST}"/$(get_libdir)
	cp -R "${S}"/built/include "${D}"/"${DEST}"/include
	cp -R "${S}"/built/etc "${D}"/"${DEST}"/etc
	cp -R "${S}"/built/models "${D}"/"${DEST}"/models
	cp -R "${S}"/built/pandac "${D}"/"${DEST}"/pandac
	cp -R "${S}"/built/plugins "${D}"/"${DEST}"/plugins
	cp -R "${S}"/direct/src "${D}"/"${DEST}"/direct

	if use doc; then
		cp -R "${S}"/samples "${D}"/"${DEST}"/samples
		cp -R "${S}"/direct/src "${D}"/"${DEST}"/direct/src
	fi

	if use python ; then
		# python installation
		dodir $(python_get_sitedir)
		cat <<- EOF > "${D}"$(python_get_sitedir)/panda3d.pth
		# This document sets up paths for python to access the
		# panda3d modules
		${DEST}
		${DEST}/lib
		${DEST}/direct
		${DEST}/pandac
		${DEST}/built
		${DEST}/built/$(get_libdir)
		EOF
	fi

	doenvd "${FILESDIR}"/50panda3d
	sed -i -e "s:lib:$(get_libdir):g" \
		"${D}"/etc/env.d/50panda3d \
		|| die "libdir patching failed"
}

pkg_postinst()
{
	elog "Panda3D is installed in /opt/panda3d"
	elog
	if use doc ; then
		elog "Documentation is installed in /opt/panda3d/doc"
		elog "Samples are installed in /opt/panda3d/samples"
	fi
	elog "For C++ compiling, include directory must be set:"
	elog "g++ -I/opt/panda3d/include [other flags]"
	elog
	elog "Tutorials available at http://panda3d.org"
}
