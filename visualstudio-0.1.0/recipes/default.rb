#
# Cookbook Name:: visualstudio
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

directory 'C:\temp' do
#rights :full_control
action :create
end
#
remote_file 'c:\temp\en_visual_studio_enterprise_2015_with_update_3_x86_x64_web_installer_8922986.exe' do
source 'http://40.76.28.79/packages/en_visual_studio_enterprise_2015_with_update_3_x86_x64_web_installer_8922986.exe'
action :create
end
#
windows_package 'visual studio' do
source 'c:\temp\en_visual_studio_enterprise_2015_with_update_3_x86_x64_web_installer_8922986.exe'
installer_type :custom
options '/Q'
timeout 1047
action :install
#not_if 'C:\\windows\\system32\\WindowsPowerShell\\v1.0\\powershell.exe -NoLogo -NonInteractive -NoProfile -ExecutionPolicy RemoteSigned Get-Service -Name NXlog' 
end
