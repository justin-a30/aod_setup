#!/system/bin/sh
# AOD PROJECT
# MADE BY LOVE, LLIONS.
# CodeBase: Bobert
# Edited along with: peperies
# Ideas+Clues: LLions
# Thanks to 30+ testers!

# Add a download checker
DLCHECK () { if [ $? -eq 0 ]; then ui_print " " ; ui_print " [i] DL Done!"; ui_print " "; else end " [ Error    ] Failed to cURL. Aborting..."; fi }

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

# PRINT NOTES
    ui_print " --## NOTES ##--"
    ui_print " Installation TUI has been improved."
    ui_print " Keynote: If you see [+], this means Volume Up"
    ui_print "          If you see [-], this means Volume Down"
    ui_print " "
# PRINT INFO
    ui_print " [i] Device info"
    ui_print " - Android version: "$Android""
    if [ "$MOS" -gt 14 ]; then
        ui_print " - HyperOS version: "$OS""
        ui_print " "
    else
        ui_print " - MIUI version: "$OS""
        ui_print " "
    fi
# CHECKING ANDROID VERSION
    if [[ "$Android" -lt 13 ]]; then
        end " [!] Error: Android $Android not supported."
    elif [ "$MOS" -le 14 ]; then
        ui_print " MIUI AOD support ended for now."
    else
        # CONFIRM USER PERMISSION BEFORE INSTALLING MODS
            ui_print " [#] Note"
            ui_print " Once the installation begins,"
            ui_print " this can't be stopped. Continue?"
            ui_print " "
            sleep 0.5
            ui_print " [+] Yes"
            ui_print " [-] No"
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
        ui_print "--------------------"
        ui_print " High End properties"
        ui_print " "
        ui_print " Enable High end props?"
        ui_print " Following components will be added:"
        ui_print " - Blurs"
        ui_print " - Control Center"
        ui_print " - Performance Mode"
        ui_print " - Advanced Textures"
        ui_print " "
        sleep 0.5
        ui_print "--------------------"
        ui_print " "
        ui_print " [+] Yes!"
        ui_print " [-] No"
        # VOLUME KEY LOGIC
            if $yes; then
                ui_print "--------------------"
                ui_print " [i] Added to queue."
                touch $HEPath
            else
                ui_print "--------------------"
                ui_print " [i] Skipped."
            fi
# CHARGE MOD
    # PRINT OUT PROMPT
        ui_print " "
        ui_print "--------------------"
        ui_print " Charging Animation"
        ui_print " "
        ui_print " Do you want to add Charging animation?"
        ui_print " Currently available options:"
        sleep 0.5
        ui_print " "
        ui_print " [1] Glow (Flagship)"
        ui_print " [2] Particle Animation"
        ui_print " [3] Bottle Animation (flowing to battery packet)"
        ui_print " [4] Skip"
        ui_print " "
        ui_print "--------------------"
        ui_print " "
        ui_print " [+] Switch option"
        ui_print " [-] Select"
    # VOLUME KEY LOGIC
	# MULTI_OPTION TIME!
        cm=1
        while true; do
            ui_print " [> Option: $cm]"
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
                      ui_print "--------------------"
                      ui_print " [i] Added Glow to queue."
                      touch $ChargeGlow
            elif [[ "$option" == "Particle Animation" ]]; then
                      ui_print "--------------------"
                      ui_print " [i] Added Particle to queue."
                      touch $ChargeMini
            elif [[ "$option" == "Bottle Animation" ]]; then
                      ui_print "--------------------"
                      ui_print " [i] Added Bottle to queue."
                      touch $ChargeBottle
            elif [[ "$option" == "Skip charging animation mod" ]]; then
                      ui_print "--------------------"
                      ui_print " [i] Skipped." 
            fi         
 # AOD MOD
    # CHECK PACKAGE LOGIC (IMPLEMENT SOON)
        # if pm list packages | grep -q "^package:$miaod$"; then
        #    ui_print " [   i   ] Amoled user. Skipping AOD installation."
        #    echo 0 /data/local/tmp/prop/aod.prop
        #else
        if [ "$MOS" -le 14 ]; then
            ui_print " [!] Automatically skipping AOD"
        else
            # PRINT OUT PROMPT
                ui_print " "
                ui_print "--------------------"
                ui_print " AOD framework"
                ui_print " "
                ui_print " Do you want to add AOD framework to"
                ui_print " unsupported device?"
                ui_print " "
                ui_print " [!WARN]: If your device supports AOD,"
                ui_print " this should be skipped to prevent bugs."
                ui_print " "
                sleep 0.5
                ui_print "--------------------"
                ui_print " "
                ui_print " [+] Yes!"
                ui_print " [-] No"
            # VOLUME KEY LOGIC
                if $yes; then
                    ui_print "--------------------"
                    ui_print " [i] Added to queue."
                    touch $AodPath
                else
                    ui_print "--------------------"
                    ui_print " [i] Skipped."
                fi
        fi

