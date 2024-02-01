{
  programs.git = {
    enable = true;
    userName = "egagofur";
    userEmail = "egagofurtriwahana@gmail.com";
    extraConfig = {
      init = { defaultBranch = "main"; };
      push = { autoSetupRemote = true; };
      core = { excludesfile = "$NIXOS_CONFIG_DIR/scripts/gitignore"; };
    };
  };
}
