FROM debian:stretch

LABEL "maintainer"="L3D <l3d@c3woc.de>"
LABEL "repository"="https://github.com/roles-ansible/check-ansible-debian-stretch-action.git"
LABEL "homepage"="https://github.com/roles-ansible/check-ansible-debian-stretch-action"

LABEL "com.github.actions.name"="check-ansible-debian-stretch"
LABEL "com.github.actions.description"="Check ansible role or playbook with Debian stretch"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="red"

ENV LANG en_US.UTF-8

COPY ansible-docker.sh /ansible-docker.sh
ENTRYPOINT ["/ansible-docker.sh"]
