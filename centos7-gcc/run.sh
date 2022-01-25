#! /usr/bin/env bash
sh run_sshd.sh

# run front-end yourself here
# python -m SimpleHTTPServer
source /opt/rh/devtoolset-8/enable
tail -f /dev/null