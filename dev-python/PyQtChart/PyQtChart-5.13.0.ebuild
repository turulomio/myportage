# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python3_{5,6,7} )

inherit multibuild python-r1 qmake-utils

DESCRIPTION="Python bindings for the Qt Chart framework"
HOMEPAGE="https://www.riverbankcomputing.com/software/pyqtchart/intro"

MY_P=${PN}_gpl-${PV/_pre/.dev}
SRC_URI="https://www.riverbankcomputing.com/static/Downloads/PyQtChart/${PV}/PyQtChart_gpl-${PV}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc64 ~x86"

IUSE=""

REQUIRED_USE="
	${PYTHON_REQUIRED_USE}
"

RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/sip-4.19:=[${PYTHON_USEDEP}]
	>=dev-qt/qtcharts-5.11:5
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
			--qmake="$(qt5_get_bindir)"/qmake
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
		sed -i -e 's/install_distinfo/ /' Makefile || die "Sed failed!" ## Removing distinfo 
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
