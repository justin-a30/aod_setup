# trying somthing fun
add_lines_string "ro.config.low_ram=false" "ro.config.low_ram.threshold_gb=0" "ro.miui.backdrop_sampling_enabled=true" "ro.miui.has_real_blur=1" "ro.miui.has_blur=1"  "ro.miui.has_handy_mode_sf=1"  "ro.launcher.blur.appLaunch=1" "ro.surface_flinger.supports_background_blur=1" "ro.sf.blurs_are_expensive=1" "persist.sys.sf.disable_blurs=false" "enable_blurs_on_windows=1" "ro.sf.blurs_are_caro=0" "persist.sys.background_blur_supported=true" "vendor.perf.framepacing.enable=false" "persist.sys.power.default.powermode=1" "ro.vendor.sf.detect.aod.enable=true" system.prop
add_lines_string 'MODDIR=${0%/*}' 'settings put system deviceLevelList "v:1;c:3;g:3"' post-fs-data.sh

if contains '    <bool name="config_dozeAlwaysOnDisplayAvailable">true</bool>' '/data/local/tmp/prop/overlaytmp/res/values/bools.xml'; then
    if contains 