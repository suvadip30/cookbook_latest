#
# Cookbook Name:: drupal_db
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute


script 'generate cookbook drupal in tmp directory' do
  interpreter 'bash'
        code <<-EOH
        DAY=$(#{node['drupla_db']['date']} -d "$D" '+%d')
	MONTH=$(#{node['drupla_db']['date']} -d "$D" '+%b')
	MONTH_dig=$(#{node['drupla_db']['date']} -d "$D" '+%m')
	YEAR=$(#{node['drupla_db']['date']} -d "$D" '+%Y')

	DATE_V=$DAY-$MONTH_dig-$YEAR
	echo "Month: $MONTH"
	echo "Date: $DAY-$MONTH_dig-$YEAR"

	#{node['drupal_db']['drush_command']} #{node['drupal_db']['sql-dump']} --result-file > #{node['drupal_db']['temporary_directory']}/db_snw_stage_$MONTH-$DATE_V.sql

        EOH
end

script 'enable google analytics advagg' do
        interpreter 'bash'
        code <<-EOH
        #{node['drupal_db']['change_directory']} #{node['drupal_db']['root_directory']}
        #{node['drupal_db']['drush_command']} #{node['drupal_db']['enable_drush_command']} #{node['drupal_db']['googleanalytics']} #{node['drupal_db']['advagg']} -y
        EOH
        only_if "#{node['drupal_db']['drush_command']} #{node['drupal_db']['drush_status_command']}"
end

script 'disable proxy stage file' do
        interpreter 'bash'
        code <<-EOH
        #{node['drupal_db']['change_directory']} #{node['drupal_db']['root_directory']}
        #{node['drupal_db']['drush_command']} #{node['drupal_db']['disable_drush_command']} #{node['drupal_db']['devel']} #{node['drupal_db']['dblog']} #{node['drupal_db']['stage_file_proxy']} -y
        EOH
        only_if "#{node['drupal_db']['drush_command']} #{node['drupal_db']['drush_status_command']}"
end


script 'update drupal-core' do
        interpreter 'bash'
        code <<-EOH
        #{node['drupal_db']['change_directory']} #{node['drupal_db']['root_directory']}
        #{node['drupal_db']['drush_command']} -y #{node['drupal_db']['core_module_update']} drupal
        EOH
        only_if "#{node['drupal_db']['drush_command']} #{node['drupal_db']['drush_status_command']}"
end

script 'disable google analytics advagg' do
        interpreter 'bash'
        code <<-EOH
        #{node['drupal_db']['change_directory']} #{node['drupal_db']['root_directory']}
        #{node['drupal_db']['drush_command']} #{node['drupal_db']['disable_drush_command']} #{node['drupal_db']['googleanalytics']} #{node['drupal_db']['advagg']} -y
        EOH
        only_if "#{node['drupal_db']['drush_command']} #{node['drupal_db']['drush_status_command']}"
end

script 'enable proxy stage file' do
        interpreter 'bash'
        code <<-EOH
        #{node['drupal_db']['change_directory']} #{node['drupal_db']['root_directory']}
        #{node['drupal_db']['drush_command']} #{node['drupal_db']['enable_drush_command']} #{node['drupal_db']['devel']} #{node['drupal_db']['dblog']} #{node['drupal_db']['stage_file_proxy']} -y
        EOH
        only_if "#{node['drupal_db']['drush_command']} #{node['drupal_db']['drush_status_command']}"
end

