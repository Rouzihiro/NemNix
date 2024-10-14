{
  config,
  lib,
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "usbhid"
        "uas"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [ ];
    };

    kernelModules = [
      "kvm-amd"
      "zenpower"
    ];
    kernelParams = [ "amd_pstate=active" ];
    extraModulePackages = [ config.boot.kernelPackages.zenpower ];
    blacklistedKernelModules = [ "k10temp" ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/33e774b6-8836-46b6-a366-b6e0d30cfd60";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/7E61-6574";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/9e0eb895-dc87-467f-aa3e-1689d5281c5d"; }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp2s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp3s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
