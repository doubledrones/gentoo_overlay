# Copyright 2011 DoubleDrones
# Distributed under the terms of the BSD License
# $Header: $

EAPI="4"
EGIT_REPO_URI="git://github.com/boxedice/sd-agent.git"

DESCRIPTION="Agent for ServerDensity failure detection system."
HOMEPAGE="http://serverdensity.com/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

NEED_PYTHON=2.4

inherit git-2

S="${WORKDIR}/${PN}"

src_unpack() {
  git clone ${EGIT_REPO_URI} ${S}
}

S="${WORKDIR}/${PN}"

src_install() {
	dodir /opt/sd-agent || die
	exeinto /opt/sd-agent
	doexe agent.py || die
	dodir /etc/sd-agent || die
	insinto /etc/sd-agent
	doins config.cfg || die
	dosym ../../etc/sd-agent/config.cfg /opt/sd-agent/config.cfg || die
	insinto /opt/sd-agent
	doins LICENSE || die
	doins minjson.py || die
	doins sd-agent-pkg.init || die
	doins sd-deploy.py || die
	doins LICENSE-minjson || die
	doins checks.py || die
	doins daemon.py || die
	doins plugins.py || die
	doexe sd-agent.init || die
	dosym ../../opt/sd-agent/sd-agent.init /etc/init.d/sd-agent || die
	dosym ../../opt/sd-agent /usr/bin/sd-agent || die
}
