{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "awang";
  home.homeDirectory = "/home/awang";

  home.packages = [
    # Need to test it!
    # pkgs.clash
    pkgs.htop
    # 暂时移除，尚不知道如何设置：allowUnfree = true
    # pkgs.microsoft-edge
    # 在完全切换到hm之前，还是需要ydm
    pkgs.yadm
  ];


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Disable for now, as still cannot figure now how to make it work!
  # i18n.inputMethod.enabled = "fcitx5";
  # i18n.inputMethod.fcitx.engines = with pkgs.fcitx-engines; [ libpinyin cloudpinyin ];
  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
    # Use direnv to manage development environments
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      # optional for nix flakes support in home-manager 21.11, not required in home-manager unstable or 22.05
      # nix-direnv.enableFlakes = true;
    };

    fzf = {
      enable = true;
    };

    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
        prompt = "enabled";
      };
    };
 
    git = {
      enable = true;
      userName = "Alexander Wang";
      userEmail = "alexander@tiwater.com";
    };

    newsboat = {
      enable = true;
      urls = [{
        url = "https://rsshub.app/cls/telegraph";
        tags = ["财经"];
      }];
    };
 };
}
