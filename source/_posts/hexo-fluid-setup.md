---
title: Hexo Fluid Theme
tag: "make it"
category: "make it"
---

Following configuration can be used for pre-req config:

```bash
ufw disable

apt update
apt upgrade -y

apt install build-essential libssl-dev nodejs npm wget -y

wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

# run this section of command as one
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install stable
source ~/.profile

npm install -g hexo-cli

hexo init 0x00daemon.github.io
cd 0x00daemon.github.io/
sudo npm install

cd themes
git clone https://github.com/fluid-dev/hexo-theme-fluid.git
mv hexo-theme-fluid/ fluid

cd ..
nano _config.yml
	change: theme to fluid

npm install css --save
hexo server
```