# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_4 python3_5 python3_6 )
inherit cmake-utils python-single-r1

MY_PN="libSavitar"

DESCRIPTION="C++ implementation of 3mf loading with SIP python bindings"
HOMEPAGE="https://github.com/Ultimaker/libSavitar"
SRC_URI="https://github.com/Ultimaker/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0/3"
KEYWORDS="~amd64 ~x86"
IUSE="python static-libs"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="${PYTHON_DEPS}
	dev-python/sip[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_PN}-${PV}"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_PYTHON=$(usex python ON OFF)
		-DBUILD_STATIC=$(usex static-libs ON OFF)
	)
	use python && mycmakeargs+=( -DPYTHON_SITE_PACKAGES_DIR="$(python_get_sitedir)" )
	cmake-utils_src_configure
}
