sed -i -e "s/\${DB_USER}/${DB_USER}/g" /etc/my.cnf;
sed -i -e "s/\${DB_PASSWORD}/${DB_PASSWORD}/g" /etc/my.cnf;


service mysql start;

echo "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';";
echo "CREATE DATABASE ${DB_NAME};";
echo "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%' WITH GRANT OPTION;";
echo "FLUSH PRIVILEGES;";

service mysql stop;
mysqld;