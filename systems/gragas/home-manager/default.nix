{
  config,
  pkgs,
  lib,
  ...
}:

let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager = {
    backupFileExtension = "backup";

    users = {
      mdunlap = { pkgs, ... }: {
        programs = {
          librewolf = {
            enable = true;

            package = pkgs.librewolf.override {
              # See https://mozilla.github.io/policy-templates/ for more information on policy values.
              extraPolicies = {
                # Prevent the upload of telemetry data
                # As of Firefox 83 and Firefox ESR 78.5, local storage of telemetry data is disabled as well
                DisableTelemetry = true;

                # Don’t check if Firefox/Librewolf is the default browser at startup
                DontCheckDefaultBrowser = true;

                # Skip displaying the Firefox/Librewolf Terms of Use and Privacy Notice upon startup.
                SkipTermsOfUse = true;

                # Install and configure extensions
                ExtensionSettings = {
                  "*" = {
                    installation_mode = "blocked";
                  };

                  # uBlock Origin
                  "uBlock0@raymondhill.net" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
                    installation_mode = "force_installed";
                    private_browsing = true;
                  };

                  # Mozilla mult-containers
                  "@testpilot-containers" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/multi-account-containers/latest.xpi";
                    installation_mode = "force_installed";
                    private_browsing = false;
                  };
                };

                # Set the the list of requested locales for the application in order of preference. It will cause the corresponding language pack to become active.
                RequestedLocales = ["en-US"];

                # Enable or disable webpage translation
                TranslateEnabled = true;

                # Enable or disable (or force) private browsing mode
                # 0 - private browsing is available
                # 1 - private browsing is unavailable
                # 2 - private browsing is forced
                PrivateBrowsingModeAvailability = 0;

                # Disable the creation and use of a master/primary password.
                DisableMasterPasswordCreation = true;

                # Clear data on shutdown
                SanitizeOnShutdown = {
                  Cache = true;
                  Cookies = true;
                  FormData = true;
                  History = true;
                  Sessions = true;
                  SiteSettings = true;
                  Locked = true;
                };

                # Turn off saving information on web forms and the search bar
                DisableFormHistory = true;

                # Set permissions associated with camera, microphone, location, notifications, autoplay, and virtual reality
                Permissions = {
                  # Camera access permissions
                  Camera = {
                    Allow = [];
                    Block = [];
                    BlockNewRequests = true;
                    Locked = true;
                  };
                  # Microphone access permissions
                  Microphone = {
                    Allow = [];
                    Block = [];
                    BlockNewRequests = true;
                    Locked = true;
                  };
                  # Location access permissions
                  Location = {
                    Allow = [];
                    Block = [];
                    BlockNewRequests = true;
                    Locked = true;
                  };
                  # Desktop Notifications permissions
                  Notifications = {
                    Allow = [];
                    Block = [];
                    BlockNewRequests = true;
                    Locked = true;
                  };
                  # Media auto play permissions.
                  # Available values:
                  #   "allow-audio-video"
                  #   "block-audio"
                  #   "block-audio-video"
                  Autoplay = {
                    Allow = [];
                    Block = [];
                    Default = "block-audio-video";
                    Locked = true;
                  };
                };

                # Enable or disable Picture-in-Picture as well as prevent the user from enabling or disabling it (Locked)
                PictureInPicture = {
                  Enabled = true;
                  Locked = true;
                };

                # Configure the default pop-up window policy as well as origins for which pop-up windows are allowed
                PopupBlocking = {
                  # List of origins where popup-windows are allowed
                  Allow = [];
                  # Determines whether or not pop-up windows are allowed by default
                  Default = true;
                  Locked = true;
                };

                # Homepage
                Homepage = {
                  # The default homepage
                  URL = "";
                  # Allows for more than one homepage
                  Additional = [];
                  # How Firefox/Librewolf starts
                  # Available values:
                  # "none" - no homepage
                  # "homepage" - default homepage
                  # "previous-session" - previous Session
                  # "homepage-locked" - The user will always get the homepage at startup and cannot choose to restore their session
                  StartPage = "none";
                  Locked = true;
                };

                # Configure tracking protection
                # Appears to be enabled by default in Librewolf and cause where behavior in the ui.
                #EnableTrackingProtection = {
                #  # true - tracking protection is enabled by default in both the regular browser and private browsing and the Locked value determines whether or not a user can change it
                #  # false - tracking protection is disabled and locked in both the regular browser and private browsing
                #  Value = true;
                #  # Whether cryptomining scripts on websites are blocked
                #  Cryptomining = true;
                #  # Whether fingerprinting scripts on websites are blocked
                #  Fingerprinting = true;
                #  # Whether hidden email tracking pixels and scripts on websites are blocked (Firefox 112)
                #  EmailTracking = true;
                #  # Origins for which tracking protection is not enabled
                #  Exceptions = [];
                #  Locked = true;
                #};

                # Remove access to Firefox/Librewolf Screenshots
                DisableFirefoxScreenshots = true;

                # Remove Pocket in the Firefox/Librewolf UI. It does not remove it from the new tab page
                DisablePocket = true;

                # Enable or disable Encrypted Media Extensions and optionally lock it
                EncryptedMediaExtensions = {
                  # false - encrypted media extensions (like Widevine) are not downloaded by Firefox unless the user consents to installing them
                  Enabled = true;
                  Locked = true;
                };

                # Control whether or not Firefox/Librewolf offers to save passwords
                OfferToSaveLogins = false;

                # Enables or disables autofill for addresses
                AutofillAddressEnabled = false;

                # Enables or disables autofill for payment methods
                AutofillCreditCardEnabled = false;

                # Configure HTTPS-Only Mode
                # Available values
                # "allowed" - HTTPS-Only Mode is off by default, but the user can turn it on
                # "disallowed" - HTTPS-Only Mode is off and the user can’t turn it on
                # "enabled" - HTTPS-Only Mode is on by default, but the user can turn it off
                # "force_enabled" - HTTPS-Only Mode is on and the user can’t turn it off
                HttpsOnlyMode = "force_enabled";

                # Configure DNS over HTTPS
                DNSOverHTTPS = {
                  Enabled = true;
                  ProviderURL = "https://dns10.quad9.net/dns-query";
                  ExcludedDomains = [];
                  Fallback = true;
                  Locked = true;
                };

                Preferences = {};
              };
            };

            profiles = {
              mdunlap = {
                id = 0;
                name = "mdunlap";
                isDefault = true;
                containersForce = true;
                containers = {
                  entertainment = {
                    id = 1;
                    name = "entertainment";
                    color = "yellow";
                    icon = "chill";
                  };
                  social = {
                    id = 2;
                    name = "social";
                    color = "blue";
                    icon = "fingerprint";
                  };
                  finance = {
                    id = 3;
                    name = "finance";
                    color = "green";
                    icon = "dollar";
                  };
                  shopping = {
                    id = 4;
                    name = "shopping";
                    color = "red";
                    icon = "cart";
                  };
                  work = {
                    id = 5;
                    name = "work";
                    color = "orange";
                    icon = "briefcase";
                  };
                  homelab = {
                    id = 6;
                    name = "homelab";
                    color = "pink";
                    icon = "fence";
                  };
                };
                extensions = {};
                settings = {};
              };
            };
          };
        };

        # The state version is required and should stay at the version you
        # originally installed.
        home.stateVersion = "25.05";
      };
    };
  };
}
