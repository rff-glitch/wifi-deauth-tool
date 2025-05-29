# Network Deauth Tool v3.2 📡💥

> **A powerful automation tool to perform deauthentication attacks on Wi-Fi networks using Aircrack-ng.**  
> _⚠️ Disclaimer: Use responsibly! The author is not responsible for any misuse of this tool._  
> _Developed by **RAEF**_  

---

## Table of Contents 📑
- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Disclaimer ⚠️](#disclaimer-⚠️)
- [Contact](#contact)
- [License](#license)

---

## Introduction 🛠️

This script automates the process of performing a **deauthentication attack** on a nearby Wi-Fi network using the **Aircrack-ng suite**. It's built to be simple, efficient, and user-friendly, with a few lines of code to handle complex tasks! 😎

---

## Features ✨

- **Automated Deauthentication**: Easily target and disrupt specific Wi-Fi networks with minimal interaction.
- **Network Scanning**: Quickly detect available Wi-Fi networks in range.
- **Intuitive Interface**: With emojis and color-coded output for better user experience! 
- **Built on Aircrack-ng Tools**: Leverage well-known tools like `airmon-ng`, `airodump-ng`, and `aireplay-ng` for maximum compatibility and power.
- **Cross-platform**: Works on Linux systems with proper setup. 🐧

---

## Installation ⚙️

To get started, make sure you have **Aircrack-ng** installed. If not, use the following commands:

```bash
sudo apt update -y
sudo apt install -y aircrack-ng
```

Once installed, simply run the script:

```bash
bash <script_name>.sh
```

---

## Usage 🚀

1. **Launch the script** by executing it in your terminal.
2. **Select your network card** (this is required to start the attack).
3. **Scan for Wi-Fi networks** to find the one you want to target.
4. **Choose the target network** from the list.
5. **Start the deauthentication attack** on the selected network!

You will see output like this:

```bash
💥 Starting the deauth attack on '<SSID>' (<BSSID>) ... Ctrl+C to stop.
```

Use **Ctrl+C** to stop the attack at any time.

---

## Disclaimer ⚠️

**⚠️ WARNING: This tool is for educational and authorized testing purposes only.**  
I am **NOT** responsible for any misuse of this tool. Always have permission before testing networks.  
**By using this script, you agree to take full responsibility for your actions.**

---

## Contact ✉️

For any issues, updates, or contributions, feel free to contact me :  
**RAEF**

---

## License 📜

This script is released under the **MIT License**. Use it responsibly! 🚨
