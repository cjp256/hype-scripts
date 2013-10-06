#!/bin/bash -x

. ./environment.sh

bitbake core-image-sato
bitbake xengt-guest
