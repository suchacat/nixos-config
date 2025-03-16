{ config, pkgs, ... }:

 let
    startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
      waybar &
      swww init &
  
      sleep 1
  
      swww img wallpaper.png &
    '';
in

{
  wayland.windowManager.hyprland = {
    enable = true;
    catppuccin.enable = true;
    xwayland.enable = true;

    settings = {
   
    monitor = "DP-1,1920x1080@180,0x0,1,vrr,1";
   
    exec-once = ''${startupScript}/bin/start'';

    env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCURSOR_SIZE,24"
        "XCURSOR_THEME,macOS-Monterey"
        "QT_QPA_PLATFORM,wayland"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "HYPRCURSOR_THEME,macOS-Monterey"
        "HYPRCURSOR_SIZE,24"
      ];
    
    "$mainMod" = "SUPER";
    bind =
      [
        "$mainMod, F, exec, firefox"
        "$mainMod, T, exec, kitty"
        "$mainMod, SPACE, exec, wofi --show drun"
        "$mainMod, Q, killactive"
        "$mainMod, L, exec, hyprlock"
        ", Print, exec, grimblast copy area"

        # Move focus with mainMod + arrow keys
        "$mainMod, left,  movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up,    movefocus, u"
        "$mainMod, down,  movefocus, d"

        # Moving windows
        "$mainMod SHIFT, left,  swapwindow, l"
        "$mainMod SHIFT, right, swapwindow, r"
        "$mainMod SHIFT, up,    swapwindow, u"
        "$mainMod SHIFT, down,  swapwindow, d"

        # Window resizing                     X  Y
        "$mainMod CTRL, left,  resizeactive, -60 0"
        "$mainMod CTRL, right, resizeactive,  60 0"
        "$mainMod CTRL, up,    resizeactive,  0 -60"
        "$mainMod CTRL, down,  resizeactive,  0  60"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Volume and Media Control
        "$mainMod, F7, exec, pamixer -i 5 "
        "$mainMod, F6, exec, pamixer -d 5 "
        "$mainMod, F5, exec, pamixer -t"
        
        # Brightness control
        "$mainMod, F2, exec, brightnessctl set 5%- "
        "$mainMod, F3, exec, brightnessctl set +5% "
      ];


       bindle = [
        ", XF86AudioRaiseVolume, exec, sound-up" # Sound Up
        ", XF86AudioLowerVolume, exec, sound-down" # Sound Down
        ", XF86MonBrightnessUp, exec, brightness-up" # Brightness Up
        ", XF86MonBrightnessDown, exec, brightness-down" # Brightness Down
      ];

    input = {

        follow_mouse = 1;

        touchpad = {
          natural_scroll = false;
        };

        #sensitivity = -1.5; # -1.0 - 1.0, 0 means no modification.
      };
    
    device = {

    name = "razer-razer-hyperpolling-wireless-dongle";
    sensitivity = -0.5;
  };

    




    general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 3;

        layout = "dwindle";

      };


     bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

     decoration = {
        rounding = 10;

        blur = {
          enabled = true;
          size = 16;
          passes = 2;
          new_optimizations = true;
        };

        
      };

      
      windowrulev2 = "float, class: (blueman-manager)";
      windowrule = "size 30%, (blueman-manager)";

    
    




    };

  };

}
