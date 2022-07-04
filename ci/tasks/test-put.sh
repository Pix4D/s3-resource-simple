#! /bin/sh

set -e

mkdir out/dir1
mkdir out/dir1/dir2


# Human-readable format: 2022-06-24_13:03:18
timestamp=$(date +%Y-%m-%d_%H:%M:%S)

# Create some files and directories to be uploaded to the bucket by a resource put and
# then to be downloaded by a resource get, so that they can be compared.
echo
echo "Creating files to be uploaded to the bucket"
touch out/witness-0-$timestamp
touch out/dir1/witness-1-$timestamp
touch out/dir1/dir2/witness-2-$timestamp

# The test in job test-get will use `snapshot` to assert no diffs are present.
echo
echo "Making a list of the files (snapshot)"
cat > out/snapshot << EOB
witness-0-$timestamp
dir1/witness-1-$timestamp
dir1/dir2/witness-2-$timestamp
EOB

echo
echo "The test-get job should validate that the following files are present:"
echo
cat out/snapshot

