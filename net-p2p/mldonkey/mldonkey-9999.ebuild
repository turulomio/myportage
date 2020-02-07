EAPI="6"
WANT_AUTOCONF="2.5"

inherit versionator flag-o-matic eutils autotools toolchain-funcs user git-r3
EGIT_REPO_URI="https://github.com/ygrek/mldonkey" 
   
   

IUSE="bittorrent doc fasttrack gd gnutella magic +ocamlopt upnp"

DESCRIPTION="Multi-network P2P application written in Ocaml, with Gtk, web & telnet interface"
HOMEPAGE="https://github.com/ygrek/mldonkey"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"

RDEPEND="dev-lang/perl
	dev-ml/camlp4:=
	gd? ( >=media-libs/gd-2.0.28[truetype] )
	magic? ( sys-apps/file )
	upnp? ( net-libs/miniupnpc:= net-libs/libnatpmp:= )
"

DEPEND="${RDEPEND}
dev-ml/num
dev-lang/ocaml
"

#RESTRICT="!ocamlopt? ( strip )"

MLUSER="p2p"

pkg_setup() {
	echo ""
	einfo "If the compile with gui fails, and you have updated Ocaml"
	einfo "recently, you may have forgotten that you need to run"
	einfo "/usr/portage/dev-lang/ocaml/files/ocaml-rebuild.sh"
	einfo "to learn which ebuilds you need to recompile"
	einfo "each time you update Ocaml to a different version"
	einfo "see the Ocaml ebuild for details"
	echo ""
}
src_configure() {
	cd "${S}"

	./configure 
	
	echo --sysconfdir=/etc/mldonkey \
		--sharedstatedir=/var/mldonkey \
		--localstatedir=/var/mldonkey \
		--enable-checks \
		--disable-batch \
		$(use_enable bittorrent) \
		$(use_enable fasttrack) \
		$(use_enable gnutella) \
		$(use_enable gnutella gnutella2) \
		$(use_enable gd) \
		$(use_enable magic) \
		$(use_enable upnp upnp-natpmp) \
		--disable-force-upnp-natpmp \
		${myconf}
}

src_compile() {
	make
}

src_install() {
	local myext=""
#	use ocamlopt || myext=".byte"
#	for i in mlnet copysources subconv; do
#		newbin $i$myext $i
#	done
#	use bittorrent && newbin make_torrent$myext make_torrent
        dobin mlnet

	newconfd "${FILESDIR}/mldonkey.confd-2.8" mldonkey
	fperms 600 /etc/conf.d/mldonkey
	newinitd "${FILESDIR}/mldonkey.initd" mldonkey

	if use doc ; then
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
	fi
}

pkg_preinst() {
	enewuser ${MLUSER} -1 -1 /home/p2p users
}

pkg_postinst() {
	echo
	einfo "If you want to start MLDonkey as a system service, use"
	einfo "the /etc/init.d/mldonkey script. To control bandwidth, use"
	einfo "the 'slow' and 'fast' arguments. Be sure to have a look at"
	einfo "/etc/conf.d/mldonkey also."
	echo
}