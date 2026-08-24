{ pkgs, ... }:

{
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

  home.file.".config/i3/config".source = ../i3/config;
  home.file.".config/i3/desk.jpg".source = ../i3/desk.jpg;
  home.file.".config/polybar/config.ini".source = ../polybar/config.ini;
  home.file.".config/polybar/launch.sh" = {
    source = ../polybar/launch.sh;
    executable = true;
  };
  home.file.".config/polybar/powermenu.sh" = {
    source = ../polybar/powermenu.sh;
    executable = true;
  };
  home.file.".bashrc".source = ../configs/.bashrc;
  home.file.".tmux.conf".source = ../configs/.tmux.conf;
}
