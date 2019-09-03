#! /bin/bash

yum update -y
yum install git -y

sed -i s'/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i s'/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
service sshd restart
passwd

echo "Enter name for this host"
read node
sed '1d' /etc/hostname
echo $node > /etc/hostname
reboot

