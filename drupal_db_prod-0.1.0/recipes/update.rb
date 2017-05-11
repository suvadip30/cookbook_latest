script 'update drupal-core' do
        interpreter 'bash'
        code <<-EOH
        	#{node['drupal_db_prod']['change_directory']} #{node['drupal_db_prod']['web_directory']}/#{node['drupal_db_prod']['root_directory']}
                #{node['drupal_db_prod']['drush_command']} #{node['drupal_db_prod']['db_update']} -y
        EOH
        only_if "#{node['drupal_db_prod']['drush_command']} #{node['drupal_db_prod']['drush_status_command']}"
        end                        
