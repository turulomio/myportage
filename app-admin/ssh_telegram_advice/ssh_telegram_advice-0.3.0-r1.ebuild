EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..15} pypy3 )
inherit distutils-r1 pypi

DESCRIPTION="Logs in telegram ssh logins"
HOMEPAGE="https://github.com/turulomio/ssh_telegram_advice/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/colorama
"
DEPEND="${RDEPEND}"

src_install() {
	distutils-r1_src_install

	doinitd init.d/ssh_telegram_advice
	insinto /etc/ssh_telegram_advice
	doins etc/ssh_telegram_advice/ssh_telegram_advice.default
}
