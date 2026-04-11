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
if ! curl -L -s -o /tmp/Roblox.dmg "https://setup.rbxcdn.com/mac/Roblox.dmg"; then
    echo "Failed to doanload Roblox."
    exit 1
fi

echo "Installing Roblox..."
if ! hdiutil attach /tmp/Roblox.dmg -nobrowse -quiet; then
    echo "Failed to mount Roblox disk image."
    rm -f /tmp/Roblox.dmg
    exit 1
fi

sleep 3

if [ -d "/Volumes/Roblox" ]; then
    cp -a "/Volumes/Roblox/Roblox.app" /Applications/
elif ls /Volumes/Roblox* >/dev/null 2>&1; then
    cp -a /Volumes/Roblox*/Roblox*.app /Applications/
else
    echo "Could not find Roblox app in muonted volume."
    hdiutil detach /Volumes/Roblox* -quiet 2>/dev/null
    rm -f /tmp/Roblox.dmg
    exit 1
fi

hdiutil detach /Volumes/Roblox* -quiet 2>/dev/null
rm -f /tmp/Roblox.dmg
sleep 1

clear

echo ""
read -p "Do you want to open Roblox now? (y/n) " choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    echo "Launching Roblox..."
    open /Applications/Roblox.app
fi

echo ""
echo "MacSploit has been deleted and Roblox has been reinstalled."
