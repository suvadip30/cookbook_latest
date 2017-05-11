NUMBER=`grep -rnw /var/www/html/*.sql -e "Dump completed"`
        GREP=`grep -rnw /var/www/html/*.sql -e "Dump completed" | tail -n1 | wc -l`
	echo "************MySQL backup status************" >> /tmp/test/test.txt
        if  [ "$GREP" -eq 1 ]; then
                echo " Success: Backup completed for $NUMBER" >> /tmp/test/test.txt
		echo "---------------------------------------------" >> /tmp/test/test.txt
        else
                echo "'Dump completed' not found in the backup file" >> /tmp/test/test.txt
		echo "---------------------------------------------" >> /tmp/test/test.txt
        fi

