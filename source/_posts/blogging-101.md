---
title: "0x02 - Blogging using Hexo & Fluid"
tag: "0x02"
category: "make it"
date: "1/6/2024 2:00 AM"
---

This guide picks up where the Hexo Fluid setup guide left off.

Here, I provide a comprehensive guide on using Hexo blogs with the Fluid theme. We'll start with basic Hexo configurations and then move on to Fluid theme configurations.

To better understand how everything works in Hexo, let's delve into the directory structure:

```text
│   .gitignore
│   CNAME # only present if you have added your custom domain using GitHub
│   package-lock.json
│   package.json
│   _config.landscape.yml
│   _config.yml
```

Among these files, the most crucial one is `_config.yml` because it contains the Hexo configuration. Here's a recommended config (customize details like name as necessary):

```yaml
# Hexo Configuration
## Docs: https://hexo.io/docs/configuration.html
## Source: https://github.com/hexojs/hexo/

# Site
title: xdaem0n
subtitle: To fix it, you gotta break it
description: To fix it, you gotta break it
keywords:
author: xdaem0n
language: en
timezone: ''

# URL
## Set your site URL here. For example, if you use GitHub Page, set URL as 'https://username.github.io/project'
url: https://xdaem0n.com/
permalink: :title/
permalink_defaults:
pretty_urls:
  trailing_index: true # Set to false to remove trailing 'index.html' from permalinks
  trailing_html: true # Set to false to remove trailing '.html' from permalinks
# ... (rest of the configuration)

# Deployment
## Docs: https://hexo.io/docs/one-command-deployment
deploy:
  type: ''
```

> Note: Changes were made, such as `new_post_name: :title.md`, to improve SEO and manageability.

Moving on, let's explore other directories:

```text
├───.github
│   └───workflows
├───scaffolds
├───source
│   ├───about
│   └───_posts
└───themes
```

> The `.github` directory is for the workflow that runs our website while hosted on GitHub.

> `scaffolds` includes files that can be used with the Hexo theme to create pages, posts, or drafts.

> `source` includes the actual contents of the posts, drafts, and pages.

> `themes` includes all the themes that can be added and everything related to those themes.

Creating a new post:

As we learned, the source directory contains all the posts, pages, and drafts files. To create a new post, create a new file in the `source/_posts` directory, e.g., "blogging_101.md". Ensure to add `.md` as we'll be using Markdown.

Now, edit the file and add the metadata and contents. For example:

```
---
title: 0x02 - Blogging using Hexo & Fluid
tag: "0x02"
category: "make it"
Date: "1/6/2024"
---

This guide starts from where the Hexo Fluid setup guide left.

Here I will be providing a comprehensive guide on how to use Hexo blogs with the Fluid theme.
```

This is how posts can be created using Hexo.

For the about page:

Create a directory in `source` named `about`. Inside the `about` directory, create an `index.md` file for the about page content.

To add extra information, modify the Fluid theme config. For example:

```yaml
about:
  enable: true
  banner_img: /img/index.png
  banner_img_height: 60
  banner_mask_alpha: 0.3
  avatar: /img/logo-no-bg-dg.png
  name: "xdaem0n"
  intro: "to fix it you have to break it"
  # ... (more configuration)
```

For the body of the page, edit `source/about/index.md`:

```
---
title: whoami
layout: about
---

**Heya!**

I'm Muhammad, an undergraduate student with a passion for cybersecurity. My areas of expertise include:
- Malware development
- Reverse engineering
- Scripting
- Programming
- Networking

I'm currently pursuing a degree in cybersecurity and am dedicated to exploring the fascinating world of cyber threats and defenses. My interests aren't just limited to cybersecurity, and I am actively involved in projects related to DevNetOps as well.

*Projects:*

- **CTF Infrastructure Setup:** [ctf.xdaem0n.com](https://ctf.xdaem0n.com)
```

That should cover the basic changes and setup. Feel free to modify other configurations in the Fluid theme `_config.yml` file for additional customization like changing the default banner images for the different pages, enabling comments etc.

