{ config, pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.Hyprland.overrideAttrs (old: {
      version = "0.51.1";
      src = pkgs.fetchFromGitHub {
        owner = "hyprwm";
        repo = "Hyprland";
        rev = "v0.51.1";
        hash = "" ; # Нужно вычислить
      };
      
      vendorHash = ""; # Хеш вендор зависимостей
      
    }))
  ];
}
