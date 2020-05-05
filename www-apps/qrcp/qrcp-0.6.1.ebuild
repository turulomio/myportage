EAPI=7


KEYWORDS="amd64 arm arm64 x86"
SRC_URI="https://github.com/claudiodangelis/qrcp/archive/${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="Transfer files over wifi from your computer to your mobile device by scanning a QR code without leaving the terminal"
HOMEPAGE="https://github.com/claudiodangelis/qrcp/"
LICENSE="MIT"
SLOT="0"
IUSE=""
DEPEND="dev-lang/go"
RDEPEND="${DEPEND}"

src_unpack(){
    unpack ${P}.tar.gz
    elog "To use this ebuild to need: FEATURES=-network-sandbox emerge -v qrcp"
    elog "This ebuild is not a good one, but it works"
    go get
}

src_compile(){
    go build
}


src_install(){
    dobin qrcp
}
