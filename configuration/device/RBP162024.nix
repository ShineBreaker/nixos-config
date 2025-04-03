{ config, lib, pkgs, ... }:
{
  //Graphic
  
  boot.extraModprobeConfig = ''
      options snd-intel-dspcfg dsp_driver=1
      options kvm_intel nested=1
      options kvm_intel emulate_invalid_guest_state=0
      options kvm ignore_msrs=1 report_ignored_msrs=0
    '';
  
  hardware.cpu.intel.updateMicrocode = true;
  hardware.intel-gpu-tools.enable = true;
  hardware.graphics = {
      extraPackages = with pkgs; [
      intel-media-driver 
      intel-vaapi-driver
      vpl-gpu-rt
      intel-media-sdk
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [ intel-vaapi-driver ];
    };
    
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
    ];
  };
  
}
