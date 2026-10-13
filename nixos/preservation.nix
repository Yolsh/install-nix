{
  environment.persistence."/persistent" = {
        enable = true;
        hideMounts = true;

        files = [
            "/etc/machine-id"
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
}
