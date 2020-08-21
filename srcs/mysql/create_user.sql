-- Create an user to interact with the database with all privileges
-- Then create a new database.

-- --------------------------------------------------------

--
-- Database : `42_ft_services`
--
CREATE DATABASE IF NOT EXISTS `42_ft_services`
  DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE 42_ft_services;

-- --------------------------------------------------------

-- id : root
-- password : root
CREATE USER 'user42'@'%' IDENTIFIED BY 'user42';
GRANT ALL PRIVILEGES ON *.* TO 'user42'@'%' WITH GRANT OPTION;

-- -- create a new wp_user
-- INSERT INTO `42_ft_services`.`wp_users` (`ID`, 
-- `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_status`, 
-- `display_name`) VALUES ('2', 'user1', MD5('user1'), 'user1', 
-- 'xxx@xxx.com', '0', 'user1');

-- -- create a new wp_user
-- INSERT INTO `42_ft_services`.`wp_users` (`ID`, 
-- `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_status`, 
-- `display_name`) VALUES ('3', 'user2', MD5('user2'), 'user2', 
-- 'xxx@xxx.com', '0', 'user2');