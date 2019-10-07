# Docker AWS EKS Toolset

A toolset image for managing Kubernetes deployments on AWS EKS.

### Build status
[![CircleCI](https://circleci.com/gh/appvia/docker-aws-eks-toolset.svg?style=svg)](https://circleci.com/gh/appvia/docker-aws-eks-toolset)
[![Docker Repository on Quay](https://quay.io/repository/appvia/aws-eks-toolset/status "Docker Repository on Quay")](https://quay.io/repository/appvia/aws-eks-toolset)

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

It will automatically authenticate to the cluster and test connectivity.

```bash
docker run -it \
  -e CLUSTER_NAME=my-cluster-name \
  -e AWS_REGION=eu-west-2 \
  -e AWS_SECRET_ACCESS_KEY=XXXXXXXXX \
  -e AWS_ACCESS_KEY_ID=XXXXXXXXX \
  quay.io/appvia/aws-eks-toolset
```

Output:

```
--> Checking required environment variables
✅ environment variables present
--> Updating kubeconfig for access to "appvia-hub-ci-test" in region "eu-west-2"
Added new context arn:aws:eks:eu-west-2:99999999999:cluster/my-cluster-name to /root/.kube/config
--> Verifying kubectl access
Client Version: version.Info{Major:"1", Minor:"16", GitVersion:"v1.16.1", GitCommit:"d647ddbd755faf07169599a625faf302ffc34458", GitTreeState:"clean", BuildDate:"2019-10-02T17:01:15Z", GoVersion:"go1.12.10", Compiler:"gc", Platform:"linux/amd64"}
Server Version: version.Info{Major:"1", Minor:"13+", GitVersion:"v1.13.10-eks-5ac0f1", GitCommit:"5ac0f1d9ab2c254ea2b0ce3534fd72932094c6e1", GitTreeState:"clean", BuildDate:"2019-08-20T22:39:46Z", GoVersion:"go1.11.13", Compiler:"gc", Platform:"linux/amd64"}
✅ kubectl access verified
```
