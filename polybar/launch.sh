#!/usr/bin/env bash

# Убиваем все запущенные экземпляры polybar
echo "Останавливаем polybar..."
killall -q polybar

# Ждем пока процессы будут остановлены
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Проверяем доступные мониторы
echo "Проверяем подключенные мониторы..."
MONITORS=$(xrandr --query | grep " connected" | cut -d" " -f1)
echo "Найдены мониторы: $MONITORS"

# Запускаем бары в зависимости от количества мониторов
if echo "$MONITORS" | grep -q "HDMI-2" && echo "$MONITORS" | grep -q "HDMI-3"; then
    echo "Запускаем мульти-мониторную конфигурацию..."
    
    # Основной бар на HDMI-2 (полный функционал)
    echo "Запускаем primary бар на HDMI-2"
    MONITOR=HDMI-2 polybar primary &
    
    # Вторичный бар на HDMI-3 (минималистичный)
    echo "Запускаем secondary бар на HDMI-3"
    MONITOR=HDMI-3 polybar secondary &
    
elif echo "$MONITORS" | grep -q "HDMI-2"; then
    echo "Запускаем только на HDMI-2"
    MONITOR=HDMI-2 polybar primary &
    
elif echo "$MONITORS" | grep -q "HDMI-3"; then
    echo "Запускаем только на HDMI-3"
    MONITOR=HDMI-3 polybar primary &
    
else
    echo "Используем fallback конфигурацию"
    # Если мониторы не опознаны, используем автоматическое определение
    for monitor in $MONITORS; do
        echo "Запускаем polybar на: $monitor"
        MONITOR=$monitor polybar primary &
    done
fi

# Ждем немного и проверяем процессы
sleep 2
echo "Проверяем запущенные процессы polybar:"
pgrep -a polybar

echo "Polybar успешно запущен!"