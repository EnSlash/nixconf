#!/usr/bin/env bash

chosen=$(printf "  Выключение\n  Перезагрузка\n  Выход из i3\n  Блокировка" | rofi -dmenu \
    -p "" \
    -theme-str 'window    { width: 220px; border-radius: 8px; border: 2px; background-color: #1e1e2e; border-color: #45475a; }' \
    -theme-str 'mainbox   { padding: 6px; }' \
    -theme-str 'inputbar  { enabled: false; }' \
    -theme-str 'listview  { lines: 4; spacing: 4px; border: 0; }' \
    -theme-str 'element   { padding: 8px 12px; border-radius: 6px; }' \
    -theme-str 'element normal.normal   { background-color: transparent; text-color: #cdd6f4; }' \
    -theme-str 'element selected.normal { background-color: #313244;     text-color: #cba6f7; }' \
    -theme-str 'element-text { font: "CaskaydiaCove Nerd Font 11"; }')

case "$chosen" in
    "  Выключение") systemctl poweroff ;;
    "  Перезагрузка") systemctl reboot ;;
    "  Выход из i3") i3-msg exit ;;
    "  Блокировка") betterlockscreen -l ;;
esac
