#!/bin/bash
sudo su -
sudo sed -i "s/#Port 22/Port 22/g" /etc/ssh/sshd_config          
sudo systemctl restart sshd                                       
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo cat > /var/www/html/index.html <<EOF
Jenkins Test
EOF

sudo yum install -y firewalld
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd-add-port=80/tcp --permanent
