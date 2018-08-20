#!/bin/bash
set -e

# This generates host keys that don't already exist.
# You are recommended to mount persistent keys in /etc/ssh/.
/usr/bin/ssh-keygen -A
exec "$@"
