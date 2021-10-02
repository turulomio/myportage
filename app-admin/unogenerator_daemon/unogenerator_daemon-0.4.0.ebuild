EAPI=7

DESCRIPTION="Daemon to launch unogenerator daemon used with unogenerator module"
HOMEPAGE="https://github.com/turulomio/unogenerator/"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${RDEPEND}
dev-python/unogenerator
"

RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
    newinitd ${FILESDIR}/unogenerator.initd unogenerator
    newconfd ${FILESDIR}/unogenerator.conf unogenerator
}