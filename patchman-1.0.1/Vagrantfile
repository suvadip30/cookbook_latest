# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "centos-6.5" do |centos6|
    centos6.vm.box = "centos65"
    centos6.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5_chef-provisionerless.box"
    centos6.omnibus.chef_version = :latest
  end

  config.vm.define "centos-7.0" do |centos7|
    centos7.vm.box = "centos7"
    centos7.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-7.0_chef-provisionerless.box"
    centos7.omnibus.chef_version = :latest
  end

  config.vm.define "ubuntu-12.04" do |ubuntu12|
    ubuntu12.vm.box = "ubuntu-1204"
    ubuntu12.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-12.04_chef-provisionerless.box"
    ubuntu12.omnibus.chef_version = :latest
  end

  config.vm.define "ubuntu-14.04" do |ubuntu14|
    ubuntu14.vm.box = "ubuntu-1404"
    ubuntu14.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"
    ubuntu14.omnibus.chef_version = :latest
  end

  config.vm.boot_timeout = 120
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      "recipe[patchman::default]"
    ]
  end
end
