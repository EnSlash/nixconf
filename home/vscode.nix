{ pkgs, ... }:

let
  marketplaceExtensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      publisher = "jheilingbrunner";
      name = "vscode-gnupg-tool";
      version = "1.4.2";
      sha256 = "1pck0y48b21zd34gl39x28qlzgav8amb2djngy2prxkvbigz4y9z";
    }
    {
      publisher = "liemlb";
      name = "nix-flakes";
      version = "0.3.5";
      sha256 = "12lwjimhm5qxjbr293lwrx20219cz2iypaxv50vl16qk0gl3ixw0";
    }
    {
      publisher = "phoihos";
      name = "csv-to-md-table";
      version = "0.3.1";
      sha256 = "1xbhsqz79jj2hfxc3xn9d7qpaxq81b2bj8flznwzj9cgaln8zmjl";
    }
    {
      publisher = "pinage404";
      name = "nix-extension-pack";
      version = "3.0.0";
      sha256 = "1ndhz51p1fxf42ch1awf7cydi5jryff5v72zckl1mi3j17ldsrbi";
    }
    {
      publisher = "rogalmic";
      name = "bash-debug";
      version = "0.3.9";
      sha256 = "0n7lyl8gxrpc26scffbrfczdj0n9bcil9z83m4kzmz7k5dj59hbz";
    }
    {
      publisher = "yvesdb";
      name = "mercurial-lens";
      version = "0.0.4";
      sha256 = "0h5gafbm01x2cgvnsdgcy0bvv53r4kmvw4cgnl8rjzclbc4yyrh1";
    }
  ];
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    # Расширения устанавливаются только через Nix. Это предотвращает
    # накопление старых версий в ~/.vscode/extensions.
    mutableExtensionsDir = false;

    profiles.default.extensions =
      (with pkgs.vscodeExtensionsUnstable; [
        anthropic.claude-code
        arrterian.nix-env-selector
        bbenoist.nix
        davidanson.vscode-markdownlint
        donjayamanne.githistory
        eamodio.gitlens
        jnoortheen.nix-ide
        mads-hartmann.bash-ide-vscode
        mechatroner.rainbow-csv
        mhutchie.git-graph
        mkhl.direnv
        ms-azuretools.vscode-containers
        ms-ceintl.vscode-language-pack-ru
        ms-python.debugpy
        ms-python.python
        ms-python.vscode-pylance
        ms-python.vscode-python-envs
      ])
      ++ marketplaceExtensions;
  };
}
