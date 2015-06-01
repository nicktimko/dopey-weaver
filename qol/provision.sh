#!/bin/bash

# Python deps and other stuff
apt-get -qq update
apt-get -qqy install \
    build-essential git linux-image-extra-$(uname -r) \
    libdb-dev libz-dev libreadline-dev \
    libncursesw5-dev libssl-dev libgdbm-dev \
    libsqlite3-dev libbz2-dev liblzma-dev \
    libc6-dev tk-dev

# Docker
DOCKER_COMPOSE_BINARY="https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m`"
wget -qO- https://get.docker.com/ | sh
usermod -aG docker vagrant

# Compose
curl -L $DOCKER_COMPOSE_BINARY > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Pyenv
PYENV_INSTALLER="https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer"
curl -sSL $PYENV_INSTALLER | su vagrant -s /bin/bash
# .bashrc modifications already in the bash_profile.sh file

su - vagrant -c '$HOME/.pyenv/bin/pyenv install 3.4.3'
su - vagrant -c '$HOME/.pyenv/bin/pyenv install 2.7.10'

# Quality of life
# blue dir color on blue-ish PowerShell background is impossible
# NOTE: only do this for root; user vagrant is dealt with in bash_profile.sh
echo 'LS_COLORS=$LS_COLORS:"di=0;35:"' >> ~/.bashrc
