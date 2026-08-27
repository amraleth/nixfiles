{ pkgs, ... }:

{
  home.packages = with pkgs; [
    prismlauncher
    pandora-launcher
  ];
}
