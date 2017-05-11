#
# Cookbook Name:: patch_ubuntu
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
case node['platform_family']
when 'debian'
execute "patch in DEBIAN environment" do
	command "sudo apt-get install unattended-upgrades"
end
when 'rhel'
execute "patch in RHEL environment" do
	command "yum update --security #{node['patch_ubuntu']['security_upgrades']} -y"
end
end
