mkdir /sdcard/test/temp
mkdir /sdcard/test/file
mkdir /sdcard/test/file/aod
mkdir /sdcard/test/file/aod/hos1
curl -s https://raw.githubusercontent.com/justin-a30/aod_setup/main/apks/aod/hos1.zip --output /sdcard/test/temp/hos1.zip
unzip /sdcard/test/temp/hos1.zip -d /sdcard/test/file/aod/hos1
