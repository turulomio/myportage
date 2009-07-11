# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils cmake-utils

DESCRIPTION="Open-source speech recognition program and replaces the mouse and keyboard."
HOMEPAGE="http://www.simon-listens.org"
SRC_URI="mirror://sourceforge/speech2text/simon-0.2-Source.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND="
media-libs/portaudio
"
RDEPEND=${DEPEND}
S=${WORKDIR}/simon-0.2-Source

