# Network Deauth Tool v2.1

## Table of Contents

- [Project Title](#project-title)
- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Dependencies](#dependencies)
- [Configuration](#configuration)
- [Documentation](#documentation)
- [Examples](#examples)
- [Troubleshooting](#troubleshooting)
- [Contributors](#contributors)
- [License](#license)

---

## Project Title

**Network Deauth Tool v2.1**

---

## Introduction

The **Network Deauth Tool v2.1** is a script designed to automate the process of performing a **deauthentication attack** on a nearby Wi-Fi network. The tool leverages the `aircrack-ng` suite to execute the attack, which involves forcing connected devices to disconnect from the Wi-Fi network. This script provides a user-friendly interface to initiate the attack with minimal input.

**⚠️ Disclaimer:** This tool is meant for educational purposes only. It is your responsibility to use it in a legal and ethical manner. The creator is not responsible for any misuse of this tool.

---

## Installation

1. **Install aircrack-ng suite**:
   - Run the following command to install the required dependencies:
     ```bash
     sudo apt-get install aircrack-ng
     sudo apt update -y
     ```

2. **Make the script executable**:
   - Save the script as a `.sh` file (e.g., `deauth_tool.sh`).
   - Make the script executable:
     ```bash
     chmod +x deauth_tool.sh
     ```

3. **Run the script**:
   - Execute the script with the following command:
     ```bash
     ./deauth_tool.sh
     ```

---

## Usage

1. **Launch the Script**:
   - When you run the script, it will display an ASCII banner and provide the necessary instructions.

2. **Network Interface Selection**:
   - The script will prompt you to choose the network card interface for scanning.
   - Use `ifconfig` to list available network interfaces and select the appropriate one.

3. **Target Selection**:
   - The script will display a list of nearby networks.
   - You will be asked to input the BSSID (target network) and the channel on which the network operates.

4. **Deauthentication Attack**:
   - Once you've selected the target, the script will initiate the deauthentication attack on the specified BSSID.
   - The attack will continue until you manually stop it (Ctrl+C).

---

## Features

- **Automatic Setup**: Installs the required dependencies (`aircrack-ng`) automatically.
- **Network Scanning**: Allows you to scan for nearby networks.
- **User-Friendly Interface**: Simple prompts guide the user through the process of selecting a network and initiating the attack.
- **Deauthentication Attack**: Performs a continuous deauthentication attack on the selected Wi-Fi network.
- **Real-Time Feedback**: Displays updates and status during the attack.

---

## Dependencies

- `aircrack-ng`: A suite of tools for Wi-Fi network security testing, required to perform the deauthentication attack.

---

## Configuration

No specific configuration is required. However, ensure that you have a compatible Wi-Fi card that supports monitor mode for network scanning and packet injection.

---

## Documentation

The script provides inline comments and basic instructions to guide users through the setup process. The primary steps involve selecting a network interface, scanning for networks, and selecting a target to launch the deauthentication attack.

---

## Examples

1. **Run the Script**:
   ```bash
   ./deauth_tool.sh
   ```

2. **Network Card Selection**:
   The script will prompt you to select the network card for scanning:
   ```bash
   🔧 Enter your Net Card's name : wlan0
   ```

3. **Network Scanning**:
   The script will display available networks:
   ```bash
   Scanning Networks....
   ```

4. **Target Selection**:
   Enter the BSSID and channel for the attack:
   ```bash
   🎯 Enter Target BSSID: 00:14:22:01:23:45
   📡 Enter Target Channel: 6
   ```

5. **Launch Attack**:
   Once the attack starts, it will display:
   ```bash
   💥 Starting the deauth attack on BSSID '00:14:22:01:23:45' on channel '6' ..
   Press (Ctrl+C) to stop
   ```

---

## Troubleshooting

1. **No Network Interface Detected**:
   - Make sure your Wi-Fi card is connected and supports monitor mode.
   - Use the `ifconfig` command to check available interfaces.

2. **Script Doesn't Start**:
   - Ensure the script has execute permissions:
     ```bash
     chmod +x deauth_tool.sh
     ```

3. **Deauthentication Attack Fails**:
   - Double-check the BSSID and channel. If the wrong channel is selected, the attack may fail.
   - Ensure that the Wi-Fi card supports packet injection.

---

## Contributors

- **RAEF**: Creator of the script.

---

## License

This project is provided under the **MIT License**. See the LICENSE file for details.

---

**Note**: Always ensure that you are authorized to test networks before using this tool. Unauthorized access to computer networks is illegal and punishable by law.
