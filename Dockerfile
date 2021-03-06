FROM alpine:3.10

# install base packages
RUN apk add curl bash groff less python py-pip coreutils openssl

# install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

# install helm
RUN curl -LO https://git.io/get_helm.sh && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh

# install AWS CLI
RUN pip install awscli

# install aws-iam-authenticator
RUN curl -LO https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x ./aws-iam-authenticator && \
    mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator

COPY scripts/docker-entrypoint.sh docker-entrypoint.sh

LABEL com.circleci.preserve-entrypoint=true

ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["/bin/bash"]
