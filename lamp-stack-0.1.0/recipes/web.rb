package "apache2" do
  action :install
end

service "apache2" do
  action [:enable, :start]
end

node["apache"]["sites"].each do |sitename, data|
	document_root = data["document_root"]

	directory "create site directory" do
		path document_root
		mode "0755"
		recursive true
	end

	directory "#{document_root}/public_html" do
		action :create
	end

	directory "#{document_root}/logs" do
		action :create
	end

	execute "enable-sites-#{sitename}" do
		command "a2ensite #{sitename}"
		action :nothing
	end

	template "/etc/apache2/sites-available/#{sitename}.conf" do
		source "vhosts.erb"
		mode "0644"
		variables(
		  :document_root => document_root,
		  :port => data["port"],
		  :serveradmin => data["serveradmin"],
		  :servername => data["servername"]
		)
		notifies :run, "execute[enable-sites-#{sitename}]"
		notifies :restart, "service[apache2]"
	end

end


