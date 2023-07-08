---
title: README
description: The main README.md file for ShapeCreations project. 
created: 2023/06/07 23:34:49
Last modified: 2023/07/08 14:42:57
tags: [readme, shapecreation, docker, apache, php, mariadb, phpmyadmin, security]
status: in-progress
---

# Shape Creations: A Full Stack Web Application Tutorial
---
## Tools
This project utilizes `Docker` to build a secure and dynamic web application with `Apache`, `PHP`, `MariaDb`, and `PHPMyAdmin`. 

## Purpose
When I started out on this project, I had trouble getting it off the ground. No tutorial (or combination of tutorials) helped me accomplish exactly what I was looking for, so I decided to create one! I am a student of Computer Science still so I am in no way claiming to be an expert. 

Everything in this tutorial series will have the corresponding resources I used and/or explanations of why I did things a certain way where no resources exist. I've tried my best to be as clear and descriptive as possible for even the earliest amateur programmer. 

If you are here, you are interested in building a secure web application that can scale from development to production. This is not a project about any one language, it's about the process of taking a something from idea to fully realized product.

# Project Overview
Thanks to `Docker` we can develop and maintain a full stack web application and do so securely without installing everything on our *host* computer (more on that later).

We will first put a good deal of effort into configuring and hardening the four main elements of our web stack: (1) an `Apache` server, (2) a `PHP-FPM` interpreter, (3) a `MariaDB` database, and (4) a `PHPMyAdmin` GUI for that database (this will only be used as needed and is therefore more of a tool than a part of the stack). Once we have these *containers* suitably running, we will use them to develop a web-based project.

The high level overview of the web application itself is a three-tiered user platform: (1) an admin-only analytics dashboard, (2) a creators dashboard for uploading content, and (3) a users site for non-creators to like, follow, and discuss the creators' content. 

The web application should be treated more like a sandbox of learning. We will try to expand and improve it as we get more advanced. 

## Why Shape Creations?
The title of my particular project is of course Shape Creations and will involve creators uploading images of shapes for other users to view, search, and interact. 

The theme of the project is expected to be unique to you but I chose shapes because you can easily generate royalty-free images of shapes in `Paint`. It's fun, easy, and G-rated.

# How to Use This Tutorial

You can of course theme your site in any way you see fit, and ultimately just use this tutorial as a reference for the technical bits. If you choose to follow along though, great! 

The source code for this project will evolve with the project. You will find all the files and folders necessary to build your own project except of course the "secrets" and other sensitive material that must be generated and maintained separately.

## Quick Links to Modules

All tutorial walkthroughs can be found in the [docs/](./docs/) folder within the root repository. These in-depth markdown files will be your resource and guide especially when it comes to the custom configurations and secrets management. 

The documentation is organized in numbered Modules folders with several sub-numbered Sections inside. For example Module 0 Section 0 can be found in file `./docs/0-Getting-Started/0.0-Project-Overview` 

#### Jump to a Module:

- [0-Getting-Started](./docs/0-Getting-Started)
- [1-Secure-Configuration](./docs/1-Dockerizing)

# Updates Log
I will attempt to keep a running log of updates in the [UPDATES.md](UPDATES.md) file when tutorial sections or code has been edited or expanded upon.

# Future Log

Ideas for future code implementations can be found in the [FUTURE.md](FUTURE.md) file and will be gradually be checked off as improvements are made. 

# TLDR; Makefile

For the truly impatient or those who simply wish to tinker with the fully developed project, I will eventually include a `Makefile` that builds the base project in its entirety. This will be added at a later date.

**\*Coming Soon!\***

---