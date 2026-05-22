# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module systemd

DESCRIPTION="Full-featured and highly configurable SFTP server with optional HTTP/S, FTP/S and WebDAV support"
HOMEPAGE="https://github.com/drakkan/sftpgo"

# We use github's release archive, but we also need to leverage go-module eclass
# to automatically resolve and pull Go dependencies during the fetch phase.
SRC_URI="https://github.com/drakkan/sftpgo/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
https://github.com/turulomio/myportage/blob/master/distfiles/sftpgo-2.7.1.tar.gz -> sftpgo-deps-${PV}.tar.gz"

LICENSE="AGPL-3.0 Apache-2.0 BSD-2-Clause BSD-3-Clause MIT MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# Dependencies
BDEPEND=">=dev-lang/go-1.22" # SFTPGo 2.7+ generally requires modern Go
RDEPEND="acct-user/sftpgo
    acct-group/sftpgo"

# This directory will hold the Go workspace
S="${WORKDIR}/${P}"

src_unpack() {
    # Unpack the main source archive
    default
    
    # Navigate to the source directory and let go-module fetch dependencies
    cd "${S}" || die
    ego mod download
}

src_compile() {
    # Set up standard Gentoo Go compilation flags
    export CGO_ENABLED=1 # Required if using SQLite or certain crypto features
    
    # Build the main binary
    # SFTPGo embeds versioning info using -ldflags
    local myldflags="-X github.com/drakkan/sftpgo/v2/internal/version.commit=v${PV} -X github.com/drakkan/sftpgo/v2/internal/version.date=$(date -u +'%Y-%m-%dT%H:%M:%SZ')"
    
    ego build -ldflags "${myldflags}" -o sftpgo .
}

src_install() {
    # Install binary
    dobin sftpgo

    # Install configuration files
    insinto /etc/sftpgo
    doins sftpgo.json

    # Keep default directories for data and web UI assets if needed
    # SFTPGo can embed its web admin UI inside the binary or read from disk.
    # If you want to install static web files/templates separately:
    insinto /usr/share/sftpgo
    doins -r templates static

    # OpenRC Init Script
    newinitd "${FILESDIR}/sftpgo.initd" sftpgo
    newconfd "${FILESDIR}/sftpgo.confd" sftpgo

    # Systemd Service
    systemd_dounit "${S}/init/sftpgo.service"

    # Setup logging/data directories with correct permissions
    diropts -m0750 -o sftpgo -g sftpgo
    keepdir /var/lib/sftpgo
    keepdir /var/log/sftpgo
}