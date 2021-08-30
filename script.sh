#!/bin/bash
sudo amazon-linux-extras install mate-desktop1.x -y
sudo bash -c 'echo PREFERRED=/usr/bin/mate-session > /etc/sysconfig/desktop'
sudo yum install tigervnc-server -y
sudo printf "hackallu\nhackallu\n\n" | vncpasswd
sudo cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@.service
sudo sed -i 's/<USER>/ec2-user/' /etc/systemd/system/vncserver@.service
sudo systemctl daemon-reload
sudo systemctl enable vncserver@:1
sudo systemctl start vncserver@:1
sudo amazon-linux-extras install epel -y
sudo yum install chromium -y -y
