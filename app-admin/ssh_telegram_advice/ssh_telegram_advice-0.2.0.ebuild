EAPI=8


PYTHON_COMPAT=( python{3_8,3_9,3_10} pypy )
inherit distutils-r1

DESCRIPTION="Logs in telegram ssh logins "
HOMEPAGE="https://github.com/turulomio/ssh_telegram_advice/"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

DEPEND="${RDEPEND}
"

RDEPEND="${DEPEND}"


src_install() {
    distutils-r1_src_install

    doinitd ${S}/init.d/ssh_telegram_advice
    insinto /etc/ssh_telegram_advice
    doins ${S}/etc/ssh_telegram_advice/ssh_telegram_advice.default
    
}