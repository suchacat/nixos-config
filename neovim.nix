{ config, pkgs, ...}:





{

programs.neovim = {
   enable = true;
   catppuccin.enable = true;
   catppuccin.flavor = "mocha";
  };

}