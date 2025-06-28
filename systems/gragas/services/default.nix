{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./audio.nix
    ./desktop-environment.nix
    ./flatpak.nix
  ];

  services = {
    openssh = {
      # Enable the OpenSSH daemon.
      enable = false;
    };

    printing = {
      # Enable CUPS to print documents.
      enable = true;
    };
  };
}
