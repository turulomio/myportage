# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2 3"

inherit flag-o-matic eutils distutils

DESCRIPTION="Create standalone executables from Python scripts"
HOMEPAGE="http://cx-freeze.sourceforge.net"
SRC_URI="http://downloads.sourceforge.net/cx-freeze/${P}.tar.gz"

LICENSE="PYTHON"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

strip-flags

src_install() {
	distutils_src_install

	if use doc; then
		dohtml -r doc/*
	fi
}


# OLD pkg_postinst FUNCTION - DEFUNCT
#
#    we can't use the default pkg_postinst because we dont want 
#    python_mod_optimize to byte compile initscripts and samples
#    
#    pkg_postinst() {
#    	local pylibdir pymod
#    	if [[ -z "${PYTHON_MODNAME}" ]]; then
#    		for pylibdir in "${ROOT}"/usr/$(get_libdir)/python*; do
#    			if [[ -d "${pylibdir}"/site-packages/${PN} ]]; then
#    				PYTHON_MODNAME=${PN}
#    			fi
#    		done
#    	fi
#    
#    	if has_version ">=dev-lang/python-2.3"; then
#    		for pymod in ${PYTHON_MODNAME}; do
#    			pymoddir=/usr/$(get_libdir)/python${PYTHON}/site-packages/${pymod}
#    			for pymodfile in "${pymoddir}/*.py"; do
#    			    einfo "python_mod_optimize ${pymodfile}"
#    				python_mod_optimize ${pymodfile}
#    			done
#    		done
#    	fi
#    }

# I could not figure out how to call python_mod_optimize for
# multiple versions of Python without absolute paths (which
# are forbidden), leaving out the scripts we do not want to
# compile. Hence we do not compile any bytecode here.
# This is less efficient and should be fixed.
# <florib@arcor.de> 30. Jun 2010

pkg_postinst() {
        ewarn Not compiling bytecode. This should be fixed in the ebuild, but the package should work as expected.
}
