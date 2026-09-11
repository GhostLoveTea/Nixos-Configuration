{ config, pkgs, lib, ... }:

lib.mkIf (builtins.elem "ghostlovetea" config.myConfig.activeUsers) {
    users.users.ghostlovetea = {
      isNormalUser = true;
      description = "ДАЛБОЁБ";
      hashedPassword = config.myConfig.rootPassword;
      createHome = true;
      extraGroups = [ "wheel" "networkmanager" ];

      packages = with pkgs; [
        foot
        git
        fastfetch
        nftables

        rofi

        vesktop
        librewolf
        microsoft-edge
        throne
        vscode
      ];
    };
}