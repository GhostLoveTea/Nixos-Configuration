{ config, pkgs, self, ... }: 

{
    modules.system.network = {
        enable = true;
        hostname = "desktop";
    };
}