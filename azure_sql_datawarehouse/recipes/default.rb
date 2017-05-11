#
# Cookbook Name:: azure_sql_datawarehouse
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute


directory "c:\\tmp" do
recursive true
action :create
end

template 'c:\tmp\resume_template.ps1' do
source 'resume_template.erb'
variables({
	:azure_account_name => node['azure_sql_datawarehouse']['azure_account_name'],
	:azure_password => node['azure_sql_datawarehouse']['azure_password'],
	:tenant_id =>  node['azure_sql_datawarehouse']['tenant_id']
})
end

powershell_script "start the powershell pause_template.ps1" do
 code 'c:\tmp\resume_template.ps1'
end
