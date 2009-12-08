inherit subversion autotools eutils

DESCRIPTION="Scripts de acceso a mis teléfonos móviles"
HOMEPAGE="https://xulpymoney.svn.sourceforge.net/svnroot/xulpymoney/myphone"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

ESVN_REPO_URI="https://xulpymoney.svn.sourceforge.net/svnroot/xulpymoney/myphone"

DEPEND=""
RDEPEND=${DEPEND}

src_install () {
	dosbin myphone
	dosbin uploadfile
}
