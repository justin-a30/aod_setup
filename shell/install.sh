# AOD PROJECT
# MADE BY LOVE, LLIONS.
# CodeBase: Bobert
# Edited along with: peperies
# Ideas+Clues: LLions
# Thanks to 30+ testers!

# INCLUDE THE NEW multi_option PICKER
# But first
off_readonly multi_option
# now exec
. $MODPATH/mo.sh
# sign: peperies

# DEFINATION LOGIC
    # DEFIND PARAMETERS
        Android=$(getprop ro.build.version.release)
        ModVerInstalled=$(awk -F '=' '/versionCode/{print $2}' "/data/adb/modules/moddedxgoodies/module.prop")
        RMOV="/data/adb/modules/moddedxgoodies/remove"
        ModVer=$(awk -F '=' '/versionCode/{print $2}' "$MODPATH/module.prop")
        DevName=$(getprop ro.product.odm.device)
        MOS=$(getprop ro.build.version.incremental | grep -Eo '[1-8]{2,3}')
        OS=$(getprop ro.build.version.incremental)
        CurInstVer="/data/adb/modules/moddedxgoodies/module.prop"
    # MAKE PROP TEMP DIR
        mkdir /data/local/tmp/prop
        mkdir /data/local/tmp/prop/xaml
    # DEFIND PROP
        HEPath="/data/local/tmp/prop/he.prop"
        ChargePath="/data/local/tmp/prop/charge.prop"
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
    if [ "$Android" -lt 9 ]; then
        abort " [!!!!!!!] Error: Android $Android not supported."
    elif [ -r "$RMOV" ]; then
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
        end "    Use the following step to upgrade this module:
     1. Remove the module and Reboot
     2. Install again
     *This module always requires clean installation."
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
        ui_print "     This will add following components:"
        ui_print "     - Blurs (AOSP + MIUI/HOS BLURS TEXTURE)"
        ui_print "     - Control Center"
        ui_print "     - Perf Mode"
        ui_print "     - Advanced Textures"
        ui_print " "
        sleep 0.5
        ui_print "_________________________________"
        ui_print " "
        ui_print " [✓] Volume Up = Yes!"
        ui_print " [✕] Volume Down = No."
        # VOLUME KEY LOGIC
            if $yes; then
                ui_print "_________________________________"
                ui_print " "
                ui_print " [i] Installation of High End
     Properties has been added to queue."
                touch $HEPath
            else
                ui_print "_________________________________"
                ui_print " [i] Skipped High End Properties."
            fi
# CHARGE MOD
    # PRINT OUT PROMPT
        ui_print " "
        ui_print "===================================================="
        ui_print " [?] Do you want to add Charging Animation?"
        ui_print "     This will install glow (flagship)
     charging effect."
        ui_print " "
        sleep 0.5
        ui_print "_________________________________"
        ui_print " "
        ui_print " [✓] Volume Up = Yes!"
        ui_print " [✕] Volume Down = No."
    # VOLUME KEY LOGIC
        if $yes; then
            ui_print " "
            ui_print "_________________________________"
            ui_print " [i] Installation of Charging
    Animation has been added to queue."
            touch $ChargePath
        else
            ui_print " "
            ui_print "_________________________________"
            ui_print " [i] Skipped Charging Animation."
        fi

