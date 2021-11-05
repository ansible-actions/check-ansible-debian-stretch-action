FROM debian:stretch

LABEL "maintainer"="L3D <l3d@c3woc.de>"
LABEL "repository"="https://github.com/roles-ansible/check-ansible-debian-stretch-action.git"
LABEL "homepage"="https://github.com/roles-ansible/check-ansible-debian-stretch-action"

LABEL "com.github.actions.name"="check-ansible-debian-stretch"
LABEL "com.github.actions.description"="Check ansible role or playbook with Debian stretch"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="green"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

RUN apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    software-properties-common \
    build-essential \
    libffi-dev \
    libssl-dev \
    python3-dev \
    python3-pip \
    git \
    systemd

RUN pip3 install setuptools && pip3 install ansible

RUN ansible --version

ADD ansible-docker.sh /ansible-docker.sh
ENTRYPOINT ["/ansible-docker.sh"]
