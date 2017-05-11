resource_name :tomcat_script_shut

property :tomcat_script_shut, String

def tomcat_script_shut
        cmd = "cd #{node['tomcat_install']['user_dir']}/#{node['tomcat_install']['local']}/#{node['tomcat_install']['tomcat_dir']} && ./#{node['tomcat_install']['bin_dir']}/shutdown.sh"
end

action :run do
execute 'run startup script of tomcat' do
   command tomcat_script_shut
   end
end
