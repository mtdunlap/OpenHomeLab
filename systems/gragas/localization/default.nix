{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./internationalization.nix
  ];

  time = {
    timeZone = "America/New_York";
  };
}
