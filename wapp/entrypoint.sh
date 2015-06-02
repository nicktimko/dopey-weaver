#!/bin/bash
set -e

#if [ "$#" -eq 0 ]; then
#    exec python manage.py --help
#fi

if [ "$1" = 'dj' ]; then
    shift
    exec python manage.py "$@"
fi

exec "$@"
