#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

case node['platform-family']

when 'debian' 

package 'multi my-sql package' do
	package_name ['mysql-server', 'php5-mysql']
	action :install
end

when 'rhel'

package 'multi my-sql package' do
	package_name ['mysql-server', 'php5-mysql']
	action :install
end

end
