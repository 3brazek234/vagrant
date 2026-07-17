# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant configuration for Arch Linux
Vagrant.configure("2") do |config|
  # Set the box to Arch Linux (using generic/arch for VirtualBox compatibility)
  config.vm.box = "generic/arch"

  # Configure the VM network as a Bridged Adapter (known as "public_network" in Vagrant)
  # This allows the VM to connect directly to your physical local area network (LAN).
  config.vm.network "public_network"

  # Provider configuration (interpreting "cbox" as "vbox" / VirtualBox)
  config.vm.provider "virtualbox" do |vb|
    # Allocate 1 CPU core
    vb.cpus = 1

    # Allocate 2GB of memory (2048 MB)
    vb.memory = "2048"
  end
end
