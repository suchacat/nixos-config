{ config, pkgs, ... }:





{

programs.git = {
  enable = true;
  userName = "suchacat";
  userEmail = "157089688+suchacat@users.noreply.github.com";
  extraConfig = {
    init.defaultBranch = "main";

    };
  };

}






