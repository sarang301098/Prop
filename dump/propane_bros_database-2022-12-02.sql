/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: accessories
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `accessories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: app_settings
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `app_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_type` int DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `type` int DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: cancellation_reasons
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `cancellation_reasons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reason` varchar(255) NOT NULL,
  `user_type` enum(
  'super_admin',
  'admin',
  'vendor',
  'driver',
  'user',
  'sub_admin'
  ) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: cart
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `order_type` int DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `schedule_date` timestamp NULL DEFAULT NULL,
  `lekage_fee` double DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `user_id` char(36) DEFAULT NULL,
  `vendor_id` char(36) DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `accessory_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `cylindersize_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `timeslot_id` int DEFAULT NULL,
  `zipcode_id` int DEFAULT NULL,
  `promocode_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7ce20a2eea831b268930f436f8` (`vendor_id`),
  KEY `IDX_dccd1ec2d6f5644a69adf163bc` (`product_id`),
  KEY `IDX_33b9137cce82da120723237992` (`accessory_id`),
  KEY `IDX_27718461eafde5fb02430c473c` (`cylindersize_id`),
  KEY `IDX_1db2a89d4a5924ddd500952283` (`category_id`),
  KEY `IDX_24b7aa2da84a1709c712bc9ff4` (`timeslot_id`),
  KEY `IDX_b1f045d785800d432478fb3702` (`zipcode_id`),
  KEY `IDX_99f9a06fca99e2188199a5e2d5` (`promocode_id`),
  KEY `FK_f091e86a234693a49084b4c2c86` (`user_id`),
  KEY `FK_1ca043a36187d428845c8435cdc` (`location_id`),
  CONSTRAINT `FK_1ca043a36187d428845c8435cdc` FOREIGN KEY (`location_id`) REFERENCES `delivery_locations` (`id`),
  CONSTRAINT `FK_1db2a89d4a5924ddd500952283f` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `FK_24b7aa2da84a1709c712bc9ff49` FOREIGN KEY (`timeslot_id`) REFERENCES `time_slots` (`id`),
  CONSTRAINT `FK_27718461eafde5fb02430c473c6` FOREIGN KEY (`cylindersize_id`) REFERENCES `cylinder_sizes` (`id`),
  CONSTRAINT `FK_33b9137cce82da1207232379920` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`id`),
  CONSTRAINT `FK_7ce20a2eea831b268930f436f84` FOREIGN KEY (`vendor_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_99f9a06fca99e2188199a5e2d59` FOREIGN KEY (`promocode_id`) REFERENCES `promocodes` (`id`),
  CONSTRAINT `FK_b1f045d785800d432478fb37029` FOREIGN KEY (`zipcode_id`) REFERENCES `zipcodes` (`id`),
  CONSTRAINT `FK_dccd1ec2d6f5644a69adf163bc1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FK_f091e86a234693a49084b4c2c86` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: categories
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `order_type` int DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: cms_pages
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `cms_pages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user_type` enum(
  'super_admin',
  'admin',
  'vendor',
  'driver',
  'user',
  'sub_admin'
  ) NOT NULL,
  `content` longtext NOT NULL,
  `key` varchar(255) NOT NULL,
  `status` int DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: contact_us
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `contact_us` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `user_type` enum(
  'super_admin',
  'admin',
  'vendor',
  'driver',
  'user',
  'sub_admin'
  ) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_0053da5d6eb571f3ba05db1fb1` (`user_id`),
  CONSTRAINT `FK_0053da5d6eb571f3ba05db1fb17` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: counties
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `counties` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sales_tax_one` double NOT NULL,
  `sales_tax_two` double NOT NULL,
  `total_zipcodes` int NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `status` int DEFAULT '1',
  `state_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_30e46c84494b78e20ba443984c` (`state_id`),
  CONSTRAINT `FK_30e46c84494b78e20ba443984c6` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: cylinder_sizes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `cylinder_sizes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cylinder_size` double NOT NULL,
  `status` int DEFAULT '1',
  `is_active` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: delivery_locations
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `delivery_locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  `price` double DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: documents
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `documents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `document_url` varchar(255) DEFAULT NULL,
  `document_type` int NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_c7481daf5059307842edef74d7` (`user_id`),
  CONSTRAINT `FK_c7481daf5059307842edef74d73` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: driver_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `driver_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `avg_rating` double DEFAULT NULL,
  `is_suspended` tinyint NOT NULL DEFAULT '0',
  `is_online` tinyint NOT NULL DEFAULT '1',
  `is_approved` tinyint NOT NULL DEFAULT '1',
  `order_type` int DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `licence_image` varchar(255) DEFAULT NULL,
  `zipcode_ids` text,
  `personal_id` varchar(255) DEFAULT NULL,
  `id_information` varchar(255) DEFAULT NULL,
  `driver_vehicle` varchar(255) DEFAULT NULL,
  `vehical_no` varchar(255) DEFAULT NULL,
  `status` int DEFAULT '0',
  `lat` double DEFAULT NULL,
  `long` double DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `identity` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `licence_no` varchar(255) DEFAULT NULL,
  `identity_information` varchar(255) DEFAULT NULL,
  `order_capacity` int DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_415a8b64cbf86db96a73dcd090` (`user_id`),
  KEY `IDX_14282f6b2039c773f725eaf929` (`vendor_id`),
  CONSTRAINT `FK_14282f6b2039c773f725eaf929c` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_details` (`id`),
  CONSTRAINT `FK_415a8b64cbf86db96a73dcd0902` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: driver_payments
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `driver_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `to_user_id` char(36) DEFAULT NULL,
  `from_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_478335f88232a7bfc08f8b0025e` (`to_user_id`),
  KEY `FK_79e3d11f95cb1d98c5a7fab9bdb` (`from_user_id`),
  CONSTRAINT `FK_478335f88232a7bfc08f8b0025e` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_79e3d11f95cb1d98c5a7fab9bdb` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: driver_stocks
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `driver_stocks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_at` timestamp NULL DEFAULT NULL,
  `added_filled` double DEFAULT NULL,
  `added_empty` double DEFAULT NULL,
  `returned_filled` double DEFAULT NULL,
  `returned_empty` double DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `cylinder_size_id` int DEFAULT NULL,
  `accessory_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `driver_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_339059463a8df4c4ceb085c7f3` (`category_id`),
  KEY `IDX_c17b4da37a3e51be3f7821fd0d` (`cylinder_size_id`),
  KEY `IDX_13695aaa459477bc8b4d31ffec` (`accessory_id`),
  KEY `IDX_0e32b57edf11f2b18277e27111` (`product_id`),
  KEY `FK_ffc19d7c2bf9eba906eb42ab99b` (`driver_id`),
  CONSTRAINT `FK_0e32b57edf11f2b18277e271114` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FK_13695aaa459477bc8b4d31ffec9` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`id`),
  CONSTRAINT `FK_339059463a8df4c4ceb085c7f3e` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `FK_c17b4da37a3e51be3f7821fd0d2` FOREIGN KEY (`cylinder_size_id`) REFERENCES `cylinder_sizes` (`id`),
  CONSTRAINT `FK_ffc19d7c2bf9eba906eb42ab99b` FOREIGN KEY (`driver_id`) REFERENCES `driver_details` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: email_templates
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `template` longtext NOT NULL,
  `key` varchar(255) NOT NULL,
  `status` int DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 17 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: emegergency_orders
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `emegergency_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_time` varchar(255) NOT NULL,
  `end_time` varchar(255) NOT NULL,
  `schedule_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7c8cc8ef5d5668254547eb71b29` (`order_id`),
  CONSTRAINT `FK_7c8cc8ef5d5668254547eb71b29` FOREIGN KEY (`order_id`) REFERENCES `order_details` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: faqs
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `faqs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_type` enum(
  'super_admin',
  'admin',
  'vendor',
  'driver',
  'user',
  'sub_admin'
  ) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `status` int DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: freelance_drivers_payment
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `freelance_drivers_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paid_amount` double DEFAULT '0',
  `schedule_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `driver_id` char(36) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2d2d30826f698745acbb3d8325` (`order_id`),
  KEY `FK_ae53694638db82ec10c72263ccc` (`driver_id`),
  CONSTRAINT `FK_2d2d30826f698745acbb3d83255` FOREIGN KEY (`order_id`) REFERENCES `order_details` (`id`),
  CONSTRAINT `FK_ae53694638db82ec10c72263ccc` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: government_holidays
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `government_holidays` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `vendor_ids` text,
  `date` timestamp NULL DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: membership_paln_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `membership_paln_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `key` int DEFAULT NULL,
  `is_percentage` tinyint NOT NULL DEFAULT '0',
  `is_dollar` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `membership_plan_prices_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_c2786df74ef71db9eb30b25d9b` (`membership_plan_prices_id`),
  CONSTRAINT `FK_c2786df74ef71db9eb30b25d9be` FOREIGN KEY (`membership_plan_prices_id`) REFERENCES `membership_paln_prices` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 41 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: membership_paln_prices
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `membership_paln_prices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `period` int DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `membership_plan_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_427f11e694d0266aac54f7a164` (`membership_plan_id`),
  CONSTRAINT `FK_427f11e694d0266aac54f7a1640` FOREIGN KEY (`membership_plan_id`) REFERENCES `membership_palns` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: membership_palns
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `membership_palns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `product_ids` text,
  `category_ids` text,
  `type` int NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: modules
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 34 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: notification
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_id` varchar(255) DEFAULT NULL,
  `to_ids` text,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `admin_message` varchar(255) DEFAULT NULL,
  `notification_type` int DEFAULT NULL,
  `to_user_type` int DEFAULT NULL,
  `is_admin` tinyint NOT NULL DEFAULT '0',
  `deleted_by` text,
  `readed_by` text,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: order_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_type` int DEFAULT NULL,
  `status` enum(
  'ongoing',
  'pending',
  'refilled',
  'delivered',
  'cancelled',
  'rescheduled',
  'cancelled_by_admin',
  'cancelled_by_driver',
  'emergency_order'
  ) NOT NULL,
  `image_one` varchar(255) DEFAULT NULL,
  `image_two` varchar(255) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `leakage_fee` double DEFAULT NULL,
  `schedule_date` timestamp NULL DEFAULT NULL,
  `index_price` double DEFAULT NULL,
  `vendor_delivery_fee` double DEFAULT NULL,
  `general_delivery_fee` double DEFAULT NULL,
  `vendor_received_amount` double DEFAULT NULL,
  `freelance_driver_received_amount` double DEFAULT '0',
  `driver_cancellation_charge` double DEFAULT NULL,
  `customer_cancellation_charge` double DEFAULT NULL,
  `admin_received_amount` double DEFAULT NULL,
  `refund_amount` double DEFAULT NULL,
  `service_fee` double DEFAULT NULL,
  `service_charge` double DEFAULT NULL,
  `delivery_fees` double DEFAULT NULL,
  `cancellation_reason_other` varchar(255) DEFAULT NULL,
  `sales_tax_percentage` double DEFAULT NULL,
  `sales_tax_amount` double DEFAULT NULL,
  `location_fee` double DEFAULT NULL,
  `cylindersize` double DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `is_delivered` tinyint NOT NULL DEFAULT '0',
  `is_paid` tinyint NOT NULL DEFAULT '0',
  `is_refunded` tinyint NOT NULL DEFAULT '0',
  `stripe_payment_intent_id` varchar(255) DEFAULT NULL,
  `stripe_payment_transfer_id` varchar(255) DEFAULT NULL,
  `promocode_discount_amount` double DEFAULT NULL,
  `promocode_discount_percentage` double DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `vendor_id` char(36) DEFAULT NULL,
  `driver_id` char(36) DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `cylinder_size_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `accessory_id` int DEFAULT NULL,
  `promocodes_id` int DEFAULT NULL,
  `cancellation_reason_id` int DEFAULT NULL,
  `zipcode_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3ff3367344edec5de2355a562e` (`order_id`),
  KEY `IDX_ce1f689e43b39edd9330cadaeb` (`product_id`),
  KEY `IDX_21267863913e32276344f1c937` (`vendor_id`),
  KEY `IDX_75e2aad63331f800ec840f9f82` (`driver_id`),
  KEY `IDX_a05e9dce819702b9689265ce59` (`location_id`),
  KEY `IDX_dbab21192326404c21e270b884` (`cylinder_size_id`),
  KEY `IDX_6504c11ff0d81a959a66f46e5b` (`category_id`),
  KEY `IDX_ac4d0edef798c1ccfaf57a5b2a` (`accessory_id`),
  KEY `IDX_8bc5bb5d148c88656cdba1867b` (`promocodes_id`),
  KEY `IDX_20eaba40d6fb81cacbf6aaa296` (`cancellation_reason_id`),
  KEY `IDX_641c1cf3e5dc30380f35209fff` (`zipcode_id`),
  CONSTRAINT `FK_20eaba40d6fb81cacbf6aaa296f` FOREIGN KEY (`cancellation_reason_id`) REFERENCES `cancellation_reasons` (`id`),
  CONSTRAINT `FK_21267863913e32276344f1c9376` FOREIGN KEY (`vendor_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_3ff3367344edec5de2355a562ee` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FK_641c1cf3e5dc30380f35209fff8` FOREIGN KEY (`zipcode_id`) REFERENCES `zipcodes` (`id`),
  CONSTRAINT `FK_6504c11ff0d81a959a66f46e5bc` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `FK_75e2aad63331f800ec840f9f82e` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_8bc5bb5d148c88656cdba1867b1` FOREIGN KEY (`promocodes_id`) REFERENCES `promocodes` (`id`),
  CONSTRAINT `FK_a05e9dce819702b9689265ce594` FOREIGN KEY (`location_id`) REFERENCES `delivery_locations` (`id`),
  CONSTRAINT `FK_ac4d0edef798c1ccfaf57a5b2a4` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`id`),
  CONSTRAINT `FK_ce1f689e43b39edd9330cadaeb8` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FK_dbab21192326404c21e270b8847` FOREIGN KEY (`cylinder_size_id`) REFERENCES `cylinder_sizes` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: order_status_log
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `order_status_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` enum(
  'ongoing',
  'pending',
  'refilled',
  'delivered',
  'cancelled',
  'rescheduled',
  'cancelled_by_admin',
  'cancelled_by_driver',
  'emergency_order'
  ) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9e4f4db0415153a47094d6a0ae` (`user_id`),
  KEY `IDX_9198a9719572e9e2b880fedfed` (`order_id`),
  CONSTRAINT `FK_9198a9719572e9e2b880fedfed8` FOREIGN KEY (`order_id`) REFERENCES `order_details` (`id`),
  CONSTRAINT `FK_9e4f4db0415153a47094d6a0aed` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: orders
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `invoiced_receipt_url` varchar(255) DEFAULT NULL,
  `cancellation_reason_other` varchar(255) DEFAULT NULL,
  `service_fee` double DEFAULT NULL,
  `service_charge` double DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `admin_total_delivery_fee` double DEFAULT NULL,
  `vendor_total_deliveryfee` double DEFAULT NULL,
  `payment_type` int DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `long` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `stripe_payment_intent_id` varchar(255) DEFAULT NULL,
  `is_paid` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `time_slot_id` int DEFAULT NULL,
  `user_address_id` int DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8941c75f82991baa0d5046ecba` (`time_slot_id`),
  KEY `IDX_645fc4a8c6f039b1ee2985efd3` (`user_address_id`),
  KEY `IDX_a922b820eeef29ac1c6800e826` (`user_id`),
  CONSTRAINT `FK_645fc4a8c6f039b1ee2985efd3e` FOREIGN KEY (`user_address_id`) REFERENCES `user_addresses` (`id`),
  CONSTRAINT `FK_8941c75f82991baa0d5046ecba3` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slots` (`id`),
  CONSTRAINT `FK_a922b820eeef29ac1c6800e826a` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: permissions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `all` tinyint NOT NULL DEFAULT '0',
  `index` tinyint NOT NULL DEFAULT '0',
  `add` tinyint NOT NULL DEFAULT '0',
  `edit` tinyint NOT NULL DEFAULT '0',
  `delete` tinyint NOT NULL DEFAULT '0',
  `view` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `module_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_f10931e7bb05a3b434642ed279` (`role_id`),
  KEY `IDX_738f46bb9ac6ea356f1915835d` (`module_id`),
  CONSTRAINT `FK_738f46bb9ac6ea356f1915835d0` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`),
  CONSTRAINT `FK_f10931e7bb05a3b434642ed2797` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 31 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: products
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `order_type` int DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: products_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `products_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `index_price` double NOT NULL DEFAULT '0',
  `discount` double NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_50acc245866371b959c584c8e4` (`product_id`),
  KEY `IDX_6fe6ff5c2d867e8a2c118a6335` (`category_id`),
  CONSTRAINT `FK_50acc245866371b959c584c8e48` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FK_6fe6ff5c2d867e8a2c118a63356` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: promocodes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `promocodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `promocode` varchar(255) NOT NULL,
  `order_type` int DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `start_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `category_ids` text,
  `customer_ids` text,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1650f86f69a842027bb5ffdab10` (`product_id`),
  CONSTRAINT `FK_1650f86f69a842027bb5ffdab10` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: ratings
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `ratings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rating` int DEFAULT NULL,
  `review` varchar(255) NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `create_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `order_detail_id` int DEFAULT NULL,
  `to_user_id` char(36) DEFAULT NULL,
  `from_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e67884057811d3f9f666c4005f6` (`order_detail_id`),
  KEY `FK_0ab402c56fa2eb451efa04c76fc` (`to_user_id`),
  KEY `FK_753b8e7442994cffcdf77581f4e` (`from_user_id`),
  CONSTRAINT `FK_0ab402c56fa2eb451efa04c76fc` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_753b8e7442994cffcdf77581f4e` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_e67884057811d3f9f666c4005f6` FOREIGN KEY (`order_detail_id`) REFERENCES `order_details` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: roles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: seed
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `seed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: states
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `states` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sales_tax` double NOT NULL,
  `total_counties` int NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `status` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: sub_admin_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `sub_admin_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_size` int DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_272764a3db10948f6a4bafe230` (`user_id`),
  KEY `IDX_91494b5af9c10eb3815f48ea0e` (`role_id`),
  CONSTRAINT `FK_272764a3db10948f6a4bafe2301` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_91494b5af9c10eb3815f48ea0ec` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: time_slots
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `time_slots` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` int DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tokens
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_id` varchar(255) DEFAULT NULL,
  `device_type` varchar(255) DEFAULT NULL,
  `access_token` longtext,
  `refresh_token` longtext,
  `last_login` timestamp NULL DEFAULT NULL,
  `login_count` int DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_8769073e38c365f315426554ca` (`user_id`),
  CONSTRAINT `FK_8769073e38c365f315426554ca5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: user_addresses
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `user_addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `county` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `is_default` tinyint NOT NULL DEFAULT '1',
  `house_no` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `long` varchar(255) DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `zip_code_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7a5100ce0548ef27a6f1533a5c` (`user_id`),
  KEY `IDX_31ed167ed8facc9eae3115a4c9` (`zip_code_id`),
  CONSTRAINT `FK_31ed167ed8facc9eae3115a4c97` FOREIGN KEY (`zip_code_id`) REFERENCES `zipcodes` (`id`),
  CONSTRAINT `FK_7a5100ce0548ef27a6f1533a5ce` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: user_order_statistics
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `user_order_statistics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_of_order_delivered` int DEFAULT '0',
  `no_of_order_cancel` int DEFAULT '0',
  `no_of_order_ongoing` int DEFAULT '0',
  `no_of_order_passed` int DEFAULT '0',
  `no_of_orders` int DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_4454c6220457fd23a4eb8e4df0` (`user_id`),
  CONSTRAINT `FK_4454c6220457fd23a4eb8e4df09` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: user_subscription
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `user_subscription` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `price` double DEFAULT NULL,
  `payment_response` varchar(255) DEFAULT NULL,
  `stripe_payment_intent_id` varchar(255) DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `latest_receipt` varchar(255) DEFAULT NULL,
  `cancelled_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `status` int DEFAULT '0',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `membership_plan_id` int DEFAULT NULL,
  `membership_plan_price_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3c6b79d14e6539ddb486aab80f` (`user_id`),
  KEY `IDX_6e9eb6f1f58508921845e481d1` (`membership_plan_id`),
  KEY `IDX_7530849df7fe07fa7976e55845` (`membership_plan_price_id`),
  CONSTRAINT `FK_3c6b79d14e6539ddb486aab80f5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_6e9eb6f1f58508921845e481d10` FOREIGN KEY (`membership_plan_id`) REFERENCES `membership_palns` (`id`),
  CONSTRAINT `FK_7530849df7fe07fa7976e558459` FOREIGN KEY (`membership_plan_price_id`) REFERENCES `membership_paln_prices` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: user_verification_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `user_verification_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `verified` tinyint NOT NULL DEFAULT '0',
  `token_or_otp` varchar(255) DEFAULT NULL,
  `type` int NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9f6391ad105d44688bcc25c682` (`user_id`),
  CONSTRAINT `FK_9f6391ad105d44688bcc25c6823` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: users
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `users` (
  `id` char(36) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `user_type` enum(
  'super_admin',
  'admin',
  'vendor',
  'driver',
  'user',
  'sub_admin'
  ) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `stripe_customer_id` varchar(255) DEFAULT NULL,
  `stripe_account_id` varchar(255) DEFAULT NULL,
  `user_subscription_count` int DEFAULT '0',
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `admin_address` varchar(255) DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `last_purchase_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vendor_bank_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vendor_bank_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(255) NOT NULL,
  `account_holder_name` varchar(255) NOT NULL,
  `account_number` bigint DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `branch_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ae3d74917e074ae42103cb6da6` (`user_id`),
  CONSTRAINT `FK_ae3d74917e074ae42103cb6da61` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vendor_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vendor_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `business_name` varchar(255) DEFAULT NULL,
  `business_address` varchar(255) DEFAULT NULL,
  `comission_fee` double DEFAULT NULL,
  `leakage_fee` varchar(255) DEFAULT NULL,
  `verification_send_datetime` timestamp NULL DEFAULT NULL,
  `personal_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `low_stock_reminder` int DEFAULT NULL,
  `zipcode_ids` text,
  `accessory_ids` text,
  `is_reset_password` tinyint NOT NULL DEFAULT '0',
  `status` int DEFAULT '1',
  `profile_completed_status` int DEFAULT '1',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_d45a115f63360b929e5e4844ee` (`user_id`),
  CONSTRAINT `FK_d45a115f63360b929e5e4844ee2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vendor_product_pricing_tiers
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vendor_product_pricing_tiers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `vendor_product_id` int DEFAULT NULL,
  `vendor_product_tiers_id` int DEFAULT NULL,
  `cylinder_size_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_c1d9ef38a90f7fb3fff78c4da5` (`vendor_product_id`),
  KEY `IDX_19f7cda24343063f145c188f42` (`vendor_product_tiers_id`),
  KEY `IDX_3910622e905801e622790b48ea` (`cylinder_size_id`),
  KEY `IDX_2450678e2aeab974d2dc975566` (`category_id`),
  CONSTRAINT `FK_19f7cda24343063f145c188f42e` FOREIGN KEY (`vendor_product_tiers_id`) REFERENCES `vendor_product_tiers` (`id`),
  CONSTRAINT `FK_2450678e2aeab974d2dc9755664` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `FK_3910622e905801e622790b48ea4` FOREIGN KEY (`cylinder_size_id`) REFERENCES `cylinder_sizes` (`id`),
  CONSTRAINT `FK_c1d9ef38a90f7fb3fff78c4da5a` FOREIGN KEY (`vendor_product_id`) REFERENCES `vendor_products` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vendor_product_tiers
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vendor_product_tiers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from` int NOT NULL,
  `to` int NOT NULL,
  `position` int DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `vendor_product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_57a77e96f13d33748960545b11` (`vendor_product_id`),
  CONSTRAINT `FK_57a77e96f13d33748960545b11d` FOREIGN KEY (`vendor_product_id`) REFERENCES `vendor_products` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vendor_products
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vendor_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `zipcode_ids` text,
  `is_sales_tax` tinyint NOT NULL DEFAULT '1',
  `is_completed` tinyint NOT NULL DEFAULT '0',
  `order_type` int DEFAULT NULL,
  `vendor_id` char(36) DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_efbf6138b5c9d076d816c4ba4c` (`vendor_id`),
  KEY `IDX_92aa72d2cb0866652f7da6d0c9` (`product_id`),
  CONSTRAINT `FK_92aa72d2cb0866652f7da6d0c9f` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FK_efbf6138b5c9d076d816c4ba4c3` FOREIGN KEY (`vendor_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vendor_schedule
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vendor_schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `max_accept_order_limit` int DEFAULT NULL,
  `day` int DEFAULT NULL,
  `is_checked` tinyint NOT NULL DEFAULT '1',
  `time_slot_id` int DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_67e96930d5e4ac94e7a606ce02` (`time_slot_id`),
  KEY `IDX_9a768c9bb2b70b65d8a79c7569` (`vendor_id`),
  CONSTRAINT `FK_67e96930d5e4ac94e7a606ce028` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slots` (`id`),
  CONSTRAINT `FK_9a768c9bb2b70b65d8a79c7569b` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_details` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vendor_stocks
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vendor_stocks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_at` timestamp NULL DEFAULT NULL,
  `added_stock_qty` double DEFAULT NULL,
  `remaining_stock` double DEFAULT NULL,
  `opening_stock` double DEFAULT NULL,
  `sold_out_stock` double DEFAULT NULL,
  `added_filled` double DEFAULT NULL,
  `added_empty` double DEFAULT NULL,
  `returned_filled` double DEFAULT NULL,
  `returned_empty` double DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `cylinder_size_id` int DEFAULT NULL,
  `accessory_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_d2b29d140ec7463e7edcd27d0e` (`category_id`),
  KEY `IDX_9bbc5eb5630063ad4313156828` (`cylinder_size_id`),
  KEY `IDX_81e679a0a96f2b2d654de01dca` (`accessory_id`),
  KEY `IDX_6c733f17ffcab1cf06b81aff9d` (`product_id`),
  KEY `IDX_6bdf76cb739d6266e0ef793c80` (`vendor_id`),
  CONSTRAINT `FK_6bdf76cb739d6266e0ef793c80d` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_details` (`id`),
  CONSTRAINT `FK_6c733f17ffcab1cf06b81aff9d6` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FK_81e679a0a96f2b2d654de01dca1` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`id`),
  CONSTRAINT `FK_9bbc5eb5630063ad43131568285` FOREIGN KEY (`cylinder_size_id`) REFERENCES `cylinder_sizes` (`id`),
  CONSTRAINT `FK_d2b29d140ec7463e7edcd27d0e6` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vendro_stock_history
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vendro_stock_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_at` timestamp NULL DEFAULT NULL,
  `added_stock_qty` double DEFAULT NULL,
  `return_stock_qty` double DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `cylinder_size_id` int DEFAULT NULL,
  `accessory_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1aa2ab66d96c5c6959adb2b3f0` (`category_id`),
  KEY `IDX_ba52ec71c7cdb4120ece6b8b13` (`cylinder_size_id`),
  KEY `IDX_ce25cd57077e62a8f209cc8bd2` (`accessory_id`),
  KEY `FK_8d7e6a38e757c24630ac5ec585b` (`product_id`),
  KEY `FK_a44954ef13d5cf3e839f7a190d1` (`vendor_id`),
  CONSTRAINT `FK_1aa2ab66d96c5c6959adb2b3f0a` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `FK_8d7e6a38e757c24630ac5ec585b` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FK_a44954ef13d5cf3e839f7a190d1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_details` (`id`),
  CONSTRAINT `FK_ba52ec71c7cdb4120ece6b8b134` FOREIGN KEY (`cylinder_size_id`) REFERENCES `cylinder_sizes` (`id`),
  CONSTRAINT `FK_ce25cd57077e62a8f209cc8bd25` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: zipcodes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `zipcodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `area_name` varchar(255) NOT NULL,
  `zipcode` int NOT NULL,
  `sales_tax` double NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `status` int DEFAULT '1',
  `county_id` int DEFAULT NULL,
  `state_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8a189cdb16235f34b8f8fcfef8` (`county_id`),
  KEY `IDX_44e9961b34280abba0caeb51d2` (`state_id`),
  CONSTRAINT `FK_44e9961b34280abba0caeb51d29` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`),
  CONSTRAINT `FK_8a189cdb16235f34b8f8fcfef89` FOREIGN KEY (`county_id`) REFERENCES `counties` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: accessories
