#
# Cookbook Name:: windows_user
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

user "clarion1" do
  password "Password@123"
end

user "clarion2" do
  password "Password@123"
end

user "snpadmin" do
  password "Password@123"
end

group "Administrators" do
  action :modify
  members "clarion1"
  append true
end

group "Administrators" do
  action :modify
  members "clarion2"
  append true
end

group "Administrators" do
  action :modify
  members "snpadmin"
  append true
end

