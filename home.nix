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
    ./hm-fixes.nix
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
    pkgs.lunar-client
    pkgs.xdg-utils
  ];



  home.file = {
  
  };

 
  home.sessionVariables = {
   BROWSER = "firefox";
	    TERMINAL = "kitty";
	    NIXOS_OZONE_WL = "1";
	    QT_QPA_PLATFORMTHEME = "gtk4";
	    QT_SCALE_FACTOR = "1";
	    #MOZ_ENABLE_WAYLAND = "1";
	    SDL_VIDEODRIVER = "wayland";
	    _JAVA_AWT_WM_NONREPARENTING = "1";
	    QT_QPA_PLATFORM = "wayland-egl";
	    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
	    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
	    WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
	    WLR_NO_HARDWARE_CURSORS = "1"; # if no cursor,uncomment this line  
	    # GBM_BACKEND = "nvidia-drm";
	    CLUTTER_BACKEND = "wayland";
	    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
	    LIBVA_DRIVER_NAME = "nvidia";
	    WLR_RENDERER = "vulkan";
	    __NV_PRIME_RENDER_OFFLOAD="1";
	    XDG_CURRENT_DESKTOP = "Hyprland";
	    XDG_SESSION_DESKTOP = "Hyprland";
	    XDG_SESSION_TYPE = "wayland";
	    GTK_USE_PORTAL = "1";
	    NIXOS_XDG_OPEN_USE_PORTAL = "1";
	    XDG_CACHE_HOME = "\${HOME}/.cache";
	    XDG_CONFIG_HOME = "\${HOME}/.config";
	    XDG_BIN_HOME = "\${HOME}/.local/bin";
	    XDG_DATA_HOME = "\${HOME}/.local/share";
  };

  programs.home-manager.enable = true;
}
