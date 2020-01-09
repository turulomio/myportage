EAPI=7
DESCRIPTION="Script to launch firefox in a recently created user. It deletes user after closing firefox"
LICENSE="GPL-3"

HOMEPAGE="https://github.com/turulomio/${PN}firefox_newuser"
SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
#S=${WORKDIR}/googlefinance.client-${PV}/
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""


SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="
www-client/firefox
"

src_install(){
	dobin firefox_newuser
}
