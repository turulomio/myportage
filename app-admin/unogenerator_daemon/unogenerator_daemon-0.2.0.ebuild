EAPI=7


DESCRIPTION="Daemon to launch unogenerator daemon used with unogenerator module"

SRC_URI="https://github.com/turulomio/unogenerator/archive/${PV}.tar.gz -> unogenerator-${PV}.tar.gz"
HOMEPAGE="https://github.com/turulomio/${PN}"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${RDEPEND}
app-office/libreoffice
"

S="${WORKDIR}/unogenerator-${PV}/"

RDEPEND="${DEPEND}"
src_install() {
    einfo ${HOME}
    doinitd ${S}/init.d/unogenerator
}