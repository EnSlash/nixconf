# Конфигурация для установки i3lock и настройки блокировки экрана на Win+L
# Использует стабильный репозиторий nixos-23.11

{ pkgs, lib, config, ... }:



{
  # Установка i3lock и связанных пакетов
  environment.systemPackages = with stablePkgs; [
    i3lock
    # Дополнительные утилиты для блокировки экрана
    i3lock-fancy          # Улучшенная версия i3lock с эффектами
    xss-lock              # Для автоматической блокировки при бездействии
    xautolock             # Автоматическая блокировка по таймеру
  ];

    # Настройка автоматической блокировки при бездействии
    displayManager.sessionCommands = ''
      # Автоматическая блокировка при бездействии (10 минут)
      xautolock -time 3 -locker "${pkgs.i3lock}/bin/i3lock -c 000000" &
    '';
  };

  # Скрипт для блокировки экрана
  environment.etc."i3lock-wrapper.sh" = {
    text = ''
      #!/bin/sh
      # Простая блокировка экрана
      #${pkgs.i3lock}/bin/i3lock -c 000000 -n
      
      # Или с улучшенной версией (если установлена i3lock-fancy):
      ${pkgs.i3lock-fancy}/bin/i3lock-fancy -p
    '';
    mode = "0755";
  };
}

