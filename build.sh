#!/bin/bash
docker --version
docker build --no-cache -t s3-resource-simple -f Dockerfile context
docker images