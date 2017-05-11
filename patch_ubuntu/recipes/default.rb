#
# Cookbook Name:: patch_ubuntu
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
execute "patch" do
command "apt-get install --only-upgrade #{node['patch_ubuntu']['security_upgrades']} -y"
end
