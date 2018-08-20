# docker-autopostgresqlbackup

Alpine-based Docker that includes OpenSSH and autopostgresqlbackup script.

The `autopostgresqlbackup` script was taken from 
[Debian](https://packages.debian.org/stretch/autopostgresqlbackup) and not its home at [SourceForge](https://sourceforge.net/projects/autopgsqlbackup/)
because the Deb version has sensible improvements, such as commenting out some example configurations, and loading settings from `/etc/default/autopostgresqlbackup`.

Key environment variables:

* `DBHOST`: hostname of PostgreSQL server
* `USERNAME`: PostgreSQL username
* `DBPASS`: PostgreSQL password
* `DBNAMES`: space-separated list of DBs to back up (omit to back up everything)

See `backup-postgresql` for a more complete list of variables.

You should mount these files from somewhere persistent:

* `/root/.ssh/authorized_keys`
* `/etc/ssh/ssh_host_dsa_key`
* `/etc/ssh/ssh_host_dsa_key.pub`
* `/etc/ssh/ssh_host_ecdsa_key`
* `/etc/ssh/ssh_host_ecdsa_key.pub`
* `/etc/ssh/ssh_host_ed25519_key`
* `/etc/ssh/ssh_host_ed25519_key.pub`
* `/etc/ssh/ssh_host_rsa_key`
* `/etc/ssh/ssh_host_rsa_key.pub`
