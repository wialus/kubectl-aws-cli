FROM python:3.11-alpine

RUN apk add --no-cache curl \
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin \
    && pip install awscli --upgrade --no-cache-dir \
    && export RCLONE_VERSION=$(curl -s https://downloads.rclone.org/version.txt | sed 's/rclone v//') \
    && wget https://downloads.rclone.org/v${RCLONE_VERSION}/rclone-v${RCLONE_VERSION}-linux-amd64.zip -O /tmp/rclone.zip \
    && cd /tmp \
    && unzip rclone.zip \
    && mv rclone-v${RCLONE_VERSION}-linux-amd64/rclone /usr/local/bin \
    && rm -rf /tmp/* \
    && apk del curl
