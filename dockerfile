FROM ubuntu:latest

LABEL maintainer="breno"

RUN apt-get update && \
    apt-get install -y wget unzip curl nano

ENV TERRAFORM_VERSION=1.6.4

RUN wget "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN mkdir /lab2

RUN mkdir Downloads && \
    cd Downloads &&\
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install


CMD ["/bin/bash"]
