{ config, pkgs, ... }:

{
        imports =
               [
               		./hugo.nix
               ];
        nix.settings.experimental-features = [ "nix-command" "flakes" ];

        networking.networkmanager.enable = true;

        #time.timeZone = "Asia/Yekaterinburg";
        
        # Enable the X11 windowing system.
        services.xserver.enable = true;

        services.xserver.xkb = {
          layout = "us";
          variant = "";
        };
      

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

        # Install firefox.
        programs.firefox.enable = true;

        # Install Hyprland
        programs.hyprland.enable = true;

        # Install soft
        environment.systemPackages = with pkgs; [
                vlc
                go
                vim
                wget
                curl
                gnupg
                wofi
                waybar
                htop
                vscode
                zip
                unzip
                busybox
                keepassxc
                winbox4
                telegram-desktop
                libreoffice
                drawio
                gns3-gui
                zoom-us
                git
                wireshark
                zsh
                mercurial
                python313Full
                kdePackages.dolphin
                dig
                python3Packages.pip
                #python3Packages.netmiko
                python3Packages.colorama
                neofetch
                openssl
                ipcalc
                hypridle
                hyprlang
                hyprlock
                hyprpaper
                hyprshot
                tmux
                eza
                alacritty
          	asciinema
            	python313Packages.docopt
            	zimfw
                (python3.withPackages (ps: [
                  ps.netmiko
                ]))
        ];

        fonts.packages = with pkgs; [
          font-awesome
          nerd-fonts.caskaydia-cove
        ];

        programs.gnupg.agent = {
          enable = true;
          enableSSHSupport = true;
        };

        nixpkgs.config.allowUnfree = true;
}
