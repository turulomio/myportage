# Copyright 2019-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="Sftpgo user"

ACCT_USER_ID=361
ACCT_USER_HOME_PERMS=750
ACCT_USER_GROUPS=( sftpgo )
ACCT_USER_HOME= /var/lib/sftpgo

acct-user_add_deps
