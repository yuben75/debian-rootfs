#!/bin/bash

TAR_GZ_EXTENSION=.tar.gz
TAR_XZ_EXTENSION=.tar.xz

# Check architecture and set variables
if [[ ! $check_and_set ]]; then
    . 0-check-and-set.sh $1
fi

rootfs_dir_utc=`readlink $build_dir/$rootfs_dir`
tar_gz_name=$rootfs_dir_utc$TAR_GZ_EXTENSION
tar_xz_name=$rootfs_dir_utc$TAR_XZ_EXTENSION

cd $build_dir
tar cfz $tar_gz_name $rootfs_dir_utc
tar Jcvf $tar_xz_name $rootfs_dir_utc
cd - >/dev/null

echo
echo "$build_dir/$tar_gz_name created"
echo "$build_dir/$tar_xz_name created"
