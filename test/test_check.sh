#! /bin/sh

set -ex

json=$(cat s3-resource-simple.git/test/config.json)

echo $json | s3-resource-simple.git/assets/check
