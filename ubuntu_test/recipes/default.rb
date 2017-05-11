#
# Cookbook Name:: ubuntu_test
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
execute 'dir' do
command "mkdir #{node['ubuntu_test']['dir']}#{node['ubuntu_test']['subdir']}"
not_if { File.exist?("#{node['ubuntu_test']['dir']}#{node['ubuntu_test']['subdir']}")}
end
