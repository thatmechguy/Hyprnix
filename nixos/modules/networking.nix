{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.nameservers = ["1.1.1.1"];
  networking.networkmanager.dns = "none";
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 53317 ]; # LocalSend TCP
    allowedUDPPortRanges = [
      { from = 4000; to = 4007; } # LocalSend UDP
      { from = 53315; to = 53318; }
      { from = 8000; to = 8010; }
    ];
    trustedInterfaces = ["vibr0"];
  };
}
