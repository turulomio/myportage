EAPI=6

inherit cmake-utils

DESCRIPTION="Free/Libre Action Roleplaying game"
HOMEPAGE="https://github.com/flareteam/flare-game"
SRC_URI="https://github.com/flareteam/flare-engine/archive/v${PV}.tar.gz -> flare-engine-${PV}.tar.gz"

LICENSE="CC-BY-SA-3.0 GPL-3 OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	media-libs/libsdl2[X,sound,joystick,video]
	media-libs/sdl2-image[png]
	media-libs/sdl2-mixer[vorbis]
	media-libs/sdl2-ttf"
DEPEND="${RDEPEND}"

#S=${WORKDIR}/flare-engine-${PV}

#src_configure() {
#	local mycmakeargs=(
#		-DBINDIR=/usr/bin
#		-DDATADIR=/usr/share/${PN}
#	)
#	cmake-utils_src_configure
#}

#src_compile() {
#	cmake-utils_src_compile
#}

#src_install() {
#	cmake-utils_src_install
#}

