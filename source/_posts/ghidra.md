---
title: 0x06 - Ghidra Installation
tag: "0x06"
category: "dot it"
date: "2/9/2025 7:00 PM"
---

**Installing Ghidra on Kali Linux VM**

### Step 1: Download Ghidra
First, download the latest release of Ghidra from its official GitHub repository:
[https://github.com/NationalSecurityAgency/ghidra/releases](https://github.com/NationalSecurityAgency/ghidra/releases)

By default, the downloaded file will be saved in the `Downloads` directory.

### Step 2: Move and Rename the Downloaded File (Optional but Recommended)
It is recommended to move the downloaded file to a `tools` directory within the `Documents` folder or another designated location for manually installed tools. If the `tools` directory does not exist, create it:

```sh
mkdir -p ~/Documents/tools
```

Then, navigate to the `Downloads` directory and rename the Ghidra archive before moving it:

```sh
mv ~/Downloads/ghidra_xxxxx.tar.gz ~/Documents/tools/ghidra.tar.gz
```

### Step 3: Extract Ghidra
Navigate to the `tools` directory:

```sh
cd ~/Documents/tools
```

Extract the Ghidra archive and rename the extracted folder for easier reference:

```sh
tar -xvf ghidra.tar.gz
```

### Step 4: Navigate to the Ghidra Directory
Change into the renamed directory:

```sh
cd ghidra
```

Inside this directory, you will find the `ghidraRun` script, which launches the Ghidra application.

### Step 5: Install Java Development Kit (JDK) (Required for Ghidra)
Before running Ghidra, install the latest JDK from:
[https://adoptium.net/temurin/releases/?os=linux](https://adoptium.net/temurin/releases/?os=linux)

Ensure that you download the correct version based on your processor architecture (e.g., x64 for Intel or AMD processors).

Move the downloaded JDK archive to the `tools` directory and rename it for easier reference:

```sh
mv ~/Downloads/jdk-21_xxx.tar.gz ~/Documents/tools/jdk.tar.gz
cd ~/Documents/tools
```

Extract the JDK archive and rename the extracted folder:

```sh
tar -xvf jdk.tar.gz
mv jdk-21_xxx jdk
```

### Step 6: Set Environment Variables
For Kali Linux 2024.4 (or later), update the `~/.zshrc` file to include Ghidra and JDK in the system `PATH`.

Edit the file using:

```sh
nano ~/.zshrc
```

Scroll to the end of the file and add the following lines:

```sh
export PATH=/home/kali/Documents/tools/jdk/bin:$PATH
export PATH=/home/kali/Documents/tools/ghidra:$PATH
```

Save the file by pressing `CTRL + X`, then `Y`, and hit `Enter` to confirm.

### Step 7: Launch Ghidra
Reload the updated environment variables:

```sh
source ~/.zshrc
```

Start Ghidra:

```sh
./ghidraRun
```

### Step 8: Configure JDK Path (If Prompted)
If Ghidra prompts you to specify the JDK path:
1. Press `Enter` at the prompt.
2. In the navigation window, browse to `Documents` → the extracted JDK directory.
3. Click the `Open` button.

This should resolve any missing JDK issues and successfully launch Ghidra.

