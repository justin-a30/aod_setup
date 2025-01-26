#!/bin/bash
# GET PROPERTIES FUNCTION
file_getprop() { 
   grep "^$2=" "$1" | cut -d= -f2- 
   }

# GET VERSION
version=$(file_getprop module.prop versionCode)
echo "Current module version: $version"

# GET DATE
DATE=$(date +"%H%M-%d%m%Y")
echo "Time and Date right now (H:M D-M-Y): $DATE"

# CLONE OVERLAY HELPER
git clone https://github.com/justin-a30/MxGOverlayHelper.git
cp -r MxGOverlayHelper/apk_out overlay

# TAR IT
XZ_OPT=-9 tar cJf overlay.tar.xz overlay
XZ_OPT=-9 tar cJf apks.tar.xz apks

# REMOVE UNNECESSARY FILES
rm -rf MxGOverlayHelper

# GETTING READY
mkdir module
cp -r apks META-INF customize.sh LICENSE module.prop notify.sh README.md module/
cp module.prop module/META-INF/com/google/android/magisk/module.prop
cp install.sh module/META-INF/com/google/android/magisk/customize.sh
rm -rf module/apks module/overlay

# ZIP!
7z a ModdedXGoodies-v"$version"-"$DATE".zip ./module/*  
