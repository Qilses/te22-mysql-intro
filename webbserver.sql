/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `birds`;
CREATE TABLE `birds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `species_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `wingspan` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `species`;
CREATE TABLE `species` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `latin` varchar(255) DEFAULT NULL,
  `wingspan_min` int DEFAULT NULL,
  `wingspan_max` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `birds` (`id`, `species_id`, `name`, `wingspan`) VALUES
(1, 5, 'Krister', 235);
INSERT INTO `birds` (`id`, `species_id`, `name`, `wingspan`) VALUES
(2, 7, 'Frasse', 2450);
INSERT INTO `birds` (`id`, `species_id`, `name`, `wingspan`) VALUES
(3, 1, 'Tom', NULL);
INSERT INTO `birds` (`id`, `species_id`, `name`, `wingspan`) VALUES
(4, 7, 'Doris', 2300);

INSERT INTO `species` (`id`, `name`, `latin`, `wingspan_min`, `wingspan_max`) VALUES
(1, 'Kejsarpingvin', NULL, NULL, NULL);
INSERT INTO `species` (`id`, `name`, `latin`, `wingspan_min`, `wingspan_max`) VALUES
(2, 'Tornuggla', NULL, NULL, NULL);
INSERT INTO `species` (`id`, `name`, `latin`, `wingspan_min`, `wingspan_max`) VALUES
(3, 'Pilgrimsfalk', NULL, NULL, NULL);
INSERT INTO `species` (`id`, `name`, `latin`, `wingspan_min`, `wingspan_max`) VALUES
(4, 'Bofink', NULL, NULL, NULL),
(5, 'Talgoxe', 'Parus major', 220, 250),
(6, 'Korp', 'Corvus corax', NULL, NULL),
(7, 'Trana', 'Grus grus', 2000, 2300);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;