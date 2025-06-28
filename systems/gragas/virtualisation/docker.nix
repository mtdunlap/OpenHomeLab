{
  config,
  pkgs,
  ...
}:

{
  # To enable running docker as a non-root user (not the same as rootless) add your user to the 'docker' group.
  # To use 'docker-compose' be sure to add 'docker-compose' to the list of packages for the user.
  virtualisation = {
    docker = {
      enable = true;

      rootless = {
        enable = false;
      };
    };
  };
}
