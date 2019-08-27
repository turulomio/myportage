EAPI=7

inherit cargo eutils

#Must be before SRC_URI
CRATES="
atty-0.2.13
base64-0.10.1
bitflags-1.1.0
byteorder-1.3.2
clap-2.33.0
html5ever-0.24.0
indicatif-0.11.0
lazy_static-1.3.0
regex-1.2.1
reqwest-0.9.20
strsim-0.8
url-2.1.0
"

DESCRIPTION="Save HTML pages with ease"
HOMEPAGE="https://github.com/Y2Z/monolith"

SRC_URI="$(cargo_crate_uris ${CRATES})
 https://github.com/Y2Z/monolith/archive/master.zip
"


#LICENSE="UNLICENSE"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=virtual/rust-1.31.0"


#QA_FLAGS_IGNORED="/usr/bin/fblog"

S=${WORKDIR}/monolith-master/

src_install() {
	cargo install --path=${S}
	einstalldocs
}
