{
  config,
  pkgs,
  ...
}: let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
in {
  programs = {
    firefox = {
      enable = true;
      languagePacks = ["en-US" "fr" "en-GB"];

      /*
      ---- POLICIES ----
      */
      # Check about:policies#documentation for options.
      policies = {
        OfferToSaveLogins = false;
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = false;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
        DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
        SearchBar = "unified"; # alternative: "separate"

        /*
        ---- EXTENSIONS ----
        */
        # Check about:support for extension/add-on ID strings.
        # Valid strings for installation_mode are "allowed", "blocked",
        # "force_installed" and "normal_installed".
        ExtensionSettings = {
          "*".installation_mode = "normal_installed";
          "*".private_browsing = true;

          # Bitwarden:
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
            installation_mode = "normal_installed";
          };
          # Dark reader:
          "addon@darkreader.org" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
            installation_mode = "normal_installed";
          };
          # I still don't care about cookies:
          "idcac-pub@guus.ninja" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/istilldontcareaboutcookies/latest.xpi";
            installation_mode = "normal_installed";
          };
          # Sidebery:
          "{3c078156-979c-498b-8990-85f7987dd929}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/sidebery/latest.xpi";
            installation_mode = "normal_installed";
          };
          # Vimium:
          "vimium-c@gdh1995.cn" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-c/latest.xpi";
            installation_mode = "normal_installed";
          };
          # uBlock Origin:
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "normal_installed";
          };
        };

        /*
        ---- PREFERENCES ----
        */
        # Check about:config for options.
        Preferences = {
          "browser.contentblocking.category" = {
            Value = "strict";
            Status = "locked";
          };
          "extensions.pocket.enabled" = "lock-false";
          "extensions.screenshots.disabled" = "lock-true";
          "browser.topsites.contile.enabled" = "lock-false";
          "browser.formfill.enable" = "lock-false";
          "browser.search.suggest.enabled" = "lock-false";
          "browser.search.suggest.enabled.private" = "lock-false";
          "browser.urlbar.suggest.searches" = "lock-false";
          "browser.urlbar.showSearchSuggestionsFirst" = "lock-false";
          "browser.newtabpage.activity-stream.feeds.section.topstories" = "lock-false";
          "browser.newtabpage.activity-stream.feeds.snippets" = "lock-false";
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = "lock-false";
          "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = "lock-false";
          "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = "lock-false";
          "browser.newtabpage.activity-stream.section.highlights.includeVisited" = "lock-false";
          "browser.newtabpage.activity-stream.showSponsored" = "lock-false";
          "browser.newtabpage.activity-stream.system.showSponsored" = "lock-false";
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = "lock-false";
        };
      };
    };
  };
}
