# home.nix 
                                                                                           
{ pkgs, inputs, config, ... }:

{
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

      userChrome = ''                         
      /* Firefox Alpha v 1.1.0 */
/* Source: https://github.com/Tagggar/Firefox-Alpha/ */
:root {
  --6: 6px;
  --8: 8px;
  --tab-min-height: 28px !important;
  --tab-min-width: 28px !important;
  --toolbarbutton-border-radius: var(--8) !important;
  --tab-border-radius: var(--8) !important;#TabsToolbar {
  }
  --main: #77777770;
  --item: #77777730;
  --grey: #b8b8b8;
  --red: #ff000070;
  
  --toolbarbutton-hover-background: transparent !important;
  --toolbarbutton-active-background: transparent !important;
}

/* Clean UI */
* {
  outline: none !important;
  box-shadow: none !important;
  border: none !important;
}

/* Highlight Selection color */
::selection {
  background-color: dodgerblue !important;
  color: white !important;
}

/* Customization Panel Fix */
#customization-panelWrapper > .panel-arrowbox > .panel-arrow {
  margin-inline-end: initial !important;
}

/* Video Background Fix */
video {
  background-color: black !important;
}

/* ❌ Hide Items ❌ */
/* ❌ Tooltips ❌ */
tooltip,

/* ❌ Empty Space */
spacer,.titlebar-spacer,

/* ❌ Tab List */
#alltabs-button,

/* ❌ #PanelUI-button */
#PanelUI-menu-button,

/* ❌ Titlebar Window Controls */
.titlebar-buttonbox-container,

/* ❌ Navigation Buttons */
#back-button, #forward-button, #reload-button, #stop-reload-button,

/* ❌ Menu Icons __ menuitem > .menu-iconic-left, */
 menu > .menu-iconic-left, .menu-right,

/* ❌ Menu Separator */
menuseparator, toolbarseparator,

/* ❌ Menu Disabled */
menuitem[disabled], menu[disabled],

/* ❌ Overflow Icon */
#nav-bar-overflow-button,

/* ❌ url-bar Icons */
#urlbar-zoom-button,#tracking-protection-icon-container,#identity-box,

/* ❌ Bookmark Folder Icons */
#PlacesToolbar .bookmark-item:not([label=""]) > .toolbarbutton-icon,

/* ❌ Bookmarks [>] Button */
#PlacesChevron,

/* ❌ Tab Icon Overlay */
.tab-icon-overlay,

/* ❌ Tab Mute Icon */
.tab-icon-sound-label,
.tab-icon-overlay:not([muted]):is([soundplaying]),

/* ❌ Tab Close Btn */
.tab-close-button:not([selected]),

/* ❌ Tab Pinned Text */
.tab-label-container[pinned],

/* ❌ New Tab logo */
.tabbrowser-tab[label="New Tab"] .tab-icon-image,

/* ❌ Findbar Checkboxes */
.findbar-container > checkbox,

/* ❌ Menu Icons */
#contentAreaContextMenu > menuitem > .menu-iconic-left,
#context-navigation > menuitem > .menu-iconic-left,

/* ❌ Downloads Icons */
.downloadTypeIcon,
#downloads-button > .toolbarbutton-badge-stack > .toolbarbutton-badge,
:root:not([customizing]) #downloads-indicator-icon,
#downloads-indicator-start-box, #downloads-indicator-start-image > *,
#downloads-indicator-finish-box, #downloads-indicator-finish-image > *, 

/* ❌ Private Indicator */
.private-browsing-indicator {
  display: none !important;
  -moz-user-focus: none;
}

/* 🔗 Status Panel [Url Popup] */
#statuspanel #statuspanel-label {
  font-weight: 600 !important;
  padding-inline: var(--6) !important;
  border-radius: var(--6) !important;
  margin: var(--8) !important;
  background-color: blue !important;
}

/* ℹ️ Findbar Ctrl+F */
findbar {
  padding: 0 !important;
  margin: 0 8px !important;
  border-radius: var(--6) !important;
  width: 240px;
  background: var(--grey) !important;
  order: -1;
}
.findbar-container {
  padding: 0 !important;
  margin: 0 !important;
  height: var(--tab-min-height) !important;
}
.findbar-textbox {
  width: 168px !important;
  padding-inline: var(--6) !important;
  height: var(--tab-min-height) !important;
  color: black !important;
  background: none !important;
}
findbar toolbarbutton {
  width: 24px;
  padding: 4px !important;
  margin: 0 !important;
  background: none !important;
  fill: black !important;
  scale: 0.7;
}

/* *️⃣ Menu *️⃣ */
/* *️⃣ Toolbar Menu Alt */
#toolbar-menubar[autohide="true"][inactive="true"] {
  height: 0 !important;
  margin: 0 !important;
}

