#!/bin/bash

# verify user is root or not

Error () {
    echo -e "\e[1;31m\n$1\n\e[0m"
}

Success () {
    echo -e "\e[32m $1  -  SUCCESS\e[0m"
}

Failure () {
    echo -e "\e[31m $1  -  FAILURE\e[0m"
}

Stat () {
    if [ $2 -eq 0 ]; then
        Success "$1"
    else
        Failure "$1"
        Error "Refer log file $LOG for more information"
        exit 2
    fi
}
ID=$(id -u)

if [ $ID -ne 0 ]; then
   Error "Run this script as a root user"
   exit 5
fi   

LOG=\tmp\stack.log
rm -f \tmp\stack.log

# Install web server
Head "Web Server Setup"
echo "Install a web server"
yum install httpd -y &>>$LOG
Stat "Installing HTTPD Server" $?

echo 'ProxyPass "/student" "http://localhost:8080/student"
ProxyPassReverse "/student"  "http://localhost:8080/student"' >/etc/httpd/conf.d/app-proxy.conf 
Stat "Updating Proxy Config" $? 

curl -s https://s3-us-west-2.amazonaws.com/studentapi-cit/index.html -o /var/www/html/index.html &>>$LOG 
Stat "Updating index web page" $? 

systemctl enable httpd &>/dev/null 
systemctl restart httpd &>>$LOG 
Stat "Starting HTTPD Service" $?

### 
APPUSER=student
TOMCAT_URL=$(curl -s https://tomcat.apache.org/download-80.cgi | grep tar.gz  |grep nofollow | head -1 | awk -F '"' '{print $2}')
TOMCAT_DIR=$(echo $TOMCAT_URL| awk -F / '{print $NF}' | sed -e 's|.tar.gz||')
TOMCAT_DIR=/home/$APPUSER/$TOMCAT_DIR
JDBC_CONN='<Resource name="jdbc/TestDB" auth="Container" type="javax.sql.DataSource" maxTotal="100" maxIdle="30" maxWaitMillis="10000" username="USERNAME" password="PASSWORD" driverClassName="com.mysql.jdbc.Driver" url="jdbc:mysql://RDS-DB-ENDPOINT:3306/DATABASE"/>'

## Install App Server
Head "App Server Setup"
id $APPUSER &>/dev/null 
if [ $? -eq 0 ]; then 
    Stat "Create Functional User" 0
else 
    useradd  $APPUSER &>>$LOG 
    Stat "Create Functional User" $?
fi

yum install java -y &>>$LOG 
Stat "Install Java" $? 

cd /home/student 
wget -qO- $TOMCAT_URL | tar -xz &>>$LOG 
Stat "Download and Extract Tomcat" $?

cd $TOMCAT_DIR 
wget https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war -O webapps/student.war &>>$LOG 
Stat "Download Student War" $?

cd $TOMCAT_DIR 
wget https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar -O lib/mysql-connector.jar &>>$LOG 
Stat "Download MySQL JDBC Jar" $? 

cd $TOMCAT_DIR 
sed -i -e "$ i $JDBC_CONN" conf/context.xml
Stat "Update context with JDBC" $? 

chown $APPUSER:$APPUSER $TOMCAT_DIR -R 

wget -q https://s3-us-west-2.amazonaws.com/studentapi-cit/tomcat-init -O /etc/init.d/tomcat &>>$LOG 
Stat "Download Tomcat INIT script" $? 

chmod +x /etc/init.d/tomcat

systemctl daemon-reload &>>$LOG 
systemctl restart tomcat &>>$LOG 
Stat "Start Tomcat Service" $?
