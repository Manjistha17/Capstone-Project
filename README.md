# Capstone-Project

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/Manjistha17/Capstone-Project/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/Manjistha17/Capstone-Project/tree/main)

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

make setup

make install

make lint

Build and publish the container image

Dockerhub repo: https://hub.docker.com/repository/docker/manjistha/project5/general

Git repo: https://github.com/Manjistha17/Capstone-Project








