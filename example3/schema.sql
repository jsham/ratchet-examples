-- Note: Before running this make sure you understand it. Use at own risk.
-- Usage:
--   mysql> source schema.sql

DROP DATABASE IF EXISTS `srcDB`;
CREATE DATABASE `srcDB`;
DROP DATABASE IF EXISTS `dstDB`;
CREATE DATABASE `dstDB`;

use srcDB

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `job_cd` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `users` (`id`, `name`, `email`, `phone`, `job_cd`)
VALUES
	(1, 'Alexis', 'alexis@daum.net', '010-1234-5678', 'D0001'),
	(2, 'Jaden', 'jaden@daum.net', '010-1111-2222', 'D0002'),
	(3, 'Ted', 'ted@daum.net', '010-3333-4444', 'D0003');

use dstDB

DROP TABLE IF EXISTS `krew_info`;
CREATE TABLE `krew_info` (
  `krew_id` int(11) NOT NULL,
  `krew_name` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `mobile` varchar(100) NOT NULL DEFAULT '',
  `job_code` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`krew_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
