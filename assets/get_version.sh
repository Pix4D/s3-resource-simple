#!/bin/sh

# Outputs the most recent version object: {"LastModified": "..."}
# Prints nothing when no objects exist under the prefix.

set -e

bucket=$1
prefix=$2

aws s3api list-objects \
  --bucket "$bucket" \
  --prefix "$prefix" \
  --query 'Contents[].{LastModified: LastModified}' \
| jq -c 'if . == null or length == 0 then empty else max_by(.LastModified) end'
