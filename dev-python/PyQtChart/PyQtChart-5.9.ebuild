# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python3_{4,5} )

inherit multibuild python-r1 qmake-utils

DESCRIPTION="Python bindings for the Qt Chart framework"
HOMEPAGE="https://www.riverbankcomputing.com/software/pyqtchart/intro"

MY_P=${PN}_gpl-${PV/_pre/.dev}
if [[ ${PV} == *_pre* ]]; then
	SRC_URI="https://dev.gentoo.org/~pesa/distfiles/${MY_P}.tar.xz"
else
	SRC_URI="mirror://sourceforge/pyqt/${MY_P}.tar.gz"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc64 ~x86"

IUSE=""

REQUIRED_USE="
	${PYTHON_REQUIRED_USE}
"

# Minimal supported version of Qt.
QT_PV="5.7.1:5"

RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/sip-4.19:=[${PYTHON_USEDEP}]
	>=dev-qt/qtcharts-${QT_PV}
"
DEPEND="${RDEPEND}
"

S=${WORKDIR}/${MY_P}

DOCS=( "${S}"/{ChangeLog,NEWS} )

src_configure() {
	configuration() {
		local myconf=(
			"${PYTHON}"
			"configure.py"
			--verbose
			--qtchart-version="${PV}"
			--qmake="$(qt5_get_bindir)"/qmake
			--destdir="$(python_get_sitedir)/PyQt5"
		)
		echo QT_SELECT="qt5" "${myconf[@]}"
		"${myconf[@]}" || die
	}
	python_copy_sources
	python_foreach_impl run_in_build_dir configuration
}

src_compile() {
	python_foreach_impl run_in_build_dir default
}

src_install() {
	installation() {
		local tmp_root=${D%/}/tmp
		emake INSTALL_ROOT="${tmp_root}" install

		local bin_dir=${tmp_root}${EPREFIX}/usr/bin
		local exe

		local uic_dir=${tmp_root}$(python_get_sitedir)/${PN}/uic

		multibuild_merge_root "${tmp_root}" "${D}"
		python_optimize
	}
	python_foreach_impl run_in_build_dir installation
	einstalldocs
}
