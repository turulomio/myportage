inherit subversion autotools eutils

DESCRIPTION="An open-source car navigation system with a routing engine"
HOMEPAGE="http://navit.sourceforge.net"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
DOCS="ChangeLog* README* AUTHORS"

ESVN_REPO_URI="https://navit.svn.sourceforge.net/svnroot/navit/trunk"

src_unpack() {
        subversion_src_unpack
        cd ${S}/navit
        ./autogen.sh || die "autogen.sh failed"

}


src_compile() {
        cd ${S}/navit
        econf --disable-samplemap || die "configure failed"
        emake || die "make failed"
}

src_install () {
        cd ${S}/navit
        emake DESTDIR="${D}" install || die "install failed"
        insinto /usr/bin/; dobin "${FILESDIR}/navit-update-spain.sh"
        insinto /usr/bin/; dobin "${FILESDIR}/navit-update-planet.sh"
        elog "To update spanish map, run"
        elog "# navit-update-spain.sh"
        elog "To update planet map, run"
        elog "# navit-update-planet.sh"
}
