{
  description = "A very basic flake";

  inputs = {
    nixpkgsUns.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-26.05";
  };

  outputs = { nixpkgs, ... } @ inputs: {
  let 
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    pkgsUns = inputs.nixpkgsUns.legacyPackages.x86_64-linux;
  in 
    
    packages.x86_64-linux.default = pkgs.mkShell{
      buildInputs = [
        pkgs.vim
      ];
    };


  };
}