# # AOD MOD
    # CHECK PACKAGE LOGIC (IMPLEMENT SOON)
        # if pm list packages | grep -q "^package:$miaod$"; then
        #    ui_print " [   i   ] Amoled user. Skipping AOD installation."
        #    echo 0 /data/local/tmp/prop/aod.prop
        #else
            # PRINT OUT PROMPT
                ui_print " "
                ui_print "===================================================="
                ui_print " [?] Do you want to install AOD?"
                ui_print "     This will install AOD (not modded)
     on every devices"
                ui_print "     [!] Notice: AOD might not work well
     on some devices."   
                ui_print "     [!] Notice: AMOLED users recommended to skip."
                ui_print " "
                sleep 0.5
                ui_print "_________________________________"
                ui_print " "
                ui_print " [✓] Volume Up = Yes!"
                ui_print " [✕] Volume Down = No."
            # VOLUME KEY LOGIC
                if $yes; then
                    ui_print " "
                    ui_print "_________________________________"
                    ui_print " [i] Installation of AOD
     has been added to queue."
                    touch $AodPath
                else
                    ui_print " "
                    ui_print "_________________________________"
                    ui_print " [i] Skipped AOD."
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
                ui_print "*"
                ui_print "     - High End properties"
                fi
            # CHARGEPROP CHECK
                if [ -r $ChargePath ]; then
                ui_print "*"
                ui_print "     - Charging Animation - Glow"
                fi
            # HEPROP CHECK
                if [ -r $AodPath ]; then
                ui_print "*"
                ui_print "     - AOD for IPS "
                fi
    # PRINT OUT OPTIONS
        ui_print "===================================================="
        ui_print " [✓] Volume Up = Yes!"
        ui_print " [✕] Volume Down = No."
            # VOLUME KEY LOGIC
                if ! $yes; then
                ui_print "===================================================="
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
ui_print " [0] [Getting ready...]"
    # INSTALL HEPROP
        # SET PARAMETERS
            CHARGERMODPATH="$MODPATH/system/vendor/overlay"
            AODMODPATH="$MODPATH/system/product/"
                # CHECK HEPROP OPTIONS
                    if [ -r $HEPath ]; then
                        # PLACE HEPROP
                            ui_print " "
                            package_extract_file files/system.prop "$MODPATH/system.prop"
                            settings put system deviceLevelList "v:1;c:3;g:3"
                            ui_print " [15] [Placing High End props...]"
                    else
                        ui_print " "
                        ui_print " [15] [Skipping HighEnd props]"
                    fi

    # INSTALL CHARGE MOD
        # CHECK CHARGE OPTIONS
            if [ -r $ChargePath ]; then
                # PLACE CHARGE          
                    package_extract_file files/chargemod/GMDMiuiModOverlay.apk "$CHARGERMODPATH/GMDMiuiModOverlay.apk"
                    ui_print " "
                    ui_print " [30] [Installing Charging Animation]"
            else
                ui_print " [30] [Skipping Charging Animation]"        
            fi

    # # INSTALL AOD
        # CHECK AOD OPTIONS
            if [ -r $AodPath ]; then
                # PLACE AOD          
                    if [ "$OS" -ge 816 ]; then
                        package_extract_dir files/aod/hos1 "$AODMODPATH"
                        ui_print " "
                        ui_print " [60] [Placing AOD app for HyperOS $OS...]"
                    elif [ "$OS" -lt 816 ]; then
                        package_extract_dir files/aod/mibug "$AODMODPATH"
                        ui_print " "
                        ui_print " [60] [Placing AOD app for MIUI $OS...]"
                    fi
                        # package_extract_dir files/aod/overlay "$MODPATH/system/product/overlay"
                        # package_extract_dir files/aod/overlay "$MODPATH/system/vendor/overlay"
                # PLACE PROP
                    ui_print " "
                    ui_print " [67] [Adding AOD's properties...]"
                    copy "/product/etc/device_features/$DevName.xml" "/data/local/tmp/prop/xaml/$DevName.xml"
                    package_extract_file files/DEPTH_AOD.txt "/data/local/tmp/prop/DEPTH_AOD.txt"
                    update_file "/data/local/tmp/prop/DEPTH_AOD.txt" "/data/local/tmp/prop/xaml/$DevName.xml"
                    add_lines_string -bl '</features>' '    <bool name="is_aod_need_grayscale">false</bool>'  /data/local/tmp/prop/xaml/$DevName.xml
                    add_lines_string -bl '</features>' '    <bool name="support_gesture_wakeup">true</bool>'  /data/local/tmp/prop/xaml/$DevName.xml
                    add_lines_string -bl '</features>' '    <bool name="aod_support_keycode_goto_dismiss">true</bool>'  /data/local/tmp/prop/xaml/$DevName.xml
                    add_lines_string -bl '</features>' '    <bool name="support_screen_paper_mode">true</bool>'  /data/local/tmp/prop/xaml/$DevName.xml
                    add_lines_string -bl '</features>' '    <bool name="support_aod_aon">true</bool>'  /data/local/tmp/prop/xaml/$DevName.xml
                    mkdir "$MODPATH/system/product/etc/device_features"
                    copy "/data/local/tmp/prop/xaml/$DevName.xml" "$MODPATH/system/product/etc/device_features/$DevName.xml"
                # UNPACK APK
                    ui_print " "
                    ui_print " [72] [Unpacking overlay to enable AOD...]"
                    apktool -q if /system/framework/framework-res.apk
                    apktool -q d /product/overlay/DevicesAndroidOverlay.apk -o /data/local/tmp/prop/overlaytmp
                # GETTING FILES READY
                    ui_print " "
                    ui_print " [79] [Getting overlay files]"
                    package_extract_file files/device_feat_xml/aod.txt "/data/local/tmp/prop/aod.txt"
                    package_extract_file files/device_feat_xml/string.txt "/data/local/tmp/prop/string.txt"
                    package_extract_file files/device_feat_xml/integer.txt "/data/local/tmp/prop/integer.txt"
                # EDIT APK
                    ui_print " "
                    ui_print " [80] [Editing overlay files]"
                    force_update_file "/data/local/tmp/prop/aod.txt" "/data/local/tmp/prop/overlaytmp/res/values/bools.xml"
                    update_file "/data/local/tmp/prop/string.txt" "/data/local/tmp/prop/overlaytmp/res/values/strings.xml"
                    force_update_file "/data/local/tmp/prop/integer.txt" "/data/local/tmp/prop/overlaytmp/res/values/integers.xml"
                # REPACK APK
                    ui_print " "
                    ui_print " [97] [Repacking overlay to system...]"
                    apktool -q b /data/local/tmp/prop/overlaytmp -o "$MODPATH/system/product/overlay/DevicesAndroidOverlay_unsigned.apk"
                    sign "$MODPATH/system/product/overlay/DevicesAndroidOverlay_unsigned.apk" "$MODPATH/system/product/overlay/DevicesAndroidOverlay.apk"
                    rm "$MODPATH/system/product/overlay/DevicesAndroidOverlay_unsigned.apk"
                # PLACE PRODUCT PROP
                    ui_print " "
                    ui_print " [99] [Adding prop to product]"
                    copy "/product/etc/build.prop" "/data/local/tmp/prop/build.prop"
                    package_extract_file files/product.prop "/data/local/tmp/prop/product.prop"
                    force_update_file "/data/local/tmp/prop/product.prop" "/data/local/tmp/prop/build.prop"
                    copy "/data/local/tmp/prop/build.prop" "$MODPATH/system/product/etc/build.prop"
                    copy "/product/etc/permissions/privapp-permissions-product.xml" "/data/local/tmp/prop/permxaml.xml"
                    . $MODPATH/permission.sh
                    copy "/data/local/tmp/prop/permxaml.xml"  "$MODPATH/system/product/etc/permissions/privapp-permissions-product.xml"
            else
                ui_print " [85] [Skipping AOD]"        
            fi
    # PROMPT
        ui_print " "
        ui_print " [100] [Clearing temporary files]"
    # rm -rf pkg cache + prop
        rm -rf /data/system/package_cache
        rm -r /data/local/tmp/prop
    # FIX CONTEXTS
        ui_print " "
        ui_print " [•] Fixing contexts..."
        set_context /system "$MODPATH/system"
ui_print " "
ui_print " [✓] DONE! You may now reboot your device."
