EAPI=7

EGO_PN="github.com/claudiodangelis/qrcp/cmd"

KEYWORDS="amd64 arm arm64 x86"
SRC_URI="https://${EGO_PN}/qrcp/archive/${PV}.tar.gz -> ${P}.tar.gz"
inherit golang-build

DESCRIPTION="Transfer files over wifi from your computer to your mobile device by scanning a QR code without leaving the terminal"
HOMEPAGE="https://github.com/claudiodangelis/qrcp/"
LICENSE="MIT"
SLOT="0"
IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"
