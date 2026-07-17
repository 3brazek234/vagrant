# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant configuration for Arch Linux
Vagrant.configure("2") do |config|
  # Set the box to Arch Linux (using generic/arch for VirtualBox compatibility)
  config.vm.box = "generic/arch"

  # Configure the VM network as a Bridged Adapter (known as "public_network" in Vagrant)
  # We specify your active interface wlp1s0 first to avoid interactive prompts on boot.
  config.vm.network "public_network", bridge: [
    "wlp1s0",
    "enp3s0",
    "eth0"
  ]

  # Synced folder mapping host scripts to guest /opt/scripts
  config.vm.synced_folder "./scripts", "/opt/scripts", type: "virtualbox"

  # Provider configuration (interpreting "cbox" as "vbox" / VirtualBox)
  config.vm.provider "virtualbox" do |vb|
    # Allocate 1 CPU core
    vb.cpus = 1

    # Allocate 2GB of memory (2048 MB)
    vb.memory = "2048"
  end

  # Shell provisioning to update the system and install Node.js
  config.vm.provision "shell", inline: <<-SHELL
    echo "Updating system packages and installing Node.js..."
    pacman -Syu --noconfirm nodejs
    echo "Node.js installed successfully!"
  SHELL
end
