# AOD PROJECT
# MADE BY LOVE, LLIONS.
# CodeBase: Bobert
# Edited along with: peperies
# Ideas+Clues: LLions
# Thanks to 30+ testers!

# Add a download checker
DLCHECK () { if [ $? -eq 0 ]; then ui_print " " ; ui_print " [ info     ] DL Done!"; ui_print " "; else end " [ Error    ] Failed to cURL. Aborting..."; fi }

# DEFINATION LOGIC
    # DEFIND PARAMETERS
        Android=$(getprop ro.build.version.release)
        ModVerInstalled=$(awk -F '=' '/versionCode/{print $2}' "/data/adb/modules/moddedxgoodies/module.prop")
        RMOV="/data/adb/modules/moddedxgoodies/remove"
        RMSYS="/system/rm.pending"
        ModVer=$(awk -F '=' '/versionCode/{print $2}' "$MODPATH/module.prop")
        DevName=$(getprop ro.product.odm.device)
        MOS=$(getprop ro.build.version.incremental | grep -Eo '[1-8]{2,3}')
        OS=$(getprop ro.build.version.incremental)
        CurInstVer="/data/adb/modules/moddedxgoodies/module.prop"
    # DEFIND PROP
        HEPath="/data/local/tmp/prop/he.prop"
        ChargeGlow="/data/local/tmp/prop/glow.prop"
        ChargeMini="/data/local/tmp/prop/mini.prop"
        ChargeBottle="/data/local/tmp/prop/bottle.prop"
        AodPath="/data/local/tmp/prop/aod.prop"
# PRINT INFO
    ui_print " [i] Device info"
    ui_print "     - Android version: "$Android""
    if [ "$MOS" -gt 14 ]; then
        ui_print "     - HyperOS version: "$OS""
    else
        ui_print "     - MIUI version: "$OS""
        ui_print " "
    fi
# CHECKING ANDROID VERSION
    if [[ "$Android" -lt 9 ]]; then
        end " [ !     ] Error: Android $Android not supported."
    elif [ -r "$RMOV" ]; then
        ui_print " [#] Note"
        ui_print "     YOU DIDN'T REBOOT?"
        sleep 0.5
        ui_print "     CLEAN INSTALLATION IS REQUIRED."
        sleep 0.5
        ui_print "     I REPEAT"
        sleep 0.2
        end "     CLEAN INSTALLATION IS REQUIRED."
    elif [ -r "$RMSYS" ]; then
        ui_print " [#] Note"
        ui_print "     YOU DIDN'T REBOOT?"
        sleep 0.5
        ui_print "     CLEAN INSTALLATION IS REQUIRED."
        sleep 0.5
        ui_print "     I REPEAT"
        sleep 0.2
        end "     CLEAN INSTALLATION IS REQUIRED."
    elif [ -r "$CurInstVer" ]; then
    if [[ "$ModVerInstalled" -le "$ModVer" ]]; then
        ui_print " [#] Note"
        ui_print "     Found version: "$ModVerInstalled"."
        ui_print "     Clean installation is required."
        ui_print "      "
        ui_print "    Use the following step to upgrade this module:"
        ui_print "     1. Remove the module and Reboot"
        ui_print "     2. Install again"
             end "     • This module always requires clean installation."
        fi
    else
        # CONFIRM USER PERMISSION BEFORE INSTALLING MODS
            ui_print " [#] Note"
            ui_print "     Once the installation begins,
     this can't be stopped. Continue?"
            ui_print " "
            sleep 0.5
            ui_print " [+] Volume Up = Yes!"
            ui_print " [-] Volume Down = No."
                # VOLUME KEY LOGIC
                    if ! $yes; then
                    ui_print " "
                    end " [i] Installation cancelled by the user."
                    else
                    ui_print " "
                    ui_print " [i] Installation begin."
                    fi
    fi
# HIGH END PROP
    # PRINT OUT PROMPT
        ui_print " "
        ui_print "===================================================="
        ui_print " [?] Do you want to add High End properties?"
        ui_print " "
        ui_print "     This will add following components:"
        ui_print "     - Blurs (AOSP + MIUI/HOS BLURS TEXTURE)"
        ui_print "     - Control Center"
        ui_print "     - Perf Mode"
        ui_print "     - Advanced Textures"
        ui_print " "
        sleep 0.5
        ui_print "_________________________________"
        ui_print " "
        ui_print " [+] Volume Up = Yes!"
        ui_print " [-] Volume Down = No."
        ui_print "_________________________________"
        # VOLUME KEY LOGIC
            if $yes; then
                ui_print " "
                ui_print " [i] Installation of High End"
                ui_print "     Properties has been added"
                ui_print "     to queue."
                ui_print "_________________________________"
                touch $HEPath
            else
                ui_print " "
                ui_print " [i] Skipped High End Properties."
                ui_print "_________________________________"
            fi
