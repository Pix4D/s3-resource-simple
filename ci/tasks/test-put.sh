#! /bin/sh

set -e

mkdir out/dir1
mkdir out/dir1/dir2


# Human-readable format: 2022-06-24_13:03:18
timestamp=$(date +%Y-%m-%d_%H:%M:%S)

# Create some files and directories to be uploaded to the bucket by a resource put and
# then to be downloaded by a resource get, so that they can be compared.
touch out/witness-0-$timestamp
touch out/dir1/witness-1-$timestamp
touch out/dir1/dir2/witness-2-$timestamp

# The test in job test-get will use `snapshot` to assert no diffs are present.
# We create snapshot beforehand so that it will be included in the list.
touch out/snapshot
(cd out && ls -R) > out/snapshot

echo "Verify manually in the s3simple get that the following directories and files are uploaded:"
cat out/snapshot
