#
# Cookbook Name:: azure_rm_vm_image
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
machine 'vmtestimage' do
  machine_options :bootstrap_options => {
  :cloud_service_name => 'mycloudservice',
  :storage_account_name => 'suvadipresourceswindisk',
  :vm_size => 'Small',
  :location => 'East Us',
  :tcp_endpoints => '3389:3389'
  },
  :password => 'Password@123',
  :image_id => 'capturedvhdimage-20150223-402981'
end
