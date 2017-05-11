#
# Cookbook Name:: merge_dev_stage
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
cookbook_file '/tmp/bitbucketget_des.txt' do
	source 'bitbucketget_des.txt'
	owner 'root'
	group 'root'
	action :create
end

cookbook_file '/tmp/bitbucket.sh' do
  	source 'bitbucket.sh'
  	owner 'root'
  	group 'root'
  	mode '0755'
  	action :create
end

execute 'execute bitbucket shell script' do
	command 'sh /tmp/bitbucket.sh'
end

execute 'execute bitbucket shell script' do
        command 'sh /tmp/bitbucket_des.sh'
end

['/tmp/bitbucketget_des.txt','/tmp/bitbucket.sh','/tmp/bitbucket.sh','bitbucket_des.sh'].each do |f|
	file f do
	action :delete
end
end
