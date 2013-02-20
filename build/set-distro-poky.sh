#!/bin/bash

rm conf
ln -sf poky-hype-conf conf

pushd ../meta-intel
git checkout 1.4_M3
popd
