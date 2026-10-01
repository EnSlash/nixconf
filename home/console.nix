{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lazygit
    yq-go
    dust
    duf
    procs
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyControl = [
      "ignoredups"
      "ignorespace"
    ];
    historySize = 100000;
    historyFileSize = 200000;

    # Оставляем пользовательские алиасы и локальные настройки в отдельном файле.
    initExtra = ''
      source ${pkgs.blesh}/share/blesh/ble.sh
      ${builtins.readFile ../configs/bashrc}
    '';
  };

  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      fetch.prune = true;
      pull.ff = "only";
      rerere.enabled = true;
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      line-numbers = true;
      side-by-side = true;
    };
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  programs.bat.enable = true;
  programs.fd.enable = true;
  programs.ripgrep.enable = true;
  programs.jq.enable = true;
  programs.tealdeer.enable = true;
  programs.gh.enable = true;

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };
}
