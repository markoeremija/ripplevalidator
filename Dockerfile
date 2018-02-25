FROM centos:latest

LABEL maintainer.email1="mail@wietse.com"
LABEL maintainer.email2="marko.eremija@gmail.com"
LABEL maintainer.name1="Wietse Wind"
LABEL maintainer.name2="Marko Eremija"
LABEL version="0.0.1"
LABEL description="This is a Ripple validator Dockerfile for CentOS."

RUN export LANG=C.UTF-8; \
    export LANGUAGE=C.UTF-8; \
    export LC_ALL=C.UTF-8;

COPY entrypoint.sh /entrypoint.sh

RUN yum-update -y && \
    yum -y install \
    nano \
    openssl && \
    wget https://mirrors.ripple.com/ripple-repo-el7.rpm && \
    rpm -Uvh ripple-repo-el7.rpm && \
    yum install --enablerepo=ripple-stable rippled && \
    yum clean all && \
    export PATH=$PATH:/opt/ripple/bin/ && \
    chmod +x /entrypoint.sh && \
    echo '#!/bin/bash' > /usr/bin/server_info && echo '/entrypoint.sh server_info' >> /usr/bin/server_info && \
    chmod +x /usr/bin/server_info

# Maybe use WORKDIR keystore
# WORKDIR /keystore

RUN ln -s /opt/ripple/bin/rippled /usr/bin/rippled

ENTRYPOINT [ "entrypoint.sh" ]

EXPOSE 51235
