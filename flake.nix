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
     spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
     stylix.url = "github:danth/stylix";
     home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = { self, nixpkgs, home-manager, catppuccin, firefox-addons, stylix, spicetify-nix,  ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { system = "x86_64-linux"; config = { allowUnfree = true; allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
            "joypixels"
          ];
          joypixels.acceptLicense = true; }; };
      supportedSystems = [ "aarch64-linux" "i686-linux" "x86_64-linux" ];
      forAllSystems = inputs.nixpkgs.lib.genAttrs supportedSystems;
      nixpkgsFor =
        forAllSystems (system: import inputs.nixpkgs { inherit system; });

    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ];
      };
    };
   
    home-manager.useGlobalPkgs = true;

    homeConfigurations = {
      suchacat = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
 
        extraSpecialArgs = {inherit inputs; };
        modules = [ 
          ./home.nix 
          catppuccin.homeManagerModules.catppuccin
          stylix.homeManagerModules.stylix
	  inputs.spicetify-nix.homeManagerModules.default
        ];

      };
    };
    packages = forAllSystems (system:
        let pkgs = nixpkgsFor.${system};
        in {
          default = self.packages.${system}.install;

          install = pkgs.writeShellApplication {
            name = "install";
            runtimeInputs = with pkgs; [ git ]; # I could make this fancier by adding other deps
            text = ''${./install.sh} "$@"'';
          };
        });

      apps = forAllSystems (system: {
        default = self.apps.${system}.install;

        install = {
          type = "app";
          program = "${self.packages.${system}.install}/bin/install";
        };
      });
    };
  
}
