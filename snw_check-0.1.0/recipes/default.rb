#
# Cookbook Name:: snw_check
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

script '************Drupal File and Folder backup status************' do
        interpreter 'bash'
        code <<-EOH
	echo "********Drupal File and Folder backup status*********" > /tmp/test/test.txt
        BACKUP_PATH=`find /etc/chef/*.pem  -mtime -7 -printf '%Cc %s %f\n' | sort -nr | head -n 20 | sed 's/[^ ]\+ //'`
        BACKUP_PATH_FINAL=`find /etc/chef/*.pem  -mtime -7 -printf '%Cc %s %f\n' | sort -nr | head -n 20 | sed 's/[^ ]\+ //' | tail -n1 | wc -l`
        if [ "$BACKUP_PATH_FINAL" -eq 1 ]; then
                echo "Back UP are available for Database for last seven days" >> /tmp/test/test.txt
                echo "Please check the below backup files" >> /tmp/test/test.txt
                echo "$BACKUP_PATH" >> /tmp/test/test.txt
        else
                echo "There is no backup taken for Database for last seven days" >> /tmp/test/test.txt
                echo "---------------------------------------------" >> /tmp/test/test.txt
        fi

        EOH
end

cookbook_file '/tmp/sqldump.sh' do
  source 'sqldump.sh'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute '**********execute sqldump**********' do
	command 'sh /tmp/sqldump.sh'
end

file '/tmp/sqldump.sh' do
	action :delete
end

script '***********Check File permission************' do
	interpreter 'bash'
	code <<-EOH
	FILE='/var/www/html/smith_wesson_stage/login.php'
	echo "********Check File permission*********" >> /tmp/test/test.txt
	if [ ! -w "$FILE" ]
	then
   		echo "The file is not writable, please make it writable" >> /tmp/test/test.txt
	else
  		echo "The file is already writable" >> /tmp/test/test.txt
	fi

	if [ ! -r "$FILE" ]
	then
   		echo "The file is not readable, please make it readable" >> /tmp/test/test.txt
	else
 		echo "The file is already readable" >> /tmp/test/test.txt
	fi

	if [ ! -x "$FILE" ]
	then
   		echo "The file is not executable, please make it executable" >> /tmp/test/test.txt
		echo "---------------------------------------------" >> /tmp/test/test.txt
	else
  		echo "The file is already executable" >> /tmp/test/test.txt
		echo "---------------------------------------------" >> /tmp/test/test.txt
	fi
	EOH
end

drupal_user = data_bag_item('drupal', 'drupal_user')
drupal_password = data_bag_item('drupal', 'drupal_password')

template "/tmp/drupal_db.sh" do
	source "drupal_db.erb"
	variables( 
		:drupal_user => drupal_user['value'],
		:drupal_password => drupal_password['value']
)
end

#script '***********Check Drupal Users************' do
#	interpreter 'bash'
#	code <<-EOH
#	RESULT_VARIABLE=`echo "$(mysql drupal -udrupaluser -pPassword@123 -se "SELECT EXISTS(SELECT 1 FROM users )")"`
#	DETAIL_USER_VARIABLE=`echo "SELECT name, mail, uid FROM users" | mysql drupal -u drupaluser -pPassword@123`
#	echo "********Check Drupal Users*********" >> /tmp/test/test.txt
#	if [ "$RESULT_VARIABLE" -eq 1 ]; then
#		echo "All the users exits in the Database of Drupal." >> /tmp/test/test.txt
#		echo "Please check the below users for more details." >> /tmp/test/test.txt
#		echo "$DETAIL_USER_VARIABLE" >> /tmp/test/test.txt
#		echo "---------------------------------------------" >> /tmp/test/test.txt
#	else
#  		echo "Sorry there is no User in the Database, please create user"
#		echo "---------------------------------------------" >> /tmp/test/test.txt
#	fi
#	EOH
#end

script '************Check Drupal Module to Update*************' do
	interpreter 'bash'
	code <<-EOH
	cd /var/www/html/smith_wesson_stage
	UPDATE=`drush up --simulate | grep 'Update available' | tail -n1 | wc -l`
	echo "********Check Drupal Module to Update*********" >> /tmp/test/test.txt
	if [ "$UPDATE" -eq 1 ];then
		echo "Below Modules need to update" >> /tmp/test/test.txt
		echo "$UPDATE" >> /tmp/test/test.txt
		echo "---------------------------------------------" >> /tmp/test/test.txt
	else
		echo "All Modules are Up to update" >> /tmp/test/test.txt
		echo "---------------------------------------------" >> /tmp/test/test.txt
	fi
	EOH
end

script '************Check Drupal Package to Update*************' do
	interpreter 'bash'
	code <<-EOH
	cd /var/www/html/smith_wesson_stage
	DRUPAL_VER=`drush pm-update --simulate | grep 'Drupal' | grep 'Up to date'`
	DRUPAL_VERSION=`drush pm-update --simulate | grep 'Drupal' | grep 'Up to date' | tail -n1 | wc -l`
	echo "********Check Drupal Package to Update*********" >> /tmp/test/test.txt
	if [ "$DRUPAL_VERSION" -eq 1 ]; then
		echo "Drupal package update is available" >> /tmp/test/test.txt
		echo "Check below package version to update" >> /tmp/test/test.txt
		echo "$DRUPAL_VER" >> /tmp/test/test.txt
		echo "---------------------------------------------" >> /tmp/test/test.txt
	else
		echo "There is no update available for Drupal Package, all are up to date" >> /tmp/test/test.txt
		echo "---------------------------------------------" >> /tmp/test/test.txt
	fi
	EOH
end

script '************Drupal database MySql backup status************' do
	interpreter 'bash'
	code <<-EOH
	#NUMBER=`grep -rnw *.sql -e "Dump completed" | tail`
	#GREP=`grep -rnw *.sql -e "Dump completed" | tail -n1 | wc -l`
	#if  [ "$GREP" -eq 1 ]
	#then
  	#	echo " Success: Backup completed for $NUMBER" >> /tmp/test/test.txt
	#else
	#	echo "'Dump completed' not found in the backup file" >> /tmp/test/test.txt
 	#fi
	FILE=/tmp/test/test.txt
        if [ -s $FILE ] ; then
        echo "$FILE has data."
        sshpass -p '$w$np@llow@123' scp $FILE SNPAdmin@chef-workstation-snp:/tmp
        sshpass -p '$w$np@llow@123' ssh SNPAdmin@chef-workstation-snp cat "/tmp/test.txt | mailx -s "This is test mail for verification of Drupal maintenance work from Chef" suvadip@snp.com prakashn@snp.com"
        else
        echo "$FILE is empty." >> /tmp/test/test.txt
	echo "---------------------------------------------" >> /tmp/test/test.txt
        fi
	EOH
end

file '/tmp/test/test.txt' do
        action :delete
end
