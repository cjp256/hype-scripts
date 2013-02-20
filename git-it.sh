#!/bin/bash

#git submodule add -b master git://github.com/cjp256/meta-hype.git
#git submodule add -b master git://github.com/flihp/meta-measured.git
#git submodule add -b 1.4_M3 git://git.yoctoproject.org/poky
#git submodule add -b danny git://git.yoctoproject.org/meta-intel
#git submodule add -b danny git://git.openembedded.org/openembedded-core
#git submodule add -b danny git://git.openembedded.org/meta-openembedded
#git submodule add -b 1.16 git://git.openembedded.org/bitbake

git submodule update --init --recursive
git submodule foreach git pull
