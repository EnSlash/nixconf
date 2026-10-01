{ pkgs, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";

  # Как и system.stateVersion — это версия на момент установки, не трогать
  # при обновлениях home-manager.
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  home.packages = [
    pkgs.nsxiv
    pkgs.mpv
    pkgs.cmatrix
    pkgs.xterm
    pkgs.dvPythonEnvTest
  ];

  # Zoom wrapper: добавляем libxcb-cursor в LD_LIBRARY_PATH для bwrap-sandbox,
  # иначе дочерние Qt-процессы падают — NixOS glibc не знает о /usr/lib64/.
  home.file.".local/bin/zoom" = {
    text = ''
      #!/bin/sh
      export LD_LIBRARY_PATH="${pkgs.libxcb-cursor}/lib''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
      exec /run/current-system/sw/bin/zoom "$@"
    '';
    executable = true;
  };

  home.file.".tmux.conf".source = ../configs/.tmux.conf;

  # Браузер по умолчанию для xdg-open. Без этого ссылки из внешних приложений
  # (например, из чатов Zoom) не открываются — нет обработчика http/https.
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };

  home.sessionVariables.BROWSER = "firefox";
}
