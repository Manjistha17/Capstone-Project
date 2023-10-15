# This file tags and uploads an image to Docker Hub

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath="manjistha/project5"

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login &&\
    docker image tag cap_hello.1.000 $dockerpath

# Step 3:
# Push image to a docker repository
docker push $dockerpath