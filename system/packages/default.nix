{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    bun
    nodejs
    eza
    htop
    python3
    postgresql
    yarn
    neofetch
    php
    php83Packages.composer
    go
    bat
  ];
}
