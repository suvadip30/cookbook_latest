package 'apache' do
	package_name 'httpd'
end

service 'httpd' do
	action [:enable, :start]
end

file '/var/www/html/index.html' do
	action :delete
end

file '/var/www/html/index.html' do
	content 'Hello My World!!'
	mode '0755'
	owner 'root'
	group 'apache'
end

file '/etc/motd' do
	content 'Welcome to my Chef-Workstation-Server'
end

execute 'command-test' do
	command 'echo blah >> /etc/motd'
	only_if { ::File.exists?('/etc/motd') }
end
