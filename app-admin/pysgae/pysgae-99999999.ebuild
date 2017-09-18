inherit subversion autotools eutils

DESCRIPTION="PySGAE"
HOMEPAGE="https://pysgae.com"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

ESVN_REPO_URI="svn://10.52.188.177/PySGAE"
ESVN_USER="guest"
ESVN_PASSWORD="guested"

DEPEND="
app-misc/rlwrap
dev-python/psutil
dev-python/cx-oracle
dev-python/openpyxl
dev-python/odfpy
"
RDEPEND=${DEPEND}

src_compile() {
	einfo "Nothing to compile"
}

src_install () {
	make DESTDIR="${D}/"|| die "Intall failed"
}
