---
title: UPDATES
description: "A development update log for ShapeCreations. Currently manually edited with automation slated for future."
created: Thursday, 06-08-2023 04:43
modified: Tuesday, 07-11-2023 15:30
tags: [updates, log, shapecreation]
status: in-progress
---

# Update

### Monday, 06-10-2023 15:28

- Removed `context` attribute from `build` definition in `docker-compose.yml`.
- Refactored the directory structure, especially within the context of the Docker phase of the project. All folders related to the Docker configuration have been put into the high-level `.docker` folder: i.e., `config`, `db`, `dockerfile`, `security`. The leading `.` has been removed from all of these folders. I have also updated the paths in the `.env` file which takes care of all the configurations files using said path variables. Finally, the `.dockerignore` and `.gitignore` files have been updated as well.

### Sunday 06-09-2023 15:28

- Renamed `.env.example` to `example.env` in order to preserve syntax highlighting. Needed to install and enable the [ENV](https://marketplace.visualstudio.com/items?itemName=IronGeek.vscode-env) extension from the VS Code Marketplace. 
- Changed the `USER` instruction value in `apache.dockerfile` and `php-fpm.dockerfile`from ${USER}:${GROUP} to ${UID}:${UID}. Prior to this, `docker inspect CONTAINER` revealed that the ${USER} variable was being ignored. The host user was being used instead.
- Refactored access to environmental variables for each container. Previously, every container had access to the global `.env` file granting them access to irrelevant information. Now, the global `.env` file is used by `docker-compose.yml` only and each environment variable was assigned using the `environments` attribute. Now each container only has access to the variables that it uses within their configuration files.

### Saturday, 07-08-2023 14:46

- Docker configurations for Apache, PHP, and MariaDB correctly serve index.php and passed a `PDO` database request test.
- PHPMyAdmin may be run limitedly but requires additional configuration each time a container is run to map the correct MariaDB host which changes every time that container is stopped and restarted.

### Friday, 07-06-2023 18:45

- Updated all `dockerfiles` so that they do not contain redundant `ARG` declarations. I learned that you do not need to re-declare ARGs after every layer (oops!).
- Used new `--chown=<permissions>` command within `COPY` instructions to change permissions to non-root users. 
- Diligently commented each `dockerfile` for better documentation of process when away from code for long periods of time (like school semesters).
- Learned the differences between the `ENTRYPOINT` and `CMD` instructions. Updated all containers to use `ENTRYPOINT` to avoid unsecure `docker run` modifications.
- In the`php-fpm.dockerfile`, the `ADD` command installing the `install-php-extensions` command was outdated an unsecure. This was switched to a `COPY curl` statement which uses a direct execution of the command rather than installing it. 
- Configured XDebug to work with VS Code.
