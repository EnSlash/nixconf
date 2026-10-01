{
  config,
  pkgs,
  username,
  ...
}:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Asia/Yekaterinburg";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  services.openssh.enable = true;

  security.pki.certificates = [ (builtins.readFile /etc/ssl/certs/cert.pem) ];

  # ─── Nix и базовое окружение (было в settings.nix) ─────────────────────────
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.networkmanager.enable = true;
  nixpkgs.config.allowUnfree = true;

  boot.kernelParams = [ "acpi=strict" ];
  environment.pathsToLink = [ "/libexec" ];

  # ВНИМАНИЕ: stateVersion — это версия, на которой систему УСТАНОВИЛИ.
  # Её нельзя двигать при обновлении NixOS: она гейтит миграции состояния.
  system.stateVersion = "26.05";
}
