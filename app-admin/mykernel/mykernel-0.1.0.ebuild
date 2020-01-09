EAPI=7
DESCRIPTION="My kernel scripts to compile it "
LICENSE="GPL-3"

HOMEPAGE="https://github.com/turulomio/${PN}"
SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
sys-boot/grub
sys-fs/cryptsetup
app-arch/cpio
"
src_install(){
	dobin mykernel.initramfs
	dodoc mykernel.compile.example
}
