{
  preservation = {
        enable = true;

        preserveAt."/persistent" = {
            files = [
                { file = "/etc/machine-id"; inInitrd = true; }
            ];
            
            directories = [
                "/var/lib/timers"
                "/var/lib/nixos"
                "/var/log"
                "/var/lib/bluetooth"
                "/etc/NetworkManager/system-connections"
                "/tmp"
            ];

            users.yolsh = {
                files = [];
                directories = [
                    ".nixconf"
                    "Documents"
                ];
            };
        };
    };
}
