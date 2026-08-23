{ pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      name = "Mint-Y-Dark";
      package = pkgs.mint-themes;
    };

    iconTheme = {
      name = "Mint-Y";
      package = pkgs.mint-y-icons;
    };

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.mint-cursor-themes;
    };
  };
}
