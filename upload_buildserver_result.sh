#!/bin/bash
rsync --delete -re "ssh -p2230" /data/chroots/14.04_amd64/data/jenkins/workspace/workspace/Mars-Homepage-Generation/Flavor/master/node/Ubuntu_LTS/api/ web@auv.informatik.uni-bremen.de:/home/web/www/mars/
