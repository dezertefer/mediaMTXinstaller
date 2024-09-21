# MediaMTX Installation Script

This repository contains a simple shell script to automate the installation of MediaMTX on a Linux system.

## Overview

MediaMTX is a highly configurable media server. This script downloads the MediaMTX binary, extracts it, sets it up as a service using `systemd`, and configures it to run at startup.

## Installation Steps

### Prerequisites

Before running the script, ensure you have the following:

- A Linux-based system (ARMv7 architecture).
- `wget` and `tar` installed.
- Root or sudo access.

### Instructions

1. **Clone or download the script:**

   ```bash
   git clone https://github.com/dezertefer/mediaMTXinstaller.git
   ```

   Or download the `install_mediamtx.sh` script directly.

2. **Make the script executable:**

   After downloading the script, change the permission to make it executable:

   ```bash
   chmod +x install_mediamtx.sh
   ```

3. **Run the script:**

   Execute the script to install MediaMTX:

   ```bash
   ./install_mediamtx.sh
   ```

   The script will perform the following actions:
   - Download the MediaMTX binary.
   - Extract the binary and configuration files.
   - Move the binary to `/usr/local/bin/` and the configuration file to `/usr/local/etc/`.
   - Create a `systemd` service for MediaMTX to ensure it starts at boot.
   - Enable and start the MediaMTX service.
   - Reboot the system after installation.

### Post-Installation

After rebooting, MediaMTX should automatically run as a background service.

To verify the service status, run:

```bash
sudo systemctl status mediamtx
```

You can start, stop, or restart the service using the following commands:

- **Start the service:**

  ```bash
  sudo systemctl start mediamtx
  ```

- **Stop the service:**

  ```bash
  sudo systemctl stop mediamtx
  ```

- **Restart the service:**

  ```bash
  sudo systemctl restart mediamtx
  ```

### Customization

To customize the MediaMTX configuration, edit the YAML file located at `/usr/local/etc/mediamtx.yml` using your preferred text editor:

```bash
sudo nano /usr/local/etc/mediamtx.yml
```

After making changes to the configuration file, restart the service to apply the new settings:

```bash
sudo systemctl restart mediamtx
```


### Additional Notes

Feel free to reach out if you need assistance with modifications or further customization.

