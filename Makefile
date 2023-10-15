## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# cap_hello.py should pass pylint

CLUSTER_NAME=caphello
REGION_NAME=us-east-1
KEYPAIR_NAME=project5
DEPLOYMENT_NAME=project5
NEW_IMAGE_NAME=manjistha/project5:latest
CONTAINER_PORT=80
HOST_PORT=8080

setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	python3 -m venv ~/.devops

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
	pip install -r requirements.txt


lint:
	# This is linter for Dockerfiles
	hadolint-Linux-x86_64 Dockerfile
	pylint --disable=R,C,W1203,W1202 cap_hello.py

run-app:
	python3 cap_hello.py	

build-docker:
	./build_docker.sh

run-docker: build-docker
	./run_docker.sh	

upload-docker: build-docker
	./upload_docker.sh

deployment: deployment
	./deployment.sh	


rolling-update:
	kubectl get deployments -o wide
	kubectl set image deployments/${DEPLOYMENT_NAME} \
		${DEPLOYMENT_NAME}=${NEW_IMAGE_NAME}
	echo
	kubectl get deployments -o wide
	kubectl describe pods | grep -i image
	kubectl get pods -o wide


rollback:
	kubectl get deployments -o wide
	kubectl rollout undo deployment ${DEPLOYMENT_NAME}
	kubectl describe pods | grep -i image
	echo
	kubectl get pods -o wide
	kubectl get deployments -o wide