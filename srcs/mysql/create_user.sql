-- Create an user to interact with the database with all privileges
-- Then create a new database.

-- --------------------------------------------------------

-- id : user42
-- password : user42
CREATE USER 'user42'@'localhost' IDENTIFIED BY 'user42';
GRANT ALL PRIVILEGES ON *.* TO 'user42'@'localhost' WITH GRANT OPTION;

-- --------------------------------------------------------

--
-- Database : `42_ft_server`
--
CREATE DATABASE IF NOT EXISTS `42_ft_server`
  DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE 42_ft_server;
