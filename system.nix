{ config, pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "iershov-ws";

  time.timeZone = "Asia/Yekaterinburg";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT    = "ru_RU.UTF-8";
    LC_MONETARY       = "ru_RU.UTF-8";
    LC_NAME           = "ru_RU.UTF-8";
    LC_NUMERIC        = "ru_RU.UTF-8";
    LC_PAPER          = "ru_RU.UTF-8";
    LC_TELEPHONE      = "ru_RU.UTF-8";
    LC_TIME           = "ru_RU.UTF-8";
  };

  services.xserver.displayManager.lightdm.enable = true;

  users.users.iershov = {
    isNormalUser = true;
    description  = "iershov";
    extraGroups  = [ "networkmanager" "wheel" "docker" ];
  };

  programs.firefox.enable = true;
  programs.hyprland.enable = true;

  services.openssh.enable = true;

  security.pki.certificates = [ (builtins.readFile /etc/ssl/certs/cert.pem) ];

  system.stateVersion = "26.05";
}
