{ config, pkgs, ... }:


{

programs.kitty = {
   enable = true;
   font.name = "DejaVu Sans";
   catppuccin.enable = true;
   catppuccin.flavor = "mocha";


 };


}
