#
# Cookbook Name:: git_drupal_prod
# Recipe:: default
#
# Copyright 2017, SNP Technologies Inc
#
# All rights reserved - Do Not Redistribute

script '********pull the latest update********' do
       interpreter 'bash'
        code <<-EOH
        cd #{node['git_drupal_prod']['web_directory']}/#{node['git_drupal_prod']['root_directory']}
        #{node['git_drupal_prod']['git_base_command']} #{node['git_drupal_prod']['git_pull_command']} #{node['git_drupal_prod']['git_origin_command']} #{node['git_drupal_prod']['git_switched_branch']}
        EOH
        only_if "#{node['git_drupal_prod']['git_base_command']} #{node['git_drupal_prod']['git_branch']} | grep -e #{node['git_drupal_prod']['git_master_branch']} | cut -d' ' -f 2"
        end

include_recipe 'drupal_db_prod::default'

script '*********Switch the branch from master********* ' do
       interpreter 'bash'
        code <<-EOH
        MONTH=$(#{node['git_drupal_prod']['date']} -d "$D" '+%b')
	cd #{node['git_drupal_prod']['web_directory']}/#{node['git_drupal_prod']['root_directory']}
       	#exists=`git show-ref refs/heads/$MONTH-maintenance-update`
	#if [ -n "$exists" ]; then
	#echo 'Skipped due to existing of $MONTH-maintenance-update branch'
	#else
        #{node['git_drupal_prod']['git_base_command']} #{node['git_drupal_prod']['git_checkout_command']}  "$MONTH-maintenance-update"
        #fi
        EOH
        end

include_recipe 'drupal_db_prod::update'
