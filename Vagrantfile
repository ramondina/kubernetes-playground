# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure("2") do |config|

  config.vm.provision "shell", path: "bootstrap.sh"

  # k8s control plane
  config.vm.define "control-plane" do |set|

    set.vm.box              = "almalinux/8"
    set.vm.box_version      = "8.5.20220316"
    set.vm.box_check_update = false
    set.vm.hostname         = "control-plane.dev.io"
  
    set.vm.network "private_network", ip: "172.16.0.100"
  
    set.vm.provider :virtualbox do |set|
      set.name   = "control-plane"
      set.memory = 2048
      set.cpus   = 2
    end

  end

  # k8s nodes
  NodeCount = 2

  (1..NodeCount).each do |i|
  
    config.vm.define "node#{i}" do |set|

      set.vm.box              = "almalinux/8"
      set.vm.box_version      = "8.5.20220316"
      set.vm.box_check_update = false
      set.vm.hostname         = "node#{i}.dev.io"

      set.vm.network "private_network", ip: "172.16.0.10#{i}"

      set.vm.provider :virtualbox do |set|
        set.name   = "node#{i}"
        set.memory = 1024
        set.cpus   = 1
      end

    end
    
  end

end
