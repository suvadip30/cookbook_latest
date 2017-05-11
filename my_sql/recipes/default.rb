#
# Cookbook Name:: my_sql
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

case node['platform_family']

when 'debian'

['mysql-server','php5-mysql'].each do |p|
        package p do
        action :install
end
end

execute 'create database directory structure' do
	command 'sudo mysql_install_db'
end

my_sql_password = data_bag_item('mysql', 'my_sql_password')
my_sql_user = data_bag_item('mysql', 'my_sql_user')

template "/tmp/mysql_secure.sh" do
	source "mysql_secure.erb"
	variables(
		:my_sql_password => my_sql_password['my_sql_password'],
		:my_sql_user => my_sql_user['my_sql_user']
)
end

execute "execute shell script" do
	command 'sh /tmp/mysql_secure.sh'
end

when 'rhel'

package 'multi my-sql package' do
        package_name ['mysql-server','php5-mysql']
        action :install
end

end
