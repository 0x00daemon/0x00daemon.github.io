---
title: 0x01 - Hexo Fluid Theme Setup
tag: "0x01"
category: "make it"
date: "1/5/2024"
---

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

### Github Deployment

**The github deployment can be performed two ways using Hexo git deployer (which uses Github workflow) or through git pages setup**

Option 1 - provides github pages deployment
Option 2 - provides github workflow/actions deployment (preferred and what I myself use)

#### Option 1 - Using Hexo git deployer

**Installing hexo-deployer-git:**

```bash
npm install hexo-deployer-git --save
```

**Authenticating to Github:**

*Installing Github*

```bash
apt install gh -y
gh auth login
```

**Optional - but recommended github configs:**

```bash
git config --global credential.helper "cache --timeout=3600"
git config --global user.name "username"
git config --global user.email "email@example.com"
```
*be sure to change the ```username``` with your username and ```email@example.com``` to your email.*

**Adding the github pages details:**

*Make sure to edit the _config file with the following changes:*
```yml
deploy:
  type: git
  repo: <repository url>
  branch: gh-pages
  message: "Site updated: {{ now('YYYY-MM-DD HH:mm:ss') }}"
```
*Make sure to change the ```repo``` to your repo link.*

**Generating the blog:**

```bash
hexo clean && hexo deploy
```

#### Option 2 - Github workflow/actions deployment

**Authenticating to Github:**

*Installing Github*

```bash
apt install gh -y
gh auth login
```

**Optional - but recommended github configs (I did these):**

```bash
git config --global credential.helper "cache --timeout=3600"
git config --global user.name "username"
git config --global user.email "email@example.com"
```
*be sure to change the ```username``` with your username and ```email@example.com``` to your email.*

**Uploading the blog to github:**

```bash
git init
git add --all
git commit -m "Site updated: {{ now('YYYY-MM-DD HH:mm:ss') }}"
git branch -M main
git remote add origin <repo-link>
git push -u origin main
```



Now if you may be thinking how can we edit the default title, images, icons, etc. and for that you can read the official documentation for Hexo and Fluid which is cryptic to say the least or follow through this ![blogging using hexo & fluid 101 guide](https://xdaem0n.com/2024/01/07/blogging-101/)