#toolbar-menubar {
  height: 24px !important;
  border-radius: var(--6);
  background-color: var(--grey);
  position: relative;
  margin: var(--6) var(--6) 0 var(--6);
  z-index: 3;
}


/* *️⃣ Toolbar Menu Item */
menu[_moz-menuactive="true"]:not([disabled="true"]),
menucaption[_moz-menuactive="true"]:not([disabled="true"]) {
  background-color: var(--main) !important;
  border-radius: 4px;
}
#main-menubar {
  margin: 4px;
  background-color: none;
  color: black;
  height: 16px !important;
}

/* *️⃣ Menu Popup Box */
.menupopup-arrowscrollbox {
  border-radius: var(--8) !important;
  padding: var(--6) !important;
  background-color: var(--grey) !important;
  color: black !important;
}

/* Menu Position */
menupopup {
  margin: var(--6) 0 !important;
}

#main-menubar menupopup {
    margin: var(--6) var(--8) 0 -8px !important;
}

menupopup > menuitem,
menupopup > menu {
  appearance: none !important;
  max-height: 20px !important;
  min-height: 20px !important;
  border-radius: var(--6) !important;
  padding-inline: var(--6) !important;
  margin: 0 !important;



}
.menu-accel {
  margin-inline: var(--6) 0 !important;
}

/* ⬅️➡️🔄️ Context Nav Text Buttons*/
menuitem[_moz-menuactive="true"]:not([disabled]),
menupopup > menuitem[_moz-menuactive],
menupopup > menu[_moz-menuactive] {
  background-color: var(--main) !important;
  color: black !important;  
}
#context-navigation {
  flex-direction: column !important;
}
#context-navigation > menuitem::before {
  content: attr(aria-label);
}
#context-navigation > menuitem {
  justify-content: start !important;
  border-radius: var(--6) !important;
  padding-inline: var(--6) !important;
  height: 20px !important;
  width: 100% !important;
}

/* ❎ Tabs Multi-row ❎ */
scrollbox[part][orient="horizontal"] {
  display: flex;
  flex-wrap: wrap !important;
  height: none !important;
}

#tabbrowser-tabs > * {
  padding: 2px !important;
  margin: 2px !important;
}
tab {
  margin: 0 4px 0 0 !important;
}
:root:not([customizing]) #titlebar {
  margin-bottom: -24px;
}

.tabbrowser-tab[fadein]:not([selected]):not([pinned]) {
  max-width: 120px !important;
  min-width: 80px !important;
}
.tabbrowser-tab .tab-background:not([selected]) {
  background: var(--item) !important;
}
.tab-label-container:not([selected]) {
  opacity: 0.5 !important;
}
.tab-content {
  padding-inline: var(--6) !important;
}

/* Tabs [Selected] */
.tabbrowser-tab[selected][fadein]:not([pinned]) {
  max-width: 320px !important;
  min-width: 240px !important;
}
.tabbrowser-tab .tab-background[selected="true"] {
  background: var(--main) !important;
}

/* Tabs [Pinned] */
.tabbrowser-tab[pinned] {
  width: calc(var(--tab-min-height) + var(--8)) !important;
}

/* Tabs Audio */
#tabbrowser-tabs .tabbrowser-tab:is([soundplaying]) .tab-background {
  background-color: var(--red) !important;
  transition: background-color 0.1s ease !important;
}

/* Tabs Audio Favicon */
.tab-icon-stack:not([pinned], [sharing], [crashed]):is([soundplaying], [muted])
  > :not(.tab-icon-overlay) {
  opacity: 1 !important;
}

/* Tab Close on hover */
tab:not([pinned]):hover .tab-close-button {
  display: flex !important;
}
.tab-close-button {
  margin: -6px !important;
  opacity: 0.5;
  background-color: transparent !important;
}

/* New Tab by MMB on Tabs Toolbar  */
#tabs-newtab-button,
#tabbrowser-arrowscrollbox-periphery {
  flex: 1;
  align-items: stretch !important;
  opacity: 0 !important;
  -moz-window-dragging: drag !important;
}

/* 🪟 Bookmarks Multi-row  */
:root[BookmarksToolbarOverlapsBrowser] :where(#PersonalToolbar) {
  height: unset !important;
}
#PersonalToolbar {
  padding: 0 !important;
  margin: 0 !important;
  max-height: none !important;
}
#PlacesToolbarItems {
  display: flex;
  flex-wrap: wrap;
  padding: 0 var(--6);
}
#PlacesToolbarItems > .bookmark-item {
  margin: 0 var(--8) var(--8) 0 !important;
  padding: 0 var(--6) !important;
  background: var(--item) !important;
  color: grey !important;
  height: var(--tab-min-height);
}



