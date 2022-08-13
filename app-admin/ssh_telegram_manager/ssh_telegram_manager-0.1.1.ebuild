EAPI=8


PYTHON_COMPAT=( python{3_9,3_10,3_11} pypy )
inherit distutils-r1

DESCRIPTION="Telegram bot to launch ssh on demand"
HOMEPAGE="https://github.com/turulomio/ssh_telegram_manager/"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

DEPEND="${RDEPEND}
dev-python/python-telegram-bot
"

RDEPEND="${DEPEND}"


src_install() {
    distutils-r1_src_install

    doinitd ${S}/etc/init.d/ssh_telegram_manager
    insinto /etc/ssh_telegram_manager
    doins ${S}/etc/ssh_telegram_manager/ssh_telegram_manager.default
    
}