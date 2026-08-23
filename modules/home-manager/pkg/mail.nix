{ pkgs, ... }:

{
  home.packages = with pkgs; [
    evolution
    protonmail-bridge-gui
  ];
}
