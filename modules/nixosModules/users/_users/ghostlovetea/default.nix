{ config, pkgs, lib, ... }:

lib.mkIf (builtins.elem "ghostlovetea" config.myConfig.activeUsers) {
    users.users.ghostlovetea = {
      isNormalUser = true;
      description = "ДАЛБОЁБ";
      hashedPassword = config.myConfig.rootPassword;
      createHome = true;
      extraGroups = [ "wheel" "networkmanager" ];

      packages = with pkgs; [
        git
        fastfetch

        vesktop
        librewolf
        microsoft-edge
        nftables
        throne
        vscode
      ];
    };
}