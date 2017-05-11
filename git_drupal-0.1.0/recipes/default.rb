#
# Cookbook Name:: git_drupal
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute


script 'change git repo to dev from master' do
       interpreter 'bash'
        code <<-EOH
        cd #{node['git_drupal']['web_directory']}/#{node['git_drupal']['root_directory']}
        #{node['git_drupal']['git_base_command']} #{node['git_drupal']['git_checkout_command']} #{node['git_drupal']['git_switched_branch']}
        EOH
        only_if "#{node['git_drupal']['git_base_command']} #{node['git_drupal']['git_branch']} | grep -e #{node['git_drupal']['git_master_branch']} | cut -d' ' -f 2"
end

script 'create a new branch out of dev' do
       interpreter 'bash'
        code <<-EOH
	MONTH=$(#{node['git_drupal']['date']} -d "$D" '+%b')
	cd #{node['git_drupal']['web_directory']}/#{node['git_drupal']['root_directory']}
	exists=`git show-ref refs/heads/$MONTH-maintenance-update`
        if [ -n "$exists" ]; then
        echo 'Skipped due to existing of $MONTH-maintenance-update branch'
        else
        #{node['git_drupal']['git_base_command']} #{node['git_drupal']['git_checkout_command']} -b "$MONTH-maintenance-update"
        fi
        EOH
        #not_if "#{node['git_drupal']['git_base_command']} #{node['git_drupal']['git_branch']} | grep -e $MONTH-maintenance-update"
end

