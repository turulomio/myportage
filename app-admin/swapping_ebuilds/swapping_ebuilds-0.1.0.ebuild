EAPI=7
IUSE=""
DESCRIPTION="Detects swapping ebuilds and log them in /var/lib/"
HOMEPAGE=""
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

SRC_URI="https://github.com/turulomio/swapping_ebuilds/archive/${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://github.com/turulomio/swapping_ebuilds/"
LICENSE="GPL-3"

RDEPEND=""
DEPEND="${RDEPEND}
dev-python/humanize
dev-python/psutil
"

src_compile(){
	true
}

src_install(){
        dobin swapping_ebuilds
}
