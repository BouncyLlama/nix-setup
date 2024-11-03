{ config, pkgs, ... }:

{

virtualisation.libvirtd.enable = true;
programs.virt-manager.enable = true;

#You will get a warning when you open it for the first time:

#Could not detect a default hypervisor. Make sure the appropriate QEMU/KVM virtualization packages are installed to manage virtualization on this host.

#A virtualization connection can be manually added via File->Add Connection

#To resolve:

#File (in the menu bar) -> Add connection

#HyperVisor = QEMU/KVM
#Autoconnect = checkmark

#Connect

# To autostart network run:
# virsh net-autostart default


# Virt-manager GUEST:
#{
#  services.qemuGuest.enable = true;
#  services.spice-vdagentd.enable = true;  # enable copy and paste between host and guest
#}

}
