{ config, pkgs, ... }:

let
  unstable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixpkgs-unstable.tar.gz") {
    config.allowUnfree = true;
  };
in
{
  environment.systemPackages = with unstable; [
    vscode
    code-cursor
  ];

}