FROM hashicorp/packer
MAINTAINER "Brett Taylor <github.com/ssplatt>"

RUN apk add --update --no-cache \
    python \
    python-dev \
    py-pip \
    build-base \
    git \
    jq \
    openssh \
    bash \
    libffi-dev \
    openssl-dev \
  && pip install --upgrade pip \
  && pip install \
    awscli \
    boto3

RUN addgroup -S packer && adduser -S packer -G packer
USER packer
WORKDIR /home/packer
ENTRYPOINT ["/bin/bash"]
