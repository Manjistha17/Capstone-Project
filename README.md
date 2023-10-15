# Capstone-Project

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/Manjistha17/Capstone-Project/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/Manjistha17/Capstone-Project/tree/main)

**Project Overview**
This capstone project showcases the use of CI/CD tools and cloud services covered in the program Udacity - AWS Cloud DevOps Engineer.

This project demonstrates the operationalization of a Python/Flask demo app called "hello" using CircleCI and Amazon EKS (Elastic Kubernetes Service). 

**CircleCI Pipeline:**

1.Code linting, Docker image building, and deployment to Docker Hub are automated in a CircleCI pipeline.
AWS EKS Cluster:

2.The application is deployed and run in an AWS EKS cluster.
Rolling Update Strategy:

3.New app versions are promoted to production using a rolling update strategy.
The project tasks are managed through a Makefile that utilizes shell scripts.




