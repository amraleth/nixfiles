{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains.idea
    jetbrains.datagrip
    jetbrains.goland
    bruno
  ];
}
