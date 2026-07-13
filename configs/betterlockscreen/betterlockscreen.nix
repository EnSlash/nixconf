{ config, pkgs, ... }:

let
  lockWallpaper = /home/iershov/git/nixconf/i3/lock.jpg;
  lockEffects = "dim,blur=5x4";
in
{
  services.betterlockscreen = {
    enable = true;
    inactiveInterval = 10;  # минут бездействия до автолока
    arguments = [
      "dim"
      "blur=5x4"

      # --- Заменяем круглый индикатор на полосу-"строку ввода" ---
      "--bar-indicator"
      "--bar-orientation=horizontal"
      "--bar-pos=x+w/2-150:y+h/2"   # позиционируем по центру экрана
      "--bar-total-width=300"
      "--bar-base-width=3"
      "--bar-color=ffffff40"        # полупрозрачный белый — фон "поля"
      "--bar-count=30"              # число сегментов в полосе
      "--bar-max-height=20"

      # Текст-приглашение над полосой (как placeholder)
      "--greeter-text=Enter Password"
      "--greeter-color=ffffffff"
      "--greeter-pos=x+w/2:y+h/2-30"

      # Текст времени/даты можно оставить как есть или убрать
      "--time-color=ffffffff"
      "--date-color=ffffffff"

      "--verif-text=Verifying…"
      "--wrong-text=Wrong Password"
      "--wrong-color=ff5555ff"
    ];
  };

  home.activation.betterlockscreenCache =
    config.lib.dag.entryAfter ["writeBoundary"] ''
      $DRY_RUN_CMD ${pkgs.betterlockscreen}/bin/betterlockscreen -u ${lockWallpaper} --fx ${lockEffects} $VERBOSE_ARG
    '';
}