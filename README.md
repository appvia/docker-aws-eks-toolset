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

Run the image with `-it` and run `/setup.sh` to configure `kubectl` and test connectivity, for example:

```bash
docker run -it \
  -e CLUSTER_NAME=my-cluster-name \
  -e AWS_REGION=eu-west-2 \
  -e AWS_SECRET_ACCESS_KEY=XXXXXXXXX \
  -e AWS_ACCESS_KEY_ID=XXXXXXXXX \
  quay.io/appvia/aws-eks-toolset:v0.0.2 bash
```

```bash
/setup.sh
```

Output:

```
bash-4.4# /setup.sh
--> Checking required environment variables
--> Updating kubeconfig for access to "my-cluster-name" in region "eu-west-2"
Added new context arn:aws:eks:eu-west-2:99999999999:cluster/my-cluster-name to /root/.kube/config
--> Verifying kubectl access
Client Version: version.Info{Major:"1", Minor:"14", GitVersion:"v1.14.0", GitCommit:"641856db18352033a0d96dbc99153fa3b27298e5", GitTreeState:"clean", BuildDate:"2019-03-25T15:53:57Z", GoVersion:"go1.12.1", Compiler:"gc", Platform:"linux/amd64"}
Server Version: version.Info{Major:"1", Minor:"11+", GitVersion:"v1.11.8-eks-7c34c0", GitCommit:"7c34c0d2f2d0f11f397d55a46945193a0e22d8f3", GitTreeState:"clean", BuildDate:"2019-03-01T22:49:39Z", GoVersion:"go1.10.8", Compiler:"gc", Platform:"linux/amd64"}
```
