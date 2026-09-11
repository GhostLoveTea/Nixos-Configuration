{ inputs, self, ... }:

{
    flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs self; };
        modules = [
            self.nixosModules.preservation
            self.nixosModules.config

            self.nixosModules."overlays.nixpkgs"
            self.nixosModules.modules
            self.nixosModules.users
            ./_modules
        ];
    };
}