# SUMMARY
    # PRINT OUT PROMPT
        ui_print " "
        ui_print "--------------------"
        ui_print " Summarize"
        ui_print " "
        ui_print " Do you want to add selected mod(s)?"
        ui_print " Selected mod(s):"
            # HEPROP CHECK
                if [ -r $HEPath ]; then
                ui_print " "
                ui_print " - High End properties"
                fi
            # CHARGEPROP CHECK
                if [ -r $ChargeGlow ]; then
                ui_print " "
                ui_print " - Charging Animation - Glow"
                elif [ -r $ChargeMini ]; then
                ui_print " "
                ui_print " - Charging Animation - Particle"
                elif [ -r $ChargeBottle ]; then
                ui_print " "
                ui_print " - Charging Animation - Bottle"
                fi
            # HEPROP CHECK
                if [ -r $AodPath ]; then
                ui_print " "
                ui_print " - AOD framework "
                fi
    # PRINT OUT OPTIONS
        ui_print "--------------------"
        ui_print " "
        ui_print " [+] Yes!"
        ui_print " [-] No"
            # VOLUME KEY LOGIC
                if ! $yes; then
                end " [i] Canceled by user input."
                fi

# INSTALLATION LOGIC STARTS FROM HERE!!
ui_print " "
ui_print " [000] [Getting ready...]"
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
                            ui_print " [005] [Placing High End props...]"
                            touch $MODPATH/system.prop
                            # Props by LocalLion
                            add_lines_string "persist.vendor.battery.health=true" "persist.vendor.battery.health.optimise=true" "persist.vendor.accelerate.charge=1" "persist.vendor.night.charge=1" "ro.config.hw_quickpoweron=true" "persist.sys.stability.miui_fbo_enable=1" "ro.media.enc.jpeg.quality=100" "media.stagefright.enable-player=true" "media.stagefright.enable-meta=true" "media.stagefright.enable-scan=true" "media.stagefright.enable-http=true" "ro.config.low_ram=false" "ro.config.low_ram.threshold_gb=2" "ro.vendor.audio.aiasst.support=true" "ro.vendor.display.ai_disp.enable=true" "ro.miui.support_miui_ime_bottom=1" "persist.vendor.vcb.enable=true" "persist.vendor.vcb.ability=true" "ro.com.google.ime.theme_dir=" "ro.com.google.ime.theme_file=" "ro.se.type=eSE,HCE,UICC" "ro.build.hardware.version=V1" "ro.miui.cust_hardware=V1" "ro.vendor.miui.cust_hardware=V1" "ro.miui.support_super_clipboard=true" "persist.sys.support_super_clipboard=1" "persist.sys.sf_charge_anim_supported=true" "persist.sys.background_blur_status_default=true" "persist.sys.advanced_visual_release=3" "persist.sys.textureview_optimization.enable=true" "persist.sys.support_view_smoothcorner=true" "persist.sys.support_window_smoothcorner=true" "ro.miui.has_real_blur=1" "ro.miui.has_blur=1 " "ro.miui.has_handy_mode_sf=1 " "ro.launcher.blur.appLaunch=1" "ro.surface_flinger.supports_background_blur=1" "ro.sf.blurs_are_expensive=1" "enable_blurs_on_windows=1" "persist.sys.background_blur_version=2" "ro.sf.blurs_are_caro=0" "persist.sys.background_blur_supported=true" "ro.miui.backdrop_sampling_enabled=true" "persist.sys.background_blur_status_default=true" "persist.sys.add_blurnoise_supported=true" "persist.sys.sf.disable_blurs=false" "persist.sys.mi_shadow_supported=true" "vendor.perf.framepacing.enable=false" "persist.sys.power.default.powermode=1" "persist.miui.miperf.enable=1" "persist.sys.enable_miui_booster=1" "debug.game.video.speed=1" "debug.game.video.support=1" "ro.vendor.audio.playbackcapture.screen=1" "ro.vendor.audio.sfx.harmankardon=1" "ro.vendor.audio.feature.spatial=7" "ro.vendor.video_box.version=2" "ro.vendor.audio.speaker.surround.boost=110" "ro.vendor.audio.aiasst.support=true" "ro.vendor.audio.sfx.earadj=true" "ro.vendor.audio.sfx.scenario=true" "ro.vendor.audio.scenario.support=true" "ro.vendor.audio.voice.change.support=true" "ro.vendor.audio.surround.support=true" "ro.vendor.audio.spk.stereo=true" "ro.vendor.audio.vocal.support=true" "ro.vendor.audio.voice.change.youme.support=true" "ro.vendor.audio.voice.volume.boost=none" "ro.vendor.audio.bass.enhancer.enable=true" "ro.vendor.audio.virtualizer.enable=true" "ro.vendor.audio.volume.modeler.enable=true" "ro.miui.support_audiorecord_compress=true" "ro.miui.allow_app_playbackcapture=true" "ro.vendor.sf.detect.aod.enable=true" "ro.vendor.media.video.frc.support=true" "ro.vendor.media.video.vpp.support=true" "debug.config.media.video.frc.support=true" "debug.config.media.video.aie.support=true" "debug.config.media.video.ais.support=true" "persist.vendor.vcb.ability=true" $MODPATH/system.prop
                            settings put system deviceLevelList "v:1,c:2,g:2"
                            touch $MODPATH/post-fs-data.sh
                            add_lines_string 'MODDIR=${0%/*}' 'settings put system deviceLevelList "v:1,c:2,g:2"' $MODPATH/post-fs-data.sh
                    else
                        ui_print " "
                        ui_print " [005] [Skipping HighEnd props]"
                    fi

    # INSTALL CHARGE MOD
        # CHECK CHARGE OPTIONS
            if [ -r $ChargeGlow ]; then
                # PLACE CHARGE GLOW     
                    ui_print " "
                    ui_print " [015] [Downloading Glow Charging Animation]"
                    curl -s https://raw.githubusercontent.com/justin-a30/aod_setup/developer/apks/GlowCharge.apk --output /data/local/tmp/prop/curl/cm/GlowCharge.apk
                    DLCHECK
                    ui_print " [018] [Installing Glow Charging Animation]"
                    copy "/data/local/tmp/prop/curl/cm/GlowCharge.apk" "$CHARGERMODPATH/GlowCharge.apk"
            elif [ -r $ChargeMini ]; then
                # PLACE CHARGE MINI     
                    ui_print " "
                    ui_print " [015] [Downloading Particle Charging Animation]"
                    curl -s https://raw.githubusercontent.com/justin-a30/aod_setup/developer/apks/SimpleCharge.apk --output /data/local/tmp/prop/curl/cm/SimpleCharge.apk
                    DLCHECK
                    ui_print " [018] [Installing Particle Charging Animation]"
                    copy "/data/local/tmp/prop/curl/cm/SimpleCharge.apk" "$CHARGERMODPATH/SimpleCharge.apk"
            elif [ -r $ChargeBottle ]; then
                # PLACE CHARGE BOTTLE     
                    ui_print " "
                    ui_print " [015] [Downloading Bottle Charging Animation]"
                    curl -s https://raw.githubusercontent.com/justin-a30/aod_setup/developer/apks/BottleCharge.apk --output /data/local/tmp/prop/curl/cm/BottleCharge.apk
                    DLCHECK
                    ui_print " [018] [Installing Bottle Charging Animation]"
                    copy "/data/local/tmp/prop/curl/cm/BottleCharge.apk" "$CHARGERMODPATH/BottleCharge.apk"
            else
                ui_print " [030] [Skipping Charging Animation]"
            fi
    # # INSTALL AOD
        # CHECK AOD OPTIONS
            if [ -r $AodPath ]; then
                # PLACE AOD          
                    ui_print " "
                    ui_print " [032] [Downloading AOD app for HyperOS $OS...]"
                    curl -s https://raw.githubusercontent.com/justin-a30/aod_setup/developer/apks/aod/hyper.apk --output /data/local/tmp/prop/curl/aod/hyper.apk
                    DLCHECK
                    ui_print " [037] [Placing AOD app for HyperOS $OS...]"
                    copy "/data/local/tmp/prop/curl/aod/hyper.apk" "$AODMODPATH/MIUIAod/MIUIAod.apk"
                        # package_extract_dir files/aod/overlay "$MODPATH/system/product/overlay"
                        # package_extract_dir files/aod/overlay "$MODPATH/system/vendor/overlay"
                # PLACE PROP
                    ui_print " "
                    ui_print " [040] [Adding AOD's properties...]"
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
            # Overlay checkup for dynamic updates
                OverPath="$MODPATH/system/product/overlay/DevicesAndroidOverlay.apk"
                if [ -r $OverPath ]; then
                # UNPACK APK
                    ui_print " "
                    ui_print " [045] [Unpacking overlay to enable AOD...]"
                    apktool -q if /system/framework/framework-res.apk
                    apktool -qf d /product/overlay/DevicesAndroidOverlay.apk -o /data/local/tmp/prop/overlaytmp
                # EDIT APK
                    ui_print " "
                    ui_print " [052] [Editing overlay files]"
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
                    #ui_print " [ Verbose  ] [Edited/added boolean: AOD Doze mode]"
                    #ui_print " "
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
                    #ui_print " [ Verbose  ] [Edited/added boolean: AOD wallpaper]"
                    #ui_print " "
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
                    #ui_print " [ Verbose  ] [Edited/added boolean: Doze when screen off]"
                    #ui_print " "
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
                    #ui_print " [ Verbose  ] [Edited/added boolean: Display mode on doze]"
                    #ui_print " "
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
                    #ui_print " [ Verbose  ] [Edited/added boolean: Brightness in doze mode]"
                    #ui_print " "
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
                    #ui_print " [ Verbose  ] [Edited/added boolean: Doze end when pickup]"
                    #ui_print " "
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
                    #ui_print " [ Verbose  ] [Edited/added boolean: AutoSuspend Power mode on display]"
                    #ui_print " "
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
                    #ui_print " [ Verbose  ] [Edited/added boolean: Interactive Power mode on display]"
                    #ui_print " "
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
                    #ui_print " [ Verbose  ] [Changed integer value: Brightness when doze (AOD brightness)]"
                    #ui_print " "
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
                    #ui_print " [ Verbose  ] [Updated string value: SystemUI Doze service]"
                # REPACK APK
                    ui_print " "
                    ui_print " [069] [Repacking overlay to system...]"
                    apktool -q b /data/local/tmp/prop/overlaytmp -o "$MODPATH/system/product/overlay/DevicesAndroidOverlay_unsigned.apk"
                    #ui_print " "
                    #ui_print " [ Verbose  ] [Signing compiled...]"
                    sign "$MODPATH/system/product/overlay/DevicesAndroidOverlay_unsigned.apk" "$MODPATH/system/product/overlay/DevicesAndroidOverlay.apk"
                    rm "$MODPATH/system/product/overlay/DevicesAndroidOverlay_unsigned.apk"
                # PLACE PERMISSION PROP
                    ui_print " "
                    ui_print " [078] [Getting permission file]"
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
                    ui_print " "
                    ui_print " [089] [Module changes. Skipping overlay.]"
                fi
            else
                ui_print " [089] [Skipping AOD]"        
            fi
    # rm -rf pkg cache
        rm -rf /data/system/package_cache
    # FIX CONTEXTS
        ui_print " "
        ui_print " [092] Fixing contexts..."
        set_context /system "$MODPATH/system"
	# Adding extras for protection (bootloop, that is it lmao.)
        ui_print " [095] Adding final touches"
		touch $MODPATH/service.sh
		add_lines_string '#!/system/bin/sh' 'MODDIR="${0%/*}"' 'BOOT=$(getprop sys.boot_completed)' 'sleep 60' $MODPATH/service.sh
        echo "if [[ "$BOOT" != "1" ]]; then"                        >> $MODPATH/service.sh
        echo "  rm -rf /data/system/package_cache"                  >> $MODPATH/service.sh
        echo "  cp $MODDIR/disable /data/adb/service.d/notify.sh"   >> $MODPATH/service.sh
        echo "  chmod +x /data/adb/service.d/notify.sh"             >> $MODPATH/service.sh
        echo "  touch $MODDIR/disable"                              >> $MODPATH/service.sh
        echo "  reboot"                                             >> $MODPATH/service.sh
        echo "fi"                                                   >> $MODPATH/service.sh
        curl -s https://raw.githubusercontent.com/justin-a30/aod_setup/developer/notify.sh --output $MODPATH/notify.sh
        DLCHECK
        ui_print " [100] Added some self-protections"

touch $MODPATH$RMSYS
ui_print " "
ui_print " [✓] DONE! You may now reboot your device."
if [ -r $ChargeMini ]; then
    ui_print " [!] BEFORE REBOOT!!!"
    ui_print "     Since you selected Particle Charge animation"
    ui_print "     You may need to use 'Voyager' LSPosed module to enable animation"
    ui_print "     (find Particle Charging Animation somewhere in SystemUI)"
fi
rm -r /data/local/tmp/prop
