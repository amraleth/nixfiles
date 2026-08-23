{ ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;

  services.gnome.gnome-keyring.enable = true;
  services.gnome.gnome-online-accounts.enable = true;
  services.gvfs.enable = true;

  services.xserver.updateDbusEnvironment = true;

  security.pam.services.login.enableGnomeKeyring = true;
  services.cinnamon.apps.enable = false;
}
