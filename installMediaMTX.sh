#!/bin/bash

# Step 1: Download MediaMTX
echo "Downloading MediaMTX..."
wget https://github.com/bluenviron/mediamtx/releases/download/v1.6.0/mediamtx_v1.6.0_linux_armv7.tar.gz

# Step 2: Extract the downloaded archive
echo "Extracting MediaMTX..."
tar -xzf mediamtx_v1.6.0_linux_armv7.tar.gz --one-top-level

# Step 3: Rename the extracted folder and clean up the archive
echo "Renaming folder and cleaning up..."
mv mediamtx_v1.6.0_linux_armv7 mediamtx
rm mediamtx_v1.6.0_linux_armv7.tar.gz

# Step 4: Move the binary and configuration file to their respective directories
echo "Moving files to system directories..."
cd mediamtx
sudo mv mediamtx /usr/local/bin/
sudo mv mediamtx.yml /usr/local/etc/

# Step 5: Create a systemd service for MediaMTX
echo "Creating systemd service for MediaMTX..."
sudo tee /etc/systemd/system/mediamtx.service >/dev/null << EOF
[Unit]
Wants=network.target
[Service]
ExecStart=/usr/local/bin/mediamtx /usr/local/etc/mediamtx.yml
[Install]
WantedBy=multi-user.target
EOF

# Step 6: Enable and start the MediaMTX service
echo "Enabling and starting the MediaMTX service..."
sudo systemctl daemon-reload
sudo systemctl enable mediamtx
sudo systemctl start mediamtx

# Step 7: Reboot the system
echo "Rebooting the system..."
sudo reboot
