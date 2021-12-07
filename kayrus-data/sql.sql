-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.31 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para lions
CREATE DATABASE IF NOT EXISTS `lions` /*!40100 DEFAULT CHARACTER SET armscii8 COLLATE armscii8_bin */;
USE `lions`;

-- Copiando estrutura para tabela lions.smartphone_calls
CREATE TABLE IF NOT EXISTS `smartphone_calls` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `initiator` varchar(255) COLLATE armscii8_bin NOT NULL,
  `target` varchar(255) COLLATE armscii8_bin NOT NULL,
  `duration` int(11) NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE armscii8_bin NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.smartphone_contacts
CREATE TABLE IF NOT EXISTS `smartphone_contacts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) COLLATE armscii8_bin NOT NULL,
  `phone` varchar(255) COLLATE armscii8_bin NOT NULL,
  `name` varchar(255) COLLATE armscii8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.smartphone_instagram
CREATE TABLE IF NOT EXISTS `smartphone_instagram` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) COLLATE armscii8_bin NOT NULL,
  `username` varchar(255) COLLATE armscii8_bin NOT NULL,
  `avatarURL` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.smartphone_instagram_followers
CREATE TABLE IF NOT EXISTS `smartphone_instagram_followers` (
  `follower_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.smartphone_instagram_likes
