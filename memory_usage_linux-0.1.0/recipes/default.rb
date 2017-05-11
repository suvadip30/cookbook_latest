#
# Cookbook Name:: memory_usage_linux
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

bash 'memory_usage' do
code <<-EOF
LIMIT='4'
DIR='/var'
MAILTO='suvadip@snp.com','Anirudh@snp.com','prakashn@snp.com','sachin@snp.com','kristen@snp.com','mike@snp.com'
SUBJECT='This is a TEST MAIL from Chef cookbook for $DIR disk usage **Please do not reply**'
MAILX='mailx'
which $MAILX > /dev/null 2>&1
if ! [ $? -eq 0 ]
then

          echo "Please install $MAILX"
          exit 1
fi
cd $DIR
USED=`df . | awk '{print $5}' | sed -ne 2p | cut -d"%" -f1`
if [ $USED -gt $LIMIT ]
then
      du -sh ${DIR}/* | $MAILX -s "$SUBJECT" "$MAILTO"
fi
EOF
#not_if {File.exits?(extract_path)}
end
