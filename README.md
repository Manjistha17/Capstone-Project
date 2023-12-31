# Capstone-Project


**Project Overview**
This capstone project showcases the use of CI/CD tools and cloud services covered in the program Udacity - AWS Cloud DevOps Engineer.

**Project Introduction:**

This project demonstrates the operationalization of a Python/Flask demo app called "hello" using CircleCI and Amazon EKS (Elastic Kubernetes Service). 

1.**CircleCI Pipeline:** : Code linting, Docker image building, and deployment to Docker Hub are automated in a CircleCI pipeline.
AWS EKS Cluster:

2.The application is deployed and run in an AWS EKS cluster.
Rolling Update Strategy:

3.New app versions are promoted to production using a rolling update strategy.
The project tasks are managed through a Makefile that utilizes shell scripts.

**Project Tasks:**
1.	Installed ekstcl. 
2.	Installed Hadolint.
3.	Initialized the Python virtual environment using ‘make setup’ from Makefile.
4.	Installed all the necessary dependencies using ‘make install’.
5.	Tested the code using linting: 'make lint'.
6.	Built the Docker image for the application using 'make build-docker'.
7.	Ran the Docker using 'make run-docker'.
8.	Uploaded the Docker image in Dockerhub using ' make upload-docker'.
10.	Deployed a Kubernetes cluster using hello-cluster.yml, command : eksctl create cluster -f hello-cluster.yml.
11.	Deployed the application using 'make deployment'.
12.	Updated the application in the cluster using 'make rolling-update'.
13.	Deleted the cluster using 'make rollback'.

The **CirclCI pipeline**(config.yml) executes the following steps automatically:

1.make setup

2.make install

3.make lint

4.Build and publish the container image

Environment variables added to CircleCI : DOCKER_USERNAME, DOCKER_PASSWORD

Dockerhub repo: https://hub.docker.com/repository/docker/manjistha/project5/general

Git repo: https://github.com/Manjistha17/Capstone-Project

Screenshots:
Application screenshot.png : Screenshot showing that the application can be accessed after deployment. 

CircleCi screenshot.png : Screenshot of the Circle CI pipeline showing all stages passed successfully.

Deployment screenshot.png : Screenshot of the kubectl command output showing that the deployment is successful, pods are running, and the service can be accessed via an external IP or port forwarding.

EC2 screenshot.png: Screenshot of AWS EC2 page showing the instances running as the EKS cluster nodes.

Lint screenshot.png: Code is checked against a linter as part of a Continuous Integration step.




