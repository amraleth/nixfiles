{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;

    extraPackages =
      epkgs: with epkgs; [
        use-package

        evil
        evil-collection
        general
        which-key

        vertico
        corfu
        orderless

        magit

        adwaita-dark-theme
        diff-hl

        nix-mode
      ];

    extraConfig = builtins.readFile ./emacs/init.el;
  };

  home.packages = with pkgs; [
    nixd
    nixfmt
  ];
}
