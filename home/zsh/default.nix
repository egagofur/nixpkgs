{ config, ... }: {

  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.oh-my-zsh.enable = true;
  programs.zsh.oh-my-zsh.plugins = [ "git" "ant" ];
  programs.zsh.oh-my-zsh.theme = "intheloop";

  programs.zsh.initExtra = ''
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export PATH=~/.npm-packages/bin:$PATH
    export PATH=~/.grader/bin:$PATH
    export NODE_PATH=~/.npm-packages/lib/node_modules
    export XKB_DEFAULT_OPTIONS=caps:escape
    export PATH="$HOME/.local/bin:$PATH"
    export NIX_REMOTE=daemon
    export PATH="$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:$PATH"
    export PATH="$HOME/.nix-profile/sbin:/nix/var/nix/profiles/default/sbin:$PATH"
    export PATH="$HOME/.nix-profile/libexec:$PATH"
    export PATH="$PATH/opt/homebrew/bin:$PATH"
    export NIX_PATH=$HOME/.nix-defexpr/channels:$NIX_PATH
    export NIX_PATH=darwin-config=$HOME/.nixpkgs/darwin-configuration.nix:$HOME/.nix-defexpr/channels:$NIX_PATH
    export NODE_OPTIONS=--max_old_space_size=4096
    export DIRENV_LOG_FORMAT=
    export PATH="/opt/homebrew/opt/libressl/bin:$PATH"
    export LDFLAGS="-L/opt/homebrew/opt/libressl/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/libressl/include"
    source ~/.config/nixpkgs/home/zsh/z.sh
  '';

  programs.zsh.shellAliases.u = "nix flake update ~/.config/nixpkgs";
  programs.zsh.shellAliases.b =
    "~/.config/nixpkgs/result/sw/bin/darwin-rebuild switch --flake ~/.config/nixpkgs --impure";
  programs.zsh.shellAliases.clean = "sudo nix-collect-garbage -d";
  programs.zsh.shellAliases.ls = "eza";
  programs.zsh.shellAliases.lsa = "eza -a";
  programs.zsh.shellAliases.ll = "eza -l";
  programs.zsh.shellAliases.c = "clear";
  programs.zsh.shellAliases.v = "nvim";
  programs.zsh.shellAliases.t = "tmux";

  programs.zsh.history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
  };

}
