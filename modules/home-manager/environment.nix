{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    desktop-file-utils
    discord
    spotify
    alacritty
    libreoffice
    darktable
  ];
}
