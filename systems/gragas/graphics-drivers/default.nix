{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./intel.nix
    ./nvidia.nix
  ];
}
