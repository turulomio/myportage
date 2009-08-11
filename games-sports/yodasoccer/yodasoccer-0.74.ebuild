# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

MYPN="yodda_soccer"
MYPV="074"

DESCRIPTION="3D stunt racing game which features realistic car physics and an in game track editor"
HOMEPAGE="http://tileracer.model-view.com"
SRC_URI="mirror://sourceforge/yodasoccer/${PV}/${MYPN}_${MYPV}_lin.tar.gz"

LICENSE="blob"
SLOT="0"
KEYWORDS="~x86"

S=${WORKDIR}/${MY_PN}${PV}

#src_unpack() {
#	unpack ${A}
#	cd ${S}
#	mv ${MY_PN}128.png ${PN}128.png
#	mv ${MY_PN}.sh ${PN}.sh
#}

#src_compile() {
#	einfo "Nothing to do in here"
#}

src_install() {
	dir=${GAMES_PREFIX_OPT}/${PN}

	exeinto "${dir}"
	doexe *.sh

	exeinto "${dir}"/release_linux
	doexe release_linux/${MY_PN} #release_linux/${MY_PN}Low

	rm release_linux/${MY_PN} #release_linux/${MY_PN}Low

	insinto "${dir}"
	doins -r lib_linux media release_linux || die "doins failed"
	doins ${PN}128.png

	games_make_wrapper ${PN} "${dir}/${PN}.sh"
	make_desktop_entry ${PN} "Tile Racer" ${PN}128

#	games_make_wrapper ${PN}low "${dir}/${PN}Low.sh"
#	make_desktop_entry ${PN}low "Tile Racer - Low" ${PN}128

	prepgamesdirs
}
