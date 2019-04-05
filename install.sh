#!/bin/sh

echo "[1/7] Installing Java 8..."
apt install openjdk-8-jre

echo "[2/7] Setting install location for service to $PWD"
sed -i "s@INSTALL_LOCATION@${PWD}@g" EndCycleService.service

echo "[3/7] Installing service file to /etc/systemd/system/"
cp -i EndCycleService.service /etc/systemd/system/

echo "[4/7] Restoring service location..."
git checkout EndCycleService.service

echo "[5/7] Updating game properties..."

info_correct=""
while [[ $info_correct != [yY] && $info_correct != [yY][eE][sS] ]]; do
read -p "	Server Name: " server_name
read -p "	Server IP: " server_ip

while [[ $info_correct != [yY] && $info_correct != [yY][eE][sS] && $info_correct != [nN] && $info_correct != [nN][oO] ]]; do
read -p "	Is this info correct? " info_correct
done

done

sed -i "s@Server\.Ip=.*@Server\.Ip=${server_ip}@g" assets/game.properties
sed -i "s@Server\.Name=.*@Server\.Name=${server_name}@g" assets/game.properties

echo "[6/7] Starting service..."
systemctl daemon-reload
systemctl start EndCycleService.service

echo "[7/7] Adding service to boot..."
systemctl enable EndCycleService.service

echo "Installation finished!"
