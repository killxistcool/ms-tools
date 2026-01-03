#!/bin/bash

# clrs
red="\033[1;31m"
reset="\033[0m"

# paths
ms_app="/Applications/MacSploit.app"
ms_data="$HOME/Library/Application Support/MacSploit"
roblox_app="/Applications/Roblox.app"
roblox_data="$HOME/Library/Application Support/Roblox"

# funcs
cecho() {
    echo -e "${red}$1${reset}"
}

pause() {
    read -p "press enter to continue..."
}

get_key() {
    if [ -f "$ms_data/key" ]; then
        cat "$ms_data/key"
    elif [ -f "$ms_data/key.txt" ]; then
        cat "$ms_data/key.txt"
    else
        echo "(no key found)"
    fi
}

# main menu
while true; do
    clear
    cecho "-------------------------"
    cecho "   MacSploit Manager"
    cecho "-------------------------"
    echo
    cecho "1) Install / Uninstall"
    cecho "2) Key"
    cecho "3) Open MacSploit Folder"
    cecho "4) Help"
    cecho "5) Exit"
    echo
    read -p "$(echo -e "${red}> ${reset}")" choice

    case $choice in
        1)
            # download menu
            while true; do
                clear
                cecho "-- Install / Uninstall --"
                echo
                cecho "1) Install (native)"
                cecho "2) Install (better - By Munq)"
                cecho "3) Uninstall Macsploit & Roblox"
                cecho "0) Back"
                echo
                read -p "$(echo -e "${red}> ${reset}")" inst_choice
                
                case $inst_choice in
                    1)
                        echo
                        cecho "Running Native Installer..."
                        cd ~/ && curl -s "https://git.raptor.fun/main/install.sh" | bash </dev/tty
                        pause
                        ;;
                    2)
                        echo
                        cecho "Running Better Installer..."
                        bash <(curl -s "https://raw.githubusercontent.com/DollarNoob/Macsploit-Mirror/main/install.sh")
                        pause
                        ;;
                    3)
                        echo
                        cecho "Removing MacSploit Files..."
                        rm -rf "$ms_app"
                        rm -rf "$ms_data"
                        
                        cecho "Removing Roblox Files..."
                        rm -rf "$roblox_app"
                        rm -rf "$roblox_data"
                        
                        cecho "Opening Roblox Download..."
                        open "https://www.roblox.com/download"
                        pause
                        ;;
                    0) break ;;
                    *) cecho "Invalid Option! >:("; pause ;;
                esac
            done
            ;;
        2)
            # key menu
            while true; do
                clear
                cecho "-- Keys --"
                echo
                cecho "1) Purchase Key"
                cecho "2) Backup Key"
                cecho "3) Remove Key"
                cecho "0) Back"
                echo
                echo "----------------"
                cecho "Your Key: $(get_key)" # Don't share this btw (well idc ppl cant use it anyway cuz of hwid)
                echo "----------------"
                echo
                read -p "$(echo -e "${red}> ${reset}")" key_choice

                case $key_choice in
                    1)
                        open "https://raptor.fun"
                        ;;
                    2)
                        if [ -f "$ms_data/key" ]; then
                            cp "$ms_data/key" "$HOME/key_backup_ms.txt"
                            cecho "saved to $HOME/key_backup_ms.txt"
                        elif [ -f "$ms_data/key.txt" ]; then
                            cp "$ms_data/key.txt" "$HOME/key_backup_ms.txt"
                            cecho "saved to $HOME/key_backup_ms.txt"
                        else
                            cecho "No Key Found :c"
                        fi
                        pause
                        ;;
                    3)
                        rm "$ms_data/key" 2>/dev/null
                        rm "$ms_data/key.txt" 2>/dev/null
                        cecho "Key Removed."
                        pause
                        ;;
                    0) break ;;
                    *) cecho "Invalid Option! >:("; pause ;;
                esac
            done
            ;;
        3)
            # open folder ms
            if [ -d "$ms_data" ]; then
                open "$ms_data"
                cecho "Opened Folder."
            else
                cecho "Folder Not Found :c"
            fi
            pause
            ;;
        4)
            # help sctn
            clear
            cecho "-- Help --"
            echo
            cecho "MacSploit is a script executor developed by Nexus42."
            cecho "Discord: discord.gg/macsploit"
            echo
            pause
            ;;
        5)
            # exit
            exit 0
            ;;
        *)
            cecho "Invalid Option! >:("
            pause
            ;;
    esac
done
