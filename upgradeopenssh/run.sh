#!/bin/bash
yum install git
cd /usr/local/src
git clone https://github.com/xcdsycn/tools.git
cd tools/upgradeopenssh
chmod a+x upgrateubuntu.sh

./upgrateubuntu.sh
