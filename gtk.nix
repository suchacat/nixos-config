{ config, pkgs, ... }:


{

 
  gtk = {
    enable = true;
    theme.package = pkgs.layan-gtk-theme;
    theme.name = "Layan-Dark";
    cursorTheme.package = pkgs.bibata-cursors;
    cursorTheme.name = "Bibata-Modern-Ice";
    iconTheme.package = pkgs.papirus-icon-theme;
    iconTheme.name = "Papirus-Dark";
  };
  



   qt = {
   enable = true;
   style.package = pkgs.layan-kde;
   style.name = "Layan-Dark";

   };

}
