---
title: UPDATES
description: A development update log for ShapeCreations. Currently manually edited with automation slated for future.
created: 2023/06/08 04:43:18
Last modified: 2023/07/08 14:42:17
tags: [updates, log, shapecreation]
status: in-progress
---

# Updates Log

### June 8th, 2023

- Docker configurations for Apache, PHP, and MariaDB correctly serve index.php and passed a `PDO` database request test.
- PHPMyAdmin may be run limitedly but requires additional configuration each time a container is run to map the correct MariaDB host which changes every time that container is stopped and restarted.

### July 7th, 2023

- Updated all `dockerfiles` so that they do not contain redundant `ARG` declarations. I learned that you do not need to re-declare ARGs after every layer (oops!).
- Used new `--chown=<permissions>` command within `COPY` instructions to change permissions to non-root users. 
- Diligently commented each `dockerfile` for better documentation of process when away from code for long periods of time (like school semesters).
- Learned the differences between the `ENTRYPOINT` and `CMD` instructions. Updated all containers to use `ENTRYPOINT` to avoid unsecure `docker run` modifications.
- In the`php-fpm.dockerfile`, the `ADD` command installing the `install-php-extensions` command was outdated an unsecure. This was switched to a `COPY curl` statement which uses a direct execution of the command rather than installing it. 
- Configured XDebug to work with VS Code.