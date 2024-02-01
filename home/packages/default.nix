{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bun
    nodejs
    eza
    htop
    postgresql
    fd
    android-tools
    rubber
    ripgrep
    luajitPackages.lua-lsp
    vscode
  ];
}
