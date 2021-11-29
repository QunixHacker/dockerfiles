#! /usr/bin/env bash
sh run_sshd.sh

which ip || true
ip a || true

python -m SimpleHTTPServer