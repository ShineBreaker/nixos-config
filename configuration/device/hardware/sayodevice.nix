{
  ...
}:

{
  services.udev.extraRules = ''
    #BlackC Sayobot.cn SayoDevice *std-F*
    KERNEL=="hidraw*" \
    , ATTRS{idVendor}=="8089" \
    , MODE="0666"
  '';
}
