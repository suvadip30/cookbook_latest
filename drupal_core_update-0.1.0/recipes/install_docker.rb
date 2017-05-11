apt_package 'docker.io' do
	action :install
	#notifies [:enable, :restart], 'service[docker]' 
end

service 'docker' do
	action [:start, :enable]
end

chef_gem 'kitchen-docker' do
  compile_time true
  action :install
end

script 'generate cookbook drupal in tmp directory' do
  interpreter 'bash'
	code <<-EOH
	cd /tmp
	chef generate cookbook drupal
	EOH
end

template '/tmp/drupal/.kitchen.yml' do
	owner 'root'
	group 'root'
	mode '0644'
	source 'kitchen.erb'
end

#execute 'kitchen need to converge' do
#	command 'kitchen converge'
#end

#execute 'kitchen need to verify' do
#	command 'kitchen verify'
#end
