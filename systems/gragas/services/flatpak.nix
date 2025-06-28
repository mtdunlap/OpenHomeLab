{
  config,
  pkgs,
  ...
}:

{
  services = {
    flatpak = {
      enable = true;
    };
  };

  systemd = {
    services = {
      # Ensure that flathub is configured as a repository for flatpak.
      flatpak-repo = {
        wantedBy = [ "multi-user.target" ];
        path = with pkgs; [ flatpak ];
        script = ''
          flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
        '';
      };
    };
  };
}
