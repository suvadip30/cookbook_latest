#
# Cookbook Name:: 175WAS
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

directory 'C:\temp' do
#  rights :full_control
  action :create
end

remote_file 'c:\temp\175WindowsAgentSetup.exe' do
  source 'http://40.76.28.79/packages/175WindowsAgentSetup.exe'
  action :create
end

windows_package '175 windows agent setup' do
 source 'c:\temp\175WindowsAgentSetup.exe'
  installer_type :custom
  options '/Q'
  action :install
end
