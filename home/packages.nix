{ pkgs, ... }:

{
  home.packages = [
    pkgs.nsxiv
    pkgs.mpv
    pkgs.cmatrix
    pkgs.xterm
    pkgs.dvPythonEnvTest
  ];
}
