#!/run/current-system/sw/bin/bash
# some kind of selection interface
device = ""
select x in $(ls /dev/disk/by-id); do
    device="$x"
    break
done

nixos-generate-config --no-filesystems --dir .
rm configuration.nix
mv hardware-configuration.nix nixos/
git add *
sed -i "s/<id-here>/$device/g" nixos/disko.nix

sudo nix --extra-experimental-features "nix-command flakes" run 'github:nix-community/disko/latest#disko-install' -- --mode destroy,format,mount --flake .#nixos
nix-collect-garbage
sudo nixos-install --flake .#nixos
