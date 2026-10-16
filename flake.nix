{
  description = " My flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    umbriel = {
      url = "github:noctalia-dev/umbriel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
    };
  };
    
  outputs = { self, nixpkgs, home-manager, umbriel, noctalia, noctalia-greeter, ...}: {
    nixosConfigurations.linh = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        umbriel.nixosModules.default
        noctalia-greeter.nixosModules.default
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.linh = {
            imports = [
              umbriel.homeModules.default
              noctalia.homeModules.default
              ./home.nix
            ];
          };
        }
      ];
    };
  };
}
