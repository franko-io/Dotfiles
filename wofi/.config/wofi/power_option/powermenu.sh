#!/usr/bin/env bash

op=$( echo -e "  Shutdown\n  Reboot\n  Suspend\n  Lock\n  Logout\n  Hibernate" | wofi -i --dmenu | awk '{print tolower($2)}' )

case ${op} in
    shutdown)
        systemctl poweroff --now
        ;;
    reboot)
        systemctl reboot --now
        ;;
    lock)
        hyprlock
        ;;
    suspend)
        systemctl suspend
        ;;
    logout)
        hyprctl dispatch exit
        ;;
    hibernate)
        systemctl hibernate
        ;;
esac
