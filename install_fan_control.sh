#!/bin/bash

#first stop the service in case it is already running
sudo systemctl stop fan-control

#create necessary directory structure
sudo mkdir -p /opt/gpio/fan/
sudo cp ./build/fan-control /opt/gpio/fan/
sudo cp ./build/params.conf /opt/gpio/fan/
chmod +x /opt/gpio/fan/fan-control
sudo chown root:root /opt/gpio/fan/fan-control
sudo chown root:root /opt/gpio/fan/params.conf

#start fan-control service
cp ./service/fan-control.service /etc/systemd/system/
sudo chown root:root /etc/systemd/system/fan-control.service
sudo systemctl enable fan-control
sudo systemctl start fan-control
