#
# Cookbook Name:: drupal_db_prod
# Recipe:: default
#
# Copyright 2017, SNP Technologies Inc
#
# All rights reserved - Do Not Redistribute

script 'generate cookbook drupal in tmp directory' do
  interpreter 'bash'
        code <<-EOH
        DAY=$(#{node['drupla_db_prod']['date']} -d "$D" '+%d')
        MONTH=$(#{node['drupla_db_prod']['date']} -d "$D" '+%b')
        MONTH_dig=$(#{node['drupla_db_prod']['date']} -d "$D" '+%m')
        YEAR=$(#{node['drupla_db_prod']['date']} -d "$D" '+%Y')

        DATE_V=$DAY-$MONTH_dig-$YEAR
        echo "Month: $MONTH"
        echo "Date: $DAY-$MONTH_dig-$YEAR"

        #{node['drupal_db_prod']['drush_command']} #{node['drupal_db_prod']['sql-dump']} --result-file > #{node['drupal_db_prod']['temporary_directory']}/db_snw_stage_$MONTH-$DATE_V.sql
        EOH
        end
