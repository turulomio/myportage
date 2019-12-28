EAPI=7

PYTHON_COMPAT=( python{3_5,3_6,3_7} pypy )
inherit distutils-r1

DESCRIPTION="Rewrite of the popular wireless network auditor, "wifite" "

SRC_URI="https://github.com/derv82/wifite2/archive/${PV}.tar.gz -> wifite2-${PV}.tar.gz"
HOMEPAGE="https://github.com/derv82/wifite2"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
net-wireless/cowpatty
net-wireless/hcxdumptool
net-wireless/hcxtools
net-analyzer/wireshark
net-wireless/pixiewps
net-wireless/aircrack-ng
net-wireless/reaver
net-wireless/pyrit
"

