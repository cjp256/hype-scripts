pushd meta-hype && git pull && popd
pushd meta-measured && git pull && popd
pushd meta-intel && git pull && popd
pushd openembedded-core && git fetch origin && git fetch cjp256 && git merge origin/master && popd
pushd meta-openembedded && git pull && popd
pushd bitbake && git pull && popd
pushd meta-virtualization && git fetch origin && git fetch cjp256 && git merge origin/master && popd
pushd meta-xengt && git pull && popd
