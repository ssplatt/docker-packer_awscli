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
    libffi \
  && pip install --upgrade pip \
  && pip install \
    awscli \
    boto3

WORKDIR /tmp
ENTRYPOINT ["/bin/bash"]
