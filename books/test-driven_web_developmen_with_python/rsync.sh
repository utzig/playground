#!/bin/bash

rsync -az -vv --delete-excluded . utzig@utzig.org:/srv/http/superlists.utzig.org/source
rsync -az -vv --delete-excluded ../database/ utzig@utzig.org:/srv/http/superlists.utzig.org/database
