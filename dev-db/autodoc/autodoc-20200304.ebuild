EAPI=7

MODULE_AUTHOR=cbbrowne
MODULE_VERSION=1.9
#inherit perl-module

DESCRIPTION="A filename renaming utility based on perl regular expression"

inherit git-r3

HOMEPAGE="https://github.com/astsam/rtl8812au"
EGIT_REPO_URI="https://github.com/cbbrowne/autodoc"


SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""



RDEPEND="
	dev-perl/DBI
	dev-perl/HTML-Template
	dev-perl/TermReadKey
	dev-perl/DBD-Pg
"
DEPEND="${RDEPEND}
"


src_configure() {
    sed -i -e 's/PREFIX = \/usr\/local/PREFIX = \/usr/' Makefile
}

