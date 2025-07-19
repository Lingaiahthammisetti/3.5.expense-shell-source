#!/bin/bash
source ./common.sh

check_root

dnf install mysql-server -y &>>$LOGFILE
VALIDATE $? "Installation of MYSQL Sever"

systemctl enable mysqld &>>$LOGFILE
VALIDATE $? "Enabling of MYSQL Server"

systemctl start mysqld &>>$LOGFILE
VALIDATE $? "Starting the MYSQL Server"

mysql -h mysql.lithesh.shop -u root -pExpenseApp@1 -e 'show databases;' &>>$LOGFILE
if [ $? -ne 0 ]
then
   mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
else
   echo -e "MySQL Root password is already setup..$Y SKIPPING $N"
fi

systemctl status mysqld
VALIDATE $? "mysql status"
