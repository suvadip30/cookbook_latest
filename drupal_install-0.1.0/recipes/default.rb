#
# Cookbook Name:: drupal_install
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

remote_file "/tmp/drupal-7.32.tar.gz" do
	source "http://ftp.drupal.org/files/projects/drupal-7.32.tar.gz"
	mode 0644
        action :create
end

execute "untar the drupal tar file" do
	command "tar xzvf /tmp/drupal*"
end

script 'run the script' do
	interpreter 'bash'
	code <<-EOH
	cd /tmp/drupal*
	sudo rsync -avz . /var/www/html
	EOH
end

directory '/var/www/html/sites/default/files' do
	recursive true
	action :create
end

execute 'copy the file' do
	command 'cp /var/www/html/sites/default/default.settings.php /var/www/html/sites/default/settings.php'
end

execute 'change the permission' do
        command 'chmod 664 /var/www/html/sites/default/settings.php'
end

execute 'change the ownership' do
        command 'sudo chown -R :www-data /var/www/html/*'
end
