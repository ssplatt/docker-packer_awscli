FROM hashicorp/packer:1.4.3
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
    cabal \
    ghc \
  && pip install --upgrade pip \
  && pip install \
    awscli \
    boto3
WORKDIR /tmp
RUN git clone https://github.com/koalaman/shellcheck.git ./build/
RUN cd /tmp/build && cabal update && cabal install
RUN cp /root/.cabal/bin/shellcheck /usr/local/bin
RUN rm -rf /tmp/build

WORKDIR /tmp
ENTRYPOINT ["/bin/bash"]
