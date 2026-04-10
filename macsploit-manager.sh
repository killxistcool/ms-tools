#!/bin/bash

echo "Deleting MacSploit..."
rm -rf "/Applications/MacSploit.app"
rm -rf ~/Library/Application\ Support/MacSploit
rm -rf ~/Library/Saved\ Application\ State/com.macsploit.*
rm -rf ~/Library/Preferences/com.macsploit.*
sleep 1

echo "Deleting Roblox..."
rm -rf "/Applications/Roblox.app"
rm -rf ~/Library/Application\ Support/Roblox
rm -rf ~/Library/Preferences/com.roblox.*
rm -rf ~/Library/Saved\ Application\ State/com.roblox.*
rm -rf ~/Library/Logs/Roblox
sleep 1

echo "Downloading Roblox..."
curl -L -s -o /tmp/Roblox.dmg "https://setup.rbxcdn.com/mac/Roblox.dmg"

echo "Installing Roblox..."
hdiutil attach /tmp/Roblox.dmg -nobrowse -quiet
sleep 3

cp -a /Volumes/Roblox*/Roblox*.app /Applications/

hdiutil detach /Volumes/Roblox* -quiet 2>/dev/null
rm /tmp/Roblox.dmg
sleep 1

echo ""
read -p "Do you want to open Roblox now? (y/n) " choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    echo "Launching Roblox..."
    open /Applications/Roblox*.app
fi

clear
echo "MacSploit has been deleted and Roblox has been reinstalled."
