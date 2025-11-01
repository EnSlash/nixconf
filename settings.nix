{ config, pkgs, ... }:

{
        imports =
               [
               		./hugo.nix
               		./gns3.nix
               	  #./hyprland.nix

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
        programs.hyprland = {
              enable = true;
              # xwayland.enable = true; # Xwayland can be disabled.
              # # Use Hyprland from flake to get latest version (0.51.x+) for portal/screensharing fixes
              # # nixpkgs-unstable has build issues and outdated 0.49.0 version
              # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
              # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
              # withUWSM = false; # testing
            };

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
                zoom-us
                git
                wireshark
                zsh
                mercurial
                python
                kdePackages.dolphin
                dig
                # python313Packages.pip
                # python313Packages.netmiko 
                python313Packages.colorama
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
                wireplumber
                wlogout
                playerctl
                nerd-fonts.jetbrains-mono
                pavucontrol
                xdg-desktop-portal-hyprland
                xdg-desktop-portal-wlr
                # (python313.withPackages (ps: [
                #   ps.netmiko
                # ]))
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
