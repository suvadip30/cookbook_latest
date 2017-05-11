#
# Cookbook Name:: drupal_core_update
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

script 'put in maintenance mode' do
	interpreter 'bash'
	code <<-EOH
	cd /var/www/html
	drush vset --exact maintenance_mode 1 drush cache-clear all
	EOH
	only_if "drush status"
end

script 'update drupal-core' do
        interpreter 'bash'
        code <<-EOH
        cd /var/www/html
	drush -y pm-update drupal
       	EOH
        only_if "drush status"
end

script 'put out of maintenance mode' do
        interpreter 'bash'
        code <<-EOH
        cd /var/www/html
	drush vset --exact maintenance_mode 0 drush cache-clear all
	EOH
	only_if "drush status"
end

remote_file '/tmp/chefdk_1.2.20-1_amd64.deb' do
        source 'https://packages.chef.io/files/stable/chefdk/1.2.20/ubuntu/14.04/chefdk_1.2.20-1_amd64.deb'
        action :create
end

dpkg_package "debian chef dk install" do
  source "/tmp/chefdk_1.2.20-1_amd64.deb"
  action :install
end

apt_package 'docker.io' do
        action :install
end

service 'docker' do
        action [:start, :enable]
end

chef_gem 'kitchen-docker' do
  compile_time true
  action :install
end

script 'generate cookbook drupal in tmp directory' do
  interpreter 'bash'
        code <<-EOH
        cd /tmp
        chef generate cookbook drupal
        EOH
end

template '/tmp/drupal/.kitchen.yml' do
        owner 'root'
        group 'root'
        mode '0644'
        source 'kitchen.erb'
end


script 'kitchen need to converge' do
        interpreter 'bash'
        code <<-EOH
        cd /tmp/drupal
        kitchen converge
        EOH
        only_if "kitchen version"
end

script 'kitchen need to verify' do
        interpreter 'bash'
        code <<-EOH
        cd /tmp/drupal
        kitchen verify
        EOH
        only_if "kitchen version"
end
