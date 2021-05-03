CREATE TABLE IF NOT EXISTS `whitelist` (
  `identifier` varchar(40) NOT NULL,
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `whitelisted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `id` (`id`)
)