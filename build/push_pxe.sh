#!/bin/bash

INSTALLER_IMAGE=$(readlink -f ./tmp.oe-hype-eglibc/deploy/images/hype-installer-sugarbay.iso)
PXE_TMP_DIR=$(mktemp -d)

if [[ -z $PXE_SCP_DIR ]]; then
	PXE_SCP_DIR="chris@tango.local:/var/lib/tftpboot/installer/"
fi

if [[ ! -f ${INSTALLER_IMAGE} ]]; then
	echo "installer image does not exist!"
	exit 1
fi

if [[ -z $(which 7z) ]]; then
	echo "you must install 7z!"
	exit 2
fi

# start fresh
rm -rf ${PXE_TMP_DIR}
mkdir -p ${PXE_TMP_DIR}

pushd ${PXE_TMP_DIR}

7z x ${INSTALLER_IMAGE}

cp ./isolinux/isolinux.cfg syslinux.cfg

# location on pxe server is /installer
sed -i 's/\/tboot.gz/\/installer\/tboot.gz/g' syslinux.cfg
sed -i 's/\/vmlinuz/\/installer\/vmlinuz/g' syslinux.cfg
sed -i 's/\/initrd/\/installer\/initrd/g' syslinux.cfg
sed -i 's/\/acm_snb.bin/\/installer\/acm_snb.bin/g' syslinux.cfg
sed -i 's/\/acm_ivb.bin/\/installer\/acm_ivb.bin/g' syslinux.cfg

# pxe server is running syslinux 5.x - double up the module args
sed -i 's/\/installer\/tboot.gz/\/installer\/tboot.gz/g' syslinux.cfg
sed -i 's/\/installer\/vmlinuz/\/installer\/vmlinuz/g' syslinux.cfg
sed -i 's/\/installer\/initrd/\/installer\/initrd/g' syslinux.cfg
sed -i 's/\/installer\/acm_snb.bin/\/installer\/acm_snb.bin/g' syslinux.cfg
sed -i 's/\/installer\/acm_ivb.bin/\/installer\/acm_ivb.bin/g' syslinux.cfg

scp acm_ivb.bin acm_snb.bin initrd tboot.gz vmlinuz syslinux.cfg ${PXE_SCP_DIR}

popd
