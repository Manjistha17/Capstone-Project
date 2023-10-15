# Tag and upload an image to Docker Hub

# Run the Docker Hub container with kubernetes
kubectl create deployment project5 --image=manjistha/project5 --replicas=4 &&
    kubectl expose deployment/project5 --type="LoadBalancer" --port 80

# List kubernetes pods
kubectl get pods -o wide
kubectl get services -o wide
kubectl get pods -o wide
