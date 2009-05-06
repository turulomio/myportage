inherit subversion autotools eutils

DESCRIPTION="Forensics App"
HOMEPAGE="http://sine.sourceforge.net"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
DEPEND="
app-arch/p7zip
app-crypt/ophcrack
app-forensics/bkhive
app-forensics/lnk-parse
app-forensics/pasco
app-forensics/sleuthkit
dev-python/configobj
"

RDEPEND=${DEPEND}
S=${WORKDIR}/QtsineDES

ESVN_REPO_URI="svn://172.26.0.2/Qtsine/QtsineDES"

src_unpack() {
        subversion_src_unpack
}

src_compile (){
	return
}

src_install () {
PREFIX=/usr/local
dodir ${PREFIX}/bin/images
dodir ${PREFIX}/lib/sine/QT/images
dodir ${PREFIX}/lib/sine/.web/images
dodir ${PREFIX}/lib/sine/java
dodir ${PREFIX}/lib/sine/python

insinto ${PREFIX}/bin
dobin sine
doins sine*
doins offline/*
doins INTERFAZ_QT/ifz_*.py

insinto ${PREFIX}/lib/sine/python
doins lib*
doins sine*.py
doins mbox2eml.py
doins mailbox_reader.py
doins to*
doins dbxread.py

insinto ${PREFIX}/lib/sine
doins INTERFAZ_QT/sine.conf
doins INTERFAZ_QT/mainsine.conf

insinto ${PREFIX}/lib/sine/QT/images
doins INTERFAZ_QT/images/*

insinto  ${PREFIX}/lib/sine/.web/
doins WEB/style.*

insinto  ${PREFIX}/lib/sine/.web/
doins WEB/images/*
}

