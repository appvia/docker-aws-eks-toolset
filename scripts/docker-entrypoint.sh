#!/usr/bin/env bash
set -e

echo "--> Checking required environment variables"
(
    [ -z "$CLUSTER_NAME" ] ||
    [ -z "$AWS_REGION" ] ||
    [ -z "$AWS_ACCESS_KEY_ID" ] ||
    [ -z "$AWS_SECRET_ACCESS_KEY" ]
) && echo "ERROR: You must set env vars: CLUSTER_NAME, AWS_REGION, AWS_SECRET_ACCESS_KEY, AWS_ACCESS_KEY_ID" && exit 1
echo "✅ environment variables present"
echo "--> Updating kubeconfig for access to \"${CLUSTER_NAME}\" in region \"${AWS_REGION}\""
aws eks update-kubeconfig --name ${CLUSTER_NAME} --region ${AWS_REGION}
echo "--> Verifying kubectl access"
kubectl version
[ $? == 0 ] && echo "✅ kubectl access verified"

exec "$@"
