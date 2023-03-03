# Copyright 2019-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="Gitbucket user"

ACCT_USER_ID=973
ACCT_USER_HOME_PERMS=750
ACCT_USER_SHELL=/bin/sh
ACCT_USER_GROUPS=( gitbucket )
ACCT_USER_HOME= /var/lib/gitbucket

acct-user_add_deps

