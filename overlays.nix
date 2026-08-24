# /home/iershov/git/nixconf/overlays.nix
{ unstable }: self: super: {
  # Here we can override or add packages.
  # Example: take vscode from unstable
  vscode = unstable.vscode;
  "gemini-cli" = unstable.gemini-cli;
  winbox4 = unstable.winbox4;

  # Zoom 7.0.0.1666 — вендорный package.nix из nixpkgs@f8a7f3e34c84
  # + xdg-utils для открытия ссылок из bwrap-sandbox.
  zoom-us = (self.callPackage ./pkgs/zoom-us.nix { }).override {
    targetPkgsFixed = [ super.xdg-utils ];
  };

  # Your Python package
  dvPythonEnvTest = unstable.python313.withPackages (ps: with ps; [
    ntc-templates
    netmiko
    colorama
    aiofiles
    tabulate
  ]);
}
