# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Nimuh is a game about Andalucía"
HOMEPAGE="https://github.com/turulomio/nimuh"
SRC_URI="https://github.com/turulomio/nimuh/archive/nimuh-${PV}.tar.gz"

S="${WORKDIR}/nimuh-nimuh-${PV}"
LICENSE="CC-BY-SA-3.0"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	media-libs/libsdl
	media-libs/sdl-mixer
	media-libs/sdl-image
	dev-libs/expat
"
DEPEND="${RDEPEND}"
