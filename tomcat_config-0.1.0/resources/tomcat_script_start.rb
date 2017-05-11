resource_name :tomcat_script_start

property :tomcat_script_start, String

def tomcat_script_start
        cmd = "cd #{node['tomcat_install']['user_dir']}/#{node['tomcat_install']['local']}/#{node['tomcat_install']['tomcat_dir']} && ./#{node['tomcat_install']['bin_dir']}/startup.sh"
end

action :run do
execute 'run startup script of tomcat' do
   command tomcat_script_start
   end
end
