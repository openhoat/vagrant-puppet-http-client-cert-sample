Vagrant::Config.run do |config|

	config.vm.box = "http-client-cert-sample"

	config.vm.box_url = "https://dl.dropboxusercontent.com/u/188949218/vagrant-boxes/centos64-x64-base.box"
#	config.vm.box_url = "~/.vagrant/centos64.box"

#	config.vm.boot_mode = :gui

  config.vm.host_name = "vagrant.centos64"

	config.vm.customize ["modifyvm", :id, "--boot1", "disk"]
	config.vm.customize ["modifyvm", :id, "--boot2", "none"]
	config.vm.customize ["modifyvm", :id, "--boot3", "none"]
	config.vm.customize ["modifyvm", :id, "--boot4", "none"]
	config.vm.customize ["modifyvm", :id, "--memory", 512]
	config.vm.customize ["modifyvm", :id, "--cpus", 1]
	config.vm.customize ["modifyvm", :id, "--vram", 16]

	config.vm.forward_port 80, 3000
	config.vm.forward_port 443, 3001

	config.vm.provision :shell, :path => "bin/install-puppet"
  config.vm.provision :puppet do |puppet|
		puppet.options = ["--hiera_config", "/vagrant/hiera.yaml"]
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "main.pp"
		puppet.module_path = "puppet/modules"
  end

end