# ------------------------------------------------------------

INSERT INTO
  `accessories` (
    `id`,
    `name`,
    `image`,
    `price`,
    `description`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    1,
    'acc 2',
    'test image',
    2,
    'test description',
    1,
    '2022-08-19 09:22:13.220076',
    '2022-08-19 09:22:22.000000',
    '2022-08-19 09:22:22.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
INSERT INTO
  `accessories` (
    `id`,
    `name`,
    `image`,
    `price`,
    `description`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    2,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    12,
    'TEST ACCESSORY',
    1,
    '2022-08-24 12:38:37.536771',
    '2022-08-24 12:38:37.536771',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: app_settings
# ------------------------------------------------------------

INSERT INTO
  `app_settings` (
    `id`,
    `order_type`,
    `key`,
    `label`,
    `value`,
    `type`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    1,
    NULL,
    'service_charge',
    'Service Charge',
    5,
    2,
    0,
    '2022-08-16 20:07:56.220474',
    '2022-08-16 20:07:56.220474',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `app_settings` (
    `id`,
    `order_type`,
    `key`,
    `label`,
    `value`,
    `type`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    2,
    NULL,
    'service_fee',
    'Service Fee',
    5,
    2,
    0,
    '2022-08-16 20:07:56.221598',
    '2022-08-16 20:07:56.221598',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `app_settings` (
    `id`,
    `order_type`,
    `key`,
    `label`,
    `value`,
    `type`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    3,
    NULL,
    'delivery_fee',
    'Delivery Fee',
    1,
    2,
    0,
    '2022-08-16 20:07:56.222528',
    '2022-08-16 20:07:56.222528',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `app_settings` (
    `id`,
    `order_type`,
    `key`,
    `label`,
    `value`,
    `type`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    4,
    1,
    'cancellation_charge_customer',
    'Cancellation Charge (Customer)',
    1,
    1,
    0,
    '2022-08-16 20:07:56.223391',
    '2022-08-16 20:07:56.223391',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `app_settings` (
    `id`,
    `order_type`,
    `key`,
    `label`,
    `value`,
    `type`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    5,
    1,
    'cancellation_charge_driver',
    'Cancellation Charge (Driver)',
    1,
    1,
    0,
    '2022-08-16 20:07:56.224214',
    '2022-08-16 20:07:56.224214',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `app_settings` (
    `id`,
    `order_type`,
    `key`,
    `label`,
    `value`,
    `type`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    6,
    1,
    'freelance_driver_price',
    'Freelance Driver Price',
    1,
    1,
    0,
    '2022-08-16 20:07:56.225071',
    '2022-08-16 20:07:56.225071',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `app_settings` (
    `id`,
    `order_type`,
    `key`,
    `label`,
    `value`,
    `type`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    7,
    2,
    'cancellation_charge_customer',
    'Cancellation Charge (Customer)',
    1,
    1,
    0,
    '2022-08-16 20:07:56.225895',
    '2022-08-16 20:07:56.225895',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `app_settings` (
    `id`,
    `order_type`,
    `key`,
    `label`,
    `value`,
    `type`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    8,
    2,
    'cancellation_charge_driver',
    'Cancellation Charge (Driver)',
    1,
    1,
    0,
    '2022-08-16 20:07:56.226689',
    '2022-08-16 20:07:56.226689',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `app_settings` (
    `id`,
    `order_type`,
    `key`,
    `label`,
    `value`,
    `type`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    9,
    2,
    'freelance_driver_price',
    'Freelance Driver Price',
    1,
    1,
    0,
    '2022-08-16 20:07:56.227838',
    '2022-08-16 20:07:56.227838',
    NULL,
    NULL,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: cancellation_reasons
# ------------------------------------------------------------

INSERT INTO
  `cancellation_reasons` (
    `id`,
    `reason`,
    `user_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    1,
    'Vehicle Breakdown',
    'driver',
    '2022-08-16 20:07:56.373971',
    '2022-08-16 20:07:56.373971',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `cancellation_reasons` (
    `id`,
    `reason`,
    `user_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    2,
    'I have an accident',
    'driver',
    '2022-08-16 20:07:56.374872',
    '2022-08-16 20:07:56.374872',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `cancellation_reasons` (
    `id`,
    `reason`,
    `user_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    3,
    'Vehicle Punctured',
    'driver',
    '2022-08-16 20:07:56.375796',
    '2022-08-16 20:07:56.375796',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `cancellation_reasons` (
    `id`,
    `reason`,
    `user_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    4,
    'Customer not responding to call(s)',
    'driver',
    '2022-08-16 20:07:56.376654',
    '2022-08-16 20:07:56.376654',
    NULL,
    NULL,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: cart
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: categories
# ------------------------------------------------------------

INSERT INTO
  `categories` (
    `id`,
    `name`,
    `order_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    1,
    'Spare Tank',
    2,
    '2022-08-16 20:07:56.212717',
    '2022-08-16 20:07:56.212717',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `categories` (
    `id`,
    `name`,
    `order_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    2,
    'Exchange',
    2,
    '2022-08-16 20:07:56.215101',
    '2022-08-16 20:07:56.215101',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `categories` (
    `id`,
    `name`,
    `order_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    3,
    'Accessory',
    NULL,
    '2022-08-16 20:07:56.216346',
    '2022-08-16 20:07:56.216346',
    NULL,
    NULL,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: cms_pages
# ------------------------------------------------------------

INSERT INTO
  `cms_pages` (
    `id`,
    `name`,
    `user_type`,
    `content`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    1,
    'Terms & Conditions',
    'user',
    'Terms & Conditions',
    'terms_and_conditions',
    1,
    '2022-08-16 20:07:56.230715',
    '2022-08-16 20:07:56.230715',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `cms_pages` (
    `id`,
    `name`,
    `user_type`,
    `content`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    2,
    'Privacy Policy',
    'user',
    'Privacy Policy',
    'privacy_policy',
    1,
    '2022-08-16 20:07:56.231737',
    '2022-08-16 20:07:56.231737',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `cms_pages` (
    `id`,
    `name`,
    `user_type`,
    `content`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    3,
    'About Us',
    'user',
    'About Us',
    'about_us',
    1,
    '2022-08-16 20:07:56.233162',
    '2022-08-16 20:07:56.233162',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `cms_pages` (
    `id`,
    `name`,
    `user_type`,
    `content`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    4,
    'Terms & Conditions',
    'vendor',
    'Terms & Conditions',
    'terms_and_conditions',
    1,
    '2022-08-16 20:07:56.234626',
    '2022-08-16 20:07:56.234626',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `cms_pages` (
    `id`,
    `name`,
    `user_type`,
    `content`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    5,
    'Privacy Policy',
    'vendor',
    'Privacy Policy',
    'privacy_policy',
    1,
    '2022-08-16 20:07:56.236186',
    '2022-08-16 20:07:56.236186',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `cms_pages` (
    `id`,
    `name`,
    `user_type`,
    `content`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    6,
    'About Us',
    'vendor',
    'About Us',
    'about_us',
    1,
    '2022-08-16 20:07:56.237075',
    '2022-08-16 20:07:56.237075',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `cms_pages` (
    `id`,
    `name`,
    `user_type`,
    `content`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    7,
    'Terms & Conditions',
    'driver',
    'Terms & Conditions',
    'terms_and_conditions',
    1,
    '2022-08-16 20:07:56.239040',
    '2022-08-16 20:07:56.239040',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `cms_pages` (
    `id`,
    `name`,
    `user_type`,
    `content`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    8,
    'Privacy Policy',
    'driver',
    'Privacy Policy',
    'privacy_policy',
    1,
    '2022-08-16 20:07:56.240066',
    '2022-08-16 20:07:56.240066',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `cms_pages` (
    `id`,
    `name`,
    `user_type`,
    `content`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    9,
    'About Us',
    'driver',
    'About Us',
    'about_us',
    1,
    '2022-08-16 20:07:56.242028',
    '2022-08-16 20:07:56.242028',
    NULL,
    NULL,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: contact_us
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: counties
# ------------------------------------------------------------

INSERT INTO
  `counties` (
    `id`,
    `name`,
    `sales_tax_one`,
    `sales_tax_two`,
    `total_zipcodes`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `status`,
    `state_id`
  )
VALUES
  (
    1,
    'Albany',
    10,
    10,
    1,
    '2022-08-20 08:44:10.143048',
    '2022-08-20 08:44:23.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: cylinder_sizes
# ------------------------------------------------------------

INSERT INTO
  `cylinder_sizes` (
    `id`,
    `cylinder_size`,
    `status`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    1,
    10,
    1,
    1,
    '2022-08-24 12:34:51.656708',
    '2022-08-24 12:34:51.656708',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: delivery_locations
# ------------------------------------------------------------

INSERT INTO
  `delivery_locations` (
    `id`,
    `name`,
    `description`,
    `price`,
    `status`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    1,
    'Front Door',
    NULL,
    0,
    1,
    '2022-08-16 20:07:56.368981',
    '2022-08-16 20:07:56.368981',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `delivery_locations` (
    `id`,
    `name`,
    `description`,
    `price`,
    `status`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    2,
    'Left Side in House',
    NULL,
    0,
    1,
    '2022-08-16 20:07:56.370068',
    '2022-08-16 20:07:56.370068',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `delivery_locations` (
    `id`,
    `name`,
    `description`,
    `price`,
    `status`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    3,
    'Right Side in House',
    NULL,
    0,
    1,
    '2022-08-16 20:07:56.370902',
    '2022-08-16 20:07:56.370902',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `delivery_locations` (
    `id`,
    `name`,
    `description`,
    `price`,
    `status`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    4,
    'Back of House',
    'I authorize a reprehensive from Propane Bros. to enter the back yard of my property to complete this order.',
    0,
    1,
    '2022-08-16 20:07:56.371755',
    '2022-08-16 20:07:56.371755',
    NULL,
    NULL,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: documents
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: driver_details
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: driver_payments
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: driver_stocks
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: email_templates
# ------------------------------------------------------------

INSERT INTO
  `email_templates` (
    `id`,
    `subject`,
    `template`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    1,
    'Vendor Registration',
    '<body style=\"margin: 0px; padding: 0px; background-color: #f9f9f9;\">\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#f9f9f9\">\n    <tbody>\n        <tr>\n            <td align=\"top\">\n                <div align=\"center\">\n                    <table width=\"620\" style=\"margin: 30px 0px;\"  cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\">\n                        <tbody>\n                            <tr>\n                                <td style=\"padding: 25px 30px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"background: #fff; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1;\">\n                                        <tbody>\n                                            <tr>\n                                                <td valign=\"middle\" align=\"center\" style=\"padding: 0px;\">\n                                                <img src=\"https://service-pb-s3.s3.ap-south-1.amazonaws.com/propane-brothers-app/logo-big.png\" alt=\"logo\" download=\"false\" style=\"height: 110px;\" />\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <tr>\n                                                    <td style=\"padding: 0px 30px;\">\n                                                        <h3>Hi {name}</h3>\n                                                        <p>Welcome to Propan bros.</p>\n                                                        <p>Use the credentials below to sign-in.</p>\n                                                        <p>Mobile : {mobile}</p>\n                                                        <p>Password : {password}</p>\n                                                        <a href=\"javascript:;\" target=\"_blank\">\r\n <img src=\"https://www.sarangpatel.live/img/app-store.png\" alt=\"App Store\" />\r\n</a>\r\n\n                                                      <a href=\"javascript:;\" target=\"_blank\">\r\n <img src=\"https://www.sarangpatel.live/img/play-store.png\" alt=\"Play Store\" />\r\n</a>\r\n\n                                                    </td>\n                                                </tr>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 20px 30px;\">\n                                                     Note :Please password is auto-generated, kindly, change it once sign in successfully.\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                    Thank you, <br /> Propane Brothers\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-size: 12px; font-style: italic; color: #6c757d; padding: 20px 30px; border-radius: 0px 0px 4px 4px;\">\n                                                    <strong>Note:</strong> The content of this email is intended only for use by the individual or entity to whom it is addressed.\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px; vertical-align: top; background: #f9f9f9; color: #898f95; text-align: center;\"><p style=\"font-size: 14px; padding-top: 15px; margin-bottom: 8px; margin-top: 0px; border-top: 1px solid #ecf4fd;\">&copy; Copyright 2021-22 by Propane Brothers. All Rights Reserved.</p>\n                                                    <small>Please do not reply to this message; it was sent from an unmonitored email address.</small> <br />\n                                                    <small>This message is a service email related to your use of Propane Brothers.</small>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                        </tbody>\n                    </table>\n                </div>\n            </td>\n        </tr>\n    </tbody>\n</table>\n</body>',
    'vendor_registration',
    1,
    '2022-08-16 20:07:56.091817',
    '2022-08-16 20:07:56.091817',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `email_templates` (
    `id`,
    `subject`,
    `template`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    2,
    'Reset Password Request',
    '<body style=\"margin: 0px; padding: 0px; background-color: #f9f9f9;\">\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#f9f9f9\">\n    <tbody>\n        <tr>\n            <td align=\"top\">\n                <div align=\"center\">\n                    <table width=\"620\" style=\"margin: 30px 0px;\"  cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\">\n                        <tbody>\n                            <tr>\n                                <td style=\"padding: 25px 30px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"background: #fff; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1;\">\n                                        <tbody>\n                                            <tr>\n                                                <td valign=\"middle\" align=\"center\" style=\"padding: 0px;\">\n                                                <img src=\"https://service-pb-s3.s3.ap-south-1.amazonaws.com/propane-brothers-app/logo-big.png\" alt=\"logo\" download=\"false\" style=\"height: 110px;\" />\r\n\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                    <h3>Hello {name}</h3>\n                                                    <p style=\"text-align: left\">\n                                                        Someone has requested a link to reset your password for your account at\n                                                        {appname}, and you can do this through the link below.\n                                                      </p>\n                                                      <p style=\"text-align: left\">\n                                                        <a href=\"{link}\" style=\"color: #0186ba\" target=\"_blank\">Change my password</a>\n                                                      </p>\n                                                      <p style=\"text-align: left\">\n                                                        If you didn&#39;t request this, please ignore this email. Your password\n                                                        won&#39;t change until you access the link above and create a new one.\n                                                      </p>\n                                                      <a href=\"javascript:;\" target=\"_blank\">\r\n <img src=\"https://www.sarangpatel.live/img/app-store.png\" alt=\"App Store\" />\r\n</a>\r\n\n                                                      <a href=\"javascript:;\" target=\"_blank\">\r\n <img src=\"https://www.sarangpatel.live/img/play-store.png\" alt=\"Play Store\" />\r\n</a>\r\n\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 20px 30px;\">\n                                                    If you have any questions or concerns, we\'re here to help. Contact us at <br />\n                                                    <a href=\"mailto:admin@propane-bros.com\" style=\"color: #656363;\">{admin}</a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                    Thank you, <br /> Propane Brothers\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-size: 12px; font-style: italic; color: #6c757d; padding: 20px 30px; border-radius: 0px 0px 4px 4px;\">\n                                                    <strong>Note:</strong> The content of this email is intended only for use by the individual or entity to whom it is addressed.\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px; vertical-align: top; background: #f9f9f9; color: #898f95; text-align: center;\"><p style=\"font-size: 14px; padding-top: 15px; margin-bottom: 8px; margin-top: 0px; border-top: 1px solid #ecf4fd;\">&copy; Copyright 2021-22 by Propane Brothers. All Rights Reserved.</p>\n                                                    <small>Please do not reply to this message; it was sent from an unmonitored email address.</small> <br />\n                                                    <small>This message is a service email related to your use of Propane Brothers.</small>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                        </tbody>\n                    </table>\n                </div>\n            </td>\n        </tr>\n    </tbody>\n</table>\n</body>',
    'forgot_password',
    1,
    '2022-08-16 20:07:56.096212',
    '2022-08-16 20:07:56.096212',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `email_templates` (
    `id`,
    `subject`,
    `template`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    3,
    'Verify Your Account',
    '<body style=\"margin: 0px; padding: 0px; background-color: #f9f9f9;\">\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#f9f9f9\">\n    <tbody>\n        <tr>\n            <td align=\"top\">\n                <div align=\"center\">\n                    <table width=\"620\" style=\"margin: 30px 0px;\"  cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\">\n                        <tbody>\n                            <tr>\n                                <td style=\"padding: 25px 30px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"background: #fff; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1;\">\n                                        <tbody>\n                                            <tr>\n                                                <td valign=\"middle\" align=\"center\" style=\"padding: 0px;\">\n                                                <img src=\"https://service-pb-s3.s3.ap-south-1.amazonaws.com/propane-brothers-app/logo-big.png\" alt=\"logo\" download=\"false\" style=\"height: 110px;\" />\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td style=\"padding-top: 25px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px 10px 30px;\" colspan=\"3\">\n                                                    <span style=\"font-size: 18px; display: block;\">Hi {name},</span>\n                                                    <p style=\"margin-top: 5px;\">Welcome to Propane Brothers. </p>\n                                                    <p style=\"margin-bottom: 0px;\">Please verify your account using link below. </p>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 10px 30px 20px 30px;\" colspan=\"3\">\n                                                    <a href=\"{link}\" style=\"display: inline-block; background-color: #cc5300; padding: 8px 24px; border: 1px solid #cc5300; text-decoration: none; color: #fff; border-radius: 4px;\" target=\"_blank\">Verify</a>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                    <p style=\"margin-top: 0px; margin-bottom: 20px;\"> We hope you love our service as much as we enjoy delivering to you.</p>\n                                                    <a href=\"javascript:;\" target=\"_blank\"> <img src=\"https://www.sarangpatel.live/img/app-store.png\" alt=\"App Store\" /></a>\n                                                    <a href=\"javascript:;\" target=\"_blank\"> <img src=\"https://www.sarangpatel.live/img/play-store.png\" alt=\"Play Store\" /></a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 15px 30px 20px;\">\n                                                    If you have any questions or concerns, we\'re here to help. Contact us at <br />\n                                                    <a href=\"mailto:admin@propane-bros.com\" style=\"color: #656363;\">{admin}</a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                    Thank you, <br /> Propane Brothers\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-size: 12px; font-style: italic; color: #6c757d; padding: 20px 30px; border-radius: 0px 0px 4px 4px;\">\n                                                    <strong>Note:</strong> The content of this email is intended only for use by the individual or entity to whom it is addressed.\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px; vertical-align: top; background: #f9f9f9; color: #898f95; text-align: center;\"><p style=\"font-size: 14px; padding-top: 15px; margin-bottom: 8px; margin-top: 0px; border-top: 1px solid #ecf4fd;\">&copy; Copyright 2021-22 by Propane Brothers. All Rights Reserved.</p>\n                                                    <small>Please do not reply to this message; it was sent from an unmonitored email address.</small> <br />\n                                                    <small>This message is a service email related to your use of Propane Brothers.</small>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                        </tbody>\n                    </table>\n                </div>\n            </td>\n        </tr>\n    </tbody>\n</table>\n</body>',
    'email_verify',
    1,
    '2022-08-16 20:07:56.104077',
    '2022-08-16 20:07:56.104077',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `email_templates` (
    `id`,
    `subject`,
    `template`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    4,
    'Change Password',
    '<body style=\"margin: 0px; padding: 0px; background-color: #f9f9f9;\">\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#f9f9f9\">\n    <tbody>\n        <tr>\n            <td align=\"top\">\n                <div align=\"center\">\n                    <table width=\"620\" style=\"margin: 30px 0px;\"  cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\">\n                        <tbody>\n                            <tr>\n                                <td style=\"padding: 25px 30px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"background: #fff; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1;\">\n                                        <tbody>\n                                            <tr>\n                                                <td valign=\"middle\" align=\"center\" style=\"padding: 0px;\">\n                                                <img src=\"https://service-pb-s3.s3.ap-south-1.amazonaws.com/propane-brothers-app/logo-big.png\" alt=\"logo\" download=\"false\" style=\"height: 110px;\" />\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td style=\"padding-top: 25px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px 10px 30px;\" colspan=\"3\">\n                                                    <span style=\"font-size: 18px; display: block;\">Hi {name},</span>\n                                                    <p style=\"margin-top: 5px;\">Your password changed successfully.</p>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                <a href=\"javascript:;\" target=\"_blank\"><img src=\"https://www.sarangpatel.live/img/app-store.png\" alt=\"App Store\" /></a>\n                                                <a href=\"javascript:;\" target=\"_blank\"><img src=\"https://www.sarangpatel.live/img/play-store.png\" alt=\"Play Store\" /></a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 15px 30px 20px;\">\n                                                    If you have any questions or concerns, we\'re here to help. Contact us at <br />\n                                                    <a href=\"mailto:admin@propane-bros.com\" style=\"color: #656363;\">{admin}</a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                    Thank you, <br /> Propane Brothers\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-size: 12px; font-style: italic; color: #6c757d; padding: 20px 30px; border-radius: 0px 0px 4px 4px;\">\n                                                    <strong>Note:</strong> The content of this email is intended only for use by the individual or entity to whom it is addressed.\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px; vertical-align: top; background: #f9f9f9; color: #898f95; text-align: center;\"><p style=\"font-size: 14px; padding-top: 15px; margin-bottom: 8px; margin-top: 0px; border-top: 1px solid #ecf4fd;\">&copy; Copyright 2021-22 by Propane Brothers. All Rights Reserved.</p>\n                                                    <small>Please do not reply to this message; it was sent from an unmonitored email address.</small> <br />\n                                                    <small>This message is a service email related to your use of Propane Brothers.</small>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                        </tbody>\n                    </table>\n                </div>\n            </td>\n        </tr>\n    </tbody>\n</table>\n</body>',
    'change_password',
    1,
    '2022-08-16 20:07:56.108682',
    '2022-08-16 20:07:56.108682',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `email_templates` (
    `id`,
    `subject`,
    `template`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    5,
    'New Inquiry (Contact us) For Admin',
    '<body style=\"margin: 0px; padding: 0px; background-color: #f9f9f9;\">\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#f9f9f9\">\n    <tbody>\n        <tr>\n            <td align=\"top\">\n                <div align=\"center\">\n                    <table width=\"620\" style=\"margin: 30px 0px;\"  cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\">\n                        <tbody>\n                            <tr>\n                                <td style=\"padding: 25px 30px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"background: #fff; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1;\">\n                                        <tbody>\n                                            <tr>\n                                                <td valign=\"middle\" align=\"center\" style=\"padding: 0px;\">\n                                                <img src=\"https://service-pb-s3.s3.ap-south-1.amazonaws.com/propane-brothers-app/logo-big.png\" alt=\"logo\" download=\"false\" style=\"height: 110px;\" />\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                    <h3>Hi {name}</h3>\n                                                    <p>you have one inqury.</p>\n                                                    <p>Email : <strong>{email}</strong></p>\n                                                    <p>Subject :&nbsp;<strong>{subject}</strong></p>\n                                                    <p>Message :&nbsp;<strong>{message}</strong></p>\n                                                    <a href=\"javascript:;\" target=\"_blank\"><img src=\"https://www.sarangpatel.live/img/app-store.png\" alt=\"App Store\"/></a>\n                                                      <a href=\"javascript:;\" target=\"_blank\"><img src=\"https://www.sarangpatel.live/img/play-store.png\" alt=\"Play Store\"/></a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                    Thank you, <br /> Propane Brothers\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-size: 12px; font-style: italic; color: #6c757d; padding: 20px 30px; border-radius: 0px 0px 4px 4px;\">\n                                                    <strong>Note:</strong> The content of this email is intended only for use by the individual or entity to whom it is addressed.\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px; vertical-align: top; background: #f9f9f9; color: #898f95; text-align: center;\"><p style=\"font-size: 14px; padding-top: 15px; margin-bottom: 8px; margin-top: 0px; border-top: 1px solid #ecf4fd;\">&copy; Copyright 2021-22 by Propane Brothers. All Rights Reserved.</p>\n                                                    <small>Please do not reply to this message; it was sent from an unmonitored email address.</small> <br />\n                                                    <small>This message is a service email related to your use of Propane Brothers.</small>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                        </tbody>\n                    </table>\n                </div>\n            </td>\n        </tr>\n    </tbody>\n</table>\n</body>',
    'contact_us',
    1,
    '2022-08-16 20:07:56.112464',
    '2022-08-16 20:07:56.112464',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `email_templates` (
    `id`,
    `subject`,
    `template`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    6,
    'Profile Request Rejection Mail',
    '<body style=\"margin: 0px; padding: 0px; background-color: #f9f9f9;\">\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#f9f9f9\">\n    <tbody>\n        <tr>\n            <td align=\"top\">\n                <div align=\"center\">\n                    <table width=\"620\" style=\"margin: 30px 0px;\"  cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\">\n                        <tbody>\n                            <tr>\n                                <td style=\"padding: 25px 30px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"background: #fff; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1;\">\n                                        <tbody>\n                                            <tr>\n                                                <td valign=\"middle\" align=\"center\" style=\"padding: 0px;\">\n                                                <img src=\"https://service-pb-s3.s3.ap-south-1.amazonaws.com/propane-brothers-app/logo-big.png\" alt=\"logo\" download=\"false\" style=\"height: 110px;\" />\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td style=\"padding-top: 25px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px 10px 30px;\" colspan=\"3\">\n                                                    <span style=\"font-size: 18px; display: block;\">Dear {name},</span>\n                                                    <p style=\"margin-top: 5px;\">Reason for which your profile got rejected is : {comment}</p>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                <a href=\"javascript:;\" target=\"_blank\"><img src=\"https://www.sarangpatel.live/img/app-store.png\" alt=\"App Store\" /></a>\n                                                <a href=\"javascript:;\" target=\"_blank\"><img src=\"https://www.sarangpatel.live/img/play-store.png\" alt=\"Play Store\" /></a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 15px 30px 20px;\">\n                                                    If you have any questions or concerns, we\'re here to help. Contact us at <br />\n                                                    <a href=\"mailto:admin@propane-bros.com\" style=\"color: #656363;\">{admin}</a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                    Thank you, <br /> Propane Brothers\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-size: 12px; font-style: italic; color: #6c757d; padding: 20px 30px; border-radius: 0px 0px 4px 4px;\">\n                                                    <strong>Note:</strong> The content of this email is intended only for use by the individual or entity to whom it is addressed.\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px; vertical-align: top; background: #f9f9f9; color: #898f95; text-align: center;\"><p style=\"font-size: 14px; padding-top: 15px; margin-bottom: 8px; margin-top: 0px; border-top: 1px solid #ecf4fd;\">&copy; Copyright 2021-22 by Propane Brothers. All Rights Reserved.</p>\n                                                    <small>Please do not reply to this message; it was sent from an unmonitored email address.</small> <br />\n                                                    <small>This message is a service email related to your use of Propane Brothers.</small>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                        </tbody>\n                    </table>\n                </div>\n            </td>\n        </tr>\n    </tbody>\n</table>\n</body>',
    'Reason',
    1,
    '2022-08-16 20:07:56.115412',
    '2022-08-16 20:07:56.115412',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `email_templates` (
    `id`,
    `subject`,
    `template`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    7,
    'Profile Request Acceptance Mail',
    '<body style=\"margin: 0px; padding: 0px; background-color: #f9f9f9;\">\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#f9f9f9\">\n    <tbody>\n        <tr>\n            <td align=\"top\">\n                <div align=\"center\">\n                    <table width=\"620\" style=\"margin: 30px 0px;\"  cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\">\n                        <tbody>\n                            <tr>\n                                <td style=\"padding: 25px 30px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"background: #fff; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1;\">\n                                        <tbody>\n                                            <tr>\n                                                <td valign=\"middle\" align=\"center\" style=\"padding: 0px;\">\n                                                <img src=\"https://service-pb-s3.s3.ap-south-1.amazonaws.com/propane-brothers-app/logo-big.png\" alt=\"logo\" download=\"false\" style=\"height: 110px;\" />\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td style=\"padding-top: 25px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px 10px 30px;\" colspan=\"3\">\n                                                    <span style=\"font-size: 18px; display: block;\">Dear {name},</span>\n                                                    <p style=\"margin-top: 5px;\">Your profile request is accepted by admin, now you can further proceed with this application.</p>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                <a href=\"javascript:;\" target=\"_blank\"><img src=\"https://www.sarangpatel.live/img/app-store.png\" alt=\"App Store\" /></a>\n                                                <a href=\"javascript:;\" target=\"_blank\"><img src=\"https://www.sarangpatel.live/img/play-store.png\" alt=\"Play Store\" /></a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 15px 30px 20px;\">\n                                                    If you have any questions or concerns, we\'re here to help. Contact us at <br />\n                                                    <a href=\"mailto:admin@propane-bros.com\" style=\"color: #656363;\">{admin}</a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                    Thank you, <br /> Propane Brothers\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-size: 12px; font-style: italic; color: #6c757d; padding: 20px 30px; border-radius: 0px 0px 4px 4px;\">\n                                                    <strong>Note:</strong> The content of this email is intended only for use by the individual or entity to whom it is addressed.\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px; vertical-align: top; background: #f9f9f9; color: #898f95; text-align: center;\"><p style=\"font-size: 14px; padding-top: 15px; margin-bottom: 8px; margin-top: 0px; border-top: 1px solid #ecf4fd;\">&copy; Copyright 2021-22 by Propane Brothers. All Rights Reserved.</p>\n                                                    <small>Please do not reply to this message; it was sent from an unmonitored email address.</small> <br />\n                                                    <small>This message is a service email related to your use of Propane Brothers.</small>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                        </tbody>\n                    </table>\n                </div>\n            </td>\n        </tr>\n    </tbody>\n</table>\n</body>',
    'Accepted',
    1,
    '2022-08-16 20:07:56.121110',
    '2022-08-16 20:07:56.121110',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `email_templates` (
    `id`,
    `subject`,
    `template`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    8,
    'Profile Approval Mail',
    '<body style=\"margin: 0px; padding: 0px; background-color: #f9f9f9;\">\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#f9f9f9\">\n    <tbody>\n        <tr>\n            <td align=\"top\">\n                <div align=\"center\">\n                    <table width=\"620\" style=\"margin: 30px 0px;\"  cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\">\n                        <tbody>\n                            <tr>\n                                <td style=\"padding: 25px 30px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"background: #fff; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1;\">\n                                        <tbody>\n                                            <tr>\n                                                <td valign=\"middle\" align=\"center\" style=\"padding: 0px;\">\n                                                <img src=\"https://service-pb-s3.s3.ap-south-1.amazonaws.com/propane-brothers-app/logo-big.png\" alt=\"logo\" download=\"false\" style=\"height: 110px;\" />\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td style=\"padding-top: 25px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px 10px 30px;\" colspan=\"3\">\n                                                    <span style=\"font-size: 18px; display: block;\">Dear {name},</span>\n                                                    <p style=\"margin-top: 5px;\">Your profile has been sent to admin for re-approval, you will receive mail from admin when it will Approve.</p>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                <a href=\"javascript:;\" target=\"_blank\"><img src=\"https://www.sarangpatel.live/img/app-store.png\" alt=\"App Store\" /></a>\n                                                <a href=\"javascript:;\" target=\"_blank\"><img src=\"https://www.sarangpatel.live/img/play-store.png\" alt=\"Play Store\" /></a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 15px 30px 20px;\">\n                                                    If you have any questions or concerns, we\'re here to help. Contact us at <br />\n                                                    <a href=\"mailto:admin@propane-bros.com\" style=\"color: #656363;\">{admin}</a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                    Thank you, <br /> Propane Brothers\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-size: 12px; font-style: italic; color: #6c757d; padding: 20px 30px; border-radius: 0px 0px 4px 4px;\">\n                                                    <strong>Note:</strong> The content of this email is intended only for use by the individual or entity to whom it is addressed.\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px; vertical-align: top; background: #f9f9f9; color: #898f95; text-align: center;\"><p style=\"font-size: 14px; padding-top: 15px; margin-bottom: 8px; margin-top: 0px; border-top: 1px solid #ecf4fd;\">&copy; Copyright 2021-22 by Propane Brothers. All Rights Reserved.</p>\n                                                    <small>Please do not reply to this message; it was sent from an unmonitored email address.</small> <br />\n                                                    <small>This message is a service email related to your use of Propane Brothers.</small>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                        </tbody>\n                    </table>\n                </div>\n            </td>\n        </tr>\n    </tbody>\n</table>\n</body>',
    'Pending',
    1,
    '2022-08-16 20:07:56.124192',
    '2022-08-16 20:07:56.124192',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `email_templates` (
    `id`,
    `subject`,
    `template`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    9,
    'Unblock Mail',
    '<body style=\"margin: 0px; padding: 0px; background-color: #f9f9f9;\">\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#f9f9f9\">\n    <tbody>\n        <tr>\n            <td align=\"top\">\n                <div align=\"center\">\n                    <table width=\"620\" style=\"margin: 30px 0px;\"  cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\">\n                        <tbody>\n                            <tr>\n                                <td style=\"padding: 25px 30px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"background: #fff; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1;\">\n                                        <tbody>\n                                            <tr>\n                                                <td valign=\"middle\" align=\"center\" style=\"padding: 0px;\">\n                                                <img src=\"https://service-pb-s3.s3.ap-south-1.amazonaws.com/propane-brothers-app/logo-big.png\" alt=\"logo\" download=\"false\" style=\"height: 110px;\" />\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td style=\"padding-top: 25px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px 10px 30px;\" colspan=\"3\">\n                                                    <span style=\"font-size: 18px; display: block;\">Dear {name},</span>\n                                                    <p style=\"margin-top: 5px;\">Your account is activated by admin. </p>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                <a href=\"javascript:;\" target=\"_blank\"><img src=\"https://www.sarangpatel.live/img/app-store.png\" alt=\"App Store\" /></a>\n                                                <a href=\"javascript:;\" target=\"_blank\"><img src=\"https://www.sarangpatel.live/img/play-store.png\" alt=\"Play Store\" /></a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 15px 30px 20px;\">\n                                                    If you have any questions or concerns, we\'re here to help. Contact us at <br />\n                                                    <a href=\"mailto:admin@propane-bros.com\" style=\"color: #656363;\">{admin}</a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                    Thank you, <br /> Propane Brothers\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-size: 12px; font-style: italic; color: #6c757d; padding: 20px 30px; border-radius: 0px 0px 4px 4px;\">\n                                                    <strong>Note:</strong> The content of this email is intended only for use by the individual or entity to whom it is addressed.\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px; vertical-align: top; background: #f9f9f9; color: #898f95; text-align: center;\"><p style=\"font-size: 14px; padding-top: 15px; margin-bottom: 8px; margin-top: 0px; border-top: 1px solid #ecf4fd;\">&copy; Copyright 2021-22 by Propane Brothers. All Rights Reserved.</p>\n                                                    <small>Please do not reply to this message; it was sent from an unmonitored email address.</small> <br />\n                                                    <small>This message is a service email related to your use of Propane Brothers.</small>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                        </tbody>\n                    </table>\n                </div>\n            </td>\n        </tr>\n    </tbody>\n</table>\n</body>',
    'Unblock',
    1,
    '2022-08-16 20:07:56.127226',
    '2022-08-16 20:07:56.127226',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `email_templates` (
    `id`,
    `subject`,
    `template`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    10,
    'Sub Admin Registration',
    '<body style=\"margin: 0px; padding: 0px; background-color: #f9f9f9;\">\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#f9f9f9\">\n    <tbody>\n        <tr>\n            <td align=\"top\">\n                <div align=\"center\">\n                    <table width=\"620\" style=\"margin: 30px 0px;\"  cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\">\n                        <tbody>\n                            <tr>\n                                <td style=\"padding: 25px 30px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"background: #fff; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1;\">\n                                        <tbody>\n                                            <tr>\n                                                <td valign=\"middle\" align=\"center\" style=\"padding: 0px;\">\n                                                <img src=\"https://service-pb-s3.s3.ap-south-1.amazonaws.com/propane-brothers-app/logo-big.png\" alt=\"logo\" download=\"false\" style=\"height: 110px;\" />\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <tr>\n                                                    <td style=\"padding: 0px 30px;\">\n                                                        <h3>Hi {name}</h3>\n                                                        <p>Welcome to Propan bros.</p>\n                                                        <p>Use the credentials below to sign-in.</p>\n                                                        <p>Mobile : {mobile}</p>\n                                                        <p>Password : {password}</p>\n                                                        <a href=\"javascript:;\" target=\"_blank\">\r\n <img src=\"https://www.sarangpatel.live/img/app-store.png\" alt=\"App Store\" />\r\n</a>\r\n\n                                                      <a href=\"javascript:;\" target=\"_blank\">\r\n <img src=\"https://www.sarangpatel.live/img/play-store.png\" alt=\"Play Store\" />\r\n</a>\r\n\n                                                    </td>\n                                                </tr>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 20px 30px;\">\n                                                     Note :Please password is auto-generated, kindly, change it once sign in successfully.\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                    Thank you, <br /> Propane Brothers\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-size: 12px; font-style: italic; color: #6c757d; padding: 20px 30px; border-radius: 0px 0px 4px 4px;\">\n                                                    <strong>Note:</strong> The content of this email is intended only for use by the individual or entity to whom it is addressed.\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px; vertical-align: top; background: #f9f9f9; color: #898f95; text-align: center;\"><p style=\"font-size: 14px; padding-top: 15px; margin-bottom: 8px; margin-top: 0px; border-top: 1px solid #ecf4fd;\">&copy; Copyright 2021-22 by Propane Brothers. All Rights Reserved.</p>\n                                                    <small>Please do not reply to this message; it was sent from an unmonitored email address.</small> <br />\n                                                    <small>This message is a service email related to your use of Propane Brothers.</small>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                        </tbody>\n                    </table>\n                </div>\n            </td>\n        </tr>\n    </tbody>\n</table>\n</body>',
    'subadmin_registration',
    1,
    '2022-08-16 20:07:56.130355',
    '2022-08-16 20:07:56.130355',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `email_templates` (
    `id`,
    `subject`,
    `template`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    11,
    'order place',
    '<body style=\"margin: 0px; padding: 0px; background-color: #f9f9f9;\">\n  <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#f9f9f9\">\n      <tbody>\n          <tr>\n              <td align=\"top\">\n                  <div align=\"center\">\n                      <table width=\"620\" style=\"margin: 30px 0px;\"  cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\">\n                          <tbody>\n                              <tr>\n                                  <td style=\"padding: 25px 30px;\">\n                                      <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"background: #fff; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1;\">\n                                          <tbody>\n                                              <tr>\n                                                  <td valign=\"middle\" align=\"center\" style=\"padding: 0px;\">\n                                                      <img src=\"https://service-pb-s3.s3.ap-south-1.amazonaws.com/propane-brothers-app/logo-big.png\" alt=\"logo\" download=\"false\" style=\"height: 110px;\" />\n                                                  </td>\n                                              </tr>\n                                          </tbody>\n                                      </table>\n                                  </td>\n                              </tr>\n                              <tr>\n                                  <td style=\"padding-top: 25px;\">\n                                      <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                          <tbody>\n                                              <tr>\n                                                  <td style=\"padding: 0px 30px 10px 30px;\" colspan=\"3\">\n                                                      <span style=\"font-size: 18px; display: block;\">Hi {name},</span>\n                                                      <p style=\"margin-top: 5px;\">Thank you for choosing Propane Brothers. </p>\n                                                      <p style=\"margin-bottom: 0px;\">Your order has been placed successfully. </p>\n                                                  </td>\n                                              </tr>\n                                              <tr>\n                                                  <td style=\"padding: 10px 30px 20px 30px;\" colspan=\"3\">\n                                                      <p style=\"border-top: 1px solid #ecf4fd; margin: 0px;\"></p>\n                                                      <p style=\"margin-bottom: 0px;\">Here\'s a summary of your order : </p>\n                                                  </td>\n                                              </tr>\n                                              <tr>\n                                                  <td style=\"padding: 0px 30px;\" colspan=\"3\">\n                                                      <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5; border-collapse: collapse; margin-bottom: 10px;\">\n                                                          <tbody>\n                                                              <tr style=\"background-color: #EEF0F3;\">\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Order ID</td>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">{invoiceNumber}</td>\n                                                              </tr>\n                                                              <tr>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Delivery Address</td>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">{address}</td>\n                                                              </tr>\n                                                              <tr style=\"background-color: #EEF0F3;\">\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Order Quantity</td>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">{qty}</td>\n                                                              </tr>\n                                                              <tr>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Delivery Fee</td>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">{deliverFee}</td>\n                                                              </tr>\n                                                              <tr style=\"background-color: #EEF0F3;\">\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Sales Tax 7%</td>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">{salesTax}</td>\n                                                              </tr>\n                                                              <tr>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Service Fee</td>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">{serviceFee}</td>\n                                                              </tr>\n                                                              <tr style=\"background-color: #EEF0F3;\">\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Service Charge</td>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">{serviceCharge}</td>\n                                                              </tr>\n                                                              <tr>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Promocode</td>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">{promocode}</td>\n                                                              </tr>\n                                                              <tr style=\"background-color: #EEF0F3;\">\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Promocode Discount</td>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">{promocodeDiscount}</td>\n                                                              </tr>\n                                                              <tr>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Total</td>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; font-size: 20px; font-weight: 700;\">\n                                                                      {total}\n                                                                  </td>\n                                                              </tr>\n                                                          </tbody>\n                                                      </table>\n                                                  </td>\n                                              </tr>\n                                              <tr>\n                                                  <td style=\"padding: 20px 30px;\" colspan=\"3\">\n                                                      <p style=\"border-bottom: 1px solid #ecf4fd; margin: 0px;\"></p>\n                                                  </td>\n                                              </tr>\n                                          </tbody>\n                                      </table>\n                                  </td>\n                              </tr>\n                              <tr>\n                                  <td>\n                                      <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                          <tbody>\n                                              <tr>\n                                                  <td style=\"padding: 0px 30px;\">\n                                                      <p style=\"margin-top: 0px;\"> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s.</p>\n                                                      <a href=\"javascript:;\" target=\"_blank\"> <img src=\"https://www.sarangpatel.live/img/app-store.png\" alt=\"App Store\" /></a>\n                                                      <a href=\"javascript:;\" target=\"_blank\"> <img src=\"https://www.sarangpatel.live/img/play-store.png\" alt=\"Play Store\" /></a>\n                                                  </td>\n                                              </tr>\n                                              <tr>\n                                                  <td style=\"padding: 20px 30px;\">\n                                                      If you have any questions or concerns, we\'re here to help. Contact us at <br />\n                                                      <a href=\"mailto:admin@propane-bros.com\" style=\"color: #656363;\">{admin}</a>\n                                                  </td>\n                                              </tr>\n                                              <tr>\n                                                  <td style=\"padding: 0px 30px;\">\n                                                      Thank you, <br /> Propane Brothers\n                                                  </td>\n                                              </tr>\n                                              <tr>\n                                                  <td style=\"font-size: 12px; font-style: italic; color: #6c757d; padding: 20px 30px; border-radius: 0px 0px 4px 4px;\">\n                                                      <strong>Note:</strong> The content of this email is intended only for use by the individual or entity to whom it is addressed.\n                                                  </td>\n                                              </tr>\n                                          </tbody>\n                                      </table>\n                                  </td>\n                              </tr>\n                              <tr>\n                                  <td>\n                                      <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                          <tbody>\n                                              <tr>\n                                                  <td style=\"padding: 0px 30px; vertical-align: top; background: #f9f9f9; color: #898f95; text-align: center;\"><p style=\"font-size: 14px; padding-top: 15px; margin-bottom: 8px; margin-top: 0px; border-top: 1px solid #ecf4fd;\">&copy; Copyright 2021-22 by Propane Brothers. All Rights Reserved.</p>\n                                                      <small>Please do not reply to this message; it was sent from an unmonitored email address.</small> <br />\n                                                      <small>This message is a service email related to your use of Propane Brothers.</small>\n                                                  </td>\n                                              </tr>\n                                          </tbody>\n                                      </table>\n                                  </td>\n                              </tr>\n                          </tbody>\n                      </table>\n                  </div>\n              </td>\n          </tr>\n      </tbody>\n  </table>\n  </body>',
    'order_place',
    1,
    '2022-08-16 20:07:56.134598',
    '2022-08-16 20:07:56.134598',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `email_templates` (
    `id`,
    `subject`,
    `template`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    12,
    'order deliver',
    '<body style=\"margin: 0px; padding: 0px; background-color: #f9f9f9;\">\n  <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#f9f9f9\">\n      <tbody>\n          <tr>\n              <td align=\"top\">\n                  <div align=\"center\">\n                      <table width=\"620\" style=\"margin: 30px 0px;\"  cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\">\n                          <tbody>\n                              <tr>\n                                  <td style=\"padding: 25px 30px;\">\n                                      <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"background: #fff; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1;\">\n                                          <tbody>\n                                              <tr>\n                                                  <td valign=\"middle\" align=\"center\" style=\"padding: 0px;\">\n                                                      <img src=\"https://service-pb-s3.s3.ap-south-1.amazonaws.com/propane-brothers-app/logo-big.png\" alt=\"logo\" download=\"false\" style=\"height: 110px;\" />\n                                                  </td>\n                                              </tr>\n                                          </tbody>\n                                      </table>\n                                  </td>\n                              </tr>\n                              <tr>\n                                  <td style=\"padding-top: 25px;\">\n                                      <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                          <tbody>\n                                              <tr>\n                                                  <td style=\"padding: 0px 30px 10px 30px;\" colspan=\"3\">\n                                                      <span style=\"font-size: 18px; display: block;\">Hi {name},</span>\n                                                      <p style=\"margin-top: 5px;\">Thank you for choosing Propane Brothers. </p>\n                                                      <p style=\"margin-bottom: 0px;\">Your order has been Delivered successfully. </p>\n                                                  </td>\n                                              </tr>\n                                              <tr>\n                                                  <td style=\"padding: 10px 30px 20px 30px;\" colspan=\"3\">\n                                                      <p style=\"border-top: 1px solid #ecf4fd; margin: 0px;\"></p>\n                                                      <p style=\"margin-bottom: 0px;\">Here\'s a summary of your order : </p>\n                                                  </td>\n                                              </tr>\n                                              <tr>\n                                                  <td style=\"padding: 0px 30px;\" colspan=\"3\">\n                                                      <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5; border-collapse: collapse; margin-bottom: 10px;\">\n                                                          <tbody>\n                                                              <tr style=\"background-color: #EEF0F3;\">\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Order ID</td>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">{invoiceNumber}</td>\n                                                              </tr>\n                                                              <tr>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Delivery Address</td>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">{address}</td>\n                                                              </tr>\n                                                              <tr style=\"background-color: #EEF0F3;\">\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Order Quantity</td>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">{qty}</td>\n                                                              </tr>\n                                                              <tr>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Delivery Fee</td>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">{deliverFee}</td>\n                                                              </tr>\n                                                              <tr style=\"background-color: #EEF0F3;\">\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Sales Tax 7%</td>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">{salesTax}</td>\n                                                              </tr>\n                                                              <tr>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Service Fee</td>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">{serviceFee}</td>\n                                                              </tr>\n                                                              <tr style=\"background-color: #EEF0F3;\">\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Service Charge</td>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">{serviceCharge}</td>\n                                                              </tr>\n                                                              <tr>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Promocode</td>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">{promocode}</td>\n                                                              </tr>\n                                                              <tr style=\"background-color: #EEF0F3;\">\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Promocode Discount</td>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">{promocodeDiscount}</td>\n                                                              </tr>\n                                                              <tr>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Total</td>\n                                                                  <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; font-size: 20px; font-weight: 700;\">\n                                                                      {total}\n                                                                  </td>\n                                                              </tr>\n                                                          </tbody>\n                                                      </table>\n                                                  </td>\n                                              </tr>\n                                              <tr>\n                                                  <td style=\"padding: 20px 30px;\" colspan=\"3\">\n                                                      <p style=\"border-bottom: 1px solid #ecf4fd; margin: 0px;\"></p>\n                                                  </td>\n                                              </tr>\n                                          </tbody>\n                                      </table>\n                                  </td>\n                              </tr>\n                              <tr>\n                                  <td>\n                                      <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                          <tbody>\n                                              <tr>\n                                                  <td style=\"padding: 0px 30px;\">\n                                                      <p style=\"margin-top: 0px;\"> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s.</p>\n                                                      <a href=\"javascript:;\" target=\"_blank\"> <img src=\"https://www.sarangpatel.live/img/app-store.png\" alt=\"App Store\" /></a>\n                                                      <a href=\"javascript:;\" target=\"_blank\"> <img src=\"https://www.sarangpatel.live/img/play-store.png\" alt=\"Play Store\" /></a>\n                                                  </td>\n                                              </tr>\n                                              <tr>\n                                                  <td style=\"padding: 20px 30px;\">\n                                                      If you have any questions or concerns, we\'re here to help. Contact us at <br />\n                                                      <a href=\"mailto:admin@propane-bros.com\" style=\"color: #656363;\">{admin}</a>\n                                                  </td>\n                                              </tr>\n                                              <tr>\n                                                  <td style=\"padding: 0px 30px;\">\n                                                      Thank you, <br /> Propane Brothers\n                                                  </td>\n                                              </tr>\n                                              <tr>\n                                                  <td style=\"font-size: 12px; font-style: italic; color: #6c757d; padding: 20px 30px; border-radius: 0px 0px 4px 4px;\">\n                                                      <strong>Note:</strong> The content of this email is intended only for use by the individual or entity to whom it is addressed.\n                                                  </td>\n                                              </tr>\n                                          </tbody>\n                                      </table>\n                                  </td>\n                              </tr>\n                              <tr>\n                                  <td>\n                                      <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                          <tbody>\n                                              <tr>\n                                                  <td style=\"padding: 0px 30px; vertical-align: top; background: #f9f9f9; color: #898f95; text-align: center;\"><p style=\"font-size: 14px; padding-top: 15px; margin-bottom: 8px; margin-top: 0px; border-top: 1px solid #ecf4fd;\">&copy; Copyright 2021-22 by Propane Brothers. All Rights Reserved.</p>\n                                                      <small>Please do not reply to this message; it was sent from an unmonitored email address.</small> <br />\n                                                      <small>This message is a service email related to your use of Propane Brothers.</small>\n                                                  </td>\n                                              </tr>\n                                          </tbody>\n                                      </table>\n                                  </td>\n                              </tr>\n                          </tbody>\n                      </table>\n                  </div>\n              </td>\n          </tr>\n      </tbody>\n  </table>\n  </body>',
    'order_deliver',
    1,
    '2022-08-16 20:07:56.140027',
    '2022-08-16 20:07:56.140027',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `email_templates` (
    `id`,
    `subject`,
    `template`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    13,
    'appreciate',
    '<body style=\"margin: 0px; padding: 0px; background-color: #f9f9f9;\">\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#f9f9f9\">\n    <tbody>\n        <tr>\n            <td align=\"top\">\n                <div align=\"center\">\n                    <table width=\"620\" style=\"margin: 30px 0px;\"  cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\">\n                        <tbody>\n                            <tr>\n                                <td style=\"padding: 25px 30px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"background: #fff; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1;\">\n                                        <tbody>\n                                            <tr>\n                                                <td valign=\"middle\" align=\"center\" style=\"padding: 0px;\">\n                                                <img src=\"https://service-pb-s3.s3.ap-south-1.amazonaws.com/propane-brothers-app/logo-big.png\" alt=\"logo\" download=\"false\" style=\"height: 110px;\" />\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                    <h3>Hi {name}</h3>\n                                                    <p>Thank you for getting in touch!</p>\n                                                    <p style=\"margin-top: 0px;\">we appreciate you contacting us. one of our staff will be getting back to your shortly.</p>\n                                                    <P>Thanks in advance for your patience.</P>\n                                                    <p style=\"margin-top: 0px;\">we hope you love our service as much as much as we enjoy delivering to you.</p>\n                                                    <a href=\"javascript:;\" target=\"_blank\"> <img src=\"https://www.sarangpatel.live/img/app-store.png\" alt=\"App Store\" /></a>\n                                                    <a href=\"javascript:;\" target=\"_blank\"> <img src=\"https://www.sarangpatel.live/img/play-store.png\" alt=\"Play Store\" /></a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 20px 30px;\">\n                                                    If you have any questions or concerns, we\'re here to help. Contact us at <br />\n                                                    <a href=\"mailto:admin@propane-bros.com\" style=\"color: #656363;\">{admin}</a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                    Thank you, <br /> Propane Brothers\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-size: 12px; font-style: italic; color: #6c757d; padding: 20px 30px; border-radius: 0px 0px 4px 4px;\">\n                                                    <strong>Note:</strong> The content of this email is intended only for use by the individual or entity to whom it is addressed.\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px; vertical-align: top; background: #f9f9f9; color: #898f95; text-align: center;\"><p style=\"font-size: 14px; padding-top: 15px; margin-bottom: 8px; margin-top: 0px; border-top: 1px solid #ecf4fd;\">&copy; Copyright 2021-22 by Propane Brothers. All Rights Reserved.</p>\n                                                    <small>Please do not reply to this message; it was sent from an unmonitored email address.</small> <br />\n                                                    <small>This message is a service email related to your use of Propane Brothers.</small>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                        </tbody>\n                    </table>\n                </div>\n            </td>\n        </tr>\n    </tbody>\n</table>\n</body>',
    'appreciate',
    1,
    '2022-08-16 20:07:56.142476',
    '2022-08-16 20:07:56.142476',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `email_templates` (
    `id`,
    `subject`,
    `template`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    14,
    'purchase plan',
    '<body style=\"margin: 0px; padding: 0px; background-color: #f9f9f9;\">\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#f9f9f9\">\n    <tbody>\n        <tr>\n            <td align=\"top\">\n                <div align=\"center\">\n                    <table width=\"620\" style=\"margin: 30px 0px;\"  cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\">\n                        <tbody>\n                            <tr>\n                                <td style=\"padding: 25px 30px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"background: #fff; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1;\">\n                                        <tbody>\n                                            <tr>\n                                                <td valign=\"middle\" align=\"center\" style=\"padding: 0px;\">\n                                                <img src=\"https://service-pb-s3.s3.ap-south-1.amazonaws.com/propane-brothers-app/logo-big.png\" alt=\"logo\" download=\"false\" style=\"height: 110px;\" />\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td style=\"padding-top: 25px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px 10px 30px;\" colspan=\"3\">\n                                                    <span style=\"font-size: 18px; display: block;\">Hi {name},</span>\n                                                    <p style=\"margin-top: 5px;\">Welcome to Propane Brothers. </p>\n                                                    <p style=\"margin-bottom: 0px;\">Thanks for taking memberShip plan. we hope you\'re enjoy your discount </p>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px; text-align: center;\" width=\"50%\">\n                                                    <label style=\"margin-bottom: 5px; display: block; color: #839bb3;\">Start Membership</label>\n                                                    <span style=\"font-size: 20px; display: block; color: #4d5a68;\">{startDate}</span>\n                                                </td>\n                                                <td style=\"border-left: 2px solid #ecf4fd;\"></td>\n                                                <td style=\"padding: 0px 30px; text-align: center;\" width=\"50%\">\n                                                    <label style=\"margin-bottom: 5px; display: block; color: #839bb3;\">End Membership</label>\n                                                    <span style=\"font-size: 20px; display: block; color: #4d5a68;\">{endDate}</span>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 20px 30px;\" colspan=\"3\">\n                                                    <p style=\"border-bottom: 1px solid #ecf4fd; margin: 0px;\"></p>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                    <p style=\"margin-top: 0px; margin-bottom: 20px;\"> We hope you love our service as much as we enjoy delivering to you.</p>\n                                                    <a href=\"javascript:;\" target=\"_blank\"><img src=\"https://www.sarangpatel.live/img/app-store.png\" alt=\"App Store\" /></a>\n                                                    <a href=\"javascript:;\" target=\"_blank\"><img src=\"https://www.sarangpatel.live/img/play-store.png\" alt=\"Play Store\" /></a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 15px 30px 20px;\">\n                                                    If you have any questions or concerns, we\'re here to help. Contact us at <br />\n                                                    <a href=\"mailto:admin@propane-bros.com\" style=\"color: #656363;\">{admin}</a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                    Thank you, <br /> Propane Brothers\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-size: 12px; font-style: italic; color: #6c757d; padding: 20px 30px; border-radius: 0px 0px 4px 4px;\">\n                                                    <strong>Note:</strong> The content of this email is intended only for use by the individual or entity to whom it is addressed.\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px; vertical-align: top; background: #f9f9f9; color: #898f95; text-align: center;\"><p style=\"font-size: 14px; padding-top: 15px; margin-bottom: 8px; margin-top: 0px; border-top: 1px solid #ecf4fd;\">&copy; Copyright 2021-22 by Propane Brothers. All Rights Reserved.</p>\n                                                    <small>Please do not reply to this message; it was sent from an unmonitored email address.</small> <br />\n                                                    <small>This message is a service email related to your use of Propane Brothers.</small>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                        </tbody>\n                    </table>\n                </div>\n            </td>\n        </tr>\n    </tbody>\n</table>\n</body>',
    'purchase_plan',
    1,
    '2022-08-16 20:07:56.146285',
    '2022-08-16 20:07:56.146285',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `email_templates` (
    `id`,
    `subject`,
    `template`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    15,
    'expire plan',
    '<body style=\"margin: 0px; padding: 0px; background-color: #f9f9f9;\">\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#f9f9f9\">\n    <tbody>\n        <tr>\n            <td align=\"top\">\n                <div align=\"center\">\n                    <table width=\"620\" style=\"margin: 30px 0px;\"  cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\">\n                        <tbody>\n                            <tr>\n                                <td style=\"padding: 25px 30px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"background: #fff; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1;\">\n                                        <tbody>\n                                            <tr>\n                                                <td valign=\"middle\" align=\"center\" style=\"padding: 0px;\">\n                                                <img src=\"https://service-pb-s3.s3.ap-south-1.amazonaws.com/propane-brothers-app/logo-big.png\" alt=\"logo\" download=\"false\" style=\"height: 110px;\" />\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td style=\"padding-top: 25px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px 10px 30px;\" colspan=\"3\">\n                                                    <span style=\"font-size: 18px; display: block;\">Hi {name},</span>\n                                                    <p style=\"margin-top: 5px;\">Welcome to Propane Brothers. </p>\n                                                    <p style=\"margin-bottom: 0px;\">a friendly reminder that your membership with Propane Bros is about to expire on {endDate}.</p>\n                                                    <p></p>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px; text-align: center;\" width=\"50%\">\n                                                    <label style=\"margin-bottom: 5px; display: block; color: #839bb3;\">Start Membership</label>\n                                                    <span style=\"font-size: 20px; display: block; color: #4d5a68;\">{startDate}</span>\n                                                </td>\n                                                <td style=\"border-left: 2px solid #ecf4fd;\"></td>\n                                                <td style=\"padding: 0px 30px; text-align: center;\" width=\"50%\">\n                                                    <label style=\"margin-bottom: 5px; display: block; color: #839bb3;\">End Membership</label>\n                                                    <span style=\"font-size: 20px; display: block; color: #4d5a68;\">{endDate}</span>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 20px 30px;\" colspan=\"3\">\n                                                    <p style=\"border-bottom: 1px solid #ecf4fd; margin: 0px;\"></p>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 10px 30px 20px 30px;\" colspan=\"3\">\n                                                    <p style=\"border-top: 1px solid #ecf4fd; margin: 0px;\"></p>\n                                                    <p style=\"margin-bottom: 0px;\">Here\'s a summary of your Membership Plan : </p>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\" colspan=\"3\">\n                                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5; border-collapse: collapse; margin-bottom: 10px;\">\n                                                        <tbody>\n                                                            <tr style=\"background-color: #EEF0F3;\">\n                                                                <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Plan Name</td>\n                                                                <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">xyz</td>\n                                                            </tr>\n                                                            <tr>\n                                                                <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Start Date</td>\n                                                                <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">{startDate}</td>\n                                                            </tr>\n                                                            <tr style=\"background-color: #EEF0F3;\">\n                                                                <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">end Date</td>\n                                                                <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">{endDate}</td>\n                                                            </tr>\n                                                            <tr>\n                                                                <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px; width: 155px;\">Plan Price</td>\n                                                                <td style=\"border: 1px solid #E5E7EB; padding: 9px 12px;\">$0.80</td>\n                                                            </tr>\n                                                        </tbody>\n                                                    </table>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 20px 30px;\" colspan=\"3\">\n                                                    <p style=\"border-bottom: 1px solid #ecf4fd; margin: 0px;\"></p>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                    <p style=\"margin-top: 0px; margin-bottom: 20px;\"> We hope you love our service as much as we enjoy delivering to you.</p>\n                                                    <a href=\"javascript:;\" target=\"_blank\"><img src=\"https://www.sarangpatel.live/img/app-store.png\" alt=\"App Store\" /></a>\n                                                    <a href=\"javascript:;\" target=\"_blank\"><img src=\"https://www.sarangpatel.live/img/play-store.png\" alt=\"Play Store\" /></a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 15px 30px 20px;\">\n                                                    If you have any questions or concerns, we\'re here to help. Contact us at <br />\n                                                    <a href=\"mailto:admin@propane-bros.com\" style=\"color: #656363;\">admin@propane-bros.com</a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                    Thank you, <br /> Propane Brothers\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-size: 12px; font-style: italic; color: #6c757d; padding: 20px 30px; border-radius: 0px 0px 4px 4px;\">\n                                                    <strong>Note:</strong> The content of this email is intended only for use by the individual or entity to whom it is addressed.\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px; vertical-align: top; background: #f9f9f9; color: #898f95; text-align: center;\"><p style=\"font-size: 14px; padding-top: 15px; margin-bottom: 8px; margin-top: 0px; border-top: 1px solid #ecf4fd;\">&copy; Copyright 2021-22 by Propane Brothers. All Rights Reserved.</p>\n                                                    <small>Please do not reply to this message; it was sent from an unmonitored email address.</small> <br />\n                                                    <small>This message is a service email related to your use of Propane Brothers.</small>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                        </tbody>\n                    </table>\n                </div>\n            </td>\n        </tr>\n    </tbody>\n</table>\n</body>',
    'expire_plan',
    1,
    '2022-08-16 20:07:56.152547',
    '2022-08-16 20:07:56.152547',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `email_templates` (
    `id`,
    `subject`,
    `template`,
    `key`,
    `status`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    16,
    'low stock reminder',
    '<body style=\"margin: 0px; padding: 0px; background-color: #f9f9f9;\">\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#f9f9f9\">\n    <tbody>\n        <tr>\n            <td align=\"top\">\n                <div align=\"center\">\n                    <table width=\"620\" style=\"margin: 30px 0px;\"  cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\">\n                        <tbody>\n                            <tr>\n                                <td style=\"padding: 25px 30px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"background: #fff; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1;\">\n                                        <tbody>\n                                            <tr>\n                                                <td valign=\"middle\" align=\"center\" style=\"padding: 0px;\">\n                                                <img src=\"https://service-pb-s3.s3.ap-south-1.amazonaws.com/propane-brothers-app/logo-big.png\" alt=\"logo\" download=\"false\" style=\"height: 110px;\" />\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td style=\"padding-top: 25px;\">\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px 10px 30px;\" colspan=\"3\">\n                                                    <span style=\"font-size: 18px; display: block;\">Hi John Smith,</span>\n                                                    <p style=\"margin-top: 5px;\">Thank you for choosing Propane Brothers. </p>\n                                                    <p style=\"margin-bottom: 0px;\">You have low stock,Please check below stock details. </p>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px; text-align: center;\" width=\"50%\">\n                                                    <label style=\"margin-bottom: 5px; display: block; color: #839bb3;\">StockName</label>\n                                                    <span style=\"font-size: 20px; display: block; color: #4d5a68;\">{name}</span>\n                                                </td>\n                                                <td style=\"border-left: 2px solid #ecf4fd;\"></td>\n                                                <td style=\"padding: 0px 30px; text-align: center;\" width=\"50%\">\n                                                    <label style=\"margin-bottom: 5px; display: block; color: #839bb3;\">Quantity</label>\n                                                    <span style=\"font-size: 20px; display: block; color: #4d5a68;\">{qty}</span>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 20px 30px;\" colspan=\"3\">\n                                                    <p style=\"border-bottom: 1px solid #ecf4fd; margin: 0px;\"></p>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                    <p style=\"margin-top: 0px; margin-bottom: 20px;\"> We hope you love our service as much as we enjoy delivering to you.</p>\n                                                    <a href=\"javascript:;\" target=\"_blank\"> <img src=\"https://www.sarangpatel.live/img/app-store.png\" alt=\"App Store\" /></a>\n                                                      <a href=\"javascript:;\" target=\"_blank\"> <img src=\"https://www.sarangpatel.live/img/play-store.png\" alt=\"Play Store\" /></a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 15px 30px 20px;\">\n                                                    If you have any questions or concerns, we\'re here to help. Contact us at <br />\n                                                    <a href=\"mailto:admin@propane-bros.com\" style=\"color: #656363;\">admin@propane-bros.com</a>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px;\">\n                                                    Thank you, <br /> Propane Brothers\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-size: 12px; font-style: italic; color: #6c757d; padding: 20px 30px; border-radius: 0px 0px 4px 4px;\">\n                                                    <strong>Note:</strong> The content of this email is intended only for use by the individual or entity to whom it is addressed.\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                            <tr>\n                                <td>\n                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:14px; color: #263b5f; font-family: Verdana, Arial,Helvetica,sans-serif; line-height: 1.5;\">\n                                        <tbody>\n                                            <tr>\n                                                <td style=\"padding: 0px 30px; vertical-align: top; background: #f9f9f9; color: #898f95; text-align: center;\"><p style=\"font-size: 14px; padding-top: 15px; margin-bottom: 8px; margin-top: 0px; border-top: 1px solid #ecf4fd;\">&copy; Copyright 2021-22 by Propane Brothers. All Rights Reserved.</p>\n                                                    <small>Please do not reply to this message; it was sent from an unmonitored email address.</small> <br />\n                                                    <small>This message is a service email related to your use of Propane Brothers.</small>\n                                                </td>\n                                            </tr>\n                                        </tbody>\n                                    </table>\n                                </td>\n                            </tr>\n                        </tbody>\n                    </table>\n                </div>\n            </td>\n        </tr>\n    </tbody>\n</table>\n</body>',
    'low_stock_reminder',
    1,
    '2022-08-16 20:07:56.158857',
    '2022-08-16 20:07:56.158857',
    NULL,
    NULL,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: emegergency_orders
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: faqs
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: freelance_drivers_payment
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: government_holidays
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: membership_paln_details
# ------------------------------------------------------------

INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    1,
    'Includes monitoring equipment, Monitoring of propane levels, Automatic level alerts',
    NULL,
    1,
    0,
    0,
    '2022-08-16 20:07:56.316427',
    '2022-08-16 20:07:56.316427',
    NULL,
    NULL,
    NULL,
    1
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    2,
    '{{VALUE}} off all propane gallons delivered',
    10,
    2,
    1,
    0,
    '2022-08-16 20:07:56.319804',
    '2022-08-16 20:07:56.319804',
    NULL,
    NULL,
    NULL,
    1
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    3,
    'Includes monitoring equipment, Monitoring of propane levels, Automatic level alerts',
    NULL,
    1,
    0,
    0,
    '2022-08-16 20:07:56.320877',
    '2022-08-16 20:07:56.320877',
    NULL,
    NULL,
    NULL,
    2
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    4,
    '{{VALUE}} off all propane gallons delivered',
    10,
    2,
    1,
    0,
    '2022-08-16 20:07:56.321865',
    '2022-08-16 20:07:56.321865',
    NULL,
    NULL,
    NULL,
    2
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    5,
    'Includes monitoring equipment, Monitoring of propane levels, Automatic level alerts',
    NULL,
    1,
    0,
    0,
    '2022-08-16 20:07:56.323135',
    '2022-08-16 20:07:56.323135',
    NULL,
    NULL,
    NULL,
    3
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    6,
    '{{VALUE}} off all propane gallons delivered',
    10,
    2,
    1,
    0,
    '2022-08-16 20:07:56.324151',
    '2022-08-16 20:07:56.324151',
    NULL,
    NULL,
    NULL,
    3
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    7,
    'Includes monitoring equipment, Monitoring of propane levels, Automatic level alerts',
    NULL,
    1,
    0,
    0,
    '2022-08-16 20:07:56.325321',
    '2022-08-16 20:07:56.325321',
    NULL,
    NULL,
    NULL,
    4
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    8,
    '{{VALUE}} off all propane gallons delivered',
    10,
    2,
    1,
    0,
    '2022-08-16 20:07:56.326395',
    '2022-08-16 20:07:56.326395',
    NULL,
    NULL,
    NULL,
    4
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    9,
    '{{VALUE}} off all propane tank exchanges (option to have % off instead of flat rate)',
    4,
    1,
    0,
    1,
    '2022-08-16 20:07:56.327352',
    '2022-08-16 20:07:56.327352',
    NULL,
    NULL,
    NULL,
    5
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    10,
    'for those that are buying more than {{VALUE}} exchange per month.',
    10,
    2,
    0,
    0,
    '2022-08-16 20:07:56.328963',
    '2022-08-16 20:07:56.328963',
    NULL,
    NULL,
    NULL,
    5
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    11,
    'Limit of {{VALUE}} tanks per month, or charges non membership rates',
    10,
    3,
    0,
    0,
    '2022-08-16 20:07:56.329983',
    '2022-08-16 20:07:56.329983',
    NULL,
    NULL,
    NULL,
    5
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    12,
    'Up to {{VALUE}} in savings per month',
    10,
    4,
    0,
    1,
    '2022-08-16 20:07:56.331096',
    '2022-08-16 20:07:56.331096',
    NULL,
    NULL,
    NULL,
    5
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    13,
    '{{VALUE}} off all propane tank exchanges (option to have % off instead of flat rate)',
    4,
    1,
    0,
    1,
    '2022-08-16 20:07:56.332451',
    '2022-08-16 20:07:56.332451',
    NULL,
    NULL,
    NULL,
    6
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    14,
    'for those that are buying more than {{VALUE}} exchange per month.',
    10,
    2,
    0,
    0,
    '2022-08-16 20:07:56.333756',
    '2022-08-16 20:07:56.333756',
    NULL,
    NULL,
    NULL,
    6
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    15,
    'Limit of {{VALUE}} tanks per month, or charges non membership rates',
    10,
    3,
    0,
    0,
    '2022-08-16 20:07:56.335235',
    '2022-08-16 20:07:56.335235',
    NULL,
    NULL,
    NULL,
    6
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    16,
    'Up to {{VALUE}} in savings per month',
    10,
    4,
    0,
    1,
    '2022-08-16 20:07:56.336475',
    '2022-08-16 20:07:56.336475',
    NULL,
    NULL,
    NULL,
    6
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    17,
    '{{VALUE}} off all propane tank exchanges (option to have % off instead of flat rate)',
    4,
    1,
    0,
    1,
    '2022-08-16 20:07:56.337859',
    '2022-08-16 20:07:56.337859',
    NULL,
    NULL,
    NULL,
    7
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    18,
    'for those that are buying more than {{VALUE}} exchange per month.',
    10,
    2,
    0,
    0,
    '2022-08-16 20:07:56.338867',
    '2022-08-16 20:07:56.338867',
    NULL,
    NULL,
    NULL,
    7
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    19,
    'Limit of {{VALUE}} tanks per month, or charges non membership rates',
    10,
    3,
    0,
    0,
    '2022-08-16 20:07:56.340001',
    '2022-08-16 20:07:56.340001',
    NULL,
    NULL,
    NULL,
    7
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    20,
    'Up to {{VALUE}} in savings per month',
    10,
    4,
    0,
    1,
    '2022-08-16 20:07:56.341018',
    '2022-08-16 20:07:56.341018',
    NULL,
    NULL,
    NULL,
    7
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    21,
    '{{VALUE}} off all propane tank exchanges (option to have % off instead of flat rate)',
    4,
    1,
    0,
    1,
    '2022-08-16 20:07:56.342189',
    '2022-08-16 20:07:56.342189',
    NULL,
    NULL,
    NULL,
    8
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    22,
    'for those that are buying more than {{VALUE}} exchange per month.',
    10,
    2,
    0,
    0,
    '2022-08-16 20:07:56.343278',
    '2022-08-16 20:07:56.343278',
    NULL,
    NULL,
    NULL,
    8
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    23,
    'Limit of {{VALUE}} tanks per month, or charges non membership rates',
    10,
    3,
    0,
    0,
    '2022-08-16 20:07:56.344187',
    '2022-08-16 20:07:56.344187',
    NULL,
    NULL,
    NULL,
    8
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    24,
    'Up to {{VALUE}} in savings per month',
    10,
    4,
    0,
    1,
    '2022-08-16 20:07:56.345131',
    '2022-08-16 20:07:56.345131',
    NULL,
    NULL,
    NULL,
    8
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    25,
    '{{VALUE}} off all propane tank exchanges (option to have % off instead of flat rate)',
    4,
    1,
    0,
    1,
    '2022-08-16 20:07:56.346024',
    '2022-08-16 20:07:56.346024',
    NULL,
    NULL,
    NULL,
    9
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    26,
    'for those that are buying more than {{VALUE}} exchange per month.',
    10,
    2,
    0,
    0,
    '2022-08-16 20:07:56.346868',
    '2022-08-16 20:07:56.346868',
    NULL,
    NULL,
    NULL,
    9
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    27,
    'Limit of {{VALUE}} tanks per month, or charges non membership rates',
    10,
    3,
    0,
    0,
    '2022-08-16 20:07:56.347740',
    '2022-08-16 20:07:56.347740',
    NULL,
    NULL,
    NULL,
    9
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    28,
    'Up to {{VALUE}} in savings per month',
    10,
    4,
    0,
    1,
    '2022-08-16 20:07:56.350992',
    '2022-08-16 20:07:56.350992',
    NULL,
    NULL,
    NULL,
    9
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    29,
    '{{VALUE}} off all propane tank exchanges (option to have % off instead of flat rate)',
    4,
    1,
    0,
    1,
    '2022-08-16 20:07:56.352478',
    '2022-08-16 20:07:56.352478',
    NULL,
    NULL,
    NULL,
    10
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    30,
    'for those that are buying more than {{VALUE}} exchange per month.',
    10,
    2,
    0,
    0,
    '2022-08-16 20:07:56.353454',
    '2022-08-16 20:07:56.353454',
    NULL,
    NULL,
    NULL,
    10
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    31,
    'Limit of {{VALUE}} tanks per month, or charges non membership rates',
    10,
    3,
    0,
    0,
    '2022-08-16 20:07:56.354318',
    '2022-08-16 20:07:56.354318',
    NULL,
    NULL,
    NULL,
    10
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    32,
    'Up to {{VALUE}} in savings per month',
    10,
    4,
    0,
    1,
    '2022-08-16 20:07:56.355209',
    '2022-08-16 20:07:56.355209',
    NULL,
    NULL,
    NULL,
    10
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    33,
    '{{VALUE}} off all propane tank exchanges (option to have % off instead of flat rate)',
    4,
    1,
    0,
    1,
    '2022-08-16 20:07:56.356051',
    '2022-08-16 20:07:56.356051',
    NULL,
    NULL,
    NULL,
    11
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    34,
    'for those that are buying more than {{VALUE}} exchange per month.',
    10,
    2,
    0,
    0,
    '2022-08-16 20:07:56.357101',
    '2022-08-16 20:07:56.357101',
    NULL,
    NULL,
    NULL,
    11
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    35,
    'Limit of {{VALUE}} tanks per month, or charges non membership rates',
    10,
    3,
    0,
    0,
    '2022-08-16 20:07:56.357959',
    '2022-08-16 20:07:56.357959',
    NULL,
    NULL,
    NULL,
    11
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    36,
    'Up to {{VALUE}} in savings per month',
    10,
    4,
    0,
    1,
    '2022-08-16 20:07:56.358850',
    '2022-08-16 20:07:56.358850',
    NULL,
    NULL,
    NULL,
    11
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    37,
    '{{VALUE}} off all propane tank exchanges (option to have % off instead of flat rate)',
    4,
    1,
    0,
    1,
    '2022-08-16 20:07:56.359659',
    '2022-08-16 20:07:56.359659',
    NULL,
    NULL,
    NULL,
    12
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    38,
    'for those that are buying more than {{VALUE}} exchange per month.',
    10,
    2,
    0,
    0,
    '2022-08-16 20:07:56.360459',
    '2022-08-16 20:07:56.360459',
    NULL,
    NULL,
    NULL,
    12
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    39,
    'Limit of {{VALUE}} tanks per month, or charges non membership rates',
    10,
    3,
    0,
    0,
    '2022-08-16 20:07:56.361258',
    '2022-08-16 20:07:56.361258',
    NULL,
    NULL,
    NULL,
    12
  );
INSERT INTO
  `membership_paln_details` (
    `id`,
    `label`,
    `value`,
    `key`,
    `is_percentage`,
    `is_dollar`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_prices_id`
  )
VALUES
  (
    40,
    'Up to {{VALUE}} in savings per month',
    10,
    4,
    0,
    1,
    '2022-08-16 20:07:56.362682',
    '2022-08-16 20:07:56.362682',
    NULL,
    NULL,
    NULL,
    12
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: membership_paln_prices
# ------------------------------------------------------------

INSERT INTO
  `membership_paln_prices` (
    `id`,
    `price`,
    `period`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_id`
  )
VALUES
  (
    1,
    5,
    1,
    1,
    '2022-08-16 20:07:56.258474',
    '2022-08-19 15:31:47.000000',
    NULL,
    NULL,
    NULL,
    1
  );
INSERT INTO
  `membership_paln_prices` (
    `id`,
    `price`,
    `period`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_id`
  )
VALUES
  (
    2,
    5,
    2,
    1,
    '2022-08-16 20:07:56.261182',
    '2022-08-19 15:31:47.000000',
    NULL,
    NULL,
    NULL,
    1
  );
INSERT INTO
  `membership_paln_prices` (
    `id`,
    `price`,
    `period`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_id`
  )
VALUES
  (
    3,
    5,
    1,
    0,
    '2022-08-16 20:07:56.262187',
    '2022-08-16 20:07:56.262187',
    NULL,
    NULL,
    NULL,
    2
  );
INSERT INTO
  `membership_paln_prices` (
    `id`,
    `price`,
    `period`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_id`
  )
VALUES
  (
    4,
    5,
    2,
    0,
    '2022-08-16 20:07:56.263155',
    '2022-08-16 20:07:56.263155',
    NULL,
    NULL,
    NULL,
    2
  );
INSERT INTO
  `membership_paln_prices` (
    `id`,
    `price`,
    `period`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_id`
  )
VALUES
  (
    5,
    5,
    1,
    0,
    '2022-08-16 20:07:56.264145',
    '2022-08-16 20:07:56.264145',
    NULL,
    NULL,
    NULL,
    3
  );
INSERT INTO
  `membership_paln_prices` (
    `id`,
    `price`,
    `period`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_id`
  )
VALUES
  (
    6,
    5,
    2,
    0,
    '2022-08-16 20:07:56.265132',
    '2022-08-16 20:07:56.265132',
    NULL,
    NULL,
    NULL,
    3
  );
INSERT INTO
  `membership_paln_prices` (
    `id`,
    `price`,
    `period`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_id`
  )
VALUES
  (
    7,
    5,
    1,
    0,
    '2022-08-16 20:07:56.266983',
    '2022-08-16 20:07:56.266983',
    NULL,
    NULL,
    NULL,
    4
  );
INSERT INTO
  `membership_paln_prices` (
    `id`,
    `price`,
    `period`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_id`
  )
VALUES
  (
    8,
    5,
    2,
    0,
    '2022-08-16 20:07:56.270192',
    '2022-08-16 20:07:56.270192',
    NULL,
    NULL,
    NULL,
    4
  );
INSERT INTO
  `membership_paln_prices` (
    `id`,
    `price`,
    `period`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_id`
  )
VALUES
  (
    9,
    5,
    1,
    0,
    '2022-08-16 20:07:56.271270',
    '2022-08-16 20:07:56.271270',
    NULL,
    NULL,
    NULL,
    5
  );
INSERT INTO
  `membership_paln_prices` (
    `id`,
    `price`,
    `period`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_id`
  )
VALUES
  (
    10,
    5,
    2,
    0,
    '2022-08-16 20:07:56.272426',
    '2022-08-16 20:07:56.272426',
    NULL,
    NULL,
    NULL,
    5
  );
INSERT INTO
  `membership_paln_prices` (
    `id`,
    `price`,
    `period`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_id`
  )
VALUES
  (
    11,
    5,
    1,
    0,
    '2022-08-16 20:07:56.273475',
    '2022-08-16 20:07:56.273475',
    NULL,
    NULL,
    NULL,
    6
  );
INSERT INTO
  `membership_paln_prices` (
    `id`,
    `price`,
    `period`,
    `is_active`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `membership_plan_id`
  )
VALUES
  (
    12,
    5,
    2,
    0,
    '2022-08-16 20:07:56.274707',
    '2022-08-16 20:07:56.274707',
    NULL,
    NULL,
    NULL,
    6
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: membership_palns
# ------------------------------------------------------------

INSERT INTO
  `membership_palns` (
    `id`,
    `uuid`,
    `name`,
    `product_ids`,
    `category_ids`,
    `type`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `is_active`
  )
VALUES
  (
    1,
    'b0e083cd-59ef-4da8-b29e-cd07f88e9200',
    'Home Lite',
    '1',
    '',
    1,
    '2022-08-16 20:07:56.246047',
    '2022-08-19 15:31:47.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1
  );
INSERT INTO
  `membership_palns` (
    `id`,
    `uuid`,
    `name`,
    `product_ids`,
    `category_ids`,
    `type`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `is_active`
  )
VALUES
  (
    2,
    '212d603f-3006-426c-9126-1c4c50100ccb',
    'Home Pro',
    '',
    '',
    1,
    '2022-08-16 20:07:56.247132',
    '2022-08-16 20:07:56.247132',
    NULL,
    NULL,
    NULL,
    1
  );
INSERT INTO
  `membership_palns` (
    `id`,
    `uuid`,
    `name`,
    `product_ids`,
    `category_ids`,
    `type`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `is_active`
  )
VALUES
  (
    3,
    'c4f4e392-e06a-434a-a5fc-c4f5669044d6',
    'Grilling Lite',
    '',
    '',
    2,
    '2022-08-16 20:07:56.248074',
    '2022-08-16 20:07:56.248074',
    NULL,
    NULL,
    NULL,
    1
  );
INSERT INTO
  `membership_palns` (
    `id`,
    `uuid`,
    `name`,
    `product_ids`,
    `category_ids`,
    `type`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `is_active`
  )
VALUES
  (
    4,
    '57ba18f7-2aab-4462-8532-12e26194771a',
    'Grilling Pro',
    '',
    '',
    2,
    '2022-08-16 20:07:56.249642',
    '2022-08-16 20:07:56.249642',
    NULL,
    NULL,
    NULL,
    1
  );
INSERT INTO
  `membership_palns` (
    `id`,
    `uuid`,
    `name`,
    `product_ids`,
    `category_ids`,
    `type`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `is_active`
  )
VALUES
  (
    5,
    '99aa414d-1929-4d87-a647-e9c60d564504',
    'Business Lite',
    '',
    '',
    2,
    '2022-08-16 20:07:56.251663',
    '2022-08-16 20:07:56.251663',
    NULL,
    NULL,
    NULL,
    1
  );
INSERT INTO
  `membership_palns` (
    `id`,
    `uuid`,
    `name`,
    `product_ids`,
    `category_ids`,
    `type`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `is_active`
  )
VALUES
  (
    6,
    'a335cc27-7bcb-460b-a849-5869cb1909a8',
    'Business Pro',
    '',
    '',
    2,
    '2022-08-16 20:07:56.253513',
    '2022-08-16 20:07:56.253513',
    NULL,
    NULL,
    NULL,
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: modules
# ------------------------------------------------------------

INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    1,
    'Dashboard',
    NULL,
    '2022-08-16 20:07:56.165995',
    '2022-08-16 20:07:56.165995',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    2,
    'Orders',
    NULL,
    '2022-08-16 20:07:56.168826',
    '2022-08-16 20:07:56.168826',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    3,
    'Pending Orders',
    2,
    '2022-08-16 20:07:56.170408',
    '2022-08-16 20:07:56.170408',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    4,
    'Orders History',
    2,
    '2022-08-16 20:07:56.171812',
    '2022-08-16 20:07:56.171812',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    5,
    'All Orders',
    2,
    '2022-08-16 20:07:56.173244',
    '2022-08-16 20:07:56.173244',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    6,
    'Map',
    NULL,
    '2022-08-16 20:07:56.174910',
    '2022-08-16 20:07:56.174910',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    7,
    'Customers',
    NULL,
    '2022-08-16 20:07:56.176392',
    '2022-08-16 20:07:56.176392',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    8,
    'Vendors',
    NULL,
    '2022-08-16 20:07:56.177320',
    '2022-08-16 20:07:56.177320',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    9,
    'Drivers',
    NULL,
    '2022-08-16 20:07:56.178346',
    '2022-08-16 20:07:56.178346',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    10,
    'Vendor Drivers',
    9,
    '2022-08-16 20:07:56.179517',
    '2022-08-16 20:07:56.179517',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    11,
    'Freelance Drivers',
    9,
    '2022-08-16 20:07:56.181322',
    '2022-08-16 20:07:56.181322',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    12,
    'Freelance Drivers Payments',
    9,
    '2022-08-16 20:07:56.183500',
    '2022-08-16 20:07:56.183500',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    13,
    'Product Settings',
    NULL,
    '2022-08-16 20:07:56.186819',
    '2022-08-16 20:07:56.186819',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    14,
    'Products',
    13,
    '2022-08-16 20:07:56.188237',
    '2022-08-16 20:07:56.188237',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    15,
    'Accessories',
    13,
    '2022-08-16 20:07:56.190413',
    '2022-08-16 20:07:56.190413',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    16,
    'Cylinder Size',
    13,
    '2022-08-16 20:07:56.192083',
    '2022-08-16 20:07:56.192083',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    17,
    'Sales Tax',
    13,
    '2022-08-16 20:07:56.193665',
    '2022-08-16 20:07:56.193665',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    18,
    'Location of Where to Deliver',
    13,
    '2022-08-16 20:07:56.194666',
    '2022-08-16 20:07:56.194666',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    19,
    'Promocode',
    13,
    '2022-08-16 20:07:56.195619',
    '2022-08-16 20:07:56.195619',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    20,
    'Reports',
    NULL,
    '2022-08-16 20:07:56.197173',
    '2022-08-16 20:07:56.197173',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    21,
    'Earnings',
    NULL,
    '2022-08-16 20:07:56.198059',
    '2022-08-16 20:07:56.198059',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    22,
    'My Profile',
    NULL,
    '2022-08-16 20:07:56.199101',
    '2022-08-16 20:07:56.199101',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    23,
    'Timeslots',
    NULL,
    '2022-08-16 20:07:56.200260',
    '2022-08-16 20:07:56.200260',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    24,
    'Government Holidays',
    NULL,
    '2022-08-16 20:07:56.201423',
    '2022-08-16 20:07:56.201423',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    25,
    'Transactions',
    NULL,
    '2022-08-16 20:07:56.202733',
    '2022-08-16 20:07:56.202733',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    26,
    'Subscription Customers',
    NULL,
    '2022-08-16 20:07:56.203633',
    '2022-08-16 20:07:56.203633',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    27,
    'Membership Plans',
    NULL,
    '2022-08-16 20:07:56.204443',
    '2022-08-16 20:07:56.204443',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    28,
    'Email Templates',
    NULL,
    '2022-08-16 20:07:56.205222',
    '2022-08-16 20:07:56.205222',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    29,
    'Roles & Permissions',
    NULL,
    '2022-08-16 20:07:56.205937',
    '2022-08-16 20:07:56.205937',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    30,
    'Sub Admins',
    NULL,
    '2022-08-16 20:07:56.206660',
    '2022-08-16 20:07:56.206660',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    31,
    'Notifications',
    NULL,
    '2022-08-16 20:07:56.207407',
    '2022-08-16 20:07:56.207407',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    32,
    'App Settings',
    NULL,
    '2022-08-16 20:07:56.208163',
    '2022-08-16 20:07:56.208163',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `modules` (
    `id`,
    `name`,
    `parent_id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`
  )
VALUES
  (
    33,
    'CMS Pages',
    NULL,
    '2022-08-16 20:07:56.208895',
    '2022-08-16 20:07:56.208895',
    NULL,
    NULL,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: notification
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: order_details
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: order_status_log
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: orders
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: permissions
# ------------------------------------------------------------

INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.439057',
    '2022-08-19 15:34:20.439057',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    1
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    2,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.443197',
    '2022-08-19 15:34:20.443197',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    3
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    3,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.444949',
    '2022-08-19 15:34:20.444949',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    4
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    4,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.446201',
    '2022-08-19 15:34:20.446201',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    5
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    5,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.447594',
    '2022-08-19 15:34:20.447594',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    6
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    6,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.449054',
    '2022-08-19 15:34:20.449054',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    7
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    7,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.450944',
    '2022-08-19 15:34:20.450944',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    8
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    8,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.452351',
    '2022-08-19 15:34:20.452351',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    10
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    9,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.453898',
    '2022-08-19 15:34:20.453898',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    11
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    10,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.455897',
    '2022-08-19 15:34:20.455897',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    12
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    11,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.458725',
    '2022-08-19 15:34:20.458725',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    14
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    12,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.460074',
    '2022-08-19 15:34:20.460074',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    15
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    13,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.461691',
    '2022-08-19 15:34:20.461691',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    16
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    14,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.462903',
    '2022-08-19 15:34:20.462903',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    17
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    15,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.464558',
    '2022-08-19 15:34:20.464558',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    18
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    16,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.465830',
    '2022-08-19 15:34:20.465830',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    19
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    17,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.467028',
    '2022-08-19 15:34:20.467028',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    20
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    18,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.468220',
    '2022-08-19 15:34:20.468220',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    21
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    19,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.469518',
    '2022-08-19 15:34:20.469518',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    22
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    20,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.471027',
    '2022-08-19 15:34:20.471027',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    23
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    21,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.472429',
    '2022-08-19 15:34:20.472429',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    24
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    22,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.474388',
    '2022-08-19 15:34:20.474388',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    25
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    23,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.475738',
    '2022-08-19 15:34:20.475738',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    26
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    24,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.476715',
    '2022-08-19 15:34:20.476715',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    27
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    25,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-08-19 15:34:20.477765',
    '2022-08-19 15:34:20.477765',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    28
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    26,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.479549',
    '2022-08-19 15:34:20.479549',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    29
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    27,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.480939',
    '2022-08-19 15:34:20.480939',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    30
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    28,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.482394',
    '2022-08-19 15:34:20.482394',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    31
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    29,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.483947',
    '2022-08-19 15:34:20.483947',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    32
  );
INSERT INTO
  `permissions` (
    `id`,
    `all`,
    `index`,
    `add`,
    `edit`,
    `delete`,
    `view`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `role_id`,
    `module_id`
  )
VALUES
  (
    30,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-08-19 15:34:20.485191',
    '2022-08-19 15:34:20.485191',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    33
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: products
# ------------------------------------------------------------

INSERT INTO
  `products` (
    `id`,
    `name`,
    `order_type`,
    `logo`,
    `status`,
    `updated_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`
  )
VALUES
  (
    1,
    'Sarang Patel',
    1,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    NULL,
    '2022-08-19 15:30:04.553108',
    '2022-08-19 15:30:04.553108',
    NULL,
    1
  );
INSERT INTO
  `products` (
    `id`,
    `name`,
    `order_type`,
    `logo`,
    `status`,
    `updated_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`
  )
VALUES
  (
    2,
    'Test-1',
    2,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    NULL,
    '2022-08-24 12:34:22.226650',
    '2022-08-24 12:34:22.226650',
    NULL,
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: products_details
# ------------------------------------------------------------

INSERT INTO
  `products_details` (
    `id`,
    `index_price`,
    `discount`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `product_id`,
    `category_id`
  )
VALUES
  (
    1,
    100,
    12,
    '2022-08-19 15:30:04.568175',
    '2022-08-19 15:30:04.568175',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    NULL
  );
INSERT INTO
  `products_details` (
    `id`,
    `index_price`,
    `discount`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `product_id`,
    `category_id`
  )
VALUES
  (
    2,
    12,
    12,
    '2022-08-24 12:34:22.238531',
    '2022-08-24 12:34:22.238531',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    2,
    1
  );
INSERT INTO
  `products_details` (
    `id`,
    `index_price`,
    `discount`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `product_id`,
    `category_id`
  )
VALUES
  (
    3,
    12,
    12,
    '2022-08-24 12:34:22.251944',
    '2022-08-24 12:34:22.251944',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    2,
    2
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: promocodes
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: ratings
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: roles
# ------------------------------------------------------------

INSERT INTO
  `roles` (
    `id`,
    `uuid`,
    `name`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `is_active`
  )
VALUES
  (
    1,
    '5e343c49-540f-4b2c-98c9-c2b50e2bfe92',
    'll',
    '2022-08-19 15:34:20.383735',
    '2022-08-19 15:34:20.383735',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: seed
# ------------------------------------------------------------

INSERT INTO
  `seed` (`id`, `timestamp`, `name`)
VALUES
  (1, 1600768739937, 'start1600768739937');
INSERT INTO
  `seed` (`id`, `timestamp`, `name`)
VALUES
  (2, 1600768749937, 'updateOne1600768749937');
INSERT INTO
  `seed` (`id`, `timestamp`, `name`)
VALUES
  (3, 1600768759937, 'updateTwo1600768759937');
INSERT INTO
  `seed` (`id`, `timestamp`, `name`)
VALUES
  (4, 1600768769937, 'updateThree1600768769937');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: states
# ------------------------------------------------------------

INSERT INTO
  `states` (
    `id`,
    `name`,
    `sales_tax`,
    `total_counties`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `status`
  )
VALUES
  (
    1,
    'New York',
    10,
    1,
    '2022-08-20 08:43:54.478300',
    '2022-08-20 08:53:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: sub_admin_details
# ------------------------------------------------------------

INSERT INTO
  `sub_admin_details` (
    `id`,
    `page_size`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `role_id`
  )
VALUES
  (
    1,
    NULL,
    1,
    '2022-08-19 15:34:37.932649',
    '2022-08-19 15:34:37.932649',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '48ab36a3-b799-4f16-8aa4-aca92b125086',
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: time_slots
# ------------------------------------------------------------

INSERT INTO
  `time_slots` (
    `id`,
    `start_time`,
    `end_time`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    1,
    '10:00:00',
    '11:00:00',
    1,
    '2022-08-24 12:37:51.495620',
    '2022-08-24 12:37:51.495620',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
INSERT INTO
  `time_slots` (
    `id`,
    `start_time`,
    `end_time`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`
  )
VALUES
  (
    2,
    '11:00:00',
    '12:00:00',
    1,
    '2022-08-24 12:37:51.509508',
    '2022-08-24 12:37:51.509508',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tokens
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: user_addresses
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: user_order_statistics
# ------------------------------------------------------------

INSERT INTO
  `user_order_statistics` (
    `id`,
    `no_of_order_delivered`,
    `no_of_order_cancel`,
    `no_of_order_ongoing`,
    `no_of_order_passed`,
    `no_of_orders`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`
  )
VALUES
  (
    1,
    0,
    0,
    0,
    0,
    0,
    '2022-08-19 09:21:48.973407',
    '2022-08-19 09:21:48.973407',
    NULL,
    NULL,
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: user_subscription
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: user_verification_details
# ------------------------------------------------------------

INSERT INTO
  `user_verification_details` (
    `id`,
    `verified`,
    `token_or_otp`,
    `type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `user_id`
  )
VALUES
  (
    1,
    0,
    'HVYJMwuhZKKHrTiCXIKQxEhDU3JtQEyz',
    1,
    '2022-08-19 15:34:37.937327',
    '2022-08-19 15:34:37.937327',
    NULL,
    1,
    '48ab36a3-b799-4f16-8aa4-aca92b125086'
  );
INSERT INTO
  `user_verification_details` (
    `id`,
    `verified`,
    `token_or_otp`,
    `type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `user_id`
  )
VALUES
  (
    2,
    1,
    NULL,
    2,
    '2022-08-19 15:34:37.937553',
    '2022-08-19 15:34:37.937553',
    NULL,
    1,
    '48ab36a3-b799-4f16-8aa4-aca92b125086'
  );
INSERT INTO
  `user_verification_details` (
    `id`,
    `verified`,
    `token_or_otp`,
    `type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `user_id`
  )
VALUES
  (
    3,
    1,
    NULL,
    1,
    '2022-08-24 12:30:03.818557',
    '2022-08-24 12:30:03.818557',
    NULL,
    1,
    '775495e4-d08d-4ec2-8ed3-11af8b4ee164'
  );
INSERT INTO
  `user_verification_details` (
    `id`,
    `verified`,
    `token_or_otp`,
    `type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `user_id`
  )
VALUES
  (
    4,
    1,
    NULL,
    2,
    '2022-08-24 12:30:03.820632',
    '2022-08-24 12:30:03.820632',
    NULL,
    1,
    '775495e4-d08d-4ec2-8ed3-11af8b4ee164'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: users
# ------------------------------------------------------------

INSERT INTO
  `users` (
    `id`,
    `full_name`,
    `email`,
    `password`,
    `country_code`,
    `mobile_number`,
    `otp`,
    `user_type`,
    `profile_image`,
    `stripe_customer_id`,
    `stripe_account_id`,
    `user_subscription_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `admin_address`,
    `is_active`,
    `last_purchase_date`
  )
VALUES
  (
    '48ab36a3-b799-4f16-8aa4-aca92b125086',
    'Sarang Patel',
    'dummy@sarangpatel.live',
    '$2a$10$0U4ydzPD6B9i4EuJCDQc/uLP1GoGcpd5Ks/wctEbQaQ5M6R//BI2a',
    '+1',
    '9999999999',
    NULL,
    'sub_admin',
    NULL,
    NULL,
    NULL,
    0,
    '2022-08-19 15:34:37.928292',
    '2022-08-19 15:34:37.928292',
    NULL,
    NULL,
    NULL,
    NULL,
    1,
    NULL
  );
INSERT INTO
  `users` (
    `id`,
    `full_name`,
    `email`,
    `password`,
    `country_code`,
    `mobile_number`,
    `otp`,
    `user_type`,
    `profile_image`,
    `stripe_customer_id`,
    `stripe_account_id`,
    `user_subscription_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `admin_address`,
    `is_active`,
    `last_purchase_date`
  )
VALUES
  (
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    'SARANG PATEL',
    'admin@gmail.com',
    '$2a$08$LO.Di0cz39rwokwLXA6sUuauPZg7zCCqPGF4zXZ3MBftXz3C7WLyu',
    '+1',
    '8382022846',
    NULL,
    'admin',
    'https://via.placeholder.com/600/45601a',
    'cus_MH3FMZpE6oF0D7',
    NULL,
    0,
    '2022-08-16 20:07:56.075967',
    '2022-08-24 19:07:32.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    1,
    NULL
  );
INSERT INTO
  `users` (
    `id`,
    `full_name`,
    `email`,
    `password`,
    `country_code`,
    `mobile_number`,
    `otp`,
    `user_type`,
    `profile_image`,
    `stripe_customer_id`,
    `stripe_account_id`,
    `user_subscription_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `admin_address`,
    `is_active`,
    `last_purchase_date`
  )
VALUES
  (
    '775495e4-d08d-4ec2-8ed3-11af8b4ee164',
    'SARANG PATEL',
    'sarangp3010@gmail.com',
    '$2a$08$sO7PN/EyY8WnXhZeWbKWIeHi./dhBy8QR5x1kZnRKpNPraem8H6Va',
    '+1',
    '8382022846',
    NULL,
    'vendor',
    NULL,
    'cus_MIyPd4HAeM1lat',
    NULL,
    0,
    '2022-08-24 12:30:03.776691',
    '2022-08-24 12:43:58.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    1,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vendor_bank_details
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vendor_details
# ------------------------------------------------------------

INSERT INTO
  `vendor_details` (
    `id`,
    `business_name`,
    `business_address`,
    `comission_fee`,
    `leakage_fee`,
    `verification_send_datetime`,
    `personal_id`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `low_stock_reminder`,
    `zipcode_ids`,
    `accessory_ids`,
    `is_reset_password`,
    `status`,
    `profile_completed_status`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    1,
    NULL,
    NULL,
    10,
    '2',
    NULL,
    NULL,
    '2022-08-24 12:30:03.791782',
    '2022-08-24 12:43:58.000000',
    NULL,
    NULL,
    '1',
    '2',
    0,
    1,
    6,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '775495e4-d08d-4ec2-8ed3-11af8b4ee164'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vendor_product_pricing_tiers
# ------------------------------------------------------------

INSERT INTO
  `vendor_product_pricing_tiers` (
    `id`,
    `price`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `vendor_product_id`,
    `vendor_product_tiers_id`,
    `cylinder_size_id`,
    `category_id`
  )
VALUES
  (
    1,
    12,
    '2022-08-24 12:35:35.277039',
    '2022-08-24 12:35:35.277039',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    2,
    6,
    1,
    1
  );
INSERT INTO
  `vendor_product_pricing_tiers` (
    `id`,
    `price`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `vendor_product_id`,
    `vendor_product_tiers_id`,
    `cylinder_size_id`,
    `category_id`
  )
VALUES
  (
    2,
    12,
    '2022-08-24 12:35:35.287400',
    '2022-08-24 12:35:35.287400',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    2,
    7,
    1,
    1
  );
INSERT INTO
  `vendor_product_pricing_tiers` (
    `id`,
    `price`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `vendor_product_id`,
    `vendor_product_tiers_id`,
    `cylinder_size_id`,
    `category_id`
  )
VALUES
  (
    3,
    12,
    '2022-08-24 12:35:35.293779',
    '2022-08-24 12:35:35.293779',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    2,
    8,
    1,
    1
  );
INSERT INTO
  `vendor_product_pricing_tiers` (
    `id`,
    `price`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `vendor_product_id`,
    `vendor_product_tiers_id`,
    `cylinder_size_id`,
    `category_id`
  )
VALUES
  (
    4,
    12,
    '2022-08-24 12:35:35.298923',
    '2022-08-24 12:35:35.298923',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    2,
    9,
    1,
    1
  );
INSERT INTO
  `vendor_product_pricing_tiers` (
    `id`,
    `price`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `vendor_product_id`,
    `vendor_product_tiers_id`,
    `cylinder_size_id`,
    `category_id`
  )
VALUES
  (
    5,
    11,
    '2022-08-24 12:36:06.704842',
    '2022-08-24 12:36:06.704842',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    1,
    NULL,
    NULL
  );
INSERT INTO
  `vendor_product_pricing_tiers` (
    `id`,
    `price`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `vendor_product_id`,
    `vendor_product_tiers_id`,
    `cylinder_size_id`,
    `category_id`
  )
VALUES
  (
    6,
    11,
    '2022-08-24 12:36:06.713898',
    '2022-08-24 12:36:06.713898',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    2,
    NULL,
    NULL
  );
INSERT INTO
  `vendor_product_pricing_tiers` (
    `id`,
    `price`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `vendor_product_id`,
    `vendor_product_tiers_id`,
    `cylinder_size_id`,
    `category_id`
  )
VALUES
  (
    7,
    11,
    '2022-08-24 12:36:06.721142',
    '2022-08-24 12:36:06.721142',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    3,
    NULL,
    NULL
  );
INSERT INTO
  `vendor_product_pricing_tiers` (
    `id`,
    `price`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `vendor_product_id`,
    `vendor_product_tiers_id`,
    `cylinder_size_id`,
    `category_id`
  )
VALUES
  (
    8,
    11,
    '2022-08-24 12:36:06.725874',
    '2022-08-24 12:36:06.725874',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    4,
    NULL,
    NULL
  );
INSERT INTO
  `vendor_product_pricing_tiers` (
    `id`,
    `price`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `vendor_product_id`,
    `vendor_product_tiers_id`,
    `cylinder_size_id`,
    `category_id`
  )
VALUES
  (
    9,
    12,
    '2022-08-24 12:36:06.729548',
    '2022-08-24 12:36:06.729548',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    5,
    NULL,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vendor_product_tiers
# ------------------------------------------------------------

INSERT INTO
  `vendor_product_tiers` (
    `id`,
    `from`,
    `to`,
    `position`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `vendor_product_id`
  )
VALUES
  (
    1,
    0,
    99,
    1,
    '2022-08-24 12:33:24.626711',
    '2022-08-24 12:33:24.626711',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1
  );
INSERT INTO
  `vendor_product_tiers` (
    `id`,
    `from`,
    `to`,
    `position`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `vendor_product_id`
  )
VALUES
  (
    2,
    100,
    249,
    2,
    '2022-08-24 12:33:24.632579',
    '2022-08-24 12:33:24.632579',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1
  );
INSERT INTO
  `vendor_product_tiers` (
    `id`,
    `from`,
    `to`,
    `position`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `vendor_product_id`
  )
VALUES
  (
    3,
    250,
    499,
    3,
    '2022-08-24 12:33:24.638650',
    '2022-08-24 12:33:24.638650',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1
  );
INSERT INTO
  `vendor_product_tiers` (
    `id`,
    `from`,
    `to`,
    `position`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `vendor_product_id`
  )
VALUES
  (
    4,
    500,
    999,
    4,
    '2022-08-24 12:33:24.642570',
    '2022-08-24 12:33:24.642570',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1
  );
INSERT INTO
  `vendor_product_tiers` (
    `id`,
    `from`,
    `to`,
    `position`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `vendor_product_id`
  )
VALUES
  (
    5,
    1000,
    2147483647,
    5,
    '2022-08-24 12:33:24.647757',
    '2022-08-24 12:33:24.647757',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1
  );
INSERT INTO
  `vendor_product_tiers` (
    `id`,
    `from`,
    `to`,
    `position`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `vendor_product_id`
  )
VALUES
  (
    6,
    0,
    3,
    1,
    '2022-08-24 12:34:36.580293',
    '2022-08-24 12:34:36.580293',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    2
  );
INSERT INTO
  `vendor_product_tiers` (
    `id`,
    `from`,
    `to`,
    `position`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `vendor_product_id`
  )
VALUES
  (
    7,
    4,
    6,
    2,
    '2022-08-24 12:34:36.587579',
    '2022-08-24 12:34:36.587579',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    2
  );
INSERT INTO
  `vendor_product_tiers` (
    `id`,
    `from`,
    `to`,
    `position`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `vendor_product_id`
  )
VALUES
  (
    8,
    7,
    10,
    3,
    '2022-08-24 12:34:36.592434',
    '2022-08-24 12:34:36.592434',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    2
  );
INSERT INTO
  `vendor_product_tiers` (
    `id`,
    `from`,
    `to`,
    `position`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `vendor_product_id`
  )
VALUES
  (
    9,
    11,
    2147483647,
    4,
    '2022-08-24 12:34:36.597407',
    '2022-08-24 12:34:36.597407',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    2
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vendor_products
# ------------------------------------------------------------

INSERT INTO
  `vendor_products` (
    `id`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `zipcode_ids`,
    `is_sales_tax`,
    `is_completed`,
    `order_type`,
    `vendor_id`,
    `product_id`
  )
VALUES
  (
    1,
    '2022-08-24 12:33:24.616490',
    '2022-08-24 12:36:08.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    0,
    1,
    '775495e4-d08d-4ec2-8ed3-11af8b4ee164',
    1
  );
INSERT INTO
  `vendor_products` (
    `id`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `zipcode_ids`,
    `is_sales_tax`,
    `is_completed`,
    `order_type`,
    `vendor_id`,
    `product_id`
  )
VALUES
  (
    2,
    '2022-08-24 12:34:36.572461',
    '2022-08-24 12:35:40.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    0,
    2,
    '775495e4-d08d-4ec2-8ed3-11af8b4ee164',
    2
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vendor_schedule
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vendor_stocks
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vendro_stock_history
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: zipcodes
# ------------------------------------------------------------

INSERT INTO
  `zipcodes` (
    `id`,
    `area_name`,
    `zipcode`,
    `sales_tax`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `status`,
    `county_id`,
    `state_id`
  )
VALUES
  (
    1,
    'Myrtle Ave',
    12208,
    30,
    '2022-08-20 08:44:23.563563',
    '2022-08-20 08:44:23.563563',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    1,
    1
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
