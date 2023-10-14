## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

CLUSTER_NAME=caphello
REGION_NAME=us-east-1
KEYPAIR_NAME=project5
DEPLOYMENT_NAME=hello-cap
CONTAINER_PORT=80
HOST_PORT=8080
KUBECTL=./bin/kubectl

setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	python3 -m venv ~/.devops

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
	pip install -r requirements.txt

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

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

k8s-deployment: eks-create-cluster
		k8s_deployment.sh	

port-forwarding: 
	# Needed for "minikube" only
	${KUBECTL} port-forward service/${DEPLOYMENT_NAME} ${HOST_PORT}:${CONTAINER_PORT}

rolling-update:
	${KUBECTL} get deployments -o wide
	${KUBECTL} set image deployments/${DEPLOYMENT_NAME} \
		${DEPLOYMENT_NAME}=${NEW_IMAGE_NAME}
	echo
	${KUBECTL} get deployments -o wide
	${KUBECTL} describe pods | grep -i image
	${KUBECTL} get pods -o wide

#rollout-status:
	#${KUBECTL} rollout status deployment ${DEPLOYMENT_NAME}
	#echo
	#${KUBECTL} get deployments -o wide

rollback:
	${KUBECTL} get deployments -o wide
	${KUBECTL} rollout undo deployment ${DEPLOYMENT_NAME}
	${KUBECTL} describe pods | grep -i image
	echo
	${KUBECTL} get pods -o wide
	${KUBECTL} get deployments -o wide

k8s-cleanup-resources:
	k8s_cleanup_resources.sh

eks-create-cluster:
	eks_create_cluster.sh
