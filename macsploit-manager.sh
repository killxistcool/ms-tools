#!/bin/bash

echo "Removing MacSploit..."
rm -rf "/Applications/MacSploit.app"
rm -rf ~/Library/Application\ Support/MacSploit
rm -rf ~/Library/Saved\ Application\ State/com.macsploit.*
rm -rf ~/Library/Preferences/com.macsploit.*

echo "Deleting Roblox..."
rm -rf "/Applications/Roblox.app"
rm -rf ~/Library/Application\ Support/Roblox
rm -rf ~/Library/Preferences/com.roblox.*
rm -rf ~/Library/Saved\ Application\ State/com.roblox.*
rm -rf ~/Library/Logs/Roblox

echo "Installing Roblox..."
curl -L -s -o /tmp/Roblox.dmg "https://setup.rbxcdn.com/mac/Roblox.dmg"
hdiutil attach /tmp/Roblox.dmg -nobrowse -quiet
cp -a /Volumes/Roblox/Roblox.app /Applications/
hdiutil detach /Volumes/Roblox -quiet
rm /tmp/Roblox.dmg

read -p "Do you want to open Roblox? (y/n) " choice
case "$choice" in 
  y|Y ) 
    echo "Launching Roblox..."
    open /Applications/Roblox.app
    ;;
  n|N ) 
    ;;
  * ) 
    ;;
esac

echo "MacSploit has been removed from your device, and Roblox has been successfully reinstalled."
