#
# Cookbook Name:: lamp-stack
# Recipe:: database
# Author: Sonu Kr. Meena
# Copyright (c) 2015 The Authors, All Rights Reserved.

mysql2_chef_gem 'default' do
  action :install
end

# Install mysql database and enable service
mysql_service 'default' do
  port '3306'
  version node[:mysql][:version]
  initial_root_password node['mysql']['root_password']
  data_dir node[:mysql][:data_dir]

  action [:create, :start]

end

mysql_connection_info = {
  :host     => '127.0.0.1',
  :username => 'root',
  :password => node['mysql']['root_password']
}

# Create a mysql database
node[:mysql][:databases].each do | db|
	mysql_database  db do
	  connection(
	    :host     => '127.0.0.1',
	    :username => 'root',
	    :password => node['mysql']['root_password']
	  )
	  action :create
	end

	# grant select,update,insert privileges to all tables in foo db from all hosts, requiring connections over SSL
	mysql_database_user node[:mysql][:db_user] do
	  connection mysql_connection_info
	  password node[:mysql][:db_password]
	  database_name db
	  host '127.0.0.1'
	  privileges    [:all]
	  action :grant
	end	
end