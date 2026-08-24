{ config, pkgs, ... }:

let
  lockWallpaper = ../../i3/lock.jpg;
  lockEffects = "dim";
in
{
  services.betterlockscreen = {
    enable = true;
    inactiveInterval = 3;  # минут бездействия до автолока
    arguments = [
      "dim"
      "--show-layout" "0"  # показывать текущий язык на экране блокировки
      # Всё после "--" передаётся напрямую в i3lock-color.
      # Betterlockscreen не знает флаги i3lock и падает на usage() при их виде.
      "--"

      # --- Заменяем круглый индикатор на полосу-"строку ввода" ---
      "--bar-indicator"
      "--bar-orientation=horizontal"
      "--bar-pos=x+w/2-150:y+h/2"
      "--bar-total-width=300"
      "--bar-base-width=3"
      "--bar-color=ffffff40"
      "--bar-count=30"
      "--bar-max-height=20"

      # Текст-приглашение над полосой
      "--greeter-text=Enter Password"
      "--greeter-pos=x+w/2:y+h/2-30"

      # Язык под баром
      "--layout-pos=x+w/2:y+h/2+40"
      "--layout-align=0"

      "--verif-text=Verifying..."
      "--wrong-text=Wrong Password"
      "--wrong-color=ff5555ff"
    ];
  };

  home.activation.betterlockscreenCache =
    config.lib.dag.entryAfter ["writeBoundary"] ''
      $DRY_RUN_CMD ${pkgs.betterlockscreen}/bin/betterlockscreen -u ${lockWallpaper} --fx ${lockEffects} $VERBOSE_ARG
    '';
}