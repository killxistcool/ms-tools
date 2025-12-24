#!/bin/bash
# clear rblx cache
sudo rm -rf ~/Library/Caches/com.roblox.*
sudo rm -rf ~/Library/Logs/Roblox
# reinstall macsploit
cd ~/ && curl -s "https://git.raptor.fun/main/install.sh" | bash </dev/tty
