FROM ubuntu:20.04

# Setting up arguments needed for the dockerfile
ARG USER=user

# Needed for non interactive install
ENV DEBIAN_FRONTEND=noninteractive 

RUN useradd -U -m ${USER} && \
    usermod -G users ${USER}

# Installing system wide software and enable sudo for the user
RUN apt-get update \
    && apt-get upgrade -y \ 
    && apt-get install -y \
        sudo \
        git \ 
        python3 \
        python-is-python3 \
        python3-pip \
        zip unzip \
        net-tools \
        iputils-ping \
        locales tzdata \
    && apt-get install keyboard-configuration \
    && ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime

ENV USER=${USER}

RUN pip install \
        ipython \
        arrow

ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN sudo chmod +x /tini
ENTRYPOINT ["/tini", "-g", "--"]

ENV PATH=/home/${USER}/.local/bin:$PATH

ARG PORT=8888
EXPOSE ${PORT}