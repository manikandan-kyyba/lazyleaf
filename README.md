# lazyleaf
made a script that automatically configures wireguard and generates server and client config files

Running the script

chmod +x wire.sh

./wire.sh

It will then ask you how many client config files are required, type and press enter, client config files will be saved in 
/client-config folder named 1.conf, 2.conf and so on

Just download config file and connect using any wireguard client

Tested only on Ubuntu 20.04 LTS(hetzner and DigitalOcean)

Mainly made it for personal use but maybe someone can find it helpful

Caution and disclaimer- only install this on a new server/VM with latest kernel as i am not responsible for anything going wrong


sudo su

wget https://raw.githubusercontent.com/manikandan-kyyba/lazyleaf/develop/wire.sh

chmod +x wire.sh

./wire.sh


https://www.youtube.com/watch?v=ISQBWd87R8U

https://www.youtube.com/results?search_query=wireguard+port+forwarding
https://www.youtube.com/watch?v=uuWzk8U4dJE
https://www.youtube.com/watch?v=5Uq0s2gLQgw
https://www.youtube.com/watch?v=9tDeh9mutmI
https://www.youtube.com/watch?v=lnYYmC-A4S0


Mani-Temp: 152.67.166.139
Server's WireGuard IPv4: 10.66.66.1
Server's WireGuard IPv6: fd42:42:42::1
Server's WireGuard port [1-65535]: 62670
First DNS resolver to use for the clients: 176.103.130.130



sudo ufw --force enable
sudo systemctl restart ufw
sudo ufw allow 51820/udp
sudo ufw allow 62670/udp
sudo ufw allow 62670/tcp


Tell me a name for the client.
The name must consist of alphanumeric character. It may also include an underscore or a dash.
Client name: mani-temp
Client's WireGuard IPv4: 10.66.66.2
Client's WireGuard IPv6: fd42:42:42::2

It is also available in /home/ubuntu/wg0-client-mani-temp.conf
If you want to add more clients, you simply need to run this script another time!



sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install software-properties-common iptables ufw resolvconf p7zip-full openssl iptables-persistent -y

sudo su
curl -O https://raw.githubusercontent.com/angristan/wireguard-install/master/wireguard-install.sh
chmod +x wireguard-install.sh
./wireguard-install.sh

