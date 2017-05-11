default["apache"]["sites"]["first-site"] = {
	 "port" => 80, "servername" => "sitename1",
	 "serveradmin" => "webmaster@browserstack-eg.com", 
	 "document_root" => "/var/www/web1" 
	}

default["apache"]["sites"]["second-site"] = {
	"port" => 80, "servername" => "sitename2",
	"serveradmin" => "webmaster@browserstack-eg.org",
	 "document_root" => "/var/www/web2" 
	}
