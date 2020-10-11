#!/bin/sh
#
# $> ssh server.k3s.logic-refinery.io sudo cat /var/lib/rancher/k3s/server/node-token > .secrets/server-token
# $> ssh agent1.k3s.logic-refinery.io "sudo K3S_URL=https://$(terraform output -json k3s | jq --raw-output .server.private_ip):6443 K3S_TOKEN=$(cat .secrets/server-token) bash -s" -- < ./scripts/install-agent.sh

curl -sfL https://get.k3s.io | sh -