# CHARGE MOD
    # PRINT OUT PROMPT
        ui_print " "
        ui_print "===================================================="
        ui_print " [?] Select your favourite Charge Animation style"
        ui_print " "
        sleep 0.5
        ui_print "_________________________________"
        ui_print " "
        ui_print " [+] Volume Up = Change option"
        ui_print " [-] Volume Down = Select"
        ui_print "_________________________________"
        ui_print " "
        ui_print " [1] Glow (Flagship)"
        ui_print " [2] Particle Animation"
        ui_print " [3] Bottle Animation (flowing to battery packet)"
        ui_print " [4] Skip"
        ui_print "_________________________________"
    # VOLUME KEY LOGIC
	# MULTI_OPTION TIME!
        cm=1
        while true; do
            ui_print " [>] Option: $cm"
            "$yes" && cm="$((cm + 1))" || break
            [[ "$cm" -gt "4" ]] && cm=1
        done

        case "$cm" in
            "1") option="Glow Animation" ;;
            "2") option="Particle Animation" ;;
            "3") option="Bottle Animation" ;;
            "4") option="Skip charging animation mod" ;;
        esac
        # PRINT OUT SELECTED OPTION
            ui_print " [i] Selected: $option"
            ui_print ""
        # LOGIC WHEN PRESSED
            if [[ "$option" == "Glow Animation" ]]; then
                      ui_print " "
                      ui_print " [i] Glow animation has been "
                      ui_print "     added to queue."
                      ui_print "_________________________________"
                      touch $ChargeGlow
            elif [[ "$option" == "Particle Animation" ]]; then
                      ui_print " "
                      ui_print " [i] Particle animation has been "
                      ui_print "     added to queue."
                      ui_print "_________________________________"
                      touch $ChargeMini
            elif [[ "$option" == "Bottle Animation" ]]; then
                      ui_print " "
                      ui_print " [i] Bottle animation has been "
                      ui_print "     added to queue."
                      ui_print "_________________________________"
                      touch $ChargeBottle
            elif [[ "$option" == "Skip charging animation mod" ]]; then
                      ui_print " "
                      ui_print " [i] Skipped Charging Animation."
                      ui_print "_________________________________"      
            fi         
 # AOD MOD
    # CHECK PACKAGE LOGIC (IMPLEMENT SOON)
        # if pm list packages | grep -q "^package:$miaod$"; then
        #    ui_print " [   i   ] Amoled user. Skipping AOD installation."
        #    echo 0 /data/local/tmp/prop/aod.prop
        #else
            # PRINT OUT PROMPT
                ui_print " "
                ui_print "===================================================="
                ui_print " [?] Do you want to install AOD?"
                ui_print "     This will install AOD (not modded)"
                ui_print "     on every devices"
                ui_print " "
                ui_print "     [!] Notice: AOD might not work well"
                ui_print "     on some devices."
                ui_print " "
                ui_print "     [!] Notice: AMOLED users recommended to skip."
                ui_print " "
                sleep 0.5
                ui_print "_________________________________"
                ui_print " "
                ui_print " [+] Volume Up = Yes!"
                ui_print " [-] Volume Down = No."
                ui_print "_________________________________"
            # VOLUME KEY LOGIC
                if $yes; then
                    ui_print " "
                    ui_print " [i] Installation of AOD"
                    ui_print "     has been added"
                    ui_print "_________________________________"
                    touch $AodPath
                else
                    ui_print " "
                    ui_print " [i] Skipped AOD."
                    ui_print "_________________________________"
                fi
        #fi

