---
title: "0x04 - Cloudflare Tunnels"
tag: "0x04"
category: "do it"
date: "05/06/2024"
---

Remote access... Secure remote access... How can you achieve that? Cloudflare provides a solution that encompasses much more.

In my search for affordable remote access solutions, Cloudflare Warp + Tunnels proved to be the ideal choice. This guide will walk you through setting up remote access to your home so you can access your network from anywhere.

### Prerequisites

- You need a domain.
- You need a Cloudflare account.
- Your domain will need to be transferred to Cloudflare.

### Setting up Cloudflare Zero Trust

First, you will need to set up Cloudflare Zero Trust. Begin by heading to your [dashboard](https://dash.cloudflare.com/), then click on the Zero Trust option from the sidebar.

During the initial setup, if there's a mention of selecting a plan, stick with the free plan.

Next, navigate to Networks from the sidebar, and then to Tunnels. On the Tunnels page, click on the "create a new tunnel" option:

![Accessing the Tunnels Page](img/for_blog/0x04/cat_1.png)

Follow Part 1 of the Cloudflare guide on setting up tunnels: [Create a tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/get-started/create-remote-tunnel/)

Note: When setting up a tunnel, you have multiple options. The best deployment option, in my opinion, is through Docker, preferably deployed on a Linux machine on an old computer or a Raspberry Pi. In my case, it's a server running an Ubuntu server VM where I'm deploying the Docker deployment for the tunnel. It's important to modify the Docker container run command with the `-d` flag to ensure the Docker container runs in the background.

Once you've configured that part, save the tunnel. Now, click on the tunnel you just created and click on the "configure" button from the right sidebar.

![Configuring tunnel](img/for_blog/0x04/cat_1.png)

Next, go to the private networks tab and add your home private network with CIDR.

Then, create application policies to allow access to your network or hosts:

![Adding an application policy](img/for_blog/0x04/network_policies.png)

Choose "Private network" for the application type:

![Selecting application type](img/for_blog/0x04/select_private.png)

Add the host or the entire network and create the policy.

Go to settings, then the Warp tab, and click the manage button for device enrollment permissions. Add a rule in the policies for the email addresses that should have access.

After that, download Warp on the client devices. Once installed, you will need to follow the guide to add your organization, which will be the name of the Zero Trust organization that you set while setting up Zero Trust for your Cloudflare account. If forgotten, you can find it in the settings and account section.
