# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit xdg-utils
DESCRIPTION="Python IDE"
HOMEPAGE="https://eric-ide.python-projects.org/"
SRC_URI="${SRC_URI} amd64? (
	https://downloads.sourceforge.net/project/eric-ide/${PN}/stable/${PV}/${P}.tar.gz
)"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
>=dev-python/qscintilla-python-2.10.8
dev-python/EditorConfig
dev-python/asttokens
"
DEPEND=""

src_unpack(){
	if [ ${A} != "" ]; then
		unpack ${A}
	fi
}

src_install() {
	# run eric installer,
	# -x skips dependency checks to prevent pop up questions
	# -i add prefix to installation
	# -b where binaries are installed
	python3 install.py -x -i "${D}" -b /usr/bin
}

pkg_postinst() {
	einfo "Make system aware of new desktop files"
	xdg_desktop_database_update
	einfo "For additional features start eric and go to Settings -> Show external Tools"
}

pkg_postrm() {
	einfo "Make system aware of removed desktop files"
	xdg_desktop_database_update
}
