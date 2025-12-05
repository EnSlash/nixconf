# /home/iershov/git/nixconf/home.nix
{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "iershov";
  home.homeDirectory = "/home/iershov";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05"; # Please change this to your version of Home Manager

  # The home.file option allows you to manage files in your home directory.
  home.file.".config/i3/config".source = ./i3/config;
  home.file.".config/polybar/config.ini".source = ./polybar/config.ini;
  home.file.".config/polybar/launch.sh".source = ./polybar/launch.sh;
  home.file.".bashrc".source = ./.bashrc;
  home.file.".tmux.conf".source = ./.tmux.conf;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
