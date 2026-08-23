{ pkgs, ... }:

{
  home.packages = with pkgs; [
    desktop-file-utils
    discord
    spotify
    alacritty
    alacritty
    rclone
  ];
}
