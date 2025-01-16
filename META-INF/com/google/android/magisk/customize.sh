#!/system/bin/sh
# Import old necessary binary
  import_bin "$addons/aria2c"

# AOD PROJECT
# MADE BY LOVE, LLIONS.
# CodeBase: Bobert
# Edited along with: peperies
# Ideas+Clues: LLions
# Thanks to 30+ testers!

# DEFINATION LOGIC
    # DEFIND PARAMETERS
        Android=$(getprop ro.build.version.release)
        DevName=$(getprop ro.product.odm.device)
        OS=$(getprop ro.build.version.incremental)
        MAJOR_VERSION=$(echo "$OS" | grep -o '^[0-9]\+')

# PRINT NOTES
    ui_print " --## NOTES ##--"
    ui_print " Installation TUI has been improved."
    ui_print " Keynote: If you see [+], this means Volume Up"
    ui_print "          If you see [-], this means Volume Down"
    ui_print " "
# FILE PREPARATION
    ui_print " --## FILE PREPARATION ##--"
    ui_print " Extracting required files..."
    ui_print " "
    WORKLOAD="/data/local/tmp/mxg/workhelper"
    mkdir -p $WORKLOAD/extracted
    package_extract_file "apk.tar.xz" $WORKLOAD
    package_extract_file "overlay.tar.xz" $WORKLOAD
    tar xJf $WORKLOAD/apk.tar.xz -C $WORKLOAD/extracted
    tar xJf $WORKLOAD/overlay.tar.xz -C $WORKLOAD/extracted
    if [ -d $WORKLOAD/extracted ]; then
        ui_print " [✓] Files extracted."
    else
        end " [!] Error: Files not extracted."
    fi
# PRINT INFO
    ui_print " [i] Device info"
    ui_print " - Android version: "$Android""
    if [[ "$OS" =~ ^OS2\. ]]; then
        ui_print " [*] HyperOS 2 Detected "
        HyperOS2=true
    elif [[ "$OS" =~ ^816\. ]]; then
        ui_print " [*] HyperOS 1 Detected "
        HyperOS1=true
    elif [[ "$MAJOR_VERSION" =~ ^[0-9]+$ && "$MAJOR_VERSION" -le 14 ]]; then
        ui_print " [*] MIUI $MAJOR_VERSION Detected "
        MIUI=true
    else
        end "UNKNOWN COMPATIBILITY"
    fi
