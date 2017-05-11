# lamp-stack

Description: Lamp-stack cookbook help you setup lamp stack.

Recipes
---

- `default`
	
	Install common packages required by all servers.

- `web`

	This recipe install apache server and setup sites provided in attributes , if any

- `database`

	Setup and install mysql server. It also create database but not tables.
	It also create a separate user for database with just enough privileges. One should use it, in place of `root` user.

	Reason: Tables should be part of migration and one should not allow manual table creations



Testing cookbook
--------------------

Create vagrant box

	chef exec kitchen create

Run chef cookbook

	chef exec kitchen converge

Login to verify

	chef exec kitchen login

OR

Run integration testing

	chef exec kitchen verify


How-to-use
-------------

Write wrapper cookbook or create roles.


Create role with following content:

- `web1`

		{
			"run_list": [
			        "recipe[lamp-stack::web]""
			    ],
			"default_attributes" : {
				"apache": { 
						"sites" : {
								"browserstack-eg.org" :  {
										"port" : 80, "servername" : "browserstack-eg.org",
										"serveradmin" : "webmaster@browserstack-eg.org",
										 "document_root" : "/var/www/web1" 
										}
						}
					}
		}


- `web2`

		{
			"run_list": [
			        "recipe[lamp-stack::web]""
			    ],
			"default_attributes" : {
				"apache": { 
						"sites" : {
								"browserstack-eg.com" :  {
										"port" : 80, "servername" : "browserstack-eg.com",
										"serveradmin" : "webmaster@browserstack-eg.com",
										 "document_root" : "/var/www/web2" 
										}
						}
					}
		}


- `mysql_server`
	

		{
			"run_list": [
			        "recipe[lamp-stack::database]""
			    ],
			"default_attributes" : {
				"mysql": { 
						"database" : "mydb",
						"root_password" : "secret",
						"db_user" : "sonu",
						"db_password" : "sonu_secret"
					}
		}

	WARNING: ALL CREDS SHOULD BE PART OF ENCRYPTED DATA BAGS ( or vault if ansible)



