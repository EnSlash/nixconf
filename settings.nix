{ config, pkgs, ... }:

{
        imports =
               [
               		./hugo.nix
               		./gns3.nix
               ];
        nix.settings.experimental-features = [ "nix-command" "flakes" ];

        networking.networkmanager.enable = true;

        #time.timeZone = "Asia/Yekaterinburg";
        
        # Enable the X11 windowing system.
       # services.xserver.enable = true;
        services.xserver.xkb = {
          layout = "us";
          variant = "";
        };
      

	environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 
  	services.xserver = {
    		enable = true;
	
    		desktopManager = {
      		xterm.enable = false;
    	};
   
    	windowManager.i3 = {
      		enable = true;
      		extraPackages = with pkgs; [
        		dmenu #application launcher most people use
        		i3status # gives you the default i3 status bar
        		i3blocks #if you are planning on using i3blocks over i3status
    			 ];
    		};
  	};

  	services.displayManager.defaultSession = "none+i3";

  	programs.i3lock.enable = true; #default i3 screen locker


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
#        programs.hyprland = {
#              enable = true;
#            };

        nixpkgs.config.allowUnfree = true;


        # Install soft
        environment.systemPackages = with pkgs; [
                vlc
	        mtr
                code-cursor
	        p7zip
                go
                vim
                wget
                curl
                gnupg
                wofi
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
                python313Packages.python
                kdePackages.dolphin
                dig
                python313Packages.colorama
                neofetch
                openssl
                ipcalc
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
                i3lock-fancy
                xss-lock
                xautolock
                i3lock-color
                imagemagick
                dejavu_fonts
                flameshot
                betterlockscreen
                feh
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
}
