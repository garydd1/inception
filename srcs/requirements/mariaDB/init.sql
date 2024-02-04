-- Set the root user's password and restrict access to localhost
ALTER USER 'root'@'localhost' IDENTIFIED BY 'dgarizad';
--Create additional users and grant privileges
CREATE USER IF NOT EXISTS 'USER'@'%' IDENTIFIED BY 'USER1_PASSWORD';
CREATE USER IF NOT EXISTS 'USER2'@'%' IDENTIFIED BY 'USER2_PASSWORD';

FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS mydatabase;
USE mydatabase;
CREATE TABLE IF NOT EXISTS mytable (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);


