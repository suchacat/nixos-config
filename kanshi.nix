{ config, pkgs, ... }:



{
  services.kanshi = {
    enable = true;
    systemdTarget = "hyprland-session.target";

   profiles = {
      undocked = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = 1.0;
            status = "enable";
          }
        ];
      };

      home_office = {
        outputs = [
          {
            criteria = "Acer Technologies KG241Y S 13280BD903W01";
            position = "1920,0";
            mode = "1920x1080@180Hz";
          }

          
          {
            criteria = "eDP-1";
            status = "disable";
          }
        ];
      };
    };
  };
}

