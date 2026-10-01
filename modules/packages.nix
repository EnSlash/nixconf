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
    ulauncher
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
    fastfetch
    openssl
    ipcalc
    tmux
    eza
    alacritty
    kitty
    asciinema
    zimfw
    wireplumber
    playerctl
    pavucontrol
    imagemagick
    gsimplecal
    blueman
    bluez-tools
    nodejs_24
    onlyoffice-desktopeditors
    vscode
    code-cursor
    zoom-us
    winbox4
    dvPythonEnvTest
    tcpdump
    iperf2
    btop
    minicom
    yandex-music
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
    wireguard-tools
    vial
    remmina
    dia
    libvisio2svg
    qwen-code
    python313Packages.asyncssh
    element-desktop
    chromium
    nh
    nom
    qmk
    qmk-udev-rules
    qmk_hid
    via
    claude-code
    codex
  ];

  services.udev.packages = with pkgs; [
    vial
    via
  ];
  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.caskaydia-cove
    # Переехал сюда из systemPackages: шрифты из environment.systemPackages
    # не попадают в fontconfig — `fc-list | grep jetbrains` давал 0.
    nerd-fonts.jetbrains-mono
    dejavu_fonts
  ];

  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="e126", ATTRS{idProduct}=="0080", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl" 
  '';
  hardware.keyboard.qmk.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  # Install firefox.
  programs.firefox.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib   # libstdc++, libgcc_s
    zlib
    lz4
    xz                 # liblzma — erofs-utils это использует
    libuuid
    xxhash
  ];
}
