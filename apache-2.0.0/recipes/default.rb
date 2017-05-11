#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

#check the patform
case node['platform_family']

#execute for Debian
when 'debian'
	
#update the packages
execute 'apt-get -y update' do
#	not_if {File.exists?("#{node['apache_pkg']['var']}/#{node['apache_pkg']['tmp']}/#{node['apache_pkg']['apt_update']}")}
end

#install apache package for debian family
package 'apache2' do
	action :install
end

#enable and start the apache service in debian family
service 'apache2' do
	action [:start, :enable]
end

#execute for rhel
when 'rhel'

#update the packages
execute 'yum -y update' do
end

#install apache package for rhel family
package 'httpd' do
	action :install
end

#enable and start the apache service in rhel family
service 'httpd' do
	action [:enable, :start]
end
end
