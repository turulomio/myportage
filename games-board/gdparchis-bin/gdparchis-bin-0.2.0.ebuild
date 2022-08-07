EAPI=8

inherit desktop

DESCRIPTION="Godot parchis "
HOMEPAGE="https://github.com/turulomio/gdparchis/"
SRC_URI="https://github.com/turulomio/gdparchis/releases/download/${PV}/gdparchis-${PV}.Linux_x86_64"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~amd64"

RDEPEND=""

S=${WORKDIR}

src_unpack(){
	cp ${A} ${WORKDIR}
}

src_install() {
	insinto "/opt/gdparchis-bin/"
	newins "gdparchis-${PV}.Linux_x86_64" "gdparchis"
	fperms +x "/opt/gdparchis-bin/gdparchis"
	dosym "/opt/gdparchis-bin/gdparchis" "usr/bin/gdparchis"
	make_desktop_entry gdparchis gdParchis gdparchis "Games;Board"
	doicon "${FILESDIR}/gdparchis.png"
}
