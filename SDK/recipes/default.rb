#
# Cookbook Name:: SDK
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

powershell_script 'install service fabric SDK' do
code <<-EOH
WebpiCmd.exe /Install /Products:MicrosoftAzure-ServiceFabric-VS2015 /AcceptEula
EOH
end
