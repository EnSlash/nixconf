# /home/iershov/git/nixconf/desktop.nix
{ config, pkgs, ... }:

{
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "modesetting" ];

    desktopManager = {
      xterm.enable = false;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [

      ];
    };
  };

  services.displayManager.defaultSession = "none+i3";

}
