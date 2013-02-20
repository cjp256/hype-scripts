#!/bin/bash

rm conf
ln -sf oe-hype-conf conf

pushd ../meta-intel
git checkout danny
popd

