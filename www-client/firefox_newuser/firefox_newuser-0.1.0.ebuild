EUSE="7"
DESCRIPTION="Script to launch firefox in a recently created user. It deletes user after closing firefox"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="
www-client/firefox
"

src_install(){
	dobin ${FILESDIR}/firefox_newuser
}
