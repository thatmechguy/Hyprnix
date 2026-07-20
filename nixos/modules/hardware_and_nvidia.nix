{ config, pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-x86_64-v3;

  # =========================================================================
 # ===                          HARDWARE & POWER                         ===
 # =========================================================================
 hardware.bluetooth.enable = true;
 hardware.graphics = {
   enable = true;
   enable32Bit = true;
 };

 services.power-profiles-daemon.enable = true;
 services.upower.enable = true;

 # =========================================================================
 # ===                       HARDWARE: NVIDIA PRIME                      ===
 # =========================================================================
 hardware.nvidia = {
   modesetting.enable = true;
   powerManagement.enable = true;
   open = true;
   nvidiaSettings = true;
   package = config.boot.kernelPackages.nvidiaPackages.latest;
   prime = {
     offload = {
       enable = true;
       enableOffloadCmd = true;
     };
     intelBusId = "PCI:0:2:0";
     nvidiaBusId = "PCI:1:0:0";
   };
 };
}
