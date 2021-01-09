EAPI=7
PYTHON_COMPAT=( python3_{7,8,9} )

inherit multibuild python-r1 qmake-utils

DESCRIPTION="Python bindings for the Qt Chart framework"
HOMEPAGE="https://www.riverbankcomputing.com/software/pyqtchart/intro"

MY_P=${PN}_gpl-${PV/_pre/.dev}
SRC_URI="https://files.pythonhosted.org/packages/23/63/e6b6720be83f3d9a6a547e6de550822bfe3003bfbe0d6ece265bf65887ad/PyQtChart-5.15.2.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc64 ~x86"

IUSE=""

RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/sip-4.19:=[${PYTHON_USEDEP}]
	>=dev-qt/qtcharts-5.11:5
"
DEPEND="${RDEPEND}
	dev-python/PyQt5
"

#S=${WORKDIR}/${MY_P}

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
