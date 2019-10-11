FROM alpine AS builder
RUN apk add --update --no-cache \
    python \
    python-dev \
    py-pip \
    build-base \
    git \
    jq \
    openssh \
    bash \
    curl \
    libffi-dev \
    openssl-dev \
    cabal \
    ghc \
  && pip install --prefix=/install \
    awscli \
    boto3
RUN git clone https://github.com/koalaman/shellcheck.git ./build/
RUN cd ./build && cabal update && cabal install

FROM hashicorp/packer:1.4.3 AS runner
MAINTAINER "Brett Taylor <github.com/ssplatt>"
COPY --from=builder /root/.cabal/bin/shellcheck /usr/local/bin
COPY --from=builder /install /usr/local
RUN apk add --update --no-cache \
    python \
    python-dev \
    py-pip \
    build-base \
    libffi-dev \
    openssl-dev \
    git \
    jq \
    openssh \
    bash \
    curl

ENTRYPOINT ["/bin/bash"]
