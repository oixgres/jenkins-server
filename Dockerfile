FROM jenkins/jenkins:lts

USER root

# Add docker
RUN apt-get update -y && \
    apt-get install -y ca-certificates curl

RUN install -m 0755 -d /etc/apt/keysprings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keysprings/docker.asc && \
    chmod a+r /etc/apt/keysprings/docker.asc

RUN echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keysprings/docker.asc] https://download.docker.com/linux/debian \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update -y && \
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# aws cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip && ./aws/install
