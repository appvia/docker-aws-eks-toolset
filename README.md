# Docker AWS EKS Toolset

A toolset image for managing Kubernetes deployments on AWS EKS.

### CircleCI Build Status
[![CircleCI](https://circleci.com/gh/appvia/docker-aws-eks-toolset.svg?style=svg)](https://circleci.com/gh/appvia/docker-aws-eks-toolset)

## Overview
This container provides the following utilities to assist in interacting with a Kubernetes Cluster build on EKS.
- [AWS CLI](https://docs.aws.amazon.com/cli/index.html)
- [aws-iam-authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html)
- [Kubectl](https://kubernetes.io/docs/reference/kubectl/overview/)

## Build

`make docker`

## Run

You must supply the following environment variables when running the image:
* CLUSTER_NAME
* AWS_REGION
* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY

The image will setup `kubectl` access to your cluster automatically and check connectivity.
