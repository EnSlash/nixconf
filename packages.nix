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
    xss-lock
    xautolock
    xsecurelock
    imagemagick
    flameshot
    feh
    networkmanagerapplet
    pasystray
    blueman
    bluez-tools
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
    btop
    minicom
    yandex-music
    neovim
    vimPlugins.nord-vim
    vimPlugins.nvim-scrollview
    vimPlugins.vim-fugitive
    vimPlugins.lightline-vim
    vimPlugins.tiny-devicons-auto-colors-nvim
    vimPlugins.nerdtree-git-plugin
    vimPlugins.vim-nerdtree-tabs
    vimPlugins.jedi-vim
    vimPlugins.nvim-autopairs
    vimPlugins.vim-gitgutter
    lunarvim
    wireguard-tools
    vial
  ];

  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.caskaydia-cove
    dejavu_fonts
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  # Install firefox.
  programs.firefox.enable = true;
}
