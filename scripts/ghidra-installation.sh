#!/bin/bash

echo "This guide is to install Ghidra version 11.3 released on 2-6-2025."

# Download Ghidra
curl -L https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_11.3_build/ghidra_11.3_PUBLIC_20250205.zip -o ghidra-11.3.zip

echo "Downloading the JDK..."

# Download JDK
curl -L https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.6%2B7/OpenJDK21U-jre_x64_linux_hotspot_21.0.6_7.tar.gz -o openJDK-21.tar.gz

# Create tools directory if not exist
mkdir -p ~/Documents/tools

# Move downloaded files
mv ghidra-11.3.zip openJDK-21.tar.gz ~/Documents/tools/

# Extract Ghidra
unzip ~/Documents/tools/ghidra-11.3.zip -d ~/Documents/tools/
mv ~/Documents/tools/ghidra_11.3_PUBLIC ~/Documents/tools/ghidra

# Extract JDK
tar -xvf ~/Documents/tools/openJDK-21.tar.gz -C ~/Documents/tools/
mv ~/Documents/tools/jdk-21* ~/Documents/tools/jdk

# Remove downloaded archives
rm -rf ~/Documents/tools/ghidra-11.3.zip ~/Documents/tools/openJDK-21.tar.gz

# Add environment variables
echo 'export PATH=$HOME/Documents/tools/jdk/bin:$PATH' >> ~/.zshrc
echo 'export PATH=$HOME/Documents/tools/ghidra:$PATH' >> ~/.zshrc
echo 'alias ghidra=ghidraRun' >> ~/.zshrc

echo "Installation complete. Restart your terminal or run 'source ~/.zshrc' to apply changes."
