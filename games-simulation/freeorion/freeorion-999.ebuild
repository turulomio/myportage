# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="https://freeorion.svn.sourceforge.net/svnroot/freeorion/trunk/"

inherit subversion

DESCRIPTION="FreeOrion brings nation building to a galactic scale with its full-featured grand campaign and in-game racial histories, in addition to the classic 4X model of galactic conquest and tactical combat."

HOMEPAGE="http://www.freeorion.org/"

LICENSE="GPL-2"

SLOT="0"

KEYWORDS="~amd64 ~x86"

IUSE="fmod"

DEPEND="dev-util/scons
		dev-libs/log4cpp
		dev-libs/boost
		>=media-gfx/graphviz-2.8
		media-libs/sdl-net
		media-libs/freetype
		media-libs/devil"

RDEPEND="${DEPEND}"

#S="${WORKDIR}/${P}/FreeOrion"

src_compile() {
	cd FreeOrion
	epatch "${FILESDIR}"/freeorion.config.patch || die "epatch failed"
	#epatch "${FILESDIR}"/freeorion-ClientUI.patch || die "epatch failed"
	epatch "${FILESDIR}"/freeorion-Directories.patch || die "epatch failed"
	cd GG
	svn update
	sed "s|'ln -s ' + lib_dir + '/'|'ln -s '|g" -i SConstruct
	scons 
	scons install prefix="${D}/usr" pkgconfigdir="${D}/usr/lib/pkgconfig" || die "install failed"
	cd ..
	if ! use fmod; then
		sed '/# FMOD/,/# GraphViz/d' -i SConstruct
		sed "s:'client/human/HumanClientAppSoundFMOD.cpp',:#:" -i SConscript
		sed "s:HumanClientAppSoundFMOD:HumanClientAppSound:g" -i client/human/chmain.cpp
	fi
	export PKG_CONFIG_PATH="${D}/usr/lib/pkgconfig:${PKG_CONFIG_PATH}"

	scons configure prefix="${D}/usr" datadir="${D}/usr/share/games/freeorion" with_gg="${D}/usr/lib" \
				    bindir="${D}/usr/games/bin" with_gg_libdir="${D}/usr/lib" \
					with_gg_include="${D}/usr/include/GG" pkgconfigdir="${D}/usr/lib/pkgconfig" \
					|| die "configure failed"
	scons -j2 || die "compile failed"
}

src_install() {
	cd FreeOrion
	cd GG
	scons install prefix="${D}/usr" pkgconfigdir="${D}/usr/lib/pkgconfig" || die "install failed"
	cd ..
	echo "FO install"
	scons install prefix="${D}/usr" datadir="${D}/usr/share/games/freeorion" with_gg="${D}/usr/lib" \
				  bindir="${D}/usr/games/bin" with_gg_libdir="${D}/usr/lib" \
				  with_gg_include="${D}/usr/include/GG" pkgconfigdir="${D}/usr/lib/pkgconfig" \
		   		  || die "install failed"

	#is this really necessary?
	for dir in GiGi GiGiSDL; do
		sed "s_${D}_/_g" -i ${D}/usr/lib/pkgconfig/${dir}.pc
	done

}

