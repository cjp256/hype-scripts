git clone https://github.com/cjp256/meta-hype.git
git clone https://github.com/flihp/meta-measured.git
git clone git://git.yoctoproject.org/poky
git clone git://git.yoctoproject.org/meta-intel
git clone git://git.openembedded.org/openembedded-core

pushd openembedded-core
git remote add cjp256 https://github.com/cjp256/oe-core.git
popd

git clone git://git.openembedded.org/meta-openembedded
git clone git://git.openembedded.org/bitbake
git clone  git://git.yoctoproject.org/meta-virtualization 

pushd meta-virtualization
git remote add cjp256 https://github.com/cjp256/meta-virtualization.git
popd

git clone https://github.com/cjp256/meta-xengt.git
