#
# Cookbook Name:: lamp-stack
# Recipe:: default
# Author: Sonu Kr. Meena
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt::default'
include_recipe 'build-essential::default'
# ntp should be added as well

%w(curl vim htop).each do |pkg|
	package pkg
end
