#!/bin/bash

echo "###############################################################"
echo "#                  Neon Community - ScpSL                     #"
echo "###############################################################"

# Install dependencies
apt-get update && apt-get install -y unzip libicu-dev lib32gcc-s1 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Remove old binaries and any potential leftovers
rm -rf /mnt/server/.bin
mkdir -p /mnt/server/.bin/SteamCMD
cd /mnt/server/.bin/SteamCMD

# Download SteamCMD
curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxf -

# Download SCP:Secret Laboratory Dedicated Server (with reduced output)
./steamcmd.sh +force_install_dir /mnt/server/ +login anonymous +app_update 996560 -beta "$BETA_NAME" $( [ "$BETA_PASSWORD" != "none" ] && echo "-betapassword $BETA_PASSWORD" ) validate +quit

# Remove installation files and temporary files that might have been created
rm -rf /mnt/server/.bin/SteamCMD
rm -rf /tmp/dumps
rm -rf /root/Steam

echo "###############################################################"
echo "#                   Installation completed!                   #"
echo "###############################################################"
