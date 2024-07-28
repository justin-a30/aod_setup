#!/bin/bash
LOCATION=$(find $HOME -name 'aod_setup')
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
   7z a ModdedXGoodies-version"$VER".zip $LOCATION/module/*
ZIP=$(find $LOCATION -name 'ModdedXGoodies*.zip')
CL=$(cat "$LOCATION/changelog.md")
BOT_TOKEN="7332398652:AAFEDgp3wrQFD-_X7vzAKiTgzy16CRUB5jU"
CHAT_ID="-1002059105712"
FILE_TO_SEND="$ZIP"
TEXT_TO_SEND="$CL"

curl -4 -s -S -L -w"\n" -o- \
    -F document=@"${FILE_TO_SEND}" \
    -F parse_mode='Markdown' \
    -F caption="${TEXT_TO_SEND}" \
    -X POST https://api.telegram.org/bot${BOT_TOKEN}/sendDocument \
    -F chat_id="${CHAT_ID}"