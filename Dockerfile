FROM debian:stretch

LABEL "maintainer"="L3D <l3d@c3woc.de>"
LABEL "repository"="https://github.com/roles-ansible/check-ansible-debian-stretch-action.git"
LABEL "homepage"="https://github.com/roles-ansible/check-ansible-debian-stretch-action"

LABEL "com.github.actions.name"="check-ansible-debian-stretch"
LABEL "com.github.actions.description"="Check ansible role or playbook with Debian stretch"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="green"

# hadolint ignore=DL3008,DL3009,DL3015
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales

# hadolint ignore=DL3059
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

COPY ansible-docker.sh /ansible-docker.sh
ENTRYPOINT ["/ansible-docker.sh"]
