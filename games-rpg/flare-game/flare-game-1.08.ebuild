EAPI=6

inherit cmake-utils

DESCRIPTION="Free/Libre Action Roleplaying game"
HOMEPAGE="https://github.com/flareteam/flare-game"
SRC_URI="https://github.com/flareteam/flare-game/archive/v${PV}.tar.gz -> flare-game-${PV}.tar.gz"

LICENSE="CC-BY-SA-3.0 GPL-2 GPL-3 OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="=games-engines/flare-engine-${PV}"

