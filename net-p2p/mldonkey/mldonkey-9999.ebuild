EAPI="6"
WANT_AUTOCONF="2.5"

inherit versionator flag-o-matic eutils autotools toolchain-funcs user git-r3
EGIT_REPO_URI="https://github.com/ygrek/mldonkey" 

DESCRIPTION="Multi-network P2P application written in Ocaml, with Gtk, web & telnet interface"
HOMEPAGE="https://github.com/ygrek/mldonkey"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"

RDEPEND=""

DEPEND="${RDEPEND}
dev-ml/num
dev-lang/ocaml
sys-apps/file
dev-ml/camlp4
"

MLUSER="p2p"

src_configure() {
	econf --sysconfdir=/etc/mldonkey \
		--sharedstatedir=/var/mldonkey \
		--localstatedir=/var/mldonkey \
		--enable-checks \
		--disable-batch
}

src_compile() {
	make
}

src_install() {
	local myext=""
        dobin mlnet

	newconfd "${FILESDIR}/mldonkey.confd-2.8" mldonkey
	fperms 600 /etc/conf.d/mldonkey
	newinitd "${FILESDIR}/mldonkey.initd" mldonkey

	cd "${S}"/distrib
	dodoc ChangeLog *.txt

	insinto /usr/share/doc/${PF}/scripts
	doins kill_mldonkey mldonkey_command mldonkey_previewer make_buginfo

	cd "${S}"/docs
	dodoc *.txt *.tex *.pdf
	dohtml *.html

	cd "${S}"/docs/developers
	dodoc *.txt *.tex

	cd "${S}"/docs/images
	insinto /usr/share/doc/${PF}/html/images
	doins *
}

pkg_preinst() {
	enewuser ${MLUSER} -1 -1 /home/p2p users
}
