---
title: UPDATES
description: A development update log for ShapeCreations. Currently manually edited with automation slated for future.
created: 2023/06/08 04:43:18
Last modified: 2023/06/09 02:29:32
---

# Updates Log

### June 8th, 2023

- Docker configurations for Apache, PHP, and MariaDB correctly serve index.php and passed a `PDO` database request test.
- PHPMyAdmin may be run limitedly but requires additional configuration each time a container is run to map the correct MariaDB host which changes every time that container is stopped and restarted.