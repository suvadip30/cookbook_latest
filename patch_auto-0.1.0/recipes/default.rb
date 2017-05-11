#
# Cookbook Name:: patch_auto
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

directory '/opt/patch' do
	owner 'root'
	group 'root'
	mode '0750'
	action :create
end

my_server_password = data_bag_item('server', 'my_server_password')

execute 'run git command' do
	command "cd /opt/patch && git clone https://suvadip30:'SUVAman$9614'@bitbucket.org/suvadip30/test-patch.git"
	not_if {File.exist?('/opt/patch/test-patch')}
end

script "check git branch" do
	interpreter 'bash'
        code <<-EOH
		cd /opt/patch/test-patch
		BRANCH=`git branch | grep #{node['patch_auto']['branch']} | tail -n1 | sed 's/* //g' | wc -l`
		if [ "$BRANCH" -eq 1 ]; then
        	echo "matched"
			git checkout #{node['patch_auto']['branch']}
		else
        	echo "unmatched"
			git checkout -b #{node['patch_auto']['branch']}
		fi
	EOH
end

template "/tmp/ssh_script.sh" do
	source "ssh_script.erb"
	variables(
		:server_password => my_server_password['my_server_password'],
		:server1 => node['patch_auto']['server1'],
		:server2 => node['patch_auto']['server2'],
		:server3 => node['patch_auto']['server3']
)
end

execute 'execute ssh script' do
	command 'sh /tmp/ssh_script.sh'
end

script 'commit the change' do
        interpreter 'bash'
        code <<-EOH
	cd /opt/patch/test-patch
	GIT=`git diff --name-status | wc -l`
	if [ "$GIT" -eq 1 ] || [ "$GIT" -eq 2 ]; then
        echo "there are differences, so do the commit and push"
	git pull origin dev
        git add .
        git commit -m "#{node['patch_auto']['commit']}"
        git push origin #{node['patch_auto']['branch']}
        else
        	echo "there are no differences, so don't do anything"
        fi
        EOH
end
