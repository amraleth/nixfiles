{
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ../../modules/nixos/default.nix
  ];

  networking = {
    hostName = "odysseus";
    networkmanager.enable = true;
  };

  users.users."amraleth" = {
    isNormalUser = true;
    description = "Patrick Vollandt";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "amraleth" = import ./home.nix;
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "26.05";

}
