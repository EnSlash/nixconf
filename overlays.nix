{ unstable }: self: super: {
  # Пакеты, которые должны следовать за nixpkgs-unstable.
  vscode = unstable.vscode;
  codex = unstable.codex;
  winbox4 = unstable.winbox4;

  # Локально зафиксированные пакеты.
  hugo = super.callPackage ./pkgs/hugo.nix { hugo = super.hugo; };

  # Zoom 7.0.0.1666 — вендорный package.nix из nixpkgs@f8a7f3e34c84
  # + xdg-utils для открытия ссылок из bwrap-sandbox.
  zoom-us = (self.callPackage ./pkgs/zoom-us.nix { }).override {
    targetPkgsFixed = [ super.xdg-utils ];
  };

  # Python-окружение для сетевой автоматизации.
  dvPythonEnvTest = unstable.python313.withPackages (
    ps: with ps; [
      ntc-templates
      netmiko
      colorama
      aiofiles
      tabulate
    ]
  );
}
