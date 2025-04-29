#!/bin/bash

if GTK_THEME=Adwaita:dark zenity --question \
  --text="Exit Hyprland?" \
  --title="Confirmation"; then
  hyprctl dispatch exit
fi
