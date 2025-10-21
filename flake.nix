{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ({ config, pkgs, ... }: {
          environment.systemPackages = with pkgs; [
            hugo
          ];
        })
      ];
    };
    
    # Пакет для установки
    packages.${system} = {
      hugo = nixpkgs.legacyPackages.${system}.hugo;
      default = nixpkgs.legacyPackages.${system}.hugo;
    };
  };
}
