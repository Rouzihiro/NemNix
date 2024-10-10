{
  pkgs,
  hostname,
  ...
}: {
  boot = {
    #kernelPackages = pkgs.linuxPackages;
    #kernelPackages = pkgs.linuxPackages_latest;
    #kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelPackages =
      if hostname == "laptop"
      then pkgs.linuxPackages_zen
      else if hostname == "server"
      then pkgs.linuxPackages
      else pkgs.linuxPackages_zen;
    tmp.cleanOnBoot = true;

    loader = {
      timeout = 3;
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        consoleMode = "max";
        configurationLimit = 10;
      };
    };
  };
}
