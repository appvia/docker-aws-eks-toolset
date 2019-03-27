NAME=aws-eks-toolset
REGISTRY ?= quay.io
AUTHOR ?= appvia

default: docker

docker:
	@docker build -t ${REGISTRY}/${AUTHOR}/${NAME} .