#!/bin/bash
rsync --delete -re "ssh -p2230" $1 web@auv.informatik.uni-bremen.de:/home/web/www/mars/
