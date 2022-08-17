#!/bin/bash
sudo su -
sed -i "s/#Port 22/Port 22/g" /etc/ssh/sshd_config          
systemctl restart sshd                                       
yum install -y httpd
systemctl start httpd
systemctl enable httpd
cat > /var/www/html/index.html <<EOF
Jenkins Test
EOF

sudo yum install -y firewalld
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd-add-port=80/tcp --permanent
