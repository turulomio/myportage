# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Speak system uptime"
HOMEPAGE="https://github.com/turulomio/spoken-uptime"
SRC_URI="https://downloads.sourceforge.net/project/spoken-uptime/spoken-uptime/${PV}/spoken-uptime-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="app-accessibility/espeak-ng"

src_install() {
	emake DESTDIR="${D}" install
}
