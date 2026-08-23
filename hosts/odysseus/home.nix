{ ... }:

{
  home.username = "amraleth";
  home.homeDirectory = "/home/amraleth";
  home.stateVersion = "26.05";

  home.packages = [ ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "emacs";
  };

  programs.home-manager.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  imports = [
    ../../modules
  ];

}
