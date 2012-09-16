# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils

DESCRIPTION="Midi Sheet Music is a free program that plays MIDI music files while highlighting the piano notes and sheet music notes"
HOMEPAGE="http://midisheetmusic.sourceforge.net"
SRC_URI="mirror://sourceforge/project/midisheetmusic/midisheetmusic/${PV}/MidiSheetMusic-${PV}-linux-src.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
dev-lang/mono
media-sound/timidity++
"
RDEPEND=${DEPEND}

S=${WORKDIR}/MidiSheetMusic-${PV}-linux-src/

src_compile() {

	./build.sh
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	prepgamesdirs
}

