{ pkgs, ... }: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "rg --files --hidden --follow";
    defaultOptions = [ "-m --bind ctrl-a:select-all,ctrl-d:deselect-all" ];
  };

  programs.zsh = {
    enable = true;
    profileExtra = builtins.readFile ./zsh/profile;
    initExtraFirst = builtins.readFile ./zsh/prompt;
    initExtra = builtins.readFile ./zsh/zshrc;
    logoutExtra = builtins.readFile ./zsh/logout;
    history.ignoreSpace = true;
    history.ignoreDups = true;
    sessionVariables = {
      PROMPT_COMMAND = "echo";
      EDITOR = "nvim";
      SHELL = "${pkgs.zsh}/bin/zsh";
      BAT_THEME = "OneHalfDark";
    };
    shellAliases = {
      rm = "rm -i";
      mv = "mv -i";
      cp = "cp -i";
      grep = "grep --color=auto";
      sudo = "sudo ";
      nv = "nvim";
      fe = "find_and_edit"; # see .profile for function definition
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
