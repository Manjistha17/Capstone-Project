## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

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
	hadolint Dockerfile
	pylint --disable=R,C,W1203,W1202 hello.py

run-app:
	python3 cap_hello.py	

build-docker:
	./build_docker.sh

run-docker: build-docker
	./run_docker.sh	

upload-docker: build-docker
	./upload_docker.sh

k8s-deployment: eks-create-cluster
	./k8s_deployment.sh	
all: install lint test