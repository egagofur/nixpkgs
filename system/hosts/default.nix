{ pkgs, lib, ... }: {
  programs.nix-index.enable = true;
  services.nix-daemon.enable = true;
  nix = {
    configureBuildUsers = true;
    settings = {
      auto-optimise-store = true;

      trusted-users = [ "@admin" "egagofur" ];

      substituters = [
        "https://cache.komunix.org"
        "https://nix-community.cachix.org"
        "https://r17.cachix.org/"
        "https://efishery.cachix.org"
      ];

      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "r17.cachix.org-1:vz0nG6BCbdgTPn7SEiOwe/3QwvjH1sb/VV9WLcBtkAY="
        "efishery.cachix.org-1:ix7pi358GsGkH7oBTmKGkVj42yBcjxRPi6IQ9AbRc0o="
      ];
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };

    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '' + lib.optionalString (pkgs.system == "aarch64-darwin") ''
      extra-platforms = x86_64-darwin aarch64-darwin
    '';
  };

  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [
    recursive
    (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" "Hack" ]; })
  ];

  system = {
    stateVersion = 4;
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
    defaults = {
      trackpad.Clicking = true;
      dock.autohide = true;
      NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;
    };
  };
}
