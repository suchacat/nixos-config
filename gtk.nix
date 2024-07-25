{ config, pkgs, inputs, ... }:


{

 
  gtk = {
    enable = true;
    theme.package = pkgs.rose-pine-gtk-theme;
    theme.name = "rose-pine";
    cursorTheme.package = pkgs.apple-cursor;
    cursorTheme.name = "macOS-Monterey";
    iconTheme.package = pkgs.papirus-icon-theme;
    iconTheme.name = "Papirus-Dark";
  };
  
xdg.configFile = {
  "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
  "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
  "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
};


   qt = {
   enable = true;

   };

}
