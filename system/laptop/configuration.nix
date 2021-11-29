#!/run/current-system/sw/bin/nix
{ config, pkgs, lib, ... }: {

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/audio.nix
      ./modules/boot.nix
      ./modules/fonts.nix
      ./modules/hardware.nix
      ./modules/network.nix
      ./modules/packages.nix
      ./modules/powerManagement.nix
      ./modules/security.nix
      ./modules/ssh.nix
      ./modules/tty-prompt.nix
      ./modules/users.nix
      ./modules/x11.nix
    ];

    # Set your time zone.
  time.timeZone = "Canada/Eastern";

    # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  documentation.nixos.enable = true;

#  services.throttled.enable = lib.mkDefault true;

  environment.etc.current-nixos-config.source = ./.;

  nix = {
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 3d";
    };
  };

  system.stateVersion = "21.05";

}
