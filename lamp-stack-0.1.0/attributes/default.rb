
default["mysql"]["root_password"] = "secret"
default["mysql"]["data_dir"] = "/mnt/db_data"
## WARNING: It should be part of encrypted data bag.
default["mysql"]["databases"] = [ "mydb" ]
default["mysql"]["version"] = "5.6"

### Good practice to create separate set of creds with just enough privilages
default["mysql"]["db_user"] = "sonu"
default["mysql"]["db_password"] = "sonu_secret"

