mysql -h localhost -u root -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE -e "source /mysql/schema.sql"
mysql -h localhost -u root -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE -e "source /mysql/test_data.sql" --local-infile=1
