#
# Cookbook Name:: WEBPI
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
directory 'C:\temp' do
action :create
end

remote_file 'c:\temp\WebPlatformInstaller_amd64_en-US.msi' do
source 'http://40.76.28.79/packages/WebPlatformInstaller_amd64_en-US.msi'
action :create
end

windows_package 'WebPlatformInstaller' do
source 'c:\temp\WebPlatformInstaller_amd64_en-US.msi'
installer_type :custom
options '/Q'
action :install
end