# CHECKING ANDROID VERSION
    if [[ "$Android" -lt 13 ]]; then
        end " [!] Error: Android $Android not supported."
    elif [ "$MIUI" == "true" ]; then
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
                HE=1
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
                      ChargeGlow=1
            elif [[ "$option" == "Particle Animation" ]]; then
                      ui_print "--------------------"
                      ui_print " [i] Added Particle to queue."
                      ChargeMini=1
            elif [[ "$option" == "Bottle Animation" ]]; then
                      ui_print "--------------------"
                      ui_print " [i] Added Bottle to queue."
                      ChargeBottle=1
            elif [[ "$option" == "Skip charging animation mod" ]]; then
                      ui_print "--------------------"
                      ui_print " [i] Skipped."
            fi
 # AOD MOD
    # CHECK PACKAGE LOGIC (IMPLEMENT SOON)
        # if pm list packages | grep -q "^package:$miaod$"; then
        #    ui_print " [   i   ] Amoled user. Skipping AOD installation."
        #    echo 0 /data/local/tmp/aod/aod.prop
        #else
        if [ "$MIUI" == "true" ]; then
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
                    AodOpt=1
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
                if [[ "$HE" -eq 1 ]]; then
                ui_print " "
                ui_print " - High End properties"
                fi
            # CHARGEPROP CHECK
                if [[ "$ChargeGlow" -eq 1 ]]; then
                ui_print " "
                ui_print " - Charging Animation - Glow"
                elif [[ "$ChargeMini" -eq 1 ]]; then
                ui_print " "
                ui_print " - Charging Animation - Particle"
                elif [[ "$ChargeBottle" -eq 1 ]]; then
                ui_print " "
                ui_print " - Charging Animation - Bottle"
                fi
            # AOD CHECK
                if [[ "$AodOpt" -eq 1 ]]; then
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
                    if [[ $HE -eq 1 ]]; then
                        # PLACE HEPROP
                            ui_print " "
                            ui_print " [005] [Placing High End props...]"
                            touch $MODPATH/system.prop
                            # Props by LocalLion
                            add_lines_string "persist.vendor.battery.health=true" "persist.vendor.battery.health.optimise=true" "persist.vendor.accelerate.charge=1" "persist.vendor.night.charge=1" "ro.config.hw_quickpoweron=true" "persist.sys.stability.miui_fbo_enable=1" "ro.media.enc.jpeg.quality=100" "media.stagefright.enable-player=true" "media.stagefright.enable-meta=true" "media.stagefright.enable-scan=true" "media.stagefright.enable-http=true" "ro.config.low_ram=false" "ro.config.low_ram.threshold_gb=2" "ro.vendor.audio.aiasst.support=true" "ro.vendor.display.ai_disp.enable=true" "ro.miui.support_miui_ime_bottom=1" "persist.vendor.vcb.enable=true" "persist.vendor.vcb.ability=true" "ro.com.google.ime.theme_dir=" "ro.com.google.ime.theme_file=" "ro.se.type=eSE,HCE,UICC" "ro.build.hardware.version=V1" "ro.miui.cust_hardware=V1" "ro.vendor.miui.cust_hardware=V1" "ro.miui.support_super_clipboard=true" "persist.sys.support_super_clipboard=1" "persist.sys.sf_charge_anim_supported=true" "persist.sys.background_blur_status_default=true" "persist.sys.advanced_visual_release=3" "persist.sys.textureview_optimization.enable=true" "persist.sys.support_view_smoothcorner=true" "persist.sys.support_window_smoothcorner=true" "ro.miui.has_real_blur=1" "ro.miui.has_blur=1 " "ro.miui.has_handy_mode_sf=1 " "ro.launcher.blur.appLaunch=1" "ro.surface_flinger.supports_background_blur=1" "ro.sf.blurs_are_expensive=1" "enable_blurs_on_windows=1" "persist.sys.background_blur_version=2" "ro.sf.blurs_are_caro=0" "persist.sys.background_blur_supported=true" "ro.miui.backdrop_sampling_enabled=true" "persist.sys.background_blur_status_default=true" "persist.sys.add_blurnoise_supported=true" "persist.sys.sf.disable_blurs=false" "persist.sys.mi_shadow_supported=true" "vendor.perf.framepacing.enable=false" "persist.sys.power.default.powermode=1" "persist.miui.miperf.enable=1" "persist.sys.enable_miui_booster=1" "debug.game.video.speed=1" "debug.game.video.support=1" "ro.vendor.audio.playbackcapture.screen=1" "ro.vendor.audio.sfx.harmankardon=1" "ro.vendor.audio.feature.spatial=7" "ro.vendor.video_box.version=2" "ro.vendor.audio.speaker.surround.boost=110" "ro.vendor.audio.aiasst.support=true" "ro.vendor.audio.sfx.earadj=true" "ro.vendor.audio.sfx.scenario=true" "ro.vendor.audio.scenario.support=true" "ro.vendor.audio.voice.change.support=true" "ro.vendor.audio.surround.support=true" "ro.vendor.audio.spk.stereo=true" "ro.vendor.audio.vocal.support=true" "ro.vendor.audio.voice.change.youme.support=true" "ro.vendor.audio.voice.volume.boost=none" "ro.vendor.audio.bass.enhancer.enable=true" "ro.vendor.audio.virtualizer.enable=true" "ro.vendor.audio.volume.modeler.enable=true" "ro.miui.support_audiorecord_compress=true" "ro.miui.allow_app_playbackcapture=true" "ro.vendor.sf.detect.aod.enable=true" "ro.vendor.media.video.frc.support=true" "ro.vendor.media.video.vpp.support=true" "debug.config.media.video.frc.support=true" "debug.config.media.video.aie.support=true" "debug.config.media.video.ais.support=true" "persist.vendor.vcb.ability=true" "ro.miui.support.aon.facev2=1" "ro.miui.support.aon.hand=1" "ro.miui.support.aon.qrcode=1" "ro.vendor.mtk_aod_support=1" $MODPATH/system.prop
                            settings put system deviceLevelList "v:3,c:3,g:3"
                            touch $MODPATH/post-fs-data.sh
                            add_lines_string 'MODDIR=${0%/*}' 'settings put system deviceLevelList "v:3,c:3,g:3"' $MODPATH/post-fs-data.sh
                    else
                        ui_print " "
                        ui_print " [005] [Skipping HighEnd props]"
                    fi

    # INSTALL CHARGE MOD
        # CHECK CHARGE OPTIONS
            if [[ "$ChargeGlow" -eq 1 ]]; then
                # PLACE CHARGE GLOW
                    ui_print " "
                    ui_print " [018] [Installing Glow Charging Animation]"
                    package_extract_file "overlay/MxGGlowAnimationOverlayHelper.apk" "$CHARGERMODPATH/Glow.apk"
            elif [[ "$ChargeMini" -eq 1 ]]; then
                # PLACE CHARGE MINI
                    ui_print " "
                    ui_print " [018] [Installing Particle Charging Animation]"
                    package_extract_file "overlay/MxGParticleAnimationOverlayHelper.apk" "$CHARGERMODPATH/Particle.apk"
            elif [[ "$ChargeBottle" -eq 1 ]]; then
                # PLACE CHARGE BOTTLE
                    ui_print " "
                    ui_print " [018] [Installing Bottle Charging Animation]"
                    package_extract_file "overlay/MxGBottleAnimationOverlayHelper.apk " "$CHARGERMODPATH/Bottle.apk"
            else
                ui_print " [030] [Skipping Charging Animation]"
            fi
    # # INSTALL AOD
        # CHECK AOD OPTIONS
            if [[ "$AodOpt" -eq 1 ]]; then
                # PLACE AOD
                if [[ "$HyperOS2" -eq "true" ]]; then
                    ui_print " "
                    ui_print " [037] [Placing AOD app for HyperOS $OS...]"
                    copy "$WORKLOAD/extracted/apks/aod/hyper2.apk" "$AODMODPATH/MIUIAod/MIUIAod.apk"
                elif [[ "$HyperOS1" -eq "true" ]]; then
                    ui_print " "
                    ui_print " [037] [Placing AOD app for HyperOS $OS...]"
                    copy "$WORKLOAD/extracted/apks/aod/hyper.apk" "$AODMODPATH/MIUIAod/MIUIAod.apk"
                fi
                # PLACE PROP
                    ui_print " "
                    ui_print " [040] [Adding AOD's properties...]"
                    copy "/product/etc/device_features/$DevName.xml" "/data/local/tmp/aod/xaml/$DevName.xml"
                    # DEVICE STUFF
                        if contains '    <bool name="is_xiaomi">' /data/local/tmp/aod/xaml/$DevName.xml; then
                            if contains '    <bool name="is_xiaomi">true</bool>' /data/local/tmp/aod/xaml/$DevName.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="is_xiaomi">false</bool>' '    <bool name="is_xiaomi">true</bool>' /data/local/tmp/aod/xaml/$DevName.xml
                            fi
                        else
                            add_lines_string -al '<features>' '    <bool name="is_xiaomi">true</bool>' /data/local/tmp/aod/xaml/$DevName.xml
                        fi
                    #
                        if contains '    <bool name="is_hongmi">' /data/local/tmp/aod/xaml/$DevName.xml; then
                            if contains '    <bool name="is_hongmi">false</bool>' /data/local/tmp/aod/xaml/$DevName.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="is_hongmi">true</bool>' '    <bool name="is_hongmi">false</bool>' /data/local/tmp/aod/xaml/$DevName.xml
                            fi
                        else
                            add_lines_string -al '<features>' '    <bool name="is_hongmi">false</bool>' /data/local/tmp/aod/xaml/$DevName.xml
                        fi
                    #
                        if contains '    <bool name="is_redmi">' /data/local/tmp/aod/xaml/$DevName.xml; then
                            if contains '    <bool name="is_redmi">false</bool>' /data/local/tmp/aod/xaml/$DevName.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="is_redmi">true</bool>' '    <bool name="is_redmi">false</bool>' /data/local/tmp/aod/xaml/$DevName.xml
                            fi
                        else
                            add_lines_string -al '<features>' '    <bool name="is_redmi">false</bool>' /data/local/tmp/aod/xaml/$DevName.xml
                        fi
                    # AOD STUFF
                        if contains '    <bool name="support_gesture_wakeup">' /data/local/tmp/aod/xaml/$DevName.xml; then
                            if contains '    <bool name="support_gesture_wakeup">true</bool>' /data/local/tmp/aod/xaml/$DevName.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="support_gesture_wakeup">false</bool>' '    <bool name="support_gesture_wakeup">true</bool>' /data/local/tmp/aod/xaml/$DevName.xml
                            fi
                        else
                            add_lines_string -al '<features>' '    <bool name="support_gesture_wakeup">true</bool>' /data/local/tmp/aod/xaml/$DevName.xml
                        fi
                    #
                        if contains '    <bool name="support_aod">' /data/local/tmp/aod/xaml/$DevName.xml; then
                            if contains '    <bool name="support_aod">true</bool>' /data/local/tmp/aod/xaml/$DevName.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="support_aod">false</bool>' '    <bool name="support_aod">true</bool>' /data/local/tmp/aod/xaml/$DevName.xml
                            fi
                        else
                            add_lines_string -al '<features>' '    <bool name="support_aod">true</bool>' /data/local/tmp/aod/xaml/$DevName.xml
                        fi
                    #
                        if contains '    <bool name="aod_support_keycode_goto_dismiss">' /data/local/tmp/aod/xaml/$DevName.xml; then
                            if contains '    <bool name="aod_support_keycode_goto_dismiss">true</bool>' /data/local/tmp/aod/xaml/$DevName.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="aod_support_keycode_goto_dismiss">false</bool>' '    <bool name="aod_support_keycode_goto_dismiss">true</bool>' /data/local/tmp/aod/xaml/$DevName.xml
                            fi
                        else
                            add_lines_string -al '<features>' '    <bool name="aod_support_keycode_goto_dismiss">true</bool>' /data/local/tmp/aod/xaml/$DevName.xml
                        fi
                    #
                        if contains '    <bool name="is_only_support_keycode_goto">' /data/local/tmp/aod/xaml/$DevName.xml; then
                            if contains '    <bool name="is_only_support_keycode_goto">false</bool>' /data/local/tmp/aod/xaml/$DevName.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="is_only_support_keycode_goto">true</bool>' '    <bool name="is_only_support_keycode_goto">false</bool>' /data/local/tmp/aod/xaml/$DevName.xml
                            fi
                        else
                            add_lines_string -al '<features>' '    <bool name="is_only_support_keycode_goto">false</bool>' /data/local/tmp/aod/xaml/$DevName.xml
                        fi
                    #
                        if contains '    <bool name="is_aod_need_grayscale">' /data/local/tmp/aod/xaml/$DevName.xml; then
                            if contains '    <bool name="is_aod_need_grayscale">false</bool>' /data/local/tmp/aod/xaml/$DevName.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="is_aod_need_grayscale">true</bool>' '    <bool name="is_aod_need_grayscale">false</bool>' /data/local/tmp/aod/xaml/$DevName.xml
                            fi
                        else
                            add_lines_string -al '<features>' '    <bool name="is_aod_need_grayscale">false</bool>' /data/local/tmp/aod/xaml/$DevName.xml
                        fi
                    #
                        if contains '    <bool name="support_screen_paper_mode">' /data/local/tmp/aod/xaml/$DevName.xml; then
                            if contains '    <bool name="support_screen_paper_mode">true</bool>' /data/local/tmp/aod/xaml/$DevName.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="support_screen_paper_mode">false</bool>' '    <bool name="support_screen_paper_mode">true</bool>' /data/local/tmp/aod/xaml/$DevName.xml
                            fi
                        else
                            add_lines_string -al '<features>' '    <bool name="support_screen_paper_mode">true</bool>' /data/local/tmp/aod/xaml/$DevName.xml
                        fi
                    #
                        if contains '    <bool name="support_aod_aon">' /data/local/tmp/aod/xaml/$DevName.xml; then
                            if contains '    <bool name="support_aod_aon">true</bool>' /data/local/tmp/aod/xaml/$DevName.xml; then
                                echo "bomb" > /dev/null
                            else
                                replace '    <bool name="support_aod_aon">false</bool>' '    <bool name="support_aod_aon">true</bool>' /data/local/tmp/aod/xaml/$DevName.xml
                            fi
                        else
                            add_lines_string -al '<features>' '    <bool name="support_aod_aon">true</bool>' /data/local/tmp/aod/xaml/$DevName.xml
                        fi
                    copy "/data/local/tmp/aod/xaml/$DevName.xml" "$MODPATH/system/product/etc/device_features/$DevName.xml"
                # GET OVERLAY
                    ui_print " "
                    ui_print " [069] [Installing overlays to system...]"
                    copy "$WORKLOAD/extracted/overlay/MxGSystemUIOverlayHelper.apk" "$MODPATH/system/product/overlay/MxGSysUIHelper/MxGSystemUIOverlayHelper.apk"
                    copy "$WORKLOAD/extracted/overlay/MxGFrameworkOverlayHelper.apk" "$MODPATH/system/product/overlay/MxGFrameworkHelper/MxGFrameworkOverlayHelper.apk"
                # PLACE PERMISSION PROP
                    ui_print " "
                    ui_print " [078] [Getting permission file]"
                    # CHECK WHENEVER IF ANDROID IS SMALLER OR EQUAL 12
                    if [[ "$Android" -le 12 ]]; then
                        PERMDEST="/system/etc/permissions/privapp-permissions-miui.xml"
                        FINALPERMDEST="$MODPATH/system/product/etc/permissions/privapp-permissions-aod.xml" # name changes
                        # FINALPERMDEST="$MODPATH/system/etc/permissions/privapp-permissions-aod.xml"
                    else
                        PERMDEST="/product/etc/permissions/privapp-permissions-product.xml"
                        FINALPERMDEST="$MODPATH/system/product/etc/permissions/privapp-permissions-aod.xml" # name changes
                        # FINALPERMDEST="$MODPATH/system/product/etc/permissions/privapp-permissions-aod.xml"
                    fi
                    # COPY 
                    # copy "$PERMDEST" /data/local/tmp/aod/permxaml.xml
                    # DOING THE WORK
