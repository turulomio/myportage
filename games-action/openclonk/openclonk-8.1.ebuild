# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit cmake-utils gnome2-utils python-any-r1 xdg-utils toolchain-funcs

MY_P=${PN}-release-${PV}-src

DESCRIPTION="A free multiplayer action game where you control clonks"
HOMEPAGE="http://openclonk.org/"
SRC_URI="https://www.openclonk.org/builds/release/${PV}/openclonk-${PV}-src.tar.bz2"
#EGIT_REPO_URI="/home/julius/coding/openclonk"
#EGIT_COMMIT="85d9c2c410395e63a0915b7ff2d550d67e666720"

LICENSE="BSD ISC CLONK-trademark LGPL-2.1 POSTGRESQL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="client server editor doc"
REQUIRED_USE="
	|| ( client server )
	editor? ( client )
"

RDEPEND="
	dev-libs/tinyxml
	net-libs/libupnp:*
	media-libs/libpng:0=
	virtual/jpeg:0=
	sys-libs/zlib
	sys-libs/libunwind
	client? (
		dev-libs/glib:2
		media-libs/freealut
		media-libs/freetype:2
		media-libs/glew:*
		media-libs/libsdl2[X,opengl,sound,video]
		media-libs/libvorbis
		media-libs/openal
		media-libs/sdl2-mixer[mp3,vorbis,wav]
		virtual/opengl
		virtual/glu
		x11-libs/gdk-pixbuf
		x11-libs/gtk+:3
		x11-libs/libXrandr
		x11-libs/libX11
	)
	editor? (
		dev-qt/qtcore:*
		dev-qt/qtgui:*
		dev-qt/qtwidgets
	)
	server? ( sys-libs/readline:0= )"
DEPEND="${RDEPEND}
	|| ( >=sys-devel/gcc-4.9 >=sys-devel/clang-3.3 )
	virtual/pkgconfig
	doc? (
		${PYTHON_DEPS}
		dev-libs/libxml2[python]
		sys-devel/gettext
	)"

PATCHES=(
	"${FILESDIR}"/openclonk-8.0-paths.patch
)

pkg_pretend() {
	tc-is-gcc && if [[ $(gcc-version) < 4.9 ]] ; then
		die 'The active compiler needs to be gcc 4.9 (or newer) or clang'
	else
		einfo 'The active compiler should be ok'
	fi
}

pkg_setup() {
	use doc && python-any-r1_pkg_setup
}

S=${WORKDIR}/${MY_P}
src_unpack() {
	ls
	pwd
	default
	ls
}

src_prepare() {
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		$(usex client "" "-DHEADLESS_ONLY=ON")
		-DWITH_AUTOMATIC_UPDATE=OFF
		-DINSTALL_GAMES_BINDIR=/usr/bin
		-DINSTALL_DATADIR=/usr/share
		-DUSE_STATIC_BOOST=OFF
		-DUSE_SYSTEM_TINYXML=ON
		$(usex editor "" "-DQt5Widgets_FOUND=No") # sadly, there is no proper flag to configure this
	)

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile c4group c4script $(usex client openclonk '') $(usex server openclonk-server '')
	use doc && emake -C docs
}

src_install() {
	cmake-utils_src_install

	if use client; then
		mv "${ED%/}/usr/bin/"{openclonk,clonk} || die
		newbin "${FILESDIR}"/${PN}-wrapper-script.sh ${PN}
	fi
	if use server; then
		dobin "${BUILD_DIR}/openclonk-server"
	fi
	use doc && dohtml -r docs/online/*
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
}
