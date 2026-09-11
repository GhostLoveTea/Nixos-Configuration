{ config, pkgs, inputs, self, ... }:

{
    imports = [ inputs.disko.nixosModules.disko ];
    disko.devices.nodev = {
        "/" = {
            fsType = "tmpfs";
            mountOptions = [
                "size=512M"
                "mode=755"
            ];
        };
    };

    disko.devices.disk.main = {
    device = config.myConfig.targetDisk;
    type = "disk";

    content.type = "gpt";

    content.partitions.boot = {
      name = "boot";
      size = "1M";
      type = "EF02";
    };

    content.partitions.esp = {
      name = "ESP";
      size = "256M";
      type = "EF00";

      content = {
        type = "filesystem";
        format = "vfat";
        mountpoint = "/boot";
      };
    };

    content.partitions.swap = {
      size = "8G";

      content = {
        type = "swap";
        resumeDevice = true;
      };
    };

    content.partitions.root = {
      name = "root";
      size = "100%";

      content = {
        type = "btrfs";
        extraArgs = ["-f"];

        subvolumes = {
          "/persistent" = {
            mountOptions = ["subvol=persistent" "noatime"];
            mountpoint = "/persistent";
          };

          "/nix" = {
            mountOptions = ["subvol=nix" "noatime"];
            mountpoint = "/nix";
          };
        };
      };
    };
  };
}