{ pkgs, ... }: {

  programs.tmux.enable = true;
  programs.tmux.clock24 = true;
  programs.tmux.plugins = with pkgs.tmuxPlugins; [
    sensible
    yank
    {
      plugin = catppuccin;
      extraConfig = ''
        set -g @plugin rose-pine/tmux
        set -g @rose_pine_host on
        set -g mouse on
      '';
    }
  ];

}
