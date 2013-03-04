#!/bin/bash

./set-distro-poky.sh
. ./environment.sh

bitbake hype-installer
