DESCRIPTION="Converts msg outook to eml ascii mail"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="dev-perl/Email-Outlook-Message"
RDEPEND=${DEPEND}

src_install () {
	dobin ${FILESDIR}/msg2eml
	dobin ${FILESDIR}/msgconvert.pl
}
