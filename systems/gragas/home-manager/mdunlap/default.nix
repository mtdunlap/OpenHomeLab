{
  pkgs,
  ...
}:

{
  programs = {
    librewolf = (import ./librewolf.nix) pkgs;
  };

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "25.05";
}
