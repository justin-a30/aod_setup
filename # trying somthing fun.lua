replace "17" "274" re.txt
        ^~~^
This number can be random

Question: How do I replace that random number to my number (274)?

# trying somthing fun
add_lines_string "ro.config.low_ram=false" "ro.config.low_ram.threshold_gb=0" "ro.miui.backdrop_sampling_enabled=true" "ro.miui.has_real_blur=1" "ro.miui.has_blur=1"  "ro.miui.has_handy_mode_sf=1"  "ro.launcher.blur.appLaunch=1" "ro.surface_flinger.supports_background_blur=1" "ro.sf.blurs_are_expensive=1" "persist.sys.sf.disable_blurs=false" "enable_blurs_on_windows=1" "ro.sf.blurs_are_caro=0" "persist.sys.background_blur_supported=true" "vendor.perf.framepacing.enable=false" "persist.sys.power.default.powermode=1" "ro.vendor.sf.detect.aod.enable=true" system.prop
add_lines_string 'MODDIR=${0%/*}' 'settings put system deviceLevelList "v:1;c:3;g:3"' post-fs-data.sh
# lemme bunks

if contains '    <bool name="config_dozeAlwaysOnDisplayAvailable">' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
    if contains '    <bool name="config_dozeAlwaysOnDisplayAvailable">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
        echo "bomb" > /dev/null
    else
        replace '    <bool name="config_dozeAlwaysOnDisplayAvailable">false</bool>' '    <bool name="config_dozeAlwaysOnDisplayAvailable">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
    fi
else
    add_lines_string '    <bool name="config_dozeAlwaysOnDisplayAvailable">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
fi

# lemme bunks

if contains '    <bool name="config_dozeSupportsAodWallpaper">' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
    if contains '    <bool name="config_dozeSupportsAodWallpaper">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
        echo "bomb" > /dev/null
    else
        replace '    <bool name="config_dozeSupportsAodWallpaper">false</bool>' '    <bool name="config_dozeSupportsAodWallpaper">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
    fi
else
    add_lines_string '    <bool name="config_dozeSupportsAodWallpaper">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
fi
# lemme bunks

if contains '    <bool name="config_dozeAfterScreenOff">' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
    if contains '    <bool name="config_dozeAfterScreenOff">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
        echo "bomb" > /dev/null
    else
        replace '    <bool name="config_dozeAfterScreenOff">false</bool>' '    <bool name="config_dozeAfterScreenOff">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
    fi
else
    add_lines_string '    <bool name="config_dozeAfterScreenOff">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
fi
# lemme bunks

if contains '    <bool name="config_displayBlanksAfterDoze">' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
    if contains '    <bool name="config_displayBlanksAfterDoze">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml; then
        echo "bomb" > /dev/null
    else
        replace '    <bool name="config_displayBlanksAfterDoze">false</bool>' '    <bool name="config_displayBlanksAfterDoze">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
    fi
else
    add_lines_string '    <bool name="config_displayBlanksAfterDoze">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/bools.xml
fi
# lemme bunks

if contains '    <integer name="config_screenBrightnessDoze">' /data/local/tmp/prop/overlaytmp/res/values/integers.xml; then
    if contains '    <integer name="config_screenBrightnessDoze">17</integer>' /data/local/tmp/prop/overlaytmp/res/values/integers.xml; then
        echo "bomb" > /dev/null
    else
        SBD=$(xml_kit -open '<resources>' '</resources>' -open '<integer name="config_screenBrightnessDoze">' '</integer>' /data/local/tmp/prop/overlaytmp/res/values/integers.xml | grep -Eo '[0-9]{1,3}')
        replace '    <integer name="config_screenBrightnessDoze">$SBD</integer>' '    <integer name="config_screenBrightnessDoze">17</integer>' /data/local/tmp/prop/overlaytmp/res/values/integers.xml
    fi
else
    add_lines_string '    <integer name="config_screenBrightnessDoze">17</integer>' /data/local/tmp/prop/overlaytmp/res/values/integers.xml
fi
# lemme bunks

if contains '    <string name="config_dozeComponent">' /data/local/tmp/prop/overlaytmp/res/values/strings.xml; then
    if contains '    <string name="config_dozeComponent">com.android.systemui/com.android.systemui.doze.DozeService</string>' /data/local/tmp/prop/overlaytmp/res/values/strings.xml; then
        echo "bomb" > /dev/null
    else
        AST=
        replace 'replace st' 'com.android.systemui/com.android.systemui.doze.DozeService' /data/local/tmp/prop/overlaytmp/res/values/strings.xml
    fi
else
    add_lines_string '    <bool name="config_dozeAlwaysOnDisplayAvailable">true</bool>' /data/local/tmp/prop/overlaytmp/res/values/strings.xml
fi


### temporary: di-4.8> xml_kit -open '<resources>' '</resources>' -open '<string name="config_dozeComponent">' '</string>' /data/local/tmp/prop/overlaytmp/res/values/strings.xml | grep 