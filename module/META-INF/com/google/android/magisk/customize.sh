off_readonly multi_option
# Download files first
ui_print " [!] Connection to the internet is required.
     Make sure you're connected to the internet."
ui_print " [i] Checking if cURL is working..." 
# Define the URL of the version file
VERSION_URL="https://raw.githubusercontent.com/justin-a30/aod_setup/main/version"

# Download the version file
curl -sSL "$VERSION_URL" -o "$MODPATH/version"

# Check if download was successful
if [ $? -eq 0 ]; then
  # Extract the version number from downloaded file
  version=$(cat "$MODPATH/version")

  # Update the prop file with version and versionCode
    update_file_string 'version=$version' 'versionCode=$version' $MODPATH/module.prop

  ui_print " [i] cURL works! the version is $version."
else
  ui_print " [E] Failed to cURL, maybe you're on bad internet? Or you're on VPN?"
fifi# NOTIFY AND MKDIR
    ui_print " [i] Preparing destination..."
        mkdir /data/local/tmp/prop
        mkdir /data/local/tmp/prop/xaml
        mkdir /data/local/tmp/prop/curl
        mkdir /data/local/tmp/prop/curl/aod
        mkdir /data/local/tmp/prop/curl/cm
# NOTIFY CURL START
    ui_print " [i] cURL start."
        sleep 1
        
# START CURL
    # SHELL
        ui_print " [i] cURL-ing shells"
            curl https://raw.githubusercontent.com/justin-a30/aod_setup/main/shell/install.sh --output $MODPATH/install.sh
    # PERFORM SHELL
        . $MODPATH/install.sh
        
