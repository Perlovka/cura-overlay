# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )
inherit cmake-utils python-single-r1

MY_PN="libCharon"

DESCRIPTION="This library facilitates communication between Cura and its backend"
HOMEPAGE="https://github.com/Ultimaker/libArcus"
SRC_URI="https://github.com/Ultimaker/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0/3"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${MY_PN}-${PV}"
