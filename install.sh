#!/system/bin/sh
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
        TMP_FEAT="/data/local/tmp/aod/xaml/$DevName.xml"
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
    package_extract_file "apks.tar.xz" $WORKLOAD/apks.tar.xz
    package_extract_file "overlay.tar.xz" $WORKLOAD/overlay.tar.xz
    tar xJf $WORKLOAD/apks.tar.xz -C $WORKLOAD/extracted
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
        if [[ "$HyperOS2" != "true" ]]; then
            ui_print " [1] Glow (Flagship)"
            ui_print " [2] Particle Animation"
            ui_print " [3] Ripple Animation (from HyperOS2)"
            ui_print " [4] Bottle Animation (flowing to battery packet)"
            ui_print " [5] Skip"
        else
            ui_print " [1] Glow (Flagship)"
            ui_print " [2] Particle Animation"
            ui_print " [3] Bottle Animation (flowing to battery packet)"
            ui_print " [4] Skip"
        fi
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

        if [[ "$HyperOS2" != "true" ]]; then
            case "$cm" in
                "1") option="Glow Animation" ;;
                "2") option="Ripple Animation" ;;
                "3") option="Bottle Animation" ;;
                "4") option="Skip charging animation mod" ;;
            esac
        else
            case "$cm" in
                "1") option="Glow Animation" ;;
                "2") option="Particle Animation" ;;
                "3") option="Bottle Animation" ;;
                "4") option="Skip charging animation mod" ;;
            esac
        fi
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
            elif [[ "$option" == "Ripple Animation" ]]; then
                      ui_print "--------------------"
                      ui_print " [i] Added Ripple to queue."
                      ChargeRipple=1
            elif [[ "$option" == "Bottle Animation" ]]; then
                      ui_print "--------------------"
                      ui_print " [i] Added Bottle to queue."
                      ChargeBottle=1
            elif [[ "$option" == "Skip charging animation mod" ]]; then
                      ui_print "--------------------"
                      ui_print " [i] Skipped."
            fi

 # OVERLAY MOD
            # PRINT OUT PROMPT
                ui_print " "
                ui_print "--------------------"
                ui_print " Extra Overlays"
                ui_print " "
                ui_print " Do you want to add Extra Overlays?"
                ui_print " "
                ui_print " This will replace current fingerprint"
                ui_print " animation with HyperOS2 style, along"
                ui_print " with other minor changes."
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
                    ExtOverlay=1
                else
                    ui_print "--------------------"
                    ui_print " [i] Skipped."
                fi

 # AOD MOD
    # CHECK PACKAGE LOGIC
        if [ "$MIUI" == "true" ]; then
            ui_print " [!] Device is MIUI. Skipping AOD installation."
        elif grep -q '<bool name="support_aod">true</bool>' "/product/etc/$DevName.xml" && ! grep -q '<bool name="is_mxg_installed">true</bool>' "/product/etc/$DevName.xml"; then
            ui_print " [!] Device already supports AOD. Skipping AOD installation."
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
                elif [[ "$ChargeRipple" -eq 1 ]]; then
                ui_print " "
                ui_print " - Charging Animation - Ripple"
                elif [[ "$ChargeBottle" -eq 1 ]]; then
                ui_print " "
                ui_print " - Charging Animation - Bottle"
                fi
            # AOD CHECK
                if [[ "$ExtOverlay" -eq 1 ]]; then
                ui_print " "
                ui_print " - Extra overlay "
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
                AODMODPATH="$MODPATH/system/product/priv-app/MIUIAod/MIUIAod.apk"
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
                            # CHECK PATH
                            copy "/product/etc/device_features/$DevName.xml" "$TMP_FEAT"
                            DEVFEAT=1
                            # DEVICE STUFF
                            update_feature "is_xiaomi" "true" "$TMP_FEAT"
                            update_feature "is_hongmi" "false" "$TMP_FEAT"
                            update_feature "is_redmi" "true" "$TMP_FEAT"
                            update_feature "btdebug_enabled" "true" "$TMP_FEAT"
                            update_feature "camera_adjust_picture_size_enabled" "true" "$TMP_FEAT"
                            update_feature "camera_is_support_portrait_front" "true" "$TMP_FEAT"
                            update_feature "camera_is_support_portrait_switch" "true" "$TMP_FEAT"
                            update_feature "camera_support_ai_lens" "true" "$TMP_FEAT"
                            update_feature "camera_supported_scene" "true" "$TMP_FEAT"
                            update_feature "config_camera_refresh_rate_policy" "true" "$TMP_FEAT"
                            update_feature "config_sunlight_mode_available" "true" "$TMP_FEAT"
                            update_feature "default_schedule_led_on" "true" "$TMP_FEAT"
                            update_feature "disable_video_stabilization_in_speed_slow_mode" "true" "$TMP_FEAT"
                            update_feature "enable_flash_global" "true" "$TMP_FEAT"
                            update_feature "enhance_beauty_with_hht" "true" "$TMP_FEAT"
                            update_feature "fingerprint_wakeup_device" "true" "$TMP_FEAT"
                            update_feature "gallery_support_analytic_face_and_scene" "true" "$TMP_FEAT"
                            update_feature "gallery_support_dolby" "true" "$TMP_FEAT"
                            update_feature "gallery_support_media_feature" "true" "$TMP_FEAT"
                            update_feature "gallery_support_print" "true" "$TMP_FEAT"
                            update_feature "gallery_support_time_burst_video" "true" "$TMP_FEAT"
                            update_feature "gallery_support_video_compress" "true" "$TMP_FEAT"
                            update_feature "is_camera_app_water_mark" "true" "$TMP_FEAT"
                            update_feature "is_camera_hold_blur_background" "true" "$TMP_FEAT"
                            update_feature "is_camera_lower_qrscan_frequency" "true" "$TMP_FEAT"
                            update_feature "is_camera_preview_with_subthread_looper" "true" "$TMP_FEAT"
                            update_feature "is_camera_use_morpho_lib" "true" "$TMP_FEAT"
                            update_feature "is_compatible_paper_and_screen_effect" "true" "$TMP_FEAT"
                            update_feature "is_default_temporary_style" "true" "$TMP_FEAT"
                            update_feature "is_full_size_effect" "true" "$TMP_FEAT"
                            update_feature "is_support_fingerprint_tap" "true" "$TMP_FEAT"
                            update_feature "is_support_optical_zoom" "true" "$TMP_FEAT"
                            update_feature "is_support_portrait" "true" "$TMP_FEAT"
                            update_feature "is_support_video_tool_box" "true" "$TMP_FEAT"
                            update_feature "is_video_screen" "true" "$TMP_FEAT"
                            update_feature "is_xiaomi_device" "true" "$TMP_FEAT"
                            update_feature "need_remove_expert_bright" "true" "$TMP_FEAT"
                            update_feature "need_video_stabilization_crop" "true" "$TMP_FEAT"
                            update_feature "remove_vgpaper" "true" "$TMP_FEAT"
                            update_feature "sensor_has_latency" "true" "$TMP_FEAT"
                            update_feature "stop_luxb_when_colorled_open" "true" "$TMP_FEAT"
                            update_feature "support_12bit_backlight" "true" "$TMP_FEAT"
                            update_feature "support_24bit_record" "true" "$TMP_FEAT"
                            update_feature "support_3d_face_beauty" "true" "$TMP_FEAT"
                            update_feature "support_adaptive_sampler" "true" "$TMP_FEAT"
                            update_feature "support_ai_task" "true" "$TMP_FEAT"
                            update_feature "support_alpha_optimized" "true" "$TMP_FEAT"
                            update_feature "support_android_flashlight" "true" "$TMP_FEAT"
                            update_feature "support_app_hiding" "true" "$TMP_FEAT"
                            update_feature "support_ar_core" "true" "$TMP_FEAT"
                            update_feature "support_audio_loopback" "true" "$TMP_FEAT"
                            update_feature "support_audio_share" "true" "$TMP_FEAT"
                            update_feature "support_autobrightness_by_application_category" "true" "$TMP_FEAT"
                            update_feature "support_autobrightness_optimize" "true" "$TMP_FEAT"
                            update_feature "support_ca" "true" "$TMP_FEAT"
                            update_feature "support_cabc" "true" "$TMP_FEAT"
                            update_feature "support_camera_4k_quality" "true" "$TMP_FEAT"
                            update_feature "support_camera_age_detection" "true" "$TMP_FEAT"
                            update_feature "support_camera_aohdr" "true" "$TMP_FEAT"
                            update_feature "support_camera_audio_focus" "true" "$TMP_FEAT"
                            update_feature "support_camera_boost_brightness" "true" "$TMP_FEAT"
                            update_feature "support_camera_burst_shoot" "true" "$TMP_FEAT"
                            update_feature "support_camera_burst_shoot_denoise" "true" "$TMP_FEAT"
                            update_feature "support_camera_dynamic_light_spot" "true" "$TMP_FEAT"
                            update_feature "support_camera_face_info_water_mark" "true" "$TMP_FEAT"
                            update_feature "support_camera_gradienter" "true" "$TMP_FEAT"
                            update_feature "support_camera_groupshot" "true" "$TMP_FEAT"
                            update_feature "support_camera_hfr" "true" "$TMP_FEAT"
                            update_feature "support_camera_magic_mirror" "true" "$TMP_FEAT"
                            update_feature "support_camera_manual_function" "true" "$TMP_FEAT"
                            update_feature "support_camera_manual_function_et" "true" "$TMP_FEAT"
                            update_feature "support_camera_manual_function_focus" "true" "$TMP_FEAT"
                            update_feature "support_camera_movie_solid" "true" "$TMP_FEAT"
                            update_feature "support_camera_new_style_time_water_mark" "true" "$TMP_FEAT"
                            update_feature "support_camera_peaking_mf" "true" "$TMP_FEAT"
                            update_feature "support_camera_press_down_capture" "true" "$TMP_FEAT"
                            update_feature "support_camera_quick_snap" "true" "$TMP_FEAT"
                            update_feature "support_camera_record_location" "true" "$TMP_FEAT"
                            update_feature "support_camera_satellite" "true" "$TMP_FEAT"
                            update_feature "support_camera_shader_effect" "true" "$TMP_FEAT"
                            update_feature "support_camera_skin_beauty" "true" "$TMP_FEAT"
                            update_feature "support_camera_square_mode" "true" "$TMP_FEAT"
                            update_feature "support_camera_tilt_shift" "true" "$TMP_FEAT"
                            update_feature "support_camera_torch_capture" "true" "$TMP_FEAT"
                            update_feature "support_camera_video_face_detection" "true" "$TMP_FEAT"
                            update_feature "support_camera_video_pause" "true" "$TMP_FEAT"
                            update_feature "support_camera_water_mark" "true" "$TMP_FEAT"
                            update_feature "support_cloud_dim" "true" "$TMP_FEAT"
                            update_feature "support_conversation_toolbox_voiprecord" "true" "$TMP_FEAT"
                            update_feature "support_dark_mode_notify" "true" "$TMP_FEAT"
                            update_feature "support_decrease_brightness_spec_app" "true" "$TMP_FEAT"
                            update_feature "support_display_expert_mode" "true" "$TMP_FEAT"
                            update_feature "support_displayfeature_gamemode" "true" "$TMP_FEAT"
                            update_feature "support_dolby" "true" "$TMP_FEAT"
                            update_feature "support_dolby_version_brighten" "true" "$TMP_FEAT"
                            update_feature "support_extreme_battery_saver" "true" "$TMP_FEAT"
                            update_feature "support_feedback_level" "true" "$TMP_FEAT"
                            update_feature "support_fm" "true" "$TMP_FEAT"
                            update_feature "support_front_beauty_mfnr" "true" "$TMP_FEAT"
                            update_feature "support_front_bokeh" "true" "$TMP_FEAT"
                            update_feature "support_front_flash" "true" "$TMP_FEAT"
                            update_feature "support_front_hdr" "true" "$TMP_FEAT"
                            update_feature "support_front_hht" "true" "$TMP_FEAT"
                            update_feature "support_front_hht_enhance" "true" "$TMP_FEAT"
                            update_feature "support_full_size_panorama" "true" "$TMP_FEAT"
                            update_feature "support_gallery_hdr" "true" "$TMP_FEAT"
                            update_feature "support_game_dim" "true" "$TMP_FEAT"
                            update_feature "support_game_gunsight" "true" "$TMP_FEAT"
                            update_feature "support_game_mi_time" "true" "$TMP_FEAT"
                            update_feature "support_hangup_while_screen_off" "true" "$TMP_FEAT"
                            update_feature "support_hdr_enhance" "true" "$TMP_FEAT"
                            update_feature "support_hdr_hbm_brighten" "true" "$TMP_FEAT"
                            update_feature "support_headset" "true" "$TMP_FEAT"
                            update_feature "support_heartbeat_rate" "true" "$TMP_FEAT"
                            update_feature "support_hide_discoverable" "true" "$TMP_FEAT"
                            update_feature "support_high_resolution" "true" "$TMP_FEAT"
                            update_feature "support_idle_dim" "true" "$TMP_FEAT"
                            update_feature "support_interview_record_param" "true" "$TMP_FEAT"
                            update_feature "support_ir" "true" "$TMP_FEAT"
                            update_feature "support_lhdc" "true" "$TMP_FEAT"
                            update_feature "support_lhdc_offload" "true" "$TMP_FEAT"
                            update_feature "support_local_ocr" "true" "$TMP_FEAT"
                            update_feature "support_main_xiaoai" "true" "$TMP_FEAT"
                            update_feature "support_manual_brightness_boost" "true" "$TMP_FEAT"
                            update_feature "support_manual_dimming" "true" "$TMP_FEAT"
                            update_feature "support_media_feedback" "true" "$TMP_FEAT"
                            update_feature "support_mi_game_macro" "true" "$TMP_FEAT"
                            update_feature "support_miplay_cast_privacy" "true" "$TMP_FEAT"
                            update_feature "support_multi_face_input" "true" "$TMP_FEAT"
                            update_feature "support_multi_face_input_global" "true" "$TMP_FEAT"
                            update_feature "support_my_device" "true" "$TMP_FEAT"
                            update_feature "support_nature_mode" "true" "$TMP_FEAT"
                            update_feature "support_network_rps_mode" "true" "$TMP_FEAT"
                            update_feature "support_new_silentmode" "true" "$TMP_FEAT"
                            update_feature "support_object_track" "true" "$TMP_FEAT"
                            update_feature "support_paper_eyecare" "true" "$TMP_FEAT"
                            update_feature "support_papermode_animation" "true" "$TMP_FEAT"
                            update_feature "support_parental_control" "true" "$TMP_FEAT"
                            update_feature "support_phone_call_noise_suppression" "true" "$TMP_FEAT"
                            update_feature "support_picture_watermark" "true" "$TMP_FEAT"
                            update_feature "support_power_mode" "true" "$TMP_FEAT"
                            update_feature "support_power_save_new" "true" "$TMP_FEAT"
                            update_feature "support_pre_installed_application" "true" "$TMP_FEAT"
                            update_feature "support_provision_app_permission" "true" "$TMP_FEAT"
                            update_feature "support_realtime_manual_exposure_time" "true" "$TMP_FEAT"
                            update_feature "support_round_corner" "true" "$TMP_FEAT"
                            update_feature "support_screen_effect" "true" "$TMP_FEAT"
                            update_feature "support_screen_enhance_engine" "true" "$TMP_FEAT"
                            update_feature "support_screen_light" "true" "$TMP_FEAT"
                            update_feature "support_screen_on_delayed" "true" "$TMP_FEAT"
                            update_feature "support_screen_optimize" "true" "$TMP_FEAT"
                            update_feature "support_se_route" "true" "$TMP_FEAT"
                            update_feature "support_show_basic_items" "true" "$TMP_FEAT"
                            update_feature "support_sign_verify_in_cust" "true" "$TMP_FEAT"
                            update_feature "support_simple_launcher" "true" "$TMP_FEAT"
                            update_feature "support_smart_fps" "true" "$TMP_FEAT"
                            update_feature "support_sound_assist" "true" "$TMP_FEAT"
                            update_feature "support_steps_provider" "true" "$TMP_FEAT"
                            update_feature "support_stereo_record" "true" "$TMP_FEAT"
                            update_feature "support_super_resolution" "true" "$TMP_FEAT"
                            update_feature "support_torch" "true" "$TMP_FEAT"
                            update_feature "support_touch_sensitive" "true" "$TMP_FEAT"
                            update_feature "support_touchfeature_gamemode" "true" "$TMP_FEAT"
                            update_feature "support_true_color" "true" "$TMP_FEAT"
                            update_feature "support_truetone" "true" "$TMP_FEAT"
                            update_feature "support_ui_orientation_v2" "true" "$TMP_FEAT"
                            update_feature "support_videobox_display_effect" "true" "$TMP_FEAT"
                            update_feature "support_voip_record" "true" "$TMP_FEAT"
                            update_feature "support_wapi" "true" "$TMP_FEAT"
                            update_feature "support_wifi_low_latency_mode" "true" "$TMP_FEAT"
                            update_float "camera_exposure_compensation_steps_num" "12.0" "$TMP_FEAT"
                            update_float "camera_front_count_down_margin" "0.3177" "$TMP_FEAT"
                            update_float "device_body_sar" "0.674" "$TMP_FEAT"
                            update_float "device_head_sar" "0.851" "$TMP_FEAT"
                            update_float "paper_eyecare_default_value" "91.0" "$TMP_FEAT"
                            update_float "paper_mode_max_level" "255.0" "$TMP_FEAT"
                            update_float "paper_mode_min_level" "58.0" "$TMP_FEAT"
                            update_int "burst_shoot_count" "100" "$TMP_FEAT"
                            update_int "camera_reduce_preview_flag" "12" "$TMP_FEAT"
                            update_int "camera_supported_asd" "11" "$TMP_FEAT"
                            update_int "camera_supported_front_asd" "10" "$TMP_FEAT"
                            update_int "cpu_max_freq" "240" "$TMP_FEAT"
                            update_int "default_eyecare_mode" "2" "$TMP_FEAT"
                            update_int "gallery_device_series" "2" "$TMP_FEAT"
                            update_int "ifaa_2dfa_support" "0" "$TMP_FEAT"
                            update_int "paper_eyecare_default_texture" "0" "$TMP_FEAT"
                            update_int "paper_eyecare_max_texture" "35" "$TMP_FEAT"
                            update_int "paper_eyecare_min_texture" "0" "$TMP_FEAT"
                            update_int "screen_effect_supported" "7" "$TMP_FEAT"
                            update_int "screen_standard_mode" "2" "$TMP_FEAT"
                            update_int "support_camera_front_hdr_default_value" "1" "$TMP_FEAT"
                            update_int "support_camera_hdr_default_value" "3" "$TMP_FEAT"
                            update_int "support_inner_record" "1" "$TMP_FEAT"
                            update_int "support_widevine_l1" "1" "$TMP_FEAT"
                            update_int "type_mqs_finger_record" "3" "$TMP_FEAT"
                            update_int "type_soter_finger_pay" "2" "$TMP_FEAT"
                            update_str "camera_continuous_shot_callback_class" "ContinuousShotCallback" "$TMP_FEAT"
                            update_str "camera_continuous_shot_callback_setter" "setContinuousShotCallback" "$TMP_FEAT"
                            update_str "extra_still_beautify_value" "i:2" "$TMP_FEAT"
                            update_str "finger_alipay_ifaa_model" "Xiaomi-camellia" "$TMP_FEAT"
                            update_str "game_enhance_feature_name" "game_enhance_fisr" "$TMP_FEAT"
                            copy "$TMP_FEAT" "$MODPATH/system/product/etc/device_features/$DevName.xml"
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
            elif [[ "$ChargeRipple" -eq 1 ]]; then
                # PLACE CHARGE RIPPLE
                    ui_print " "
                    ui_print " [018] [Installing Ripple Charging Animation]"
                    package_extract_file "overlay/MxGRippleAnimationOverlayHelper.apk" "$CHARGERMODPATH/Particle.apk"
            elif [[ "$ChargeBottle" -eq 1 ]]; then
                # PLACE CHARGE BOTTLE
                    ui_print " "
                    ui_print " [018] [Installing Bottle Charging Animation]"
                    package_extract_file "overlay/MxGBottleAnimationOverlayHelper.apk " "$CHARGERMODPATH/Bottle.apk"
            else
                ui_print " [030] [Skipping Charging Animation]"
            fi
    # INSTALL EXT OVERLAY
        # CHECK EXT OVERLAY OPTIONS
            if [[ "$ExtOverlay" -eq 1 ]]; then
                # PLACE EXT OVERLAY
                    ui_print " "
                    ui_print " [033] [Installing Extra Overlays...]"
                    package_extract_file "overlay/MxGExtraOverlayHelper.apk" "$AODMODPATH/overlay/MxGExtraOverlayHelper/MxGExtraOverlayHelper.apk"
            else
                ui_print " [040] [Skipping Extra Overlays]"
            fi
    # # INSTALL AOD
        # CHECK AOD OPTIONS
            if [[ "$AodOpt" -eq 1 ]]; then
                # PLACE AOD
                if [[ "$HyperOS2" -eq "true" ]]; then
                    HAOD="$WORKLOAD/extracted/apks/aod/hyper2.apk"
                    ui_print " "
                    ui_print " [037] [Placing AOD app for HyperOS $OS...]"
                    copy $HAOD "$AODMODPATH"
                elif [[ "$HyperOS1" -eq "true" ]]; then
                    HAOD="$WORKLOAD/extracted/apks/aod/hyper.apk"
                    ui_print " "
                    ui_print " [037] [Placing AOD app for HyperOS $OS...]"
                    copy $HAOD "$AODMODPATH"
                fi
                # PLACE PROP
                    ui_print " "
                    ui_print " [040] [Adding AOD's properties...]"
                    
                    if [ ! -f "$TMP_FEAT" ]; then
                        copy "/product/etc/device_features/$DevName.xml" "$TMP_FEAT"
                    fi
                    # MODULE SIDE
                    update_feature "is_mxg_installed" "true" "$TMP_FEAT"

                    if [[ "$DEVFEAT" != 1 ]]; then
                        # DEVICE STUFF
                        update_feature "is_xiaomi" "true" "$TMP_FEAT"
                        update_feature "is_hongmi" "false" "$TMP_FEAT"
                        update_feature "is_redmi" "false" "$TMP_FEAT"
                        update_feature "btdebug_enabled" "true" "$TMP_FEAT"
                        update_feature "camera_adjust_picture_size_enabled" "true" "$TMP_FEAT"
                        update_feature "camera_is_support_portrait_front" "true" "$TMP_FEAT"
                        update_feature "camera_is_support_portrait_switch" "true" "$TMP_FEAT"
                        update_feature "camera_support_ai_lens" "true" "$TMP_FEAT"
                        update_feature "camera_supported_scene" "true" "$TMP_FEAT"
                        update_feature "config_camera_refresh_rate_policy" "true" "$TMP_FEAT"
                        update_feature "config_sunlight_mode_available" "true" "$TMP_FEAT"
                        update_feature "default_schedule_led_on" "true" "$TMP_FEAT"
                        update_feature "disable_video_stabilization_in_speed_slow_mode" "true" "$TMP_FEAT"
                        update_feature "enable_flash_global" "true" "$TMP_FEAT"
                        update_feature "enhance_beauty_with_hht" "true" "$TMP_FEAT"
                        update_feature "fingerprint_wakeup_device" "true" "$TMP_FEAT"
                        update_feature "gallery_support_analytic_face_and_scene" "true" "$TMP_FEAT"
                        update_feature "gallery_support_dolby" "true" "$TMP_FEAT"
                        update_feature "gallery_support_media_feature" "true" "$TMP_FEAT"
                        update_feature "gallery_support_print" "true" "$TMP_FEAT"
                        update_feature "gallery_support_time_burst_video" "true" "$TMP_FEAT"
                        update_feature "gallery_support_video_compress" "true" "$TMP_FEAT"
                        update_feature "is_camera_app_water_mark" "true" "$TMP_FEAT"
                        update_feature "is_camera_hold_blur_background" "true" "$TMP_FEAT"
                        update_feature "is_camera_lower_qrscan_frequency" "true" "$TMP_FEAT"
                        update_feature "is_camera_preview_with_subthread_looper" "true" "$TMP_FEAT"
                        update_feature "is_camera_use_morpho_lib" "true" "$TMP_FEAT"
                        update_feature "is_compatible_paper_and_screen_effect" "true" "$TMP_FEAT"
                        update_feature "is_default_temporary_style" "true" "$TMP_FEAT"
                        update_feature "is_full_size_effect" "true" "$TMP_FEAT"
                        update_feature "is_support_fingerprint_tap" "true" "$TMP_FEAT"
                        update_feature "is_support_optical_zoom" "true" "$TMP_FEAT"
                        update_feature "is_support_portrait" "true" "$TMP_FEAT"
                        update_feature "is_support_video_tool_box" "true" "$TMP_FEAT"
                        update_feature "is_video_screen" "true" "$TMP_FEAT"
                        update_feature "is_xiaomi_device" "true" "$TMP_FEAT"
                        update_feature "need_remove_expert_bright" "true" "$TMP_FEAT"
                        update_feature "need_video_stabilization_crop" "true" "$TMP_FEAT"
                        update_feature "remove_vgpaper" "true" "$TMP_FEAT"
                        update_feature "sensor_has_latency" "true" "$TMP_FEAT"
                        update_feature "stop_luxb_when_colorled_open" "true" "$TMP_FEAT"
                        update_feature "support_12bit_backlight" "true" "$TMP_FEAT"
                        update_feature "support_24bit_record" "true" "$TMP_FEAT"
                        update_feature "support_3d_face_beauty" "true" "$TMP_FEAT"
                        update_feature "support_adaptive_sampler" "true" "$TMP_FEAT"
                        update_feature "support_ai_task" "true" "$TMP_FEAT"
                        update_feature "support_alpha_optimized" "true" "$TMP_FEAT"
                        update_feature "support_android_flashlight" "true" "$TMP_FEAT"
                        update_feature "support_app_hiding" "true" "$TMP_FEAT"
                        update_feature "support_ar_core" "true" "$TMP_FEAT"
                        update_feature "support_audio_loopback" "true" "$TMP_FEAT"
                        update_feature "support_audio_share" "true" "$TMP_FEAT"
                        update_feature "support_autobrightness_by_application_category" "true" "$TMP_FEAT"
                        update_feature "support_autobrightness_optimize" "true" "$TMP_FEAT"
                        update_feature "support_ca" "true" "$TMP_FEAT"
                        update_feature "support_cabc" "true" "$TMP_FEAT"
                        update_feature "support_camera_4k_quality" "true" "$TMP_FEAT"
                        update_feature "support_camera_age_detection" "true" "$TMP_FEAT"
                        update_feature "support_camera_aohdr" "true" "$TMP_FEAT"
                        update_feature "support_camera_audio_focus" "true" "$TMP_FEAT"
                        update_feature "support_camera_boost_brightness" "true" "$TMP_FEAT"
                        update_feature "support_camera_burst_shoot" "true" "$TMP_FEAT"
                        update_feature "support_camera_burst_shoot_denoise" "true" "$TMP_FEAT"
                        update_feature "support_camera_dynamic_light_spot" "true" "$TMP_FEAT"
                        update_feature "support_camera_face_info_water_mark" "true" "$TMP_FEAT"
                        update_feature "support_camera_gradienter" "true" "$TMP_FEAT"
                        update_feature "support_camera_groupshot" "true" "$TMP_FEAT"
                        update_feature "support_camera_hfr" "true" "$TMP_FEAT"
                        update_feature "support_camera_magic_mirror" "true" "$TMP_FEAT"
                        update_feature "support_camera_manual_function" "true" "$TMP_FEAT"
                        update_feature "support_camera_manual_function_et" "true" "$TMP_FEAT"
                        update_feature "support_camera_manual_function_focus" "true" "$TMP_FEAT"
                        update_feature "support_camera_movie_solid" "true" "$TMP_FEAT"
                        update_feature "support_camera_new_style_time_water_mark" "true" "$TMP_FEAT"
                        update_feature "support_camera_peaking_mf" "true" "$TMP_FEAT"
                        update_feature "support_camera_press_down_capture" "true" "$TMP_FEAT"
                        update_feature "support_camera_quick_snap" "true" "$TMP_FEAT"
                        update_feature "support_camera_record_location" "true" "$TMP_FEAT"
                        update_feature "support_camera_satellite" "true" "$TMP_FEAT"
                        update_feature "support_camera_shader_effect" "true" "$TMP_FEAT"
                        update_feature "support_camera_skin_beauty" "true" "$TMP_FEAT"
                        update_feature "support_camera_square_mode" "true" "$TMP_FEAT"
                        update_feature "support_camera_tilt_shift" "true" "$TMP_FEAT"
                        update_feature "support_camera_torch_capture" "true" "$TMP_FEAT"
                        update_feature "support_camera_video_face_detection" "true" "$TMP_FEAT"
                        update_feature "support_camera_video_pause" "true" "$TMP_FEAT"
                        update_feature "support_camera_water_mark" "true" "$TMP_FEAT"
                        update_feature "support_cloud_dim" "true" "$TMP_FEAT"
                        update_feature "support_conversation_toolbox_voiprecord" "true" "$TMP_FEAT"
                        update_feature "support_dark_mode_notify" "true" "$TMP_FEAT"
                        update_feature "support_decrease_brightness_spec_app" "true" "$TMP_FEAT"
                        update_feature "support_display_expert_mode" "true" "$TMP_FEAT"
                        update_feature "support_displayfeature_gamemode" "true" "$TMP_FEAT"
                        update_feature "support_dolby" "true" "$TMP_FEAT"
                        update_feature "support_dolby_version_brighten" "true" "$TMP_FEAT"
                        update_feature "support_extreme_battery_saver" "true" "$TMP_FEAT"
                        update_feature "support_feedback_level" "true" "$TMP_FEAT"
                        update_feature "support_fm" "true" "$TMP_FEAT"
                        update_feature "support_front_beauty_mfnr" "true" "$TMP_FEAT"
                        update_feature "support_front_bokeh" "true" "$TMP_FEAT"
                        update_feature "support_front_flash" "true" "$TMP_FEAT"
                        update_feature "support_front_hdr" "true" "$TMP_FEAT"
                        update_feature "support_front_hht" "true" "$TMP_FEAT"
                        update_feature "support_front_hht_enhance" "true" "$TMP_FEAT"
                        update_feature "support_full_size_panorama" "true" "$TMP_FEAT"
                        update_feature "support_gallery_hdr" "true" "$TMP_FEAT"
                        update_feature "support_game_dim" "true" "$TMP_FEAT"
                        update_feature "support_game_gunsight" "true" "$TMP_FEAT"
                        update_feature "support_game_mi_time" "true" "$TMP_FEAT"
                        update_feature "support_hangup_while_screen_off" "true" "$TMP_FEAT"
                        update_feature "support_hdr_enhance" "true" "$TMP_FEAT"
                        update_feature "support_hdr_hbm_brighten" "true" "$TMP_FEAT"
                        update_feature "support_headset" "true" "$TMP_FEAT"
                        update_feature "support_heartbeat_rate" "true" "$TMP_FEAT"
                        update_feature "support_hide_discoverable" "true" "$TMP_FEAT"
                        update_feature "support_high_resolution" "true" "$TMP_FEAT"
                        update_feature "support_idle_dim" "true" "$TMP_FEAT"
                        update_feature "support_interview_record_param" "true" "$TMP_FEAT"
                        update_feature "support_ir" "true" "$TMP_FEAT"
                        update_feature "support_lhdc" "true" "$TMP_FEAT"
                        update_feature "support_lhdc_offload" "true" "$TMP_FEAT"
                        update_feature "support_local_ocr" "true" "$TMP_FEAT"
                        update_feature "support_main_xiaoai" "true" "$TMP_FEAT"
                        update_feature "support_manual_brightness_boost" "true" "$TMP_FEAT"
                        update_feature "support_manual_dimming" "true" "$TMP_FEAT"
                        update_feature "support_media_feedback" "true" "$TMP_FEAT"
                        update_feature "support_mi_game_macro" "true" "$TMP_FEAT"
                        update_feature "support_miplay_cast_privacy" "true" "$TMP_FEAT"
                        update_feature "support_multi_face_input" "true" "$TMP_FEAT"
                        update_feature "support_multi_face_input_global" "true" "$TMP_FEAT"
                        update_feature "support_my_device" "true" "$TMP_FEAT"
                        update_feature "support_nature_mode" "true" "$TMP_FEAT"
                        update_feature "support_network_rps_mode" "true" "$TMP_FEAT"
                        update_feature "support_new_silentmode" "true" "$TMP_FEAT"
                        update_feature "support_object_track" "true" "$TMP_FEAT"
                        update_feature "support_paper_eyecare" "true" "$TMP_FEAT"
                        update_feature "support_papermode_animation" "true" "$TMP_FEAT"
                        update_feature "support_parental_control" "true" "$TMP_FEAT"
                        update_feature "support_phone_call_noise_suppression" "true" "$TMP_FEAT"
                        update_feature "support_picture_watermark" "true" "$TMP_FEAT"
                        update_feature "support_power_mode" "true" "$TMP_FEAT"
                        update_feature "support_power_save_new" "true" "$TMP_FEAT"
                        update_feature "support_pre_installed_application" "true" "$TMP_FEAT"
                        update_feature "support_provision_app_permission" "true" "$TMP_FEAT"
                        update_feature "support_realtime_manual_exposure_time" "true" "$TMP_FEAT"
                        update_feature "support_round_corner" "true" "$TMP_FEAT"
                        update_feature "support_screen_effect" "true" "$TMP_FEAT"
                        update_feature "support_screen_enhance_engine" "true" "$TMP_FEAT"
                        update_feature "support_screen_light" "true" "$TMP_FEAT"
                        update_feature "support_screen_on_delayed" "true" "$TMP_FEAT"
                        update_feature "support_screen_optimize" "true" "$TMP_FEAT"
                        update_feature "support_se_route" "true" "$TMP_FEAT"
                        update_feature "support_show_basic_items" "true" "$TMP_FEAT"
                        update_feature "support_sign_verify_in_cust" "true" "$TMP_FEAT"
                        update_feature "support_simple_launcher" "true" "$TMP_FEAT"
                        update_feature "support_smart_fps" "true" "$TMP_FEAT"
                        update_feature "support_sound_assist" "true" "$TMP_FEAT"
                        update_feature "support_steps_provider" "true" "$TMP_FEAT"
                        update_feature "support_stereo_record" "true" "$TMP_FEAT"
                        update_feature "support_super_resolution" "true" "$TMP_FEAT"
                        update_feature "support_torch" "true" "$TMP_FEAT"
                        update_feature "support_touch_sensitive" "true" "$TMP_FEAT"
                        update_feature "support_touchfeature_gamemode" "true" "$TMP_FEAT"
                        update_feature "support_true_color" "true" "$TMP_FEAT"
                        update_feature "support_truetone" "true" "$TMP_FEAT"
                        update_feature "support_ui_orientation_v2" "true" "$TMP_FEAT"
                        update_feature "support_videobox_display_effect" "true" "$TMP_FEAT"
                        update_feature "support_voip_record" "true" "$TMP_FEAT"
                        update_feature "support_wapi" "true" "$TMP_FEAT"
                        update_feature "support_wifi_low_latency_mode" "true" "$TMP_FEAT"
                        update_float "camera_exposure_compensation_steps_num" "12.0" "$TMP_FEAT"
                        update_float "camera_front_count_down_margin" "0.3177" "$TMP_FEAT"
                        update_float "device_body_sar" "0.674" "$TMP_FEAT"
                        update_float "device_head_sar" "0.851" "$TMP_FEAT"
                        update_float "paper_eyecare_default_value" "91.0" "$TMP_FEAT"
                        update_float "paper_mode_max_level" "255.0" "$TMP_FEAT"
                        update_float "paper_mode_min_level" "58.0" "$TMP_FEAT"
                        update_int "burst_shoot_count" "100" "$TMP_FEAT"
                        update_int "camera_reduce_preview_flag" "12" "$TMP_FEAT"
                        update_int "camera_supported_asd" "11" "$TMP_FEAT"
                        update_int "camera_supported_front_asd" "10" "$TMP_FEAT"
                        update_int "cpu_max_freq" "240" "$TMP_FEAT"
                        update_int "default_eyecare_mode" "2" "$TMP_FEAT"
                        update_int "gallery_device_series" "2" "$TMP_FEAT"
                        update_int "ifaa_2dfa_support" "0" "$TMP_FEAT"
                        update_int "paper_eyecare_default_texture" "0" "$TMP_FEAT"
                        update_int "paper_eyecare_max_texture" "35" "$TMP_FEAT"
                        update_int "paper_eyecare_min_texture" "0" "$TMP_FEAT"
                        update_int "screen_effect_supported" "7" "$TMP_FEAT"
                        update_int "screen_standard_mode" "2" "$TMP_FEAT"
                        update_int "support_camera_front_hdr_default_value" "1" "$TMP_FEAT"
                        update_int "support_camera_hdr_default_value" "3" "$TMP_FEAT"
                        update_int "support_inner_record" "1" "$TMP_FEAT"
                        update_int "support_widevine_l1" "1" "$TMP_FEAT"
                        update_int "type_mqs_finger_record" "3" "$TMP_FEAT"
                        update_int "type_soter_finger_pay" "2" "$TMP_FEAT"
                        update_str "camera_continuous_shot_callback_class" "ContinuousShotCallback" "$TMP_FEAT"
                        update_str "camera_continuous_shot_callback_setter" "setContinuousShotCallback" "$TMP_FEAT"
                        update_str "extra_still_beautify_value" "i:2" "$TMP_FEAT"
                        update_str "finger_alipay_ifaa_model" "Xiaomi-camellia" "$TMP_FEAT"
                        update_str "game_enhance_feature_name" "game_enhance_fisr" "$TMP_FEAT"
                    fi

                    # AOD STUFF
                    update_feature "support_gesture_wakeup" "true" "$TMP_FEAT"
                    update_feature "support_aod" "true" "$TMP_FEAT"
                    update_feature "aod_support_keycode_goto_dismiss" "true" "$TMP_FEAT"
                    update_feature "is_only_support_keycode_goto" "false" "$TMP_FEAT"
                    update_feature "is_aod_need_grayscale" "false" "$TMP_FEAT"
                    update_feature "support_screen_paper_mode" "true" "$TMP_FEAT"
                    update_feature "support_aod_aon" "true" "$TMP_FEAT"
                    if [[ "$HyperOS2" == "true" ]]; then
                        update_feature "support_aod_fullscreen" "true" "$TMP_FEAT"
                            update_int "aon_screen_off_fps" "0" "$TMP_FEAT"
                    fi
                    copy "$TMP_FEAT" "$MODPATH/system/product/etc/device_features/$DevName.xml"
                # ON BOOT SERVICE
                    add_lines_string 'resetprop -n "persist.vendor.disable_idle_fps.threshold" 10' 'resetprop -n "ro.vendor.display.primary_idle_refresh_rate" 60,1:10' 'resetprop -n "ro.vendor.mi_sf.aod_mode_ddic_refresh_rate" 1' $MODPATH/post-fs-data.sh
                # GET OVERLAY
                    ui_print " "
                    ui_print " [069] [Installing overlays to system...]"
                    copy "$WORKLOAD/extracted/overlay/MxGSystemUIOverlayHelper.apk" "$MODPATH/system/product/overlay/MxGSysUIHelper/MxGSystemUIOverlayHelper.apk"
                    copy "$WORKLOAD/extracted/overlay/MxGFrameworkOverlayHelper.apk" "$MODPATH/system/product/overlay/MxGFrameworkHelper/MxGFrameworkOverlayHelper.apk"
                # PLACE PERMISSION PROP
                    ui_print " "
                    ui_print " [078] [Getting permission file]"
                    FINALPERMDEST="$MODPATH/system/product/etc/permissions/privapp-permissions-aod.xml" # name changes
                    copy "$WORKLOAD/extracted/apks/aod/privapp-permissions-aod.xml"  "$FINALPERMDEST"
                # INSTALL AOD
                    ui_print " "
                    ui_print " [080] [Installing AOD...]"
                    pm install -r "$HAOD"
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
        ui_print '#!/system/bin/sh'                                                                                                                     \
                 "MODDIR=\"\${0%/*}\""                                                                                                                  \
                 "echo ' ' >> /sdcard/mxg.log"                                                                                                          \
                 "echo '########## LATE START SERVICE BEGIN ##########' >> /sdcard/mxg.log"                                                             \
                 "echo ' '  >> /sdcard/mxg.log"                                                                                                         \
                 "sleep 400"                                                                                                                            \
                 "if [[ \"\$(getprop sys.boot_completed)\" != \"1\" ]]; then"                                                                           \
                 "  echo '[\$(date)]: F! Bootlooped! Disabling myself...' >> /sdcard/mxg.log"                                                           \
                 "  rm -rf /data/system/package_cache"                                                                                                  \
                 "  cp \$MODDIR/notify.sh /data/adb/service.d/notify.sh"                                                                                \
                 "  chmod +x /data/adb/service.d/notify.sh"                                                                                             \
                 "  touch \$MODDIR/disable"                                                                                                             \
                 "  reboot"                                                                                                                             \
                 "fi"                                                                                                                                   \
                 > $MODPATH/service.sh
                 if [[ "$HyperOS2" == "true" ]]; then
                     'if dumpsys package com.miui.aod | grep -q "DEV-2212.0.0.1-10301608"; then'                                                            \
                     '  echo "[\$(date)]: Same AOD version is installed." >> /sdcard/mxg.log'                                                               \
                     "else"                                                                                                                                 \
                     '  echo "[\$(date)]: Same AOD version is NOT installed. Installing now..." >> /sdcard/mxg.log'                                         \
                     "  pm install -r \$MODDIR/system/product/priv-app/MIUIAod/MIUIAod.apk"                                                                 \
                     "fi"                                                                                                                                   \
                     'resetprop -n "persist.vendor.disable_idle_fps.threshold" 10' 'resetprop -n "ro.vendor.display.primary_idle_refresh_rate" 60,1:10' 'resetprop -n "ro.vendor.mi_sf.aod_mode_ddic_refresh_rate" 1'
                     >> $MODPATH/service.sh
                 fi
        package_extract_file notify.sh $MODPATH/notify.sh
        ui_print " [100] Added some self-protections"
            echo "[\$(date)]: MxG successfully installed." >> /sdcard/mxg.log

ui_print " "
ui_print " [✓] DONE! You may now reboot your device."
ui_print " "
ui_print " "
rm -r /data/local/tmp/aod
