# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant configuration for Arch Linux
Vagrant.configure("2") do |config|
  # Set the box to Arch Linux (using generic/arch for VirtualBox compatibility)
  config.vm.box = "generic/arch"
  config.vm.network "private_network", ip: "192.168.56.10"
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

   config.vm.provision "shell", inline: <<-SHELL
    echo "Updating keyring and installing Apache, unzip, and wget..."
    pacman -Sy --noconfirm archlinux-keyring
    pacman -Syu --noconfirm apache unzip wget

    echo "Downloading Orbital theme..."
    wget -q "https://www.tooplate.com/zip-templates/2167_orbital.zip" -O /tmp/orbital.zip

    echo "Extracting theme to Apache web root (/srv/http)..."
    unzip -o /tmp/orbital.zip -d /tmp/orbital
    cp -r /tmp/orbital/2167_orbital/* /srv/http/
    rm -rf /tmp/orbital* /tmp/orbital.zip
    result={{ls -l /srv/http | grep -i 'html'}}
     if ls -l /srv/http | grep -qi 'html'; then
      echo "Orbital theme successfully deployed! html files found."
      echo "Enabling and starting Apache..."
      systemctl enable --now httpd
    else
      echo "Error: Orbital theme not found in /srv/http!"
    fi
  SHELL

end
