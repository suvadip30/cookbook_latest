#
# Cookbook Name:: webserver
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

powershell_script 'Install IIS' do
    action :run
    code 'add-windowsfeature Web-Server'
end

service 'w3svc' do
    action [ :enable, :start ]
end

template 'c:\inetpub\wwwroot\Default.htm' do
    source 'Default.htm.erb'
    rights :read, 'Everyone'
end
