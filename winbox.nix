{ config, pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.winbox4.overrideAttrs (old: {
      version = "4.0beta35";
      src = pkgs.fetchFromGitHub {
        owner = "nixos";
        repo = "winbox4";
        rev = "v4.0beta35";
        hash = "" ; # Нужно вычислить
      };
      
      vendorHash = ""; # Хеш вендор зависимостей
      
    }))
  ];
}
