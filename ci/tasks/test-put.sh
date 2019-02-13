#! /bin/sh

set -e

mkdir out/dir1
mkdir out/dir1/dir2

timestamp=`date -Iseconds`

touch out/witness-0-$timestamp
touch out/dir1/witness-1-$timestamp
touch out/dir1/dir2/witness-2-$timestamp

# The test in job test-get will use `snapshot` to assert no diffs are present.
snapshot=`tree out`
echo $snapshot > out/snapshot

echo "Verify manually in the s3simple get that the following directories and files are uploaded:"
tree out
