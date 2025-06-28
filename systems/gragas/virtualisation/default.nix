{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./docker.nix
    ./podman.nix
  ];

  virtualisation = {
    containers = {
      # Enable common container config files in /etc/containers
      enable = true;
    };
  };
}
