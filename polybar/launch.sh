#!/bin/bash

# Завершить все запущенные экземпляры polybar
killall -q polybar

# Ожидание полного завершения процессов
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Запуск Polybar на всех подключенных мониторах
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ "$m" = "DP-1" ]; then
      MONITOR=$m polybar --reload main_scaled &
    else
      MONITOR=$m polybar --reload main &
    fi
  done
else
  polybar --reload main &
fi

echo "Панели запущены..."
