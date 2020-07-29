-- Create an user to interact with the database with all privileges
-- Then create a new database.

-- --------------------------------------------------------

-- id : user42
-- password : user42
CREATE USER 'user42'@'%' IDENTIFIED BY 'user42';
GRANT ALL PRIVILEGES ON *.* TO 'user42'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'user42'@'localhost' WITH GRANT OPTION;

-- --------------------------------------------------------

--
-- Database : `42_ft_services`
--
CREATE DATABASE IF NOT EXISTS `42_ft_services`
  DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE 42_ft_services;