# SUMMARY
    # PRINT OUT PROMPT
        ui_print "===================================================="
        ui_print " [#] SUMMARY"
        ui_print "     Do you want to add selected package(s)?"
        ui_print "     Selected package(s):"
            # HEPROP CHECK
                if [ -r $HEPath ]; then
                ui_print " "
                ui_print "     - High End properties"
                fi
            # CHARGEPROP CHECK
                if [ -r $ChargeGlow ]; then
                ui_print " "
                ui_print "     - Charging Animation - Glow"
                elif [ -r $ChargeMini ]; then
                ui_print " "
                ui_print "     - Charging Animation - Particle"
                elif [ -r $ChargeBottle ]; then
                ui_print " "
                ui_print "     - Charging Animation - Bottle"
                fi
            # HEPROP CHECK
                if [ -r $AodPath ]; then
                ui_print " "
                ui_print "     - AOD for IPS "
                fi
    # PRINT OUT OPTIONS
        ui_print "===================================================="
        ui_print " [+] Volume Up = Yes!"
        ui_print " [-] Volume Down = No."
        ui_print "===================================================="
            # VOLUME KEY LOGIC
                if ! $yes; then
                end " [i] Installation cancelled by the user.
     Reinstall module to pick again."
                fi

# INSTALLATION LOGIC STARTS FROM HERE!!
ui_print "_________________________________"
ui_print " "
ui_print "[🏁] READY"
ui_print " "
sleep 1
ui_print "[🏁] SET"
ui_print " "
sleep 1
ui_print "[🏁] GO"
ui_print " "
ui_print "_________________________________"
ui_print " [----------] [Getting ready...]"
    # INSTALL HEPROP
        # SET PARAMETERS
            CHARGERMODPATH="$MODPATH/system/vendor/overlay"
            if [[ "$Android" -le 12 ]]; then
                AODMODPATH="$MODPATH/system/"
            else
                AODMODPATH="$MODPATH/system/product/"
            fi
                # CHECK HEPROP OPTIONS
                    if [ -r $HEPath ]; then
                        # PLACE HEPROP
                            ui_print " "
                            ui_print " [#---------] [Placing High End props...]"
                            touch $MODPATH/system.prop
                            add_lines_string "ro.config.low_ram=false" "ro.config.low_ram.threshold_gb=0" "ro.miui.backdrop_sampling_enabled=true" "ro.miui.has_real_blur=1" "ro.miui.has_blur=1"  "ro.miui.has_handy_mode_sf=1"  "ro.launcher.blur.appLaunch=1" "ro.surface_flinger.supports_background_blur=1" "ro.sf.blurs_are_expensive=1" "persist.sys.sf.disable_blurs=false" "enable_blurs_on_windows=1" "ro.sf.blurs_are_caro=0" "persist.sys.background_blur_supported=true" "vendor.perf.framepacing.enable=false" "persist.sys.power.default.powermode=1" "ro.vendor.sf.detect.aod.enable=true" $MODPATH/system.prop
                            settings put system deviceLevelList "v:1,c:2,g:2"
                            touch $MODPATH/post-fs-data.sh
                            add_lines_string 'MODDIR=${0%/*}' 'settings put system deviceLevelList "v:1,c:2,g:2"' $MODPATH/post-fs-data.sh
                    else
                        ui_print " "
                        ui_print " [#---------] [Skipping HighEnd props]"
                    fi

    # INSTALL CHARGE MOD
        # CHECK CHARGE OPTIONS
            if [ -r $ChargeGlow ]; then
                # PLACE CHARGE GLOW     
                    ui_print " "
                    ui_print " [###-------] [Downloading Glow Charging Animation]"
                    curl -s https://raw.githubusercontent.com/justin-a30/aod_setup/developer/apks/GlowCharge.apk --output /data/local/tmp/prop/curl/cm/GlowCharge.apk
                    DLCHECK
                    ui_print " [###-------] [Installing Glow Charging Animation]"
                    copy "/data/local/tmp/prop/curl/cm/GlowCharge.apk" "$CHARGERMODPATH/GlowCharge.apk"
            elif [ -r $ChargeMini ]; then
                # PLACE CHARGE MINI     
                    ui_print " "
                    ui_print " [###-------] [Downloading Particle Charging Animation]"
                    curl -s https://raw.githubusercontent.com/justin-a30/aod_setup/developer/apks/SimpleCharge.apk --output /data/local/tmp/prop/curl/cm/SimpleCharge.apk
                    DLCHECK
                    ui_print " [###-------] [Installing Particle Charging Animation]"
                    copy "/data/local/tmp/prop/curl/cm/SimpleCharge.apk" "$CHARGERMODPATH/SimpleCharge.apk"
            elif [ -r $ChargeBottle ]; then
                # PLACE CHARGE BOTTLE     
                    ui_print " "
                    ui_print " [###-------] [Downloading Bottle Charging Animation]"
                    curl -s https://raw.githubusercontent.com/justin-a30/aod_setup/developer/apks/BottleCharge.apk --output /data/local/tmp/prop/curl/cm/BottleCharge.apk
                    DLCHECK
                    ui_print " [###-------] [Installing Bottle Charging Animation]"
                    copy "/data/local/tmp/prop/curl/cm/BottleCharge.apk" "$CHARGERMODPATH/BottleCharge.apk"
            else
                ui_print " [###-------] [Skipping Charging Animation]"
            fi
    # # INSTALL AOD
        # CHECK AOD OPTIONS
            if [ -r $AodPath ]; then
                # PLACE AOD          
                    if [ "$MOS" -ge 816 ]; then
                        ui_print " "
                        ui_print " [#####-----] [Downloading AOD app for HyperOS $OS...]"
                        curl -s https://raw.githubusercontent.com/justin-a30/aod_setup/developer/apks/aod/hos1.zip --output /data/local/tmp/prop/curl/aod/hos1.zip
                        DLCHECK
                        ui_print " [#####-----] [Placing AOD app for HyperOS $OS...]"
                        7z x /data/local/tmp/prop/curl/aod/hos1.zip -o/data/local/tmp/prop/curl/aod > /dev/null
                        copy "/data/local/tmp/prop/curl/aod/hos1" "$AODMODPATH"
                    elif [ "$MOS" -lt 816 ]; then
                        ui_print " "
                        ui_print " [#####-----] [Downloaing AOD app for MIUI $MOS...]"
                        curl -s https://raw.githubusercontent.com/justin-a30/aod_setup/developer/apks/aod/mibug.zip --output /data/local/tmp/prop/curl/aod/mibug.zip
                        DLCHECK
                        ui_print " [#####-----] [Placing AOD app for MIUI $MOS...]"
                        7z x /data/local/tmp/prop/curl/aod/mibug.zip -o/data/local/tmp/prop/curl/aod
                        copy "/data/local/tmp/prop/curl/aod/mibug" "$AODMODPATH"
                    fi
                        # package_extract_dir files/aod/overlay "$MODPATH/system/product/overlay"
                        # package_extract_dir files/aod/overlay "$MODPATH/system/vendor/overlay"
                # PLACE PROP
                    ui_print " "
                    ui_print " [######----] [Adding AOD's properties...]"
                    copy "/product/etc/device_features/$DevName.xml" "/data/local/tmp/prop/xaml/$DevName.xml"
                    # DEVICE STUFF
                        if contains '    <bool name="is_xiaomi">' /data/local/tmp/prop/xaml/$DevName.xml; then
                            if contains '    <bool name="is_xiaomi">true</bool>' /data/local/tmp/prop/xaml/$DevName.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="is_xiaomi">false</bool>' '    <bool name="is_xiaomi">true</bool>' /data/local/tmp/prop/xaml/$DevName.xml
                            fi
                        else
                            add_lines_string -al '<features>' '    <bool name="is_xiaomi">true</bool>' /data/local/tmp/prop/xaml/$DevName.xml
                        fi
                    #
                        if contains '    <bool name="is_hongmi">' /data/local/tmp/prop/xaml/$DevName.xml; then
                            if contains '    <bool name="is_hongmi">false</bool>' /data/local/tmp/prop/xaml/$DevName.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="is_hongmi">true</bool>' '    <bool name="is_hongmi">false</bool>' /data/local/tmp/prop/xaml/$DevName.xml
                            fi
                        else
                            add_lines_string -al '<features>' '    <bool name="is_hongmi">false</bool>' /data/local/tmp/prop/xaml/$DevName.xml
                        fi
                    #
                        if contains '    <bool name="is_redmi">' /data/local/tmp/prop/xaml/$DevName.xml; then
                            if contains '    <bool name="is_redmi">false</bool>' /data/local/tmp/prop/xaml/$DevName.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="is_redmi">true</bool>' '    <bool name="is_redmi">false</bool>' /data/local/tmp/prop/xaml/$DevName.xml
                            fi
                        else
                            add_lines_string -al '<features>' '    <bool name="is_redmi">false</bool>' /data/local/tmp/prop/xaml/$DevName.xml
                        fi
                    # AOD STUFF 
                        if contains '    <bool name="support_gesture_wakeup">' /data/local/tmp/prop/xaml/$DevName.xml; then
                            if contains '    <bool name="support_gesture_wakeup">true</bool>' /data/local/tmp/prop/xaml/$DevName.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="support_gesture_wakeup">false</bool>' '    <bool name="support_gesture_wakeup">true</bool>' /data/local/tmp/prop/xaml/$DevName.xml
                            fi
                        else
                            add_lines_string -al '<features>' '    <bool name="support_gesture_wakeup">true</bool>' /data/local/tmp/prop/xaml/$DevName.xml
                        fi
                    #
                        if contains '    <bool name="support_aod">' /data/local/tmp/prop/xaml/$DevName.xml; then
                            if contains '    <bool name="support_aod">true</bool>' /data/local/tmp/prop/xaml/$DevName.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="support_aod">false</bool>' '    <bool name="support_aod">true</bool>' /data/local/tmp/prop/xaml/$DevName.xml
                            fi
                        else
                            add_lines_string -al '<features>' '    <bool name="support_aod">true</bool>' /data/local/tmp/prop/xaml/$DevName.xml
                        fi
                    #
                        if contains '    <bool name="aod_support_keycode_goto_dismiss">' /data/local/tmp/prop/xaml/$DevName.xml; then
                            if contains '    <bool name="aod_support_keycode_goto_dismiss">true</bool>' /data/local/tmp/prop/xaml/$DevName.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="aod_support_keycode_goto_dismiss">false</bool>' '    <bool name="aod_support_keycode_goto_dismiss">true</bool>' /data/local/tmp/prop/xaml/$DevName.xml
                            fi
                        else
                            add_lines_string -al '<features>' '    <bool name="aod_support_keycode_goto_dismiss">true</bool>' /data/local/tmp/prop/xaml/$DevName.xml
                        fi
                    #
                        if contains '    <bool name="is_only_support_keycode_goto">' /data/local/tmp/prop/xaml/$DevName.xml; then
                            if contains '    <bool name="is_only_support_keycode_goto">false</bool>' /data/local/tmp/prop/xaml/$DevName.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="is_only_support_keycode_goto">true</bool>' '    <bool name="is_only_support_keycode_goto">false</bool>' /data/local/tmp/prop/xaml/$DevName.xml
                            fi
                        else
                            add_lines_string -al '<features>' '    <bool name="is_only_support_keycode_goto">false</bool>' /data/local/tmp/prop/xaml/$DevName.xml
                        fi
                    #
                        if contains '    <bool name="is_aod_need_grayscale">' /data/local/tmp/prop/xaml/$DevName.xml; then
                            if contains '    <bool name="is_aod_need_grayscale">false</bool>' /data/local/tmp/prop/xaml/$DevName.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="is_aod_need_grayscale">true</bool>' '    <bool name="is_aod_need_grayscale">false</bool>' /data/local/tmp/prop/xaml/$DevName.xml
                            fi
                        else
                            add_lines_string -al '<features>' '    <bool name="is_aod_need_grayscale">false</bool>' /data/local/tmp/prop/xaml/$DevName.xml
                        fi
                    #
                        if contains '    <bool name="support_screen_paper_mode">' /data/local/tmp/prop/xaml/$DevName.xml; then
                            if contains '    <bool name="support_screen_paper_mode">true</bool>' /data/local/tmp/prop/xaml/$DevName.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="support_screen_paper_mode">false</bool>' '    <bool name="support_screen_paper_mode">true</bool>' /data/local/tmp/prop/xaml/$DevName.xml
                            fi
                        else
                            add_lines_string -al '<features>' '    <bool name="support_screen_paper_mode">true</bool>' /data/local/tmp/prop/xaml/$DevName.xml
                        fi
                    #
                        if contains '    <bool name="support_aod_aon">' /data/local/tmp/prop/xaml/$DevName.xml; then
                            if contains '    <bool name="support_aod_aon">true</bool>' /data/local/tmp/prop/xaml/$DevName.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="support_aod_aon">false</bool>' '    <bool name="support_aod_aon">true</bool>' /data/local/tmp/prop/xaml/$DevName.xml
                            fi
                        else
                            add_lines_string -al '<features>' '    <bool name="support_aod_aon">true</bool>' /data/local/tmp/prop/xaml/$DevName.xml
                        fi
                    copy "/data/local/tmp/prop/xaml/$DevName.xml" "$MODPATH/system/product/etc/device_features/$DevName.xml"
                # UNPACK APK
                    ui_print " "
                    ui_print " [#######---] [Unpacking overlay to enable AOD...]"
                    apktool -q if /system/framework/framework-res.apk
                    apktool -qf d /product/overlay/DevicesAndroidOverlay.apk -o /data/local/tmp/prop/overlaytmp
                # EDIT APK
                    ui_print " "
                    ui_print " [########--] [Editing overlay files]"
                    ui_print " "
                    # BOOLEANS
                        if contains '    <bool name="config_dozeAlwaysOnDisplayAvailable">' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
                            if contains '    <bool name="config_dozeAlwaysOnDisplayAvailable">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="config_dozeAlwaysOnDisplayAvailable">false</bool>' '    <bool name="config_dozeAlwaysOnDisplayAvailable">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
                            fi
                        else
                            add_lines_string -bl '</resources>' '    <bool name="config_dozeAlwaysOnDisplayAvailable">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
                        fi
                    ui_print " [ Verbose  ] [Edited/added boolean: AOD Doze mode]"
                    ui_print " "
                    #
                        if contains '    <bool name="config_dozeSupportsAodWallpaper">' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
                            if contains '    <bool name="config_dozeSupportsAodWallpaper">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="config_dozeSupportsAodWallpaper">false</bool>' '    <bool name="config_dozeSupportsAodWallpaper">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
                            fi
                        else
                            add_lines_string -bl '</resources>' '    <bool name="config_dozeSupportsAodWallpaper">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
                        fi
                    ui_print " [ Verbose  ] [Edited/added boolean: AOD wallpaper]"
                    ui_print " "
                    #
                        if contains '    <bool name="config_dozeAfterScreenOff">' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
                            if contains '    <bool name="config_dozeAfterScreenOff">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="config_dozeAfterScreenOff">false</bool>' '    <bool name="config_dozeAfterScreenOff">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
                            fi
                        else
                            add_lines_string -bl '</resources>' '    <bool name="config_dozeAfterScreenOff">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
                        fi
                    ui_print " [ Verbose  ] [Edited/added boolean: Doze when screen off]"
                    ui_print " "
                    #
                        if contains '    <bool name="config_displayBlanksAfterDoze">' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
                            if contains '    <bool name="config_displayBlanksAfterDoze">false</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="config_displayBlanksAfterDoze">true</bool>' '    <bool name="config_displayBlanksAfterDoze">false</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
                            fi
                        else
                            add_lines_string -bl '</resources>' '    <bool name="config_displayBlanksAfterDoze">false</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
                        fi
                    ui_print " [ Verbose  ] [Edited/added boolean: Display mode on doze]"
                    ui_print " "
                    #
                        if contains '    <bool name="config_displayBrightnessBucketsInDoze">' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
                            if contains '    <bool name="config_displayBrightnessBucketsInDoze">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="config_displayBrightnessBucketsInDoze">false</bool>' '    <bool name="config_displayBrightnessBucketsInDoze">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
                            fi
                        else
                            add_lines_string -bl '</resources>' '    <bool name="config_displayBrightnessBucketsInDoze">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
                        fi
                    ui_print " [ Verbose  ] [Edited/added boolean: Brightness in doze mode]"
                    ui_print " "
                    #
                        if contains '    <bool name="config_dozePulsePickup">' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
                            if contains '    <bool name="config_dozePulsePickup">false</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="config_dozePulsePickup">true</bool>' '    <bool name="config_dozePulsePickup">false</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
                            fi
                        else
                            add_lines_string -bl '</resources>' '    <bool name="config_dozePulsePickup">false</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
                        fi
                    ui_print " [ Verbose  ] [Edited/added boolean: Doze end when pickup]"
                    ui_print " "
                    #
                        if contains '    <bool name="config_powerDecoupleAutoSuspendModeFromDisplay">' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
                            if contains '    <bool name="config_powerDecoupleAutoSuspendModeFromDisplay">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="config_powerDecoupleAutoSuspendModeFromDisplay">false</bool>' '    <bool name="config_powerDecoupleAutoSuspendModeFromDisplay">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
                            fi
                        else
                            add_lines_string -bl '</resources>' '    <bool name="config_powerDecoupleAutoSuspendModeFromDisplay">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
                        fi
                    ui_print " [ Verbose  ] [Edited/added boolean: AutoSuspend Power mode on display]"
                    ui_print " "
                    #
                        if contains '    <bool name="config_powerDecoupleInteractiveModeFromDisplay">' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
                            if contains '    <bool name="config_powerDecoupleInteractiveModeFromDisplay">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="config_powerDecoupleInteractiveModeFromDisplay">false</bool>' '    <bool name="config_powerDecoupleInteractiveModeFromDisplay">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
                            fi
                        else
                            add_lines_string -bl '</resources>' '    <bool name="config_powerDecoupleInteractiveModeFromDisplay">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
                        fi
                    ui_print " [ Verbose  ] [Edited/added boolean: Interactive Power mode on display]"
                    ui_print " "
                    # INTEGER
                        if contains '    <integer name="config_screenBrightnessDoze">' /data/local/tmp/prop/overlaytmp/res/values/integers.xml; then
                            if contains '    <integer name="config_screenBrightnessDoze">17</integer>' /data/local/tmp/prop/overlaytmp/res/values/integers.xml; then
                                echo "bomb" > /dev/null
                            else
                                SBD=$(xml_kit -open '<resources>' '</resources>' -open '<integer name="config_screenBrightnessDoze">' '</integer>' /data/local/tmp/prop/overlaytmp/res/values/integers.xml | grep -Eo '[0-9]{1,3}')
                                replace '    <integer name="config_screenBrightnessDoze">'$SBD'</integer>' '    <integer name="config_screenBrightnessDoze">17</integer>' /data/local/tmp/prop/overlaytmp/res/values/integers.xml
                            fi
                        else
                            add_lines_string -bl '</resources>' '    <integer name="config_screenBrightnessDoze">17</integer>' /data/local/tmp/prop/overlaytmp/res/values/integers.xml
                        fi
                    ui_print " [ Verbose  ] [Changed integer value: Brightness when doze (AOD brightness)]"
                    ui_print " "
                    # STRINGS
                        if contains '    <string name="config_dozeComponent">' /data/local/tmp/prop/overlaytmp/res/values/strings.xml; then
                            if contains '    <string name="config_dozeComponent">com.android.systemui/com.android.systemui.doze.DozeService</string>' /data/local/tmp/prop/overlaytmp/res/values/strings.xml; then
                                echo "bomb" > /dev/null
                            else
                                AST=$(xml_kit -open '<resources>' '</resources>' -open '<string name="config_dozeComponent">' '</string>' /data/local/tmp/prop/overlaytmp/res/values/strings.xml)
                                REP=$(string inside '>' '<' "$AST")
                                replace "$REP" 'com.android.systemui/com.android.systemui.doze.DozeService' /data/local/tmp/prop/overlaytmp/res/values/strings.xml
                            fi
                        elif contains '    <string name="config_dozeComponent" />' /data/local/tmp/prop/overlaytmp/res/values/strings.xml; then
                            replace '<string name="config_dozeComponent" />' '<string name="config_dozeComponent">com.android.systemui/com.android.systemui.doze.DozeService</string>' /data/local/tmp/prop/overlaytmp/res/values/strings.xml
                        else
                            add_lines_string -bl '</resources>' '    <string name="config_dozeComponent">com.android.systemui/com.android.systemui.doze.DozeService</string>' /data/local/tmp/prop/overlaytmp/res/values/strings.xml
                        fi
                    ui_print " [ Verbose  ] [Updated string value: SystemUI Doze service]"
                # REPACK APK
                    ui_print " "
                    ui_print " [########--] [Repacking overlay to system...]"
                    apktool -q b /data/local/tmp/prop/overlaytmp -o "$MODPATH/system/product/overlay/DevicesAndroidOverlay_unsigned.apk"
                    ui_print " "
                    ui_print " [ Verbose  ] [Signing compiled...]"
                    sign "$MODPATH/system/product/overlay/DevicesAndroidOverlay_unsigned.apk" "$MODPATH/system/product/overlay/DevicesAndroidOverlay.apk"
                    rm "$MODPATH/system/product/overlay/DevicesAndroidOverlay_unsigned.apk"
                # PLACE PERMISSION PROP
                    ui_print " "
                    ui_print " [#########-] [Getting permission file]"
                    # CHECK WHENEVER IF ANDROID IS SMALLER OR EQUAL 12
                    if [[ "$Android" -le 12 ]]; then
                        PERMDEST="/system/etc/permissions/privapp-permissions-miui.xml"
                        FINALPERMDEST="$MODPATH/system/product/etc/permissions/privapp-permissions-miui.xml"
                        # FINALPERMDEST="$MODPATH/system/etc/permissions/privapp-permissions-aod.xml"
                    else
                        PERMDEST="/product/etc/permissions/privapp-permissions-product.xml"
                        FINALPERMDEST="$MODPATH/system/product/etc/permissions/privapp-permissions-product.xml"
                        # FINALPERMDEST="$MODPATH/system/product/etc/permissions/privapp-permissions-aod.xml"
                    fi
                    # COPY
                    copy "$PERMDEST" /data/local/tmp/prop/permxaml.xml
                    # DOING THE WORK
                        if contains '   <privapp-permissions package="com.miui.aod">' /data/local/tmp/prop/permxaml.xml; then
                            xml_kit -open '<permissions>' '</permissions>' -open '<privapp-permissions package="com.miui.aod">' '</privapp-permissions>' /data/local/tmp/prop/permxaml.xml > /data/local/tmp/prop/temp.xml
                            if contains '   <permission name="android.permission.BIND_WALLPAPER" />' /data/local/tmp/prop/temp.xml; then
                                echo "bomb" > /dev/null
                            else
                                add_lines_string -al '   <privapp-permissions package="com.miui.aod">' '   <permission name="android.permission.BIND_WALLPAPER" />' /data/local/tmp/prop/permxaml.xml
                            fi
                        #
                            if contains '   <permission name="android.permission.INTERACT_ACROSS_USERS" />' /data/local/tmp/prop/temp.xml; then
                                echo "bomb" > /dev/null
                            else
                                add_lines_string -al '   <privapp-permissions package="com.miui.aod">' '   <permission name="android.permission.INTERACT_ACROSS_USERS" />' /data/local/tmp/prop/permxaml.xml
                            fi
                        #
                            if contains '   <permission name="android.permission.READ_DREAM_STATE" />' /data/local/tmp/prop/temp.xml; then
                                echo "bomb" > /dev/null
                            else
                                add_lines_string -al '   <privapp-permissions package="com.miui.aod">' '   <permission name="android.permission.READ_DREAM_STATE" />' /data/local/tmp/prop/permxaml.xml
                            fi
                        #
                            if contains '   <permission name="android.permission.SCHEDULE_EXACT_ALARM" />' /data/local/tmp/prop/temp.xml; then
                                echo "bomb" > /dev/null
                            else
                                add_lines_string -al '   <privapp-permissions package="com.miui.aod">' '   <permission name="android.permission.SCHEDULE_EXACT_ALARM" />' /data/local/tmp/prop/permxaml.xml
                            fi
                        # NO PERMISSIONS?
                        else
                            add_lines_string -bl "</permissions>" "   <privapp-permissions package="com.miui.aod">
                          <permission name="android.permission.BIND_WALLPAPER" />
                          <permission name="android.permission.INTERACT_ACROSS_USERS" />
                          <permission name="android.permission.READ_DREAM_STATE" />
                          <permission name="android.permission.SCHEDULE_EXACT_ALARM" />
                       </privapp-permissions>" /data/local/tmp/prop/permxaml.xml
                        fi
                    copy "/data/local/tmp/prop/permxaml.xml"  "$FINALPERMDEST"
            else
                ui_print " [########--] [Skipping AOD]"        
            fi
    # PROMPT
        ui_print " "
        ui_print " [##########] [Clearing temporary files]"
    # rm -rf pkg cache + prop
        rm -rf /data/system/package_cache
        rm -r /data/local/tmp/prop
    # FIX CONTEXTS
        ui_print " "
        ui_print " [•] Fixing contexts..."
        set_context /system "$MODPATH/system"
	# Adding extras for protection (bootloop, that is it lmao.)
        ui_print " [•] Adding final touches"
		touch $MODPATH/service.sh
		add_lines_string '#!/system/bin/sh' 'MODDIR="${0%/*}"' 'BOOT=$(getprop sys.boot_completed)' 'sleep 60' $MODPATH/service.sh
        echo "if [[ "$BOOT" != "1" ]]; then"                        >> $MODPATH/service.sh
        echo "  rm -rf /data/system/package_cache"                  >> $MODPATH/service.sh
        echo "  cp $MODDIR/disable /data/adb/service.d/notify.sh"   >> $MODPATH/service.sh
        echo "  chmod +x /data/adb/service.d/notify.sh"             >> $MODPATH/service.sh
        echo "  touch $MODDIR/disable"                              >> $MODPATH/service.sh
        echo "  reboot"                                             >> $MODPATH/service.sh
        echo "fi"                                                   >> $MODPATH/service.sh
        curl -s https://raw.githubusercontent.com/justin-a30/aod_setup/developer/apks/GlowCharge.apk --output $MODPATH/notify.sh
        DLCHECK
        ui_print " [•] Added some self-protections"

touch $MODPATH$RMSYS
ui_print " "
ui_print " [✓] DONE! You may now reboot your device."
if [ -r $ChargeMini ]; then
    ui_print " [!] BEFORE REBOOT!!!"
    ui_print "     Since you selected Particle Charge animation"
    ui_print "     You may need to use 'Voyager' LSPosed module to enable animation"
    ui_print "     (find Particle Charging Animation somewhere in SystemUI)"
