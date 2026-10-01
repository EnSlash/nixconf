{
  description = "iershov NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager }:
  let
    system = "x86_64-linux";
    username = "iershov";

    overlay = import ./overlays.nix {
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    };

    # Фабрика хостов: всё, что отличает машины, приходит аргументами.
    # Добавить второй компьютер = положить его hardware-configuration.nix
    # в hosts/<hostname>/ и дописать строку в nixosConfigurations.
    mkHost = { hostname, extraModules ? [ ] }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit username hostname; };
        modules = [
          {
            nixpkgs.overlays = [ overlay ];
            networking.hostName = hostname;
          }
          ./hosts/${hostname}
          ./modules/system.nix
          ./modules/packages.nix
          ./modules/services.nix
          ./modules/desktop
          ./castom/hugo.nix
          home-manager.nixosModules.home-manager
          ./modules/home.nix
        ] ++ extraModules;
      };
  in {
    nixosConfigurations.iershov-ws = mkHost { hostname = "iershov-ws"; };

    formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-rfc-style;
  };
}
