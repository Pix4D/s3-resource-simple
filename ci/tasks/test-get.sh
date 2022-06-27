#! /bin/sh

set -ex

echo "Directory listing"
ls -R bucket.s3simple


echo "use snapshot to compare with the directory listing above"
cat bucket.s3simple/snapshot

