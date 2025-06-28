{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./firewall.nix
    ./proxy.nix
  ];

  networking = {
    hostName = "gragas";

    networkmanager = {
      enable = true;
    };

    wireless = {
      # Enables wireless support via wpa_supplicant.
      enable = false;
    };
  };
}
