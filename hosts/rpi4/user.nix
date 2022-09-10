
{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ../../modules/home/default.nix 
    (inputs.impermanence + "/home-manager.nix")
  ];

  modules = {
    packages.enable = false;
    impermanence.enable = false;

    cli = {
      git.enable = true;
      neovim.enable = true;
      tmux.enable = false;
      xdg.enable = false;
      xresources = null;
      zsh.enable = true;
    };

    programs = {
     lf.enable = true;
     qutebrowser.enable = true;
    };
  };

  home.persistence = {
    "/nix/persist/home/binette" = {
      removePrefixDirectory = false;
      allowOther = true;
      directories = [
        ".zplug"
        ".local/share/xorg"
        ".ssh"
        ".gnupg"
      ];
      files = [
        ".local/share/history"
      ];
    };
  };

}
