{ config, pkgs, ... }:





{


stylix = {
   enable = true;
 
   image = ./wallpaper.png;
  
   fonts = {
    
    serif = config.stylix.fonts.sansSerif;

    sansSerif = {
      package = pkgs.inter;
      name = "Inter";
    };

    monospace = {
      package = pkgs.jetbrains-mono;
      name = "JetBrains Mono";
    };

    emoji = {
      package = pkgs.twemoji-color-font;
      name = "Twemoji";
    };
  };
 
   targets = {
    waybar.enable = false;
    wofi.enable = false;
     };

   base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";


   

  };

}