/* 🔗 URLBAR Input https: */
#urlbar-input {
  transition: transform 0.1s linear;
  transform: none !important;
  font-size: 1rem !important;
  color: lightgrey !important;
  padding-inline: 0px !important;
}



/* 📐 URLBAR in Tab */

/* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/selected_tab_as_urlbar.css made available under Mozilla Public License v. 2.0
See the above repository for updates as well as full license text. */

/* This is a horrible hack and absolutely requires click_selected_tab_to_focus_urlbar.css to work. In general it's pertty bad, but meh */

/* Also hides the nav-bar and shows main menu button next to window controls. And makes the selected tab expand a whole bunch  */

/* Whole bunch of z-indexing */
#main-window > body > box{ position: relative; z-index: 1 }
.urlbar-input-box{ z-index: -1 !important; }
#urlbar{ z-index: auto !important; }
#alltabs-button,
#unified-extensions-button,
#PanelUI-button,
#nav-bar-overflow-button{ z-index: 2; position: relative }

#urlbar-input-container{
  width: calc(100vw - var(--uc-window-control-width) - var(--uc-buttons-width) - 2 * var(--uc-window-drag-space-width) - 76px) !important;
  left: calc(76px + var(--uc-window-drag-space-width)) !important;
  pointer-events: none;
  overflow: visible !important;
}
:root:not([customizing]) #urlbar-input-container::before{
  position: absolute;
  left: 0;
  top: 0 !important;
  height: var(--urlbar-container-height);
}
#urlbar-input-container > :not(.urlbar-input-box){ opacity: 0 }

#urlbar-background{
  background: transparent !important;
  border: none !important;
  box-shadow: none !important;
  outline: none !important;
}
#urlbar{pointer-events: none !important;}
#urlbar-container{
  position: static !important;
  margin-left: var(--uc-window-control-width) !important;
}
#remote-control-box,
#urlbar-search-button{
  display: none;
}
#tracking-protection-icon-container,
#identity-box{
  max-width: 0.1px;
  padding-inline: 0 !important;
}
.urlbarView{
  background: var(--toolbar-field-focus-background-color);
  border: 1px solid var(--toolbar-field-focus-border-color) !important;
  z-index: 1;
  padding: 6px;
  border-radius: 6px;
  box-shadow: 0 0 26px #444;
  left:50vw;
  width: max(70vw,600px) !important;
  transform: translateX(-50%) !important;
}

.tabbrowser-tab[selected][fadein]{
  max-width: 100vw !important;
  min-width: 200px !important;
  flex-grow: 300 !important;
}

#navigator-toolbox:focus-within .tabbrowser-tab[selected] .tab-content{
  opacity: 0;
}
#navigator-toolbox:focus-within .tab-background[selected]{
  background-image: -moz-element(#urlbar-input) !important;
  background-position: calc(var(--tab-inline-padding,4px) + 6px) 3px !important;
  background-color: var(--toolbar-field-focus-background-color) !important;
  background-size: auto !important;
}

:root:not([customizing]) #titlebar{ margin-bottom: calc(0px - var(--tab-min-height) - 2*var(--tab-block-margin)); }

/* Oh and! also hide other buttons from the nav-bar because why not */
:root:not([customizing]) #nav-bar-customization-target > :not(#urlbar-container){ visibility: collapse }


#downloads-button {
  visibility: visible !important;
}

#urlbar-input {
  text-align: center;
}

#unified-extensions-button{
  visibility: visible !important;
}
#back-button, #forward-button{
  order: -1;
  z-index: 2;
  visibility: visible !important;
}

/* By default this style moves your back and forward buttons to the left edge of the navbar and adds a placeholder space for them.
   Set the following pref to false to disable that behavior */
@media (-moz-bool-pref: "userchrome.selected-tab-as-urlbar.nav-buttons-space.disabled"){
  #TabsToolbar > .toolbar-items{ margin-left: 0px !important; }
  #nav-bar-customization-target{ margin-left: 0px !important; }
  #back-button, #forward-button{
    order: auto;
    z-index: auto;
  }
} 
 
#nav-bar{ 
  height: calc(var(--tab-min-height) + 2*var(--tab-block-margin));
  box-shadow: none !important;
  background-color: transparent !important;
}
#titlebar:has(> [autohide="true"]) + #nav-bar{
  padding-right: calc(138px + 40px);
}

/* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/click_selected_tab_to_focus_urlbar.css made available under Mozilla Public License v. 2.0
See the above repository for updates as well as full license text. */

/* Clicking selected tab selects focuses urlbar */
/* Selected tab cannot be normally clicked (right-,middle- or left-clicked) EXCEPT from the tab icon */

