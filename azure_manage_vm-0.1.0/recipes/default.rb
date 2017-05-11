#
# Cookbook Name:: azure_manage_vm
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

directory "c:\\tmp" do
recursive true
action :create
end

template 'c:\tmp\start_manage_template.ps1' do
source 'start_manage_template.erb'
variables({
        :azure_account_name => node['azure_manage_vm']['azure_account_name'],
        :azure_password => node['azure_manage_vm']['azure_password'],
        :tenant_id =>  node['azure_manage_vm']['tenant_id'],
	:resource_group_name => node['azure_manage_vm']['resource_group_name'],
	:name => node['azure_manage_vm']['name'],
	:error_action => node['azure_manage_vm']['error_action'],
	:warning_action => node['azure_manage_vm']['warning_action'],
	:status_code_start => node['azure_manage_vm']['status_code_start'],
	:status_start => node['azure_manage_vm']['status_start'],
	:manage_vm_start =>node['azure_manage_vm']['manage_vm_start'],
	:status_code_stop => node['azure_manage_vm']['status_code_stop'],
        :status_stop => node['azure_manage_vm']['status_stop'],
        :manage_vm_stop =>node['azure_manage_vm']['manage_vm_stop']
})
end

powershell_script "start the powershell start_manage_template.ps1" do
 code 'c:\tmp\start_manage_template.ps1'
end

directory "c:\\tmp" do
recursive true
action :delete
end

