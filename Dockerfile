FROM cimg/python:3.10 AS base

FROM base AS builder
ENV PACKER_VERSION "1.8.2"

WORKDIR /tmp
RUN curl "https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip" -o "packer.zip" \
    && unzip packer.zip \
    && sudo cp packer /usr/local/bin \
    && packer --version

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && sudo ./aws/install \
    && aws --version

FROM base AS runner
LABEL maintainer="Brett Taylor <github.com/ssplatt>"
COPY --from=builder /usr/local /usr/local
ENTRYPOINT ["/bin/bash"]
