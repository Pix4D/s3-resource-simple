docker --version
docker images
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker tag s3-resource-simple $DOCKER_TEAM/s3-resource-simple:latest
docker push $DOCKER_TEAM/s3-resource-simples:latest