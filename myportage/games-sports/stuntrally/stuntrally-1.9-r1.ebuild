# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MY_P="StuntRally-${PV}-sources"

inherit cmake-utils eutils games

DESCRIPTION="Rally game focused on closed rally tracks with possible stunt elements (jumps, loops, pipes)."
HOMEPAGE="http://code.google.com/p/vdrift-ogre/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="dedicated +game editor"

S="${WORKDIR}/${MY_P}"

# TODO:
# - check for bundled dependencies(for e.g. libbullet)
# - verify dependencies in RDEPEND(libXcursor is already confirmed)
# - possibly add one more string to REQUIRED_USE to avoid unneeded building with USE="-*"
RDEPEND="game? (
		dev-games/ogre[cg,boost,ois,freeimage,opengl,zip]
		dev-games/mygui
		media-libs/libsdl:0
		media-libs/libvorbis
		media-libs/libogg
		x11-libs/libXcursor
	)
	dev-libs/boost
	net-libs/enet:1.3
	virtual/libstdc++"
DEPEND="${RDEPEND}"

REQUIRED_USE="editor? ( game )"

DOCS=( Readme.txt )
PATCHES=( "${FILESDIR}/${P}-sharedir-absolute-path.patch" )

src_prepare() {
	sed -i -e '/^Categories/s/Application;//' dist/*.desktop || die "sed on desktop files failed"

	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DSHARE_INSTALL="${GAMES_DATADIR}/${PN}"
		$(cmake-utils_use_build dedicated MASTER_SERVER)
		$(cmake-utils_use_build game GAME)
		$(cmake-utils_use_build editor EDITOR)
	)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	insinto "${GAMES_DATADIR}/${PN}"
	doins -r data/*

	rm config/CMakeLists.txt || die
	doins -r config

	dodoc ${DOCS[@]}
	if use dedicated; then
		pushd "${CMAKE_BUILD_DIR}" &>/dev/null || die
		dogamesbin sr-masterserver
		popd &>/dev/null
	fi
	if use editor; then
		pushd "${CMAKE_BUILD_DIR}" &>/dev/null || die
		dogamesbin sr-editor
		popd &>/dev/null
		domenu dist/sr-editor.desktop
		doicon -s 64 dist/sr-editor.png
	fi
	if use game; then
		pushd "${CMAKE_BUILD_DIR}" &>/dev/null || die
		dogamesbin ${PN}
		popd &>/dev/null
		domenu dist/${PN}.desktop
		doicon -s 64 dist/${PN}.png
	fi

	prepgamesdirs
}
