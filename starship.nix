{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    catppuccin.enable = true;
  };
}