CREATE TABLE IF NOT EXISTS `smartphone_instagram_likes` (
  `post_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.smartphone_instagram_posts
CREATE TABLE IF NOT EXISTS `smartphone_instagram_posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `image` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  `content` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.smartphone_olx
CREATE TABLE IF NOT EXISTS `smartphone_olx` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE armscii8_bin NOT NULL,
  `category` varchar(255) COLLATE armscii8_bin NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(1024) COLLATE armscii8_bin NOT NULL,
  `images` varchar(1024) COLLATE armscii8_bin NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.smartphone_paypal_transactions
CREATE TABLE IF NOT EXISTS `smartphone_paypal_transactions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `target` bigint(20) NOT NULL,
  `type` varchar(255) COLLATE armscii8_bin NOT NULL DEFAULT 'payment',
  `description` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  `value` bigint(20) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.smartphone_tinder
CREATE TABLE IF NOT EXISTS `smartphone_tinder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE armscii8_bin NOT NULL,
  `image` varchar(255) COLLATE armscii8_bin NOT NULL,
  `bio` varchar(1024) COLLATE armscii8_bin NOT NULL,
  `age` tinyint(4) NOT NULL,
  `gender` varchar(255) COLLATE armscii8_bin NOT NULL,
  `show_gender` tinyint(4) NOT NULL,
  `tags` varchar(255) COLLATE armscii8_bin NOT NULL,
  `show_tags` tinyint(4) NOT NULL,
  `target` varchar(255) COLLATE armscii8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.smartphone_tinder_messages
CREATE TABLE IF NOT EXISTS `smartphone_tinder_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `content` varchar(255) COLLATE armscii8_bin NOT NULL,
  `liked` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.smartphone_tinder_rating
CREATE TABLE IF NOT EXISTS `smartphone_tinder_rating` (
  `profile_id` int(11) NOT NULL,
  `rated_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`profile_id`,`rated_id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.smartphone_tor_messages
CREATE TABLE IF NOT EXISTS `smartphone_tor_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel` varchar(24) COLLATE armscii8_bin NOT NULL DEFAULT 'geral',
  `sender` varchar(255) COLLATE armscii8_bin NOT NULL,
  `image` varchar(512) COLLATE armscii8_bin DEFAULT NULL,
  `content` varchar(500) COLLATE armscii8_bin DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.smartphone_whatsapp
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp` (
  `owner` varchar(255) COLLATE armscii8_bin NOT NULL,
  `avatarURL` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  `read_receipts` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.smartphone_whatsapp_groups
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE armscii8_bin NOT NULL,
  `avatarURL` varchar(255) COLLATE armscii8_bin NOT NULL,
  `owner` varchar(255) COLLATE armscii8_bin NOT NULL,
  `members` varchar(512) COLLATE armscii8_bin NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.smartphone_whatsapp_messages
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` varchar(255) COLLATE armscii8_bin NOT NULL,
  `target` varchar(255) COLLATE armscii8_bin NOT NULL,
  `image` varchar(512) COLLATE armscii8_bin DEFAULT NULL,
  `location` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  `content` varchar(500) COLLATE armscii8_bin DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  `saw_at` bigint(20) NOT NULL DEFAULT '0',
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  `stock` int(11) DEFAULT '0',
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.vrp_banco
CREATE TABLE IF NOT EXISTS `vrp_banco` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `extrato` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  `data` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.vrp_barbershop
CREATE TABLE IF NOT EXISTS `vrp_barbershop` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `fathers` int(11) NOT NULL DEFAULT '0',
  `kinship` int(11) NOT NULL DEFAULT '0',
  `eyecolor` int(11) NOT NULL DEFAULT '0',
  `skincolor` int(11) NOT NULL DEFAULT '0',
  `acne` int(11) NOT NULL DEFAULT '0',
  `stains` int(11) NOT NULL DEFAULT '0',
  `freckles` int(11) NOT NULL DEFAULT '0',
  `aging` int(11) NOT NULL DEFAULT '15',
  `hair` int(11) NOT NULL DEFAULT '0',
  `haircolor` int(11) NOT NULL DEFAULT '0',
  `haircolor2` int(11) NOT NULL DEFAULT '0',
  `makeup` int(11) NOT NULL DEFAULT '0',
  `makeupintensity` int(11) NOT NULL DEFAULT '0',
  `makeupcolor` int(11) NOT NULL DEFAULT '0',
  `lipstick` int(11) NOT NULL DEFAULT '0',
  `lipstickintensity` int(11) NOT NULL DEFAULT '0',
  `lipstickcolor` int(11) NOT NULL DEFAULT '0',
  `eyebrow` int(11) NOT NULL DEFAULT '0',
  `eyebrowintensity` int(11) NOT NULL DEFAULT '10',
  `eyebrowcolor` int(11) NOT NULL DEFAULT '0',
  `beard` int(11) NOT NULL DEFAULT '0',
  `beardintentisy` int(11) NOT NULL DEFAULT '10',
  `beardcolor` int(11) NOT NULL DEFAULT '0',
  `blush` int(11) NOT NULL DEFAULT '0',
  `blushintentisy` int(11) NOT NULL DEFAULT '0',
  `blushcolor` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.vrp_fines
CREATE TABLE IF NOT EXISTS `vrp_fines` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `nuser_id` int(11) NOT NULL DEFAULT '0',
  `date` varchar(25) NOT NULL DEFAULT '0.0.0',
  `price` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `nuser_id` (`nuser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.vrp_homes
CREATE TABLE IF NOT EXISTS `vrp_homes` (
  `home` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `owner` int(1) NOT NULL DEFAULT '0',
  `vault` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`home`,`user_id`),
  KEY `home` (`home`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.vrp_infos
CREATE TABLE IF NOT EXISTS `vrp_infos` (
  `steam` varchar(50) NOT NULL,
  `whitelist` tinyint(1) DEFAULT '0',
  `banned` tinyint(1) DEFAULT '0',
  `gems` int(11) NOT NULL DEFAULT '0',
  `premium` int(12) NOT NULL DEFAULT '0',
  `predays` int(2) NOT NULL DEFAULT '0',
  `priority` int(3) NOT NULL DEFAULT '0',
  `chars` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`steam`),
  KEY `steam` (`steam`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.vrp_invoice
CREATE TABLE IF NOT EXISTS `vrp_invoice` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `nuser_id` int(11) NOT NULL DEFAULT '0',
  `date` varchar(25) NOT NULL DEFAULT '0.0.0',
  `price` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nuser_id` (`nuser_id`),
  KEY `user_id` (`user_id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.vrp_permissions
CREATE TABLE IF NOT EXISTS `vrp_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `permiss` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.vrp_srv_data
CREATE TABLE IF NOT EXISTS `vrp_srv_data` (
  `dkey` varchar(100) NOT NULL,
  `dvalue` text,
  PRIMARY KEY (`dkey`),
  KEY `dkey` (`dkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.vrp_users
CREATE TABLE IF NOT EXISTS `vrp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steam` varchar(100) DEFAULT NULL,
  `registration` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT 'Individuo',
  `name2` varchar(50) DEFAULT 'Indigente',
  `bank` int(12) NOT NULL DEFAULT '2500',
  `garage` int(3) NOT NULL DEFAULT '2',
  `prison` int(6) NOT NULL DEFAULT '0',
  `locate` int(1) NOT NULL DEFAULT '1',
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.vrp_user_data
CREATE TABLE IF NOT EXISTS `vrp_user_data` (
  `user_id` int(11) NOT NULL,
  `dkey` varchar(100) NOT NULL,
  `dvalue` text,
  PRIMARY KEY (`user_id`,`dkey`),
  KEY `user_id` (`user_id`),
  KEY `dkey` (`dkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela lions.vrp_vehicles
CREATE TABLE IF NOT EXISTS `vrp_vehicles` (
  `user_id` int(11) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `plate` varchar(20) DEFAULT NULL,
  `arrest` int(1) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `engine` int(4) NOT NULL DEFAULT '1000',
  `body` int(4) NOT NULL DEFAULT '1000',
  `fuel` int(3) NOT NULL DEFAULT '100',
  `work` varchar(10) NOT NULL DEFAULT 'false',
  `doors` varchar(254) NOT NULL,
  `windows` varchar(254) NOT NULL,
  `tyres` varchar(254) NOT NULL,
  PRIMARY KEY (`user_id`,`vehicle`),
  KEY `user_id` (`user_id`),
  KEY `vehicle` (`vehicle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
