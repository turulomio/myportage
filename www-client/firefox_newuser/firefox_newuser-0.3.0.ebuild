EAPI=7
DESCRIPTION="Script to launch firefox in a recently created user. It deletes user after closing firefox"
HOMEPAGE="https://github.com/turulomio/${PN}"
SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
www-client/firefox
"

src_install(){
	dobin firefox_newuser
}
