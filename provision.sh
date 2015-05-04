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
wget -qO- https://get.docker.com/ | sh
usermod -aG docker vagrant

# Pyenv
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> /home/vagrant/.bashrc

PYENV_INSTALLER="https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer"
curl -s -L $PYENV_INSTALLER | su vagrant -s /bin/bash

cat <<EOF >> /home/vagrant/.bashrc
eval "\$(pyenv init -)"
eval "\$(pyenv virtualenv-init -)"
EOF

# Quality of life
# blue dir color on blue-ish powershell background is impossible
echo 'LS_COLORS=$LS_COLORS:"di=0;35:"' >> ~/.bashrc
echo 'LS_COLORS=$LS_COLORS:"di=0;35:"' >> /home/vagrant/.bashrc
# start where our code is.
echo 'cd /vagrant' >> /home/vagrant/.bashrc
