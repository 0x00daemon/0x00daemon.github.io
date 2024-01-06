---
title: Hexo Fluid Theme
tag: "make it"
category: "make it"
---

### Background

"Hexo is a fast, simple, and powerful blog framework. You write posts in Markdown (or other markup languages), and Hexo generates static files with a beautiful theme in seconds." - Hexo official website.

The basic Hexo deployment is pretty bland, but the real magic of Hexo comes into play with the introduction of themes and plugins. Here, I will provide a step-by-step guide on how to set up Hexo and also install the most popular Hexo theme known as Fluid.

This Hexo installation guide is created for Ubuntu machines.

### Installation

**Elevating the priviliges:**

```bash
sudo su -
```

**Disabling firewall:**

```bash
ufw disable
```

**Updating the machine:**

```bash
apt update && apt upgrade -y
```

**Installing required**

```bash
apt install build-essential libssl-dev nodejs npm wget -y
```

**Installing nvm (node(js) version manager):**

```bash
wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
```
**Adding path of nvm:**

*run the following command as one command*
```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
```

**Installing/upgrading node(js) and updating sources:**

```bash
nvm install stable
source ~/.profile
```

**Installing Hexo:**

```bash
npm install -g hexo-cli
```

**creating hexo project:**

```bash
hexo init 0x00daemon.github.io
cd 0x00daemon.github.io/
sudo npm install
```

**Installing the Fluid theme:**

```bash
cd themes
git clone https://github.com/fluid-dev/hexo-theme-fluid.git
mv hexo-theme-fluid/ fluid
```

**Adding the Fluid theme to Hexo blog:**

```bash
cd ..
vi _config.yml # or nano _config.yml
```
*change the theme to ```Fluid``` from ```Landscape``` which is the default*

**To install the css package:**

```bash
npm install css --save
```

**Running the Hexo server (to test):**

```bash
hexo server
```