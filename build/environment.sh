#!/bin/bash

TOPDIR=$(readlink -f ..)

DISTRO=$(basename $(readlink -m conf) -conf)
PATH=${TOPDIR}/poky/scripts:${TOPDIR}/poky/bitbake/bin:${PATH}
