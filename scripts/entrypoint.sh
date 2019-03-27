#!/usr/bin/env bash

echo "--> Checking required environment variables"
(
    [ -z "$CLUSTER_NAME" ] ||
    [ -z "$AWS_REGION" ] ||
    [ -z "$AWS_ACCESS_KEY_ID" ] ||
    [ -z "$AWS_SECRET_ACCESS_KEY" ]
) && echo "ERROR: You must supply env vars: CLUSTER_NAME, AWS_REGION, AWS_SECRET_ACCESS_KEY, AWS_ACCESS_KEY_ID" && exit 1
echo "--> Updating kubeconfig for access to \"${CLUSTER_NAME}\ in region \"${AWS_REGION}\""
aws eks update-kubeconfig --name ${CLUSTER_NAME} --region ${AWS_REGION}
echo "--> Verifying kubectl access"
kubectl version

/bin/bash
