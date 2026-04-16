{ config, pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.gns3-gui.overrideAttrs (old: {
      version = "2.2.56";
      src = pkgs.fetchFromGitHub {
        owner = "GNS3";
        repo = "gns3-gui";
        rev = "v2.2.56";
        hash = "sha256-sPJflBikwDw0jBCl8e1idjsqCg2BCcTiU8gVX8/Ht64=" ; # Нужно вычислить
      };
      
      #vendorHash = ""; # Хеш вендор зависимостей
      
    }))
  ];
}
