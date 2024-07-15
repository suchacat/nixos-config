{
  description = "My first flake!";

  inputs = {
     hyprland-contrib.url = "github:hyprwm/contrib";
     hyprland-contrib.inputs.nixpkgs.follows = "nixpkgs";
     nixpkgs.url = "nixpkgs/nixos-unstable";
     home-manager.url = "github:nix-community/home-manager/master";
     catppuccin.url = "github:catppuccin/nix";
     firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
      };
     hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
     spicetify-nix.url = "github:the-argus/spicetify-nix";
     home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = { self, nixpkgs, home-manager, catppuccin, firefox-addons,  ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { system = "x86_64-linux"; config = { allowUnfree = true; }; };
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ];
      };
    };
    homeConfigurations = {
      suchacat = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
 
        extraSpecialArgs = {inherit inputs; };
        modules = [ 
          ./home.nix 
          catppuccin.homeManagerModules.catppuccin
        ];

      };
    };
  };
}
