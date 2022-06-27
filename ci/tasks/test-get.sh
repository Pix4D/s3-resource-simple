#! /bin/sh

set -e

cd bucket.s3simple

echo
echo "All files downloaded from the bucket:"
ls -R -1

echo
echo "Contents of snapshot file downloaded from the bucket:"
echo
cat snapshot

# Read the snapshot file we found in the bucket and confirm that all the files are present.
echo
echo "Validating that the files in snapshot have been downloaded:"
echo
while IFS= read -r path
do
    if [ -f "$path" ]; then
        echo "File exists: $path"
    else
        echo "Error: file does not exist: $path"
        exit 1
    fi
done < snapshot

