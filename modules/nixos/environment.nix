{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    git
    curl
    wget
    gnome-tweaks
    firefox
  ];
}
