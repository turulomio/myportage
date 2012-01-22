# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

if [[ ${PV} = 9999* ]]; then
	GIT_ECLASS="git-2"
	EGIT_REPO_URI="git://github.com/spring/spring.git"
	EGIT_BRANCH="develop"
else
	SRC_URI="mirror://sourceforge/springrts/${PN}_${PV}_src.tar.lzma"
	KEYWORDS="~amd64 ~x86"
fi

inherit games cmake-utils eutils fdo-mime flag-o-matic games ${GIT_ECLASS}

DESCRIPTION="A 3D multiplayer real-time strategy game engine"
HOMEPAGE="http://springrts.com"
S="${WORKDIR}/${PN}_${PV}"

LICENSE="GPL-2"
SLOT="0"
IUSE="+ai +java +default multithreaded headless dedicated test-ai debug custom-cflags openmp -lto -lto_whopr test"
RESTRICT="nomirror strip"

GUI_DEPEND="
	media-libs/devil[jpeg,png,opengl]
	>=media-libs/freetype-2.0.0
	>=media-libs/glew-1.4
	>=media-libs/libsdl-1.2.0[X,opengl]
	media-libs/openal
	virtual/glu
	virtual/opengl
"

RDEPEND="
	>=dev-libs/boost-1.35
	>=sys-libs/zlib-1.2.5.1[minizip]
	media-libs/devil[jpeg,png]
	java? ( virtual/jdk )
	default? ( ${GUI_DEPEND} )
	multithreaded? ( ${GUI_DEPEND} )
"

DEPEND="${RDEPEND}
	>=sys-devel/gcc-4.2
	app-arch/p7zip
	>=dev-util/cmake-2.6.0
	openmp? ( sys-devel/gcc[openmp] )
	lto? ( sys-devel/gcc[lto] )
"

### where to place content files which change each spring release (as opposed to mods, ota-content which go somewhere else)
VERSION_DATADIR="${GAMES_DATADIR}/${PN}"


src_test() {
	cmake-utils_src_test
}


src_configure() {

	# Custom cflags may break online play
	if ! use custom-cflags ; then
		strip-flags
	else
		mycmakeargs="${mycmakeargs} -DMARCH_FLAG=$(get-flag march)"
	fi

	# OpenMP (may break online play & reduced performance on single core)
	mycmakeargs="${mycmakeargs} $(cmake-utils_use openmp OPENMP)"

	# LinkingTimeOptimizations
	mycmakeargs="${mycmakeargs} $(cmake-utils_use lto LTO)"
	mycmakeargs="${mycmakeargs} $(cmake-utils_use lto_whopr LTO_WHOPR)"
	if use lto || use lto_whopr ; then
		ewarn "\e[1;31m*********************************************************************\e[0m"
		ewarn "You enabled LinkingTimeOptimizations! ('lto' USE flag)"
		ewarn "It's likely that the compilation fails and/or online play may break."
		ewarn "If so, disable it before doing a bugreport."
		ewarn "\e[1;31m*********************************************************************\e[0m"
	fi

	# AI
	if use ai ; then
		# Several AI are found in submodules
		EGIT_HAS_SUBMODULES="true"

		if use !java ; then
			# Don't build Java AI
			mycmakeargs="${mycmakeargs} -DAI_TYPES=NATIVE"
		fi

		if use !test-ai ; then
			# Don't build example AIs
			mycmakeargs="${mycmakeargs} -DAI_EXCLUDE_REGEX=\"Null|Test\""
		fi
	else
		mycmakeargs="${mycmakeargs} -DAI_TYPES=NONE"
	fi

	# Selectivly enable/disable build targets
	for build_type in default multithreaded headless dedicated
	do
		mycmakeargs="${mycmakeargs} $(cmake-utils_use ${build_type} BUILD_spring-${build_type})"
	done

	# Set common dirs
	LIBDIR="$(games_get_libdir)"
	mycmakeargs="${mycmakeargs} -DCMAKE_INSTALL_PREFIX=/usr -DBINDIR=${GAMES_BINDIR#/usr/} -DLIBDIR=${LIBDIR#/usr/} -DDATADIR=${VERSION_DATADIR#/usr/}"

	# Enable/Disable debug symbols
	if use debug ; then
		CMAKE_BUILD_TYPE="RELWITHDEBINFO"
	else
		CMAKE_BUILD_TYPE="RELEASE"
	fi

	# Configure
	cmake-utils_src_configure
}

src_compile () {
	cmake-utils_src_compile
}

src_install () {
	cmake-utils_src_install

	prepgamesdirs

	if use custom-cflags ; then
		ewarn "You decided to use custom CFLAGS. This may be safe, or it may cause your computer to desync more or less often. If you experience desyncs, disable it before doing any bugreport. If you don't know what you are doing, *disable custom-cflags*."
	fi
}

pkg_postinst() {
	fdo-mime_mime_database_update
	games_pkg_postinst
}