#                         if contains '   <privapp-permissions package="com.miui.aod">' /data/local/tmp/aod/permxaml.xml; then
#                             xml_kit -open '<permissions>' '</permissions>' -open '<privapp-permissions package="com.miui.aod">' '</privapp-permissions>' /data/local/tmp/aod/permxaml.xml > /data/local/tmp/aod/temp.xml
#                             if contains '   <permission name="android.permission.BIND_WALLPAPER" />' /data/local/tmp/aod/temp.xml; then
#                                 echo "bomb" > /dev/null
#                             else
#                                 add_lines_string -al '   <privapp-permissions package="com.miui.aod">' '   <permission name="android.permission.BIND_WALLPAPER" />' /data/local/tmp/aod/permxaml.xml
#                             fi
#                         #
#                             if contains '   <permission name="android.permission.INTERACT_ACROSS_USERS" />' /data/local/tmp/aod/temp.xml; then
#                                 echo "bomb" > /dev/null
#                             else
#                                 add_lines_string -al '   <privapp-permissions package="com.miui.aod">' '   <permission name="android.permission.INTERACT_ACROSS_USERS" />' /data/local/tmp/aod/permxaml.xml
#                             fi
#                         #
#                             if contains '   <permission name="android.permission.READ_DREAM_STATE" />' /data/local/tmp/aod/temp.xml; then
#                                 echo "bomb" > /dev/null
#                             else
#                                 add_lines_string -al '   <privapp-permissions package="com.miui.aod">' '   <permission name="android.permission.READ_DREAM_STATE" />' /data/local/tmp/aod/permxaml.xml
#                             fi
#                         #
#                             if contains '   <permission name="android.permission.SCHEDULE_EXACT_ALARM" />' /data/local/tmp/aod/temp.xml; then
#                                 echo "bomb" > /dev/null
#                             else
#                                 add_lines_string -al '   <privapp-permissions package="com.miui.aod">' '   <permission name="android.permission.SCHEDULE_EXACT_ALARM" />' /data/local/tmp/aod/permxaml.xml
#                             fi
#                         # NO PERMISSIONS?
#                         else
#                             add_lines_string -bl "</permissions>" "   <privapp-permissions package="com.miui.aod">
#                           <permission name="android.permission.BIND_WALLPAPER" />
#                           <permission name="android.permission.INTERACT_ACROSS_USERS" />
#                           <permission name="android.permission.READ_DREAM_STATE" />
#                           <permission name="android.permission.SCHEDULE_EXACT_ALARM" />
#                        </privapp-permissions>" /data/local/tmp/aod/permxaml.xml
#                         fi
                    copy "$WORKLOAD/extracted/apks/aod/privapp-permissions-aod.xml"  "$FINALPERMDEST"
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
        echo '#!/system/bin/sh'                                       > $MODPATH/service.sh
        echo "MODDIR=\"\${0%/*}\""                                   >> $MODPATH/service.sh
        echo "BOOT=\$(getprop sys.boot_completed)"                   >> $MODPATH/service.sh
        echo "sleep 60"                                              >> $MODPATH/service.sh
        echo "if [[ \"\$BOOT\" != \"1\" ]]; then"                    >> $MODPATH/service.sh
        echo "  rm -rf /data/system/package_cache"                   >> $MODPATH/service.sh
        echo "  cp \$MODDIR/notify.sh /data/adb/service.d/notify.sh" >> $MODPATH/service.sh
        echo "  chmod +x /data/adb/service.d/notify.sh"              >> $MODPATH/service.sh
        echo "  touch \$MODDIR/disable"                              >> $MODPATH/service.sh
        echo "  reboot"                                              >> $MODPATH/service.sh
        echo "fi"                                                    >> $MODPATH/service.sh
        package_extract_file notify.sh $MODPATH/notify.sh
        ui_print " [100] Added some self-protections"

ui_print " "
ui_print " [✓] DONE! You may now reboot your device."
if [[ "$ChargeMini" -eq 1 ]]; then
    ui_print " [!] BEFORE REBOOT!!!"
    ui_print "     Since you selected Particle Charge animation"
    ui_print "     You may need to use 'Voyager' LSPosed module to enable animation"
    ui_print "     (find Particle Charging Animation somewhere in SystemUI)"
    ui_print " \n \n "
fi
rm -r /data/local/tmp/aod
