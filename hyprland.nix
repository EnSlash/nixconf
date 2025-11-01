{ config, pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.hyprland.overrideAttrs (old: {
      version = "0.51.1";
      src = pkgs.fetchFromGitHub {
        owner = "hyprwm";
        repo = "Hyprland";
        rev = "v0.51.1";
        hash = "sha256-eLU5Zo1L3IFr8LgOsvTcoYW04/K+Sb8OvpwbaTSTGF4=" ; # Нужно вычислить
      };
      
      vendorHash = ""; # Хеш вендор зависимостей
      
    }))
  ];
}
