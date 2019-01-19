EAPI=6
inherit cmake-utils
DESCRIPTION="Nimuh is a game about Andalucía"
HOMEPAGE="https://github.com/turulomio/nimuh"
SRC_URI="https://github.com/turulomio/nimuh/archive/nimuh-${PV}.tar.gz"

LICENSE="Creative commons"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="media-libs/libsdl
	 media-libs/sdl-mixer
	 media-libs/sdl-image
	 dev-libs/expat
	"
DEPEND="${RDEPEND}"
S=${WORKDIR}/nimuh-nimuh-${PV}/
