#
# Cookbook Name:: azure_powershell
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

directory 'C:\temp' do
#  rights :full_control
action :create
end
#
remote_file 'c:\temp\azure-powershell.3.3.0.msi' do
source 'http://40.76.28.79/packages/azure-powershell.3.3.0.msi'
action :create
end

windows_package 'azure powershell module' do
 source 'c:\temp\azure-powershell.3.3.0.msi'
  installer_type :custom
  options '/Q'
  action :install
end

powershell_script 'import azure module' do
code <<-EOH
Install-Module AzureRM
EOH
end

powershell_script 'import azure module' do
code <<-EOH
Install-Module Azure
EOH
end
