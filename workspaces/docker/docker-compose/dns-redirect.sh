
# Solution 1
# echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward

# sudo iptables -A FORWARD -i eth0 -o docker0 -p tcp --syn --dport 53 -m conntrack --ctstate NEW -j ACCEPT
# sudo iptables -A FORWARD -i eth0 -o docker0 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
# sudo iptables -A FORWARD -i docker0 -o eth1 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 53 -j DNAT --to-destination 172.17.0.1

# sudo iptables -t nat -A POSTROUTING -o eth1 -p tcp --dport 53 -d 172.17.0.1 -j SNAT --to-source 10.0.2.15

# Solution 2
sudo iptables -t nat -A OUTPUT -p udp --dport 53 -j DNAT --to 172.17.0.1:53
sudo iptables -t nat -A OUTPUT -p tcp --dport 53 -j DNAT --to 172.17.0.1:53

# sudo iptables -t nat -A OUTPUT -p udp --dport 53 -j DNAT --to 8.8.8.8
# sudo iptables -t nat -A OUTPUT -p tcp --dport 53 -j DNAT --to 8.8.8.8

# NOT FINISHED!

# See URL below for remainder of port forwarding instructions.
# https://www.digitalocean.com/community/tutorials/how-to-forward-ports-through-a-linux-gateway-with-iptables
