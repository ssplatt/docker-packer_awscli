FROM alpine AS builder
RUN apk add --update --no-cache \
    python3 \
    python3-dev \
    py3-pip \
    build-base \
  && pip3 install --prefix=/install \
    awscli \
    boto3

FROM hashicorp/packer:latest AS runner
MAINTAINER "Brett Taylor <github.com/ssplatt>"
COPY --from=builder /install /usr/local
RUN apk add --update --no-cache \
    python3 \
    python3-dev \
    py3-pip \
    build-base \
    libffi-dev \
    openssl-dev \
    git \
    jq \
    openssh \
    bash \
    curl 

ENTRYPOINT ["/bin/bash"]
