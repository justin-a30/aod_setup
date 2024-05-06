# DEFIND
    MOS=$(getprop ro.build.version.incremental | grep -Eo '[1-8]{2,3}')

# NOTIFY AND MKDIR
    ui_print " [i] Preparing destination..."
        mkdir $MODPATH/files
        mkdir $MODPATH/files/aod
        mkdir $MODPATH/files/chargemod
        mkdir $MODPATH/temp

# NOTIFY CURL START
    ui_print " [i] cURL start."
        sleep 1

# START CURL
    # SHELL
        ui_print " [i] cURL-ing shells"
            curl -s https://raw.githubusercontent.com/justin-a30/aod_setup/main/shell/mo.sh --output $MODPATH/mo.sh