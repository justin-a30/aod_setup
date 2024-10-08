#!/bin/sh
su -lp 2000 -c "cmd notification post \
                -S bigtext \
                -t 'MxG - AntiBootloop Daemon' \ 'important' \
                'Looks like the module is causing your phone to bootloop. Please uninstall it, and report to @bobert10 on LLions Mods Support Group.' "

rm -rf /data/adb/service.d/notify.sh
