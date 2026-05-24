# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..15} )
inherit python-single-r1

DESCRIPTION="Makes a webcam snapshot from console"
HOMEPAGE="https://github.com/turulomio/webcam-snapshot"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/pygame[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"

src_install() {
	dobin "${FILESDIR}"/webcam-snapshot
}
