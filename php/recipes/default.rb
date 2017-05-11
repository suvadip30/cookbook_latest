#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

case node['platform_family']

when 'debian'

package 'multi php packages' do
	package_name ['php5', 'libapache2-mod-php5', 'php5-mcrypt']
	action :install
end

cookbook_file '/etc/apache2/mods-enabled/dir.conf' do
  source 'dir.conf'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

service 'apache2' do
        action [:restart, :enable]
end

cookbook_file '/var/www/html/info.php' do
  source 'info.php'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

when 'rhel'

package 'multi php package' do
	package_name ['php5', 'libapache2-mod-php5', 'php5-mcrypt']
	action :install
end

end
