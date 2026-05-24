# Copyright 2025 Your Name
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A CLI tool to record awesome terminal GIFs"
HOMEPAGE="https://github.com/charmbracelet/vhs"
SRC_URI="https://github.com/charmbracelet/vhs/releases/download/v${PV}/vhs_${PV}_Linux_x86_64.tar.gz"
S="${WORKDIR}/vhs_${PV}_Linux_x86_64"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="www-apps/ttyd"

src_install() {
	dobin vhs
}
