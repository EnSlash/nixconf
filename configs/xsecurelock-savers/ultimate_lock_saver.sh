# #!/usr/bin/env bash

# # This is a complex saver for xsecurelock that layers multiple programs.

# # The window ID to draw on is passed as the first argument.
# WINDOW_ID=$1

# # Cleanup function to kill all child processes
# cleanup() {
#     # We use pkill to kill all processes in the same process group as this script.
#     # This is a robust way to ensure all child processes are terminated.
#     pkill -P $$
# }

# # Trap SIGTERM and SIGINT to run the cleanup function when the script is terminated.
# trap 'cleanup' SIGTERM SIGINT

# # --- Component 1: Background ---

# # Option A: Image slideshow with nsxiv
# # Path to the images directory, relative to the script's location.
# SCRIPT_DIR=$(dirname "$0")
# IMAGE_DIR="$SCRIPT_DIR/../../i3"
# nsxiv -w "$WINDOW_ID" -f -s 10 -- "$IMAGE_DIR"/*.jpg &

# # Option B: Video background with mpv
# # Uncomment the line below and specify the path to your video file.
# # VIDEO_PATH="$HOME/Videos/lockscreen.mp4"
# # mpv --wid=$1 --loop --no-audio --fs --no-stop-screensaver "$VIDEO_PATH" &


# # --- Component 2: Matrix Effect ---
# # This runs cmatrix in a transparent, borderless xterm.
# # Requires a compositor (like picom) for true transparency.
# xterm -geometry 100x40 -fa 'Monospace' -fs 14 -bg "rgba:0/0/0/0.5" -fg green -e cmatrix -C green &


# # --- Component 3: Status Bar ---
# # This runs a simple clock in an xterm at the bottom of the screen.
# # The geometry '200x1+0-0' makes it wide and places it at the bottom.
# xterm -geometry 100x1+0-0 -fa 'Monospace' -fs 12 -bg "rgba:0/0/0/0.7" -fg white -e "while true; do date; sleep 1; done" &


# # --- Keep the script running ---
# # The `wait` command waits for all background jobs to finish.
# # Since our background jobs are long-running, this effectively
# # pauses the script until the cleanup function is called.
# wait



#!/usr/bin/env bash

# Получаем ID окна от xsecurelock (передается как первый аргумент)
WINDOW_ID=$1

# Функция очистки для корректного завершения
cleanup() {
    # Убиваем все дочерние процессы этого скрипта
    pkill -P $$
    exit 0
}

# Перехватываем сигналы завершения от xsecurelock
trap 'cleanup' SIGTERM SIGINT

# --- Компонент 1: Фоновое изображение (Слайдшоу или статика) ---

SCRIPT_DIR=$(dirname "$0")
# Путь к папке с картинками (адаптируйте под вашу структуру)
IMAGE_DIR="$SCRIPT_DIR/../../i3"

# Проверяем, есть ли jpg файлы в директории
if compgen -G "$IMAGE_DIR/*.jpg" > /dev/null; then
    # Используем feh. Он легкий, надежный и рисует прямо в указанный WINDOW_ID.
    # -w: рисовать в указанном окне
    # -F: полноэкранный режим (растянуть)
    # -Z: масштабировать с сохранением пропорций
    # -D 10: менять картинку каждые 10 секунд (уберите -D, если нужна одна статичная картинка)
    /run/current-system/sw/bin/feh --no-fehbg -w "$WINDOW_ID" -F -Z -D 10 -- "$IMAGE_DIR"/*.jpg &
else
    # Если картинок нет, просто заливаем цветом (цвет берется из переменных окружения главного скрипта)
    /run/current-system/sw/bin/xsetroot -solid "#613583" &
fi

# --- Компонент 2: Время, дата и раскладка ---
# НЕ НУЖНО писать свой код здесь! 
# Вы уже включили это в главном скрипте через:
# export XSECURELOCK_SHOW_DATETIME="1"
# export XSECURELOCK_SHOW_KEYBOARD_LAYOUT="1"
# xsecurelock отрисует их сам красиво и безопасно поверх этого фона.

# --- Ожидание завершения ---
# Скрипт должен работать, пока xsecurelock не пошлет SIGTERM
wait