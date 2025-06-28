{
  config,
  pkgs,
  ...
}:

{
  # To enable running podman as a non-root user add your user to the 'podman' group.
  # To use 'podman-compose' be sure to add 'podman-compose' to the list of packages for the user.
  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = false;

      defaultNetwork = {
        settings = {
          # Required for containers under podman-compose to be able to talk to each other.
          dns_enabled = true;
        };
      };
    };
  };
}
