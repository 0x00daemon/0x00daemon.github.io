
---
title: "0x04 - Cloudflare Tunnels"
tag: "0x04"
category: "do it"
date: "05/06/2024"
---

Remote access....? Secure Remote access....? How to achieve that? Well Cloudflare provides us that and much more.

So I was researching for affordable remote access solutions and cloudflare warp + tunnels seemed to be the one that worked out for me. In this guide I will guide you through how you can setup remote access to your home to access whatever you would like from whereever you would like.

### Prerequisites

You need a domain
You need a cloudflare account
Your domain will need to be transferred to Cloudflare

### Setting up Cloudflare Zero Trust

First of all you will need to set up Cloudflare zerotrust and for that you can head to the your [dashboard](https://dash.cloudflare.com/) and then click on the zero trust option from the side bar.

Next, you may have to do a first time setup and suring the setup if there is a mention of selecting a plan stick with the free plan

Next, you will need to head to Networks from the sidebar and then tunnels. On the tunnels page, click on the create a new tunnel option:

![Accessing the Tunnels Page](for_blog/0x04/cat_1.png)

Next, Follow the part 1 of the following guide by cloudflare guide on setting up tunnels: [Create a tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/get-started/create-remote-tunnel/)

Note: when setting up a tunnel you have multiple options and the best deployment option in my opinion will be through docker preferably deployed on a linux machine on a old machine or a raspberry pi. In my case, a server which is running a ubuntu server VM where I am running the docker deployment for deploying the tunnel. One important thing if you would like to go the cloudflare route will be to modify the docker container run command with the `-d` prefix as that will ensure the docker container runs in the background.

Once you configure that part, save the tunnel. Now click on your tunnel that you just created and click on the configure button from the right side bar. 

![configuring tunnel](https://github.com/0x00daemon/0x00daemon.github.io/blob/main/themes/fluid/source/img/for_blog/0x04/cat_1.png)

Next go to the private networks tab and add your home private network with CIDR.

Next you will need to create 

