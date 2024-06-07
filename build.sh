#!/bin/bash
echo "Module Builder"
question="Do you want to build a local module now? (y/N)"
    read -r -p "$question" answer

    case $answer in
      [Yy])
        echo "Continuing..."
        LOCATION=$(sudo find $HOME -name 'aod_setup')
        VER=$(cat "$LOCATION/version")
        echo "Current folder location: $LOCATION"
        echo "Current module version: $VER"
        echo "Checking if p7zip (7z) executable exist"
            if command -v 7z >/dev/null 2>&1; then
                echo "7z found in $(command -v 7z)"
            else
                echo "7z not found in system locations. Please install it in your distro (p7zip)"
                exit 1
            fi
        echo "Zipping folder by p7zip (7z)"
        7z a ModdedXGoodies-version$VER.zip $LOCATION/module/*
        ;;
      [Nn]*)  # Handle cases where user enters N, n, or nothing
        echo "Cancelled."
        exit 0  # Exit the script with success code 0
        ;;
      *)
        echo "Invalid input. Please enter 'y' or 'n'."
        exit 1  # Exit the script with error code 1
        ;;
    esac