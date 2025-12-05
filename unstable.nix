# /home/iershov/git/nixconf/unstable.nix
{ config, pkgs, ... }:
let
  # Импортируем unstable канал
  unstable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixpkgs-unstable.tar.gz") {
    config = {                                                                                                                                  
      allowUnfree = true;                                                                                                                       
      allowBroken = true; # <--- Правильное место для этой опции                                                                                
    };                                                                                                                                          
  };


    dvPythonEnvTest = pkgs.python313.withPackages (ps: with ps; [
      ciscoconfparse2
      ntc-templates
      netmiko
      colorama
      aiofiles   
      tabulate
      ]);

  in
  {
    environment.systemPackages = with unstable; [
      vscode
      code-cursor
      gemini-cli
      zoom-us
      winbox4

      dvPythonEnvTest
    ];
  }    
