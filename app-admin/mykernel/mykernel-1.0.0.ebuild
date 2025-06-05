EAPI=8
PYTHON_COMPAT=( python3_{10..13} )

DISTUTILS_USE_PEP517=poetry
inherit distutils-r1
DESCRIPTION="My gentoo kernel compilation script"
LICENSE="GPL-3"

HOMEPAGE="https://github.com/turulomio/${PN}"
SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"
IUSE="dracut"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DISTUTILS_USE_SETUPTOOLS=rdepend
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

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
"
