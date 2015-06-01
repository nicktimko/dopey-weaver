#!/usr/bin/env python
import os
import sys

import time
time.sleep(4) # TODO: fix this dirty hack to let the database start up

if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "myapp.settings")

    from django.core.management import execute_from_command_line

    execute_from_command_line(sys.argv)
