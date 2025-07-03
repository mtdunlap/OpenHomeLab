{
  pkgs,
  ...
}:

{
  programs = {
    librewolf = (import ./librewolf.nix) pkgs;
    git = import ./git.nix;
  };

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "25.05";
}
