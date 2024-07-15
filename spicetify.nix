{ pkgs, config, lib, inputs, ... }:
let spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {

  imports = [ inputs.spicetify-nix.homeManagerModules.default ];
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "spotify" ];
  programs.spicetify = {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      playlistIcons
      lastfm
      historyShortcut
      hidePodcasts
      fullAppDisplay
      shuffle
    ];
 

   enabledCustomApps = with spicePkgs.apps; [
        marketplace
      ];

  };
}
