inherit subversion autotools eutils

DESCRIPTION="An open-source car navigation system with a routing engine"
HOMEPAGE="http://navit.sourceforge.net"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
DOCS="ChangeLog* README* AUTHORS"

ESVN_REPO_URI="https://navit.svn.sourceforge.net/svnroot/navit/trunk"

DEPEND="
dev-util/cvs
media-libs/freeglut
media-libs/sdl-sound
sci-geosciences/gpsd
app-accessibility/espeak
"
RDEPEND=${DEPEND}

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

        cd ${S}/navit/navit/
        sed -i -e "s:orientation=\"-1\":orientation=\"1\":" navit.xml
        sed -i -e "s:echo 'Fix the speech tag in navit.xml to let navit say\:' '\%s':espeak -ves+1 -w /tmp/navit.wav '\%s'; playsound /tmp/navit.wav:" navit.xml
        cd ${S}/navit
        emake DESTDIR="${D}" install || die "install failed"
        insinto /usr/bin/; dobin "${FILESDIR}/navit-update-spain.sh"
        insinto /usr/bin/; dobin "${FILESDIR}/navit-update-planet.sh"
        dodir /usr/share/navit/maps
        elog "To update spanish map, run"
        elog "# navit-update-spain.sh"
        elog "To update planet map, run"
        elog "# navit-update-planet.sh"
}
