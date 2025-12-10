# /home/iershov/git/nixconf/packages.nix
{ config, pkgs, ... }:

{
  # Install soft
  environment.systemPackages = with pkgs; [
    vlc
    mtr
    p7zip
    go
    vim
    wget
    curl
    gnupg
    wofi
    htop
    zip
    unzip
    busybox
    keepassxc
    telegram-desktop
    libreoffice
    drawio
    git
    wireshark
    zsh
    mercurial
    kdePackages.dolphin
    dig
    python313
    neofetch
    openssl
    ipcalc
    tmux
    eza
    alacritty
    asciinema
    zimfw
    wireplumber
    wlogout
    playerctl
    nerd-fonts.jetbrains-mono
    pavucontrol
    i3lock-fancy
    xss-lock
    xautolock
    i3lock-color
    imagemagick
    dejavu_fonts
    flameshot
    betterlockscreen
    feh
    networkmanagerapplet
    pasystray
    blueman
    polybarFull
    docker
    docker-compose
    nodejs_24
    onlyoffice-desktopeditors
    vscode
    code-cursor
    gemini-cli
    zoom-us
    winbox4
    dvPythonEnvTest
    tcpdump
    iperf2
  ];

  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.caskaydia-cove
    dejavu_fonts
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Install firefox.
  programs.firefox.enable = true;
}
