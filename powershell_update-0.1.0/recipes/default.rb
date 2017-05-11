#
# Cookbook Name:: powershell_update
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
directory 'C:\temp' do
action :create
end

remote_file 'c:\temp\Win8.1AndW2K12R2-KB3134758-x64.msu' do
source 'http://40.76.28.79/packages/Win8.1AndW2K12R2-KB3134758-x64.msu'
action :create
end

windows_package 'azure powershell update' do
source 'c:\temp\Win8.1AndW2K12R2-KB3134758-x64.msu'
installer_type :custom
options '/S'
action :install
end
