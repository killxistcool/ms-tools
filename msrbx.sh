#!/bin/bash
# clear rblx cache
echo "Clearing Roblox Chache..."
sudo rm -rf ~/Library/Caches/com.roblox.*
sudo rm -rf ~/Library/Logs/Roblox
# reinstall macsploit
echo "Reinstalling MacSploit..."
cd ~/ && curl -s "https://git.raptor.fun/main/install.sh" | bash </dev/tty
echo "Successfully Roblox Cache and Reinstalled MacSploit."
