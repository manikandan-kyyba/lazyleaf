
10.6.0.2

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:wireguard/wireguard
sudo apt-get update
sudo apt-get install wireguard


(umask 077 && printf "[Interface]\nPrivateKey = " | sudo tee /etc/wireguard/wg0.conf > /dev/null)

wg genkey | sudo tee -a /etc/wireguard/wg0.conf | wg pubkey | sudo tee /etc/wireguard/publickey

sudo nano /etc/wireguard/wg0.conf -> 6.00 video seek
     
     Server: 
                PrivateKey = **
                ListenPort = 55107
                Address = 10.0.0.6
                [Peer]
                PublicKey = yKqmJw9HJGett6CIYgHBPUwLWycqXjCcJ4NtMuLICWU=
                AllowedIPs = 192.168.29.15/32

    Client:
                PrivateKey = **
                Address = 192.168.29.15

                [Peer]
                PublicKey = uq6NmfnuQABTtFF1axgtahsUXs192QYhL/JkTFD1RTY=
                AllowedIPs = 10.0.0.6/32
                Endpoint = 152.67.165.182:55107
                PersistentKeepalive = 25

sudo nano /etc/sysctl.conf

sudo sysctl -p

sudo sysctl --system

sudo systemctl start wg-quick@wg0

sudo systemctl enable wg-quick@wg0

sudo systemctl status wg-quick@wg0

sudo systemctl restart wg-quick@wg0

ping ip

ip a

curl -L https://install.pivpn.io | bash


iptables -P FORWARD DROP

iptables -A FORWARD -i ens3 -o wg0 -p tcp --syn --dport 80 -m conntrack --ctstate NEW -j ACCEPT
iptables -A FORWARD -i ens3 -o wg0 -p tcp --syn --dport 443 -m conntrack --ctstate NEW -j ACCEPT

iptables -A FORWARD -i ens3 -o wg0 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i wg0 -o ens3 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT


# SYNTAX
iptables -t nat -A PREROUTING -i ens3 -p tcp --dport 80 -j DNAT --to-destination 192.168.4.2
iptables -t nat -A PREROUTING -i ens3 -p tcp --dport 443 -j DNAT --to-destination 192.168.4.2

iptables -t nat -A POSTROUTING -o wg0 -p tcp --dport 80 -d 192.168.4.2 -j SNAT --to-source 192.168.4.1
iptables -t nat -A POSTROUTING -o wg0 -p tcp --dport 443 -d 192.168.4.2 -j SNAT --to-source 192.168.4.1
#

iptables -t nat -A PREROUTING -i ens3 -p tcp --dport 80 -j DNAT --to-destination 10.6.0.2
iptables -t nat -A PREROUTING -i ens3 -p tcp --dport 443 -j DNAT --to-destination 10.6.0.2

iptables -t nat -A POSTROUTING -o wg0 -p tcp --dport 80 -d 10.6.0.2 -j SNAT --to-source 10.6.0.1
iptables -t nat -A POSTROUTING -o wg0 -p tcp --dport 443 -d 10.6.0.2 -j SNAT --to-source 10.6.0.1

sudo apt-get install netfilter-persistent

netfilter-persistent save

systemctl enable netfilter-persistent

systemctl restart netfilter-persistent

apt-get install iptables-persistent

sudo nano /etc/iptables/rules.v4





https://www.sigmdel.ca/michel/ha/wireguard/wireguard_02_en.html#installing_wg_raspbian

https://engineerworkshop.com/blog/how-to-set-up-wireguard-on-a-raspberry-pi/
https://www.wundertech.net/how-to-connect-a-raspberry-pi-to-a-wireguard-vpn-server/


Rp4 public key aVHXVwMvL4zJKfVTEcA4PiTMfAojn3UBJN5L6jp4fGM=         +Hg

Oracle Cloud Public Key: uq6NmfnuQABTtFF1axgtahsUXs192QYhL/JkTFD1RTY=        zNX

