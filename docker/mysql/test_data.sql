SET GLOBAL local_infile=on;
LOAD DATA LOCAL INFILE "/mysql/test_data/users.csv " INTO TABLE users FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE "/mysql/test_data/user_details.csv " INTO TABLE user_details FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;
