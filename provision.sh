#!/bin/bash

sudo apt-get -qy install git

curl -s -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

cat <<EOF >> /home/vagrant/.bashrc
export PATH=\"$HOME/.pyenv/bin:$PATH\"
eval \"\$(pyenv init -)\"
eval \"\$(pyenv virtualenv-init -)\"
cd /vagrant
EOF
