#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

package 'apache2' do
	package_name 'httpd'
end

service 'apache2' do
	service_name 'httpd'
	action [:enable, :start]
end

include_recipe 'apache::website' 
