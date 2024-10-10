{
  inputs = {
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    nixpkgs.url = "nixpkgs/nixos-24.05";
    #chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    alejandra = {
      url = "github:kamadorueda/alejandra/3.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:MarceColl/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    ...
  } @ inputs: {
    nixosConfigurations = {
      laptop = nixpkgs-unstable.lib.nixosSystem {
        modules = [./hosts/laptop];
        specialArgs = {
          inherit inputs;
          username = "nel";
          hostname = "laptop";
          system = "x86_64-linux";
        };
      };
      server = nixpkgs.lib.nixosSystem {
        modules = [./hosts/server];
        specialArgs = {
          inherit inputs;
          username = "nel";
          hostname = "server";
          system = "x86_64-linux";
        };
      };
    };
  };
}
