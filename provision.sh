#!/bin/bash

sudo apt-get -qy install git libdb-dev build-essential libz-dev libreadline5-dev libncursesw5-dev libssl-dev libgdbm-dev libsqlite3-dev libbz2-dev liblzma-dev libc6-dev tk-dev

# blue dir color on blue-ish powershell background is impossible
echo 'LS_COLORS=$LS_COLORS:"di=0;35:"' >> ~/.bashrc
echo 'LS_COLORS=$LS_COLORS:"di=0;35:"' >> /home/vagrant/.bashrc

curl -s -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | su vagrant -s /bin/bash

cat <<EOF >> /home/vagrant/.bashrc
export PATH="\$HOME/.pyenv/bin:\$PATH"
eval "\$(pyenv init -)"
eval "\$(pyenv virtualenv-init -)"
cd /vagrant
EOF
