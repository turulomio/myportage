EAPI=8
PYTHON_COMPAT=( python3_{11..15} )
DISTUTILS_USE_PEP517="poetry"
inherit distutils-r1

DESCRIPTION="My gentoo kernel compilation script"
HOMEPAGE="https://github.com/turulomio/mykernel"
SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dracut"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
app-arch/cpio
dev-util/ccache
sys-fs/cryptsetup
sys-fs/e2fsprogs
sys-apps/iucode_tool
sys-apps/util-linux
sys-firmware/intel-microcode
dracut? ( sys-kernel/dracut )
sys-kernel/linux-firmware
dev-python/poetry-core
dev-python/pydicts
sys-kernel/installkernel[grub]
dev-python/configparser_rb
sys-power/cpupower
"
