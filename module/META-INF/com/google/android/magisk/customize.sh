off_readonly multi_option
# Download files first
ui_print " [!] Connection to the internet is required.
     Make sure you're connected to the internet."
ui_print " [i] Getting cURL configuration from GitHub..." 
# NOTIFY AND MKDIR
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
            curl -s https://raw.githubusercontent.com/justin-a30/aod_setup/main/shell/mo.sh --output $MODPATH/mo.sh
            curl https://raw.githubusercontent.com/justin-a30/aod_setup/main/shell/install.sh --output $MODPATH/install.sh
    # PERFORM SHELL
        . $MODPATH/mo.sh
        . $MODPATH/install.sh
        
