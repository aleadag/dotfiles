{
  programs.irssi = {
    enable = true;
    networks = {
      freenode = {
        nick = "awang";
        server = {
          address = "chat.freenode.net";
          port = 6697;
          autoConnect = true;
        };
        channels = { nixos.autoJoin = true; };
      };
    };
  };
}
