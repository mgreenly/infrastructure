
SETUP

```
$> ssh server.k3s.logic-refinery.io 'sudo bash -s' -- < ./scripts/set-hostname.sh server
$> ssh agent1.k3s.logic-refinery.io 'sudo bash -s' -- < ./scripts/set-hostname.sh agent1
```

Enabling legacy iptables

sudo iptables -F
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
sudo reboot
