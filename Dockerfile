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
  && pip install awscli

WORKDIR /tmp
ENTRYPOINT ["/bin/ash"]
