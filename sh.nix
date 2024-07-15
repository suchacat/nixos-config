{ config, pkgs, inputs, ... }:



{


  programs.bash = {
  enable = true;
  initExtra = ''
  eval "$(starship init bash)"
  fastfetch
'';
   


  };
 }
