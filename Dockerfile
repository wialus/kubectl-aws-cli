FROM ubuntu:jammy

RUN apt update \
    && apt install -y --no-install-recommends ca-certificates curl unzip \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o /tmp/awscliv2.zip \
    && unzip /tmp/awscliv2.zip -d /tmp \
    && /tmp/aws/install \
    && export RCLONE_VERSION=$(curl -s https://downloads.rclone.org/version.txt | sed 's/rclone v//') \
    && curl https://downloads.rclone.org/v${RCLONE_VERSION}/rclone-v${RCLONE_VERSION}-linux-amd64.zip -o /tmp/rclone.zip \
    && unzip /tmp/rclone.zip -d /tmp \
    && mv /tmp/rclone-v${RCLONE_VERSION}-linux-amd64/rclone /usr/local/bin \
    && rm -rf /tmp/* \
    && apt -y purge curl \
    && apt autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/*
