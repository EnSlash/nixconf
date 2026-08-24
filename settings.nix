# /home/iershov/git/nixconf/settings.nix
{ config, pkgs, ... }:
{
  imports = [
    ./packages.nix
    ./services.nix
    ./desktop.nix
    ./castom/hugo.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;
  nixpkgs.config.allowUnfree = true;

  boot.kernelParams = [ "acpi=strict" ];
  environment.pathsToLink = [ "/libexec" ];
}
