
# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit  autotools eutils

V=229

IUSE=""
SRC_URI="http://www.nsrl.nist.gov/RDS/rds_${PV}/RDS_${V}_A.iso
http://www.nsrl.nist.gov/RDS/rds_${PV}/RDS_${V}_B.iso
http://www.nsrl.nist.gov/RDS/rds_${PV}/RDS_${V}_C.iso
http://www.nsrl.nist.gov/RDS/rds_${PV}/RDS_${V}_D.iso"

DESCRIPTION="The National Software Reference Library (NSRL) is designed to collect software from various sources and incorporate file profiles computed from this software into a Reference Data Set (RDS) of information"
HOMEPAGE="http://www.nsrl.nist.gov/"
LICENSE=""

SLOT="0"
KEYWORDS="x86"

DEPEND="
dev-libs/libcdio"

RDEPEND="${DEPEND}"

src_unpack(){
	mkdir -p ${WORKDIR}/A
        mkdir -p ${WORKDIR}/B
        mkdir -p ${WORKDIR}/C
        mkdir -p ${WORKDIR}/D

        elog "Extrayendo A"
	iso-read -i /usr/portage/distfiles/RDS_${V}_A.iso -e RDS_${V}_A.ZIP -k -o ${WORKDIR}/RDS_${V}_A.ZIP
	elog "Descomprimiendo A"
	unzip ${WORKDIR}/RDS_${V}_A.ZIP -d ${WORKDIR}/A
	elog "Indexando A"
	hfind -i nsrl-md5 ${WORKDIR}/A/NSRLFile.txt 

        elog "Extrayendo B"
        iso-read -i /usr/portage/distfiles/RDS_${V}_B.iso -e RDS_${V}_B.ZIP -k -o ${WORKDIR}/RDS_${V}_B.ZIP
        elog "Descomprimiendo B"
        unzip ${WORKDIR}/RDS_${V}_B.ZIP -d ${WORKDIR}/B
        elog "Indexando B"
        hfind -i nsrl-md5 ${WORKDIR}/B/NSRLFile.txt

        elog "Extrayendo C"
        iso-read -i /usr/portage/distfiles/RDS_${V}_C.iso -e RDS_${V}_C.ZIP -k -o ${WORKDIR}/RDS_${V}_C.ZIP
        elog "Descomprimiendo C"
        unzip ${WORKDIR}/RDS_${V}_C.ZIP -d ${WORKDIR}/C
        elog "Indexando C"
        hfind -i nsrl-md5 ${WORKDIR}/C/NSRLFile.txt

        elog "Extrayendo D"
        iso-read -i /usr/portage/distfiles/RDS_${V}_D.iso -e RDS_${V}_D.ZIP -k -o ${WORKDIR}/RDS_${V}_D.ZIP
        elog "Descomprimiendo D"
        unzip ${WORKDIR}/RDS_${V}_D.ZIP -d ${WORKDIR}/D
        elog "Indexando D"
        hfind -i nsrl-md5 ${WORKDIR}/D/NSRLFile.txt

}

src_install(){
        mkdir -p ${D}/usr/share/nsrl/A/
        mkdir -p ${D}/usr/share/nsrl/B/
        mkdir -p ${D}/usr/share/nsrl/C/
        mkdir -p ${D}/usr/share/nsrl/D/
	cp ${WORKDIR}/A/* ${D}/usr/share/nsrl/A/
        cp ${WORKDIR}/B/* ${D}/usr/share/nsrl/B/
        cp ${WORKDIR}/C/* ${D}/usr/share/nsrl/C/
        cp ${WORKDIR}/D/* ${D}/usr/share/nsrl/D/
}