/* Clicking selected pinned tab doesn't focus urlbar by default since I expect you might not want to change pinned tab address - see below */


/* Make selected tab unclickable so click goes to the capture box, obviously it can't be clicked at all anymore */
/* remove the :not([pinned]) bit to make clicking pinned tab AROUND the tab-icon focus urlbar*/

.tabbrowser-tab:not([pinned])[selected]{ pointer-events: none }

:root{
  --uc-window-control-width: 138px;
  --uc-buttons-width: 116px;
  --uc-window-drag-space-width: 40px;
  --uc-menubar-height: 0px;
}
@media (-moz-platform: windows),
       (-moz-platform: linux){
  :root:is([sizemode="maximized"],[sizemode="fullscreen"]){
    --uc-window-drag-space-width: 0px;
  }
  #titlebar:has(> [autohide="false"]) + #nav-bar{
    --uc-window-drag-space-width: 0px;
    --uc-menubar-height: 28px;
  }
}
/* Add back pointer-events to several elements so UI remains usable */
/* The selected tab can be clicked normally from the icon */
#TabsToolbar toolbarbutton,
#TabsToolbar toolbaritem,
.tabbrowser-tab,
.tab-close-button,
.tab-icon-stack{
  pointer-events: auto
}
/* Invisible capture box behind tabs*/
:root:not([customizing]) #urlbar-input-container::before{
  position: fixed;
  display: block;
  left: 0;
  top: var(--uc-menubar-height);
  width: var(--uc-buttons-width);
  height: calc(var(--tab-min-height) + 2*var(--tab-block-margin));
  content: "";
  pointer-events: auto;
}
:root[tabsintitlebar]:not([customizing]) #urlbar-input-container::before{
  left: var(--uc-window-drag-space-width);
  width: calc(100vw - var(--uc-window-control-width) - var(--uc-buttons-width) - 2 * var(--uc-window-drag-space-width));
}
#urlbar-input-container:focus-within::before{ display: none !important; }

/* Make tabs appear over the invisible box */
:root:not([customizing]) #TabsToolbar-customization-target{
  position: relative;
  z-index: 1;
  pointer-events: none
}
#titlebar{
  opacity: 1 !important;
  will-change: unset !important;
  transition: none !important;
}


/* ⬇️ Downloads Indicator */
#downloads-button {
  position: fixed ;
  top: 0;
  right: 0;
  width: var(--tab-min-height);
  z-index: 1;
}
#downloads-indicator-progress-outer {
  position: fixed !important;
  align-items: end !important;
  top: var(--8) !important;
  right: var(--8) !important;
  left: auto !important;
  width: var(--6) !important;
  height: var(--tab-min-height) !important;
  border-radius: var(--6) !important;
  background: var(--item);
  visibility: visible !important;
}
#downloads-indicator-progress-inner {
  background: url("data:image/svg+xml;charset=UTF-8,%3csvg width='6' height='24' xmlns='http://www.w3.org/2000/svg'%3e%3crect width='6' height='24' fill='dodgerblue'/%3e%3c/svg%3e") bottom no-repeat !important;
  height: var(--download-progress-pcent) !important;
  border-radius: var(--6) !important;
}
#downloads-button[attention="success"] #downloads-indicator-progress-outer {
  background: deepskyblue !important;
}
#downloads-button:is([attention="warning"], [attention="severe"])
  #downloads-indicator-progress-inner {
  background: orange !important;
  height: var(--8) !important;
}

/* ⬇️ Downloads Panel */
#downloadsPanel {
  position: fixed !important;
  margin: 4px var(--6) !important;
  border-radius: var(--6) !important;
}
#downloadsPanel-mainView {
  background-color: var(--grey) !important;
  color: black;
  padding: var(--6) !important;
}
#downloadsFooterButtons > button,
#downloadsListBox > richlistitem {
  min-height: var(--tab-min-height) !important;
  padding: 0 0 0 var(--6) !important;
  margin: 0 !important;
  border-radius: var(--6) !important;
}
#downloadsListBox > richlistitem * {
  padding: 0 !important;
  margin: 0 !important;
  padding-block: 0 !important;
  border-radius: var(--6) !important;
}
#downloadsListBox > richlistitem > .downloadMainArea {
  margin-inline-end: var(--8) !important;
}

/* Search Suggestions Fix*/
#urlbar-container #urlbar-input-container {
  opacity: 0;
}
.urlbarView {
  background-color: var(--lwt-accent-color); /* Pop-up background color (adaptive) */
  color: grey;    
                           }                           /* Pop-up text color */                        
      '';                                      

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        bitwarden
        ublock-origin
        sponsorblock
        tabliss
        youtube-shorts-block
      ];

    };
  };
}
