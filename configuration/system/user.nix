{ ... }:

{
  users = {
    mutableUsers = false;
    users.brokenshine = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "adbuser"
        "uucp"
        "audio"
        "video"
        "kvm"
        "input"
        "seat"
      ];
      useDefaultShell = true;
      hashedPassword = "$y$j9T$RlITQjRdvQgkEU.lT41Q60$stBXd2yZX9egFSVViptJIbhiz2eWeM1yK/.tfOW5RN3";
    };
  };
}
