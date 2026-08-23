{
	description = "NixOS root flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";	
		};
	};

	outputs = { self, nixpkgs, ... }@inputs: {
		nixosConfigurations.odysseus = nixpkgs.lib.nixosSystem {
			specialArgs = {inherit inputs;};
			modules = [
				./hosts/odysseus/configuration.nix
					inputs.home-manager.nixosModules.default	
			];
		};
	};
}
