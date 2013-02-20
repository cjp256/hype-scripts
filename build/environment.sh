#!/bin/bash

TOPDIR=$(readlink -f ..)

DISTRO=$(basename $(readlink -m conf) -conf)
if [[ "${DISTRO}" == "oe-hype" ]]; then
	PATH=${TOPDIR}/openembedded-core/scripts:${TOPDIR}/bitbake/bin:${PATH}
elif [[ "${DISTRO}" == "poky-hype" ]]; then
	PATH=${TOPDIR}/poky/scripts:${TOPDIR}/poky/bitbake/bin:${PATH}
else
	echo "DISTRO not valid.  Please symlink conf to oe-hype-conf or poky-hype-conf."
fi
