# /home/iershov/git/nixconf/services.nix
{ config, pkgs, ... }:

{
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Включить D-Bus (обязательно для трея)
  services.dbus.enable = true;

  # Docker
  virtualisation.docker.enable = true;
}
