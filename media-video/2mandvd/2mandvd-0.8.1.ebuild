# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils qt4

DESCRIPTION="DVD app"
HOMEPAGE="http://2mandvd.tuxfamily.org/"
SRC_URI="http://download.tuxfamily.org/2mandvd/2ManDVD-0.8.1.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="
media-video/ffmpegthumbnailer
"
RDEPEND=${DEPEND}

S=${WORKDIR}/2ManDVD

src_configure(){
	qmake 2ManDVD.pro
}

src_install() {
	
        newbin 2ManDVD 2mandvd|| die "dobin failed"

        newicon Interface/mandvdico.png ${PN}.png
        make_desktop_entry ${PN} ${PN} ${PN}.png "AudioVideo;QT"

        insinto "/usr/share/2mandvd"
        doins -r *.qm || die "doins failed"



#	make_desktop_entry ${PN} Kartofel


#	prepgamesdirs
}
