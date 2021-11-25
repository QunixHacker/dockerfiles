#! /usr/bin/env bash
/usr/bin/ssh-keygen -A >/dev/null
/usr/sbin/sshd -D &