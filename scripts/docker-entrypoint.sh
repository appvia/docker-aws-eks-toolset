#!/usr/bin/env bash
set -e

echo "--> Checking required environment variables"
if [ -n "$CLUSTER_NAME" -a -n "$AWS_REGION" -a -n "$AWS_ACCESS_KEY_ID" -a -n "$AWS_SECRET_ACCESS_KEY" ]; then
  echo "✅ environment variables present"
  echo "--> Updating kubeconfig for access to \"${CLUSTER_NAME}\" in region \"${AWS_REGION}\""
  aws eks update-kubeconfig --name ${CLUSTER_NAME} --region ${AWS_REGION}
  echo "--> Verifying kubectl access"
  kubectl version
  [ $? == 0 ] && echo "✅ kubectl access verified"
else
  echo "⚠️  kubectl context not configured:"
  echo "Please set env vars CLUSTER_NAME, AWS_REGION, AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY and run:"
  echo "aws eks update-kubeconfig --name ${CLUSTER_NAME} --region ${AWS_REGION}"
fi

exec "$@"
