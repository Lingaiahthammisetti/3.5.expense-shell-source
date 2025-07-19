# #!/bin/bash
# source ./common.sh

# check_root

# echo "Please enter DB Password:"
# #read -s mysql_root_password
# read mysql_root_password

# dnf install mysql-server -y &>>$LOGFILE

# systemctl enable mysqld &>>$LOGFILE

# systemctl start mysqld &>>$LOGFILE

# #mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE

# #mysql -h db.lingaiah.online -uroot -p${mysql_root_password} -e 'show databases;' &>>$LOGFILE
# #mysql -h mysql.lithesh.shop -u root -p${mysql_root_password} -e 'show databases;' &>>$LOGFILE

# mysql -h mysql.lithesh.shop -u root -p"${mysql_root_password}" -e 'show databases;' &>>$LOGFILE

# if [ $? -ne 0 ]
# then
#    mysql_secure_installation --set-root-pass ${mysql_root_password} &>>$LOGFILE
# else
#    echo -e "MySQL Root password is already setup..$Y SKIPPING $N"
# fi


#!/bin/bash
source ./common.sh
check_root
mysql_root_password: ExpenseApp@1

dnf install mysql-server -y &>>$LOGFILE
systemctl enable mysqld &>>$LOGFILE
systemctl start mysqld &>>$LOGFILE

mysql -h mysql.lithesh.shop -u root -p"${mysql_root_password}" -e 'show databases;' &>>$LOGFILE
if [ $? -ne 0 ]
then
   mysql_secure_installation --set-root-pass "${mysql_root_password}" &>>$LOGFILE
else
   echo -e "MySQL Root password is already setup..$Y SKIPPING $N"
fi
