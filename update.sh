#!/bin/sh

echo "[1/2] Pulling data..."
git pull
echo "[2/2] Restarting EndCycle process..."
systemctl restart EndCycleService.service
echo "Done!"
