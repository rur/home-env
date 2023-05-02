{ pkgs, ... }: {

  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    secureSocket = false;
    baseIndex = 1;
    prefix = "C-Space";

    plugins = with pkgs.tmuxPlugins; [
      better-mouse-mode
      sensible
      vim-tmux-navigator
    ];

    extraConfig = builtins.readFile ./tmux.conf;
  };
}