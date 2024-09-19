FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    iputils-ping \
    openssh-client \
    sshpass \
    ca-certificates \
    python3 \
    pipx \
    vim 

# Clear cache, reduce image size 
RUN rm -rf /var/lib/apt/lists/*

ENV PATH=/root/.local/bin:$PATH

RUN pipx install --include-deps ansible-core
RUN pipx inject ansible-core passlib

RUN mkdir -p /etc/ansible/ && \
    echo "[local]\nlocalhost" > /etc/ansible/hosts

ENV ANSIBLE_GATHERING=smart \
    ANSIBLE_SSH_PIPELINING=True \
    EDITOR=vim

WORKDIR /etc/ansible/playbooks