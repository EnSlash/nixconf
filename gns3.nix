{ config, pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.gns3-gui.overrideAttrs (old: {
      version = "2.2.32";
      src = pkgs.fetchFromGitHub {
        owner = "GNS3";
        repo = "gns3-gui";
        rev = "v2.2.32";
        hash = "sha256-c421kzgD6PFM/9Rn+NmZGyRlJPWhQPraW/4HcuRoEUU=" ; # Нужно вычислить
      };
      
      vendorHash = "sha256-VfwiA5LCAJ1pkmMCy/Dcc5bLKkNY1MHtxHcHvKLoWHs="; # Хеш вендор зависимостей
      
    }))
  ];
}
