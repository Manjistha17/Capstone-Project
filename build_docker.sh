CONTAINER_NAME="cap_hello"
VERSION=1.000

# Step 1:
# Build image and add a descriptive tag
docker build --tag ${CONTAINER_NAME}:${VERSION} cap_hello