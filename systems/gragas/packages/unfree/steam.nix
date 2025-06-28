{
  config,
  pkgs,
  ...
}:

{
  # Steam is unfree software and will require adding
  #  "steam"
  #  "steam-unwrapped"
  # to
  #   nixpkgs/unfree-packages-predicate.nix
  programs = {
    steam = {
      enable = true;

      remotePlay = {
        # Open ports in the firewall for Steam Remote Play
        openFirewall = false;
      };

      dedicatedServer = {
        # Open ports in the firewall for Source Dedicated Server
        openFirewall = false;
      };
    };
  };
}
