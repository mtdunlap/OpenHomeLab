{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./unfree/default.nix
  ];

  environment = {
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    systemPackages = with pkgs; [
      curl
      nano
    ];
  };

  programs = {
    firefox = {
      enable = false;
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
