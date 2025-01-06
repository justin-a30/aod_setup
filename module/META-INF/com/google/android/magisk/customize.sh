# Import old necessary binary
  import_bin "$addons/apktool.jar"
  import_bin "$addons/aria2c"

# Download files first
  ui_print " [!] Connection to the internet is required."
  ui_print "     Make sure you're connected to the internet."
# Define the URL of the version file
  VERSION_URL="https://raw.githubusercontent.com/justin-a30/aod_setup/hyper2/version"

# Download the version file
aria2c "$VERSION_URL" --dir=$MODPATH -o "version" -q

# Check if download was successful
if [ $? -eq 0 ]; then
  # Extract the version number from downloaded file
  version=$(cat "$MODPATH/version")

  # Update the prop file with version and versionCode
    update_file_string "version=$version" "versionCode=$version" $MODPATH/module.prop

  ui_print " [i] The latest is $version."
else
  abort " [E] Failed to cURL, maybe you're on bad internet? Or you're on VPN?"
fi
# NOTIFY AND MKDIR
    ui_print " [i] Preparing destination..."
        mkdir -p /data/local/tmp/aod/xaml
        mkdir -p /data/local/tmp/aod/curl/aod
        mkdir /data/local/tmp/aod/curl/cm
# GET FILE
    # SHELL
        aria2c https://raw.githubusercontent.com/justin-a30/aod_setup/hyper2/shell/install.sh --dir=$MODPATH -o install.sh -q

    # PERFORM SHELL
        . $MODPATH/install.sh
        
