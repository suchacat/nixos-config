{ config, pkgs, inputs, ... }:

{
  imports = [
    ./sh.nix
    ./gtk.nix
    ./starship.nix
    ./fastfetch.nix
    ./hyprland.nix
    ./waybar.nix
    ./kitty.nix
    ./wofi.nix
    ./blueman-applet.nix
    ./network-applet.nix 
    ./firefox.nix
    ./hyprlock.nix 
    ./kanshi.nix
    ./sound-control.nix
    ./spicetify.nix
    ./git.nix
    ./vm.nix
    ./neovim.nix
  ];
 

  home.username = "suchacat";
  home.homeDirectory = "/home/suchacat";

   

   

  home.stateVersion = "24.05"; 
  
  home.packages = [
   pkgs.waybar
   pkgs.swww
   pkgs.rofi-wayland
   pkgs.themix-gui
   pkgs.gradience
   pkgs.prismlauncher
   pkgs.vesktop
   pkgs.hypnotix
   pkgs.glfw-wayland-minecraft
   pkgs.libappimage
   pkgs.spicetify-cli
   pkgs.jre8
   pkgs.obs-studio
   pkgs.gscreenshot
   pkgs.python3
   pkgs.python311Packages.pip
   pkgs.python311Packages.virtualenv
   pkgs.usbmuxd
   pkgs.libvirt
   pkgs.virt-manager
    pkgs.virt-viewer
    pkgs.spice pkgs.spice-gtk
    pkgs.spice-protocol
    pkgs.win-virtio
    pkgs.win-spice
    pkgs.gnome.adwaita-icon-theme
    pkgs.chromium
  ];



  home.file = {
  
  };

 
  home.sessionVariables = {
   
  };

  programs.home-manager.enable = true;
}
