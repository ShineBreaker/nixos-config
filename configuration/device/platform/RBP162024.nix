{
  pkgs,
  ...
}:
{
  # Graphic Card
  boot.extraModprobeConfig = ''
    options snd-intel-dspcfg dsp_driver=1
    options kvm_intel nested=1
    options kvm_intel emulate_invalid_guest_state=0
    options kvm ignore_msrs=1 report_ignored_msrs=0
  '';

  hardware.cpu.intel.updateMicrocode = true;
  hardware.intel-gpu-tools.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    bluez

    sof-firmware
  ];

  systemd.user.services.mpris-proxy = {
    description = "Mpris proxy";
    after = [
      "network.target"
      "sound.target"
    ];
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-compute-runtime
      intel-media-driver
      intel-vaapi-driver
      vpl-gpu-rt
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [ intel-vaapi-driver ];
  };

  boot.kernelParams = [
    "acpi_backlight=native"
    "intel_iommu=on"
  ];
}
