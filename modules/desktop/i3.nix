{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    videoDrivers = [ "modesetting" ];
    xkb = {
      layout = "us";
      variant = "";
    };

    desktopManager.xterm.enable = false;

    windowManager.i3 = {
      enable = true;
      # Пустой список намеренно: он вытесняет дефолтные i3status/dmenu/i3lock.
      # Статус-бар делает polybar, лаунчер — ulauncher, локскрин —
      # betterlockscreen (см. home/i3.nix).
      extraPackages = [ ];
    };
  };

  services.displayManager.defaultSession = "none+i3";
  services.xserver.displayManager.lightdm.enable = true;

  environment.sessionVariables = {
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };

  # Пакеты, осмысленные только под X11/i3.
  environment.systemPackages = with pkgs; [
    polybarFull
    rofi # используется powermenu.sh
    feh # обои
    flameshot # скриншоты
    xss-lock
    xautolock
    networkmanagerapplet
    pasystray
  ];
}
