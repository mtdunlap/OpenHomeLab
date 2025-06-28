{
  config,
  pkgs,
  ...
}:

{
  environment = {
    plasma6 = {
      excludePackages = with pkgs.kdePackages; [
        # Packages to exclude.
        # plasma-browser-integration
        # konsole
        # (lib.getBin qttools) # Expose qdbus in PATH
        # ark
        elisa
        gwenview
        okular
        kate
        # khelpcenter
        # dolphin
        # baloo-widgets # baloo information in Dolphin
        # dolphin-plugins
        spectacle
        # ffmpegthumbs
        krdp
        xwaylandvideobridge
      ];
    };
  };

  services = {
    desktopManager = {
      plasma6 = {
        enable = true;
      };
    };

    displayManager = {
      sddm = {
        enable = true;

        settings = {
          General = {
            DisplayServer = "wayland";
          };
        };

        wayland = {
          enable = true;
        };
      };
    };

    libinput = {
      # Enable touchpad support (enabled default in most desktopManager).
      enable = true;
    };

    xserver = {
      # Enable the X11 windowing system.
      # You can disable this if you're only using the Wayland session.
      enable = false;

      # Configure keymap in X11
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}
