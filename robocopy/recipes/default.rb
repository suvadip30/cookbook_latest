#
# Cookbook Name:: robocopy
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

directory node['robocopy']['tmp'] do
recursive true
action :create
end

directory node['robocopy']['output_file'] do
recursive true
action :create
end

remote_file "#{node['robocopy']['output_file']}\\#{node['robocopy']['csv_path']}" do
source "#{node['robocopy']['webserver']}/#{node['robocopy']['url']}/#{node['robocopy']['csv_path']}"
action :create
end

template "#{node['robocopy']['output_file']}\\#{node['robocopy']['powershell_file']}" do
source "robocopy.erb"
variables({
	:csv_path => node['robocopy']['csv_path'],
	:string_source => node['robocopy']['string_source'],
	:string_destination =>node['robocopy']['string_destination'],
	:copy_sub_dir => node['robocopy']['copy_sub_dir'],
	:file_declaration =>node['robocopy']['file_declaration'],
	:no_of_retries =>node['robocopy']['no_of_retries'],
	:wait_time =>node['robocopy']['wait_time'],
	:verbose =>node['robocopy']['verbose'],
	:include_files =>node['robocopy']['include_files'],
	:purge =>node['robocopy']['purge'],
	:copy_file =>node['robocopy']['copy_file'],
	:output_file =>node['robocopy']['output_file'],
	:output_file_final =>node['robocopy']['output_file_final'],
	:log =>node['robocopy']['log'],
	:output_log =>node['robocopy']['output_log'],
	:tmp =>node['robocopy']['tmp']
})
end

execute 'powershell script' do
command "powershell.exe #{node['robocopy']['output_file']}\\#{node['robocopy']['powershell_file']}"
action :run
end

execute 'final powershell script' do
command "powershell.exe -noexit #{node['robocopy']['output_file']}\\#{node['robocopy']['output_file_final']}"
action :run
end

directory node['robocopy']['output_file'] do
recursive true
action :delete
end
