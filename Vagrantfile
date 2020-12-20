# -*- mode: ruby -*-
# vi: set ft=ruby :

def install_plugin(plugin)
  system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end
install_plugin('vagrant-vbguest')

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "8192"
    vb.cpus = 4
    vb.customize [
      "modifyvm", :id,
      "--vram", "256",
      "--clipboard", "bidirectional",
      "--accelerate3d", "on",
      "--hwvirtex", "on",
      "--nestedpaging", "on",
      "--largepages", "on",
      "--ioapic", "on",
      "--pae", "on",
      "--paravirtprovider", "kvm",
      "--cableconnected1", "on",
    ]
  end

  config.ssh.forward_agent = true
  # sync project files
  config.vm.synced_folder "./", "/vagrant", type: "rsync"
end
