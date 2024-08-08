# home.nix 
                                                                                           
{ pkgs, inputs, config, ... }:

  

{
 
   home.file.".mozilla/firefox/suchacat/chrome/userChrome.css".source = ./userChrome.css;

  programs.firefox = {
    enable = true;
    profiles.suchacat = {

      search.engines = {
        "Nix Packages" = {
          urls = [{
            template = "https://search.nixos.org/packages";
            params = [
              { name = "type"; value = "packages"; }
              { name = "query"; value = "{searchTerms}"; }
            ];
          }];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };
      };
      search.force = true;

      bookmarks = [
      ];

      settings = {
        "dom.security.https_only_mode" = true;
        "browser.download.panel.shown" = true;
        "identity.fxaccounts.enabled" = false;
        "signon.rememberSignons" = false;
        "browser.search.suggest.enabled" = false;
        "browser.urlbar.maxRichResults" = 0;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
       
      


                                            

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        bitwarden
        ublock-origin
        sponsorblock
        tabliss
        youtube-shorts-block
        return-youtube-dislikes
      ];

    };
  };
}
