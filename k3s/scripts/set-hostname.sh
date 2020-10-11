#!/bin/sh
#
# $> ssh server.k3s.logic-refinery.io 'sudo bash -s' -- < ./scripts/set-hostname.sh server
# $> ssh agent1.k3s.logic-refinery.io 'sudo bash -s' -- < ./scripts/set-hostname.sh agent1
#

hostnamectl set-hostname $1
reboot
