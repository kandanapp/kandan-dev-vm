# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "kandan-centos-box"
  config.vm.box_url = "https://s3.amazonaws.com/vagrant-dev-images/kandan/virtualbox_CentOS-6.5-x86_64-minimal.box"
  config.vm.hostname = 'kandan.dev'
  config.vm.network "private_network", ip: "10.15.15.10"

 # first, get puppet on there
  config.vm.provision :shell, :path => "bootstrap.sh"

  # then hand over to puppet to do the rest
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file = 'base.pp'
    puppet.module_path = 'puppet/modules'
  end

end
