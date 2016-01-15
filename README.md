# dokku-luigi

luigi on dokku(dokku-alt)

## Setup

Prepare mysql to save task history.

```bash
$ dokku mariadb:create {{history_db_name}}
$ dokku mariadb:link {{app_name}} {{history_db_name}}
$ dokku mariadb:info {{app_name}} {{history_db_name}}
$ dokku config:set {{app_name}} HISTORY_DB={{history_db_MARIADB_URL}}
```

