EAPI=7
DESCRIPTION="My emerge sync procedure"
LICENSE="GPL-3"

HOMEPAGE="https://github.com/turulomio/${PN}"
SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"
IUSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="
"

src_install(){
	dobin emerge.sync
	dobin emerge.sync.rebuildsystem
}
