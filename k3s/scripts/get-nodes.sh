#!/bin/sh
#
# $> ssh server.k3s.logic-refinery.io 'sudo bash -s' -- < ./scripts/install-serer.sh
#

ssh server.k3s.logic-refinery.io 'sudo bash -c "kubectl get nodes"'
