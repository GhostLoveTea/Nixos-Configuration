{ config, pkgs, self, ... }: {
    boot.kernelPackages = pkgs.linuxPackages_latest;

    modules.system.boot = {
        enable = true;
        efiSupport = false;
        efiInstallAsRemovable = false;
    };
}