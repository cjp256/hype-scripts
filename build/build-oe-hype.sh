#!/bin/bash -x

./set-distro-oe.sh
. ./environment.sh

bitbake hype-image
