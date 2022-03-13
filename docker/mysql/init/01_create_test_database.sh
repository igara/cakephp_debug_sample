mysql -h localhost -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE $MYSQL_TEST_DATABASE;"
mysql -h localhost -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL ON $MYSQL_TEST_DATABASE.* TO '$MYSQL_USER'@'%';"
mysql -h localhost -u root -p$MYSQL_ROOT_PASSWORD $MYSQL_TEST_DATABASE -e "source /mysql/schema.sql"
mysql -h localhost -u root -p$MYSQL_ROOT_PASSWORD $MYSQL_TEST_DATABASE -e "source /mysql/test_data.sql" --local-infile=1
