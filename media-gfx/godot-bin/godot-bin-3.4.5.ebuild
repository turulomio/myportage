EAPI=8

inherit desktop

DESCRIPTION="Godot Engine – Multi-platform 2D and 3D game engine"
HOMEPAGE="https://godotengine.org/"
SRC_URI="
	amd64? ( https://github.com/godotengine/godot/releases/download/${PV}-stable/Godot_v${PV}-stable_x11.64.zip )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~amd64"

RDEPEND=""

S=${WORKDIR}

src_install() {
	insinto "/opt/${PN}/"
	newins "Godot_v${PV}-stable_x11.64" "godot"
	fperms +x "/opt/${PN}/godot"
	dosym "/opt/${PN}/godot" "usr/bin/godot"
	make_desktop_entry godot Godot godot "Development;IDE"
	doicon "${FILESDIR}/godot.png"
}
