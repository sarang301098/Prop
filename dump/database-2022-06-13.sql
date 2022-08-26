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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 65 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: app_settings
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `app_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_type` int(11) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: cancellation_reasons
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `cancellation_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: cart
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `order_type` int(11) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `schedule_date` timestamp NULL DEFAULT NULL,
  `lekage_fee` double DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `user_id` char(36) DEFAULT NULL,
  `vendor_id` char(36) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `cylindersize_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `zipcode_id` int(11) DEFAULT NULL,
  `timeslot_id` int(11) DEFAULT NULL,
  `promocode_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7ce20a2eea831b268930f436f8` (`vendor_id`),
  KEY `IDX_dccd1ec2d6f5644a69adf163bc` (`product_id`),
  KEY `IDX_33b9137cce82da120723237992` (`accessory_id`),
  KEY `IDX_27718461eafde5fb02430c473c` (`cylindersize_id`),
  KEY `IDX_1db2a89d4a5924ddd500952283` (`category_id`),
  KEY `IDX_99f9a06fca99e2188199a5e2d5` (`promocode_id`),
  KEY `FK_f091e86a234693a49084b4c2c86` (`user_id`),
  KEY `FK_1ca043a36187d428845c8435cdc` (`location_id`),
  KEY `IDX_b1f045d785800d432478fb3702` (`zipcode_id`),
  KEY `IDX_24b7aa2da84a1709c712bc9ff4` (`timeslot_id`),
  CONSTRAINT `FK_1ca043a36187d428845c8435cdc` FOREIGN KEY (`location_id`) REFERENCES `delivery_locations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_1db2a89d4a5924ddd500952283f` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_24b7aa2da84a1709c712bc9ff49` FOREIGN KEY (`timeslot_id`) REFERENCES `time_slots` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_27718461eafde5fb02430c473c6` FOREIGN KEY (`cylindersize_id`) REFERENCES `cylinder_sizes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_33b9137cce82da1207232379920` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_7ce20a2eea831b268930f436f84` FOREIGN KEY (`vendor_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_99f9a06fca99e2188199a5e2d59` FOREIGN KEY (`promocode_id`) REFERENCES `promocodes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_b1f045d785800d432478fb37029` FOREIGN KEY (`zipcode_id`) REFERENCES `zipcodes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_dccd1ec2d6f5644a69adf163bc1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_f091e86a234693a49084b4c2c86` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 40 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: categories
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `order_type` int(11) DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: cms_pages
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `cms_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `status` int(11) DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: contact_us
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `contact_us` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_0053da5d6eb571f3ba05db1fb1` (`user_id`),
  CONSTRAINT `FK_0053da5d6eb571f3ba05db1fb17` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: counties
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `counties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sales_tax_one` double NOT NULL,
  `sales_tax_two` double NOT NULL,
  `total_zipcodes` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `state_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_30e46c84494b78e20ba443984c` (`state_id`),
  CONSTRAINT `FK_30e46c84494b78e20ba443984c6` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: cylinder_sizes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `cylinder_sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cylinder_size` double NOT NULL,
  `status` int(11) DEFAULT '1',
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 29 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: delivery_locations
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `delivery_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  `price` double DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: documents
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_url` varchar(255) DEFAULT NULL,
  `document_type` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_c7481daf5059307842edef74d7` (`user_id`),
  CONSTRAINT `FK_c7481daf5059307842edef74d73` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 24 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: driver_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `driver_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avg_rating` double DEFAULT NULL,
  `is_suspended` tinyint(4) NOT NULL DEFAULT '0',
  `is_online` tinyint(4) NOT NULL DEFAULT '1',
  `is_approved` tinyint(4) NOT NULL DEFAULT '1',
  `order_type` int(11) DEFAULT NULL,
  `zipcode_ids` text,
  `personal_id` varchar(255) DEFAULT NULL,
  `id_information` varchar(255) DEFAULT NULL,
  `driver_vehicle` varchar(255) DEFAULT NULL,
  `vehical_no` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `identity` varchar(255) DEFAULT NULL,
  `licence_no` varchar(255) DEFAULT NULL,
  `identity_information` varchar(255) DEFAULT NULL,
  `order_capacity` int(11) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `long` double DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_415a8b64cbf86db96a73dcd090` (`user_id`),
  KEY `IDX_14282f6b2039c773f725eaf929` (`vendor_id`),
  CONSTRAINT `FK_14282f6b2039c773f725eaf929c` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_415a8b64cbf86db96a73dcd0902` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 32 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: driver_payments
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `driver_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `to_user_id` char(36) DEFAULT NULL,
  `from_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_478335f88232a7bfc08f8b0025e` (`to_user_id`),
  KEY `FK_79e3d11f95cb1d98c5a7fab9bdb` (`from_user_id`),
  CONSTRAINT `FK_478335f88232a7bfc08f8b0025e` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_79e3d11f95cb1d98c5a7fab9bdb` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: driver_stocks
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `driver_stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `category_id` int(11) DEFAULT NULL,
  `cylinder_size_id` int(11) DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_339059463a8df4c4ceb085c7f3` (`category_id`),
  KEY `IDX_c17b4da37a3e51be3f7821fd0d` (`cylinder_size_id`),
  KEY `IDX_13695aaa459477bc8b4d31ffec` (`accessory_id`),
  KEY `IDX_0e32b57edf11f2b18277e27111` (`product_id`),
  KEY `FK_ffc19d7c2bf9eba906eb42ab99b` (`driver_id`),
  CONSTRAINT `FK_0e32b57edf11f2b18277e271114` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_13695aaa459477bc8b4d31ffec9` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_339059463a8df4c4ceb085c7f3e` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_c17b4da37a3e51be3f7821fd0d2` FOREIGN KEY (`cylinder_size_id`) REFERENCES `cylinder_sizes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ffc19d7c2bf9eba906eb42ab99b` FOREIGN KEY (`driver_id`) REFERENCES `driver_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: email_templates
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `template` longtext NOT NULL,
  `key` varchar(255) NOT NULL,
  `status` int(11) DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: emegergency_orders
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `emegergency_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` varchar(255) NOT NULL,
  `end_time` varchar(255) NOT NULL,
  `schedule_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7c8cc8ef5d5668254547eb71b29` (`order_id`),
  CONSTRAINT `FK_7c8cc8ef5d5668254547eb71b29` FOREIGN KEY (`order_id`) REFERENCES `order_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: faqs
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `status` int(11) DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: freelance_drivers_payment
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `freelance_drivers_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paid_amount` double DEFAULT '0',
  `schedule_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `driver_id` char(36) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ae53694638db82ec10c72263ccc` (`driver_id`),
  KEY `IDX_2d2d30826f698745acbb3d8325` (`order_id`),
  CONSTRAINT `FK_2d2d30826f698745acbb3d83255` FOREIGN KEY (`order_id`) REFERENCES `order_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ae53694638db82ec10c72263ccc` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: government_holidays
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `government_holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `vendor_ids` text,
  `date` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: membership_paln_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `membership_paln_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `key` int(11) DEFAULT NULL,
  `is_percentage` tinyint(4) NOT NULL DEFAULT '0',
  `is_dollar` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `membership_plan_prices_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_c2786df74ef71db9eb30b25d9b` (`membership_plan_prices_id`),
  CONSTRAINT `FK_c2786df74ef71db9eb30b25d9be` FOREIGN KEY (`membership_plan_prices_id`) REFERENCES `membership_paln_prices` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 41 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: membership_paln_prices
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `membership_paln_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `membership_plan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_427f11e694d0266aac54f7a164` (`membership_plan_id`),
  CONSTRAINT `FK_427f11e694d0266aac54f7a1640` FOREIGN KEY (`membership_plan_id`) REFERENCES `membership_palns` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: membership_palns
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `membership_palns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `product_ids` text,
  `category_ids` text,
  `type` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: migrations
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: modules
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 34 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: notification
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` varchar(255) DEFAULT NULL,
  `to_ids` text,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `notification_type` int(11) DEFAULT NULL,
  `to_user_type` int(11) DEFAULT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  `deleted_by` text,
  `readed_by` text,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `admin_message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 152 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: order_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_type` int(11) DEFAULT NULL,
  `image_one` varchar(255) DEFAULT NULL,
  `image_two` varchar(255) DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `leakage_fee` double DEFAULT NULL,
  `schedule_date` timestamp NULL DEFAULT NULL,
  `index_price` double DEFAULT NULL,
  `vendor_delivery_fee` double DEFAULT NULL,
  `vendor_received_amount` double DEFAULT NULL,
  `admin_received_amount` double DEFAULT NULL,
  `refund_amount` double DEFAULT NULL,
  `cancellation_reason_other` varchar(255) DEFAULT NULL,
  `sales_tax_percentage` double DEFAULT NULL,
  `sales_tax_amount` double DEFAULT NULL,
  `location_fee` double DEFAULT NULL,
  `cylindersize` double DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `is_delivered` tinyint(4) NOT NULL DEFAULT '0',
  `promocode_discount_amount` double DEFAULT NULL,
  `promocode_discount_percentage` double DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `vendor_id` char(36) DEFAULT NULL,
  `driver_id` char(36) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `cylinder_size_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `promocodes_id` int(11) DEFAULT NULL,
  `cancellation_reason_id` int(11) DEFAULT NULL,
  `status` enum(
  'ongoing',
  'pending',
  'refilled',
  'delivered',
  'cancelled',
  'rescheduled',
  'cancelled_by_admin',
  'cancelled_by_driver'
  ) NOT NULL,
  `general_delivery_fee` double DEFAULT NULL,
  `freelance_driver_received_amount` double DEFAULT '0',
  `driver_cancellation_charge` double DEFAULT NULL,
  `customer_cancellation_charge` double DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3ff3367344edec5de2355a562e` (`order_id`),
  KEY `IDX_ce1f689e43b39edd9330cadaeb` (`product_id`),
  KEY `IDX_21267863913e32276344f1c937` (`vendor_id`),
  KEY `IDX_75e2aad63331f800ec840f9f82` (`driver_id`),
  KEY `IDX_a05e9dce819702b9689265ce59` (`location_id`),
  KEY `IDX_6504c11ff0d81a959a66f46e5b` (`category_id`),
  KEY `IDX_ac4d0edef798c1ccfaf57a5b2a` (`accessory_id`),
  KEY `IDX_8bc5bb5d148c88656cdba1867b` (`promocodes_id`),
  KEY `IDX_20eaba40d6fb81cacbf6aaa296` (`cancellation_reason_id`),
  KEY `IDX_dbab21192326404c21e270b884` (`cylinder_size_id`),
  CONSTRAINT `FK_20eaba40d6fb81cacbf6aaa296f` FOREIGN KEY (`cancellation_reason_id`) REFERENCES `cancellation_reasons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_21267863913e32276344f1c9376` FOREIGN KEY (`vendor_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_3ff3367344edec5de2355a562ee` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_6504c11ff0d81a959a66f46e5bc` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_75e2aad63331f800ec840f9f82e` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_8bc5bb5d148c88656cdba1867b1` FOREIGN KEY (`promocodes_id`) REFERENCES `promocodes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_a05e9dce819702b9689265ce594` FOREIGN KEY (`location_id`) REFERENCES `delivery_locations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ac4d0edef798c1ccfaf57a5b2a4` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ce1f689e43b39edd9330cadaeb8` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_dbab21192326404c21e270b8847` FOREIGN KEY (`cylinder_size_id`) REFERENCES `cylinder_sizes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 41 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: order_status_log
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `order_status_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `status` enum(
  'ongoing',
  'pending',
  'refilled',
  'delivered',
  'cancelled',
  'rescheduled',
  'cancelled_by_admin',
  'cancelled_by_driver'
  ) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9e4f4db0415153a47094d6a0ae` (`user_id`),
  KEY `IDX_9198a9719572e9e2b880fedfed` (`order_id`),
  CONSTRAINT `FK_9198a9719572e9e2b880fedfed8` FOREIGN KEY (`order_id`) REFERENCES `order_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_9e4f4db0415153a47094d6a0aed` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 103 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: orders
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `invoiced_receipt_url` varchar(255) DEFAULT NULL,
  `cancellation_reason_other` varchar(255) DEFAULT NULL,
  `service_fee` double DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `admin_total_delivery_fee` double DEFAULT NULL,
  `vendor_total_deliveryfee` double DEFAULT NULL,
  `payment_type` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `stripe_payment_intent_id` varchar(255) DEFAULT NULL,
  `is_paid` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `time_slot_id` int(11) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `long` varchar(255) DEFAULT NULL,
  `user_address_id` int(11) DEFAULT NULL,
  `service_charge` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8941c75f82991baa0d5046ecba` (`time_slot_id`),
  KEY `IDX_a922b820eeef29ac1c6800e826` (`user_id`),
  KEY `IDX_645fc4a8c6f039b1ee2985efd3` (`user_address_id`),
  CONSTRAINT `FK_645fc4a8c6f039b1ee2985efd3e` FOREIGN KEY (`user_address_id`) REFERENCES `user_addresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_8941c75f82991baa0d5046ecba3` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slots` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_a922b820eeef29ac1c6800e826a` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 26 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: permissions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `all` tinyint(4) NOT NULL DEFAULT '0',
  `index` tinyint(4) NOT NULL DEFAULT '0',
  `add` tinyint(4) NOT NULL DEFAULT '0',
  `edit` tinyint(4) NOT NULL DEFAULT '0',
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `view` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_f10931e7bb05a3b434642ed279` (`role_id`),
  KEY `IDX_738f46bb9ac6ea356f1915835d` (`module_id`),
  CONSTRAINT `FK_738f46bb9ac6ea356f1915835d0` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_f10931e7bb05a3b434642ed2797` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 959 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: products
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `order_type` int(11) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `test` int(11) DEFAULT NULL,
  `test+1` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: products_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `products_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index_price` double NOT NULL DEFAULT '0',
  `discount` double NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_50acc245866371b959c584c8e4` (`product_id`),
  KEY `IDX_6fe6ff5c2d867e8a2c118a6335` (`category_id`),
  CONSTRAINT `FK_50acc245866371b959c584c8e48` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_6fe6ff5c2d867e8a2c118a63356` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: promocodes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `promocodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `promocode` varchar(255) NOT NULL,
  `order_type` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `start_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `category_ids` text,
  `customer_ids` text,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1650f86f69a842027bb5ffdab10` (`product_id`),
  CONSTRAINT `FK_1650f86f69a842027bb5ffdab10` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: ratings
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(11) DEFAULT NULL,
  `review` varchar(255) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `create_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `order_detail_id` int(11) DEFAULT NULL,
  `to_user_id` char(36) DEFAULT NULL,
  `from_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e67884057811d3f9f666c4005f6` (`order_detail_id`),
  KEY `FK_0ab402c56fa2eb451efa04c76fc` (`to_user_id`),
  KEY `FK_753b8e7442994cffcdf77581f4e` (`from_user_id`),
  CONSTRAINT `FK_0ab402c56fa2eb451efa04c76fc` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_753b8e7442994cffcdf77581f4e` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_e67884057811d3f9f666c4005f6` FOREIGN KEY (`order_detail_id`) REFERENCES `order_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: roles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 14 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: seed
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `seed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: states
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sales_tax` double NOT NULL,
  `total_counties` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: sub_admin_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `sub_admin_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_size` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_272764a3db10948f6a4bafe230` (`user_id`),
  KEY `IDX_91494b5af9c10eb3815f48ea0e` (`role_id`),
  CONSTRAINT `FK_272764a3db10948f6a4bafe2301` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_91494b5af9c10eb3815f48ea0ec` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 15 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: time_slots
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `time_slots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 21 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tokens
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` varchar(255) DEFAULT NULL,
  `device_type` varchar(255) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `login_count` int(11) DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `access_token` longtext,
  `refresh_token` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_8769073e38c365f315426554ca` (`user_id`),
  CONSTRAINT `FK_8769073e38c365f315426554ca5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 31 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: user_addresses
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `user_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `county` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '1',
  `address` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `zip_code_id` int(11) DEFAULT NULL,
  `house_no` varchar(255) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `long` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7a5100ce0548ef27a6f1533a5c` (`user_id`),
  KEY `IDX_31ed167ed8facc9eae3115a4c9` (`zip_code_id`),
  CONSTRAINT `FK_31ed167ed8facc9eae3115a4c97` FOREIGN KEY (`zip_code_id`) REFERENCES `zipcodes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_7a5100ce0548ef27a6f1533a5ce` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 26 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: user_order_statistics
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `user_order_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_of_order_delivered` int(11) DEFAULT '0',
  `no_of_order_cancel` int(11) DEFAULT '0',
  `no_of_order_ongoing` int(11) DEFAULT '0',
  `no_of_order_passed` int(11) DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `no_of_orders` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_4454c6220457fd23a4eb8e4df0` (`user_id`),
  CONSTRAINT `FK_4454c6220457fd23a4eb8e4df09` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: user_subscription
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `user_subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `is_active` tinyint(4) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `membership_plan_id` int(11) DEFAULT NULL,
  `membership_plan_price_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3c6b79d14e6539ddb486aab80f` (`user_id`),
  KEY `IDX_6e9eb6f1f58508921845e481d1` (`membership_plan_id`),
  KEY `IDX_7530849df7fe07fa7976e55845` (`membership_plan_price_id`),
  CONSTRAINT `FK_3c6b79d14e6539ddb486aab80f5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_6e9eb6f1f58508921845e481d10` FOREIGN KEY (`membership_plan_id`) REFERENCES `membership_palns` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_7530849df7fe07fa7976e558459` FOREIGN KEY (`membership_plan_price_id`) REFERENCES `membership_paln_prices` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: user_verification_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `user_verification_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verified` tinyint(4) NOT NULL DEFAULT '0',
  `token_or_otp` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9f6391ad105d44688bcc25c682` (`user_id`),
  CONSTRAINT `FK_9f6391ad105d44688bcc25c6823` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 207 DEFAULT CHARSET = utf8;

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
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `user_subscription_count` int(11) DEFAULT '0',
  `last_purchase_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vendor_bank_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vendor_bank_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(255) NOT NULL,
  `account_holder_name` varchar(255) NOT NULL,
  `account_number` bigint(20) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `branch_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ae3d74917e074ae42103cb6da6` (`user_id`),
  CONSTRAINT `FK_ae3d74917e074ae42103cb6da61` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vendor_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vendor_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_name` varchar(255) DEFAULT NULL,
  `business_address` varchar(255) DEFAULT NULL,
  `comission_fee` double DEFAULT NULL,
  `leakage_fee` varchar(255) DEFAULT NULL,
  `verification_send_datetime` timestamp NULL DEFAULT NULL,
  `personal_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `low_stock_reminder` int(11) DEFAULT NULL,
  `zipcode_ids` text,
  `accessory_ids` text,
  `is_reset_password` tinyint(4) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '1',
  `profile_completed_status` int(11) DEFAULT '1',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_d45a115f63360b929e5e4844ee` (`user_id`),
  CONSTRAINT `FK_d45a115f63360b929e5e4844ee2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 41 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vendor_product_pricing_tiers
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vendor_product_pricing_tiers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `vendor_product_id` int(11) DEFAULT NULL,
  `vendor_product_tiers_id` int(11) DEFAULT NULL,
  `cylinder_size_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_c1d9ef38a90f7fb3fff78c4da5` (`vendor_product_id`),
  KEY `IDX_19f7cda24343063f145c188f42` (`vendor_product_tiers_id`),
  KEY `IDX_3910622e905801e622790b48ea` (`cylinder_size_id`),
  KEY `IDX_2450678e2aeab974d2dc975566` (`category_id`),
  CONSTRAINT `FK_19f7cda24343063f145c188f42e` FOREIGN KEY (`vendor_product_tiers_id`) REFERENCES `vendor_product_tiers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_2450678e2aeab974d2dc9755664` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_3910622e905801e622790b48ea4` FOREIGN KEY (`cylinder_size_id`) REFERENCES `cylinder_sizes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_c1d9ef38a90f7fb3fff78c4da5a` FOREIGN KEY (`vendor_product_id`) REFERENCES `vendor_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 331 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vendor_product_tiers
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vendor_product_tiers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `vendor_product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_57a77e96f13d33748960545b11` (`vendor_product_id`),
  CONSTRAINT `FK_57a77e96f13d33748960545b11d` FOREIGN KEY (`vendor_product_id`) REFERENCES `vendor_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 288 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vendor_products
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vendor_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `zipcode_ids` text,
  `is_sales_tax` tinyint(4) NOT NULL DEFAULT '1',
  `is_completed` tinyint(4) NOT NULL DEFAULT '0',
  `order_type` int(11) DEFAULT NULL,
  `vendor_id` char(36) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_efbf6138b5c9d076d816c4ba4c` (`vendor_id`),
  KEY `IDX_92aa72d2cb0866652f7da6d0c9` (`product_id`),
  CONSTRAINT `FK_92aa72d2cb0866652f7da6d0c9f` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_efbf6138b5c9d076d816c4ba4c3` FOREIGN KEY (`vendor_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 64 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vendor_schedule
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vendor_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `max_accept_order_limit` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `is_checked` tinyint(4) NOT NULL DEFAULT '1',
  `time_slot_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_67e96930d5e4ac94e7a606ce02` (`time_slot_id`),
  KEY `IDX_9a768c9bb2b70b65d8a79c7569` (`vendor_id`),
  CONSTRAINT `FK_67e96930d5e4ac94e7a606ce028` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slots` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_9a768c9bb2b70b65d8a79c7569b` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 269 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vendor_stocks
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vendor_stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_at` timestamp NULL DEFAULT NULL,
  `added_stock_qty` double DEFAULT NULL,
  `remaining_stock` double DEFAULT NULL,
  `opening_stock` double DEFAULT NULL,
  `sold_out_stock` double DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `cylinder_size_id` int(11) DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `added_filled` double DEFAULT NULL,
  `added_empty` double DEFAULT NULL,
  `returned_filled` double DEFAULT NULL,
  `returned_empty` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_d2b29d140ec7463e7edcd27d0e` (`category_id`),
  KEY `IDX_9bbc5eb5630063ad4313156828` (`cylinder_size_id`),
  KEY `IDX_81e679a0a96f2b2d654de01dca` (`accessory_id`),
  KEY `IDX_6c733f17ffcab1cf06b81aff9d` (`product_id`),
  KEY `IDX_6bdf76cb739d6266e0ef793c80` (`vendor_id`),
  CONSTRAINT `FK_6bdf76cb739d6266e0ef793c80d` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_6c733f17ffcab1cf06b81aff9d6` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_81e679a0a96f2b2d654de01dca1` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_9bbc5eb5630063ad43131568285` FOREIGN KEY (`cylinder_size_id`) REFERENCES `cylinder_sizes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_d2b29d140ec7463e7edcd27d0e6` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vendro_stock_history
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vendro_stock_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_at` timestamp NULL DEFAULT NULL,
  `added_stock_qty` double DEFAULT NULL,
  `return_stock_qty` double DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `cylinder_size_id` int(11) DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1aa2ab66d96c5c6959adb2b3f0` (`category_id`),
  KEY `IDX_ba52ec71c7cdb4120ece6b8b13` (`cylinder_size_id`),
  KEY `IDX_ce25cd57077e62a8f209cc8bd2` (`accessory_id`),
  KEY `FK_8d7e6a38e757c24630ac5ec585b` (`product_id`),
  KEY `FK_a44954ef13d5cf3e839f7a190d1` (`vendor_id`),
  CONSTRAINT `FK_1aa2ab66d96c5c6959adb2b3f0a` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_8d7e6a38e757c24630ac5ec585b` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_a44954ef13d5cf3e839f7a190d1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ba52ec71c7cdb4120ece6b8b134` FOREIGN KEY (`cylinder_size_id`) REFERENCES `cylinder_sizes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ce25cd57077e62a8f209cc8bd25` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: zipcodes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `zipcodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(255) NOT NULL,
  `zipcode` int(11) NOT NULL,
  `sales_tax` double NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `county_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8a189cdb16235f34b8f8fcfef8` (`county_id`),
  KEY `IDX_44e9961b34280abba0caeb51d2` (`state_id`),
  CONSTRAINT `FK_44e9961b34280abba0caeb51d29` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_8a189cdb16235f34b8f8fcfef89` FOREIGN KEY (`county_id`) REFERENCES `counties` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 14 DEFAULT CHARSET = utf8;

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
    'Sarang Test',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    100,
    'Test',
    1,
    '2022-04-27 15:38:36.275191',
    '2022-04-27 15:38:36.275191',
    NULL,
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
    'Sarang Test 1',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    100,
    'ewaqe',
    1,
    '2022-04-27 15:38:48.745552',
    '2022-04-27 18:02:47.000000',
    '2022-04-27 18:02:47.000000',
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
    3,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    9999,
    'sdfsadfdsaf',
    1,
    '2022-04-27 17:10:44.499141',
    '2022-04-27 17:14:05.000000',
    '2022-04-27 17:14:05.000000',
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
    4,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    9999,
    'sdfdsaf',
    1,
    '2022-04-27 17:14:25.888407',
    '2022-04-27 17:14:34.000000',
    '2022-04-27 17:14:34.000000',
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
    5,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'sdfsdsadf',
    1,
    '2022-04-27 17:15:25.907210',
    '2022-04-27 17:15:33.000000',
    '2022-04-27 17:15:33.000000',
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
    6,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    4564,
    'dfjlafj',
    1,
    '2022-04-27 17:16:23.009284',
    '2022-04-27 17:16:31.000000',
    '2022-04-27 17:16:31.000000',
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
    7,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    222,
    'dfadfadsfdfsadfdsaf',
    1,
    '2022-04-27 17:17:53.133137',
    '2022-04-27 17:18:03.000000',
    '2022-04-27 17:18:03.000000',
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
    8,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    9999,
    'gdfgdf',
    1,
    '2022-04-27 17:20:12.922731',
    '2022-04-27 17:20:22.000000',
    '2022-04-27 17:20:22.000000',
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
    9,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'adfasdf',
    1,
    '2022-04-27 17:21:26.834107',
    '2022-04-27 17:21:38.000000',
    '2022-04-27 17:21:38.000000',
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
    10,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    300,
    'dfsakdfh',
    1,
    '2022-04-27 17:22:35.442653',
    '2022-04-27 17:22:50.000000',
    '2022-04-27 17:22:50.000000',
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
    11,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    500,
    'fsadfsadf',
    1,
    '2022-04-27 17:23:14.041356',
    '2022-04-27 17:23:23.000000',
    '2022-04-27 17:23:23.000000',
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
    12,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    300,
    'dfasdfasdfsadf',
    1,
    '2022-04-27 17:23:47.547155',
    '2022-04-27 17:24:04.000000',
    '2022-04-27 17:24:04.000000',
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
    13,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    30,
    'asdsdasd',
    1,
    '2022-04-27 17:25:02.498860',
    '2022-04-27 17:25:17.000000',
    '2022-04-27 17:25:17.000000',
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
    14,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    22,
    'sdasdd',
    1,
    '2022-04-27 17:32:18.639967',
    '2022-04-27 17:32:33.000000',
    '2022-04-27 17:32:33.000000',
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
    15,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'dsafsadf',
    1,
    '2022-04-27 17:33:28.005085',
    '2022-04-27 17:33:40.000000',
    '2022-04-27 17:33:40.000000',
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
    16,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'saddsfdsa',
    1,
    '2022-04-27 17:34:25.302972',
    '2022-04-27 17:34:35.000000',
    '2022-04-27 17:34:35.000000',
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
    17,
    'wahib',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    50,
    'dfasdfasdf',
    1,
    '2022-04-27 17:35:39.940418',
    '2022-04-27 17:36:03.000000',
    '2022-04-27 17:36:03.000000',
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
    18,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'jgdfslgldsfgj',
    1,
    '2022-04-27 17:36:27.063101',
    '2022-04-27 17:36:38.000000',
    '2022-04-27 17:36:38.000000',
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
    19,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'dssdfsd',
    1,
    '2022-04-27 17:36:53.717559',
    '2022-04-27 17:37:03.000000',
    '2022-04-27 17:37:03.000000',
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
    20,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'kjldsajldsajf',
    1,
    '2022-04-27 17:39:00.799129',
    '2022-04-27 17:39:20.000000',
    '2022-04-27 17:39:20.000000',
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
    21,
    'Qwerty',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'sadfsadf',
    1,
    '2022-04-27 17:39:38.641012',
    '2022-04-27 17:39:47.000000',
    '2022-04-27 17:39:47.000000',
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
    22,
    'fasdfasdf',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    50,
    'sadfsad',
    1,
    '2022-04-27 17:40:59.153932',
    '2022-04-27 17:41:08.000000',
    '2022-04-27 17:41:08.000000',
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
    23,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'sdafsafasdf',
    1,
    '2022-04-27 17:51:12.307858',
    '2022-04-27 17:51:24.000000',
    '2022-04-27 17:51:24.000000',
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
    24,
    'test',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    50,
    'dfasdfsadf',
    1,
    '2022-04-27 17:52:03.011287',
    '2022-04-27 17:52:12.000000',
    '2022-04-27 17:52:12.000000',
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
    25,
    'test',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'asdfadsfdsaf',
    1,
    '2022-04-27 17:52:32.492983',
    '2022-04-27 17:52:41.000000',
    '2022-04-27 17:52:41.000000',
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
    26,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    9999,
    'fasfadsfsadf',
    1,
    '2022-04-27 17:53:00.480078',
    '2022-04-27 17:53:11.000000',
    '2022-04-27 17:53:11.000000',
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
    27,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    50,
    'fasdfdsaf',
    1,
    '2022-04-27 17:53:24.278291',
    '2022-04-27 17:53:40.000000',
    '2022-04-27 17:53:40.000000',
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
    28,
    'test 2',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    9999,
    'dsfadsfsadf',
    1,
    '2022-04-27 17:53:56.381278',
    '2022-04-27 17:54:13.000000',
    '2022-04-27 17:54:13.000000',
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
    29,
    'Qwerty',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'sdfdsf',
    1,
    '2022-04-27 17:54:30.809050',
    '2022-04-27 17:54:43.000000',
    '2022-04-27 17:54:43.000000',
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
    30,
    'Qwerty',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'dfsadfdsafsadf',
    1,
    '2022-04-27 17:55:00.872325',
    '2022-04-27 17:55:15.000000',
    '2022-04-27 17:55:15.000000',
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
    31,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'khjkghjk',
    1,
    '2022-04-27 17:55:39.887697',
    '2022-04-27 17:56:02.000000',
    '2022-04-27 17:56:02.000000',
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
    32,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    50,
    'sdfsadfsadfsadf',
    1,
    '2022-04-27 17:57:45.851517',
    '2022-04-27 17:57:54.000000',
    '2022-04-27 17:57:54.000000',
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
    33,
    'rrrr',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    'ddd',
    1,
    '2022-04-27 18:01:36.921499',
    '2022-04-27 18:01:50.000000',
    '2022-04-27 18:01:50.000000',
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
    34,
    'gggggg',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'g',
    1,
    '2022-04-27 18:02:39.833591',
    '2022-04-28 09:38:09.000000',
    '2022-04-28 09:38:09.000000',
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
    35,
    'asdasda',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    12,
    '212121',
    1,
    '2022-04-27 18:16:39.964578',
    '2022-04-27 18:17:02.000000',
    '2022-04-27 18:17:02.000000',
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
    36,
    'adasdasd',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    100,
    'dasdxa',
    1,
    '2022-04-27 18:17:18.303925',
    '2022-04-27 18:17:28.000000',
    '2022-04-27 18:17:28.000000',
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
    37,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    'dfasdf',
    1,
    '2022-04-28 09:13:26.275335',
    '2022-04-28 09:13:45.000000',
    '2022-04-28 09:13:45.000000',
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
    38,
    'TEST delete',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    50,
    'asdf',
    1,
    '2022-04-28 09:14:07.713305',
    '2022-04-28 09:14:17.000000',
    '2022-04-28 09:14:17.000000',
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
    39,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    5,
    'asdfadsf',
    1,
    '2022-04-28 09:18:04.878975',
    '2022-04-28 09:18:56.000000',
    '2022-04-28 09:18:56.000000',
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
    40,
    'Qwerty',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'fadsfad',
    1,
    '2022-04-28 09:19:06.022440',
    '2022-04-28 09:19:13.000000',
    '2022-04-28 09:19:13.000000',
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
    41,
    'test',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'fasdfsad',
    1,
    '2022-04-28 09:20:22.813784',
    '2022-04-28 09:20:37.000000',
    '2022-04-28 09:20:37.000000',
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
    42,
    'test',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'asdfd',
    1,
    '2022-04-28 09:20:52.303171',
    '2022-04-28 09:21:03.000000',
    '2022-04-28 09:21:03.000000',
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
    43,
    'test',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'dfdsaf',
    1,
    '2022-04-28 09:21:19.029506',
    '2022-04-28 09:21:27.000000',
    '2022-04-28 09:21:27.000000',
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
    44,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'dsafadsfdsf',
    1,
    '2022-04-28 09:38:00.887605',
    '2022-04-28 09:38:39.000000',
    '2022-04-28 09:38:39.000000',
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
    45,
    'qqq',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'qqq',
    1,
    '2022-04-28 09:38:33.542426',
    '2022-04-28 09:38:56.000000',
    '2022-04-28 09:38:56.000000',
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
    46,
    'qqaa',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'aaa',
    1,
    '2022-04-28 09:38:51.533022',
    '2022-04-28 09:40:45.000000',
    '2022-04-28 09:40:45.000000',
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
    47,
    'aaa',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'aaaaaaaaaa',
    1,
    '2022-04-28 09:40:35.981929',
    '2022-04-28 09:45:53.000000',
    '2022-04-28 09:45:53.000000',
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
    48,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'adsfadsf',
    1,
    '2022-04-28 10:32:17.979546',
    '2022-04-28 10:32:26.000000',
    '2022-04-28 10:32:26.000000',
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
    49,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'dsafasdf',
    1,
    '2022-04-28 11:25:46.525699',
    '2022-04-28 11:26:08.000000',
    '2022-04-28 11:26:08.000000',
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
    50,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'fsdfsd',
    1,
    '2022-04-28 11:26:16.929047',
    '2022-04-28 11:27:59.000000',
    '2022-04-28 11:27:59.000000',
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
    51,
    'test',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'kjhdkjahfsdjfh',
    1,
    '2022-04-28 11:28:09.219192',
    '2022-04-28 11:28:35.000000',
    '2022-04-28 11:28:35.000000',
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
    52,
    'test',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    52,
    'ldfsldfdsf',
    1,
    '2022-04-28 11:28:45.811265',
    '2022-04-28 11:31:12.000000',
    '2022-04-28 11:31:12.000000',
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
    53,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    50,
    'asdfasdfdsafsdf',
    1,
    '2022-04-28 11:31:22.783170',
    '2022-04-28 11:32:13.000000',
    '2022-04-28 11:32:13.000000',
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
    54,
    'test',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    9999,
    'dasfadsf',
    1,
    '2022-04-28 11:34:04.382015',
    '2022-04-28 11:34:21.000000',
    '2022-04-28 11:34:21.000000',
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
    55,
    'test 2',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'adsfsadfsadf',
    1,
    '2022-04-28 11:34:15.124588',
    '2022-04-28 11:35:27.000000',
    '2022-04-28 11:35:27.000000',
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
    56,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'fdsafdfsdf',
    1,
    '2022-04-28 11:35:35.531568',
    '2022-04-28 11:36:26.000000',
    '2022-04-28 11:36:26.000000',
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
    57,
    'test 2',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'dsfdsfdsaf',
    1,
    '2022-04-28 11:35:52.333537',
    '2022-04-28 11:36:01.000000',
    '2022-04-28 11:36:01.000000',
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
    58,
    'test 2',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'sfsdf',
    1,
    '2022-04-28 11:36:19.550340',
    '2022-04-28 12:14:55.000000',
    '2022-04-28 12:14:55.000000',
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
    59,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    50,
    'Qwerty',
    1,
    '2022-04-28 12:14:43.921908',
    '2022-04-28 12:15:40.000000',
    '2022-04-28 12:15:40.000000',
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
    60,
    'test 2',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    50,
    'qwerty',
    1,
    '2022-04-28 12:15:29.943497',
    '2022-04-28 12:16:48.000000',
    '2022-04-28 12:16:48.000000',
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
    61,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'qwerty',
    1,
    '2022-04-28 12:16:34.066818',
    '2022-04-28 12:17:19.000000',
    '2022-04-28 12:17:19.000000',
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
    62,
    'test 2',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'qwerty',
    1,
    '2022-04-28 12:17:11.054444',
    '2022-04-28 12:17:11.054444',
    NULL,
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
    63,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'qwerty',
    1,
    '2022-04-28 12:17:53.864854',
    '2022-04-28 12:18:06.000000',
    '2022-04-28 12:18:06.000000',
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
    64,
    'TEST',
    '\thttps://blog.hubspot.com/hubfs/parts-url.jpg',
    20,
    'fadsfadsfasdfdsaf',
    1,
    '2022-04-28 17:44:15.157827',
    '2022-04-28 17:44:15.157827',
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
    1,
    '2022-04-27 14:26:47.841626',
    '2022-05-02 16:09:38.000000',
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
    1,
    '2022-04-27 14:26:47.851624',
    '2022-05-02 16:09:38.000000',
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
    15,
    2,
    1,
    '2022-04-27 14:26:47.855339',
    '2022-05-02 16:09:38.000000',
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
    15,
    1,
    0,
    '2022-04-27 14:26:47.859173',
    '2022-05-09 10:55:31.000000',
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
    20,
    1,
    0,
    '2022-04-27 14:26:47.863015',
    '2022-05-09 10:55:26.000000',
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
    20,
    1,
    0,
    '2022-04-27 14:26:47.866724',
    '2022-06-08 15:39:38.000000',
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
    15,
    1,
    1,
    '2022-04-27 14:26:47.870337',
    '2022-05-02 16:09:15.000000',
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
    20,
    1,
    1,
    '2022-04-27 14:26:47.874976',
    '2022-05-02 16:09:15.000000',
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
    20,
    1,
    1,
    '2022-04-27 14:26:47.880164',
    '2022-06-09 10:32:07.000000',
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
    '2022-04-27 14:26:48.808061',
    '2022-04-27 14:26:48.808061',
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
    '2022-04-27 14:26:48.811457',
    '2022-04-27 14:26:48.811457',
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
    '2022-04-27 14:26:48.814982',
    '2022-04-27 14:26:48.814982',
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
    '2022-04-27 14:26:48.818240',
    '2022-04-27 14:26:48.818240',
    NULL,
    NULL,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: cart
# ------------------------------------------------------------

INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    1,
    '65019ce5-3b9e-4947-aa78-3ca91b18652a',
    2,
    10,
    '2022-05-02 15:34:07.444148',
    '2022-05-04 15:50:53.000000',
    '2022-05-04 15:50:53.000000',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '2022-05-07 14:42:44',
    NULL,
    1,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    1,
    NULL,
    3,
    NULL,
    1,
    4,
    5,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    2,
    'f62f1850-ba29-4b84-8247-962b7c948d9b',
    2,
    5,
    '2022-05-02 16:01:18.609366',
    '2022-05-04 15:50:53.000000',
    '2022-05-04 15:50:53.000000',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '2022-05-07 14:42:44',
    NULL,
    1,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    NULL,
    62,
    4,
    2,
    3,
    4,
    5,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    3,
    'aa656a5f-61ed-4e1e-96a2-b09224d52745',
    2,
    1,
    '2022-05-05 11:28:14.708080',
    '2022-05-19 13:26:41.000000',
    '2022-05-19 13:26:41.000000',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-05-07 14:42:44',
    NULL,
    1,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    NULL,
    62,
    3,
    NULL,
    3,
    4,
    5,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    4,
    '1b95ac4c-3255-474e-ae0c-cfdbf5024ada',
    2,
    5,
    '2022-05-12 12:35:10.851562',
    '2022-05-19 13:26:54.000000',
    '2022-05-19 13:26:54.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-05-07 14:42:44',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    NULL,
    NULL,
    3,
    NULL,
    NULL,
    4,
    5,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    5,
    'dd94f149-76f6-4ddc-9f1f-3595fbce7ebd',
    1,
    5,
    '2022-05-12 12:35:35.313742',
    '2022-05-19 13:27:05.000000',
    '2022-05-19 13:27:05.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-05-12 12:35:20',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    NULL,
    NULL,
    4,
    NULL,
    NULL,
    9,
    8,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    6,
    'ec45d506-ff39-4e9d-8757-724cb56c35a1',
    1,
    50,
    '2022-05-12 12:36:46.905375',
    '2022-05-19 13:27:10.000000',
    '2022-05-19 13:27:10.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-05-12 12:36:37',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    NULL,
    NULL,
    4,
    NULL,
    NULL,
    9,
    5,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    7,
    'cd456ee7-f510-49e1-a3e0-1a4ae215b906',
    1,
    50,
    '2022-05-12 12:41:05.042421',
    '2022-05-19 13:27:14.000000',
    '2022-05-19 13:27:14.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-05-12 12:40:53',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    NULL,
    NULL,
    4,
    NULL,
    NULL,
    9,
    5,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    8,
    'b108597e-84e0-45bf-b64b-2bf4cd181ef5',
    1,
    5000,
    '2022-05-12 12:42:02.835270',
    '2022-05-19 13:27:18.000000',
    '2022-05-19 13:27:18.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-05-12 12:41:49',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    NULL,
    NULL,
    4,
    NULL,
    NULL,
    9,
    5,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    9,
    'ef5216d2-78ee-4679-897c-75684224d391',
    1,
    1000,
    '2022-05-12 12:42:51.442976',
    '2022-05-19 13:27:21.000000',
    '2022-05-19 13:27:21.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-05-12 12:42:43',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    NULL,
    NULL,
    4,
    NULL,
    NULL,
    9,
    8,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    10,
    '1f4305ba-2c48-41e1-9b25-f5fb766f8746',
    1,
    900,
    '2022-05-12 12:44:11.453307',
    '2022-05-19 13:27:41.000000',
    '2022-05-19 13:27:41.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-05-12 12:44:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    NULL,
    NULL,
    4,
    NULL,
    NULL,
    9,
    9,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    11,
    '9f4dcba4-c168-4f56-98be-ec326e311b82',
    1,
    100,
    '2022-05-12 12:48:21.812219',
    '2022-05-19 13:27:46.000000',
    '2022-05-19 13:27:46.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-07-12 12:48:08',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    NULL,
    NULL,
    4,
    NULL,
    NULL,
    9,
    9,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    12,
    'ab1a638a-8fbc-4045-8fb0-fa75739e8fe6',
    2,
    5,
    '2022-05-26 11:48:30.240195',
    '2022-05-31 16:09:14.000000',
    '2022-05-31 16:09:14.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-05-26 14:42:44',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    1,
    62,
    3,
    NULL,
    3,
    4,
    5,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    13,
    'de39aa70-a854-44e6-92cc-e3db24a9026b',
    2,
    5,
    '2022-05-26 11:49:13.757051',
    '2022-05-27 13:51:13.000000',
    '2022-05-27 13:51:13.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-05-26 14:42:44',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    NULL,
    NULL,
    3,
    NULL,
    NULL,
    4,
    5,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    14,
    'ea603cc1-6d90-4cdc-a6e0-d1cbe650a404',
    1,
    343,
    '2022-05-27 13:16:27.582895',
    '2022-05-27 13:52:00.000000',
    '2022-05-27 13:52:00.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-05-28 00:00:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    2,
    NULL,
    4,
    NULL,
    NULL,
    5,
    9,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    15,
    'c1d3a362-becf-4122-a1e6-e1005e708b9d',
    1,
    50,
    '2022-05-30 13:43:11.849296',
    '2022-05-31 16:09:14.000000',
    '2022-05-31 16:09:14.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-05-30 13:43:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    2,
    NULL,
    4,
    NULL,
    NULL,
    5,
    9,
    4
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    16,
    '499f49e4-f981-4528-9d05-f16d28bfd777',
    1,
    120,
    '2022-05-30 13:43:38.072595',
    '2022-05-31 16:09:14.000000',
    '2022-05-31 16:09:14.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-05-30 13:43:25',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    3,
    NULL,
    4,
    NULL,
    NULL,
    5,
    9,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    17,
    'f1160d74-1bec-40c3-8dad-5bd40e8300e6',
    1,
    5345,
    '2022-05-31 10:30:27.006183',
    '2022-05-31 16:09:14.000000',
    '2022-05-31 16:09:14.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-05-31 10:30:12',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    3,
    NULL,
    4,
    NULL,
    NULL,
    4,
    5,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    18,
    '58c1d5bd-646f-4846-8986-331f92a9c1b2',
    1,
    1,
    '2022-05-31 16:15:24.345284',
    '2022-05-31 16:15:37.000000',
    '2022-05-31 16:15:37.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-06-01 00:00:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    3,
    NULL,
    4,
    NULL,
    NULL,
    4,
    5,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    19,
    'faa87e54-08a6-42db-ae8a-1251fa295228',
    1,
    2,
    '2022-05-31 16:18:00.101152',
    '2022-05-31 16:18:44.000000',
    '2022-05-31 16:18:44.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-06-01 00:00:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    3,
    NULL,
    4,
    NULL,
    NULL,
    4,
    12,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    20,
    '1aacff95-7a5c-475d-92d2-df6be3eef42f',
    1,
    2,
    '2022-05-31 16:25:05.181984',
    '2022-05-31 16:36:37.000000',
    '2022-05-31 16:36:37.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-06-01 00:00:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    3,
    NULL,
    4,
    NULL,
    NULL,
    4,
    9,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    21,
    '0cbc6680-a6a5-4d9e-bd4b-d3308981eb69',
    1,
    4,
    '2022-05-31 16:37:01.300783',
    '2022-05-31 16:37:39.000000',
    '2022-05-31 16:37:39.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-06-01 00:00:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    3,
    NULL,
    4,
    NULL,
    NULL,
    4,
    12,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    22,
    '51a4f151-aeca-43f6-89a5-4f7ce92c2945',
    1,
    3,
    '2022-05-31 16:37:21.453360',
    '2022-05-31 16:37:31.000000',
    '2022-05-31 16:37:31.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-06-01 00:00:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    3,
    NULL,
    4,
    NULL,
    NULL,
    4,
    12,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    23,
    '95097b62-7d00-4116-bd29-e00c660282f7',
    1,
    2,
    '2022-05-31 16:39:13.266559',
    '2022-05-31 16:43:26.000000',
    '2022-05-31 16:43:26.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-06-01 00:00:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    3,
    NULL,
    4,
    NULL,
    NULL,
    4,
    5,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    24,
    '83f1238e-ec74-4364-b8b5-adcead197a19',
    1,
    10,
    '2022-05-31 16:49:53.152463',
    '2022-06-01 11:52:20.000000',
    '2022-06-01 11:52:20.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-06-01 00:00:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    3,
    NULL,
    4,
    NULL,
    NULL,
    4,
    5,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    25,
    '38b97e83-38b8-4472-9297-8d7dc4818278',
    2,
    2,
    '2022-06-01 11:27:20.432561',
    '2022-06-01 11:52:20.000000',
    '2022-06-01 11:52:20.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-06-01 11:26:59',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    NULL,
    NULL,
    4,
    NULL,
    NULL,
    4,
    6,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    26,
    '6b6958a7-cffc-4bf8-b176-7a65ff9a3f9d',
    2,
    1,
    '2022-06-03 10:26:53.142114',
    '2022-06-03 16:53:48.000000',
    '2022-06-03 16:53:48.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-06-03 10:26:45',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    3,
    62,
    1,
    NULL,
    NULL,
    4,
    8,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    27,
    '0fb6e718-7331-463a-99bd-4d69f6719644',
    1,
    50,
    '2022-06-03 16:52:07.645159',
    '2022-06-03 16:52:23.000000',
    '2022-06-03 16:52:23.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-06-04 00:00:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    3,
    NULL,
    3,
    NULL,
    NULL,
    4,
    9,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    28,
    '93220ae5-946b-4721-ae35-262081e24ffe',
    1,
    5,
    '2022-06-03 16:54:39.737618',
    '2022-06-03 16:55:09.000000',
    '2022-06-03 16:55:09.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-06-04 00:00:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    3,
    NULL,
    3,
    NULL,
    NULL,
    4,
    5,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    29,
    '5808da28-7497-4d86-a59b-80ad36795386',
    1,
    10,
    '2022-06-07 13:16:19.614826',
    '2022-06-07 13:16:48.000000',
    '2022-06-07 13:16:48.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-06-08 00:00:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    3,
    NULL,
    4,
    NULL,
    NULL,
    4,
    5,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    30,
    '3a85c9c9-0801-475a-8cd8-06883982ecbf',
    1,
    2,
    '2022-06-07 13:37:30.388543',
    '2022-06-07 13:37:40.000000',
    '2022-06-07 13:37:40.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-06-08 00:00:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    3,
    NULL,
    4,
    NULL,
    NULL,
    4,
    6,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    31,
    'a72bc2f4-b78f-497d-8902-393513056d4e',
    1,
    1,
    '2022-06-07 14:03:40.589372',
    '2022-06-07 14:04:05.000000',
    '2022-06-07 14:04:05.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-06-08 00:00:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    3,
    NULL,
    4,
    NULL,
    NULL,
    4,
    5,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    32,
    '31b55f6b-0d37-4f2f-ad99-8e3967bb68bc',
    1,
    2,
    '2022-06-07 14:28:21.636355',
    '2022-06-07 14:30:34.000000',
    '2022-06-07 14:30:34.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-06-11 00:00:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    2,
    NULL,
    3,
    NULL,
    NULL,
    4,
    9,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    33,
    '38649b4b-a79c-4940-be17-cba45ae64ce0',
    2,
    1,
    '2022-06-07 15:23:30.324595',
    '2022-06-07 15:23:37.000000',
    '2022-06-07 15:23:37.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-06-08 00:00:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    3,
    64,
    1,
    NULL,
    NULL,
    4,
    9,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    34,
    'd6b6747d-62c0-4b80-819e-f8cdb334b11c',
    2,
    1,
    '2022-06-07 15:29:15.138526',
    '2022-06-07 15:29:25.000000',
    '2022-06-07 15:29:25.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-06-08 00:00:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    3,
    62,
    1,
    NULL,
    NULL,
    4,
    9,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    35,
    '8eb91532-1318-4c61-9326-14c66b3c3314',
    2,
    1,
    '2022-06-07 15:34:14.000604',
    '2022-06-08 12:48:20.000000',
    '2022-06-08 12:48:20.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    '2022-06-08 00:00:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    3,
    62,
    1,
    NULL,
    NULL,
    4,
    9,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    36,
    '225c1d19-c715-4b21-9581-c2ace0ae03b2',
    2,
    1,
    '2022-06-07 15:34:14.003669',
    '2022-06-07 16:08:43.000000',
    '2022-06-07 16:08:43.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-06-08 00:00:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    3,
    62,
    1,
    NULL,
    NULL,
    4,
    9,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    37,
    '6bc68dcf-547d-4f73-a70d-b2410deb6c49',
    2,
    1,
    '2022-06-07 15:34:14.006783',
    '2022-06-07 16:08:40.000000',
    '2022-06-07 16:08:40.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '2022-06-08 00:00:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    3,
    62,
    1,
    NULL,
    NULL,
    4,
    9,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    38,
    '5ed58d7f-a60b-4f5b-b80c-f618fc39f9fb',
    2,
    1,
    '2022-06-07 15:40:53.112757',
    '2022-06-08 12:48:20.000000',
    '2022-06-08 12:48:20.000000',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    '2022-06-08 00:00:00',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    3,
    64,
    1,
    NULL,
    NULL,
    4,
    6,
    NULL
  );
INSERT INTO
  `cart` (
    `id`,
    `uuid`,
    `order_type`,
    `qty`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `schedule_date`,
    `lekage_fee`,
    `is_active`,
    `user_id`,
    `vendor_id`,
    `product_id`,
    `accessory_id`,
    `location_id`,
    `cylindersize_id`,
    `category_id`,
    `zipcode_id`,
    `timeslot_id`,
    `promocode_id`
  )
VALUES
  (
    39,
    '317d308c-f7a7-4b57-988c-f50929aca678',
    1,
    5,
    '2022-06-08 12:38:25.999749',
    '2022-06-08 12:48:20.000000',
    '2022-06-08 12:48:20.000000',
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    '2022-06-10 00:00:00',
    NULL,
    1,
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    NULL,
    NULL,
    3,
    NULL,
    NULL,
    4,
    5,
    NULL
  );

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
    '2022-04-27 14:26:47.785652',
    '2022-04-27 14:26:47.785652',
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
    '2022-04-27 14:26:47.789374',
    '2022-04-27 14:26:47.789374',
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
    '2022-04-27 14:26:47.793268',
    '2022-04-27 14:26:47.793268',
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
    '2022-04-27 14:26:47.941847',
    '2022-04-27 14:26:47.941847',
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
    '2022-04-27 14:26:47.948065',
    '2022-04-27 14:26:47.948065',
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
    '2022-04-27 14:26:47.954315',
    '2022-04-27 14:26:47.954315',
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
    '<p>Terms &amp; Conditions hello</p>',
    'terms_and_conditions',
    1,
    '2022-04-27 14:26:47.958237',
    '2022-05-27 16:35:37.000000',
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
    '<p>Privacy Policy , Hello Chetan how are you</p>',
    'privacy_policy',
    1,
    '2022-04-27 14:26:47.961875',
    '2022-05-27 16:04:00.000000',
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
    '2022-04-27 14:26:47.965371',
    '2022-04-27 14:26:47.965371',
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
    '2022-04-27 14:26:47.968833',
    '2022-04-27 14:26:47.968833',
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
    '2022-04-27 14:26:47.973997',
    '2022-04-27 14:26:47.973997',
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
    '2022-04-27 14:26:47.979962',
    '2022-04-27 14:26:47.979962',
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
    'test',
    10,
    10,
    2,
    '2022-04-27 15:27:00.426663',
    '2022-04-28 12:01:54.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    0,
    1
  );
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
    2,
    'test 1',
    20,
    20,
    2,
    '2022-04-27 15:27:09.726297',
    '2022-04-27 15:39:12.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    1
  );
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
    3,
    'test',
    1,
    2,
    0,
    '2022-05-26 17:19:36.666903',
    '2022-05-26 17:19:36.666903',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    2
  );
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
    4,
    'test 1',
    5,
    5,
    0,
    '2022-05-26 17:19:44.111373',
    '2022-05-26 17:19:44.111373',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    2
  );
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
    5,
    'tettetet',
    45,
    54,
    4,
    '2022-05-26 17:19:55.635494',
    '2022-05-26 17:30:08.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    2
  );
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
    6,
    'test 4',
    4,
    4,
    0,
    '2022-05-26 17:52:35.748762',
    '2022-05-26 17:52:35.748762',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
    2
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
    '2022-04-27 15:05:43.345300',
    '2022-04-27 15:14:17.000000',
    '2022-04-27 15:14:17.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    2,
    20,
    1,
    1,
    '2022-04-27 15:05:46.715372',
    '2022-05-24 10:50:36.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '307d7954-8458-4ce9-9b6b-db3435c7bccd'
  );
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
    3,
    30,
    1,
    1,
    '2022-04-27 15:05:51.172309',
    '2022-04-27 15:06:03.000000',
    '2022-04-27 15:06:03.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    4,
    40,
    1,
    1,
    '2022-04-27 15:05:54.701628',
    '2022-04-27 15:06:20.000000',
    '2022-04-27 15:06:20.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    5,
    50,
    1,
    1,
    '2022-04-27 15:06:12.278610',
    '2022-04-27 15:07:07.000000',
    '2022-04-27 15:07:07.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    6,
    60,
    1,
    1,
    '2022-04-27 15:06:51.854022',
    '2022-04-27 15:08:12.000000',
    '2022-04-27 15:08:12.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    7,
    50,
    1,
    1,
    '2022-04-27 15:08:07.392009',
    '2022-04-27 15:08:43.000000',
    '2022-04-27 15:08:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    8,
    70,
    1,
    1,
    '2022-04-27 15:08:32.310477',
    '2022-04-27 15:12:42.000000',
    '2022-04-27 15:12:42.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    9,
    50,
    1,
    1,
    '2022-04-27 15:12:32.558618',
    '2022-04-27 15:13:18.000000',
    '2022-04-27 15:13:18.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    10,
    40,
    1,
    1,
    '2022-04-27 15:13:02.964577',
    '2022-04-27 15:13:48.000000',
    '2022-04-27 15:13:48.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    11,
    70,
    1,
    1,
    '2022-04-27 15:13:36.984675',
    '2022-04-28 10:43:08.000000',
    '2022-04-28 10:43:08.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    12,
    50,
    1,
    1,
    '2022-04-27 15:14:00.424544',
    '2022-04-27 17:59:16.000000',
    '2022-04-27 17:59:16.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    13,
    10,
    1,
    1,
    '2022-04-27 17:59:06.983206',
    '2022-04-27 17:59:48.000000',
    '2022-04-27 17:59:48.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    14,
    60,
    1,
    1,
    '2022-04-27 17:59:25.062596',
    '2022-04-27 18:00:24.000000',
    '2022-04-27 18:00:24.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    15,
    50,
    1,
    1,
    '2022-04-27 18:00:17.602858',
    '2022-04-27 18:00:36.000000',
    '2022-04-27 18:00:36.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    16,
    100,
    1,
    1,
    '2022-04-27 18:00:31.466631',
    '2022-04-27 18:00:46.000000',
    '2022-04-27 18:00:46.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    17,
    2000,
    1,
    1,
    '2022-04-27 18:00:42.493797',
    '2022-04-27 18:01:05.000000',
    '2022-04-27 18:01:05.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    18,
    150,
    1,
    1,
    '2022-04-27 18:00:55.542266',
    '2022-04-27 18:02:17.000000',
    '2022-04-27 18:02:17.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    19,
    200,
    1,
    1,
    '2022-04-27 18:02:11.609080',
    '2022-04-27 18:02:33.000000',
    '2022-04-27 18:02:33.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    20,
    250,
    1,
    1,
    '2022-04-27 18:02:24.760743',
    '2022-04-27 18:03:28.000000',
    '2022-04-27 18:03:28.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    21,
    300,
    1,
    1,
    '2022-04-27 18:03:09.370969',
    '2022-04-27 18:03:41.000000',
    '2022-04-27 18:03:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    22,
    350,
    1,
    1,
    '2022-04-27 18:03:33.922804',
    '2022-04-27 18:10:20.000000',
    '2022-04-27 18:10:20.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    23,
    500,
    1,
    1,
    '2022-04-27 18:10:15.731240',
    '2022-04-28 10:41:00.000000',
    '2022-04-28 10:41:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    24,
    400,
    1,
    1,
    '2022-04-28 10:40:56.100146',
    '2022-04-28 10:40:56.100146',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    25,
    600,
    1,
    1,
    '2022-04-28 10:42:56.541519',
    '2022-04-28 16:32:38.000000',
    '2022-04-28 16:32:38.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    26,
    500,
    1,
    1,
    '2022-04-28 16:29:25.206416',
    '2022-04-28 16:32:54.000000',
    '2022-04-28 16:32:54.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    27,
    900,
    1,
    1,
    '2022-04-28 16:29:32.217238',
    '2022-04-28 16:33:05.000000',
    '2022-04-28 16:33:05.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
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
    28,
    100,
    1,
    1,
    '2022-04-28 16:33:02.405961',
    '2022-04-28 16:33:02.405961',
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
    '2022-04-27 14:26:48.720543',
    '2022-04-27 14:26:48.720543',
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
    '2022-04-27 14:26:48.724065',
    '2022-04-27 14:26:48.724065',
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
    '2022-04-27 14:26:48.734186',
    '2022-04-27 14:26:48.734186',
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
    10,
    1,
    '2022-04-27 14:26:48.738555',
    '2022-05-02 16:03:28.107980',
    NULL,
    NULL,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: documents
# ------------------------------------------------------------

INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    1,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-04-27 15:28:44.552754',
    '2022-04-27 15:28:44.552754',
    NULL,
    NULL,
    NULL,
    '761a35de-a2ca-4e4b-8784-08b94f2e5875'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    2,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-04-27 15:28:44.590403',
    '2022-04-27 15:28:44.590403',
    NULL,
    NULL,
    NULL,
    '761a35de-a2ca-4e4b-8784-08b94f2e5875'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    3,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-04-27 15:32:38.500127',
    '2022-04-27 15:32:38.500127',
    NULL,
    NULL,
    NULL,
    'd319c66f-1f6f-4b3b-8c91-e19d9befb705'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    4,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-04-27 15:39:55.548604',
    '2022-04-27 15:39:55.548604',
    NULL,
    NULL,
    NULL,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    5,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-04-27 16:22:07.799850',
    '2022-04-27 16:22:07.799850',
    NULL,
    NULL,
    NULL,
    '2334499c-4748-4027-8aff-19674e5f1187'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    6,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-04-28 18:12:59.734997',
    '2022-04-28 18:12:59.734997',
    NULL,
    NULL,
    NULL,
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    7,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-04-28 18:12:59.744126',
    '2022-04-28 18:12:59.744126',
    NULL,
    NULL,
    NULL,
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    8,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-04-29 13:18:59.099723',
    '2022-04-29 13:18:59.099723',
    NULL,
    NULL,
    NULL,
    '3a9a1b62-4abb-44b3-b2c8-6026195c6ea5'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    9,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-04-29 13:24:25.078894',
    '2022-04-29 13:24:25.078894',
    NULL,
    NULL,
    NULL,
    '6be90c25-7f58-4502-ab3c-44b742e221a4'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    10,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-05-02 13:13:53.281199',
    '2022-05-02 13:13:53.281199',
    NULL,
    NULL,
    NULL,
    '6edea6c6-b8ad-45d6-bee9-928a8c599e30'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    11,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-05-16 12:59:25.880861',
    '2022-05-16 12:59:25.880861',
    NULL,
    NULL,
    NULL,
    '3f3c9e66-e7b8-4ea8-bd46-96dd0de6d318'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    12,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-05-18 15:01:20.949226',
    '2022-05-26 15:34:21.000000',
    '2022-05-26 15:34:21.000000',
    NULL,
    NULL,
    '4c568150-4bd3-4489-bab7-87db49241ff6'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    13,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-05-18 15:02:01.807159',
    '2022-05-18 15:02:01.807159',
    NULL,
    NULL,
    NULL,
    'ade2ec99-f561-49fa-ab78-36f083faceba'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    14,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    2,
    '2022-05-18 15:02:02.214468',
    '2022-05-26 15:34:21.000000',
    '2022-05-26 15:34:21.000000',
    NULL,
    NULL,
    '4c568150-4bd3-4489-bab7-87db49241ff6'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    15,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-05-18 19:02:18.250292',
    '2022-05-18 19:02:18.250292',
    NULL,
    NULL,
    NULL,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    16,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-05-18 19:18:31.167186',
    '2022-05-18 19:18:31.167186',
    NULL,
    NULL,
    NULL,
    'a202cb0f-ce05-4981-b2e6-311f24ddaf47'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    17,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-05-26 16:08:53.297559',
    '2022-05-26 16:08:53.297559',
    NULL,
    NULL,
    NULL,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    18,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-05-27 15:21:10.577676',
    '2022-05-27 15:21:10.577676',
    NULL,
    NULL,
    NULL,
    'da9716ad-b7ca-48b4-82a8-5dc6d8e7ba66'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    19,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-05-27 15:30:38.578722',
    '2022-05-27 15:30:38.578722',
    NULL,
    NULL,
    NULL,
    '3dcff22c-b066-4742-8d21-00fb0567a48a'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    20,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-05-27 15:42:53.880570',
    '2022-05-27 15:42:53.880570',
    NULL,
    NULL,
    NULL,
    '4146a641-3e5a-4448-a7d0-15f302771426'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    21,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-05-30 16:05:20.198660',
    '2022-05-30 16:05:20.198660',
    NULL,
    NULL,
    NULL,
    '4146a641-3e5a-4448-a7d0-15f302771426'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    22,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-05-30 16:10:26.140987',
    '2022-05-30 16:10:26.140987',
    NULL,
    NULL,
    NULL,
    '098b2069-6aba-4686-88bd-76a757faf2e9'
  );
INSERT INTO
  `documents` (
    `id`,
    `document_url`,
    `document_type`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `user_id`
  )
VALUES
  (
    23,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '2022-05-30 17:13:26.012150',
    '2022-05-30 17:13:26.012150',
    NULL,
    NULL,
    NULL,
    '098b2069-6aba-4686-88bd-76a757faf2e9'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: driver_details
# ------------------------------------------------------------

INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    1,
    NULL,
    0,
    1,
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    1,
    '2022-05-04 17:18:53.707264',
    '2022-05-26 16:22:36.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    'cadcaccf-9361-417d-abb8-4096c81b1ac8',
    22.9933,
    72.5056,
    '2022-05-26 16:22:36.000000',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    5
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    2,
    NULL,
    0,
    1,
    1,
    2,
    NULL,
    NULL,
    NULL,
    NULL,
    'edasdsd',
    1,
    '2022-05-05 12:39:32.107664',
    '2022-05-20 19:05:54.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    '951c7937-5d94-4b0b-8fe9-4deccdb7e0af',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    3,
    NULL,
    0,
    1,
    1,
    2,
    NULL,
    NULL,
    NULL,
    NULL,
    'edasdsd',
    1,
    '2022-05-05 14:56:45.735625',
    '2022-05-18 18:56:57.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6',
    NULL,
    NULL,
    '2022-05-18 18:56:57.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    4,
    NULL,
    0,
    1,
    1,
    2,
    NULL,
    NULL,
    NULL,
    NULL,
    'edasdsd',
    1,
    '2022-05-05 15:00:39.624092',
    '2022-05-26 15:34:21.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    '4c568150-4bd3-4489-bab7-87db49241ff6',
    22.9937,
    72.5016,
    '2022-05-26 15:34:21.000000',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    5
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    5,
    NULL,
    0,
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    1,
    '2022-05-18 12:56:36.558508',
    '2022-05-20 19:05:56.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    '88a386cc-522e-4555-b93f-fbe9a6355de5',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    6,
    NULL,
    0,
    1,
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2022-05-18 18:50:43.964576',
    '2022-05-18 18:55:30.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    'd951ad32-6d36-4048-870b-4a168c34d184',
    NULL,
    NULL,
    '2022-05-18 18:55:30.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    7,
    NULL,
    0,
    1,
    1,
    1,
    '1',
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2022-05-18 18:52:19.281325',
    '2022-05-18 18:55:17.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    'f4a2486e-8115-4e8d-b444-5dcd2b6114de',
    NULL,
    NULL,
    '2022-05-18 18:55:17.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    8,
    NULL,
    0,
    1,
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2022-05-18 18:58:10.905373',
    '2022-05-18 18:58:22.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    '709fcb88-92a1-4b01-aca0-bb8223bdf9b3',
    NULL,
    NULL,
    '2022-05-18 18:58:22.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    9,
    NULL,
    0,
    1,
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2022-05-18 18:59:40.341559',
    '2022-05-18 18:59:51.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    'ace31b33-d7dd-47ec-8299-547eea290e05',
    NULL,
    NULL,
    '2022-05-18 18:59:51.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    10,
    NULL,
    0,
    1,
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2022-05-18 19:00:23.951488',
    '2022-05-18 19:06:48.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    '4704c003-580c-4c4f-94d7-04a59922ff08',
    NULL,
    NULL,
    '2022-05-18 19:06:48.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    11,
    NULL,
    0,
    1,
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2022-05-18 19:00:28.255085',
    '2022-05-18 19:07:03.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    '3dc522d4-fc7d-47e1-8add-5e1bf553509f',
    NULL,
    NULL,
    '2022-05-18 19:07:03.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    12,
    NULL,
    0,
    1,
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2022-05-18 19:09:05.956884',
    '2022-05-18 19:10:47.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    'ece28936-ac09-4d54-baea-63e37a3962ee',
    NULL,
    NULL,
    '2022-05-18 19:10:47.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    13,
    NULL,
    0,
    1,
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2022-05-18 19:11:35.325328',
    '2022-05-18 19:12:12.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    'e74fc492-9d57-4107-8edd-223d827f967a',
    NULL,
    NULL,
    '2022-05-18 19:12:12.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    14,
    NULL,
    0,
    1,
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2022-05-18 19:11:41.918427',
    '2022-05-19 14:54:29.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    '05a236d1-0c42-4e25-a971-6667d1b452e8',
    NULL,
    NULL,
    '2022-05-19 14:54:29.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    15,
    NULL,
    0,
    1,
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2022-05-18 19:11:56.808972',
    '2022-05-19 14:51:44.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    '52ddd55c-4305-4292-b254-9fd6fc8785f3',
    NULL,
    NULL,
    '2022-05-19 14:51:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    16,
    NULL,
    0,
    1,
    1,
    2,
    NULL,
    NULL,
    NULL,
    NULL,
    'edasdsd',
    0,
    '2022-05-19 15:02:16.639865',
    '2022-05-19 15:34:11.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    '6a068d33-217c-42c7-8e2b-4c32605e9f73',
    NULL,
    NULL,
    '2022-05-19 15:34:11.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    17,
    NULL,
    0,
    1,
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    'edasdsd',
    0,
    '2022-05-19 15:03:44.907310',
    '2022-05-19 15:43:05.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    'baafed38-360f-401c-98a3-0c23191ce8c3',
    NULL,
    NULL,
    '2022-05-19 15:43:05.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    18,
    NULL,
    0,
    1,
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    'edasdsd',
    0,
    '2022-05-19 15:05:31.232930',
    '2022-05-19 15:42:25.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    'a8d473c0-7cd8-457e-95f7-53d7cd99faa3',
    NULL,
    NULL,
    '2022-05-19 15:42:25.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    19,
    NULL,
    0,
    1,
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2022-05-19 15:52:17.754182',
    '2022-05-19 15:53:06.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    '68baaa7a-4723-41d9-98f1-79061bdd0286',
    NULL,
    NULL,
    '2022-05-19 15:53:06.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    20,
    NULL,
    0,
    1,
    1,
    2,
    '1,2',
    NULL,
    'H',
    'Fghfg',
    'Had',
    1,
    '2022-05-20 10:48:10.779703',
    '2022-05-20 19:06:38.000000',
    NULL,
    'Schaffer',
    NULL,
    NULL,
    '581ffd6a-7de6-40a9-8745-11b362079937',
    NULL,
    NULL,
    '2022-05-20 19:06:38.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    21,
    NULL,
    0,
    1,
    1,
    1,
    '1,2',
    NULL,
    'test',
    'truck',
    '122345DG',
    0,
    '2022-05-24 07:19:34.565388',
    '2022-05-24 07:20:32.000000',
    NULL,
    'rjej',
    NULL,
    NULL,
    'c7649266-200e-49b2-bb1b-7632d49cbbb8',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    22,
    NULL,
    0,
    1,
    1,
    1,
    '1,2',
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2022-05-24 14:57:43.055931',
    '2022-05-24 14:57:43.055931',
    NULL,
    NULL,
    NULL,
    NULL,
    '68524f8e-42b6-44ac-8528-fc0b1a09cc4f',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    23,
    NULL,
    0,
    1,
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    'edasdsd',
    1,
    '2022-05-25 11:47:09.090192',
    '2022-05-25 11:55:47.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    '2e59abef-a03c-4f64-b65d-30aab18f727b',
    NULL,
    NULL,
    NULL,
    NULL,
    5
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    24,
    NULL,
    0,
    1,
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    'edasdsd',
    0,
    '2022-05-25 11:50:50.243999',
    '2022-05-25 11:50:50.243999',
    NULL,
    NULL,
    NULL,
    NULL,
    'd7dc70a4-99ab-4197-9a3a-791efc528113',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    25,
    NULL,
    0,
    1,
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    'edasdsd',
    1,
    '2022-05-25 11:52:50.053861',
    '2022-05-25 11:55:56.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    '85ff5315-06f0-4eba-890b-67fd7d7205e3',
    NULL,
    NULL,
    NULL,
    NULL,
    5
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    26,
    NULL,
    0,
    1,
    1,
    2,
    NULL,
    NULL,
    NULL,
    NULL,
    'BABAB',
    0,
    '2022-05-26 16:37:10.755098',
    '2022-05-26 16:37:10.755098',
    NULL,
    NULL,
    NULL,
    NULL,
    '08ecb71b-b437-4338-8154-fc65e4aedc1b',
    NULL,
    NULL,
    NULL,
    NULL,
    5
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    27,
    NULL,
    0,
    1,
    1,
    2,
    NULL,
    NULL,
    NULL,
    NULL,
    'GJ DH9488',
    1,
    '2022-05-26 16:39:10.780076',
    '2022-05-27 11:33:23.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    '3202a392-c06e-47af-beb7-0a3d062c7a08',
    NULL,
    NULL,
    NULL,
    NULL,
    5
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    28,
    NULL,
    0,
    1,
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    'GJ 7774',
    0,
    '2022-05-27 16:31:20.286011',
    '2022-05-27 16:33:18.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    'cedb4ed2-fa12-40bf-bf07-4793170a5279',
    NULL,
    NULL,
    '2022-05-27 16:33:18.000000',
    '4146a641-3e5a-4448-a7d0-15f302771426',
    39
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    29,
    NULL,
    0,
    1,
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    'GJ 7774',
    0,
    '2022-05-27 16:40:50.590723',
    '2022-05-27 16:40:50.590723',
    NULL,
    NULL,
    NULL,
    NULL,
    '447d9dce-fe91-4cd9-85ee-452d67324ef6',
    NULL,
    NULL,
    NULL,
    NULL,
    39
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    30,
    NULL,
    0,
    1,
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    'MH 19',
    0,
    '2022-05-27 17:58:00.726771',
    '2022-05-27 17:58:00.726771',
    NULL,
    NULL,
    NULL,
    NULL,
    '5984e2bd-69b7-4219-9d72-330802d9be0d',
    NULL,
    NULL,
    NULL,
    NULL,
    39
  );
INSERT INTO
  `driver_details` (
    `id`,
    `avg_rating`,
    `is_suspended`,
    `is_online`,
    `is_approved`,
    `order_type`,
    `zipcode_ids`,
    `personal_id`,
    `id_information`,
    `driver_vehicle`,
    `vehical_no`,
    `status`,
    `created_at`,
    `updated_at`,
    `identity`,
    `licence_no`,
    `identity_information`,
    `order_capacity`,
    `user_id`,
    `lat`,
    `long`,
    `deleted_at`,
    `updated_by`,
    `vendor_id`
  )
VALUES
  (
    31,
    NULL,
    0,
    1,
    1,
    1,
    '1,2',
    'dgfdfg',
    'gdfg',
    'fgdfg',
    'gdfgdfgd4',
    0,
    '2022-06-06 10:21:30.999005',
    '2022-06-06 12:46:29.000000',
    NULL,
    'dfg',
    NULL,
    44,
    '5e90a908-a191-4f37-92c3-2a613edcc2f8',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: driver_payments
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: driver_stocks
# ------------------------------------------------------------

INSERT INTO
  `driver_stocks` (
    `id`,
    `added_at`,
    `added_filled`,
    `added_empty`,
    `returned_filled`,
    `returned_empty`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `category_id`,
    `cylinder_size_id`,
    `accessory_id`,
    `product_id`,
    `driver_id`
  )
VALUES
  (
    1,
    '2022-05-01 05:30:00',
    2,
    5,
    NULL,
    NULL,
    '2022-05-25 17:27:05.643147',
    '2022-05-25 17:27:05.643147',
    NULL,
    NULL,
    NULL,
    1,
    1,
    NULL,
    1,
    NULL
  );
INSERT INTO
  `driver_stocks` (
    `id`,
    `added_at`,
    `added_filled`,
    `added_empty`,
    `returned_filled`,
    `returned_empty`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `category_id`,
    `cylinder_size_id`,
    `accessory_id`,
    `product_id`,
    `driver_id`
  )
VALUES
  (
    2,
    '2022-05-01 05:30:00',
    2,
    5,
    NULL,
    NULL,
    '2022-05-26 12:58:07.304452',
    '2022-05-26 12:58:07.304452',
    NULL,
    NULL,
    NULL,
    1,
    1,
    NULL,
    1,
    NULL
  );
INSERT INTO
  `driver_stocks` (
    `id`,
    `added_at`,
    `added_filled`,
    `added_empty`,
    `returned_filled`,
    `returned_empty`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `category_id`,
    `cylinder_size_id`,
    `accessory_id`,
    `product_id`,
    `driver_id`
  )
VALUES
  (
    3,
    '2022-05-01 05:30:00',
    2,
    5,
    NULL,
    NULL,
    '2022-05-26 12:58:34.955354',
    '2022-05-26 12:59:51.000000',
    NULL,
    NULL,
    NULL,
    1,
    1,
    NULL,
    1,
    4
  );
INSERT INTO
  `driver_stocks` (
    `id`,
    `added_at`,
    `added_filled`,
    `added_empty`,
    `returned_filled`,
    `returned_empty`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `category_id`,
    `cylinder_size_id`,
    `accessory_id`,
    `product_id`,
    `driver_id`
  )
VALUES
  (
    4,
    '2022-05-26 05:30:00',
    2,
    5,
    NULL,
    NULL,
    '2022-05-26 13:08:22.280614',
    '2022-05-26 13:08:22.280614',
    NULL,
    NULL,
    NULL,
    1,
    1,
    NULL,
    1,
    4
  );

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
    '<title></title>\r\n<link href=\"https://fonts.googleapis.com/css?family=Lato:900,900italic,700italic,700,400italic,400,300italic,300,100italic,100&amp;subset=latin,latin-ext\" rel=\"stylesheet\" type=\"text/css\" />\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:400,700\" rel=\"stylesheet\" type=\"text/css\" />\r\n<style type=\"text/css\">@import url(\"https://fonts.googleapis.com/css?family=Lato:900,900italic,700italic,700,400italic,400,300italic,300,100italic,100&subset=latin,latin-ext\' rel=\'stylesheet\' type=\'text/css\"); @import url(\"https://fonts.googleapis.com/css?family=Montserrat:400,700\' rel=\'stylesheet\' type=\'text/css\'\");\r\n</style>\r\n<div class=\"main-content-wrap\" style=\"width: 600px; margin: 50px auto; font-weight: 400; line-height: 1.62857; -webkit-font-smoothing: antialiased;\">\r\n<div class=\"header\" style=\"color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: 16px;\">\r\n<div class=\"logo\" style=\"padding: 0px 0px 20px;text-align: center;border-bottom: 3px solid #FEAC0D;\"><font color=\"#727882\" face=\"Arial, Helvetica, sans-serif\"><span style=\"font-size: 15.3333px;\">&nbsp;</span></font><font color=\"#000000\" face=\"Lato, sans-serif\"><span style=\"font-size: 16px;\">{logo}</span></font><font color=\"#727882\" face=\"Arial, Helvetica, sans-serif\"><span style=\"font-size: 15.3333px;\"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></font></div>\r\n</div>\r\n\r\n<p>Hello <strong>{name}</strong>,</p>\r\n\r\n<p>Welcome to <strong>{appname}</strong>.</p>\r\n\r\n<p>Use the credentials below to sign-in.</p>\r\n\r\n<p>Mobile : <strong>{mobile}</strong></p>\r\n\r\n<p>Password : <strong>{password}</strong></p>\r\n\r\n<p>Please note that password is auto-generated, kindly, change it once sign in successfully.</p>\r\n\r\n<p>Thank you,<br />\r\n{appname} Team</p>\r\n</div>\r\n',
    'vendor_registration',
    1,
    '2022-04-27 14:26:47.407336',
    '2022-04-27 14:26:47.407336',
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
    '<title></title>\r\n<link href=\"https://fonts.googleapis.com/css?family=Lato:900,900italic,700italic,700,400italic,400,300italic,300,100italic,100&amp;subset=latin,latin-ext\" rel=\"stylesheet\" type=\"text/css\" />\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:400,700\" rel=\"stylesheet\" type=\"text/css\" />\r\n<style type=\"text/css\">@import url(\"https://fonts.googleapis.com/css?family=Lato:900,900italic,700italic,700,400italic,400,300italic,300,100italic,100&subset=latin,latin-ext\' rel=\'stylesheet\' type=\'text/css\"); @import url(\"https://fonts.googleapis.com/css?family=Montserrat:400,700\' rel=\'stylesheet\' type=\'text/css\'\");\r\n</style>\r\n<div class=\"main-content-wrap\" style=\"width: 600px; margin: 50px auto; font-weight: 400; line-height: 1.62857; -webkit-font-smoothing: antialiased;\">\r\n<div class=\"header\" style=\"color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: 16px;\">\r\n<div class=\"logo\" style=\"padding: 0px 0px 20px;text-align: center;border-bottom: 3px solid #FEAC0D;\"><font color=\"#727882\" face=\"Arial, Helvetica, sans-serif\"><span style=\"font-size: 15.3333px;\">&nbsp;</span></font><font color=\"#000000\" face=\"Lato, sans-serif\"><span style=\"font-size: 16px;\">{logo}</span></font><font color=\"#727882\" face=\"Arial, Helvetica, sans-serif\"><span style=\"font-size: 15.3333px;\"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></font></div>\r\n</div>\r\n\r\n<div class=\"section-1\" style=\"padding: 20px 0px;\">\r\n<p style=\"text-align: left;margin-top: 0px;\">Hello <b>{name}</b></p>\r\n\r\n<p style=\"text-align: left;\">Someone has requested a link to reset your password for your account at {appname}, and you can do this through the link below.</p>\r\n\r\n<p style=\"text-align: left;\"><a href=\"{link}\" style=\"color: #0186ba;\" target=\"_blank\">Change my password</a></p>\r\n\r\n<p style=\"text-align: left;\">If you didn&#39;t request this, please ignore this email. Your password won&#39;t change until you access the link above and create a new one.</p>\r\n\r\n<p style=\"text-align: left;\">Thank you,<br />\r\n{appname}</p>\r\n</div>\r\n</div>',
    'forgot_password',
    1,
    '2022-04-27 14:26:47.417818',
    '2022-04-27 14:26:47.417818',
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
    '<meta charset=\"utf-8\" /><meta content=\"IE=edge\" http-equiv=\"X-UA-Compatible\" />\r\n<title></title>\r\n<link href=\"https://fonts.googleapis.com/css?family=Lato:900,900italic,700italic,700,400italic,400,300italic,300,100italic,100&amp;subset=latin,latin-ext\" rel=\"stylesheet\" type=\"text/css\" />\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:400,700\" rel=\"stylesheet\" type=\"text/css\" />\r\n<style type=\"text/css\">@import url(\"https://fonts.googleapis.com/css?family=Lato:900,900italic,700italic,700,400italic,400,300italic,300,100italic,100&subset=latin,latin-ext\' rel=\'stylesheet\' type=\'text/css\"); @import url(\"https://fonts.googleapis.com/css?family=Montserrat:400,700\' rel=\'stylesheet\' type=\'text/css\'\");\r\n</style>\r\n<div class=\"main-content-wrap\" style=\"width:600px;margin:50px auto;color: #000;font-family: \'Lato\', sans-serif;font-size: 16px;font-weight: 400;line-height: 1.62857143;-webkit-font-smoothing: antialiased;\">\r\n<div class=\"header\">\r\n<div class=\"logo\" style=\"padding: 0px 0px 20px;text-align: center;border-bottom: 3px solid #FEAC0D;\">{logo}</div>\r\n</div>\r\n\r\n<div class=\"main-content\" style=\"overflow: hidden;text-align: left;\">\r\n<div class=\"section-1\" style=\"padding: 20px 0px;\">\r\n<p style=\"text-align: left;margin-top: 0px;\">Hello <b>{name},</b></p>\r\n\r\n<p style=\"text-align: left;\">Thanks for registering with {appname}. Please verify your account using link&nbsp;below.</p>\r\n\r\n<p style=\"text-align: left;\"><a href=\"{link}\" style=\"color: #0186ba;\" target=\"_blank\">Verify</a></p>\r\n\r\n<p style=\"text-align: left;\">If you didn&#39;t request this, please ignore this email.</p>\r\n\r\n<p style=\"text-align: left;\">Thank you,<br />\r\n{appname}</p>\r\n</div>\r\n</div>\r\n</div>\r\n',
    'email_verify',
    1,
    '2022-04-27 14:26:47.426999',
    '2022-04-27 14:26:47.426999',
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
    '<meta charset=\"utf-8\" />\r\n<meta content=\"IE=edge\" http-equiv=\"X-UA-Compatible\" />\r\n<title></title>\r\n<link href=\"https://fonts.googleapis.com/css?family=Lato:900,900italic,700italic,700,400italic,400,300italic,300,100italic,100&amp;subset=latin,latin-ext\" rel=\"stylesheet\" type=\"text/css\" />\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:400,700\" rel=\"stylesheet\" type=\"text/css\" />\r\n<style type=\"text/css\">@import url(\"https://fonts.googleapis.com/css?family=Lato:900,900italic,700italic,700,400italic,400,300italic,300,100italic,100&subset=latin,latin-ext\' rel=\'stylesheet\' type=\'text/css\");\r\n         @import url(\"https://fonts.googleapis.com/css?family=Montserrat:400,700\' rel=\'stylesheet\' type=\'text/css\'\");\r\n</style>\r\n<div class=\"main-content-wrap\" style=\"width: 600px; margin: 50px auto; color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: 16px; line-height: 1.62857; -webkit-font-smoothing: antialiased;\">\r\n<div class=\"header\" style=\"font-weight: 400;\">\r\n<div class=\"logo\" style=\"padding: 0px 0px 20px;text-align: center;border-bottom: 3px solid #FEAC0D;\">{logo}</div>\r\n</div>\r\n\r\n<div class=\"main-content\" style=\"overflow: hidden; text-align: left;\">\r\n<div class=\"section-1\" style=\"padding: 20px 0px;\">\r\n<p style=\"font-weight: 400; text-align: left; margin-top: 0px;\">Hello {name},</p>\r\n\r\n<p style=\"text-align: left; margin-top: 0px;\">Your password changed successfully.</p>\r\n\r\n<p style=\"font-weight: 400; text-align: left;\">Thank you,<br />\r\n{appname}</p>\r\n</div>\r\n</div>\r\n</div>\r\n',
    'change_password',
    1,
    '2022-04-27 14:26:47.436142',
    '2022-04-27 14:26:47.436142',
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
    '<p>{logo}</p>\n\n<p>Hello <strong>{admin},</strong>&nbsp;</p>\n\n<p>Yoh have one inqury.</p>\n\n<p>Here are the informations!</p>\n\n<p>Email : <strong>{email}</strong></p>\n\n<p>Subject :&nbsp;<strong>{subject}</strong></p>\n\n<p>Message :&nbsp;<strong>{message}</strong></p>\n\n<p>Thank you,<br />\n{appname}</p>\n',
    'contact_us',
    1,
    '2022-04-27 14:26:47.445914',
    '2022-04-27 14:26:47.445914',
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
    '<title></title>\r\n<link href=\"https://fonts.googleapis.com/css?family=Lato:900,900italic,700italic,700,400italic,400,300italic,300,100italic,100&amp;subset=latin,latin-ext\" rel=\"stylesheet\" type=\"text/css\" />\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:400,700\" rel=\"stylesheet\" type=\"text/css\" />\r\n<style type=\"text/css\">@import url(\"https://fonts.googleapis.com/css?family=Lato:900,900italic,700italic,700,400italic,400,300italic,300,100italic,100&subset=latin,latin-ext\' rel=\'stylesheet\' type=\'text/css\"); @import url(\"https://fonts.googleapis.com/css?family=Montserrat:400,700\' rel=\'stylesheet\' type=\'text/css\'\");\r\n</style>\r\n<div class=\"main-content-wrap\" style=\"width: 600px; margin: 50px auto; font-weight: 400; line-height: 1.62857; -webkit-font-smoothing: antialiased;\">\r\n<div class=\"header\" style=\"color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: 16px;\">\r\n<div class=\"logo\" style=\"padding: 0px 0px 20px;text-align: center;border-bottom: 3px solid #FEAC0D;\"><font color=\"#727882\" face=\"Arial, Helvetica, sans-serif\"><span style=\"font-size: 15.3333px;\">&nbsp;</span></font><font color=\"#000000\" face=\"Lato, sans-serif\"><span style=\"font-size: 16px;\">{logo}</span></font><font color=\"#727882\" face=\"Arial, Helvetica, sans-serif\"><span style=\"font-size: 15.3333px;\"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></font></div>\r\n</div>\r\n\r\n<p style=\"color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: 16px;\">Dear&nbsp;{name},</p>\r\n\r\n<p style=\"color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: 16px;\">Reason for which your profile got rejected is :&nbsp;{comment}</p>\r\n\r\n<p style=\"color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: 16px;\">Thank you,<br />\r\n{appname} Team</p>\r\n</div>',
    'Reason',
    1,
    '2022-04-27 14:26:47.455460',
    '2022-04-27 14:26:47.455460',
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
    '<title></title>\r\n<link href=\"https://fonts.googleapis.com/css?family=Lato:900,900italic,700italic,700,400italic,400,300italic,300,100italic,100&amp;subset=latin,latin-ext\" rel=\"stylesheet\" type=\"text/css\" />\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:400,700\" rel=\"stylesheet\" type=\"text/css\" />\r\n<style type=\"text/css\">@import url(\"https://fonts.googleapis.com/css?family=Lato:900,900italic,700italic,700,400italic,400,300italic,300,100italic,100&subset=latin,latin-ext\' rel=\'stylesheet\' type=\'text/css\"); @import url(\"https://fonts.googleapis.com/css?family=Montserrat:400,700\' rel=\'stylesheet\' type=\'text/css\'\");\r\n</style>\r\n<div class=\"main-content-wrap\" style=\"width: 600px; margin: 50px auto; font-weight: 400; line-height: 1.62857; -webkit-font-smoothing: antialiased;\">\r\n<div class=\"header\" style=\"color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: 16px;\">\r\n<div class=\"logo\" style=\"padding: 0px 0px 20px;text-align: center;border-bottom: 3px solid #FEAC0D;\"><font color=\"#727882\" face=\"Arial, Helvetica, sans-serif\"><span style=\"font-size: 15.3333px;\">&nbsp;</span></font><font color=\"#000000\" face=\"Lato, sans-serif\"><span style=\"font-size: 16px;\">{logo}</span></font><font color=\"#727882\" face=\"Arial, Helvetica, sans-serif\"><span style=\"font-size: 15.3333px;\"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></font></div>\r\n</div>\r\n\r\n<p style=\"color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: 16px;\">Dear&nbsp;{name},</p>\r\n\r\n<p style=\"color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: 16px;\">Your profile request is accepted&nbsp;by admin, now you can further proceed with this application.</p>\r\n\r\n<p style=\"color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: 16px;\">Thank you,<br />\r\n{appname} Team</p>\r\n</div>',
    'Accepted',
    1,
    '2022-04-27 14:26:47.473193',
    '2022-04-27 14:26:47.473193',
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
    '<title></title>\r\n<link href=\"https://fonts.googleapis.com/css?family=Lato:900,900italic,700italic,700,400italic,400,300italic,300,100italic,100&amp;subset=latin,latin-ext\" rel=\"stylesheet\" type=\"text/css\" />\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:400,700\" rel=\"stylesheet\" type=\"text/css\" />\r\n<style type=\"text/css\">@import url(\"https://fonts.googleapis.com/css?family=Lato:900,900italic,700italic,700,400italic,400,300italic,300,100italic,100&subset=latin,latin-ext\' rel=\'stylesheet\' type=\'text/css\"); @import url(\"https://fonts.googleapis.com/css?family=Montserrat:400,700\' rel=\'stylesheet\' type=\'text/css\'\");\r\n</style>\r\n<div class=\"main-content-wrap\" style=\"width: 600px; margin: 50px auto; font-weight: 400; line-height: 1.62857; -webkit-font-smoothing: antialiased;\">\r\n<div class=\"header\" style=\"color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: 16px;\">\r\n<div class=\"logo\" style=\"padding: 0px 0px 20px;text-align: center;border-bottom: 3px solid #FEAC0D;\"><font color=\"#727882\" face=\"Arial, Helvetica, sans-serif\"><span style=\"font-size: 15.3333px;\">&nbsp;</span></font><font color=\"#000000\" face=\"Lato, sans-serif\"><span style=\"font-size: 16px;\">{logo}</span></font><font color=\"#727882\" face=\"Arial, Helvetica, sans-serif\"><span style=\"font-size: 15.3333px;\"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></font></div>\r\n</div>\r\n\r\n<p style=\"color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: 16px;\">Dear&nbsp; {name},</p>\r\n\r\n<p style=\"color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: 16px;\"><span>Your profile has been sent to admin for re-approval, you will receive mail from admin when it will Approve.&nbsp;</span></p>\r\n\r\n<p style=\"color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: 16px;\">Thank you,<br />\r\n{appname} Team</p>\r\n</div>\r\n',
    'Pending',
    1,
    '2022-04-27 14:26:47.485689',
    '2022-04-27 14:26:47.485689',
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
    '<title></title>\r\n<link href=\"https://fonts.googleapis.com/css?family=Lato:900,900italic,700italic,700,400italic,400,300italic,300,100italic,100&amp;subset=latin,latin-ext\" rel=\"stylesheet\" type=\"text/css\" />\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:400,700\" rel=\"stylesheet\" type=\"text/css\" />\r\n<style type=\"text/css\">@import url(\"https://fonts.googleapis.com/css?family=Lato:900,900italic,700italic,700,400italic,400,300italic,300,100italic,100&subset=latin,latin-ext\' rel=\'stylesheet\' type=\'text/css\"); @import url(\"https://fonts.googleapis.com/css?family=Montserrat:400,700\' rel=\'stylesheet\' type=\'text/css\'\");\r\n</style>\r\n<div class=\"main-content-wrap\" style=\"width: 600px; margin: 50px auto; font-weight: 400; line-height: 1.62857; -webkit-font-smoothing: antialiased;\">\r\n<div class=\"header\" style=\"color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: 16px;\">\r\n<div class=\"logo\" style=\"padding: 0px 0px 20px;text-align: center;border-bottom: 3px solid #FEAC0D;\"><font color=\"#727882\" face=\"Arial, Helvetica, sans-serif\"><span style=\"font-size: 15.3333px;\">&nbsp;</span></font><font color=\"#000000\" face=\"Lato, sans-serif\"><span style=\"font-size: 16px;\">{logo}</span></font><font color=\"#727882\" face=\"Arial, Helvetica, sans-serif\"><span style=\"font-size: 15.3333px;\"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></font></div>\r\n</div>\r\n\r\n<p style=\"color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: 16px;\">Dear&nbsp;{name},</p>\r\n\r\n<p style=\"color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: 16px;\">Your account is activated by admin.</p>\r\n\r\n<p style=\"color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: 16px;\">Thank you,<br />\r\n{appname} Team</p>\r\n</div>',
    'Unblock',
    1,
    '2022-04-27 14:26:47.493028',
    '2022-04-27 14:26:47.493028',
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
    '<title></title>\r\n<link href=\"https://fonts.googleapis.com/css?family=Lato:900,900italic,700italic,700,400italic,400,300italic,300,100italic,100&amp;subset=latin,latin-ext\" rel=\"stylesheet\" type=\"text/css\" />\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:400,700\" rel=\"stylesheet\" type=\"text/css\" />\r\n<style type=\"text/css\">@import url(\"https://fonts.googleapis.com/css?family=Lato:900,900italic,700italic,700,400italic,400,300italic,300,100italic,100&subset=latin,latin-ext\' rel=\'stylesheet\' type=\'text/css\"); @import url(\"https://fonts.googleapis.com/css?family=Montserrat:400,700\' rel=\'stylesheet\' type=\'text/css\'\");\r\n</style>\r\n<div class=\"main-content-wrap\" style=\"width: 600px; margin: 50px auto; font-weight: 400; line-height: 1.62857; -webkit-font-smoothing: antialiased;\">\r\n<div class=\"header\" style=\"color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: 16px;\">\r\n<div class=\"logo\" style=\"padding: 0px 0px 20px;text-align: center;border-bottom: 3px solid #FEAC0D;\"><font color=\"#727882\" face=\"Arial, Helvetica, sans-serif\"><span style=\"font-size: 15.3333px;\">&nbsp;</span></font><font color=\"#000000\" face=\"Lato, sans-serif\"><span style=\"font-size: 16px;\">{logo}</span></font><font color=\"#727882\" face=\"Arial, Helvetica, sans-serif\"><span style=\"font-size: 15.3333px;\"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></font></div>\r\n</div>\r\n\r\n<p>Hello <strong>{name}</strong>,</p>\r\n\r\n<p>Welcome to <strong>{appname}</strong>.</p>\r\n\r\n<p>Use the credentials below to sign-in.</p>\r\n\r\n<p>Link : <strong>{link}</strong></p>\r\n\r\n<p>Email : <strong>{email}</strong></p>\r\n\r\n<p>Password : <strong>{password}</strong></p>\r\n\r\n<p>Please note that password is auto-generated, kindly, change it once sign in successfully.</p>\r\n\r\n<p>Thank you,<br />\r\n{appname} Team</p>\r\n</div>',
    'subadmin_registration',
    1,
    '2022-04-27 14:26:47.503122',
    '2022-04-27 14:26:47.503122',
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

INSERT INTO
  `faqs` (
    `id`,
    `user_type`,
    `question`,
    `answer`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`
  )
VALUES
  (
    1,
    'user',
    'Is this type user?',
    'Test answer',
    1,
    '2022-05-05 11:07:11.218197',
    '2022-05-05 11:07:11.218197',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1
  );
INSERT INTO
  `faqs` (
    `id`,
    `user_type`,
    `question`,
    `answer`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`
  )
VALUES
  (
    2,
    'user',
    'Is this type user1?',
    'Test answer1',
    1,
    '2022-05-09 15:11:00.545425',
    '2022-05-09 15:11:00.545425',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1
  );
INSERT INTO
  `faqs` (
    `id`,
    `user_type`,
    `question`,
    `answer`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`
  )
VALUES
  (
    3,
    'user',
    'Is this type user2?',
    'Test answer2',
    1,
    '2022-05-09 15:11:06.950438',
    '2022-05-09 15:11:06.950438',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1
  );
INSERT INTO
  `faqs` (
    `id`,
    `user_type`,
    `question`,
    `answer`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`
  )
VALUES
  (
    4,
    'user',
    'Is this type user3?',
    'Test answer3',
    1,
    '2022-05-09 15:11:13.058361',
    '2022-05-09 15:11:13.058361',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: freelance_drivers_payment
# ------------------------------------------------------------

INSERT INTO
  `freelance_drivers_payment` (
    `id`,
    `paid_amount`,
    `schedule_date`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `driver_id`,
    `order_id`
  )
VALUES
  (
    1,
    10,
    NULL,
    '2022-06-08 10:38:58.533549',
    '2022-06-08 10:38:58.533549',
    NULL,
    NULL,
    NULL,
    '951c7937-5d94-4b0b-8fe9-4deccdb7e0af',
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: government_holidays
# ------------------------------------------------------------

INSERT INTO
  `government_holidays` (
    `id`,
    `description`,
    `vendor_ids`,
    `date`,
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
    'test b',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '2022-04-28 12:00:00',
    1,
    '2022-04-27 16:09:10.630760',
    '2022-05-02 10:19:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL
  );
INSERT INTO
  `government_holidays` (
    `id`,
    `description`,
    `vendor_ids`,
    `date`,
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
    'test 22',
    '5700fef8-e7da-45ef-9255-6903603678fa',
    '2022-03-13 14:23:54',
    1,
    '2022-04-27 16:09:22.576552',
    '2022-04-28 17:12:18.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL
  );
INSERT INTO
  `government_holidays` (
    `id`,
    `description`,
    `vendor_ids`,
    `date`,
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
    'sdsdsdsds',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '2022-04-29 12:00:00',
    1,
    '2022-04-27 16:09:45.313837',
    '2022-04-27 16:10:12.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-04-27 16:10:12.000000'
  );
INSERT INTO
  `government_holidays` (
    `id`,
    `description`,
    `vendor_ids`,
    `date`,
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
    'abababababaa',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7,13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    '2022-05-16 12:00:00',
    1,
    '2022-04-27 16:09:58.516137',
    '2022-04-29 19:02:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL
  );

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
    10,
    1,
    0,
    0,
    '2022-04-27 14:26:48.413858',
    '2022-05-31 17:47:44.000000',
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
    '2022-04-27 14:26:48.436436',
    '2022-04-27 14:26:48.436436',
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
    '2022-04-27 14:26:48.443217',
    '2022-04-27 14:26:48.443217',
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
    '2022-04-27 14:26:48.458659',
    '2022-04-27 14:26:48.458659',
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
    '2022-04-27 14:26:48.469270',
    '2022-04-27 14:26:48.469270',
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
    '2022-04-27 14:26:48.473398',
    '2022-04-27 14:26:48.473398',
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
    '2022-04-27 14:26:48.482941',
    '2022-04-27 14:26:48.482941',
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
    '2022-04-27 14:26:48.486688',
    '2022-04-27 14:26:48.486688',
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
    '2022-04-27 14:26:48.490444',
    '2022-04-27 14:26:48.490444',
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
    '2022-04-27 14:26:48.494127',
    '2022-04-27 14:26:48.494127',
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
    '2022-04-27 14:26:48.501362',
    '2022-04-27 14:26:48.501362',
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
    '2022-04-27 14:26:48.506343',
    '2022-04-27 14:26:48.506343',
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
    '2022-04-27 14:26:48.510605',
    '2022-04-27 14:26:48.510605',
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
    '2022-04-27 14:26:48.516019',
    '2022-04-27 14:26:48.516019',
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
    '2022-04-27 14:26:48.521365',
    '2022-04-27 14:26:48.521365',
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
    '2022-04-27 14:26:48.525203',
    '2022-04-27 14:26:48.525203',
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
    '2022-04-27 14:26:48.529325',
    '2022-04-27 14:26:48.529325',
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
    '2022-04-27 14:26:48.533173',
    '2022-04-27 14:26:48.533173',
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
    '2022-04-27 14:26:48.536919',
    '2022-04-27 14:26:48.536919',
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
    '2022-04-27 14:26:48.540755',
    '2022-04-27 14:26:48.540755',
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
    '2022-04-27 14:26:48.544604',
    '2022-04-27 14:26:48.544604',
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
    '2022-04-27 14:26:48.548365',
    '2022-04-27 14:26:48.548365',
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
    '2022-04-27 14:26:48.553740',
    '2022-04-27 14:26:48.553740',
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
    '2022-04-27 14:26:48.560414',
    '2022-04-27 14:26:48.560414',
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
    '2022-04-27 14:26:48.569784',
    '2022-04-27 14:26:48.569784',
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
    '2022-04-27 14:26:48.575349',
    '2022-04-27 14:26:48.575349',
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
    '2022-04-27 14:26:48.580188',
    '2022-04-27 14:26:48.580188',
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
    '2022-04-27 14:26:48.594543',
    '2022-04-27 14:26:48.594543',
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
    '2022-04-27 14:26:48.601922',
    '2022-04-27 14:26:48.601922',
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
    '2022-04-27 14:26:48.606254',
    '2022-04-27 14:26:48.606254',
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
    '2022-04-27 14:26:48.610002',
    '2022-04-27 14:26:48.610002',
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
    '2022-04-27 14:26:48.614068',
    '2022-04-27 14:26:48.614068',
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
    '2022-04-27 14:26:48.618024',
    '2022-04-27 14:26:48.618024',
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
    '2022-04-27 14:26:48.622048',
    '2022-04-27 14:26:48.622048',
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
    '2022-04-27 14:26:48.625728',
    '2022-04-27 14:26:48.625728',
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
    '2022-04-27 14:26:48.630928',
    '2022-04-27 14:26:48.630928',
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
    '2022-04-27 14:26:48.637217',
    '2022-04-27 14:26:48.637217',
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
    '2022-04-27 14:26:48.641303',
    '2022-04-27 14:26:48.641303',
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
    '2022-04-27 14:26:48.645255',
    '2022-04-27 14:26:48.645255',
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
    '2022-04-27 14:26:48.651750',
    '2022-04-27 14:26:48.651750',
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
    10,
    1,
    1,
    '2022-04-27 14:26:48.080959',
    '2022-05-31 17:47:44.000000',
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
    0,
    '2022-04-27 14:26:48.125679',
    '2022-04-27 14:26:48.125679',
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
    10,
    1,
    0,
    '2022-04-27 14:26:48.138251',
    '2022-05-20 13:25:57.000000',
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
    '2022-04-27 14:26:48.142771',
    '2022-04-27 14:26:48.142771',
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
    '2022-04-27 14:26:48.162894',
    '2022-04-27 14:26:48.162894',
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
    '2022-04-27 14:26:48.167416',
    '2022-04-27 14:26:48.167416',
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
    10,
    1,
    0,
    '2022-04-27 14:26:48.171478',
    '2022-05-20 13:25:35.000000',
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
    '2022-04-27 14:26:48.175628',
    '2022-04-27 14:26:48.175628',
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
    '2022-04-27 14:26:48.181517',
    '2022-04-27 14:26:48.181517',
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
    '2022-04-27 14:26:48.189182',
    '2022-04-27 14:26:48.189182',
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
    10,
    1,
    0,
    '2022-04-27 14:26:48.196411',
    '2022-05-20 13:25:48.000000',
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
    '2022-04-27 14:26:48.199998',
    '2022-04-27 14:26:48.199998',
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
    'adc27b86-fb59-4a1b-bbe0-61f3f122b842',
    'test',
    '',
    '',
    1,
    '2022-04-27 14:26:48.030289',
    '2022-06-02 13:01:14.146800',
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
    'ba33ed94-f3ec-4f11-a58a-8c294f8f16e9',
    'Home Pro',
    '',
    '',
    1,
    '2022-04-27 14:26:48.034570',
    '2022-06-02 13:01:14.153188',
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
    3,
    '7215bdfa-b289-4f50-99c7-e6819163eb1e',
    'Grilling Lite',
    '1,4',
    '1,2',
    2,
    '2022-04-27 14:26:48.042828',
    '2022-06-02 13:18:09.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    0
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
    '46113624-c80f-4bc8-8396-e2115066c9cb',
    'Grilling Pro',
    '4',
    '2',
    2,
    '2022-04-27 14:26:48.047230',
    '2022-06-08 12:13:47.000000',
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
    5,
    '37b77655-7939-4015-a8d5-7604e69e9dd7',
    'Business Lite',
    '',
    '',
    2,
    '2022-04-27 14:26:48.057538',
    '2022-06-02 13:01:20.811803',
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
    6,
    '300572f3-66e0-43b2-a3a2-af6be04681cc',
    'Business Pro',
    '',
    '',
    2,
    '2022-04-27 14:26:48.063391',
    '2022-06-02 13:01:20.813794',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: migrations
# ------------------------------------------------------------

INSERT INTO
  `migrations` (`id`, `timestamp`, `name`)
VALUES
  (3, 1654839813706, 'test1654839813706');

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
    '2022-04-27 14:26:47.542070',
    '2022-04-27 14:26:47.542070',
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
    '2022-04-27 14:26:47.548352',
    '2022-04-27 14:26:47.548352',
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
    '2022-04-27 14:26:47.553393',
    '2022-04-27 14:26:47.553393',
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
    '2022-04-27 14:26:47.561796',
    '2022-04-27 14:26:47.561796',
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
    '2022-04-27 14:26:47.569678',
    '2022-04-27 14:26:47.569678',
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
    '2022-04-27 14:26:47.573516',
    '2022-04-27 14:26:47.573516',
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
    '2022-04-27 14:26:47.577422',
    '2022-04-27 14:26:47.577422',
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
    '2022-04-27 14:26:47.586518',
    '2022-04-27 14:26:47.586518',
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
    '2022-04-27 14:26:47.592833',
    '2022-04-27 14:26:47.592833',
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
    '2022-04-27 14:26:47.597939',
    '2022-04-27 14:26:47.597939',
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
    '2022-04-27 14:26:47.606900',
    '2022-04-27 14:26:47.606900',
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
    '2022-04-27 14:26:47.611156',
    '2022-04-27 14:26:47.611156',
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
    '2022-04-27 14:26:47.616945',
    '2022-04-27 14:26:47.616945',
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
    '2022-04-27 14:26:47.625621',
    '2022-04-27 14:26:47.625621',
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
    '2022-04-27 14:26:47.633085',
    '2022-04-27 14:26:47.633085',
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
    '2022-04-27 14:26:47.636890',
    '2022-04-27 14:26:47.636890',
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
    '2022-04-27 14:26:47.641038',
    '2022-04-27 14:26:47.641038',
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
    '2022-04-27 14:26:47.644953',
    '2022-04-27 14:26:47.644953',
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
    '2022-04-27 14:26:47.651131',
    '2022-04-27 14:26:47.651131',
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
    '2022-04-27 14:26:47.655019',
    '2022-04-27 14:26:47.655019',
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
    '2022-04-27 14:26:47.659563',
    '2022-04-27 14:26:47.659563',
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
    '2022-04-27 14:26:47.664860',
    '2022-04-27 14:26:47.664860',
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
    '2022-04-27 14:26:47.668587',
    '2022-04-27 14:26:47.668587',
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
    '2022-04-27 14:26:47.672254',
    '2022-04-27 14:26:47.672254',
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
    '2022-04-27 14:26:47.677341',
    '2022-04-27 14:26:47.677341',
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
    '2022-04-27 14:26:47.680787',
    '2022-04-27 14:26:47.680787',
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
    '2022-04-27 14:26:47.684255',
    '2022-04-27 14:26:47.684255',
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
    '2022-04-27 14:26:47.690786',
    '2022-04-27 14:26:47.690786',
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
    '2022-04-27 14:26:47.697749',
    '2022-04-27 14:26:47.697749',
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
    '2022-04-27 14:26:47.701538',
    '2022-04-27 14:26:47.701538',
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
    '2022-04-27 14:26:47.705881',
    '2022-04-27 14:26:47.705881',
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
    '2022-04-27 14:26:47.709862',
    '2022-04-27 14:26:47.709862',
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
    '2022-04-27 14:26:47.715381',
    '2022-04-27 14:26:47.715381',
    NULL,
    NULL,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: notification
# ------------------------------------------------------------

INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    6,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    'demo Notification',
    'hiii...',
    1,
    NULL,
    1,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '2022-05-09 11:15:15.319935',
    '2022-05-09 18:20:24.000000',
    '2022-05-09 18:20:24.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    7,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    'demo Notification',
    'hiii...',
    1,
    NULL,
    1,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '2022-05-09 11:15:49.736429',
    '2022-05-09 18:20:24.000000',
    '2022-05-09 18:20:24.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    8,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-09 12:57:03.265359',
    '2022-05-09 14:54:42.000000',
    '2022-05-09 14:54:42.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    9,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6,4c568150-4bd3-4489-bab7-87db49241ff6,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,cadcaccf-9361-417d-abb8-4096c81b1ac8',
    'test drivers',
    'Hello Test',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-09 13:23:08.837686',
    '2022-05-09 17:37:45.000000',
    '2022-05-09 17:37:45.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    10,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test ',
    'Hello Test',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-09 15:02:46.402885',
    '2022-05-09 17:37:45.000000',
    '2022-05-09 17:37:45.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    11,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6,4c568150-4bd3-4489-bab7-87db49241ff6,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,cadcaccf-9361-417d-abb8-4096c81b1ac8',
    'Hello',
    '<p>All drivers</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-09 17:43:43.167066',
    '2022-05-09 18:20:24.000000',
    '2022-05-09 18:20:24.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    12,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    'Hello',
    '<p>All customers</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-09 18:15:21.370424',
    '2022-05-09 18:20:24.000000',
    '2022-05-09 18:20:24.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    13,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    'Hello',
    '<p>all customers</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-09 18:21:38.905548',
    '2022-05-09 18:22:07.000000',
    '2022-05-09 18:22:07.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    14,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6,4c568150-4bd3-4489-bab7-87db49241ff6,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,cadcaccf-9361-417d-abb8-4096c81b1ac8',
    'Hello',
    '<p>All drivers</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-09 18:21:58.561450',
    '2022-05-09 18:23:12.000000',
    '2022-05-09 18:23:12.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    15,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    'Hello',
    '<p>All customers</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-09 18:23:02.720315',
    '2022-05-09 18:23:12.000000',
    '2022-05-09 18:23:12.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    16,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6,4c568150-4bd3-4489-bab7-87db49241ff6,951c7937-5d94-4b0b-8fe9-4deccdb7e0af',
    'Hello',
    '<p>Selected drivers</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-09 19:03:23.931843',
    '2022-05-09 19:07:26.000000',
    '2022-05-09 19:07:26.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    17,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6,4c568150-4bd3-4489-bab7-87db49241ff6,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,cadcaccf-9361-417d-abb8-4096c81b1ac8',
    'Hello',
    '<p>All drivers</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-09 19:07:18.336864',
    '2022-05-09 19:07:26.000000',
    '2022-05-09 19:07:26.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    18,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6,4c568150-4bd3-4489-bab7-87db49241ff6,951c7937-5d94-4b0b-8fe9-4deccdb7e0af',
    'Hello',
    '<p>Selected drivers</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-10 09:50:15.679685',
    '2022-05-10 10:04:39.000000',
    '2022-05-10 10:04:39.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    19,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6,4c568150-4bd3-4489-bab7-87db49241ff6,951c7937-5d94-4b0b-8fe9-4deccdb7e0af',
    'Hello',
    '<p>Drivers</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-10 09:52:14.253088',
    '2022-05-10 10:04:39.000000',
    '2022-05-10 10:04:39.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    20,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    'Hello',
    '<p>All customers</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-10 09:57:20.806814',
    '2022-05-10 10:04:39.000000',
    '2022-05-10 10:04:39.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    21,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6,4c568150-4bd3-4489-bab7-87db49241ff6,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,cadcaccf-9361-417d-abb8-4096c81b1ac8',
    'Hello',
    '<p>All drivers</p>',
    1,
    NULL,
    1,
    '',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-10 10:01:51.557272',
    '2022-05-10 11:55:23.000000',
    '2022-05-10 11:55:23.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    22,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    'Hello',
    '<p>All</p>',
    1,
    NULL,
    1,
    '',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-10 10:05:07.843961',
    '2022-05-10 11:55:23.000000',
    '2022-05-10 11:55:23.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    23,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test ',
    'Hello Test',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-10 10:12:50.192498',
    '2022-05-10 13:31:43.000000',
    '2022-05-10 13:31:43.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    24,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6,4c568150-4bd3-4489-bab7-87db49241ff6,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,cadcaccf-9361-417d-abb8-4096c81b1ac8',
    'Hello',
    '<p>All drivers</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-10 10:43:34.669628',
    '2022-05-13 13:18:26.000000',
    '2022-05-13 13:18:26.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    25,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-10 10:58:39.242983',
    '2022-05-10 13:31:43.000000',
    '2022-05-10 13:31:43.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    26,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-10 11:06:22.057276',
    '2022-05-10 13:31:43.000000',
    '2022-05-10 13:31:43.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    27,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'test',
    'Hello Test',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-10 11:11:04.529910',
    '2022-05-10 11:56:32.000000',
    '2022-05-10 11:56:32.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    28,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156',
    'Hello',
    '<p>qwerty</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-10 11:49:12.159633',
    '2022-05-10 11:56:10.000000',
    '2022-05-10 11:56:10.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    29,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6,4c568150-4bd3-4489-bab7-87db49241ff6,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,cadcaccf-9361-417d-abb8-4096c81b1ac8',
    'Hello',
    '<p>All</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-10 11:56:20.978379',
    '2022-05-10 12:00:20.000000',
    '2022-05-10 12:00:20.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    30,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6,4c568150-4bd3-4489-bab7-87db49241ff6,951c7937-5d94-4b0b-8fe9-4deccdb7e0af',
    'Hello',
    '<p>Selected drivers</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-10 12:00:07.953087',
    '2022-05-10 12:01:58.000000',
    '2022-05-10 12:01:58.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    31,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6,4c568150-4bd3-4489-bab7-87db49241ff6,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,cadcaccf-9361-417d-abb8-4096c81b1ac8',
    'Hello',
    '<p>All</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-10 12:01:43.807030',
    '2022-05-10 12:05:13.000000',
    '2022-05-10 12:05:13.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    32,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156',
    'Hello',
    '<p>selected</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-10 12:04:59.624233',
    '2022-05-10 12:06:10.000000',
    '2022-05-10 12:06:10.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    33,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6,4c568150-4bd3-4489-bab7-87db49241ff6,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,cadcaccf-9361-417d-abb8-4096c81b1ac8',
    'Hello',
    '<p>All</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-10 12:06:50.475764',
    '2022-05-10 12:07:31.000000',
    '2022-05-10 12:07:31.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    34,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6,4c568150-4bd3-4489-bab7-87db49241ff6,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,cadcaccf-9361-417d-abb8-4096c81b1ac8',
    'Hello',
    '<p>All driverrrr</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-10 12:07:21.522005',
    '2022-05-10 12:08:19.000000',
    '2022-05-10 12:08:19.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    35,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6,4c568150-4bd3-4489-bab7-87db49241ff6,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,cadcaccf-9361-417d-abb8-4096c81b1ac8',
    'Hello',
    '<p>all</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-10 12:08:10.309642',
    '2022-05-10 12:10:29.000000',
    '2022-05-10 12:10:29.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    36,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6,4c568150-4bd3-4489-bab7-87db49241ff6,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,cadcaccf-9361-417d-abb8-4096c81b1ac8',
    'Hello',
    '<p>All driverssss</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-10 12:10:17.768443',
    '2022-05-10 12:10:40.000000',
    '2022-05-10 12:10:40.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    37,
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    '4c568150-4bd3-4489-bab7-87db49241ff6',
    'test',
    'Hello Test',
    1,
    NULL,
    0,
    '',
    '',
    '2022-05-10 12:35:32.460322',
    '2022-05-10 15:22:00.000000',
    '2022-05-10 15:22:00.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    38,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '4c568150-4bd3-4489-bab7-87db49241ff6',
    'test',
    'Hello Test',
    1,
    NULL,
    0,
    '',
    '',
    '2022-05-10 12:46:03.065565',
    '2022-05-10 15:22:00.000000',
    '2022-05-10 15:22:00.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    39,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '4c568150-4bd3-4489-bab7-87db49241ff6',
    'test',
    'Hello Test',
    1,
    NULL,
    0,
    '',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-10 12:48:15.744754',
    '2022-05-10 15:19:03.000000',
    '2022-05-10 15:19:03.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    40,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    'Hello',
    '<p>All customers</p>',
    1,
    NULL,
    0,
    '',
    '',
    '2022-05-10 13:58:24.904834',
    '2022-05-10 15:22:44.000000',
    '2022-05-10 15:22:44.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    41,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '4c568150-4bd3-4489-bab7-87db49241ff6,951c7937-5d94-4b0b-8fe9-4deccdb7e0af',
    'Hello',
    '<p>Selected drivers</p>',
    1,
    NULL,
    0,
    '',
    '',
    '2022-05-10 15:07:53.125451',
    '2022-05-10 15:22:44.000000',
    '2022-05-10 15:22:44.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    42,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6,4c568150-4bd3-4489-bab7-87db49241ff6,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,cadcaccf-9361-417d-abb8-4096c81b1ac8',
    'Hello',
    '<p>all drivers</p>',
    1,
    NULL,
    0,
    '',
    '',
    '2022-05-10 15:10:50.571276',
    '2022-05-10 15:17:45.000000',
    '2022-05-10 15:17:45.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    43,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    'Hello',
    '<p>Customers</p>',
    1,
    NULL,
    0,
    '',
    '',
    '2022-05-10 15:16:25.285591',
    '2022-05-10 16:11:39.000000',
    '2022-05-10 16:11:39.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    44,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    0,
    '',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-10 15:26:55.600940',
    '2022-05-24 12:19:28.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    45,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    0,
    '',
    '',
    '2022-05-10 15:27:39.226518',
    '2022-05-10 16:18:09.000000',
    '2022-05-10 16:18:09.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    46,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-10 15:28:11.930214',
    '2022-05-11 12:26:01.000000',
    '2022-05-11 12:26:01.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    47,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-10 15:33:44.275151',
    '2022-05-11 12:26:01.000000',
    '2022-05-11 12:26:01.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    48,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    'Hello',
    '<p>Selected customers</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-10 15:34:17.795303',
    '2022-05-10 15:34:17.795303',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    49,
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    0,
    '',
    '',
    '2022-05-10 16:17:34.112024',
    '2022-05-10 16:22:35.000000',
    '2022-05-10 16:22:35.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    50,
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Drivers',
    1,
    NULL,
    0,
    '',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-10 16:20:14.214004',
    '2022-05-24 17:00:12.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    51,
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6,4c568150-4bd3-4489-bab7-87db49241ff6,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,cadcaccf-9361-417d-abb8-4096c81b1ac8',
    'test',
    'Hello Drivers',
    1,
    NULL,
    0,
    '',
    '',
    '2022-05-10 16:20:50.177144',
    '2022-05-10 16:27:54.000000',
    '2022-05-10 16:27:54.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    52,
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6,4c568150-4bd3-4489-bab7-87db49241ff6,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,cadcaccf-9361-417d-abb8-4096c81b1ac8',
    'test',
    'Hello Drivers',
    1,
    NULL,
    0,
    '',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-13 12:24:53.851187',
    '2022-05-13 14:45:15.000000',
    '2022-05-13 14:45:15.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    53,
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6,4c568150-4bd3-4489-bab7-87db49241ff6,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,cadcaccf-9361-417d-abb8-4096c81b1ac8',
    'test',
    'Hello Drivers from vendor',
    1,
    NULL,
    0,
    '',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-13 12:25:03.408488',
    '2022-05-13 14:45:15.000000',
    '2022-05-13 14:45:15.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    54,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,7df6a123-7093-4950-a86e-1499441857a0,e604ead9-2bf0-415a-a63b-be393e533e43',
    'Hello',
    '<p>All drivers</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-13 14:42:21.096916',
    '2022-05-13 14:42:53.000000',
    '2022-05-13 14:42:53.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    55,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,7df6a123-7093-4950-a86e-1499441857a0,e604ead9-2bf0-415a-a63b-be393e533e43',
    'Hello',
    '<p>fsadf</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-13 14:42:31.942151',
    '2022-05-13 14:42:53.000000',
    '2022-05-13 14:42:53.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    56,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,7df6a123-7093-4950-a86e-1499441857a0',
    'Hello',
    '<p>Selected</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-13 14:43:10.191947',
    '2022-05-13 14:43:29.000000',
    '2022-05-13 14:43:29.000000',
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    57,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,7df6a123-7093-4950-a86e-1499441857a0,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    0,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-16 11:54:39.004173',
    '2022-05-24 17:00:12.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    58,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,7df6a123-7093-4950-a86e-1499441857a0,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    0,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-16 11:59:08.554930',
    '2022-05-24 17:00:12.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    59,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,7df6a123-7093-4950-a86e-1499441857a0,c484df2f-bda6-46bf-825a-40669ed2a7ab,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '',
    '2022-05-17 15:52:40.905646',
    '2022-05-19 12:21:44.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    60,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,7df6a123-7093-4950-a86e-1499441857a0,c484df2f-bda6-46bf-825a-40669ed2a7ab,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '',
    '2022-05-17 15:57:11.309754',
    '2022-05-19 12:21:44.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    61,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,7df6a123-7093-4950-a86e-1499441857a0,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '',
    '2022-05-17 15:57:38.711355',
    '2022-05-19 12:21:44.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    62,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,7df6a123-7093-4950-a86e-1499441857a0,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '',
    '2022-05-17 16:02:07.083275',
    '2022-05-19 12:21:44.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    63,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,7df6a123-7093-4950-a86e-1499441857a0,95ed56a5-d085-4210-8995-f818da5d8485,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    0,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-19 12:31:42.857462',
    '2022-05-24 17:00:12.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    64,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,7df6a123-7093-4950-a86e-1499441857a0,95ed56a5-d085-4210-8995-f818da5d8485,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    0,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-19 12:31:57.068934',
    '2022-05-24 17:02:36.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    65,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,7df6a123-7093-4950-a86e-1499441857a0,95ed56a5-d085-4210-8995-f818da5d8485,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    0,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-19 12:31:58.548076',
    '2022-05-24 17:02:41.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    66,
    '581ffd6a-7de6-40a9-8745-11b362079937',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,5045215b-f750-44fd-83ef-f9af59a3fc1e,7df6a123-7093-4950-a86e-1499441857a0,95ed56a5-d085-4210-8995-f818da5d8485,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    0,
    '',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-20 11:42:57.967180',
    '2022-05-24 17:02:41.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    67,
    '581ffd6a-7de6-40a9-8745-11b362079937',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,5045215b-f750-44fd-83ef-f9af59a3fc1e,7df6a123-7093-4950-a86e-1499441857a0,95ed56a5-d085-4210-8995-f818da5d8485,e604ead9-2bf0-415a-a63b-be393e533e43',
    'Deleveered',
    'ORder Not Delivered No one At ngome',
    1,
    NULL,
    0,
    '',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-20 11:43:23.145126',
    '2022-05-24 17:02:41.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    68,
    '581ffd6a-7de6-40a9-8745-11b362079937',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,5045215b-f750-44fd-83ef-f9af59a3fc1e,7df6a123-7093-4950-a86e-1499441857a0,95ed56a5-d085-4210-8995-f818da5d8485,e604ead9-2bf0-415a-a63b-be393e533e43',
    'Deleveered',
    'ORder Not Delivered No one At ngome',
    1,
    NULL,
    0,
    '',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-20 11:47:41.292215',
    '2022-05-24 17:02:41.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    69,
    NULL,
    '581ffd6a-7de6-40a9-8745-11b362079937',
    'Test',
    'Your request has been sent to admin',
    NULL,
    NULL,
    0,
    '',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-20 14:15:56.324122',
    '2022-05-24 17:02:47.000000',
    NULL,
    'Mr/Ms As far try to contact you.'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    70,
    NULL,
    '581ffd6a-7de6-40a9-8745-11b362079937',
    'Hello checking ContactIS',
    'Your request has been sent to admin',
    NULL,
    NULL,
    0,
    '',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-20 14:25:53.009800',
    '2022-05-24 17:02:47.000000',
    NULL,
    'Mr/Ms As far try to contact you.'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    71,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    'Hello',
    '<p>sdfsdf</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-23 19:00:12.916624',
    '2022-05-23 19:00:12.916624',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    72,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '95ed56a5-d085-4210-8995-f818da5d8485',
    'Hello',
    '<p>Test</p>',
    1,
    NULL,
    1,
    '',
    '',
    '2022-05-24 10:55:12.470868',
    '2022-05-24 10:55:12.470868',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    73,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,5045215b-f750-44fd-83ef-f9af59a3fc1e,7df6a123-7093-4950-a86e-1499441857a0,95ed56a5-d085-4210-8995-f818da5d8485,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    0,
    '',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 14:42:28.113696',
    '2022-05-24 17:02:47.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    74,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,5045215b-f750-44fd-83ef-f9af59a3fc1e,7df6a123-7093-4950-a86e-1499441857a0,95ed56a5-d085-4210-8995-f818da5d8485,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    0,
    '',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 14:42:29.867125',
    '2022-05-24 17:02:47.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    75,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,5045215b-f750-44fd-83ef-f9af59a3fc1e,7df6a123-7093-4950-a86e-1499441857a0,95ed56a5-d085-4210-8995-f818da5d8485,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    0,
    '',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 14:42:31.165145',
    '2022-05-24 17:02:47.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    76,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '008580ca-2563-4a99-a368-7717549dd0b1,06e7292a-6a32-4179-ae74-a477f5fe2f5f,13183e4a-be4d-432c-96f5-3b603e6b6cd9,3f3c9e66-e7b8-4ea8-bd46-96dd0de6d318,47d16810-bea3-4a48-b1b5-33fb23b34156,4c568150-4bd3-4489-bab7-87db49241ff6,5045215b-f750-44fd-83ef-f9af59a3fc1e,581ffd6a-7de6-40a9-8745-11b362079937,6884e482-e1fe-40b6-ac9a-22d790dd9e0e,6a7cdcd3-b4de-4bad-923a-b0b080876fd7,6edea6c6-b8ad-45d6-bee9-928a8c599e30,706dd907-3b96-4ad7-84a4-f5ac91ebd68c,7df6a123-7093-4950-a86e-1499441857a0,88a386cc-522e-4555-b93f-fbe9a6355de5,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,95ed56a5-d085-4210-8995-f818da5d8485,a202cb0f-ce05-4981-b2e6-311f24ddaf47,a2203363-d9e1-444b-be38-818252f51e61,c7649266-200e-49b2-bb1b-7632d49cbbb8,cadcaccf-9361-417d-abb8-4096c81b1ac8,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    0,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 14:43:56.813597',
    '2022-05-24 17:02:47.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    77,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '008580ca-2563-4a99-a368-7717549dd0b1,06e7292a-6a32-4179-ae74-a477f5fe2f5f,13183e4a-be4d-432c-96f5-3b603e6b6cd9,3f3c9e66-e7b8-4ea8-bd46-96dd0de6d318,47d16810-bea3-4a48-b1b5-33fb23b34156,4c568150-4bd3-4489-bab7-87db49241ff6,5045215b-f750-44fd-83ef-f9af59a3fc1e,581ffd6a-7de6-40a9-8745-11b362079937,6884e482-e1fe-40b6-ac9a-22d790dd9e0e,6a7cdcd3-b4de-4bad-923a-b0b080876fd7,6edea6c6-b8ad-45d6-bee9-928a8c599e30,706dd907-3b96-4ad7-84a4-f5ac91ebd68c,7df6a123-7093-4950-a86e-1499441857a0,88a386cc-522e-4555-b93f-fbe9a6355de5,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,95ed56a5-d085-4210-8995-f818da5d8485,a202cb0f-ce05-4981-b2e6-311f24ddaf47,a2203363-d9e1-444b-be38-818252f51e61,c7649266-200e-49b2-bb1b-7632d49cbbb8,cadcaccf-9361-417d-abb8-4096c81b1ac8,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    0,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 14:43:58.650366',
    '2022-05-24 17:02:47.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    78,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '008580ca-2563-4a99-a368-7717549dd0b1,06e7292a-6a32-4179-ae74-a477f5fe2f5f,13183e4a-be4d-432c-96f5-3b603e6b6cd9,3f3c9e66-e7b8-4ea8-bd46-96dd0de6d318,47d16810-bea3-4a48-b1b5-33fb23b34156,4c568150-4bd3-4489-bab7-87db49241ff6,5045215b-f750-44fd-83ef-f9af59a3fc1e,581ffd6a-7de6-40a9-8745-11b362079937,6884e482-e1fe-40b6-ac9a-22d790dd9e0e,6a7cdcd3-b4de-4bad-923a-b0b080876fd7,6edea6c6-b8ad-45d6-bee9-928a8c599e30,706dd907-3b96-4ad7-84a4-f5ac91ebd68c,7df6a123-7093-4950-a86e-1499441857a0,88a386cc-522e-4555-b93f-fbe9a6355de5,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,95ed56a5-d085-4210-8995-f818da5d8485,a202cb0f-ce05-4981-b2e6-311f24ddaf47,a2203363-d9e1-444b-be38-818252f51e61,c7649266-200e-49b2-bb1b-7632d49cbbb8,cadcaccf-9361-417d-abb8-4096c81b1ac8,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    0,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 14:43:59.974897',
    '2022-05-24 17:02:47.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    79,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '008580ca-2563-4a99-a368-7717549dd0b1,06e7292a-6a32-4179-ae74-a477f5fe2f5f,13183e4a-be4d-432c-96f5-3b603e6b6cd9,3f3c9e66-e7b8-4ea8-bd46-96dd0de6d318,47d16810-bea3-4a48-b1b5-33fb23b34156,4c568150-4bd3-4489-bab7-87db49241ff6,5045215b-f750-44fd-83ef-f9af59a3fc1e,581ffd6a-7de6-40a9-8745-11b362079937,6884e482-e1fe-40b6-ac9a-22d790dd9e0e,6a7cdcd3-b4de-4bad-923a-b0b080876fd7,6edea6c6-b8ad-45d6-bee9-928a8c599e30,706dd907-3b96-4ad7-84a4-f5ac91ebd68c,7df6a123-7093-4950-a86e-1499441857a0,88a386cc-522e-4555-b93f-fbe9a6355de5,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,95ed56a5-d085-4210-8995-f818da5d8485,a202cb0f-ce05-4981-b2e6-311f24ddaf47,a2203363-d9e1-444b-be38-818252f51e61,c7649266-200e-49b2-bb1b-7632d49cbbb8,cadcaccf-9361-417d-abb8-4096c81b1ac8,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    0,
    '',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 14:51:57.006698',
    '2022-05-24 17:02:47.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    80,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '008580ca-2563-4a99-a368-7717549dd0b1,06e7292a-6a32-4179-ae74-a477f5fe2f5f,13183e4a-be4d-432c-96f5-3b603e6b6cd9,3f3c9e66-e7b8-4ea8-bd46-96dd0de6d318,47d16810-bea3-4a48-b1b5-33fb23b34156,4c568150-4bd3-4489-bab7-87db49241ff6,5045215b-f750-44fd-83ef-f9af59a3fc1e,581ffd6a-7de6-40a9-8745-11b362079937,6884e482-e1fe-40b6-ac9a-22d790dd9e0e,6a7cdcd3-b4de-4bad-923a-b0b080876fd7,6edea6c6-b8ad-45d6-bee9-928a8c599e30,706dd907-3b96-4ad7-84a4-f5ac91ebd68c,7df6a123-7093-4950-a86e-1499441857a0,88a386cc-522e-4555-b93f-fbe9a6355de5,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,95ed56a5-d085-4210-8995-f818da5d8485,a202cb0f-ce05-4981-b2e6-311f24ddaf47,a2203363-d9e1-444b-be38-818252f51e61,c7649266-200e-49b2-bb1b-7632d49cbbb8,cadcaccf-9361-417d-abb8-4096c81b1ac8,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    0,
    '',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 14:51:58.831940',
    '2022-05-24 17:02:47.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    81,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '008580ca-2563-4a99-a368-7717549dd0b1,06e7292a-6a32-4179-ae74-a477f5fe2f5f,13183e4a-be4d-432c-96f5-3b603e6b6cd9,3f3c9e66-e7b8-4ea8-bd46-96dd0de6d318,47d16810-bea3-4a48-b1b5-33fb23b34156,4c568150-4bd3-4489-bab7-87db49241ff6,5045215b-f750-44fd-83ef-f9af59a3fc1e,581ffd6a-7de6-40a9-8745-11b362079937,6884e482-e1fe-40b6-ac9a-22d790dd9e0e,6a7cdcd3-b4de-4bad-923a-b0b080876fd7,6edea6c6-b8ad-45d6-bee9-928a8c599e30,706dd907-3b96-4ad7-84a4-f5ac91ebd68c,7df6a123-7093-4950-a86e-1499441857a0,88a386cc-522e-4555-b93f-fbe9a6355de5,951c7937-5d94-4b0b-8fe9-4deccdb7e0af,95ed56a5-d085-4210-8995-f818da5d8485,a202cb0f-ce05-4981-b2e6-311f24ddaf47,a2203363-d9e1-444b-be38-818252f51e61,c7649266-200e-49b2-bb1b-7632d49cbbb8,cadcaccf-9361-417d-abb8-4096c81b1ac8,e604ead9-2bf0-415a-a63b-be393e533e43',
    'test',
    'Hello Test',
    1,
    NULL,
    0,
    '',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 14:52:00.058836',
    '2022-05-24 17:02:55.000000',
    NULL,
    NULL
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    82,
    NULL,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    'adasdasd',
    'Your request has been sent to admin',
    NULL,
    NULL,
    0,
    '',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 16:37:37.437861',
    '2022-05-24 17:02:55.000000',
    NULL,
    'Mr/Ms Sarang Test try to contact you.'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    83,
    NULL,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    'adasdasd',
    'Your request has been sent to admin',
    NULL,
    NULL,
    0,
    '',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 16:37:37.483200',
    '2022-05-24 17:02:55.000000',
    NULL,
    'Mr/Ms Sarang Test try to contact you.'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    84,
    NULL,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    'fasfas',
    'Your request has been sent to admin',
    NULL,
    NULL,
    0,
    '',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 16:38:37.837301',
    '2022-05-24 17:02:55.000000',
    NULL,
    'Mr/Ms Sarang Test try to contact you.'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    85,
    NULL,
    '0d8caf5c-6593-4c26-bff1-b2dadd12ef3d',
    'Membership Home Lite added successfully',
    'Membership Home Lite added successfully',
    1,
    NULL,
    0,
    '',
    '',
    '2022-05-26 17:50:27.986516',
    '2022-05-26 17:50:27.986516',
    NULL,
    'test10 purchase plan Home Lite in 5'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    86,
    NULL,
    '4146a641-3e5a-4448-a7d0-15f302771426',
    'Name ',
    'Your request has been sent to admin',
    NULL,
    NULL,
    0,
    '4146a641-3e5a-4448-a7d0-15f302771426',
    '',
    '2022-05-27 16:05:43.284780',
    '2022-05-27 16:19:01.000000',
    NULL,
    'Mr/Ms Bhoomi try to contact you.'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    87,
    NULL,
    '4146a641-3e5a-4448-a7d0-15f302771426',
    'Propane brother ',
    'Your request has been sent to admin',
    NULL,
    NULL,
    0,
    '4146a641-3e5a-4448-a7d0-15f302771426',
    '',
    '2022-05-27 16:17:42.980932',
    '2022-05-27 16:19:01.000000',
    NULL,
    'Mr/Ms Bhoomi try to contact you.'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    88,
    NULL,
    '4146a641-3e5a-4448-a7d0-15f302771426',
    'Hello',
    'Your request has been sent to admin',
    NULL,
    NULL,
    0,
    '4146a641-3e5a-4448-a7d0-15f302771426',
    '',
    '2022-05-27 16:37:24.522856',
    '2022-05-27 18:52:39.000000',
    NULL,
    'Mr/Ms Bhoomi try to contact you.'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    89,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '',
    'Order Placed',
    'Order is Placed by Asgar',
    1,
    NULL,
    0,
    '',
    '',
    '2022-05-31 16:09:14.478620',
    '2022-05-31 16:09:14.478620',
    NULL,
    'Order is Placed by Asgar'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    90,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '',
    'Order Placed',
    'Order is Placed by Asgar',
    1,
    NULL,
    0,
    '',
    '',
    '2022-05-31 16:15:37.245036',
    '2022-05-31 16:15:37.245036',
    NULL,
    'Order is Placed by Asgar'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    91,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '',
    'Order Placed',
    'Order is Placed by Asgar',
    1,
    NULL,
    0,
    '',
    '',
    '2022-05-31 16:18:44.897649',
    '2022-05-31 16:18:44.897649',
    NULL,
    'Order is Placed by Asgar'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    92,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '',
    'Order Placed',
    'Order is Placed by Asgar',
    1,
    NULL,
    0,
    '',
    '',
    '2022-05-31 16:43:26.103590',
    '2022-05-31 16:43:26.103590',
    NULL,
    'Order is Placed by Asgar'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    93,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '',
    'Order Placed',
    'Order is Placed by Asgar',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-01 11:52:20.067297',
    '2022-06-01 11:52:20.067297',
    NULL,
    'Order is Placed by Asgar'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    94,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Fri Jun 03 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-01 16:56:13.258155',
    '2022-06-01 16:56:13.258155',
    NULL,
    'test user 2 order is rescheduled by admin on this Fri Jun 03 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    95,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Thu Jun 02 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-01 16:58:08.489408',
    '2022-06-01 16:58:08.489408',
    NULL,
    'test user 2 order is rescheduled by admin on this Thu Jun 02 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    96,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Fri Jun 03 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-01 16:58:34.238308',
    '2022-06-01 16:58:34.238308',
    NULL,
    'test user 2 order is rescheduled by admin on this Fri Jun 03 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    97,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Wed Jun 08 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-01 16:59:47.324712',
    '2022-06-01 16:59:47.324712',
    NULL,
    'test user 2 order is rescheduled by admin on this Wed Jun 08 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    98,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Wed Jun 08 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-01 17:00:15.880463',
    '2022-06-01 17:00:15.880463',
    NULL,
    'test user 2 order is rescheduled by admin on this Wed Jun 08 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    99,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-01 17:01:13.183843',
    '2022-06-01 17:01:13.183843',
    NULL,
    'test user 2 order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    100,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-01 17:14:25.755150',
    '2022-06-01 17:14:25.755150',
    NULL,
    'test user 2 order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    101,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Thu Jun 02 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-01 17:16:49.350952',
    '2022-06-01 17:16:49.350952',
    NULL,
    'test user 2 order is rescheduled by admin on this Thu Jun 02 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    102,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Fri Jun 03 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-01 17:18:43.839539',
    '2022-06-01 17:18:43.839539',
    NULL,
    'test user 2 order is rescheduled by admin on this Fri Jun 03 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    103,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Thu Jun 02 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-01 17:19:04.992259',
    '2022-06-01 17:19:04.992259',
    NULL,
    'test user 2 order is rescheduled by admin on this Thu Jun 02 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    104,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Thu Jun 09 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-01 17:20:30.133836',
    '2022-06-01 17:20:30.133836',
    NULL,
    'test user 2 order is rescheduled by admin on this Thu Jun 09 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    105,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-01 17:21:02.341610',
    '2022-06-01 17:21:02.341610',
    NULL,
    'test user 2 order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    106,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Fri Jun 03 2022 12:00:00 GMT+0530 (India Standard Time) & 11:00:00 to 12:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-01 17:22:17.378706',
    '2022-06-01 17:22:17.378706',
    NULL,
    'test user 2 order is rescheduled by admin on this Fri Jun 03 2022 12:00:00 GMT+0530 (India Standard Time) & 11:00:00 to 12:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    107,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Thu Jun 16 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-01 17:28:59.457032',
    '2022-06-01 17:28:59.457032',
    NULL,
    'test user 2 order is rescheduled by admin on this Thu Jun 16 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    108,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Thu Jun 02 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-01 17:31:34.103387',
    '2022-06-01 17:31:34.103387',
    NULL,
    'test user 2 order is rescheduled by admin on this Thu Jun 02 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    109,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-01 17:32:29.071903',
    '2022-06-01 17:32:29.071903',
    NULL,
    'test user 2 order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    110,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Wed Jun 15 2022 12:00:00 GMT+0530 (India Standard Time) & 11:00:00 to 12:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-01 17:35:43.050707',
    '2022-06-01 17:35:43.050707',
    NULL,
    'test user 2 order is rescheduled by admin on this Wed Jun 15 2022 12:00:00 GMT+0530 (India Standard Time) & 11:00:00 to 12:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    111,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-01 17:35:58.594821',
    '2022-06-01 17:35:58.594821',
    NULL,
    'test user 2 order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    112,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Thu Jun 02 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-01 17:39:57.111510',
    '2022-06-01 17:39:57.111510',
    NULL,
    'test user 2 order is rescheduled by admin on this Thu Jun 02 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    113,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-01 17:40:14.956795',
    '2022-06-01 17:40:14.956795',
    NULL,
    'test user 2 order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    114,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Thu Jun 09 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-02 18:51:42.850177',
    '2022-06-02 18:51:42.850177',
    NULL,
    'test user 2 order is rescheduled by admin on this Thu Jun 09 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    115,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Wed Jun 15 2022 12:00:00 GMT+0530 (India Standard Time) & 14:00:00 to 15:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-02 18:53:47.266481',
    '2022-06-02 18:53:47.266481',
    NULL,
    'test user 2 order is rescheduled by admin on this Wed Jun 15 2022 12:00:00 GMT+0530 (India Standard Time) & 14:00:00 to 15:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    116,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-02 19:06:15.057960',
    '2022-06-02 19:06:15.057960',
    NULL,
    'test user 2 order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    117,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Fri Jun 03 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 10:33:20.304944',
    '2022-06-03 10:33:20.304944',
    NULL,
    'test user 2 order is rescheduled by admin on this Fri Jun 03 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    118,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Thu Jun 09 2022 12:00:00 GMT+0530 (India Standard Time) & 11:00:00 to 12:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 10:34:57.559560',
    '2022-06-03 10:34:57.559560',
    NULL,
    'test user 2 order is rescheduled by admin on this Thu Jun 09 2022 12:00:00 GMT+0530 (India Standard Time) & 11:00:00 to 12:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    119,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 11:00:00 to 12:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 10:35:29.778029',
    '2022-06-03 10:35:29.778029',
    NULL,
    'test user 2 order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 11:00:00 to 12:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    120,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Wed Jun 08 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 10:36:30.992336',
    '2022-06-03 10:36:30.992336',
    NULL,
    'test user 2 order is rescheduled by admin on this Wed Jun 08 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    121,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Tue Jun 07 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 10:36:47.252698',
    '2022-06-03 10:36:47.252698',
    NULL,
    'test user 2 order is rescheduled by admin on this Tue Jun 07 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    122,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Thu Jun 09 2022 12:00:00 GMT+0530 (India Standard Time) & 11:00:00 to 12:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 10:39:11.313373',
    '2022-06-03 10:39:11.313373',
    NULL,
    'test user 2 order is rescheduled by admin on this Thu Jun 09 2022 12:00:00 GMT+0530 (India Standard Time) & 11:00:00 to 12:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    123,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 10:40:40.866589',
    '2022-06-03 10:40:40.866589',
    NULL,
    'test user 2 order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    124,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 10:41:58.596273',
    '2022-06-03 10:41:58.596273',
    NULL,
    'test user 2 order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    125,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Wed Jun 08 2022 12:00:00 GMT+0530 (India Standard Time) & 11:00:00 to 12:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 10:53:49.213229',
    '2022-06-03 10:53:49.213229',
    NULL,
    'test user 2 order is rescheduled by admin on this Wed Jun 08 2022 12:00:00 GMT+0530 (India Standard Time) & 11:00:00 to 12:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    126,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Fri Jun 17 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 11:02:32.931452',
    '2022-06-03 11:02:32.931452',
    NULL,
    'test user 2 order is rescheduled by admin on this Fri Jun 17 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    127,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Wed Jun 08 2022 12:00:00 GMT+0530 (India Standard Time) & 11:00:00 to 12:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 11:07:00.935141',
    '2022-06-03 11:07:00.935141',
    NULL,
    'test user 2 order is rescheduled by admin on this Wed Jun 08 2022 12:00:00 GMT+0530 (India Standard Time) & 11:00:00 to 12:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    128,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Fri Jun 03 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 11:11:05.608942',
    '2022-06-03 11:11:05.608942',
    NULL,
    'test user 2 order is rescheduled by admin on this Fri Jun 03 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    129,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Thu Jun 16 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 11:11:46.972685',
    '2022-06-03 11:11:46.972685',
    NULL,
    'test user 2 order is rescheduled by admin on this Thu Jun 16 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    130,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Sat Jun 04 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 11:12:33.080821',
    '2022-06-03 11:12:33.080821',
    NULL,
    'test user 2 order is rescheduled by admin on this Sat Jun 04 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    131,
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    'Membership test added successfully',
    'Membership test added successfully',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 12:33:32.709965',
    '2022-06-03 12:33:32.709965',
    NULL,
    'Asgar purchase plan test in 10'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    132,
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    'Membership Home Pro added successfully',
    'Membership Home Pro added successfully',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 12:36:58.965393',
    '2022-06-03 12:36:58.965393',
    NULL,
    'Asgar purchase plan Home Pro in 5'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    133,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Mon Jun 06 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 13:19:59.028703',
    '2022-06-03 13:19:59.028703',
    NULL,
    'test user 2 order is rescheduled by admin on this Mon Jun 06 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    134,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Sat Jun 04 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 13:25:46.764837',
    '2022-06-03 13:25:46.764837',
    NULL,
    'test user 2 order is rescheduled by admin on this Sat Jun 04 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    135,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Sat Jun 04 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 14:57:24.586542',
    '2022-06-03 14:57:24.586542',
    NULL,
    'test user 2 order is rescheduled by admin on this Sat Jun 04 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    136,
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Wed Jun 08 2022 12:00:00 GMT+0530 (India Standard Time) & 11:00:00 to 12:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 15:22:39.796023',
    '2022-06-03 15:22:39.796023',
    NULL,
    'Asgar order is rescheduled by admin on this Wed Jun 08 2022 12:00:00 GMT+0530 (India Standard Time) & 11:00:00 to 12:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    137,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Tue Jun 07 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 15:32:32.062253',
    '2022-06-03 15:32:32.062253',
    NULL,
    'test user 2 order is rescheduled by admin on this Tue Jun 07 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    138,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '',
    'Order Placed',
    'Order is placed by Asgar',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 16:55:09.860429',
    '2022-06-03 16:55:09.860429',
    NULL,
    'Order is placed by Asgar'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    139,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Sat Jun 04 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 17:25:36.479322',
    '2022-06-03 17:25:36.479322',
    NULL,
    'test user 2 order is rescheduled by admin on this Sat Jun 04 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    140,
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 11:00:00 to 12:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-03 17:37:27.028143',
    '2022-06-03 17:37:27.028143',
    NULL,
    'Asgar order is rescheduled by admin on this Fri Jun 10 2022 12:00:00 GMT+0530 (India Standard Time) & 11:00:00 to 12:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    141,
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Thu Jun 16 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-07 12:14:46.194183',
    '2022-06-07 12:14:46.194183',
    NULL,
    'Asgar order is rescheduled by admin on this Thu Jun 16 2022 12:00:00 GMT+0530 (India Standard Time) & 12:00:00 to 13:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    142,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '',
    'Order Placed',
    'Order is placed by Asgar',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-07 13:16:48.803868',
    '2022-06-07 13:16:48.803868',
    NULL,
    'Order is placed by Asgar'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    143,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '',
    'Order Placed',
    'Order is placed by Asgar',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-07 13:37:40.714042',
    '2022-06-07 13:37:40.714042',
    NULL,
    'Order is placed by Asgar'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    144,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '',
    'Order Placed',
    'Order is placed by Asgar',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-07 14:04:05.193802',
    '2022-06-07 14:04:05.193802',
    NULL,
    'Order is placed by Asgar'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    145,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '',
    'Order Placed',
    'Order is placed by Asgar',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-07 14:30:34.119571',
    '2022-06-07 14:30:34.119571',
    NULL,
    'Order is placed by Asgar'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    146,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '',
    'Order Placed',
    'Order is placed by Asgar',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-07 15:23:37.374919',
    '2022-06-07 15:23:37.374919',
    NULL,
    'Order is placed by Asgar'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    147,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '',
    'Order Placed',
    'Order is placed by Asgar',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-07 15:29:25.236148',
    '2022-06-07 15:29:25.236148',
    NULL,
    'Order is placed by Asgar'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    148,
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Fri Jun 24 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-08 12:33:23.360276',
    '2022-06-08 12:33:23.360276',
    NULL,
    'Asgar order is rescheduled by admin on this Fri Jun 24 2022 12:00:00 GMT+0530 (India Standard Time) & 13:00:00 to 14:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    149,
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Tue Jun 28 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-08 12:34:10.569957',
    '2022-06-08 12:34:10.569957',
    NULL,
    'Asgar order is rescheduled by admin on this Tue Jun 28 2022 12:00:00 GMT+0530 (India Standard Time) & 10:00:00 to 11:00:00'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    150,
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    '',
    'Order Placed',
    'Order is placed by test',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-08 12:48:20.573506',
    '2022-06-08 12:48:20.573506',
    NULL,
    'Order is placed by test'
  );
INSERT INTO
  `notification` (
    `id`,
    `from_id`,
    `to_ids`,
    `title`,
    `description`,
    `notification_type`,
    `to_user_type`,
    `is_admin`,
    `deleted_by`,
    `readed_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `admin_message`
  )
VALUES
  (
    151,
    NULL,
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    'Rescheduled Order',
    'Your order is rescheduled by admin on this Wed Jun 22 2022 12:00:00 GMT+0530 (India Standard Time) & 11:00:00 to 12:00:00',
    1,
    NULL,
    0,
    '',
    '',
    '2022-06-08 13:07:55.511022',
    '2022-06-08 13:07:55.511022',
    NULL,
    'test order is rescheduled by admin on this Wed Jun 22 2022 12:00:00 GMT+0530 (India Standard Time) & 11:00:00 to 12:00:00'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: order_details
# ------------------------------------------------------------

INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    17,
    1,
    NULL,
    NULL,
    350,
    310.5,
    0,
    '2022-05-07 14:42:44',
    10,
    30,
    279.45,
    31.05,
    295.5,
    NULL,
    45,
    157.5,
    0,
    0,
    10,
    NULL,
    0,
    94.5,
    27,
    '2022-05-04 15:50:25.844887',
    '2022-06-02 17:07:18.572513',
    NULL,
    NULL,
    NULL,
    11,
    1,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '709fcb88-92a1-4b01-aca0-bb8223bdf9b3',
    3,
    NULL,
    1,
    NULL,
    NULL,
    NULL,
    'delivered',
    NULL,
    20,
    20,
    15,
    '10:00:00',
    '11:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    18,
    1,
    NULL,
    NULL,
    100,
    135,
    0,
    '2022-06-03 12:00:00',
    0,
    0,
    128.25,
    6.75,
    120,
    'test cancel10',
    45,
    0,
    10,
    20,
    5,
    NULL,
    0,
    0,
    0,
    '2022-05-04 15:50:25.924124',
    '2022-06-07 15:24:56.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    11,
    NULL,
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    '951c7937-5d94-4b0b-8fe9-4deccdb7e0af',
    4,
    2,
    3,
    NULL,
    NULL,
    1,
    'cancelled_by_admin',
    NULL,
    20,
    20,
    15,
    '12:00:00',
    '13:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    19,
    1,
    NULL,
    NULL,
    350,
    310.5,
    0,
    '2022-06-06 12:00:00',
    10,
    30,
    279.45,
    31.05,
    295.5,
    'cancel test',
    45,
    157.5,
    0,
    0,
    10,
    NULL,
    0,
    94.5,
    27,
    '2022-05-04 15:50:53.622758',
    '2022-06-06 19:18:33.672857',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    12,
    1,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '447d9dce-fe91-4cd9-85ee-452d67324ef6',
    3,
    NULL,
    1,
    NULL,
    NULL,
    NULL,
    'ongoing',
    NULL,
    20,
    20,
    15,
    '13:00:00',
    '14:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    20,
    2,
    NULL,
    NULL,
    100,
    135,
    0,
    '2022-06-07 12:00:00',
    0,
    0,
    128.25,
    6.75,
    120,
    'cancel test',
    45,
    0,
    10,
    20,
    5,
    NULL,
    0,
    0,
    0,
    '2022-05-04 15:50:53.641519',
    '2022-06-06 19:25:10.756430',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    12,
    NULL,
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    '951c7937-5d94-4b0b-8fe9-4deccdb7e0af',
    4,
    2,
    3,
    NULL,
    NULL,
    NULL,
    'ongoing',
    NULL,
    20,
    20,
    15,
    '10:00:00',
    '11:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    21,
    2,
    NULL,
    NULL,
    100,
    135,
    0,
    '2022-06-07 14:42:44',
    0,
    0,
    128.25,
    6.75,
    120,
    NULL,
    45,
    0,
    10,
    20,
    5,
    NULL,
    0,
    0,
    0,
    '2022-05-10 17:57:09.520987',
    '2022-06-06 19:24:57.234794',
    NULL,
    NULL,
    NULL,
    11,
    NULL,
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    '951c7937-5d94-4b0b-8fe9-4deccdb7e0af',
    4,
    2,
    3,
    NULL,
    NULL,
    NULL,
    'delivered',
    NULL,
    20,
    20,
    15,
    '11:00:00',
    '13:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    22,
    2,
    NULL,
    NULL,
    100,
    125,
    0,
    '2022-06-06 12:00:00',
    10,
    0,
    112.5,
    12.5,
    110,
    NULL,
    45,
    45,
    0,
    0,
    5,
    NULL,
    0,
    0,
    0,
    '2022-05-31 16:09:14.273200',
    '2022-06-06 19:18:33.683715',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    13,
    1,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '709fcb88-92a1-4b01-aca0-bb8223bdf9b3',
    3,
    NULL,
    3,
    NULL,
    NULL,
    NULL,
    'ongoing',
    NULL,
    20,
    20,
    15,
    '11:00:00',
    '12:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    23,
    1,
    NULL,
    NULL,
    450,
    381.5,
    0,
    '2022-05-30 13:43:00',
    10,
    0,
    343.35,
    38.15,
    381.5,
    NULL,
    45,
    0,
    10,
    0,
    50,
    NULL,
    0,
    103.5,
    23,
    '2022-05-31 16:09:14.319549',
    '2022-06-03 11:18:36.000000',
    NULL,
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    13,
    2,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '709fcb88-92a1-4b01-aca0-bb8223bdf9b3',
    4,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'cancelled',
    NULL,
    20,
    0,
    0,
    '13:00:00',
    '14:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    24,
    1,
    NULL,
    NULL,
    9780,
    9835,
    0,
    '2022-06-28 12:00:00',
    123,
    20,
    8851.5,
    983.5,
    9835,
    NULL,
    45,
    4401,
    10,
    0,
    120,
    NULL,
    0,
    0,
    0,
    '2022-05-31 16:09:14.328527',
    '2022-06-08 12:34:10.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    13,
    3,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '951c7937-5d94-4b0b-8fe9-4deccdb7e0af',
    4,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'rescheduled',
    NULL,
    20,
    0,
    0,
    '10:00:00',
    '11:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    25,
    1,
    NULL,
    NULL,
    595967.5,
    596052.5,
    0,
    '2022-06-24 12:00:00',
    123,
    50,
    536447.25,
    59605.25,
    596052.5,
    NULL,
    45,
    268185.375,
    10,
    0,
    5345,
    NULL,
    0,
    0,
    0,
    '2022-05-31 16:09:14.337456',
    '2022-06-08 12:33:23.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    13,
    3,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '447d9dce-fe91-4cd9-85ee-452d67324ef6',
    4,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'rescheduled',
    NULL,
    20,
    0,
    0,
    '13:00:00',
    '14:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    26,
    1,
    NULL,
    NULL,
    71.5,
    116.5,
    0,
    '2022-06-01 00:00:00',
    123,
    10,
    104.85,
    11.65,
    116.5,
    NULL,
    45,
    32.175,
    10,
    0,
    1,
    NULL,
    0,
    0,
    0,
    '2022-05-31 16:15:37.192642',
    '2022-06-06 18:09:30.466001',
    NULL,
    NULL,
    NULL,
    14,
    3,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '709fcb88-92a1-4b01-aca0-bb8223bdf9b3',
    4,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'pending',
    NULL,
    20,
    0,
    0,
    '10:00:00',
    '11:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    27,
    1,
    NULL,
    NULL,
    143,
    188,
    0,
    '2022-06-01 00:00:00',
    123,
    10,
    178.6,
    9.4,
    188,
    'test',
    45,
    64.35,
    10,
    0,
    2,
    NULL,
    0,
    0,
    0,
    '2022-05-31 16:18:44.842770',
    '2022-06-09 18:36:11.000000',
    NULL,
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    15,
    3,
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    '951c7937-5d94-4b0b-8fe9-4deccdb7e0af',
    4,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'cancelled_by_admin',
    NULL,
    20,
    0,
    0,
    '14:00:00',
    '15:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    28,
    1,
    NULL,
    NULL,
    143,
    188,
    0,
    '2022-06-01 00:00:00',
    123,
    10,
    178.6,
    9.4,
    188,
    NULL,
    45,
    64.35,
    10,
    0,
    2,
    NULL,
    0,
    0,
    0,
    '2022-05-31 16:43:26.030559',
    '2022-06-06 18:09:30.478674',
    NULL,
    NULL,
    NULL,
    16,
    3,
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    '447d9dce-fe91-4cd9-85ee-452d67324ef6',
    4,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'pending',
    NULL,
    20,
    0,
    0,
    '10:00:00',
    '11:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    29,
    1,
    NULL,
    NULL,
    715,
    760,
    0,
    '2022-06-01 00:00:00',
    123,
    10,
    722,
    38,
    760,
    NULL,
    45,
    321.75,
    10,
    0,
    10,
    NULL,
    0,
    0,
    0,
    '2022-06-01 11:52:19.942870',
    '2022-06-06 18:09:30.482333',
    NULL,
    NULL,
    NULL,
    17,
    3,
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    '709fcb88-92a1-4b01-aca0-bb8223bdf9b3',
    4,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'pending',
    NULL,
    20,
    0,
    0,
    '10:00:00',
    '11:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    30,
    2,
    NULL,
    NULL,
    0,
    35,
    0,
    '2022-06-01 11:26:59',
    0,
    0,
    31.5,
    3.5,
    20,
    NULL,
    45,
    0,
    10,
    0,
    2,
    NULL,
    0,
    0,
    0,
    '2022-06-01 11:52:19.963988',
    '2022-06-06 18:09:30.484665',
    NULL,
    NULL,
    NULL,
    17,
    NULL,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '447d9dce-fe91-4cd9-85ee-452d67324ef6',
    4,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'pending',
    NULL,
    20,
    20,
    15,
    '11:00:00',
    '12:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    31,
    1,
    NULL,
    NULL,
    357.5,
    392.5,
    0,
    '2022-06-04 00:00:00',
    123,
    10,
    353.25,
    39.25,
    392.5,
    NULL,
    45,
    160.875,
    0,
    0,
    5,
    NULL,
    0,
    0,
    0,
    '2022-06-03 16:55:09.712202',
    '2022-06-06 12:55:44.121029',
    NULL,
    NULL,
    NULL,
    18,
    3,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '951c7937-5d94-4b0b-8fe9-4deccdb7e0af',
    3,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'pending',
    NULL,
    20,
    0,
    0,
    '10:00:00',
    '11:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    32,
    1,
    NULL,
    NULL,
    715,
    760,
    0,
    '2022-06-08 00:00:00',
    123,
    10,
    684,
    76,
    760,
    NULL,
    45,
    321.75,
    10,
    0,
    10,
    NULL,
    0,
    0,
    0,
    '2022-06-07 13:16:48.691744',
    '2022-06-07 13:16:48.691744',
    NULL,
    NULL,
    NULL,
    19,
    3,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    NULL,
    4,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'pending',
    NULL,
    20,
    0,
    0,
    '10:00:00',
    '11:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    33,
    1,
    NULL,
    NULL,
    143,
    188,
    0,
    '2022-06-08 00:00:00',
    123,
    10,
    169.2,
    18.8,
    188,
    NULL,
    45,
    64.35,
    10,
    0,
    2,
    NULL,
    0,
    0,
    0,
    '2022-06-07 13:37:40.626544',
    '2022-06-07 13:37:40.626544',
    NULL,
    NULL,
    NULL,
    20,
    3,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    NULL,
    4,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'pending',
    NULL,
    20,
    0,
    0,
    '11:00:00',
    '12:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    34,
    1,
    NULL,
    NULL,
    71.5,
    116.5,
    0,
    '2022-06-08 00:00:00',
    123,
    10,
    104.85,
    11.65,
    116.5,
    NULL,
    45,
    32.175,
    10,
    0,
    1,
    NULL,
    0,
    0,
    0,
    '2022-06-07 14:04:05.150476',
    '2022-06-07 14:04:05.150476',
    NULL,
    NULL,
    NULL,
    21,
    3,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    NULL,
    4,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'pending',
    NULL,
    20,
    0,
    0,
    '10:00:00',
    '11:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    35,
    1,
    NULL,
    NULL,
    40,
    76,
    0,
    '2022-06-11 00:00:00',
    10,
    11,
    72.2,
    3.8,
    76,
    NULL,
    45,
    18,
    0,
    0,
    2,
    NULL,
    0,
    0,
    0,
    '2022-06-07 14:30:34.079881',
    '2022-06-07 14:30:34.079881',
    NULL,
    NULL,
    NULL,
    22,
    2,
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    NULL,
    3,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'pending',
    NULL,
    20,
    0,
    0,
    '13:00:00',
    '14:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    36,
    2,
    NULL,
    NULL,
    91.5,
    126.5,
    0,
    '2022-06-08 00:00:00',
    123,
    10,
    120.175,
    6.325,
    111.5,
    NULL,
    45,
    41.175,
    0,
    0,
    1,
    NULL,
    0,
    0,
    0,
    '2022-06-07 15:23:37.317680',
    '2022-06-07 15:23:37.000000',
    NULL,
    NULL,
    NULL,
    23,
    3,
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    NULL,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'pending',
    NULL,
    20,
    20,
    15,
    '13:00:00',
    '14:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    37,
    2,
    NULL,
    NULL,
    91.5,
    126.5,
    0,
    '2022-06-08 00:00:00',
    123,
    10,
    120.175,
    6.325,
    111.5,
    NULL,
    45,
    41.175,
    0,
    0,
    1,
    NULL,
    0,
    0,
    0,
    '2022-06-07 15:29:25.187275',
    '2022-06-07 15:29:25.000000',
    NULL,
    NULL,
    NULL,
    24,
    3,
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    NULL,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'pending',
    NULL,
    20,
    20,
    15,
    '13:00:00',
    '14:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    38,
    2,
    NULL,
    NULL,
    91.5,
    126.5,
    0,
    '2022-06-08 00:00:00',
    123,
    10,
    120.175,
    6.325,
    111.5,
    NULL,
    45,
    41.175,
    0,
    0,
    1,
    NULL,
    0,
    0,
    0,
    '2022-06-08 12:48:20.305498',
    '2022-06-08 12:48:20.000000',
    NULL,
    NULL,
    NULL,
    25,
    3,
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    NULL,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'pending',
    NULL,
    20,
    20,
    15,
    '13:00:00',
    '14:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    39,
    2,
    NULL,
    NULL,
    91.5,
    126.5,
    0,
    '2022-06-22 12:00:00',
    123,
    10,
    113.85,
    12.65,
    111.5,
    NULL,
    45,
    41.175,
    0,
    0,
    1,
    NULL,
    0,
    0,
    0,
    '2022-06-08 12:48:20.331975',
    '2022-06-08 13:07:55.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    25,
    3,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    NULL,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'rescheduled',
    NULL,
    20,
    20,
    15,
    '11:00:00',
    '12:00:00'
  );
INSERT INTO
  `order_details` (
    `id`,
    `order_type`,
    `image_one`,
    `image_two`,
    `sub_total`,
    `grand_total`,
    `leakage_fee`,
    `schedule_date`,
    `index_price`,
    `vendor_delivery_fee`,
    `vendor_received_amount`,
    `admin_received_amount`,
    `refund_amount`,
    `cancellation_reason_other`,
    `sales_tax_percentage`,
    `sales_tax_amount`,
    `location_fee`,
    `cylindersize`,
    `qty`,
    `priority`,
    `is_delivered`,
    `promocode_discount_amount`,
    `promocode_discount_percentage`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `order_id`,
    `product_id`,
    `vendor_id`,
    `driver_id`,
    `location_id`,
    `cylinder_size_id`,
    `category_id`,
    `accessory_id`,
    `promocodes_id`,
    `cancellation_reason_id`,
    `status`,
    `general_delivery_fee`,
    `freelance_driver_received_amount`,
    `driver_cancellation_charge`,
    `customer_cancellation_charge`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    40,
    1,
    NULL,
    NULL,
    0,
    25,
    0,
    '2022-06-10 00:00:00',
    0,
    0,
    23.75,
    1.25,
    25,
    NULL,
    45,
    0,
    0,
    0,
    5,
    NULL,
    0,
    0,
    0,
    '2022-06-08 12:48:20.348448',
    '2022-06-08 12:48:20.348448',
    NULL,
    NULL,
    NULL,
    25,
    NULL,
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    NULL,
    3,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'pending',
    NULL,
    20,
    0,
    0,
    '10:00:00',
    '11:00:00'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: order_status_log
# ------------------------------------------------------------

INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    17,
    '2022-05-04 15:50:25.985762',
    '2022-05-04 15:50:25.985762',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    17,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    18,
    '2022-05-04 15:50:26.007611',
    '2022-05-04 15:50:26.007611',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    18,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    19,
    '2022-05-04 15:50:53.797043',
    '2022-05-04 15:50:53.797043',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    20,
    '2022-05-04 15:50:53.894961',
    '2022-06-07 17:02:01.346640',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    NULL,
    '08ecb71b-b437-4338-8154-fc65e4aedc1b',
    20,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    21,
    '2022-05-31 16:09:14.380213',
    '2022-05-31 16:09:14.380213',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    22,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    22,
    '2022-05-31 16:09:14.394418',
    '2022-05-31 16:09:14.394418',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    23,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    23,
    '2022-05-31 16:09:14.400922',
    '2022-05-31 16:09:14.400922',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    24,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    24,
    '2022-05-31 16:09:14.407494',
    '2022-05-31 16:09:14.407494',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    25,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    25,
    '2022-05-31 16:15:37.219325',
    '2022-05-31 16:15:37.219325',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    26,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    26,
    '2022-05-31 16:18:44.871568',
    '2022-05-31 16:18:44.871568',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    27,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    27,
    '2022-05-31 16:43:26.064590',
    '2022-05-31 16:43:26.064590',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    28,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    28,
    '2022-05-31 17:59:49.842617',
    '2022-05-31 17:59:49.842617',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    18,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    29,
    '2022-05-31 18:10:59.378216',
    '2022-05-31 18:10:59.378216',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    18,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    30,
    '2022-05-31 18:12:09.152487',
    '2022-05-31 18:12:09.152487',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    31,
    '2022-05-31 18:20:46.174162',
    '2022-05-31 18:20:46.174162',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    18,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    32,
    '2022-05-31 18:35:45.601278',
    '2022-05-31 18:35:45.601278',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    33,
    '2022-05-31 18:57:54.578601',
    '2022-05-31 18:57:54.578601',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    18,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    34,
    '2022-06-01 11:52:20.032602',
    '2022-06-01 11:52:20.032602',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    29,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    35,
    '2022-06-01 11:52:20.043548',
    '2022-06-01 11:52:20.043548',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    30,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    36,
    '2022-06-01 16:56:13.181847',
    '2022-06-01 16:56:13.181847',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    37,
    '2022-06-01 16:58:08.416542',
    '2022-06-01 16:58:08.416542',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    38,
    '2022-06-01 16:58:34.185926',
    '2022-06-01 16:58:34.185926',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    39,
    '2022-06-01 16:59:47.275309',
    '2022-06-01 16:59:47.275309',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    40,
    '2022-06-01 17:00:15.852111',
    '2022-06-01 17:00:15.852111',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    41,
    '2022-06-01 17:01:13.153456',
    '2022-06-01 17:01:13.153456',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    42,
    '2022-06-01 17:14:25.699766',
    '2022-06-01 17:14:25.699766',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    43,
    '2022-06-01 17:16:49.315113',
    '2022-06-01 17:16:49.315113',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    44,
    '2022-06-01 17:18:43.768161',
    '2022-06-01 17:18:43.768161',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    45,
    '2022-06-01 17:19:04.956595',
    '2022-06-01 17:19:04.956595',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    46,
    '2022-06-01 17:20:30.105249',
    '2022-06-01 17:20:30.105249',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    47,
    '2022-06-01 17:21:02.309434',
    '2022-06-01 17:21:02.309434',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    48,
    '2022-06-01 17:22:17.275409',
    '2022-06-01 17:22:17.275409',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    49,
    '2022-06-01 17:28:59.401417',
    '2022-06-01 17:28:59.401417',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    50,
    '2022-06-01 17:31:34.077550',
    '2022-06-01 17:31:34.077550',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    51,
    '2022-06-01 17:32:29.045889',
    '2022-06-07 17:02:07.501121',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '08ecb71b-b437-4338-8154-fc65e4aedc1b',
    20,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    52,
    '2022-06-01 17:35:43.019978',
    '2022-06-01 17:35:43.019978',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    53,
    '2022-06-01 17:35:58.567610',
    '2022-06-01 17:35:58.567610',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    18,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    54,
    '2022-06-01 17:39:57.059607',
    '2022-06-01 17:39:57.059607',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    55,
    '2022-06-01 17:40:14.909284',
    '2022-06-01 17:40:14.909284',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    20,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    56,
    '2022-06-01 17:47:38.090523',
    '2022-06-01 17:47:38.090523',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    57,
    '2022-06-01 17:49:54.443991',
    '2022-06-01 17:49:54.443991',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    18,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    58,
    '2022-06-02 18:50:18.979541',
    '2022-06-02 18:50:18.979541',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    18,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    59,
    '2022-06-02 18:51:42.792551',
    '2022-06-02 18:51:42.792551',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    60,
    '2022-06-02 18:52:05.920677',
    '2022-06-02 18:52:05.920677',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    61,
    '2022-06-02 18:53:47.231534',
    '2022-06-02 18:53:47.231534',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    20,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    62,
    '2022-06-02 19:06:15.013000',
    '2022-06-02 19:06:15.013000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    20,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    63,
    '2022-06-02 19:06:40.284032',
    '2022-06-02 19:06:40.284032',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    20,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    64,
    '2022-06-03 10:33:20.244125',
    '2022-06-03 10:33:20.244125',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    18,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    65,
    '2022-06-03 10:34:57.501731',
    '2022-06-03 10:34:57.501731',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    18,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    66,
    '2022-06-03 10:35:29.746429',
    '2022-06-03 10:35:29.746429',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    18,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    67,
    '2022-06-03 10:36:30.958994',
    '2022-06-03 10:36:30.958994',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    18,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    68,
    '2022-06-03 10:36:47.226063',
    '2022-06-03 10:36:47.226063',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    18,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    69,
    '2022-06-03 10:39:11.083365',
    '2022-06-03 10:39:11.083365',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    18,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    70,
    '2022-06-03 10:40:40.828240',
    '2022-06-03 10:40:40.828240',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    18,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    71,
    '2022-06-03 10:41:38.343173',
    '2022-06-03 10:41:38.343173',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    18,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    72,
    '2022-06-03 10:41:58.570318',
    '2022-06-03 10:41:58.570318',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    73,
    '2022-06-03 10:53:49.166684',
    '2022-06-03 10:53:49.166684',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    74,
    '2022-06-03 11:02:32.886801',
    '2022-06-03 11:02:32.886801',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    75,
    '2022-06-03 11:07:00.883039',
    '2022-06-03 11:07:00.883039',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    76,
    '2022-06-03 11:11:05.575436',
    '2022-06-03 11:11:05.575436',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    77,
    '2022-06-03 11:11:46.923788',
    '2022-06-03 11:11:46.923788',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    78,
    '2022-06-03 11:12:33.046135',
    '2022-06-03 11:12:33.046135',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    79,
    '2022-06-03 11:18:36.625317',
    '2022-06-03 11:18:36.625317',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    23,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    80,
    '2022-06-03 13:19:58.994249',
    '2022-06-03 13:19:58.994249',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    81,
    '2022-06-03 13:25:46.730340',
    '2022-06-03 13:25:46.730340',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    82,
    '2022-06-03 14:57:24.551614',
    '2022-06-03 14:57:24.551614',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    83,
    '2022-06-03 15:22:39.703474',
    '2022-06-03 15:22:39.703474',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    22,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    84,
    '2022-06-03 15:32:32.026169',
    '2022-06-03 15:32:32.026169',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    85,
    '2022-06-03 16:55:09.785928',
    '2022-06-03 16:55:09.785928',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    31,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    86,
    '2022-06-03 17:25:36.422383',
    '2022-06-03 17:25:36.422383',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    19,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    87,
    '2022-06-03 17:37:26.988478',
    '2022-06-03 17:37:26.988478',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    25,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    88,
    '2022-06-07 12:14:46.101544',
    '2022-06-07 12:14:46.101544',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    25,
    'ongoing'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    89,
    '2022-06-07 13:16:48.738230',
    '2022-06-07 13:16:48.738230',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    32,
    'pending'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    90,
    '2022-06-07 13:37:40.685222',
    '2022-06-07 13:37:40.685222',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    33,
    'pending'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    91,
    '2022-06-07 14:04:05.174673',
    '2022-06-07 14:04:05.174673',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    34,
    'pending'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    92,
    '2022-06-07 14:30:34.103043',
    '2022-06-07 14:30:34.103043',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    35,
    'pending'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    93,
    '2022-06-07 15:23:37.349079',
    '2022-06-07 15:23:37.349079',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    36,
    'pending'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    94,
    '2022-06-07 15:24:56.480716',
    '2022-06-07 15:24:56.480716',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    18,
    'cancelled_by_admin'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    95,
    '2022-06-07 15:29:25.218501',
    '2022-06-07 15:29:25.218501',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    37,
    'pending'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    96,
    '2022-06-08 12:33:23.304731',
    '2022-06-08 12:33:23.304731',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    25,
    'rescheduled'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    97,
    '2022-06-08 12:34:10.533963',
    '2022-06-08 12:34:10.533963',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    24,
    'rescheduled'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    98,
    '2022-06-08 12:48:20.458773',
    '2022-06-08 12:48:20.458773',
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    NULL,
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    38,
    'pending'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    99,
    '2022-06-08 12:48:20.473282',
    '2022-06-08 12:48:20.473282',
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    NULL,
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    39,
    'pending'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    100,
    '2022-06-08 12:48:20.482958',
    '2022-06-08 12:48:20.482958',
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    NULL,
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    40,
    'pending'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    101,
    '2022-06-08 13:07:55.473185',
    '2022-06-08 13:07:55.473185',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    39,
    'rescheduled'
  );
INSERT INTO
  `order_status_log` (
    `id`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `order_id`,
    `status`
  )
VALUES
  (
    102,
    '2022-06-09 18:36:11.081080',
    '2022-06-09 18:36:11.081080',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    27,
    'cancelled_by_admin'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: orders
# ------------------------------------------------------------

INSERT INTO
  `orders` (
    `id`,
    `uuid`,
    `invoiced_receipt_url`,
    `cancellation_reason_other`,
    `service_fee`,
    `grand_total`,
    `admin_total_delivery_fee`,
    `vendor_total_deliveryfee`,
    `payment_type`,
    `address`,
    `stripe_payment_intent_id`,
    `is_paid`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `time_slot_id`,
    `user_id`,
    `lat`,
    `long`,
    `user_address_id`,
    `service_charge`
  )
VALUES
  (
    11,
    'bc2f85d3-e542-42fe-b055-c1c527ed23ed',
    'https://pay.stripe.com/receipts/acct_1IbOxSSBJPMsjmRO/ch_3KvfJmSBJPMsjmRO1TEMPY8e/rcpt_LcvAdumCTXGXlLUN8p3kD8BbYhDPaPT',
    NULL,
    NULL,
    445.5,
    NULL,
    30,
    NULL,
    'tewtewgtewgtwatewtergegyerg',
    'pi_3KvfJmSBJPMsjmRO1NvSRfhN',
    1,
    '2022-05-04 15:50:25.794096',
    '2022-06-03 10:40:40.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    8,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `orders` (
    `id`,
    `uuid`,
    `invoiced_receipt_url`,
    `cancellation_reason_other`,
    `service_fee`,
    `grand_total`,
    `admin_total_delivery_fee`,
    `vendor_total_deliveryfee`,
    `payment_type`,
    `address`,
    `stripe_payment_intent_id`,
    `is_paid`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `time_slot_id`,
    `user_id`,
    `lat`,
    `long`,
    `user_address_id`,
    `service_charge`
  )
VALUES
  (
    12,
    '3dc72c2e-118e-41ea-b7a0-7fb05c024243',
    'https://pay.stripe.com/receipts/acct_1IbOxSSBJPMsjmRO/ch_3KvfKESBJPMsjmRO0yND9XQN/rcpt_LcvAP4UVkMiXf6JhX7C5iICDjnvOB2B',
    NULL,
    NULL,
    445.5,
    NULL,
    30,
    NULL,
    'tewtewgtewgtwatewtergegyerg',
    'pi_3KvfKESBJPMsjmRO0a8jFvYp',
    1,
    '2022-05-04 15:50:53.572518',
    '2022-06-03 17:25:36.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    9,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `orders` (
    `id`,
    `uuid`,
    `invoiced_receipt_url`,
    `cancellation_reason_other`,
    `service_fee`,
    `grand_total`,
    `admin_total_delivery_fee`,
    `vendor_total_deliveryfee`,
    `payment_type`,
    `address`,
    `stripe_payment_intent_id`,
    `is_paid`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `time_slot_id`,
    `user_id`,
    `lat`,
    `long`,
    `user_address_id`,
    `service_charge`
  )
VALUES
  (
    13,
    '2dfe2f36-a105-457f-ab2f-19abfb13208b',
    NULL,
    NULL,
    NULL,
    606394,
    NULL,
    70,
    NULL,
    'tewtewgtewgtwatewtergegyerg',
    NULL,
    0,
    '2022-05-31 16:09:14.245801',
    '2022-06-08 12:34:10.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    5,
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `orders` (
    `id`,
    `uuid`,
    `invoiced_receipt_url`,
    `cancellation_reason_other`,
    `service_fee`,
    `grand_total`,
    `admin_total_delivery_fee`,
    `vendor_total_deliveryfee`,
    `payment_type`,
    `address`,
    `stripe_payment_intent_id`,
    `is_paid`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `time_slot_id`,
    `user_id`,
    `lat`,
    `long`,
    `user_address_id`,
    `service_charge`
  )
VALUES
  (
    14,
    '54dd9e7e-e9a8-463d-9e35-4ce1f8c62940',
    NULL,
    NULL,
    NULL,
    116.5,
    NULL,
    10,
    NULL,
    'tewtewgtewgtwatewtergegyerg',
    NULL,
    0,
    '2022-05-31 16:15:37.179746',
    '2022-05-31 16:15:37.000000',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `orders` (
    `id`,
    `uuid`,
    `invoiced_receipt_url`,
    `cancellation_reason_other`,
    `service_fee`,
    `grand_total`,
    `admin_total_delivery_fee`,
    `vendor_total_deliveryfee`,
    `payment_type`,
    `address`,
    `stripe_payment_intent_id`,
    `is_paid`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `time_slot_id`,
    `user_id`,
    `lat`,
    `long`,
    `user_address_id`,
    `service_charge`
  )
VALUES
  (
    15,
    '69d77c35-740b-41f9-97e0-fe7bdfc2ab20',
    NULL,
    NULL,
    NULL,
    188,
    NULL,
    10,
    NULL,
    'tewtewgtewgtwatewtergegyerg',
    NULL,
    0,
    '2022-05-31 16:18:44.826510',
    '2022-05-31 16:18:44.000000',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `orders` (
    `id`,
    `uuid`,
    `invoiced_receipt_url`,
    `cancellation_reason_other`,
    `service_fee`,
    `grand_total`,
    `admin_total_delivery_fee`,
    `vendor_total_deliveryfee`,
    `payment_type`,
    `address`,
    `stripe_payment_intent_id`,
    `is_paid`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `time_slot_id`,
    `user_id`,
    `lat`,
    `long`,
    `user_address_id`,
    `service_charge`
  )
VALUES
  (
    16,
    'c6172bbe-328b-43c6-88f8-e6c7f8054330',
    NULL,
    NULL,
    NULL,
    188,
    NULL,
    10,
    NULL,
    'tewtewgtewgtwatewtergegyerg',
    NULL,
    0,
    '2022-05-31 16:43:26.004794',
    '2022-05-31 16:43:26.000000',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `orders` (
    `id`,
    `uuid`,
    `invoiced_receipt_url`,
    `cancellation_reason_other`,
    `service_fee`,
    `grand_total`,
    `admin_total_delivery_fee`,
    `vendor_total_deliveryfee`,
    `payment_type`,
    `address`,
    `stripe_payment_intent_id`,
    `is_paid`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `time_slot_id`,
    `user_id`,
    `lat`,
    `long`,
    `user_address_id`,
    `service_charge`
  )
VALUES
  (
    17,
    '73309788-f360-4467-ac6e-79aa1ac3b849',
    NULL,
    NULL,
    NULL,
    795,
    NULL,
    10,
    NULL,
    'tewtewgtewgtwatewtergegyerg',
    NULL,
    0,
    '2022-06-01 11:52:19.923130',
    '2022-06-01 11:52:20.000000',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `orders` (
    `id`,
    `uuid`,
    `invoiced_receipt_url`,
    `cancellation_reason_other`,
    `service_fee`,
    `grand_total`,
    `admin_total_delivery_fee`,
    `vendor_total_deliveryfee`,
    `payment_type`,
    `address`,
    `stripe_payment_intent_id`,
    `is_paid`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `time_slot_id`,
    `user_id`,
    `lat`,
    `long`,
    `user_address_id`,
    `service_charge`
  )
VALUES
  (
    18,
    '7e092661-61f3-4e0c-af47-fda4c79b7f5a',
    'https://pay.stripe.com/receipts/acct_1IbOxSSBJPMsjmRO/ch_3L6YcsSBJPMsjmRO17RcaS88/rcpt_LoAy6SVLM3IMWz9cIWxR16ZXWy8huGQ',
    NULL,
    NULL,
    392.5,
    NULL,
    10,
    NULL,
    'B+405 COUNTY  AHME GUHARAT HELLO INDIA 360055',
    'pi_3L6YcsSBJPMsjmRO18XWHegB',
    1,
    '2022-06-03 16:55:09.658507',
    '2022-06-03 16:55:12.000000',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '37.42359608248859',
    '-122.0880457945168',
    NULL,
    NULL
  );
INSERT INTO
  `orders` (
    `id`,
    `uuid`,
    `invoiced_receipt_url`,
    `cancellation_reason_other`,
    `service_fee`,
    `grand_total`,
    `admin_total_delivery_fee`,
    `vendor_total_deliveryfee`,
    `payment_type`,
    `address`,
    `stripe_payment_intent_id`,
    `is_paid`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `time_slot_id`,
    `user_id`,
    `lat`,
    `long`,
    `user_address_id`,
    `service_charge`
  )
VALUES
  (
    19,
    '99d08898-73e5-4736-b25c-6b332c5b8a12',
    NULL,
    NULL,
    NULL,
    760,
    NULL,
    10,
    NULL,
    'B+405 COUNTY  AHME GUHARAT HELLO INDIA 360055',
    NULL,
    0,
    '2022-06-07 13:16:48.674464',
    '2022-06-07 13:16:48.000000',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '37.42359608248859',
    '-122.0880457945168',
    16,
    NULL
  );
INSERT INTO
  `orders` (
    `id`,
    `uuid`,
    `invoiced_receipt_url`,
    `cancellation_reason_other`,
    `service_fee`,
    `grand_total`,
    `admin_total_delivery_fee`,
    `vendor_total_deliveryfee`,
    `payment_type`,
    `address`,
    `stripe_payment_intent_id`,
    `is_paid`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `time_slot_id`,
    `user_id`,
    `lat`,
    `long`,
    `user_address_id`,
    `service_charge`
  )
VALUES
  (
    20,
    'c87f3ebd-4952-4091-88b0-a4457111fd39',
    NULL,
    NULL,
    NULL,
    188,
    NULL,
    10,
    NULL,
    'B+405 COUNTY  AHME GUHARAT HELLO INDIA 360055',
    NULL,
    0,
    '2022-06-07 13:37:40.592992',
    '2022-06-07 13:37:40.000000',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '37.42359608248859',
    '-122.0880457945168',
    16,
    NULL
  );
INSERT INTO
  `orders` (
    `id`,
    `uuid`,
    `invoiced_receipt_url`,
    `cancellation_reason_other`,
    `service_fee`,
    `grand_total`,
    `admin_total_delivery_fee`,
    `vendor_total_deliveryfee`,
    `payment_type`,
    `address`,
    `stripe_payment_intent_id`,
    `is_paid`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `time_slot_id`,
    `user_id`,
    `lat`,
    `long`,
    `user_address_id`,
    `service_charge`
  )
VALUES
  (
    21,
    '852f3343-96fa-43fe-aff4-e3718f1dc7ee',
    NULL,
    NULL,
    NULL,
    116.5,
    NULL,
    10,
    NULL,
    'B+405 COUNTY  AHME GUHARAT HELLO INDIA 360055',
    NULL,
    0,
    '2022-06-07 14:04:05.135078',
    '2022-06-07 14:04:05.000000',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '37.42359608248859',
    '-122.0880457945168',
    16,
    NULL
  );
INSERT INTO
  `orders` (
    `id`,
    `uuid`,
    `invoiced_receipt_url`,
    `cancellation_reason_other`,
    `service_fee`,
    `grand_total`,
    `admin_total_delivery_fee`,
    `vendor_total_deliveryfee`,
    `payment_type`,
    `address`,
    `stripe_payment_intent_id`,
    `is_paid`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `time_slot_id`,
    `user_id`,
    `lat`,
    `long`,
    `user_address_id`,
    `service_charge`
  )
VALUES
  (
    22,
    '3a6a154c-cf73-441b-bfea-166c077aecdc',
    NULL,
    NULL,
    NULL,
    76,
    NULL,
    11,
    NULL,
    'B+405 COUNTY  AHME GUHARAT HELLO INDIA 360055',
    NULL,
    0,
    '2022-06-07 14:30:34.066024',
    '2022-06-07 14:30:34.000000',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '37.42359608248859',
    '-122.0880457945168',
    16,
    NULL
  );
INSERT INTO
  `orders` (
    `id`,
    `uuid`,
    `invoiced_receipt_url`,
    `cancellation_reason_other`,
    `service_fee`,
    `grand_total`,
    `admin_total_delivery_fee`,
    `vendor_total_deliveryfee`,
    `payment_type`,
    `address`,
    `stripe_payment_intent_id`,
    `is_paid`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `time_slot_id`,
    `user_id`,
    `lat`,
    `long`,
    `user_address_id`,
    `service_charge`
  )
VALUES
  (
    23,
    '3b365fb0-2b15-48dd-b0f5-9c6c7984ab08',
    NULL,
    NULL,
    NULL,
    126.5,
    NULL,
    10,
    NULL,
    'B+405 COUNTY  AHME GUHARAT HELLO INDIA 360055',
    NULL,
    0,
    '2022-06-07 15:23:37.307087',
    '2022-06-07 15:23:37.000000',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '37.42359608248859',
    '-122.0880457945168',
    16,
    NULL
  );
INSERT INTO
  `orders` (
    `id`,
    `uuid`,
    `invoiced_receipt_url`,
    `cancellation_reason_other`,
    `service_fee`,
    `grand_total`,
    `admin_total_delivery_fee`,
    `vendor_total_deliveryfee`,
    `payment_type`,
    `address`,
    `stripe_payment_intent_id`,
    `is_paid`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `time_slot_id`,
    `user_id`,
    `lat`,
    `long`,
    `user_address_id`,
    `service_charge`
  )
VALUES
  (
    24,
    'f2bf6601-5d20-4814-b6fd-669df23a426d',
    NULL,
    NULL,
    NULL,
    126.5,
    NULL,
    10,
    NULL,
    'B+405 COUNTY  AHME GUHARAT HELLO INDIA 360055',
    NULL,
    0,
    '2022-06-07 15:29:25.173262',
    '2022-06-07 15:29:25.000000',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '37.42359608248859',
    '-122.0880457945168',
    16,
    NULL
  );
INSERT INTO
  `orders` (
    `id`,
    `uuid`,
    `invoiced_receipt_url`,
    `cancellation_reason_other`,
    `service_fee`,
    `grand_total`,
    `admin_total_delivery_fee`,
    `vendor_total_deliveryfee`,
    `payment_type`,
    `address`,
    `stripe_payment_intent_id`,
    `is_paid`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `time_slot_id`,
    `user_id`,
    `lat`,
    `long`,
    `user_address_id`,
    `service_charge`
  )
VALUES
  (
    25,
    'eef4865d-58a3-45a9-aa6e-c53531157919',
    'https://pay.stripe.com/receipts/acct_1IbOxSSBJPMsjmRO/ch_3L8J9kSBJPMsjmRO1reYoue3/rcpt_Lpz8nEsZwMmV8GZO6nE3AQuSZkDHLwl',
    NULL,
    NULL,
    278,
    NULL,
    20,
    NULL,
    'test',
    'pi_3L8J9kSBJPMsjmRO1EEU1Zrl',
    1,
    '2022-06-08 12:48:20.162427',
    '2022-06-08 13:47:31.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    6,
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    '20.333',
    '70.2211',
    25,
    NULL
  );

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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:02.891750',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:02.898901',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:02.904570',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:02.909795',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:02.915316',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:02.921322',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:02.927221',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:02.932469',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:02.937859',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:02.943123',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:02.948115',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:02.953057',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:02.959220',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:02.964670',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:02.969576',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:02.974609',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:02.980666',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:02.986688',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:02.991818',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:02.996490',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:03.002649',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:03.008601',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:03.013479',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:03.018141',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:03.023806',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:03.028410',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:03.032999',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:03.037631',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:03.043151',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
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
    0,
    1,
    1,
    0,
    0,
    0,
    '2022-04-27 14:43:03.048025',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
    1,
    33
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
    31,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:53:59.893746',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    32,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:53:59.907790',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    33,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:53:59.912991',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    34,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:53:59.917929',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    35,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:53:59.922563',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    36,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:53:59.927560',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    37,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:53:59.931964',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    38,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:53:59.937699',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    39,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:53:59.943273',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    40,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:53:59.948427',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    41,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:53:59.952739',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    42,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:53:59.963181',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    43,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:53:59.985541',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    44,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:53:59.990501',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    45,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:53:59.996081',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    46,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:54:00.001670',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    47,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:54:00.007217',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    48,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:54:00.012713',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    49,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:54:00.019214',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    50,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:54:00.023941',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    51,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:54:00.029367',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    52,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:54:00.034388',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    53,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:54:00.039345',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    54,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:54:00.043601',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    55,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:54:00.047867',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    56,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:54:00.080227',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    57,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:54:00.086301',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    58,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:54:00.096078',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    59,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:54:00.101135',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
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
    60,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-27 17:54:00.107528',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    2,
    33
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
    61,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.524644',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    62,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.554527',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    63,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.559261',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    64,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.566674',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    65,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.574519',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    66,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.585805',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    67,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.591646',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    68,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.599584',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    69,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.619843',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    70,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.624818',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    71,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.630068',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    72,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.636276',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    73,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.643171',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    74,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.647942',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    75,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.652731',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    76,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.656802',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    77,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.661717',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    78,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.666755',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    79,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.671813',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    80,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.676104',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    81,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.681014',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    82,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.685301',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    83,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.689761',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    84,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.694510',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    85,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.698986',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    86,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.703401',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    87,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.707908',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    88,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.713208',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    89,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.718669',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
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
    90,
    0,
    0,
    1,
    1,
    0,
    0,
    '2022-04-27 17:54:27.722958',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    3,
    33
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
    91,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.008450',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    92,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.014960',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    93,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.020286',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    94,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.028054',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    95,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.033444',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    96,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.053279',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    97,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.064958',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    98,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.077509',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    99,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.106843',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    100,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.117303',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    101,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.125578',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    102,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.132292',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    103,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.140216',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    104,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.144834',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    105,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.149961',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    106,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.154559',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    107,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.159979',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    108,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.164222',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    109,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.169044',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    110,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.173794',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    111,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.178313',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    112,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.186489',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    113,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.195502',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    114,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.209408',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    115,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.213918',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    116,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.219880',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    117,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.249029',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    118,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.280383',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    119,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.285922',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
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
    120,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-04-28 13:04:22.301814',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    4,
    33
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
    121,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.137142',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    122,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.146302',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    123,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.151719',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    124,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.157554',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    125,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.162882',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    126,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.169654',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    127,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.174653',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    128,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.179864',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    129,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.184827',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    130,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.189418',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    131,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.195234',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    132,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.200471',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    133,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.205330',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    134,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.209863',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    135,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.214304',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    136,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.219059',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    137,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.260078',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    138,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.265361',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    139,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.272034',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    140,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.279099',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    141,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.283946',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    142,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.288925',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    143,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.293632',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    144,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.298391',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    145,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.302965',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    146,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.307589',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    147,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.311993',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    148,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.318123',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    149,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.323882',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
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
    150,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:11:13.328843',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    5,
    33
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
    151,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 12:33:03.420194',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    152,
    0,
    0,
    0,
    0,
    0,
    0,
    '2022-05-02 12:33:03.431137',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
    2
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
    661,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:11.125059',
    '2022-05-02 12:48:11.125059',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    662,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:11.176257',
    '2022-05-02 12:48:11.176257',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    663,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:11.208027',
    '2022-05-02 12:48:11.208027',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    664,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:11.636868',
    '2022-05-02 12:48:11.636868',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    665,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:11.683118',
    '2022-05-02 12:48:11.683118',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    666,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:11.706456',
    '2022-05-02 12:48:11.706456',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    667,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:11.782129',
    '2022-05-02 12:48:11.782129',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    668,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:11.796562',
    '2022-05-02 12:48:11.796562',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    669,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:11.819363',
    '2022-05-02 12:48:11.819363',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    670,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:11.837778',
    '2022-05-02 12:48:11.837778',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    671,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:12.305276',
    '2022-05-02 12:48:12.305276',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    672,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:12.565686',
    '2022-05-02 12:48:12.565686',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    673,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:12.953202',
    '2022-05-02 12:48:12.953202',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    674,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:13.493341',
    '2022-05-02 12:48:13.493341',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    675,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:13.530709',
    '2022-05-02 12:48:13.530709',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    676,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:13.538084',
    '2022-05-02 12:48:13.538084',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    677,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:13.544244',
    '2022-05-02 12:48:13.544244',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    678,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:13.555338',
    '2022-05-02 12:48:13.555338',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    679,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:14.204281',
    '2022-05-02 12:48:14.204281',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    680,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:14.544483',
    '2022-05-02 12:48:14.544483',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    681,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:14.559169',
    '2022-05-02 12:48:14.559169',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    682,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:14.578161',
    '2022-05-02 12:48:14.578161',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    683,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:14.587757',
    '2022-05-02 12:48:14.587757',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    684,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:14.869626',
    '2022-05-02 12:48:14.869626',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    685,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:14.903909',
    '2022-05-02 12:48:14.903909',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    686,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:14.910942',
    '2022-05-02 12:48:14.910942',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    687,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:14.918427',
    '2022-05-02 12:48:14.918427',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    688,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:14.927089',
    '2022-05-02 12:48:14.927089',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    689,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:14.940794',
    '2022-05-02 12:48:14.940794',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    690,
    0,
    0,
    0,
    1,
    1,
    1,
    '2022-05-02 12:48:14.951795',
    '2022-05-02 12:48:14.951795',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    NULL,
    NULL
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
    691,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.440597',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    692,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.451912',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    693,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.459988',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    694,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.467235',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    695,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.475366',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    696,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.481624',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    697,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.507560',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    698,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.515248',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    699,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.520982',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    700,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.527729',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    701,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.533659',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    702,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.539333',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    703,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.547859',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    704,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.554059',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    705,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.562877',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    706,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.568696',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    707,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.573617',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    708,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.579351',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    709,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.585861',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    710,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.594867',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    711,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.602413',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    712,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.612043',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    713,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.619802',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    714,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.628704',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    715,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.635568',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    716,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.641058',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    717,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.646155',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    718,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.652028',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    719,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.656905',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
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
    720,
    0,
    1,
    0,
    1,
    1,
    1,
    '2022-05-02 12:58:03.662588',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    7,
    33
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
    721,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:11.831554',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    722,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:11.990328',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    723,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.002074',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    724,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.010211',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    725,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.079204',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    726,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.101175',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    727,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.117192',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    728,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.122933',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    729,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.127657',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    730,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.133400',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    731,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.143966',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    732,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.181988',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    733,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.219673',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    734,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.238687',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    735,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.244272',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    736,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.249291',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    737,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.254197',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    738,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.259504',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    739,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.264513',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    740,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.269737',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    741,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.275118',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    742,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.280136',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    743,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.286221',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    744,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.292958',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    745,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.303230',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    746,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.309239',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    747,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.315488',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    748,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.323127',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    749,
    0,
    0,
    1,
    0,
    1,
    1,
    '2022-05-02 13:08:12.329332',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
    33
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
    750,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.427414',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    751,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.509908',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    752,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.517992',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    753,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.526762',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    754,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.537970',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    755,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.544867',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    756,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.552941',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    757,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.559548',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    758,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.566978',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    759,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.578579',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    760,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.587901',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    761,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.602588',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    762,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.612502',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    763,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.634830',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    764,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.682016',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    765,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.699675',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    766,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.727918',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    767,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.743948',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    768,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.780357',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    769,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.812196',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    770,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.833649',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    771,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.875228',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    772,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.881057',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    773,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.888601',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    774,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.895397',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    775,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.900341',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    776,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.937715',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    777,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.946015',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
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
    778,
    0,
    0,
    1,
    0,
    0,
    0,
    '2022-05-02 13:08:12.954524',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    6,
    33
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
    779,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.127173',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    780,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.134844',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    781,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.143794',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    782,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.150725',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    783,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.156886',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    784,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.195461',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    785,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.202785',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    786,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.210255',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    787,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.216894',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    788,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.223728',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    789,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.229534',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    790,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.236388',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    791,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.243920',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    792,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.249338',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    793,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.254325',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    794,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.259286',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    795,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.265160',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    796,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.270444',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    797,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.276858',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    798,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.281936',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    799,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.289321',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    800,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.294264',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    801,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.299904',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    802,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.305014',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    803,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.311068',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    804,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.317224',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    805,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.323540',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    806,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.329328',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    807,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.334080',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
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
    808,
    0,
    1,
    1,
    1,
    0,
    1,
    '2022-05-02 16:56:55.338898',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    8,
    33
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
    809,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:09.973756',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    810,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:09.979981',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    811,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:09.984906',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    812,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.051515',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    813,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.056860',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    814,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.108089',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    815,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.115985',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    816,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.122795',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    817,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.130833',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    818,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.136997',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    819,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.142007',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    820,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.147415',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    821,
    0,
    1,
    1,
    0,
    1,
    1,
    '2022-05-02 17:07:10.153648',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    822,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.158273',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    823,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.164218',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    824,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.169204',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    825,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.174406',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    826,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.180023',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    827,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.184963',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    828,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.190072',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    829,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.194414',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    830,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.198874',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    831,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.203876',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    832,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.208938',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    833,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.213779',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    834,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.218271',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    835,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.223456',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    836,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.229385',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    837,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.237985',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
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
    838,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-02 17:07:10.242546',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    9,
    33
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
    839,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.027095',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    840,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.085230',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    841,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.094199',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    842,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.102265',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    843,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.112765',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    844,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.120912',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    845,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.132649',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    846,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.139747',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    847,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.147020',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    848,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.156705',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    849,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.164745',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    850,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.171459',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    851,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.178857',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    852,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.183978',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    853,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.191895',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    854,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.201426',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    855,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.207741',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    856,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.212700',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    857,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.219194',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    858,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.226926',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    859,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.234223',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    860,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.239583',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    861,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.245700',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    862,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.252024',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    863,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.256982',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    864,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.262713',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    865,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.269559',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    866,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.275732',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    867,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.289867',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
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
    868,
    0,
    1,
    0,
    0,
    0,
    0,
    '2022-05-05 11:34:26.299499',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    10,
    33
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
    869,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.410397',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    870,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.442266',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    871,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.452216',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    872,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.465370',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    873,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.473810',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    874,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.485373',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    875,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.497990',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    876,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.511138',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    877,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.572566',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    878,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.582752',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    879,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.597616',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    880,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.621892',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    881,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.653810',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    882,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.684638',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    883,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.716312',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    884,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.743109',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    885,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.801418',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    886,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.815275',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    887,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.822549',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    888,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.862711',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    889,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.889660',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    890,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.911835',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    891,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.925585',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    892,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.932433',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    893,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.939555',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    894,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.947613',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    895,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.962856',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    896,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.973109',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    897,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:20.989664',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
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
    898,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 11:35:21.013502',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    11,
    33
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
    899,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.792465',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    900,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.863765',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    901,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.870825',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    902,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.876736',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    903,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.883507',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    904,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.892515',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    905,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.898853',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    906,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.904876',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    907,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.911501',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    908,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.919982',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    909,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.925036',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    910,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.931210',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    911,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.936440',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    912,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.942220',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    913,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.948804',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    914,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.954136',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    915,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.965302',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    916,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.971613',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    917,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.976900',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    918,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.983132',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    919,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.988369',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    920,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:42.994704',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    921,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:43.008615',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    922,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:43.019931',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    923,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:43.029931',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    924,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:43.034991',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    925,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:43.091979',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    926,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:43.098488',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    927,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:43.104987',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
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
    928,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-05 13:11:43.114368',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    12,
    33
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
    929,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.676786',
    '2022-05-24 12:20:08.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    930,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.728785',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    931,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.736004',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    932,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.743346',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    933,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.767503',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    934,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.774526',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    935,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.781720',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    936,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.790338',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    937,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.807075',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    938,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.833581',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    939,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.844211',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    940,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.853462',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    941,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.860603',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    942,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.865546',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    943,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.871478',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    944,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.876573',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    945,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.881379',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    946,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.887790',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    947,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.893626',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    948,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.901762',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    949,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.909617',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    950,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.915680',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    951,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.921566',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    952,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.926359',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    953,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.931631',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    954,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.937245',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    955,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.943857',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    956,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.953560',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    957,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.958872',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    958,
    1,
    1,
    1,
    1,
    1,
    1,
    '2022-05-24 11:12:20.963572',
    '2022-05-24 13:30:00.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    13,
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
    `is_active`,
    `test`,
    `test+1`
  )
VALUES
  (
    1,
    'test',
    2,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    NULL,
    '2022-04-27 14:42:44.426496',
    '2022-04-27 14:42:44.426496',
    NULL,
    1,
    NULL,
    NULL
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
    `is_active`,
    `test`,
    `test+1`
  )
VALUES
  (
    2,
    'Sarang Test',
    1,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    NULL,
    '2022-04-27 15:37:09.133140',
    '2022-04-27 15:37:09.133140',
    NULL,
    1,
    NULL,
    NULL
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
    `is_active`,
    `test`,
    `test+1`
  )
VALUES
  (
    3,
    'Sarang Test 1',
    1,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    NULL,
    '2022-04-27 15:37:26.975965',
    '2022-04-27 15:37:26.975965',
    NULL,
    1,
    NULL,
    NULL
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
    `is_active`,
    `test`,
    `test+1`
  )
VALUES
  (
    4,
    'Sarang Test22',
    2,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    NULL,
    '2022-04-27 15:38:08.490065',
    '2022-04-27 15:38:08.490065',
    NULL,
    1,
    NULL,
    NULL
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
    `is_active`,
    `test`,
    `test+1`
  )
VALUES
  (
    5,
    'mtest2',
    1,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    NULL,
    '2022-04-29 13:10:41.139615',
    '2022-04-29 13:10:41.139615',
    NULL,
    1,
    NULL,
    NULL
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
    `is_active`,
    `test`,
    `test+1`
  )
VALUES
  (
    6,
    'abc',
    1,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-06-02 13:03:58.865414',
    '2022-06-02 13:04:20.000000',
    '2022-06-02 13:04:20.000000',
    1,
    NULL,
    NULL
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
    `is_active`,
    `test`,
    `test+1`
  )
VALUES
  (
    7,
    'abc',
    2,
    'https://blog.hubspot.com/hubfs/parts-url.jpg',
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-06-02 13:04:52.225069',
    '2022-06-02 13:05:27.000000',
    '2022-06-02 13:05:27.000000',
    1,
    NULL,
    NULL
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
    10,
    50,
    '2022-04-27 14:42:44.445638',
    '2022-04-27 14:42:44.445638',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1,
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
    2,
    10,
    10,
    '2022-04-27 15:37:09.225434',
    '2022-04-27 15:37:09.225434',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    2,
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
    3,
    123,
    50,
    '2022-04-27 15:37:27.033943',
    '2022-04-27 15:37:27.033943',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    3,
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
    4,
    10,
    10,
    '2022-04-27 15:38:08.512108',
    '2022-04-27 15:38:08.512108',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    4,
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
    5,
    100,
    10,
    '2022-04-27 15:38:08.554052',
    '2022-04-27 15:38:08.554052',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    4,
    2
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
    6,
    10,
    10,
    '2022-04-29 13:10:41.171338',
    '2022-04-29 13:10:41.171338',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    5,
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
    7,
    125,
    10,
    '2022-06-02 13:03:58.885941',
    '2022-06-02 13:03:58.885941',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    6,
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
    8,
    10,
    10,
    '2022-06-02 13:04:52.236391',
    '2022-06-02 13:04:52.236391',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    7,
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
    9,
    20,
    20,
    '2022-06-02 13:04:52.249045',
    '2022-06-02 13:04:52.249045',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    7,
    2
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: promocodes
# ------------------------------------------------------------

INSERT INTO
  `promocodes` (
    `id`,
    `title`,
    `promocode`,
    `order_type`,
    `discount`,
    `start_at`,
    `end_at`,
    `category_ids`,
    `customer_ids`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `product_id`
  )
VALUES
  (
    1,
    'get 20% off',
    'get20',
    1,
    20,
    '2022-03-29 00:00:00',
    '2022-04-29 00:00:00',
    '',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    '2022-04-28 12:10:01.974745',
    '2022-05-02 16:38:42.000000',
    '2022-05-02 16:38:42.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    0,
    2
  );
INSERT INTO
  `promocodes` (
    `id`,
    `title`,
    `promocode`,
    `order_type`,
    `discount`,
    `start_at`,
    `end_at`,
    `category_ids`,
    `customer_ids`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `product_id`
  )
VALUES
  (
    2,
    'GET 10% OFF',
    'GET10',
    2,
    10,
    '2022-03-29 00:00:00',
    '2022-04-29 00:00:00',
    '1,2',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43',
    '2022-04-28 12:10:57.316535',
    '2022-05-02 16:38:52.000000',
    '2022-05-02 16:38:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    0,
    1
  );
INSERT INTO
  `promocodes` (
    `id`,
    `title`,
    `promocode`,
    `order_type`,
    `discount`,
    `start_at`,
    `end_at`,
    `category_ids`,
    `customer_ids`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `product_id`
  )
VALUES
  (
    3,
    'Get more 27% discount',
    'GRAB27',
    2,
    27,
    '2022-05-02 12:00:00',
    '2022-08-31 12:00:00',
    '1,2',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43,7df6a123-7093-4950-a86e-1499441857a0',
    '2022-05-02 16:40:28.206620',
    '2022-05-31 14:27:41.273709',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    1
  );
INSERT INTO
  `promocodes` (
    `id`,
    `title`,
    `promocode`,
    `order_type`,
    `discount`,
    `start_at`,
    `end_at`,
    `category_ids`,
    `customer_ids`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `product_id`
  )
VALUES
  (
    4,
    'Only 23%',
    'ONLY23',
    1,
    23,
    '2022-05-02 12:00:00',
    '2022-08-31 12:00:00',
    '',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f,47d16810-bea3-4a48-b1b5-33fb23b34156,e604ead9-2bf0-415a-a63b-be393e533e43,7df6a123-7093-4950-a86e-1499441857a0',
    '2022-05-02 16:41:37.708459',
    '2022-05-31 14:27:37.102368',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    2
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: ratings
# ------------------------------------------------------------

INSERT INTO
  `ratings` (
    `id`,
    `rating`,
    `review`,
    `is_active`,
    `create_at`,
    `update_at`,
    `order_detail_id`,
    `to_user_id`,
    `from_user_id`
  )
VALUES
  (
    1,
    5,
    'test',
    1,
    '2022-05-23 16:27:15.050029',
    '2022-05-23 16:27:15.050029',
    NULL,
    '581ffd6a-7de6-40a9-8745-11b362079937',
    '7df6a123-7093-4950-a86e-1499441857a0'
  );
INSERT INTO
  `ratings` (
    `id`,
    `rating`,
    `review`,
    `is_active`,
    `create_at`,
    `update_at`,
    `order_detail_id`,
    `to_user_id`,
    `from_user_id`
  )
VALUES
  (
    2,
    5,
    'test',
    1,
    '2022-05-23 16:27:21.127012',
    '2022-05-23 16:27:21.127012',
    NULL,
    '581ffd6a-7de6-40a9-8745-11b362079937',
    '7df6a123-7093-4950-a86e-1499441857a0'
  );
INSERT INTO
  `ratings` (
    `id`,
    `rating`,
    `review`,
    `is_active`,
    `create_at`,
    `update_at`,
    `order_detail_id`,
    `to_user_id`,
    `from_user_id`
  )
VALUES
  (
    3,
    5,
    'test',
    1,
    '2022-05-23 16:27:23.661366',
    '2022-05-23 16:27:23.661366',
    NULL,
    '581ffd6a-7de6-40a9-8745-11b362079937',
    '7df6a123-7093-4950-a86e-1499441857a0'
  );
INSERT INTO
  `ratings` (
    `id`,
    `rating`,
    `review`,
    `is_active`,
    `create_at`,
    `update_at`,
    `order_detail_id`,
    `to_user_id`,
    `from_user_id`
  )
VALUES
  (
    4,
    4,
    'test',
    1,
    '2022-05-23 16:33:34.683925',
    '2022-05-23 16:33:34.683925',
    NULL,
    '581ffd6a-7de6-40a9-8745-11b362079937',
    '7df6a123-7093-4950-a86e-1499441857a0'
  );
INSERT INTO
  `ratings` (
    `id`,
    `rating`,
    `review`,
    `is_active`,
    `create_at`,
    `update_at`,
    `order_detail_id`,
    `to_user_id`,
    `from_user_id`
  )
VALUES
  (
    5,
    3,
    'test',
    1,
    '2022-05-23 16:33:40.069057',
    '2022-05-23 16:33:40.069057',
    NULL,
    '581ffd6a-7de6-40a9-8745-11b362079937',
    '7df6a123-7093-4950-a86e-1499441857a0'
  );
INSERT INTO
  `ratings` (
    `id`,
    `rating`,
    `review`,
    `is_active`,
    `create_at`,
    `update_at`,
    `order_detail_id`,
    `to_user_id`,
    `from_user_id`
  )
VALUES
  (
    6,
    4,
    'test',
    1,
    '2022-05-23 16:33:43.594820',
    '2022-05-23 16:33:43.594820',
    NULL,
    '581ffd6a-7de6-40a9-8745-11b362079937',
    '7df6a123-7093-4950-a86e-1499441857a0'
  );
INSERT INTO
  `ratings` (
    `id`,
    `rating`,
    `review`,
    `is_active`,
    `create_at`,
    `update_at`,
    `order_detail_id`,
    `to_user_id`,
    `from_user_id`
  )
VALUES
  (
    7,
    3,
    'test',
    1,
    '2022-05-23 16:33:47.475895',
    '2022-05-23 16:33:47.475895',
    NULL,
    '581ffd6a-7de6-40a9-8745-11b362079937',
    '7df6a123-7093-4950-a86e-1499441857a0'
  );

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
    'a7a2abfe-ced5-4642-9b06-287381fc1a2e',
    'testttttttt',
    '2022-04-27 14:43:02.728107',
    '2022-05-02 12:10:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:40.000000',
    0
  );
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
    2,
    'f4c5f357-3e55-4965-a49a-efa3db510309',
    'adm',
    '2022-04-27 17:53:59.753618',
    '2022-05-02 12:10:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:43.000000',
    0
  );
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
    3,
    '015dd655-c130-49f3-8971-25254f788ada',
    'test',
    '2022-04-27 17:54:27.410934',
    '2022-05-02 12:10:45.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:45.000000',
    1
  );
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
    4,
    '1c2fb023-016d-4ce8-a4b4-8f434546a719',
    'Sub admin',
    '2022-04-28 13:04:21.810540',
    '2022-05-02 12:10:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 12:10:52.000000',
    1
  );
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
    5,
    '2676716c-fcda-47d5-9b93-69e3a4a02aa0',
    'testh',
    '2022-05-02 12:11:13.009279',
    '2022-05-02 16:55:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:41.000000',
    1
  );
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
    6,
    '6876cd56-6b28-4368-a9c7-95104f3a78b2',
    'sub manager',
    '2022-05-02 12:33:03.382096',
    '2022-05-02 16:55:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:55:43.000000',
    1
  );
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
    7,
    'ccf51989-577e-4ce9-b5db-477279c2bc7d',
    'admin ',
    '2022-05-02 12:58:03.159164',
    '2022-05-02 16:56:19.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-02 16:56:19.000000',
    0
  );
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
    8,
    'a82c26b1-7268-40e1-b9e6-ce5f5aff7cc9',
    'admin ',
    '2022-05-02 16:56:54.985386',
    '2022-05-24 11:05:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:39.000000',
    0
  );
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
    9,
    '1d456dc5-1044-48ae-b861-618f937b8700',
    'sub manager',
    '2022-05-02 17:07:09.794109',
    '2022-05-24 11:05:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:44.000000',
    1
  );
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
    10,
    '11fccb76-b9ac-400b-beb1-f93c77e17cc5',
    'testing',
    '2022-05-05 11:34:25.722313',
    '2022-05-24 11:05:50.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:50.000000',
    1
  );
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
    11,
    '9c5cb159-c651-4304-a888-14172e126ec6',
    'testttttttt',
    '2022-05-05 11:35:20.163468',
    '2022-05-24 11:05:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:05:52.000000',
    1
  );
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
    12,
    '5d3e53af-ceed-4f67-94d8-24c1f7e53923',
    'sub manage',
    '2022-05-05 13:11:41.777715',
    '2022-05-24 11:06:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2022-05-24 11:06:43.000000',
    1
  );
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
    13,
    'bc9ccbae-9cff-458d-af0a-d76d4930070e',
    'sub manager',
    '2022-05-24 11:12:20.485709',
    '2022-06-10 14:58:30.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    0
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
    'TESTS',
    5,
    2,
    '2022-04-27 15:26:29.120429',
    '2022-05-02 11:26:09.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    0
  );
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
    2,
    'test 2',
    2,
    4,
    '2022-05-26 16:59:14.281902',
    '2022-05-26 17:52:35.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1
  );
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
    3,
    'TEST 3',
    5,
    0,
    '2022-05-26 16:59:31.275377',
    '2022-05-26 16:59:31.275377',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL,
    1
  );
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
    4,
    'test 4',
    5,
    0,
    '2022-05-26 17:53:32.001607',
    '2022-05-26 17:53:32.001607',
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
    '2022-04-27 14:43:26.849081',
    '2022-04-27 16:28:28.000000',
    '2022-04-27 16:28:28.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '06681fd4-fe71-4963-b9ce-2c2aeed2e298',
    1
  );
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
    2,
    NULL,
    1,
    '2022-04-27 16:28:42.171845',
    '2022-04-27 17:57:01.000000',
    '2022-04-27 17:57:01.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '12c920b8-392c-4cbe-afef-5951e541b4ca',
    1
  );
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
    3,
    NULL,
    1,
    '2022-04-27 17:55:42.627352',
    '2022-04-27 17:58:41.000000',
    '2022-04-27 17:58:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    'c842ba3f-c326-45eb-95f7-f30dbbc24c65',
    2
  );
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
    4,
    NULL,
    1,
    '2022-04-27 17:56:19.156929',
    '2022-05-02 16:54:44.000000',
    '2022-05-02 16:54:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '8d45b1da-30b6-4e2e-8a10-43136f6e1785',
    6
  );
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
    5,
    NULL,
    0,
    '2022-04-27 17:56:45.923686',
    '2022-05-02 16:54:39.000000',
    '2022-05-02 16:54:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    'd835a4ec-3f76-4293-a870-3e3212a4019b',
    3
  );
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
    6,
    NULL,
    1,
    '2022-04-27 17:58:29.312474',
    '2022-05-02 16:54:47.000000',
    '2022-05-02 16:54:47.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '5fe4927c-e313-44cf-9ab8-20a95b52d140',
    2
  );
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
    7,
    NULL,
    1,
    '2022-05-02 17:17:16.484174',
    '2022-05-24 11:04:56.000000',
    '2022-05-24 11:04:56.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    'bf0d038c-1b20-4f45-80b6-900049b9b892',
    9
  );
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
    8,
    NULL,
    1,
    '2022-05-05 13:13:49.080437',
    '2022-05-24 11:05:29.000000',
    '2022-05-24 11:05:29.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    'c39e85d8-91c9-4097-86f9-f94ccc46b7b5',
    8
  );
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
    9,
    NULL,
    1,
    '2022-05-05 13:27:07.165694',
    '2022-05-24 11:04:51.000000',
    '2022-05-24 11:04:51.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    'd5216422-ccce-49ce-ab13-b5331adbba02',
    9
  );
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
    10,
    NULL,
    1,
    '2022-05-05 13:27:42.432950',
    '2022-05-24 10:24:20.000000',
    '2022-05-24 10:24:20.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    'da4d42e6-fa01-4902-af60-f6f212e9980c',
    11
  );
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
    11,
    NULL,
    1,
    '2022-05-20 15:18:56.311494',
    '2022-05-24 10:40:39.000000',
    '2022-05-24 10:40:39.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '6f8b4bdd-07b4-49fb-836b-a53a83370ab8',
    9
  );
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
    12,
    NULL,
    1,
    '2022-05-24 10:41:01.628324',
    '2022-05-24 11:05:17.000000',
    '2022-05-24 11:05:17.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '508e34d0-7838-49f3-8d02-035eb055caf0',
    9
  );
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
    13,
    NULL,
    1,
    '2022-05-24 10:43:23.483343',
    '2022-05-24 11:05:22.000000',
    '2022-05-24 11:05:22.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '307d7954-8458-4ce9-9b6b-db3435c7bccd',
    9
  );
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
    14,
    NULL,
    1,
    '2022-05-24 11:12:58.805321',
    '2022-05-24 11:18:41.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '6884e482-e1fe-40b6-ac9a-22d790dd9e0e',
    13
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: time_slots
# ------------------------------------------------------------

INSERT INTO
  `time_slots` (
    `id`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    1,
    1,
    '2022-04-27 14:55:49.056945',
    '2022-04-27 15:10:41.000000',
    '2022-04-27 15:10:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '10:00:00',
    '11:00:00'
  );
INSERT INTO
  `time_slots` (
    `id`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    2,
    1,
    '2022-04-27 14:55:49.075689',
    '2022-04-27 15:10:31.000000',
    '2022-04-27 15:10:31.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '11:00:00',
    '12:00:00'
  );
INSERT INTO
  `time_slots` (
    `id`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    3,
    1,
    '2022-04-27 15:11:06.462673',
    '2022-04-27 16:22:06.000000',
    '2022-04-27 16:22:06.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '10:00:00',
    '10:00:00'
  );
INSERT INTO
  `time_slots` (
    `id`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    4,
    1,
    '2022-04-27 15:11:06.479386',
    '2022-04-27 16:22:09.000000',
    '2022-04-27 16:22:09.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '11:00:00',
    '12:00:00'
  );
INSERT INTO
  `time_slots` (
    `id`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    5,
    1,
    '2022-04-27 16:24:23.852980',
    '2022-05-18 15:24:43.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '10:00:00',
    '11:00:00'
  );
INSERT INTO
  `time_slots` (
    `id`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    6,
    1,
    '2022-04-27 16:29:48.335716',
    '2022-04-27 16:29:48.335716',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '11:00:00',
    '12:00:00'
  );
INSERT INTO
  `time_slots` (
    `id`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    7,
    1,
    '2022-04-27 16:29:48.345968',
    '2022-04-27 16:41:04.000000',
    '2022-04-27 16:41:04.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '12:00:00',
    '13:00:00'
  );
INSERT INTO
  `time_slots` (
    `id`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    8,
    1,
    '2022-04-27 16:41:25.386038',
    '2022-04-28 11:27:01.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '12:00:00',
    '13:00:00'
  );
INSERT INTO
  `time_slots` (
    `id`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    9,
    1,
    '2022-04-28 11:27:09.964884',
    '2022-05-18 15:25:12.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '13:00:00',
    '14:00:00'
  );
INSERT INTO
  `time_slots` (
    `id`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    10,
    1,
    '2022-04-28 17:29:43.328294',
    '2022-04-28 17:29:49.000000',
    '2022-04-28 17:29:49.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '10:31:00',
    '07:33:00'
  );
INSERT INTO
  `time_slots` (
    `id`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    11,
    1,
    '2022-04-28 17:30:34.771949',
    '2022-04-28 17:30:40.000000',
    '2022-04-28 17:30:40.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '07:32:00',
    '10:34:00'
  );
INSERT INTO
  `time_slots` (
    `id`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    12,
    1,
    '2022-04-28 17:41:33.793722',
    '2022-04-28 17:41:33.793722',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '14:00:00',
    '15:00:00'
  );
INSERT INTO
  `time_slots` (
    `id`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    13,
    1,
    '2022-04-28 18:22:57.648687',
    '2022-04-28 18:24:31.000000',
    '2022-04-28 18:24:31.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '10:00:00',
    '09:00:00'
  );
INSERT INTO
  `time_slots` (
    `id`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    14,
    1,
    '2022-05-17 17:14:12.395565',
    '2022-05-17 17:15:05.000000',
    '2022-05-17 17:15:05.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '10:00:00',
    '11:00:00'
  );
INSERT INTO
  `time_slots` (
    `id`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    15,
    1,
    '2022-05-17 17:14:12.413036',
    '2022-05-17 17:15:08.000000',
    '2022-05-17 17:15:08.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '12:00:00',
    '16:00:00'
  );
INSERT INTO
  `time_slots` (
    `id`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    16,
    1,
    '2022-05-17 17:17:26.054930',
    '2022-05-17 17:18:01.000000',
    '2022-05-17 17:18:01.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '10:00:00',
    '11:00:00'
  );
INSERT INTO
  `time_slots` (
    `id`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    17,
    1,
    '2022-05-18 15:22:53.345062',
    '2022-05-18 15:24:30.000000',
    '2022-05-18 15:24:30.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '10:00:00',
    '11:00:00'
  );
INSERT INTO
  `time_slots` (
    `id`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    18,
    1,
    '2022-05-30 16:58:56.280426',
    '2022-06-08 15:44:43.000000',
    '2022-06-08 15:44:43.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '17:00:00',
    '18:00:00'
  );
INSERT INTO
  `time_slots` (
    `id`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    19,
    1,
    '2022-06-08 15:41:16.498344',
    '2022-06-08 15:41:16.498344',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '16:00:00',
    '17:00:00'
  );
INSERT INTO
  `time_slots` (
    `id`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `start_time`,
    `end_time`
  )
VALUES
  (
    20,
    1,
    '2022-06-08 15:41:53.514385',
    '2022-06-08 15:41:53.514385',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '18:00:00',
    '19:00:00'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tokens
# ------------------------------------------------------------

INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    1,
    NULL,
    NULL,
    '2022-05-18 13:47:59',
    11,
    '2022-05-16 12:47:55.277123',
    '2022-05-18 13:47:58.000000',
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTI4NjE4NzgsImV4cCI6MTY1MzI5Mzg3OCwiYXVkIjoiYWNjZXNzX3Rva2VuIiwic3ViIjoiMDZlNzI5MmEtNmEzMi00MTc5LWFlNzQtYTQ3N2Y1ZmUyZjVmIn0.L2SGtpgp_4Xq_Y721jlW0Ta5mS9q-gy_JXeXjrh-B_g',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTI4NjE4NzgsImV4cCI6MTY1MzcyNTg3OCwiYXVkIjoicmVmcmVzaF90b2tlbiIsInN1YiI6IjA2ZTcyOTJhLTZhMzItNDE3OS1hZTc0LWE0NzdmNWZlMmY1ZiJ9.liIPWl4AlU_K5YLpTXGSge-pdeSxEDusq2CcTRxz2DE'
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    3,
    'LJMgVljTwiBOEUjnAoSCV:APA91bHjPU62R-EU2gT_Zhc5Bcv0PKjE77HY7IjvhIifloVxUkZ4HVyhnwkLzOrXFAl6LbXZxGoyjw8gQg8LWn3kSeDNFpI9D-IlUyFHzJUvXmWE4I3uaDoLz79NW8BLEAUWV4diXZ-g',
    'android',
    '2022-05-17 15:21:44',
    1,
    '2022-05-17 15:21:44.181721',
    '2022-05-17 15:38:39.932908',
    NULL,
    'c484df2f-bda6-46bf-825a-40669ed2a7ab',
    NULL,
    NULL
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    4,
    NULL,
    NULL,
    '2022-05-17 16:22:36',
    1,
    '2022-05-17 16:22:36.276073',
    '2022-05-17 16:22:36.276073',
    NULL,
    '3b1ee693-623a-4063-a738-931cd03275be',
    NULL,
    NULL
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    5,
    NULL,
    NULL,
    '2022-05-17 16:22:53',
    1,
    '2022-05-17 16:22:53.080310',
    '2022-05-17 16:22:53.080310',
    NULL,
    '9bc46902-cb81-4a53-b198-be272501b9ac',
    NULL,
    NULL
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    6,
    'cDLJ_LcTTe-C2nNnKAFXUd:APA91bE8baT2Yeqzz8-kH8qOAZ5cw5hEgKqaGS8xlZ4XXKgr0UT50XTdBMzmb2zRPDubUUez0JVSrOICVMJDxzpk-qZmPBT7UsD0s1JacV3B1RDaLAXP0am2pyFh6lF3qYPCPHrsOE5F',
    'A',
    '2022-05-26 17:48:06',
    2,
    '2022-05-18 10:44:46.783398',
    '2022-05-26 17:48:06.000000',
    NULL,
    '0d8caf5c-6593-4c26-bff1-b2dadd12ef3d',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTM1Njc0ODYsImV4cCI6MTY1Mzk5OTQ4NiwiYXVkIjoiYWNjZXNzX3Rva2VuIiwic3ViIjoiMGQ4Y2FmNWMtNjU5My00YzI2LWJmZjEtYjJkYWRkMTJlZjNkIn0.9z3FoaafUF9ORoaGsdf4ykOUp4c3coS8KkRXM18mmQQ',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTM1Njc0ODYsImV4cCI6MTY1NDQzMTQ4NiwiYXVkIjoicmVmcmVzaF90b2tlbiIsInN1YiI6IjBkOGNhZjVjLTY1OTMtNGMyNi1iZmYxLWIyZGFkZDEyZWYzZCJ9.IP55mJZ9ROi8uHQurWF1AkKEKaRHuH8ggBaRusPiIaM'
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    7,
    NULL,
    NULL,
    '2022-05-18 10:45:28',
    1,
    '2022-05-18 10:45:28.471869',
    '2022-06-03 15:22:37.000000',
    NULL,
    '3516c417-cfc0-416d-99e0-59ee7405aebe',
    NULL,
    NULL
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    8,
    NULL,
    NULL,
    '2022-05-18 10:54:42',
    1,
    '2022-05-18 10:54:41.739212',
    '2022-05-18 10:54:41.739212',
    NULL,
    '5004118c-e923-4439-beb9-28f03b44a333',
    NULL,
    NULL
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    9,
    NULL,
    NULL,
    '2022-05-18 10:54:58',
    1,
    '2022-05-18 10:54:57.785863',
    '2022-05-18 10:54:57.785863',
    NULL,
    '8e3e11c7-0f2f-4204-9371-3e0c5c20752e',
    NULL,
    NULL
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    10,
    NULL,
    NULL,
    '2022-05-18 10:56:49',
    1,
    '2022-05-18 10:56:49.090477',
    '2022-05-18 10:56:49.090477',
    NULL,
    'f3e52816-bfdb-49b1-95fd-d6947f09585b',
    NULL,
    NULL
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    11,
    NULL,
    NULL,
    '2022-05-18 10:57:03',
    1,
    '2022-05-18 10:57:03.090590',
    '2022-05-18 10:57:03.090590',
    NULL,
    '654702a6-2446-49e6-84a6-0bfa405ad1cf',
    NULL,
    NULL
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    12,
    NULL,
    NULL,
    '2022-05-18 10:58:11',
    1,
    '2022-05-18 10:58:11.041246',
    '2022-05-18 10:58:11.041246',
    NULL,
    '30a035d3-f5d8-47ba-ac6c-f7355236a81b',
    NULL,
    NULL
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    13,
    NULL,
    NULL,
    '2022-05-18 11:32:03',
    1,
    '2022-05-18 11:32:02.890719',
    '2022-05-18 11:32:02.890719',
    NULL,
    'df8e1eea-f87d-4034-95d1-b5392d33e68f',
    NULL,
    NULL
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    14,
    NULL,
    NULL,
    '2022-05-18 11:32:15',
    1,
    '2022-05-18 11:32:14.571644',
    '2022-05-18 11:32:14.571644',
    NULL,
    '60a27248-b43c-48ee-9128-7e59d88d9709',
    NULL,
    NULL
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    15,
    NULL,
    NULL,
    '2022-05-18 11:41:11',
    1,
    '2022-05-18 11:41:10.716007',
    '2022-05-18 11:41:10.716007',
    NULL,
    '27e85571-9398-4bf7-9a29-9b31a0c50876',
    NULL,
    NULL
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    16,
    NULL,
    NULL,
    '2022-05-18 11:41:21',
    1,
    '2022-05-18 11:41:20.937781',
    '2022-05-18 11:41:20.937781',
    NULL,
    '803e88ab-7480-4ff1-bfe8-43263372e7a8',
    NULL,
    NULL
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    17,
    NULL,
    NULL,
    '2022-05-18 11:42:14',
    1,
    '2022-05-18 11:42:14.346446',
    '2022-05-18 11:42:14.346446',
    NULL,
    '664ab289-259c-4860-8030-852a3136a5a3',
    NULL,
    NULL
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    18,
    NULL,
    NULL,
    '2022-05-18 11:42:25',
    1,
    '2022-05-18 11:42:24.652660',
    '2022-05-18 11:42:24.652660',
    NULL,
    '5d931118-1b2e-4e58-bb89-b8698a6a7b77',
    NULL,
    NULL
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    19,
    NULL,
    NULL,
    '2022-05-18 11:47:40',
    1,
    '2022-05-18 11:47:39.731971',
    '2022-05-18 11:47:39.731971',
    NULL,
    'fedc508c-07b3-4311-b5eb-36cfdd582375',
    NULL,
    NULL
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    20,
    NULL,
    NULL,
    '2022-05-18 13:31:40',
    1,
    '2022-05-18 13:31:40.263425',
    '2022-05-18 13:31:40.263425',
    NULL,
    'd5f58180-04d2-4efc-a6f4-65d1fa13189a',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTI4NjA5MDAsImV4cCI6MTY1MzI5MjkwMCwiYXVkIjoiYWNjZXNzX3Rva2VuIiwic3ViIjoiZDVmNTgxODAtMDRkMi00ZWZjLWE2ZjQtNjVkMWZhMTMxODlhIn0.9jKOD7WmYgceOILHxGOyfAF1QxRSL3A2UZGZLFaMpHc',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTI4NjA5MDAsImV4cCI6MTY1MzcyNDkwMCwiYXVkIjoicmVmcmVzaF90b2tlbiIsInN1YiI6ImQ1ZjU4MTgwLTA0ZDItNGVmYy1hNmY0LTY1ZDFmYTEzMTg5YSJ9.8b3rtSxNN0NKVNpjW48BJwqr63TIoB-MyWwsOFCwHzw'
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    21,
    NULL,
    NULL,
    '2022-05-18 13:32:38',
    1,
    '2022-05-18 13:32:37.535142',
    '2022-05-18 13:32:37.535142',
    NULL,
    '5cc63e35-5f8c-4077-885c-30aff474e773',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTI4NjA5NTcsImV4cCI6MTY1MzI5Mjk1NywiYXVkIjoiYWNjZXNzX3Rva2VuIiwic3ViIjoiNWNjNjNlMzUtNWY4Yy00MDc3LTg4NWMtMzBhZmY0NzRlNzczIn0.pj62H6x1TvG1PGMyRuzb5gDE3l3oWAWht3rxmqnI7Io',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTI4NjA5NTcsImV4cCI6MTY1MzcyNDk1NywiYXVkIjoicmVmcmVzaF90b2tlbiIsInN1YiI6IjVjYzYzZTM1LTVmOGMtNDA3Ny04ODVjLTMwYWZmNDc0ZTc3MyJ9.nDbWUyP28BXywrJpW9JGGFznR-ZUcBdjdd_XWXILgTU'
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    22,
    NULL,
    NULL,
    '2022-05-18 13:33:32',
    1,
    '2022-05-18 13:33:31.810629',
    '2022-05-18 13:33:31.810629',
    NULL,
    '908345c6-0808-45b9-b977-8ee090f5c2f6',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTI4NjEwMTEsImV4cCI6MTY1MzI5MzAxMSwiYXVkIjoiYWNjZXNzX3Rva2VuIiwic3ViIjoiOTA4MzQ1YzYtMDgwOC00NWI5LWI5NzctOGVlMDkwZjVjMmY2In0.UYogVKzCpslQP7Kn3hWfOz8n1Eeb2uOLiVH2DOJAfBs',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTI4NjEwMTEsImV4cCI6MTY1MzcyNTAxMSwiYXVkIjoicmVmcmVzaF90b2tlbiIsInN1YiI6IjkwODM0NWM2LTA4MDgtNDViOS1iOTc3LThlZTA5MGY1YzJmNiJ9.suxDkVWSM3lE2iP2H5DPdn3E6kaL7o28nZ2Dua_kKY4'
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    23,
    NULL,
    NULL,
    '2022-05-18 13:33:54',
    1,
    '2022-05-18 13:33:54.429771',
    '2022-05-18 13:33:54.429771',
    NULL,
    '6f40a6c6-7557-42fc-ac3a-33333585530d',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTI4NjEwMzQsImV4cCI6MTY1MzI5MzAzNCwiYXVkIjoiYWNjZXNzX3Rva2VuIiwic3ViIjoiNmY0MGE2YzYtNzU1Ny00MmZjLWFjM2EtMzMzMzM1ODU1MzBkIn0.FRRPSw5f_ucS8JR6sOIWugnHs_0JkGgCJg2_49E5xKY',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTI4NjEwMzQsImV4cCI6MTY1MzcyNTAzNCwiYXVkIjoicmVmcmVzaF90b2tlbiIsInN1YiI6IjZmNDBhNmM2LTc1NTctNDJmYy1hYzNhLTMzMzMzNTg1NTMwZCJ9.XVDB0CpCxDyXqwUeSgDISSEyGwMi66p1OZggskaTRaQ'
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    24,
    NULL,
    NULL,
    '2022-05-18 13:35:05',
    1,
    '2022-05-18 13:35:04.540030',
    '2022-05-18 13:35:04.540030',
    NULL,
    'df4f5541-cad0-46bf-8648-da321b6bb8b2',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTI4NjExMDQsImV4cCI6MTY1MzI5MzEwNCwiYXVkIjoiYWNjZXNzX3Rva2VuIiwic3ViIjoiZGY0ZjU1NDEtY2FkMC00NmJmLTg2NDgtZGEzMjFiNmJiOGIyIn0.rhtzoL__blsJLHWRVKhg1eiO6-IEStDavu-D7gnh-nc',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTI4NjExMDQsImV4cCI6MTY1MzcyNTEwNCwiYXVkIjoicmVmcmVzaF90b2tlbiIsInN1YiI6ImRmNGY1NTQxLWNhZDAtNDZiZi04NjQ4LWRhMzIxYjZiYjhiMiJ9.iLidQLa3Jj36Y4FSa0i7AHFUB1O3LG00YA1YT5QrUPI'
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    25,
    NULL,
    NULL,
    '2022-05-18 13:35:34',
    1,
    '2022-05-18 13:35:34.090810',
    '2022-05-18 13:35:34.090810',
    NULL,
    'dba7e817-66b8-467a-b7ca-7e021b42be79',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTI4NjExMzQsImV4cCI6MTY1MzI5MzEzNCwiYXVkIjoiYWNjZXNzX3Rva2VuIiwic3ViIjoiZGJhN2U4MTctNjZiOC00NjdhLWI3Y2EtN2UwMjFiNDJiZTc5In0.tok-T4l7qytQ_9wX7hW0Iav6Swq88sYJLPh4Db0xez8',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTI4NjExMzQsImV4cCI6MTY1MzcyNTEzNCwiYXVkIjoicmVmcmVzaF90b2tlbiIsInN1YiI6ImRiYTdlODE3LTY2YjgtNDY3YS1iN2NhLTdlMDIxYjQyYmU3OSJ9.SzCcqbRsbo0w_QWDSjbtHAklFonpUwW4TUqdvMxQam8'
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    26,
    NULL,
    NULL,
    '2022-05-18 13:37:32',
    1,
    '2022-05-18 13:37:32.133091',
    '2022-05-18 13:37:32.133091',
    NULL,
    'bf4eb2e6-ae5a-4ef3-a5ac-f3e117dc1ff3',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTI4NjEyNTIsImV4cCI6MTY1MzI5MzI1MiwiYXVkIjoiYWNjZXNzX3Rva2VuIiwic3ViIjoiYmY0ZWIyZTYtYWU1YS00ZWYzLWE1YWMtZjNlMTE3ZGMxZmYzIn0.uyeaD-GOUjx0v2_OicT7E6A-V1hKavkCvOYjPKZwY58',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTI4NjEyNTIsImV4cCI6MTY1MzcyNTI1MiwiYXVkIjoicmVmcmVzaF90b2tlbiIsInN1YiI6ImJmNGViMmU2LWFlNWEtNGVmMy1hNWFjLWYzZTExN2RjMWZmMyJ9.lmA9ElAayBQySZyYqADcHdiRPTyZJz8RfL1xzqqUH2E'
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    27,
    NULL,
    NULL,
    '2022-05-18 18:51:43',
    1,
    '2022-05-18 18:51:43.094289',
    '2022-05-18 18:51:43.094289',
    NULL,
    '95ed56a5-d085-4210-8995-f818da5d8485',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTI4ODAxMDMsImV4cCI6MTY1MzMxMjEwMywiYXVkIjoiYWNjZXNzX3Rva2VuIiwic3ViIjoiOTVlZDU2YTUtZDA4NS00MjEwLTg5OTUtZjgxOGRhNWQ4NDg1In0.-qXA6sfbf4rttGIszI6fl-ngg9CNzG4dnMO7bKm44zw',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTI4ODAxMDMsImV4cCI6MTY1Mzc0NDEwMywiYXVkIjoicmVmcmVzaF90b2tlbiIsInN1YiI6Ijk1ZWQ1NmE1LWQwODUtNDIxMC04OTk1LWY4MThkYTVkODQ4NSJ9.mGUtCoxi8PmmElbpOFSAg9p2dvTn3He1IDoaN-xzG7s'
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    28,
    'fBZwIDpWSYadEnW3SOx_Zx:APA91bF9aBINhd7HZVzo0UkbwCciPzyCTWA-5nATTRfNLxiVCqasqUg987Jhe7TEX7YG5FU8sUxoruAAAGAxWh61yWSRTrAao_VSnY4H1QlHPW1kbcAlSepzKEQngTNTikeROjPnzN_p',
    'A',
    '2022-06-07 15:21:23',
    94,
    '2022-05-19 11:24:54.802618',
    '2022-06-07 15:21:23.000000',
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTQ1OTU0ODMsImV4cCI6MTY1NzE4NzQ4MywiYXVkIjoiYWNjZXNzX3Rva2VuIiwic3ViIjoiN2RmNmExMjMtNzA5My00OTUwLWE4NmUtMTQ5OTQ0MTg1N2EwIn0.3ov6JP0TS_7Zv6W868HbKU_RIcVH5im79USsE3L7e54',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTQ1OTU0ODMsImV4cCI6MTY1ODA1MTQ4MywiYXVkIjoicmVmcmVzaF90b2tlbiIsInN1YiI6IjdkZjZhMTIzLTcwOTMtNDk1MC1hODZlLTE0OTk0NDE4NTdhMCJ9.TpAmNAve3WM1VrJoTNciMAN3l7RflxAl2OwbrRRUGww'
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    29,
    NULL,
    NULL,
    '2022-06-08 12:22:31',
    2,
    '2022-05-19 17:24:27.757284',
    '2022-06-08 12:22:31.000000',
    NULL,
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTQ2NzExNTEsImV4cCI6MTY1NzI2MzE1MSwiYXVkIjoiYWNjZXNzX3Rva2VuIiwic3ViIjoiNTA0NTIxNWItZjc1MC00NGZkLTgzZWYtZjlhZjU5YTNmYzFlIn0.b4cu5yxOfB-MrtQvXY3rlxC2qq729tijU3ZtRgCEMR8',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTQ2NzExNTEsImV4cCI6MTY1ODEyNzE1MSwiYXVkIjoicmVmcmVzaF90b2tlbiIsInN1YiI6IjUwNDUyMTViLWY3NTAtNDRmZC04M2VmLWY5YWY1OWEzZmMxZSJ9.d9n__-GoVZXZTZwAOP4M3x9ncmh0lFZmO78eas7IuA0'
  );
INSERT INTO
  `tokens` (
    `id`,
    `device_id`,
    `device_type`,
    `last_login`,
    `login_count`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `user_id`,
    `access_token`,
    `refresh_token`
  )
VALUES
  (
    30,
    NULL,
    NULL,
    '2022-06-06 16:21:45',
    1,
    '2022-06-06 16:21:44.920232',
    '2022-06-06 16:21:44.920232',
    NULL,
    '39fb15b9-d807-4725-b85c-c4fcca507a43',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTQ1MTI3MDQsImV4cCI6MTY1NzEwNDcwNCwiYXVkIjoiYWNjZXNzX3Rva2VuIiwic3ViIjoiMzlmYjE1YjktZDgwNy00NzI1LWI4NWMtYzRmY2NhNTA3YTQzIn0.8vhyaRKZWGu3Sgg6Lyeu4LDleS-pNsjlWEADTDHuNPM',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NTQ1MTI3MDQsImV4cCI6MTY1Nzk2ODcwNCwiYXVkIjoicmVmcmVzaF90b2tlbiIsInN1YiI6IjM5ZmIxNWI5LWQ4MDctNDcyNS1iODVjLWM0ZmNjYTUwN2E0MyJ9.MfFfNCBdToHnO2rdHW0iTPGAAxY_8n-z-MsQic5zv3M'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: user_addresses
# ------------------------------------------------------------

INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    1,
    'Asgar Bhojani',
    'GUHARAT',
    '+91',
    '9974034949',
    'COUNTY',
    'AHME',
    'INDIA',
    'Home',
    0,
    'B+405 COUNTY  AHME GUHARAT HELLO INDIA 360055',
    1,
    '2022-05-11 11:22:18.410862',
    '2022-05-30 16:08:20.000000',
    '2022-05-11 12:37:21.000000',
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    2,
    'Shdbdb',
    'GUHARAT',
    '+91',
    '9974034949',
    'COUNTY',
    'AHME',
    'INDIA',
    'Hahahb',
    0,
    'B+405 COUNTY  AHME GUHARAT HELLO INDIA 360055',
    1,
    '2022-05-11 11:50:40.417775',
    '2022-05-30 16:08:20.000000',
    '2022-05-11 12:37:18.000000',
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    5,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    3,
    'SagRa',
    'GUHARAT',
    '+91',
    '9974034949',
    'COUNTY',
    'AHME',
    'INDIA',
    'Hsvv',
    0,
    'B+405 COUNTY  AHME GUHARAT HELLO INDIA 360055',
    1,
    '2022-05-11 12:37:58.117630',
    '2022-05-30 16:08:20.000000',
    '2022-05-11 12:38:46.000000',
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    5,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    4,
    'Asgar',
    'GUHARAT',
    '+91',
    '9974034949',
    'COUNTY',
    'AHME',
    'INDIA',
    'Bhojani- HIOME',
    0,
    'B+405 COUNTY  AHME GUHARAT HELLO INDIA 360055',
    1,
    '2022-05-11 12:39:16.191334',
    '2022-05-30 16:08:20.000000',
    '2022-05-11 12:40:35.000000',
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    4,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    5,
    'test',
    'test',
    '+1',
    '9999998889',
    'Albany',
    'NY',
    'USA',
    'test',
    0,
    'test',
    1,
    '2022-05-11 12:41:39.434861',
    '2022-05-30 16:08:20.000000',
    '2022-05-19 14:57:42.000000',
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '200',
    '20.331',
    '70.2222022255'
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    6,
    'test',
    'test',
    '+1',
    '9999998889',
    'Albany',
    'NY',
    'USA',
    'test',
    0,
    'test',
    1,
    '2022-05-11 16:42:39.076370',
    '2022-05-11 16:45:07.000000',
    NULL,
    1,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    NULL,
    '200',
    '20.3333',
    '70.22'
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    7,
    'test',
    'test',
    '+1',
    '9999998889',
    'Albany',
    'NY',
    'USA',
    'test',
    0,
    'test',
    1,
    '2022-05-11 16:43:48.495419',
    '2022-05-11 16:45:07.000000',
    NULL,
    1,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    NULL,
    '200',
    '20.3333',
    '70.2211'
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    8,
    'test',
    'test',
    '+1',
    '9999998889',
    'Albany',
    'NY',
    'USA',
    'test',
    0,
    'test',
    1,
    '2022-05-11 16:44:25.620881',
    '2022-05-11 16:45:07.000000',
    NULL,
    1,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    NULL,
    '200',
    '20.3333323',
    '70.2211'
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    9,
    'test',
    'test',
    '+1',
    '9999998889',
    'Albany',
    'NY',
    'USA',
    'test',
    0,
    'test',
    1,
    '2022-05-11 16:44:31.960775',
    '2022-05-11 16:45:07.000000',
    NULL,
    1,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    NULL,
    '200',
    '20.3333323',
    '70.2211'
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    10,
    'test',
    'test',
    '+1',
    '9999998889',
    'Albany',
    'NY',
    'USA',
    'test',
    1,
    'test',
    1,
    '2022-05-11 16:45:07.096349',
    '2022-05-11 16:45:07.096349',
    NULL,
    1,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    NULL,
    '200',
    '20.333332312',
    '70.2211'
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    11,
    'Asgar Bhojani',
    'GUHARAT',
    '+91',
    '9974034949',
    'COUNTY',
    'AHME',
    'INDIA',
    'OFFICE/WORK',
    0,
    'B+405 COUNTY  AHME GUHARAT HELLO INDIA 360055',
    1,
    '2022-05-11 17:10:13.897936',
    '2022-05-30 16:08:20.000000',
    '2022-05-11 17:23:48.000000',
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    5,
    'B+40599',
    '0.000010710982505157673',
    '-0.000010728836059570312'
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    12,
    'CHECKING DEFAULT',
    'GUHARAT',
    '+91',
    '9974034949',
    'COUNTY',
    'AHME',
    'INDIA',
    'OFFICE/WORK/HIME',
    0,
    'B+405 COUNTY  AHME GUHARAT HELLO INDIA 360055',
    1,
    '2022-05-11 17:13:20.692452',
    '2022-05-30 16:08:20.000000',
    '2022-05-11 17:23:06.000000',
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    4,
    'B+4055555',
    '0.0000066943640657513015',
    '-0.000006705522537342468'
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    13,
    'test',
    'test',
    '+1',
    '9999998889',
    'Albany',
    'NY',
    'USA',
    'test',
    0,
    'test',
    1,
    '2022-05-11 17:15:54.291916',
    '2022-05-30 16:08:20.000000',
    '2022-05-19 14:57:52.000000',
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    NULL,
    '200',
    '20.333',
    '70.2222022255'
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    14,
    'Safdsa',
    'GUHARAT',
    '+91',
    '9974034949',
    'COUNTY',
    'AHME',
    'INDIA',
    'Ds',
    0,
    'B+405 COUNTY  AHME GUHARAT HELLO INDIA 360055',
    1,
    '2022-05-13 15:17:34.328167',
    '2022-05-30 16:08:20.000000',
    '2022-05-19 14:56:07.000000',
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    9,
    'B+405',
    '37.78583404189288',
    '-122.40641679614782'
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    15,
    'ASGAR',
    'GUHARAT',
    '+91',
    '9974034949',
    'COUNTY',
    'AHME',
    'INDIA',
    'HIME',
    0,
    'B+405 COUNTY  AHME GUHARAT HELLO INDIA 360055',
    1,
    '2022-05-19 14:39:42.515254',
    '2022-05-30 16:08:20.000000',
    '2022-05-19 14:58:19.000000',
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    8,
    'B+405',
    '1.3958946582033813',
    '0.22218715399503708'
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    16,
    'Asgar',
    'GUHARAT',
    '+91',
    '9974034949',
    'COUNTY',
    'AHME',
    'INDIA',
    'HO<R',
    1,
    'B+405 COUNTY  AHME GUHARAT HELLO INDIA 360055',
    1,
    '2022-05-19 14:59:42.095741',
    '2022-05-30 16:08:20.000000',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    4,
    'B+405',
    '37.42359608248859',
    '-122.0880457945168'
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    17,
    'Sfdsfds',
    'GUHARAT',
    '+91',
    '9974034949',
    'COUNTY',
    'AHME',
    'INDIA',
    'Dfsdfds',
    0,
    'B+405 COUNTY  AHME GUHARAT HELLO INDIA 360055',
    1,
    '2022-05-19 15:00:57.635568',
    '2022-05-30 16:08:20.000000',
    '2022-05-19 17:14:11.000000',
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    4,
    'B+405sfds',
    '37.78645513109182',
    '-122.41103991866112'
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    18,
    'test',
    'test',
    '+1',
    '9999998889',
    'Albany',
    'NY',
    'USA',
    'test',
    0,
    'test',
    1,
    '2022-05-19 17:25:19.656437',
    '2022-06-08 12:24:22.000000',
    NULL,
    1,
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    NULL,
    '200',
    '20.333332312',
    '70.2211'
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    19,
    'test',
    'test',
    '+1',
    '9999998889',
    'Albany',
    'NY',
    'USA',
    'test',
    0,
    'test',
    1,
    '2022-05-19 17:25:49.657986',
    '2022-06-08 12:24:22.000000',
    NULL,
    1,
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    NULL,
    '200',
    '20.33333231',
    '70.2211'
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    20,
    'test',
    'test',
    '+1',
    '9999998889',
    'Albany',
    'NY',
    'USA',
    'test',
    0,
    'test',
    1,
    '2022-05-19 17:26:02.898893',
    '2022-06-08 12:24:22.000000',
    NULL,
    1,
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    NULL,
    '200',
    '10.2121',
    '70.12165'
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    21,
    'Bhbhbhbhjb',
    'GUHARAT',
    '+91',
    '9974034949',
    'COUNTY',
    'AHME',
    'INDIA',
    'Mm,nm,n',
    0,
    'B+405 COUNTY  AHME GUHARAT HELLO INDIA 360055',
    1,
    '2022-05-19 17:48:52.623577',
    '2022-05-30 16:08:20.000000',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    11,
    'B+405',
    '37.41198552352898',
    '-122.08933526650071'
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    22,
    'Agsar',
    'GUHARAT',
    '+91',
    '9974034949',
    'COUNTY',
    'AHME',
    'INDIA',
    'TESTIG',
    0,
    'B+405 COUNTY  AHME GUHARAT HELLO INDIA 360055',
    1,
    '2022-05-27 13:16:03.047246',
    '2022-05-30 16:08:20.000000',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    5,
    'B+405',
    '37.42915574235475',
    '-122.09915047511458'
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    23,
    'sfsdf',
    'GUHARAT',
    '+91',
    '9974034949',
    'COUNTY',
    'AHME',
    'INDIA',
    'sdfdsf',
    0,
    'B+405 COUNTY  AHME GUHARAT HELLO INDIA 360055',
    1,
    '2022-05-27 18:28:38.902559',
    '2022-05-30 16:08:20.000000',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    '7df6a123-7093-4950-a86e-1499441857a0',
    5,
    'B+405',
    '37.430806973101284',
    '-122.09953872486949'
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    24,
    'test',
    'test',
    '+1',
    '9999998889',
    'Albany',
    'NY',
    'USA',
    'test',
    1,
    'test',
    1,
    '2022-06-06 16:23:09.434675',
    '2022-06-06 16:23:09.434675',
    NULL,
    1,
    '39fb15b9-d807-4725-b85c-c4fcca507a43',
    '39fb15b9-d807-4725-b85c-c4fcca507a43',
    '39fb15b9-d807-4725-b85c-c4fcca507a43',
    10,
    '200',
    '20.333332312',
    '70.2211'
  );
INSERT INTO
  `user_addresses` (
    `id`,
    `full_name`,
    `state`,
    `country_code`,
    `phone_number`,
    `county`,
    `city`,
    `country`,
    `address_type`,
    `is_default`,
    `address`,
    `status`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `zip_code_id`,
    `house_no`,
    `lat`,
    `long`
  )
VALUES
  (
    25,
    'test',
    'test',
    '+1',
    '9999998889',
    'Albany',
    'NY',
    'USA',
    'test',
    1,
    'test',
    1,
    '2022-06-08 12:24:22.174490',
    '2022-06-08 12:24:22.174490',
    NULL,
    1,
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    4,
    '200',
    '20.333',
    '70.2211'
  );

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
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `no_of_orders`
  )
VALUES
  (
    1,
    0,
    0,
    0,
    0,
    '2022-06-08 10:33:00.538937',
    '2022-06-08 10:33:00.538937',
    NULL,
    NULL,
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    0
  );
INSERT INTO
  `user_order_statistics` (
    `id`,
    `no_of_order_delivered`,
    `no_of_order_cancel`,
    `no_of_order_ongoing`,
    `no_of_order_passed`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `no_of_orders`
  )
VALUES
  (
    2,
    0,
    0,
    0,
    0,
    '2022-06-08 12:22:31.084169',
    '2022-06-08 12:22:31.084169',
    NULL,
    NULL,
    NULL,
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    0
  );
INSERT INTO
  `user_order_statistics` (
    `id`,
    `no_of_order_delivered`,
    `no_of_order_cancel`,
    `no_of_order_ongoing`,
    `no_of_order_passed`,
    `created_at`,
    `updated_at`,
    `created_by`,
    `updated_by`,
    `deleted_at`,
    `user_id`,
    `no_of_orders`
  )
VALUES
  (
    3,
    0,
    0,
    0,
    0,
    '2022-06-09 16:45:37.892806',
    '2022-06-09 16:45:37.892806',
    NULL,
    NULL,
    NULL,
    '5e90a908-a191-4f37-92c3-2a613edcc2f8',
    0
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: user_subscription
# ------------------------------------------------------------

INSERT INTO
  `user_subscription` (
    `id`,
    `start_date`,
    `end_date`,
    `price`,
    `payment_response`,
    `stripe_payment_intent_id`,
    `platform`,
    `latest_receipt`,
    `cancelled_date`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `status`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `membership_plan_id`,
    `membership_plan_price_id`
  )
VALUES
  (
    3,
    '2022-05-12 00:00:00',
    '2022-06-12 00:00:00',
    5,
    NULL,
    'pi_3KyUwESBJPMsjmRO0tfKofwS',
    'stripe',
    'https://pay.stripe.com/receipts/acct_1IbOxSSBJPMsjmRO/ch_3KyUwESBJPMsjmRO0dK6df2S/rcpt_LfqdctcPioU1ePZRWizwpGFXobwGvXk',
    NULL,
    '2022-05-12 11:21:49.942091',
    '2022-06-12 00:00:01.000000',
    NULL,
    0,
    2,
    NULL,
    NULL,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    1,
    1
  );
INSERT INTO
  `user_subscription` (
    `id`,
    `start_date`,
    `end_date`,
    `price`,
    `payment_response`,
    `stripe_payment_intent_id`,
    `platform`,
    `latest_receipt`,
    `cancelled_date`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `status`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `membership_plan_id`,
    `membership_plan_price_id`
  )
VALUES
  (
    4,
    '2022-05-26 00:00:00',
    '2022-06-26 17:50:28',
    5,
    NULL,
    'pi_3L3fg0SBJPMsjmRO1kHlX7wp',
    'stripe',
    'https://pay.stripe.com/receipts/acct_1IbOxSSBJPMsjmRO/ch_3L3fg0SBJPMsjmRO1rrgJRSX/rcpt_LlC460K6gzcgOeSBmPVHvPLD7HNly2w',
    NULL,
    '2022-05-26 17:50:27.972993',
    '2022-05-26 17:50:30.000000',
    NULL,
    0,
    0,
    NULL,
    NULL,
    '0d8caf5c-6593-4c26-bff1-b2dadd12ef3d',
    1,
    1
  );
INSERT INTO
  `user_subscription` (
    `id`,
    `start_date`,
    `end_date`,
    `price`,
    `payment_response`,
    `stripe_payment_intent_id`,
    `platform`,
    `latest_receipt`,
    `cancelled_date`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `status`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `membership_plan_id`,
    `membership_plan_price_id`
  )
VALUES
  (
    5,
    '2022-06-03 00:00:00',
    '2022-07-03 12:33:33',
    10,
    NULL,
    'pi_3L6UXgSBJPMsjmRO0K681yAW',
    'stripe',
    'https://pay.stripe.com/receipts/acct_1IbOxSSBJPMsjmRO/ch_3L6UXgSBJPMsjmRO0d2D2S6a/rcpt_Lo6lEEPwKSbXEJ1DomdeCVdZkFl23Ml',
    NULL,
    '2022-06-03 12:33:32.688704',
    '2022-06-03 13:34:20.000000',
    NULL,
    1,
    2,
    NULL,
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    1,
    1
  );
INSERT INTO
  `user_subscription` (
    `id`,
    `start_date`,
    `end_date`,
    `price`,
    `payment_response`,
    `stripe_payment_intent_id`,
    `platform`,
    `latest_receipt`,
    `cancelled_date`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `is_active`,
    `status`,
    `created_by`,
    `updated_by`,
    `user_id`,
    `membership_plan_id`,
    `membership_plan_price_id`
  )
VALUES
  (
    6,
    '2022-06-03 00:00:00',
    '2023-06-03 12:36:59',
    5,
    NULL,
    'pi_3L6Ub1SBJPMsjmRO03y9fLLA',
    'stripe',
    'https://pay.stripe.com/receipts/acct_1IbOxSSBJPMsjmRO/ch_3L6Ub1SBJPMsjmRO0ZEMvPWG/rcpt_Lo6ot8uwDXOqctXTC3bvE8bfAINdY0m',
    NULL,
    '2022-06-03 12:36:58.953296',
    '2022-06-03 13:38:05.000000',
    NULL,
    1,
    2,
    NULL,
    NULL,
    '7df6a123-7093-4950-a86e-1499441857a0',
    2,
    2
  );

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
    'ySHif9QtIPdiptHtJZ1lZolOlO3Y1Eci',
    1,
    '2022-04-27 14:43:26.865841',
    '2022-04-27 14:43:26.865841',
    NULL,
    1,
    '06681fd4-fe71-4963-b9ce-2c2aeed2e298'
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
    '2022-04-27 14:43:26.867380',
    '2022-04-27 14:43:26.867380',
    NULL,
    1,
    '06681fd4-fe71-4963-b9ce-2c2aeed2e298'
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
    '2022-04-27 15:28:30.609391',
    '2022-04-27 15:28:30.609391',
    NULL,
    1,
    '761a35de-a2ca-4e4b-8784-08b94f2e5875'
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
    '2022-04-27 15:28:30.610866',
    '2022-04-27 15:28:30.610866',
    NULL,
    1,
    '761a35de-a2ca-4e4b-8784-08b94f2e5875'
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
    5,
    1,
    NULL,
    1,
    '2022-04-27 15:30:11.531560',
    '2022-04-27 15:30:11.531560',
    NULL,
    1,
    'a64037fb-229b-4090-9c3b-6b49e449f079'
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
    6,
    1,
    NULL,
    2,
    '2022-04-27 15:30:11.533221',
    '2022-04-27 15:30:11.533221',
    NULL,
    1,
    'a64037fb-229b-4090-9c3b-6b49e449f079'
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
    7,
    1,
    NULL,
    1,
    '2022-04-27 15:31:15.799739',
    '2022-04-27 15:31:15.799739',
    NULL,
    1,
    'd319c66f-1f6f-4b3b-8c91-e19d9befb705'
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
    8,
    1,
    NULL,
    2,
    '2022-04-27 15:31:15.800973',
    '2022-04-27 15:31:15.800973',
    NULL,
    1,
    'd319c66f-1f6f-4b3b-8c91-e19d9befb705'
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
    9,
    1,
    NULL,
    1,
    '2022-04-27 15:31:15.867468',
    '2022-04-27 15:31:15.867468',
    NULL,
    1,
    '8fc2ab89-5bcd-4486-aa82-3a931ea6e32a'
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
    10,
    1,
    NULL,
    2,
    '2022-04-27 15:31:15.868800',
    '2022-04-27 15:31:15.868800',
    NULL,
    1,
    '8fc2ab89-5bcd-4486-aa82-3a931ea6e32a'
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
    11,
    1,
    NULL,
    1,
    '2022-04-27 15:39:45.637633',
    '2022-04-27 15:39:45.637633',
    NULL,
    1,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7'
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
    12,
    0,
    NULL,
    2,
    '2022-04-27 15:39:45.641338',
    '2022-05-27 19:12:36.000000',
    NULL,
    1,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7'
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
    13,
    1,
    NULL,
    2,
    '2022-04-27 16:21:56.469832',
    '2022-04-27 16:21:56.469832',
    NULL,
    1,
    '2334499c-4748-4027-8aff-19674e5f1187'
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
    14,
    1,
    NULL,
    1,
    '2022-04-27 16:21:56.475107',
    '2022-04-27 16:21:56.475107',
    NULL,
    1,
    '2334499c-4748-4027-8aff-19674e5f1187'
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
    15,
    0,
    'FJb8ikV6LYQUu7IyK9L5KbjwMs7SvjZJ',
    1,
    '2022-04-27 16:28:42.188107',
    '2022-04-27 16:28:42.188107',
    NULL,
    1,
    '12c920b8-392c-4cbe-afef-5951e541b4ca'
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
    16,
    1,
    NULL,
    2,
    '2022-04-27 16:28:42.194480',
    '2022-04-27 16:28:42.194480',
    NULL,
    1,
    '12c920b8-392c-4cbe-afef-5951e541b4ca'
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
    17,
    0,
    'j1sudxZrqWzl0I3Ujf7uLQZIkuORdJgc',
    1,
    '2022-04-27 17:55:42.638030',
    '2022-04-27 17:55:42.638030',
    NULL,
    1,
    'c842ba3f-c326-45eb-95f7-f30dbbc24c65'
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
    18,
    1,
    NULL,
    2,
    '2022-04-27 17:55:42.641393',
    '2022-04-27 17:55:42.641393',
    NULL,
    1,
    'c842ba3f-c326-45eb-95f7-f30dbbc24c65'
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
    19,
    0,
    'OffCD5QNjXqxshb7aeo3xeGwVSjTq6wj',
    1,
    '2022-04-27 17:56:19.168533',
    '2022-04-27 17:56:19.168533',
    NULL,
    1,
    '8d45b1da-30b6-4e2e-8a10-43136f6e1785'
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
    20,
    0,
    NULL,
    2,
    '2022-04-27 17:56:19.172041',
    '2022-05-02 10:10:31.000000',
    NULL,
    1,
    '8d45b1da-30b6-4e2e-8a10-43136f6e1785'
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
    21,
    0,
    'cqiYAWTszwMsjAzOZ87hxIDnNQgK2VAx',
    1,
    '2022-04-27 17:56:45.934905',
    '2022-04-27 17:56:45.934905',
    NULL,
    1,
    'd835a4ec-3f76-4293-a870-3e3212a4019b'
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
    22,
    0,
    NULL,
    2,
    '2022-04-27 17:56:45.937974',
    '2022-05-02 16:54:31.000000',
    NULL,
    1,
    'd835a4ec-3f76-4293-a870-3e3212a4019b'
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
    23,
    0,
    'N2TV7WANWpNOveJFZFrxnNAOg1Yd7Mw7',
    1,
    '2022-04-27 17:58:29.321773',
    '2022-04-27 17:58:29.321773',
    NULL,
    1,
    '5fe4927c-e313-44cf-9ab8-20a95b52d140'
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
    24,
    0,
    NULL,
    2,
    '2022-04-27 17:58:29.325015',
    '2022-05-02 10:09:53.000000',
    NULL,
    1,
    '5fe4927c-e313-44cf-9ab8-20a95b52d140'
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
    25,
    1,
    NULL,
    1,
    '2022-04-28 10:08:36.777645',
    '2022-04-28 10:08:36.777645',
    NULL,
    1,
    '80714615-3417-4a38-a540-104da6894149'
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
    26,
    1,
    NULL,
    2,
    '2022-04-28 10:08:36.777645',
    '2022-04-28 10:08:36.777645',
    NULL,
    1,
    '80714615-3417-4a38-a540-104da6894149'
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
    27,
    1,
    NULL,
    1,
    '2022-04-28 10:15:34.542355',
    '2022-04-28 10:15:34.542355',
    NULL,
    1,
    'b53e33db-e131-425a-a619-f41d98317a00'
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
    28,
    1,
    NULL,
    2,
    '2022-04-28 10:15:34.543960',
    '2022-04-28 10:15:34.543960',
    NULL,
    1,
    'b53e33db-e131-425a-a619-f41d98317a00'
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
    29,
    1,
    NULL,
    1,
    '2022-04-28 10:19:44.463738',
    '2022-04-28 10:19:44.463738',
    NULL,
    1,
    '037a9a07-3145-4133-bc9d-0989b7ee8580'
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
    30,
    1,
    NULL,
    2,
    '2022-04-28 10:19:44.465540',
    '2022-04-28 10:19:44.465540',
    NULL,
    1,
    '037a9a07-3145-4133-bc9d-0989b7ee8580'
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
    31,
    1,
    NULL,
    1,
    '2022-04-28 10:29:46.743236',
    '2022-04-28 10:29:46.743236',
    NULL,
    1,
    '6455b11f-2c5e-40ea-94c7-74849f817c25'
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
    32,
    1,
    NULL,
    2,
    '2022-04-28 10:29:46.744650',
    '2022-04-28 10:29:46.744650',
    NULL,
    1,
    '6455b11f-2c5e-40ea-94c7-74849f817c25'
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
    33,
    1,
    NULL,
    1,
    '2022-04-28 10:31:04.873154',
    '2022-04-28 10:31:04.873154',
    NULL,
    1,
    '7f6cd4d8-0f1d-4701-ad25-f91db93180a2'
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
    34,
    1,
    NULL,
    2,
    '2022-04-28 10:31:04.874648',
    '2022-04-28 10:31:04.874648',
    NULL,
    1,
    '7f6cd4d8-0f1d-4701-ad25-f91db93180a2'
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
    35,
    1,
    NULL,
    1,
    '2022-04-28 10:31:26.790437',
    '2022-04-28 10:31:26.790437',
    NULL,
    1,
    '2bc0cb6b-be1b-49c3-80ef-f4f8da9a1cac'
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
    36,
    1,
    NULL,
    2,
    '2022-04-28 10:31:26.791749',
    '2022-04-28 10:31:26.791749',
    NULL,
    1,
    '2bc0cb6b-be1b-49c3-80ef-f4f8da9a1cac'
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
    37,
    1,
    NULL,
    1,
    '2022-04-28 10:33:48.877117',
    '2022-04-28 10:33:48.877117',
    NULL,
    1,
    '326bacd0-0164-444b-8eef-500b44707825'
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
    38,
    1,
    NULL,
    2,
    '2022-04-28 10:33:48.878553',
    '2022-04-28 10:33:48.878553',
    NULL,
    1,
    '326bacd0-0164-444b-8eef-500b44707825'
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
    39,
    1,
    NULL,
    1,
    '2022-04-28 10:36:08.329908',
    '2022-04-28 10:36:08.329908',
    NULL,
    1,
    'bff668dc-c411-482c-81cb-64009918df9b'
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
    40,
    1,
    NULL,
    2,
    '2022-04-28 10:36:08.331902',
    '2022-04-28 10:36:08.331902',
    NULL,
    1,
    'bff668dc-c411-482c-81cb-64009918df9b'
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
    41,
    1,
    NULL,
    1,
    '2022-04-28 10:37:07.868993',
    '2022-04-28 10:37:07.868993',
    NULL,
    1,
    '86907473-69a5-4898-9d2a-e683d2d02565'
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
    42,
    1,
    NULL,
    2,
    '2022-04-28 10:37:07.870506',
    '2022-04-28 10:37:07.870506',
    NULL,
    1,
    '86907473-69a5-4898-9d2a-e683d2d02565'
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
    43,
    1,
    NULL,
    1,
    '2022-04-28 10:39:05.228747',
    '2022-04-28 10:39:05.228747',
    NULL,
    1,
    'd6a45750-e012-4809-8b59-0608945030b9'
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
    44,
    1,
    NULL,
    2,
    '2022-04-28 10:39:05.230133',
    '2022-04-28 10:39:05.230133',
    NULL,
    1,
    'd6a45750-e012-4809-8b59-0608945030b9'
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
    45,
    1,
    NULL,
    1,
    '2022-04-28 10:39:26.293430',
    '2022-04-28 10:39:26.293430',
    NULL,
    1,
    'bfde0d10-c1c1-4bd2-93fb-467439097d13'
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
    46,
    1,
    NULL,
    2,
    '2022-04-28 10:39:26.295154',
    '2022-04-28 10:39:26.295154',
    NULL,
    1,
    'bfde0d10-c1c1-4bd2-93fb-467439097d13'
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
    47,
    1,
    NULL,
    1,
    '2022-04-28 10:41:42.879337',
    '2022-04-28 10:41:42.879337',
    NULL,
    1,
    '75b869cd-3f2a-4eb8-ad88-90f9e6959eb4'
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
    48,
    1,
    NULL,
    2,
    '2022-04-28 10:41:42.880785',
    '2022-04-28 10:41:42.880785',
    NULL,
    1,
    '75b869cd-3f2a-4eb8-ad88-90f9e6959eb4'
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
    49,
    1,
    NULL,
    2,
    '2022-04-28 10:42:42.835718',
    '2022-04-28 10:42:42.835718',
    NULL,
    1,
    '8ba01fd1-6aaf-49db-8415-8cc11d93043a'
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
    50,
    1,
    NULL,
    1,
    '2022-04-28 10:42:42.838607',
    '2022-04-28 10:42:42.838607',
    NULL,
    1,
    '8ba01fd1-6aaf-49db-8415-8cc11d93043a'
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
    51,
    1,
    NULL,
    1,
    '2022-04-28 10:46:00.866939',
    '2022-04-28 10:46:00.866939',
    NULL,
    1,
    '2b1b9fef-0203-4aa7-b8e9-2a380decefa5'
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
    52,
    1,
    NULL,
    2,
    '2022-04-28 10:46:00.869366',
    '2022-04-28 10:46:00.869366',
    NULL,
    1,
    '2b1b9fef-0203-4aa7-b8e9-2a380decefa5'
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
    53,
    1,
    NULL,
    1,
    '2022-04-28 10:48:13.012723',
    '2022-04-28 10:48:13.012723',
    NULL,
    1,
    '1e033672-b8ea-47bb-9b8d-22662bb04026'
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
    54,
    1,
    NULL,
    2,
    '2022-04-28 10:48:13.015313',
    '2022-04-28 10:48:13.015313',
    NULL,
    1,
    '1e033672-b8ea-47bb-9b8d-22662bb04026'
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
    55,
    1,
    NULL,
    1,
    '2022-04-28 10:50:22.927073',
    '2022-04-28 10:50:22.927073',
    NULL,
    1,
    'bce88ea5-cc92-4fc8-b94f-ba90d62bd4d6'
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
    56,
    1,
    NULL,
    2,
    '2022-04-28 10:50:22.929001',
    '2022-04-28 10:50:22.929001',
    NULL,
    1,
    'bce88ea5-cc92-4fc8-b94f-ba90d62bd4d6'
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
    57,
    1,
    NULL,
    1,
    '2022-04-28 10:51:19.946497',
    '2022-04-28 10:51:19.946497',
    NULL,
    1,
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9'
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
    58,
    1,
    NULL,
    2,
    '2022-04-28 10:51:19.948537',
    '2022-04-28 10:51:19.948537',
    NULL,
    1,
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9'
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
    59,
    1,
    NULL,
    2,
    '2022-04-28 10:53:47.045974',
    '2022-04-28 10:53:47.045974',
    NULL,
    1,
    '7ce71cc2-a0da-40bb-9b30-2145f168d49c'
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
    60,
    1,
    NULL,
    1,
    '2022-04-28 10:53:47.046385',
    '2022-04-28 10:53:47.046385',
    NULL,
    1,
    '7ce71cc2-a0da-40bb-9b30-2145f168d49c'
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
    61,
    1,
    NULL,
    1,
    '2022-04-28 11:23:12.287675',
    '2022-04-28 11:23:12.287675',
    NULL,
    1,
    '44efaf40-4738-4681-8bb7-336fac2e3cd1'
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
    62,
    1,
    NULL,
    2,
    '2022-04-28 11:23:12.290491',
    '2022-04-28 11:23:12.290491',
    NULL,
    1,
    '44efaf40-4738-4681-8bb7-336fac2e3cd1'
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
    63,
    1,
    NULL,
    1,
    '2022-04-28 11:24:11.502199',
    '2022-04-28 11:24:11.502199',
    NULL,
    1,
    '561afdc9-bb80-4e09-80c0-6d7b47d112d0'
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
    64,
    1,
    NULL,
    2,
    '2022-04-28 11:24:11.503507',
    '2022-04-28 11:24:11.503507',
    NULL,
    1,
    '561afdc9-bb80-4e09-80c0-6d7b47d112d0'
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
    65,
    0,
    '3886',
    2,
    '2022-04-28 12:07:24.579018',
    '2022-05-05 13:17:03.000000',
    NULL,
    1,
    'e604ead9-2bf0-415a-a63b-be393e533e43'
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
    66,
    0,
    '9Z6ndYC0sVl9EmmapaUJxF86gUzALBDX',
    1,
    '2022-04-28 12:07:24.581417',
    '2022-04-28 12:07:24.581417',
    NULL,
    1,
    'e604ead9-2bf0-415a-a63b-be393e533e43'
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
    67,
    0,
    'my4DiS33J1LcBxbqttXcc1pNW2bh8d6p',
    1,
    '2022-04-28 12:08:17.040510',
    '2022-04-28 12:08:17.040510',
    NULL,
    1,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f'
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
    68,
    0,
    '4261',
    2,
    '2022-04-28 12:08:17.047182',
    '2022-05-20 12:28:37.000000',
    NULL,
    1,
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f'
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
    69,
    0,
    'vx0IhmQjOYZABjaakayBKSGXV9hL3boM',
    1,
    '2022-04-28 12:08:31.442095',
    '2022-04-28 12:08:31.442095',
    NULL,
    1,
    '47d16810-bea3-4a48-b1b5-33fb23b34156'
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
    70,
    0,
    '4314',
    2,
    '2022-04-28 12:08:31.445844',
    '2022-05-24 10:50:22.000000',
    NULL,
    1,
    '47d16810-bea3-4a48-b1b5-33fb23b34156'
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
    71,
    1,
    NULL,
    1,
    '2022-04-29 13:18:43.166175',
    '2022-04-29 13:18:43.166175',
    NULL,
    1,
    '3a9a1b62-4abb-44b3-b2c8-6026195c6ea5'
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
    72,
    1,
    NULL,
    2,
    '2022-04-29 13:18:43.168890',
    '2022-04-29 13:18:43.168890',
    NULL,
    1,
    '3a9a1b62-4abb-44b3-b2c8-6026195c6ea5'
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
    73,
    1,
    NULL,
    1,
    '2022-04-29 13:24:15.502278',
    '2022-04-29 13:24:15.502278',
    NULL,
    1,
    '6be90c25-7f58-4502-ab3c-44b742e221a4'
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
    74,
    1,
    NULL,
    2,
    '2022-04-29 13:24:15.504052',
    '2022-04-29 13:24:15.504052',
    NULL,
    1,
    '6be90c25-7f58-4502-ab3c-44b742e221a4'
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
    75,
    1,
    NULL,
    1,
    '2022-04-29 13:24:16.081039',
    '2022-04-29 13:24:16.081039',
    NULL,
    1,
    'db09859a-2123-4134-9137-7f9ef23b8c3e'
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
    76,
    1,
    NULL,
    2,
    '2022-04-29 13:24:16.083120',
    '2022-04-29 13:24:16.083120',
    NULL,
    1,
    'db09859a-2123-4134-9137-7f9ef23b8c3e'
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
    77,
    1,
    NULL,
    1,
    '2022-05-02 13:13:43.292443',
    '2022-05-02 13:13:43.292443',
    NULL,
    1,
    '6edea6c6-b8ad-45d6-bee9-928a8c599e30'
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
    78,
    1,
    NULL,
    2,
    '2022-05-02 13:13:43.294539',
    '2022-05-02 13:13:43.294539',
    NULL,
    1,
    '6edea6c6-b8ad-45d6-bee9-928a8c599e30'
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
    79,
    0,
    NULL,
    2,
    '2022-05-02 17:17:16.500804',
    '2022-05-19 17:50:49.000000',
    NULL,
    1,
    'bf0d038c-1b20-4f45-80b6-900049b9b892'
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
    80,
    0,
    '9HCPoZOQMElacXwf4D1UgH8Jnexp96Io',
    1,
    '2022-05-02 17:17:16.502643',
    '2022-05-02 17:17:16.502643',
    NULL,
    1,
    'bf0d038c-1b20-4f45-80b6-900049b9b892'
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
    81,
    0,
    '2926',
    2,
    '2022-05-04 17:18:53.657385',
    '2022-05-19 18:52:15.000000',
    NULL,
    1,
    'cadcaccf-9361-417d-abb8-4096c81b1ac8'
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
    82,
    0,
    '3R7zIdcgvOdThNhr2ImHx15376Y5634y',
    1,
    '2022-05-04 17:18:53.680359',
    '2022-05-04 17:18:53.680359',
    NULL,
    1,
    'cadcaccf-9361-417d-abb8-4096c81b1ac8'
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
    83,
    0,
    'tmwpHtFAwQMVjFKG6cF0z2VDoCCg6VnA',
    1,
    '2022-05-05 13:13:49.142773',
    '2022-05-05 13:13:49.142773',
    NULL,
    1,
    'c39e85d8-91c9-4097-86f9-f94ccc46b7b5'
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
    84,
    0,
    NULL,
    2,
    '2022-05-05 13:13:49.142377',
    '2022-05-17 16:47:45.000000',
    NULL,
    1,
    'c39e85d8-91c9-4097-86f9-f94ccc46b7b5'
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
    85,
    0,
    NULL,
    2,
    '2022-05-05 13:27:07.218053',
    '2022-05-19 17:50:44.000000',
    NULL,
    1,
    'd5216422-ccce-49ce-ab13-b5331adbba02'
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
    86,
    0,
    'hJW2I9gVnvQADMuFb3bchzxLyscSnMYD',
    1,
    '2022-05-05 13:27:07.216277',
    '2022-05-05 13:27:07.216277',
    NULL,
    1,
    'd5216422-ccce-49ce-ab13-b5331adbba02'
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
    87,
    0,
    NULL,
    2,
    '2022-05-05 13:27:42.541224',
    '2022-05-13 10:34:13.000000',
    NULL,
    1,
    'da4d42e6-fa01-4902-af60-f6f212e9980c'
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
    88,
    0,
    'fuMICffK6snoxCjLLcvUFGDEvND7kHV7',
    1,
    '2022-05-05 13:27:42.662771',
    '2022-05-05 13:27:42.662771',
    NULL,
    1,
    'da4d42e6-fa01-4902-af60-f6f212e9980c'
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
    89,
    0,
    'ctPtey4QcOlg1V2oVcbMtWReeCfsOFXK',
    1,
    '2022-05-11 11:21:31.130287',
    '2022-05-11 11:21:31.130287',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0'
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
    90,
    0,
    '8059',
    2,
    '2022-05-11 11:21:31.165874',
    '2022-05-20 16:39:40.000000',
    NULL,
    1,
    '7df6a123-7093-4950-a86e-1499441857a0'
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
    91,
    1,
    NULL,
    1,
    '2022-05-16 12:59:18.548688',
    '2022-05-16 12:59:18.548688',
    NULL,
    1,
    '3f3c9e66-e7b8-4ea8-bd46-96dd0de6d318'
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
    92,
    1,
    NULL,
    2,
    '2022-05-16 12:59:18.549925',
    '2022-05-16 12:59:18.549925',
    NULL,
    1,
    '3f3c9e66-e7b8-4ea8-bd46-96dd0de6d318'
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
    93,
    1,
    NULL,
    2,
    '2022-05-16 18:35:46.189969',
    '2022-05-16 18:35:46.189969',
    NULL,
    1,
    '6fa17795-bea6-4ade-b6b4-1a341bc5149c'
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
    94,
    1,
    NULL,
    1,
    '2022-05-16 18:35:46.193360',
    '2022-05-16 18:35:46.193360',
    NULL,
    1,
    '6fa17795-bea6-4ade-b6b4-1a341bc5149c'
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
    95,
    0,
    'i9W9QhSVU7LMjdC864MZoYd0Hn2LGH8N',
    1,
    '2022-05-17 15:21:43.171504',
    '2022-05-17 15:21:43.171504',
    NULL,
    1,
    'c484df2f-bda6-46bf-825a-40669ed2a7ab'
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
    96,
    0,
    '6441',
    2,
    '2022-05-17 15:21:43.189366',
    '2022-05-17 15:21:43.189366',
    NULL,
    1,
    'c484df2f-bda6-46bf-825a-40669ed2a7ab'
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
    97,
    0,
    'pp1uI06QXLbu5eTpFnMnfrbXRFSWyBfO',
    1,
    '2022-05-17 16:22:35.379939',
    '2022-05-17 16:22:35.379939',
    NULL,
    1,
    '3b1ee693-623a-4063-a738-931cd03275be'
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
    98,
    0,
    '9307',
    2,
    '2022-05-17 16:22:35.465865',
    '2022-05-17 16:22:35.465865',
    NULL,
    1,
    '3b1ee693-623a-4063-a738-931cd03275be'
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
    99,
    0,
    'AWwgfMldZ8XOun6AXkm7DE6R4N8bsKVH',
    1,
    '2022-05-17 16:22:52.753388',
    '2022-05-17 16:22:52.753388',
    NULL,
    1,
    '9bc46902-cb81-4a53-b198-be272501b9ac'
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
    100,
    0,
    '8427',
    2,
    '2022-05-17 16:22:52.794078',
    '2022-05-17 16:22:52.794078',
    NULL,
    1,
    '9bc46902-cb81-4a53-b198-be272501b9ac'
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
    101,
    0,
    'NgXJOiu9GmJNzjl9dmfHxVlbW2SuYqO6',
    1,
    '2022-05-18 10:44:45.989522',
    '2022-05-18 10:44:45.989522',
    NULL,
    1,
    '0d8caf5c-6593-4c26-bff1-b2dadd12ef3d'
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
    102,
    0,
    '8613',
    2,
    '2022-05-18 10:44:46.004960',
    '2022-05-18 10:44:46.004960',
    NULL,
    1,
    '0d8caf5c-6593-4c26-bff1-b2dadd12ef3d'
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
    103,
    0,
    'nUlRbHP8nwj3d0HEUBRzVeyaZ0BuZuIL',
    1,
    '2022-05-18 10:45:28.090383',
    '2022-06-03 15:22:37.000000',
    NULL,
    1,
    '3516c417-cfc0-416d-99e0-59ee7405aebe'
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
    104,
    0,
    '8823',
    2,
    '2022-05-18 10:45:28.098888',
    '2022-06-03 15:22:37.000000',
    NULL,
    1,
    '3516c417-cfc0-416d-99e0-59ee7405aebe'
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
    105,
    0,
    'sgC3s90l7AXigg32ehj19etM7OEZVQwx',
    1,
    '2022-05-18 10:54:41.075301',
    '2022-05-18 10:54:41.075301',
    NULL,
    1,
    '5004118c-e923-4439-beb9-28f03b44a333'
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
    106,
    0,
    '2346',
    2,
    '2022-05-18 10:54:41.078641',
    '2022-05-18 10:54:41.078641',
    NULL,
    1,
    '5004118c-e923-4439-beb9-28f03b44a333'
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
    107,
    0,
    'uupoqbGLanHBzyRX75euCaHGJEm2kCdy',
    1,
    '2022-05-18 10:54:57.258281',
    '2022-05-18 10:54:57.258281',
    NULL,
    1,
    '8e3e11c7-0f2f-4204-9371-3e0c5c20752e'
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
    108,
    0,
    '5108',
    2,
    '2022-05-18 10:54:57.263824',
    '2022-05-18 10:54:57.263824',
    NULL,
    1,
    '8e3e11c7-0f2f-4204-9371-3e0c5c20752e'
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
    109,
    0,
    'KHSawX1A3JnH7rWRbHhOP1ZWxoM7cwZA',
    1,
    '2022-05-18 10:56:48.547928',
    '2022-05-18 10:56:48.547928',
    NULL,
    1,
    'f3e52816-bfdb-49b1-95fd-d6947f09585b'
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
    110,
    0,
    '1451',
    2,
    '2022-05-18 10:56:48.552544',
    '2022-05-18 10:56:48.552544',
    NULL,
    1,
    'f3e52816-bfdb-49b1-95fd-d6947f09585b'
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
    111,
    0,
    'bpbNIoNUkHBn6qYtjMTMtkBp7Oh3yHYK',
    1,
    '2022-05-18 10:57:02.707876',
    '2022-05-18 10:57:02.707876',
    NULL,
    1,
    '654702a6-2446-49e6-84a6-0bfa405ad1cf'
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
    112,
    0,
    '1865',
    2,
    '2022-05-18 10:57:02.711667',
    '2022-05-18 10:57:02.711667',
    NULL,
    1,
    '654702a6-2446-49e6-84a6-0bfa405ad1cf'
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
    113,
    0,
    'sapzcBIrifKQoM1p60wwW6AnrBuHQqSy',
    1,
    '2022-05-18 10:58:10.660558',
    '2022-05-18 10:58:10.660558',
    NULL,
    1,
    '30a035d3-f5d8-47ba-ac6c-f7355236a81b'
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
    114,
    0,
    '6172',
    2,
    '2022-05-18 10:58:10.668082',
    '2022-05-18 10:58:10.668082',
    NULL,
    1,
    '30a035d3-f5d8-47ba-ac6c-f7355236a81b'
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
    115,
    1,
    NULL,
    1,
    '2022-05-18 11:18:42.064018',
    '2022-05-18 11:18:42.064018',
    NULL,
    1,
    'ade2ec99-f561-49fa-ab78-36f083faceba'
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
    116,
    1,
    NULL,
    2,
    '2022-05-18 11:18:42.065971',
    '2022-05-18 11:18:42.065971',
    NULL,
    1,
    'ade2ec99-f561-49fa-ab78-36f083faceba'
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
    117,
    0,
    'BCK7OMdzeEupPZcttuDqVGofLiq9n6Al',
    1,
    '2022-05-18 11:32:02.200858',
    '2022-05-18 11:32:02.200858',
    NULL,
    1,
    'df8e1eea-f87d-4034-95d1-b5392d33e68f'
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
    118,
    0,
    '9425',
    2,
    '2022-05-18 11:32:02.204714',
    '2022-05-18 11:32:02.204714',
    NULL,
    1,
    'df8e1eea-f87d-4034-95d1-b5392d33e68f'
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
    119,
    0,
    'WuaTQ5YFFGkx0W6FgZl8V4xP6t86OfsP',
    1,
    '2022-05-18 11:32:14.134133',
    '2022-05-18 11:32:14.134133',
    NULL,
    1,
    '60a27248-b43c-48ee-9128-7e59d88d9709'
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
    120,
    0,
    '4997',
    2,
    '2022-05-18 11:32:14.139429',
    '2022-05-18 11:32:14.139429',
    NULL,
    1,
    '60a27248-b43c-48ee-9128-7e59d88d9709'
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
    121,
    0,
    'vYWE5Oy4yKksoDeoSoKqa73umDzrnka8',
    1,
    '2022-05-18 11:41:09.915104',
    '2022-05-18 11:41:09.915104',
    NULL,
    1,
    '27e85571-9398-4bf7-9a29-9b31a0c50876'
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
    122,
    0,
    '9762',
    2,
    '2022-05-18 11:41:09.918558',
    '2022-05-18 11:41:09.918558',
    NULL,
    1,
    '27e85571-9398-4bf7-9a29-9b31a0c50876'
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
    123,
    0,
    '5fZzpdlreIMrmFufMaj6PdVyhXN98wo8',
    1,
    '2022-05-18 11:41:20.562454',
    '2022-05-18 11:41:20.562454',
    NULL,
    1,
    '803e88ab-7480-4ff1-bfe8-43263372e7a8'
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
    124,
    0,
    '2032',
    2,
    '2022-05-18 11:41:20.568578',
    '2022-05-18 11:41:20.568578',
    NULL,
    1,
    '803e88ab-7480-4ff1-bfe8-43263372e7a8'
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
    125,
    0,
    '3wbLrRYq3iv54AJ4RjUhAQeXDcB0yVVx',
    1,
    '2022-05-18 11:42:13.990056',
    '2022-05-18 11:42:13.990056',
    NULL,
    1,
    '664ab289-259c-4860-8030-852a3136a5a3'
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
    126,
    0,
    '9024',
    2,
    '2022-05-18 11:42:13.995266',
    '2022-05-18 11:42:13.995266',
    NULL,
    1,
    '664ab289-259c-4860-8030-852a3136a5a3'
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
    127,
    0,
    '6qvnZcJyre8TrlAikQC1OIwOugxsZz3Z',
    1,
    '2022-05-18 11:42:24.294287',
    '2022-05-18 11:42:24.294287',
    NULL,
    1,
    '5d931118-1b2e-4e58-bb89-b8698a6a7b77'
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
    128,
    0,
    '1490',
    2,
    '2022-05-18 11:42:24.297777',
    '2022-05-18 11:42:24.297777',
    NULL,
    1,
    '5d931118-1b2e-4e58-bb89-b8698a6a7b77'
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
    129,
    0,
    'Bi6z7kwT9lzTGXD52i8ztWX7keHhAfNS',
    1,
    '2022-05-18 11:47:38.891122',
    '2022-05-18 11:47:38.891122',
    NULL,
    1,
    'fedc508c-07b3-4311-b5eb-36cfdd582375'
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
    130,
    0,
    '8374',
    2,
    '2022-05-18 11:47:38.933964',
    '2022-05-18 11:47:38.933964',
    NULL,
    1,
    'fedc508c-07b3-4311-b5eb-36cfdd582375'
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
    131,
    0,
    '2252',
    2,
    '2022-05-18 12:56:36.544925',
    '2022-05-18 12:56:36.544925',
    NULL,
    1,
    '88a386cc-522e-4555-b93f-fbe9a6355de5'
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
    132,
    0,
    'ujXKu11spjJ09thgrlLtMTZEHvsxYYE3',
    1,
    '2022-05-18 12:56:36.548079',
    '2022-05-18 12:56:36.548079',
    NULL,
    1,
    '88a386cc-522e-4555-b93f-fbe9a6355de5'
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
    133,
    0,
    'MmD9iNbVFtmHqX453rRZGU7Fp4IpLuSo',
    1,
    '2022-05-18 13:31:39.297530',
    '2022-05-18 13:31:39.297530',
    NULL,
    1,
    'd5f58180-04d2-4efc-a6f4-65d1fa13189a'
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
    134,
    0,
    '3681',
    2,
    '2022-05-18 13:31:39.302033',
    '2022-05-18 13:31:39.302033',
    NULL,
    1,
    'd5f58180-04d2-4efc-a6f4-65d1fa13189a'
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
    135,
    0,
    'MfbqSbEVcNUrW5wNM7WB2mbFfYLrs2y5',
    1,
    '2022-05-18 13:32:37.180527',
    '2022-05-18 13:32:37.180527',
    NULL,
    1,
    '5cc63e35-5f8c-4077-885c-30aff474e773'
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
    136,
    0,
    '1850',
    2,
    '2022-05-18 13:32:37.183957',
    '2022-05-18 13:32:37.183957',
    NULL,
    1,
    '5cc63e35-5f8c-4077-885c-30aff474e773'
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
    137,
    0,
    '6246',
    2,
    '2022-05-18 13:33:31.058241',
    '2022-05-18 13:33:31.058241',
    NULL,
    1,
    '908345c6-0808-45b9-b977-8ee090f5c2f6'
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
    138,
    0,
    'XLBJeDTJChUxyhxb6qJ6hebiRp9C6hWW',
    1,
    '2022-05-18 13:33:31.063698',
    '2022-05-18 13:33:31.063698',
    NULL,
    1,
    '908345c6-0808-45b9-b977-8ee090f5c2f6'
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
    139,
    0,
    'I3fGs6xziVoPspUkIT3fBhwnFmKZqGC9',
    1,
    '2022-05-18 13:33:53.961961',
    '2022-05-18 13:33:53.961961',
    NULL,
    1,
    '6f40a6c6-7557-42fc-ac3a-33333585530d'
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
    140,
    0,
    '2080',
    2,
    '2022-05-18 13:33:53.966806',
    '2022-05-18 13:33:53.966806',
    NULL,
    1,
    '6f40a6c6-7557-42fc-ac3a-33333585530d'
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
    141,
    0,
    '2edEtPaHv8wuO1hgTngIPUxiTqEc6eAm',
    1,
    '2022-05-18 13:35:04.010194',
    '2022-05-18 13:35:04.010194',
    NULL,
    1,
    'df4f5541-cad0-46bf-8648-da321b6bb8b2'
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
    142,
    0,
    '4516',
    2,
    '2022-05-18 13:35:04.013646',
    '2022-05-18 13:35:04.013646',
    NULL,
    1,
    'df4f5541-cad0-46bf-8648-da321b6bb8b2'
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
    143,
    0,
    'JMd7Z7g2ZU9sFAiLklNB3KGIXZ5lxjw6',
    1,
    '2022-05-18 13:35:33.593951',
    '2022-05-18 13:35:33.593951',
    NULL,
    1,
    'dba7e817-66b8-467a-b7ca-7e021b42be79'
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
    144,
    0,
    '9198',
    2,
    '2022-05-18 13:35:33.595438',
    '2022-05-18 13:35:33.595438',
    NULL,
    1,
    'dba7e817-66b8-467a-b7ca-7e021b42be79'
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
    145,
    0,
    '4534',
    2,
    '2022-05-18 13:37:31.559832',
    '2022-05-18 13:37:31.559832',
    NULL,
    1,
    'bf4eb2e6-ae5a-4ef3-a5ac-f3e117dc1ff3'
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
    146,
    0,
    'j23WzO6o6MXGT98PRqFCE3ILh1WHN9po',
    1,
    '2022-05-18 13:37:31.561207',
    '2022-05-18 13:37:31.561207',
    NULL,
    1,
    'bf4eb2e6-ae5a-4ef3-a5ac-f3e117dc1ff3'
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
    147,
    1,
    NULL,
    1,
    '2022-05-18 14:43:56.369818',
    '2022-05-18 14:43:56.369818',
    NULL,
    1,
    'a202cb0f-ce05-4981-b2e6-311f24ddaf47'
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
    148,
    1,
    NULL,
    2,
    '2022-05-18 14:43:56.371927',
    '2022-05-18 14:43:56.371927',
    NULL,
    1,
    'a202cb0f-ce05-4981-b2e6-311f24ddaf47'
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
    149,
    0,
    'tRHa7JaalpAsYaseC8mmoeEqATX24gRN',
    1,
    '2022-05-18 18:50:43.956647',
    '2022-05-18 18:50:43.956647',
    NULL,
    1,
    'd951ad32-6d36-4048-870b-4a168c34d184'
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
    150,
    0,
    '2593',
    2,
    '2022-05-18 18:50:43.961135',
    '2022-05-18 18:50:43.961135',
    NULL,
    1,
    'd951ad32-6d36-4048-870b-4a168c34d184'
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
    151,
    0,
    'iqSt6IgigsnLFThwgOlIRzczVWOb23x2',
    1,
    '2022-05-18 18:51:42.674631',
    '2022-05-18 18:51:42.674631',
    NULL,
    1,
    '95ed56a5-d085-4210-8995-f818da5d8485'
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
    152,
    0,
    '3860',
    2,
    '2022-05-18 18:51:42.685337',
    '2022-05-18 18:51:42.685337',
    NULL,
    1,
    '95ed56a5-d085-4210-8995-f818da5d8485'
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
    153,
    0,
    'usCS1JrY0SBZp89YZhmJ0ewDSGBlojUv',
    1,
    '2022-05-18 18:52:19.267562',
    '2022-05-18 18:52:19.267562',
    NULL,
    1,
    'f4a2486e-8115-4e8d-b444-5dcd2b6114de'
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
    154,
    0,
    '8191',
    2,
    '2022-05-18 18:52:19.269265',
    '2022-05-18 18:52:19.269265',
    NULL,
    1,
    'f4a2486e-8115-4e8d-b444-5dcd2b6114de'
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
    155,
    0,
    '9208',
    2,
    '2022-05-18 18:58:10.901803',
    '2022-05-18 18:58:10.901803',
    NULL,
    1,
    '709fcb88-92a1-4b01-aca0-bb8223bdf9b3'
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
    156,
    0,
    'ICXurv4COK62uk1Ptl90KxNgz5pAveGc',
    1,
    '2022-05-18 18:58:10.898571',
    '2022-05-18 18:58:10.898571',
    NULL,
    1,
    '709fcb88-92a1-4b01-aca0-bb8223bdf9b3'
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
    157,
    0,
    'Vnl4fxomJ8XjBxR6UkFuI4gL1sNlJW1J',
    1,
    '2022-05-18 18:59:40.336682',
    '2022-05-18 18:59:40.336682',
    NULL,
    1,
    'ace31b33-d7dd-47ec-8299-547eea290e05'
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
    158,
    0,
    '8558',
    2,
    '2022-05-18 18:59:40.339131',
    '2022-05-18 18:59:40.339131',
    NULL,
    1,
    'ace31b33-d7dd-47ec-8299-547eea290e05'
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
    159,
    0,
    'tSyVqQZlI43NSen3k2c8phF7qt1ZW2tS',
    1,
    '2022-05-18 19:00:23.945146',
    '2022-05-18 19:00:23.945146',
    NULL,
    1,
    '4704c003-580c-4c4f-94d7-04a59922ff08'
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
    160,
    0,
    '9795',
    2,
    '2022-05-18 19:00:23.947528',
    '2022-05-18 19:00:23.947528',
    NULL,
    1,
    '4704c003-580c-4c4f-94d7-04a59922ff08'
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
    161,
    0,
    '2OOyXeEcErTNGlB0HrFNq2TfbgLYOgkP',
    1,
    '2022-05-18 19:00:28.250953',
    '2022-05-18 19:00:28.250953',
    NULL,
    1,
    '3dc522d4-fc7d-47e1-8add-5e1bf553509f'
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
    162,
    0,
    '3593',
    2,
    '2022-05-18 19:00:28.253082',
    '2022-05-18 19:00:28.253082',
    NULL,
    1,
    '3dc522d4-fc7d-47e1-8add-5e1bf553509f'
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
    163,
    0,
    '2008',
    2,
    '2022-05-18 19:09:05.941944',
    '2022-05-18 19:09:05.941944',
    NULL,
    1,
    'ece28936-ac09-4d54-baea-63e37a3962ee'
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
    164,
    0,
    'nx2bqatQTrJiXRIkbtM1oxu2KRYo2KRL',
    1,
    '2022-05-18 19:09:05.945720',
    '2022-05-18 19:09:05.945720',
    NULL,
    1,
    'ece28936-ac09-4d54-baea-63e37a3962ee'
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
    165,
    0,
    '4Jphca7toIl1E8C3tJUwnhTq5xFt3Zu2',
    1,
    '2022-05-18 19:11:35.297153',
    '2022-05-18 19:11:35.297153',
    NULL,
    1,
    'e74fc492-9d57-4107-8edd-223d827f967a'
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
    166,
    0,
    '2842',
    2,
    '2022-05-18 19:11:35.321397',
    '2022-05-18 19:11:35.321397',
    NULL,
    1,
    'e74fc492-9d57-4107-8edd-223d827f967a'
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
    167,
    0,
    'fS6GjpNbs2Hkc30pP9kygwqdqD5G01Ap',
    1,
    '2022-05-18 19:11:41.921217',
    '2022-05-18 19:11:41.921217',
    NULL,
    1,
    '05a236d1-0c42-4e25-a971-6667d1b452e8'
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
    168,
    0,
    '3555',
    2,
    '2022-05-18 19:11:41.924965',
    '2022-05-18 19:11:41.924965',
    NULL,
    1,
    '05a236d1-0c42-4e25-a971-6667d1b452e8'
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
    169,
    0,
    'XFzxXPzgY1XRUKFT7NxZAyqndebh9gle',
    1,
    '2022-05-18 19:11:56.811520',
    '2022-05-18 19:11:56.811520',
    NULL,
    1,
    '52ddd55c-4305-4292-b254-9fd6fc8785f3'
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
    170,
    0,
    '6964',
    2,
    '2022-05-18 19:11:56.829809',
    '2022-05-18 19:11:56.829809',
    NULL,
    1,
    '52ddd55c-4305-4292-b254-9fd6fc8785f3'
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
    171,
    0,
    'tIVwGkKBI1oboC94anmWz82SpRCMKBrv',
    1,
    '2022-05-19 15:00:20.466554',
    '2022-05-19 15:00:20.466554',
    NULL,
    1,
    '008580ca-2563-4a99-a368-7717549dd0b1'
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
    172,
    0,
    '8571',
    2,
    '2022-05-19 15:00:20.515604',
    '2022-05-19 15:00:20.515604',
    NULL,
    1,
    '008580ca-2563-4a99-a368-7717549dd0b1'
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
    173,
    0,
    '0iL8jKjFS4Rj8hYGO0dnSwzxmJ0KwWZd',
    1,
    '2022-05-19 15:04:45.591307',
    '2022-05-19 15:04:45.591307',
    NULL,
    1,
    'a2203363-d9e1-444b-be38-818252f51e61'
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
    174,
    0,
    '8562',
    2,
    '2022-05-19 15:04:47.447459',
    '2022-05-19 15:04:47.447459',
    NULL,
    1,
    'a2203363-d9e1-444b-be38-818252f51e61'
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
    175,
    0,
    'KW6bS5WsyP00SbKA5KBz4Vy0oHPsHlQH',
    1,
    '2022-05-19 15:52:17.744219',
    '2022-05-19 15:52:17.744219',
    NULL,
    1,
    '68baaa7a-4723-41d9-98f1-79061bdd0286'
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
    176,
    0,
    '5661',
    2,
    '2022-05-19 15:52:17.749866',
    '2022-05-19 15:52:17.749866',
    NULL,
    1,
    '68baaa7a-4723-41d9-98f1-79061bdd0286'
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
    177,
    0,
    '4547',
    2,
    '2022-05-19 17:24:26.993174',
    '2022-05-19 17:24:26.993174',
    NULL,
    1,
    '5045215b-f750-44fd-83ef-f9af59a3fc1e'
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
    178,
    0,
    '8QxtTETMicwDRgDhfRTnQv9b1asy6cTl',
    1,
    '2022-05-19 17:24:26.995587',
    '2022-05-19 17:24:26.995587',
    NULL,
    1,
    '5045215b-f750-44fd-83ef-f9af59a3fc1e'
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
    179,
    0,
    '7549',
    2,
    '2022-05-20 10:48:10.733447',
    '2022-06-10 18:40:25.000000',
    NULL,
    1,
    '581ffd6a-7de6-40a9-8745-11b362079937'
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
    180,
    0,
    '348ZGKJL833HjDEtgiUGXECxk3gSTuoC',
    1,
    '2022-05-20 10:48:10.740103',
    '2022-05-20 10:48:10.740103',
    NULL,
    1,
    '581ffd6a-7de6-40a9-8745-11b362079937'
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
    181,
    0,
    'E86UtWlTDkUsZEwAfHEhSTmxiDUgTmTJ',
    1,
    '2022-05-20 15:18:56.329687',
    '2022-05-20 15:18:56.329687',
    NULL,
    1,
    '6f8b4bdd-07b4-49fb-836b-a53a83370ab8'
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
    182,
    1,
    NULL,
    2,
    '2022-05-20 15:18:56.335299',
    '2022-05-20 15:18:56.335299',
    NULL,
    1,
    '6f8b4bdd-07b4-49fb-836b-a53a83370ab8'
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
    183,
    0,
    'QhmUfZ4sEuECm9DTu4bhNiGoTWTWqBq1',
    1,
    '2022-05-24 07:19:34.546947',
    '2022-05-24 07:19:34.546947',
    NULL,
    1,
    'c7649266-200e-49b2-bb1b-7632d49cbbb8'
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
    184,
    0,
    '9127',
    2,
    '2022-05-24 07:19:34.572769',
    '2022-05-24 07:20:32.000000',
    NULL,
    1,
    'c7649266-200e-49b2-bb1b-7632d49cbbb8'
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
    185,
    0,
    'PPaQNKa7tT8cyCtGc1VeHAPC8ydOPhLN',
    1,
    '2022-05-24 10:41:01.649385',
    '2022-05-24 10:41:01.649385',
    NULL,
    1,
    '508e34d0-7838-49f3-8d02-035eb055caf0'
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
    186,
    1,
    NULL,
    2,
    '2022-05-24 10:41:01.652984',
    '2022-05-24 10:41:01.652984',
    NULL,
    1,
    '508e34d0-7838-49f3-8d02-035eb055caf0'
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
    187,
    0,
    '2nneNPMzmu52BmWcsW8APmTLacchIkv3',
    1,
    '2022-05-24 10:43:23.512706',
    '2022-05-24 10:43:23.512706',
    NULL,
    1,
    '307d7954-8458-4ce9-9b6b-db3435c7bccd'
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
    188,
    1,
    NULL,
    2,
    '2022-05-24 10:43:23.576729',
    '2022-05-24 10:43:23.576729',
    NULL,
    1,
    '307d7954-8458-4ce9-9b6b-db3435c7bccd'
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
    189,
    0,
    NULL,
    2,
    '2022-05-24 11:12:58.855212',
    '2022-06-10 19:19:34.000000',
    NULL,
    1,
    '6884e482-e1fe-40b6-ac9a-22d790dd9e0e'
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
    190,
    0,
    'tIBBywm3SriwN6YczS7F29XocPVvYE9x',
    1,
    '2022-05-24 11:12:58.856821',
    '2022-05-24 11:12:58.856821',
    NULL,
    1,
    '6884e482-e1fe-40b6-ac9a-22d790dd9e0e'
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
    191,
    0,
    '3wMEZ1g7m8UBuFC5QdI4j66Ntmla5vqe',
    1,
    '2022-05-24 14:57:43.039891',
    '2022-05-24 14:57:43.039891',
    NULL,
    1,
    '68524f8e-42b6-44ac-8528-fc0b1a09cc4f'
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
    192,
    1,
    '2581',
    2,
    '2022-05-24 14:57:43.066825',
    '2022-05-24 14:57:48.000000',
    NULL,
    1,
    '68524f8e-42b6-44ac-8528-fc0b1a09cc4f'
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
    193,
    1,
    NULL,
    1,
    '2022-05-27 14:41:41.033495',
    '2022-05-27 14:41:41.033495',
    NULL,
    1,
    '2a133863-2a45-4d1f-bf96-7f88ec2f8c61'
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
    194,
    1,
    NULL,
    2,
    '2022-05-27 14:41:41.046571',
    '2022-05-27 14:41:41.046571',
    NULL,
    1,
    '2a133863-2a45-4d1f-bf96-7f88ec2f8c61'
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
    195,
    1,
    NULL,
    1,
    '2022-05-27 14:46:25.896104',
    '2022-05-27 14:46:25.896104',
    NULL,
    1,
    'da9716ad-b7ca-48b4-82a8-5dc6d8e7ba66'
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
    196,
    1,
    NULL,
    2,
    '2022-05-27 14:46:25.897901',
    '2022-05-27 14:46:25.897901',
    NULL,
    1,
    'da9716ad-b7ca-48b4-82a8-5dc6d8e7ba66'
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
    197,
    1,
    NULL,
    1,
    '2022-05-27 15:30:23.654006',
    '2022-05-27 15:30:23.654006',
    NULL,
    1,
    '3dcff22c-b066-4742-8d21-00fb0567a48a'
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
    198,
    1,
    NULL,
    2,
    '2022-05-27 15:30:23.657945',
    '2022-05-27 15:30:23.657945',
    NULL,
    1,
    '3dcff22c-b066-4742-8d21-00fb0567a48a'
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
    199,
    0,
    NULL,
    2,
    '2022-05-27 15:42:44.520947',
    '2022-06-01 16:18:57.000000',
    NULL,
    1,
    '4146a641-3e5a-4448-a7d0-15f302771426'
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
    200,
    1,
    NULL,
    1,
    '2022-05-27 15:42:44.523822',
    '2022-05-27 15:42:44.523822',
    NULL,
    1,
    '4146a641-3e5a-4448-a7d0-15f302771426'
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
    201,
    1,
    NULL,
    2,
    '2022-05-30 16:10:11.758610',
    '2022-05-30 16:10:11.758610',
    NULL,
    1,
    '098b2069-6aba-4686-88bd-76a757faf2e9'
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
    202,
    1,
    NULL,
    1,
    '2022-05-30 16:10:11.767457',
    '2022-05-30 16:10:11.767457',
    NULL,
    1,
    '098b2069-6aba-4686-88bd-76a757faf2e9'
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
    203,
    0,
    'PNPzIOTvf2YrUp7iXiOCgGfmrvhVklC2',
    1,
    '2022-06-06 10:21:30.990035',
    '2022-06-06 10:21:30.990035',
    NULL,
    1,
    '5e90a908-a191-4f37-92c3-2a613edcc2f8'
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
    204,
    0,
    '8391',
    2,
    '2022-06-06 10:21:30.993479',
    '2022-06-06 12:46:29.000000',
    NULL,
    1,
    '5e90a908-a191-4f37-92c3-2a613edcc2f8'
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
    205,
    0,
    '3TDyoWpZTXCtHzUZpBYdPC0aeInKmQ8R',
    1,
    '2022-06-06 16:21:44.144297',
    '2022-06-06 16:21:44.144297',
    NULL,
    1,
    '39fb15b9-d807-4725-b85c-c4fcca507a43'
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
    206,
    0,
    '1660',
    2,
    '2022-06-06 16:21:44.217944',
    '2022-06-06 16:21:44.217944',
    NULL,
    1,
    '39fb15b9-d807-4725-b85c-c4fcca507a43'
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '008580ca-2563-4a99-a368-7717549dd0b1',
    'test',
    'vendor+4@gmail.com',
    '$2a$10$PrahuGFAJWXUHu3jiVilp.PcZTO9nnPKWLM.afwlH1YiNiq7/Q9bC',
    '+1',
    '9999999981',
    NULL,
    'vendor',
    NULL,
    'cus_LiWkxL8cMTLYPk',
    '2022-05-19 15:00:20.389608',
    '2022-05-27 15:42:02.000000',
    '2022-05-27 15:42:02.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '037a9a07-3145-4133-bc9d-0989b7ee8580',
    'test',
    'testuser@gmail.com',
    NULL,
    '+1',
    '1234567478',
    NULL,
    'vendor',
    NULL,
    'cus_LaaTHZNn9SawYi',
    '2022-04-28 10:19:44.431397',
    '2022-04-28 10:20:26.000000',
    '2022-04-28 10:20:26.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '05a236d1-0c42-4e25-a971-6667d1b452e8',
    'test',
    'sarang+4@gmail.com',
    '$2a$10$yB5b5C/uTGLisXR.dtC/iOg4kjv22bc4b3exa2DXOedHRDKGs8r6W',
    '+91',
    '99999999840',
    NULL,
    'driver',
    NULL,
    'cus_LiDZS427RbKhJh',
    '2022-05-18 19:11:41.902193',
    '2022-05-19 14:54:29.000000',
    '2022-05-19 14:54:29.000000',
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '06681fd4-fe71-4963-b9ce-2c2aeed2e298',
    'Manager ',
    'manager@gmail.com',
    '$2a$10$PjmpfzOBtgJlp0NPRY8HYe.Il3/fXEasko6fWWxqFTy4rPafnYMlO',
    '+1',
    '9825098250',
    NULL,
    'sub_admin',
    NULL,
    NULL,
    '2022-04-27 14:43:26.836680',
    '2022-04-27 16:28:28.000000',
    '2022-04-27 16:28:28.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '06e7292a-6a32-4179-ae74-a477f5fe2f5f',
    'test user 2',
    'user+1@gmail.com',
    '$2a$08$lmiDZd/QKKSyrgU9SzOhyeFBaSAVfXtmeAdGXrgnGMujnt0ytnueq',
    '+1',
    '9999999999',
    NULL,
    'user',
    NULL,
    'cus_LcDJZYUYwe1YEd',
    '2022-04-28 12:08:17.021473',
    '2022-05-25 16:18:50.251055',
    NULL,
    NULL,
    NULL,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '08ecb71b-b437-4338-8154-fc65e4aedc1b',
    'Asgar',
    'asgar@gmai.com',
    '$2a$04$jpc6YtpBN0VnnwMioh0PXO/SleRHCOUkenT1df8F/856ME9zOl6hG',
    '+1',
    '9974034949',
    NULL,
    'driver',
    NULL,
    'cus_LlCNgP5QNYEvc5',
    '2022-05-26 16:37:10.691502',
    '2022-05-27 11:33:32.000000',
    NULL,
    NULL,
    NULL,
    0,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '098b2069-6aba-4686-88bd-76a757faf2e9',
    'test',
    'asgar.b@peerbits.com',
    '$2a$08$O4vPH2s4XsulsV8WRNZvKuL64mQ7mZF87KZuAu5gzkNrf67Te6nIS',
    '+1',
    '9292929292',
    NULL,
    'vendor',
    NULL,
    'cus_LmfLCX0Dv4JG8y',
    '2022-05-30 16:10:10.069522',
    '2022-05-30 17:13:16.000000',
    NULL,
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '0d8caf5c-6593-4c26-bff1-b2dadd12ef3d',
    'test10',
    'test10@peerbits.com',
    '$2a$10$n5ZWjC9GHrkVa42pBz1zHOHrRCHN7dcKcBgsfDn2.bz9C1CWhXprS',
    '+1',
    '1122334455',
    NULL,
    'user',
    NULL,
    'cus_Li5On6F55yh5Zp',
    '2022-05-18 10:44:45.869853',
    '2022-05-26 17:50:30.000000',
    NULL,
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '12c920b8-392c-4cbe-afef-5951e541b4ca',
    'Manager ',
    'manager@gmail.com',
    '$2a$10$00p49O1AC3WBCBa3MiZs/uCab5IWkuh3/HULgLt289vIjGTl0Inwm',
    '+1',
    '1234567890',
    NULL,
    'sub_admin',
    NULL,
    NULL,
    '2022-04-27 16:28:42.161385',
    '2022-04-27 17:57:01.000000',
    '2022-04-27 17:57:01.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9',
    'TEST',
    'testuser@gmail.com',
    '$2a$08$lmiDZd/QKKSyrgU9SzOhyeFBaSAVfXtmeAdGXrgnGMujnt0ytnueq',
    '+1',
    '1234567890',
    NULL,
    'vendor',
    NULL,
    'cus_LaazXpoKHgwwCr',
    '2022-04-28 10:51:19.922857',
    '2022-05-30 14:07:05.459429',
    NULL,
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '1e033672-b8ea-47bb-9b8d-22662bb04026',
    'TEST',
    'testuser@gmail.com',
    NULL,
    '+1',
    '1234567890',
    NULL,
    'vendor',
    NULL,
    'cus_LaavPCN4QsoZR9',
    '2022-04-28 10:48:12.964026',
    '2022-04-28 10:48:22.000000',
    '2022-04-28 10:48:22.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '2334499c-4748-4027-8aff-19674e5f1187',
    'dskafdks',
    'fdksask@dk.com',
    NULL,
    '+1',
    '7878787888',
    NULL,
    'vendor',
    NULL,
    'cus_LaJ5lvP9yZ04wU',
    '2022-04-27 16:21:56.415443',
    '2022-04-28 10:03:54.000000',
    '2022-04-28 10:03:54.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '27e85571-9398-4bf7-9a29-9b31a0c50876',
    'test11',
    'test11@peerbits.com',
    '$2a$10$kAUVDtC9dFOMGuxUuyX6BeMPugoXxBCwPUC/vdh8la5QG2/dee4Ui',
    '+1',
    '11223344556',
    NULL,
    'user',
    NULL,
    'cus_Li6I08QzypuWCe',
    '2022-05-18 11:41:09.886437',
    '2022-05-18 11:41:53.000000',
    '2022-05-18 11:41:53.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '2a133863-2a45-4d1f-bf96-7f88ec2f8c61',
    'Tester',
    'chetan.b@peerbits.com',
    NULL,
    '+1',
    '0000000000',
    NULL,
    'vendor',
    NULL,
    'cus_LlWFlU77d08RgI',
    '2022-05-27 14:41:40.851209',
    '2022-05-27 15:34:00.316073',
    '2022-05-27 14:45:50.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '2b1b9fef-0203-4aa7-b8e9-2a380decefa5',
    'TEST',
    'testadmin@gmail.com',
    NULL,
    '+1',
    '1234567890',
    NULL,
    'vendor',
    NULL,
    'cus_LaatQUyJL1QGhm',
    '2022-04-28 10:46:00.846782',
    '2022-04-28 10:46:14.000000',
    '2022-04-28 10:46:14.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '2bc0cb6b-be1b-49c3-80ef-f4f8da9a1cac',
    'TEST1',
    'a@a.com',
    NULL,
    '+1',
    '1234568790',
    NULL,
    'vendor',
    NULL,
    'cus_Laaf6XZdMQYRDK',
    '2022-04-28 10:31:26.766867',
    '2022-04-28 10:31:35.000000',
    '2022-04-28 10:31:35.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '2e59abef-a03c-4f64-b65d-30aab18f727b',
    'vendordriver+101',
    'vendordriver+101@gmail.com',
    '$2a$04$m719YWbU/uIL75WBlXrU1.Kc6GHSPB/yd7N77fr6GxjLRaVCa6yei',
    '+1',
    '1111111444',
    NULL,
    'driver',
    NULL,
    NULL,
    '2022-05-25 11:47:09.025698',
    '2022-05-25 11:47:09.025698',
    NULL,
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '307d7954-8458-4ce9-9b6b-db3435c7bccd',
    'Sarang Patel',
    'sarang.p+500@peerbits.com',
    '$2a$10$6Imz5Pe8MNM1iTEZY.N5aeI/aQPXU133u2oZ9q9kjMPrshKzJyzH2',
    '+1',
    '6546546546',
    NULL,
    'sub_admin',
    NULL,
    'cus_LkKj6egofGRSxw',
    '2022-05-24 10:43:23.465090',
    '2022-05-24 11:05:22.000000',
    '2022-05-24 11:05:22.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '30a035d3-f5d8-47ba-ac6c-f7355236a81b',
    'test11',
    'test10@peerbits.com',
    '$2a$10$27Yf0IUrrub4r3dLRAL.dO28AhQtzkHVUELGV.pWotUjOsdszqNoG',
    '+1',
    '1122334455',
    NULL,
    'user',
    NULL,
    'cus_Li5bKFbIiPhuOP',
    '2022-05-18 10:58:10.617374',
    '2022-05-18 11:31:06.000000',
    '2022-05-18 11:31:06.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '3202a392-c06e-47af-beb7-0a3d062c7a08',
    'Asgar',
    'asgar.a@gmail.com',
    '$2a$04$ePCHaQpg9mk84dnHINc25eyFluTeMw/1c635G82NGwo5CZ1U/9rFG',
    '+1',
    '7228921472',
    NULL,
    'driver',
    NULL,
    NULL,
    '2022-05-26 16:39:10.740307',
    '2022-05-26 16:39:10.740307',
    NULL,
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '326bacd0-0164-444b-8eef-500b44707825',
    'Acer',
    'testadmin@gmail.com',
    NULL,
    '+1',
    '1234567898',
    NULL,
    'vendor',
    NULL,
    'cus_LaahNKGXqNDnF7',
    '2022-04-28 10:33:48.797617',
    '2022-04-28 10:35:32.000000',
    '2022-04-28 10:35:32.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '3516c417-cfc0-416d-99e0-59ee7405aebe',
    'test11',
    'test11@peerbits.com',
    '$2a$10$vHvEHZ4VTn9gBDsEoPllxuBNyDZtjkmIAkjlm8LHpWH1O.lS1nmY6',
    '+1',
    '1122334456',
    NULL,
    'user',
    NULL,
    'cus_Li5PoB05fjD0v1',
    '2022-05-18 10:45:28.069439',
    '2022-06-03 15:22:37.000000',
    NULL,
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '39fb15b9-d807-4725-b85c-c4fcca507a43',
    'test',
    'sarang.p+50111@peerbits.com',
    '$2a$10$9avR.0WOOnWy1Dl/CaLQ7O.lCUuxBDJMg5SPvMMcU5NWlmRvGLWR6',
    '+91',
    '1212121212',
    NULL,
    'user',
    NULL,
    'cus_LpI7ftnsxpVqwM',
    '2022-06-06 16:21:44.069589',
    '2022-06-06 16:21:44.000000',
    NULL,
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '3a9a1b62-4abb-44b3-b2c8-6026195c6ea5',
    'fxvgfgvfcg',
    'testuser@gmail.com',
    NULL,
    '+1',
    '9999999999',
    NULL,
    'vendor',
    NULL,
    'cus_Lb0aYSnq0Xu5rD',
    '2022-04-29 13:18:43.093152',
    '2022-04-29 13:36:56.000000',
    '2022-04-29 13:36:56.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '3b1ee693-623a-4063-a738-931cd03275be',
    'test1',
    'test1@peerbits.com',
    '$2a$10$NCkjmg.1kouiLHw8WC.sb.c5y.oJt/6EgVbIL.vzcwx6gKRoOo.0m',
    '+1',
    '1122334455',
    NULL,
    'user',
    NULL,
    'cus_Lhncy1ffGZqRnL',
    '2022-05-17 16:22:35.078784',
    '2022-05-17 16:23:48.000000',
    '2022-05-17 16:23:48.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '3dc522d4-fc7d-47e1-8add-5e1bf553509f',
    'test',
    'sarang+4@gmail.com',
    '$2a$10$io.9NwvLsWOjGvltNZFHMeO0RHjuf9StAyQd89TgYeZJ3EjeoOO1q',
    '+91',
    '99999999820',
    NULL,
    'driver',
    NULL,
    'cus_LiDOaL5Osvdwy8',
    '2022-05-18 19:00:28.227951',
    '2022-05-18 19:07:03.000000',
    '2022-05-18 19:07:03.000000',
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '3dcff22c-b066-4742-8d21-00fb0567a48a',
    'chetan',
    'chetan.b+1@peerbits.com',
    '$2a$08$HdKHrjyX83SAS3NLuy1uo.3mNE/pMd1Ph9QmMWQLSxIjDv.NcxWY6',
    '+1',
    '00000',
    '6416',
    'vendor',
    NULL,
    'cus_LlX2qQ2nOlaZUj',
    '2022-05-27 15:30:23.597004',
    '2022-05-27 15:41:28.000000',
    '2022-05-27 15:41:28.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '3f3c9e66-e7b8-4ea8-bd46-96dd0de6d318',
    'test',
    'test@1.com',
    '$2a$08$xgxWtV552/FQAe3jo62iQuTpYLtSFsZaHe38NQaXWvD59fNgrV9Q2',
    '+1',
    '1234567890',
    NULL,
    'vendor',
    NULL,
    'cus_LhN6CY26ibgwqA',
    '2022-05-16 12:59:18.492830',
    '2022-05-27 15:41:57.000000',
    '2022-05-27 15:41:57.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '4146a641-3e5a-4448-a7d0-15f302771426',
    'Bhoomi',
    'bhoomi.b@peerbits.com',
    '$2a$10$ce20dIyxKDTH52FT22LYvO2d/OUpziECsd0kOWlTjdS.oYKcKlarS',
    '+1',
    '9191919191',
    NULL,
    'vendor',
    NULL,
    'cus_LlXEWkMeFuxmt2',
    '2022-05-27 15:42:44.443009',
    '2022-06-01 16:18:57.000000',
    NULL,
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '447d9dce-fe91-4cd9-85ee-452d67324ef6',
    'Ravi',
    'ravi.v@gmail.com',
    '$2a$04$B/RNUbXXNriACehzF.IaVeW2o97CNyZsvXEXLs8WK.PZg0SBF92va',
    '+1',
    '9696969696',
    NULL,
    'driver',
    NULL,
    NULL,
    '2022-05-27 16:40:50.480174',
    '2022-05-27 17:53:49.000000',
    NULL,
    NULL,
    NULL,
    0,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '44efaf40-4738-4681-8bb7-336fac2e3cd1',
    'TEST1',
    'test@t.com',
    NULL,
    '+1',
    '1234567898',
    NULL,
    'vendor',
    NULL,
    'cus_LabURX75dJvOFa',
    '2022-04-28 11:23:12.232179',
    '2022-04-28 11:23:22.000000',
    '2022-04-28 11:23:22.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '4704c003-580c-4c4f-94d7-04a59922ff08',
    'test',
    'sarang+4@gmail.com',
    '$2a$10$h8e6DDCTIZ/GIA72CJKrnewkYvquFz0NFiXrb5Rix64lMwYWA37J2',
    '+91',
    '99999999815',
    NULL,
    'driver',
    NULL,
    'cus_LiDO8JQSuYitQS',
    '2022-05-18 19:00:23.931104',
    '2022-05-18 19:06:48.000000',
    '2022-05-18 19:06:48.000000',
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '47d16810-bea3-4a48-b1b5-33fb23b34156',
    'test user 3',
    'user+3@gmail.com',
    '$2a$10$zC.xRN9r8Obi/r1/GUjbAutqKBJPr8ePOU81gMvw1dLWL810F6xRy',
    '+91',
    '9999999983',
    NULL,
    'user',
    NULL,
    'cus_LacESqfcnD0mAq',
    '2022-04-28 12:08:31.427671',
    '2022-05-24 10:50:22.000000',
    NULL,
    NULL,
    NULL,
    0,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '4b64df10-ec78-4eef-b2b8-2d349d5ee0d6',
    'sarang.p+302',
    'sarang.p+302@peerbits.com',
    '$2a$08$yB3Pt.9tsyc2Z73v4OMfveLUHjI4PkB5tVk0/DRov6Yvt8FDfDj3W',
    '+1',
    '1111111302',
    NULL,
    'driver',
    NULL,
    NULL,
    '2022-05-05 14:56:45.680902',
    '2022-05-18 18:56:57.000000',
    '2022-05-18 18:56:57.000000',
    NULL,
    NULL,
    0,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '4c568150-4bd3-4489-bab7-87db49241ff6',
    'sarang.p+303',
    'sarang.p+303@peerbits.com',
    '$2a$08$YjdnhZY.etGKhABJwJsJg.d9lV53FXXoIE.F/w/5KfSs9xq.n4/i.',
    '+1',
    '1111111303',
    NULL,
    'driver',
    NULL,
    NULL,
    '2022-05-05 15:00:39.489971',
    '2022-05-26 15:34:21.000000',
    '2022-05-26 15:34:21.000000',
    NULL,
    NULL,
    0,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '5004118c-e923-4439-beb9-28f03b44a333',
    'test11',
    'test11@peerbits.com',
    '$2a$10$/DYr4c4biNuJhNJ3lG3oUuxM13xbFg9TqhQBC1sBB4KJIW0vjT2cm',
    '+1',
    '1122334456',
    NULL,
    'user',
    NULL,
    'cus_Li5YjFntiNjFUn',
    '2022-05-18 10:54:41.052621',
    '2022-05-18 10:56:41.000000',
    '2022-05-18 10:56:41.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '5045215b-f750-44fd-83ef-f9af59a3fc1e',
    'test',
    'sarang.p@peerbits.com',
    '$2a$10$DMHvZbRkTeHvptsk2YvqHO97o8H3ZkNiMrxZPjHdlF5XZY.VSyYru',
    '+1',
    '1212121212',
    NULL,
    'user',
    NULL,
    'cus_LiZ4dulUDJczeh',
    '2022-05-19 17:24:26.948949',
    '2022-06-08 12:48:26.000000',
    NULL,
    NULL,
    NULL,
    1,
    0,
    '2022-06-08 12:48:26'
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '508e34d0-7838-49f3-8d02-035eb055caf0',
    'PB user ',
    'fahad.m@peerbits.com',
    '$2a$10$1NGi9sjIPPzYC0PP7GrWPexLvmy17/lBsX.PkZdtSY7fKEU0TLi0.',
    '+1',
    '7878412036',
    NULL,
    'sub_admin',
    NULL,
    NULL,
    '2022-05-24 10:41:01.616724',
    '2022-05-24 11:05:17.000000',
    '2022-05-24 11:05:17.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '52ddd55c-4305-4292-b254-9fd6fc8785f3',
    'test',
    'sarang4@gmail.com',
    '$2a$10$UHUeEpDk3MZTEndgFek30edBevwWuAumlHmZZ1inBZFhKJJOZBIjq',
    '+91',
    '99999999845',
    NULL,
    'driver',
    NULL,
    'cus_LiDZsZ2EUmnaZx',
    '2022-05-18 19:11:56.786195',
    '2022-05-19 14:51:44.000000',
    '2022-05-19 14:51:44.000000',
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '561afdc9-bb80-4e09-80c0-6d7b47d112d0',
    'TEST1',
    'testadminaa@gmail.com',
    NULL,
    '+1',
    '1234568790',
    NULL,
    'vendor',
    NULL,
    'cus_LabVlnuwIP68fo',
    '2022-04-28 11:24:11.480377',
    '2022-04-28 11:24:26.000000',
    '2022-04-28 11:24:26.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '581ffd6a-7de6-40a9-8745-11b362079937',
    'As far',
    'asgar@gmail.com',
    '$2a$10$4/PkfpNkKV9vboMRd3WAEOdU2uUZv.dNzVUU3zV4oGwA6Du07knpW',
    '+91',
    '9974034949',
    NULL,
    'driver',
    'https://source.unsplash.com/user/c_v_r/1900x800',
    'cus_LiptVabt5DroEl',
    '2022-05-20 10:48:10.706885',
    '2022-06-10 18:40:26.000000',
    NULL,
    NULL,
    NULL,
    0,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '5984e2bd-69b7-4219-9d72-330802d9be0d',
    'Chetan ',
    'chetanb.s@gmail.com',
    '$2a$04$poCyrGnSiXkHzfmsJUIRkONEqs266sYYBKsu6CGC8KV1IHQ8mp9MG',
    '+1',
    '8888888888',
    NULL,
    'driver',
    NULL,
    NULL,
    '2022-05-27 17:58:00.701907',
    '2022-05-27 17:58:00.701907',
    NULL,
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '5cc63e35-5f8c-4077-885c-30aff474e773',
    'user1',
    'user1@peerbits.com',
    '$2a$10$5mqWwCx6Ahl.TyztmI9ydO.ewrJSEBogjeBXCmpDyYrufjvTV0e7G',
    '+1',
    '112233445560',
    NULL,
    'user',
    NULL,
    'cus_Li86cqXJVM6Ztl',
    '2022-05-18 13:32:37.164005',
    '2022-05-18 13:32:58.000000',
    '2022-05-18 13:32:58.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '5d931118-1b2e-4e58-bb89-b8698a6a7b77',
    'test11',
    'test11@peerbits.com',
    '$2a$10$v2/7N5JiQE15oSv/SqC4A.m1sQvBlXRj.WTIRfIL46.qmOpjwOZjy',
    '+1',
    '11223344556',
    NULL,
    'user',
    NULL,
    'cus_Li6Kd7v5fmDuim',
    '2022-05-18 11:42:24.264382',
    '2022-05-18 11:43:25.000000',
    '2022-05-18 11:43:25.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '5e90a908-a191-4f37-92c3-2a613edcc2f8',
    'Asgar',
    'abcd@gmai.com',
    '$2a$10$X6gL6PqorYnNt7z1IvL6l.wv3E7nuyc4we0YBqQwl9KPbOzxOJDMW',
    '+91',
    '7897897897',
    NULL,
    'driver',
    'https://source.unsplash.com/user/c_v_r/1900x800',
    'cus_LpCJWffQoKNQ6U',
    '2022-06-06 10:21:30.973197',
    '2022-06-06 12:46:29.000000',
    NULL,
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '5fe4927c-e313-44cf-9ab8-20a95b52d140',
    'testing',
    'r@r.com',
    '$2a$10$d.4ZToPPpAzk0IwmvXKQd.B.uHOYs3Fymx1X7DW5bqh6.U2LMENi6',
    '+1',
    '1420359685',
    NULL,
    'sub_admin',
    NULL,
    NULL,
    '2022-04-27 17:58:29.302316',
    '2022-05-02 16:54:47.000000',
    '2022-05-02 16:54:47.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '60a27248-b43c-48ee-9128-7e59d88d9709',
    'test11',
    'test11@peerbits.com',
    '$2a$10$3jmNd.Fo9/lQcI.IDTO6s.YoZ5zKTD7430WNzs4n0j0lBBr7X8s3K',
    '+1',
    '11223344556',
    NULL,
    'user',
    NULL,
    'cus_Li69fDOuBAetJb',
    '2022-05-18 11:32:14.115393',
    '2022-05-18 11:34:28.000000',
    '2022-05-18 11:34:28.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '6455b11f-2c5e-40ea-94c7-74849f817c25',
    'TEST',
    'b@a.com',
    NULL,
    '+1',
    '1234567898',
    NULL,
    'vendor',
    NULL,
    'cus_Laadox5Qrfa8LK',
    '2022-04-28 10:29:46.695832',
    '2022-04-28 10:30:11.000000',
    '2022-04-28 10:30:11.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '654702a6-2446-49e6-84a6-0bfa405ad1cf',
    'test11',
    'test11@peerbits.com',
    '$2a$10$EFwJ61blTipU52JG6RhKfud0QCiOwGL/m.qaP9P5batT5oCs78.hW',
    '+1',
    '11223344556',
    NULL,
    'user',
    NULL,
    'cus_Li5afRxUvtqD7e',
    '2022-05-18 10:57:02.692147',
    '2022-05-18 11:31:26.000000',
    '2022-05-18 11:31:26.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '664ab289-259c-4860-8030-852a3136a5a3',
    'test10',
    'test10@peerbits.com',
    '$2a$10$pp9v5ztWVE0IZWUrAKh1Befr.Fi073WVWH7U0OLz1uLGCJJMFo3Em',
    '+1',
    '11223344555',
    NULL,
    'user',
    NULL,
    'cus_Li6JnSl32ywKXL',
    '2022-05-18 11:42:13.976926',
    '2022-05-18 11:42:49.000000',
    '2022-05-18 11:42:49.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '68524f8e-42b6-44ac-8528-fc0b1a09cc4f',
    'Asgar',
    'asgar.a@gmail.com',
    '$2a$10$Ur2FTjcQoGhvmpjEPMy3v.hc0isbMGQdSagWKeMtmVOqotyNH9RlC',
    '+91',
    '1234567890',
    NULL,
    'driver',
    NULL,
    'cus_LkOpcK5ZYxl21Z',
    '2022-05-24 14:57:43.016424',
    '2022-05-24 14:57:43.000000',
    NULL,
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '6884e482-e1fe-40b6-ac9a-22d790dd9e0e',
    'PB Sub admin',
    'fahad.m+1212@peerbits.com',
    '$2a$10$JDZXmnVpR.XqlssD37oPSuEpRIUbBl/lRFOdvPCo7ue0fg64q5Lni',
    '+1',
    '7474858596',
    NULL,
    'sub_admin',
    NULL,
    'cus_LkLIRgQxURVSfj',
    '2022-05-24 11:12:58.792317',
    '2022-06-10 19:19:34.000000',
    NULL,
    NULL,
    NULL,
    0,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '68baaa7a-4723-41d9-98f1-79061bdd0286',
    'test',
    'driver+5@gmail.com',
    '$2a$10$jWCh9KF0r42xyLDkbZhzjeH2x16C68SPErYEPAYSy5TOpmx.Yduei',
    '+1',
    '9999999981',
    NULL,
    'driver',
    NULL,
    'cus_LiXZiZfMNUq8qz',
    '2022-05-19 15:52:17.709546',
    '2022-05-19 15:53:06.000000',
    '2022-05-19 15:53:06.000000',
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '6a068d33-217c-42c7-8e2b-4c32605e9f73',
    'test.p+303',
    'test.p+303@peerbits.com',
    '$2a$08$qrtfSfXMCsueMy.B5F48duzf4X20vHXSAXxeRW7gXjkpUcSSVuDK6',
    '+1',
    '1111111358',
    NULL,
    'driver',
    NULL,
    NULL,
    '2022-05-19 15:02:16.416125',
    '2022-05-19 15:34:11.000000',
    '2022-05-19 15:34:11.000000',
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    'Sarang Test',
    'sarang.p@peerbits.com',
    '$2a$08$lmiDZd/QKKSyrgU9SzOhyeFBaSAVfXtmeAdGXrgnGMujnt0ytnueq',
    '+1',
    '1233211233',
    NULL,
    'vendor',
    NULL,
    'cus_LaIPDiuOfVCddP',
    '2022-04-27 15:39:45.606932',
    '2022-05-27 19:12:36.000000',
    NULL,
    NULL,
    NULL,
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '6be90c25-7f58-4502-ab3c-44b742e221a4',
    'Sarang Test',
    'testadmin@gmail.com',
    NULL,
    '+1',
    '1111111112',
    NULL,
    'vendor',
    NULL,
    'cus_Lb0f4ZblDTvXLT',
    '2022-04-29 13:24:15.462596',
    '2022-04-29 16:46:40.000000',
    '2022-04-29 16:46:40.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '6edea6c6-b8ad-45d6-bee9-928a8c599e30',
    'test ',
    'testadmin111@gmail.com',
    '$2a$08$uVuV/gMxIL5to5ZigIvtpuU5ZL3H5wRr.g/5L8yXaq4sgPf54HA36',
    '+1',
    '1234568790',
    NULL,
    'vendor',
    NULL,
    'cus_Lc8BvAOAmWuOje',
    '2022-05-02 13:13:43.220057',
    '2022-05-27 15:41:53.000000',
    '2022-05-27 15:41:53.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '6f40a6c6-7557-42fc-ac3a-33333585530d',
    'user1',
    'user1@peerbits.com',
    '$2a$10$duqbBWivYQZ6lSaCfOHuWuaOnvafKj4IVF4KZGLzNg5iYojEqdwKG',
    '+1',
    '112233445560',
    NULL,
    'user',
    NULL,
    'cus_Li87FQQJosUSg0',
    '2022-05-18 13:33:53.944722',
    '2022-05-18 13:34:48.000000',
    '2022-05-18 13:34:48.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '6f8b4bdd-07b4-49fb-836b-a53a83370ab8',
    'Peerbits ',
    'fahad.m@peerbits.com',
    '$2a$08$lmiDZd/QKKSyrgU9SzOhyeFBaSAVfXtmeAdGXrgnGMujnt0ytnueq',
    '+1',
    '9874098740',
    NULL,
    'sub_admin',
    NULL,
    'cus_LiuXelyChKULmd',
    '2022-05-20 15:18:56.292914',
    '2022-05-24 10:40:39.000000',
    '2022-05-24 10:40:39.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '6fa17795-bea6-4ade-b6b4-1a341bc5149c',
    'test',
    'testadmin1212@gmail.com',
    NULL,
    '+1',
    '7894561230',
    NULL,
    'vendor',
    NULL,
    'cus_LhSXO32oBlwPfC',
    '2022-05-16 18:35:46.136541',
    '2022-05-16 18:52:02.000000',
    '2022-05-16 18:52:02.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    'Demo user',
    'admin@gmail.com',
    '$2a$08$lmiDZd/QKKSyrgU9SzOhyeFBaSAVfXtmeAdGXrgnGMujnt0ytnueq',
    '+1',
    '3333333333',
    NULL,
    'admin',
    'https://via.placeholder.com/600/45601a',
    'cus_LaIM6nogDbidpq',
    '2022-04-27 14:26:47.340014',
    '2022-05-27 19:16:07.000000',
    NULL,
    NULL,
    NULL,
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '709fcb88-92a1-4b01-aca0-bb8223bdf9b3',
    'test',
    'sarang+4@gmail.com',
    '$2a$10$7C1aIMkTwDF28Jl86IJ4dO4weKs4jNn19HawAc3IgBTsVpgB1M0Nu',
    '+91',
    '99999999859',
    NULL,
    'driver',
    NULL,
    'cus_LiDL2OgRjhWsIi',
    '2022-05-18 18:58:10.836955',
    '2022-06-02 17:06:18.308243',
    NULL,
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '75b869cd-3f2a-4eb8-ad88-90f9e6959eb4',
    'TEST',
    'a@a.com',
    NULL,
    '+1',
    '1234567890',
    NULL,
    'vendor',
    NULL,
    'cus_LaapD1a3ncsZEa',
    '2022-04-28 10:41:42.833079',
    '2022-04-28 10:41:52.000000',
    '2022-04-28 10:41:52.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '761a35de-a2ca-4e4b-8784-08b94f2e5875',
    'test',
    'testadmin@gmail.com',
    NULL,
    '+1',
    '1234567890',
    NULL,
    'vendor',
    NULL,
    'cus_LaIEFDQ7quOcGq',
    '2022-04-27 15:28:30.565787',
    '2022-04-27 15:29:28.000000',
    '2022-04-27 15:29:28.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '7ce71cc2-a0da-40bb-9b30-2145f168d49c',
    'TEST1',
    'test21212@gmail.com',
    NULL,
    '+1',
    '1234567898',
    NULL,
    'vendor',
    NULL,
    'cus_Lab1YUpmXVUkZB',
    '2022-04-28 10:53:47.000601',
    '2022-04-28 10:54:00.000000',
    '2022-04-28 10:54:00.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '7df6a123-7093-4950-a86e-1499441857a0',
    'Asgar',
    'asgar@gmail.com',
    '$2a$10$MxbjP3KUD41oVPBrwxg3RuKetxIiVu/iCYId3eIrmDkggfvHxbAb6',
    '+91',
    '9974034949',
    NULL,
    'user',
    NULL,
    'cus_LfTP0WMJlscrCs',
    '2022-05-11 11:21:31.076866',
    '2022-06-07 15:29:30.000000',
    NULL,
    NULL,
    NULL,
    1,
    2,
    '2022-06-07 15:29:31'
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '7f6cd4d8-0f1d-4701-ad25-f91db93180a2',
    'LG',
    'b@a.com',
    NULL,
    '+1',
    '1234567890',
    NULL,
    'vendor',
    NULL,
    'cus_Laae2tyZIngTNR',
    '2022-04-28 10:31:04.727058',
    '2022-04-28 10:34:00.000000',
    '2022-04-28 10:34:00.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '803e88ab-7480-4ff1-bfe8-43263372e7a8',
    'test10',
    'test10@peerbits.com',
    '$2a$10$ecQBsbkykxCFAODXRreuu.sePRdC8liyGxRbouMdsP1p7yxSjXsIK',
    '+1',
    '11223344555',
    NULL,
    'user',
    NULL,
    'cus_Li6J2EOwjBjSvc',
    '2022-05-18 11:41:20.529715',
    '2022-05-18 11:41:42.000000',
    '2022-05-18 11:41:42.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '80714615-3417-4a38-a540-104da6894149',
    'new vendor',
    'new@user.com',
    NULL,
    '+1',
    '1234687777',
    NULL,
    'vendor',
    NULL,
    NULL,
    '2022-04-28 10:08:36.726746',
    '2022-04-28 10:29:58.000000',
    '2022-04-28 10:29:58.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '85ff5315-06f0-4eba-890b-67fd7d7205e3',
    'vendordriver+103',
    'vendordriver+103@gmail.com',
    '$2a$04$KUn24JDQcxVxfhhtst8OxujjeoPM2et1pjuUwiiWhljTRC6FhEdkm',
    '+1',
    '2222224444',
    NULL,
    'driver',
    NULL,
    NULL,
    '2022-05-25 11:52:50.011532',
    '2022-05-25 11:52:50.011532',
    NULL,
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '86907473-69a5-4898-9d2a-e683d2d02565',
    'TEST',
    'testadmin@gmail.com',
    NULL,
    '+1',
    '1234567890',
    NULL,
    'vendor',
    NULL,
    'cus_Laak8r9UADpHtU',
    '2022-04-28 10:37:07.844046',
    '2022-04-28 10:37:39.000000',
    '2022-04-28 10:37:39.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '88a386cc-522e-4555-b93f-fbe9a6355de5',
    'driver10',
    'driver10@peerbits.com',
    '$2a$10$xo9zpNbAtTFL4Hc5290FfeSq2JHGszpWn8IKkMWZ3VSWTkDGZSe02',
    '+1',
    '112233445560',
    NULL,
    'driver',
    NULL,
    'cus_Li7Wb3CbLFY8gK',
    '2022-05-18 12:56:36.473627',
    '2022-05-18 12:56:37.000000',
    NULL,
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '8ba01fd1-6aaf-49db-8415-8cc11d93043a',
    'TEST',
    'testuser@gmail.com',
    NULL,
    '+1',
    '1234567890',
    NULL,
    'vendor',
    NULL,
    'cus_LaaqPyAWKOx4yc',
    '2022-04-28 10:42:42.659471',
    '2022-04-28 10:42:53.000000',
    '2022-04-28 10:42:53.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '8d45b1da-30b6-4e2e-8a10-43136f6e1785',
    'Manage',
    't@t.com',
    '$2a$10$IYh00YQwft3L9qs.hRWFJegnaEDYG0RPkdySWxI/11gYlLb.7xVgO',
    '+1',
    '4545454545',
    NULL,
    'sub_admin',
    NULL,
    NULL,
    '2022-04-27 17:56:19.146869',
    '2022-05-02 16:54:44.000000',
    '2022-05-02 16:54:44.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '8e3e11c7-0f2f-4204-9371-3e0c5c20752e',
    'test10',
    'test10@peerbits.com',
    '$2a$10$oFtZkbYd6TRCSYgrGn3yKuROhSavG.OVzyuJ1G51vVfu1hzBeB22W',
    '+1',
    '1122334455',
    NULL,
    'user',
    NULL,
    'cus_Li5Y0CM4qSxboR',
    '2022-05-18 10:54:57.219534',
    '2022-05-18 10:56:05.000000',
    '2022-05-18 10:56:05.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '8fc2ab89-5bcd-4486-aa82-3a931ea6e32a',
    'TEST',
    'b@a.com',
    NULL,
    '+1',
    '1234567890',
    NULL,
    'vendor',
    NULL,
    'cus_LaIGhGntYDqalj',
    '2022-04-27 15:31:15.848414',
    '2022-04-28 10:12:07.000000',
    '2022-04-28 10:12:07.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '908345c6-0808-45b9-b977-8ee090f5c2f6',
    'user1',
    'user1@peerbits.com',
    '$2a$10$eUr4S1nfoUAU1B65KOnyKeKVPvyBNz2UH2IABO9imqpjhPJBm11fm',
    '+1',
    '112233445560',
    NULL,
    'user',
    NULL,
    'cus_Li87xWi6fZS0Q5',
    '2022-05-18 13:33:31.021887',
    '2022-05-18 13:33:45.000000',
    '2022-05-18 13:33:45.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '951c7937-5d94-4b0b-8fe9-4deccdb7e0af',
    'sarang.p+301',
    'sarang.p+301@peerbits.com',
    '$2a$08$UNLyLBa7fwLDJiBz7gMQSul0C6/KBdhRXJ2Qj5JeR26yWsPeFR.Ou',
    '1',
    '1111111111',
    NULL,
    'driver',
    NULL,
    NULL,
    '2022-05-05 12:39:32.001763',
    '2022-05-20 19:05:51.000000',
    NULL,
    NULL,
    NULL,
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '95ed56a5-d085-4210-8995-f818da5d8485',
    'test',
    'sarang.p+4@peerbits.com',
    '$2a$10$UUHiLv0i2R1.eJAIqai3eub7Tpf2qjpie8UATl87AHJfHqKP3q8pq',
    '+1',
    '6666644443',
    NULL,
    'user',
    NULL,
    'cus_LiDFgtCkaMO8pW',
    '2022-05-18 18:51:42.650672',
    '2022-05-18 18:51:43.000000',
    NULL,
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    '9bc46902-cb81-4a53-b198-be272501b9ac',
    'test2',
    'test2@peerbits.com',
    '$2a$10$aMv30jfalIFJgkTLLVINAO3B64bFa4mes2sBXSkg1uT7ZLjsF1h66',
    '+1',
    '1122334458',
    NULL,
    'user',
    NULL,
    'cus_Lhnc9PvmRBPNKT',
    '2022-05-17 16:22:52.678955',
    '2022-05-17 16:23:44.000000',
    '2022-05-17 16:23:44.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'a202cb0f-ce05-4981-b2e6-311f24ddaf47',
    'TEST',
    'testuser111@gmail.com',
    NULL,
    '+1',
    '1234567890',
    NULL,
    'vendor',
    NULL,
    'cus_Li9FknXbWlgbjr',
    '2022-05-18 14:43:56.316907',
    '2022-05-27 15:41:48.000000',
    '2022-05-27 15:41:48.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'a2203363-d9e1-444b-be38-818252f51e61',
    'test',
    'vendor+5@gmail.com',
    '$2a$10$HvfeSCRnX.aHZ7xC1dh2xu6tfW1ZVV/aKhgcl4IDPLj6QF13XwD6W',
    '+1',
    '9999999981',
    NULL,
    'vendor',
    NULL,
    'cus_LiWodoUITlR9J4',
    '2022-05-19 15:04:45.263057',
    '2022-05-27 15:41:41.000000',
    '2022-05-27 15:41:41.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'a64037fb-229b-4090-9c3b-6b49e449f079',
    'TEST',
    'testuser@gmail.com',
    NULL,
    '+1',
    '1234567890',
    NULL,
    'vendor',
    NULL,
    'cus_LaIFSoD3YLKnk4',
    '2022-04-27 15:30:11.507485',
    '2022-04-28 10:06:59.000000',
    '2022-04-28 10:06:59.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'a8d473c0-7cd8-457e-95f7-53d7cd99faa3',
    'vendordriver.p+303',
    'vendordriver.p+303@test.com',
    '$2a$04$2xjYBHyNidHv6.knsFOVtOBEJbMEArXnFOKvof4HTk/VDYLhfAhkm',
    '+1',
    '9999999999',
    NULL,
    'driver',
    NULL,
    NULL,
    '2022-05-19 15:05:31.148273',
    '2022-05-19 15:42:25.000000',
    '2022-05-19 15:42:25.000000',
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'ace31b33-d7dd-47ec-8299-547eea290e05',
    'test',
    'sarang+4@gmail.com',
    '$2a$10$I/mEZ9mkdVSoUqgn6PNjvu.uK2f2KpGidH9bzzFeUCy4Mg8yL5lRu',
    '+91',
    '99999999814',
    NULL,
    'driver',
    NULL,
    'cus_LiDN0cQZW2Z3nv',
    '2022-05-18 18:59:40.323627',
    '2022-05-18 18:59:51.000000',
    '2022-05-18 18:59:51.000000',
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'ade2ec99-f561-49fa-ab78-36f083faceba',
    'TEST',
    'admin@gmail.com',
    NULL,
    '+1',
    '1234568790',
    NULL,
    'vendor',
    NULL,
    'cus_Li5w7OdF9YqNki',
    '2022-05-18 11:18:42.023992',
    '2022-05-18 19:18:18.000000',
    '2022-05-18 19:18:18.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'b53e33db-e131-425a-a619-f41d98317a00',
    'TEST',
    'test@gmail.com',
    NULL,
    '+1',
    '1234567478',
    NULL,
    'vendor',
    NULL,
    'cus_LaaPQNrxbiSHcU',
    '2022-04-28 10:15:34.510011',
    '2022-04-28 10:18:16.000000',
    '2022-04-28 10:18:16.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'baafed38-360f-401c-98a3-0c23191ce8c3',
    'test.p+303',
    'test.p+303@test.com',
    '$2a$04$l2btpLhZabYQfrbwzfDvLeHN1VNoh7.QlMDVUunM7b33sGe6BqUMG',
    '+91',
    '1111111358',
    NULL,
    'driver',
    NULL,
    NULL,
    '2022-05-19 15:03:44.863595',
    '2022-05-19 15:43:05.000000',
    '2022-05-19 15:43:05.000000',
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'bce88ea5-cc92-4fc8-b94f-ba90d62bd4d6',
    'TEST',
    'testadmin@gmail.com',
    NULL,
    '+1',
    '1234567898',
    NULL,
    'vendor',
    NULL,
    'cus_LaaywFYjMgnL2Y',
    '2022-04-28 10:50:22.692871',
    '2022-04-28 10:50:44.000000',
    '2022-04-28 10:50:44.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'bf0d038c-1b20-4f45-80b6-900049b9b892',
    'Manager',
    'test@t.com',
    '$2a$10$wMtILgUOSSu/PGSTFtPGx.M2r4fpDhceCuZ7Qt7H924.2BoCqmfo2',
    '+1',
    '1234567890',
    NULL,
    'sub_admin',
    NULL,
    NULL,
    '2022-05-02 17:17:16.472546',
    '2022-05-24 11:04:56.000000',
    '2022-05-24 11:04:56.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'bf4eb2e6-ae5a-4ef3-a5ac-f3e117dc1ff3',
    'user1',
    'user1@peerbits.com',
    '$2a$10$ljRk2thiJzv9XEQYIZRamOqhB/JTkkKn62YwibifmlXetSBmo2bpm',
    '+1',
    '112233445560',
    NULL,
    'user',
    NULL,
    'cus_Li8B9M5csEPv3o',
    '2022-05-18 13:37:31.545361',
    '2022-05-18 13:37:43.000000',
    '2022-05-18 13:37:43.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'bfde0d10-c1c1-4bd2-93fb-467439097d13',
    'TEST',
    'testuser@gmail.com',
    NULL,
    '+1',
    '1234567898',
    NULL,
    'vendor',
    NULL,
    'cus_LaanYg2VL1Sm5Q',
    '2022-04-28 10:39:26.266184',
    '2022-04-28 10:39:40.000000',
    '2022-04-28 10:39:40.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'bff668dc-c411-482c-81cb-64009918df9b',
    'TEST',
    'a@a.com',
    NULL,
    '+1',
    '1234567890',
    NULL,
    'vendor',
    NULL,
    'cus_LaajsUme6w8VuL',
    '2022-04-28 10:36:08.234983',
    '2022-04-28 10:36:18.000000',
    '2022-04-28 10:36:18.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'c39e85d8-91c9-4097-86f9-f94ccc46b7b5',
    'sub admin',
    'test@e.com',
    '$2a$10$qQ2kUIkSP2nuiGuJribZDOXRYYkQM09Kz9RvvEcpoGJRbhL1d.7ra',
    '+1',
    '9824098240',
    NULL,
    'sub_admin',
    NULL,
    NULL,
    '2022-05-05 13:13:49.068005',
    '2022-05-24 11:05:29.000000',
    '2022-05-24 11:05:29.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'c484df2f-bda6-46bf-825a-40669ed2a7ab',
    'test1',
    'test1@peerbits.com',
    '$2a$10$G/NRzj0/PCsvnDUUzILLHuQ7WsHsqo0TJlYqZYEY4K4KXoXkf5eeS',
    '+1',
    '1122334455',
    NULL,
    'user',
    NULL,
    'cus_LhmdN2J3fMisWA',
    '2022-05-17 15:21:43.047707',
    '2022-05-17 15:57:26.000000',
    '2022-05-17 15:57:26.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'c7649266-200e-49b2-bb1b-7632d49cbbb8',
    'test',
    'sarangp021@gmail.com',
    '$2a$10$PgGWVeAg9QbVYQ9nOsXtv.z6jOA6Hh3VhiIdiew4cjIOUU3429FHm',
    '+91',
    '1597532089',
    NULL,
    'driver',
    'https://source.unsplash.com/user/c_v_r/1900x800',
    'cus_LkHREq1CtiWay1',
    '2022-05-24 07:19:34.472226',
    '2022-05-24 07:20:32.000000',
    NULL,
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'c842ba3f-c326-45eb-95f7-f30dbbc24c65',
    'sub admin',
    'test@t.com',
    '$2a$10$a0uZuHe3QI.qUVjBYk08ze6sRjntLNq3ch5x6lKhnZ7zHt.YHpnnq',
    '+1',
    '1234567890',
    NULL,
    'sub_admin',
    NULL,
    NULL,
    '2022-04-27 17:55:42.615968',
    '2022-04-27 17:58:41.000000',
    '2022-04-27 17:58:41.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    0,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'cadcaccf-9361-417d-abb8-4096c81b1ac8',
    'test',
    'sarang.p+4@peerbits.com',
    '$2a$10$yTI7rfX/TzFez7g9Q4TBvO3CQm9atSmUuFqEq5T2xk.pBobvLKC06',
    '+91',
    '9999999981',
    NULL,
    'driver',
    NULL,
    'cus_Lcwa0lyspx9JJF',
    '2022-05-04 17:18:53.537951',
    '2022-05-26 16:22:36.000000',
    '2022-05-26 16:22:36.000000',
    NULL,
    NULL,
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'cedb4ed2-fa12-40bf-bf07-4793170a5279',
    'Rajesh Patel ',
    'rajesh.p@gmail.com',
    '$2a$04$r27WqR9t/P5lbZd46.Xdten6j0YLJA5FnGJdLKicdpaHfe9tENTH2',
    '+1',
    '9696969696',
    NULL,
    'driver',
    NULL,
    NULL,
    '2022-05-27 16:31:20.250380',
    '2022-05-27 16:33:18.000000',
    '2022-05-27 16:33:18.000000',
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'd319c66f-1f6f-4b3b-8c91-e19d9befb705',
    'TEST',
    'b@a.com',
    NULL,
    '+1',
    '1234567890',
    NULL,
    'vendor',
    NULL,
    'cus_LaIGwvIiLSu3Xo',
    '2022-04-27 15:31:15.777103',
    '2022-04-27 15:32:51.000000',
    '2022-04-27 15:32:51.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'd5216422-ccce-49ce-ab13-b5331adbba02',
    'admin',
    'admin@a.com',
    '$2a$10$HuwjSS46gTG43KE8fOMdn.L01GzEtzoJYEtpmjGInxxzdpuvGUFla',
    '+1',
    '7874785200',
    NULL,
    'sub_admin',
    NULL,
    NULL,
    '2022-05-05 13:27:07.129550',
    '2022-05-24 11:04:51.000000',
    '2022-05-24 11:04:51.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'd5f58180-04d2-4efc-a6f4-65d1fa13189a',
    'user1',
    'user1@peerbits.com',
    '$2a$10$PtA1//cLWqXdScANAVn/lOJ7AQUG9Pf1fzYvhpHqsUVbjl3lvH74C',
    '+1',
    '112233445560',
    NULL,
    'user',
    NULL,
    'cus_Li85rMFrzHu8Zu',
    '2022-05-18 13:31:39.249890',
    '2022-05-18 13:32:15.000000',
    '2022-05-18 13:32:15.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'd6a45750-e012-4809-8b59-0608945030b9',
    'LG',
    'testadmin@gmail.com',
    NULL,
    '+1',
    '1234567890',
    NULL,
    'vendor',
    NULL,
    'cus_LaamBhOMObggi8',
    '2022-04-28 10:39:05.188932',
    '2022-04-28 10:41:02.000000',
    '2022-04-28 10:41:02.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'd7dc70a4-99ab-4197-9a3a-791efc528113',
    'vendordriver+102',
    'vendordriver+102@gmail.com',
    '$2a$04$9vpeLOwvdeb6UWPhnShQeuuUVGoJ6V2RXmq1QST6fKKVTJkTcPMBO',
    '+1',
    '1111111141',
    NULL,
    'driver',
    NULL,
    NULL,
    '2022-05-25 11:50:50.206988',
    '2022-05-25 11:50:50.206988',
    NULL,
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'd835a4ec-3f76-4293-a870-3e3212a4019b',
    'admin',
    'a@a.com',
    '$2a$10$TxWUs3U7336b9fVOYI37FuS.K43Ahtqd3wK4XNNIPXNtJeWC4lc2W',
    '+1',
    '1234567889',
    NULL,
    'sub_admin',
    NULL,
    NULL,
    '2022-04-27 17:56:45.910957',
    '2022-05-02 16:54:39.000000',
    '2022-05-02 16:54:39.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'd951ad32-6d36-4048-870b-4a168c34d184',
    'test',
    'sarang+4@gmail.com',
    '$2a$10$IeuWK.xeIFt/SE9wTxo58O11.HA25WQNhM6KuVtsn5vdm..O1VT..',
    '+91',
    '9999999982',
    NULL,
    'driver',
    NULL,
    'cus_LiDETWRswlqTYm',
    '2022-05-18 18:50:43.934014',
    '2022-05-18 18:55:30.000000',
    '2022-05-18 18:55:30.000000',
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'da4d42e6-fa01-4902-af60-f6f212e9980c',
    'tes',
    'test@o.co',
    '$2a$10$IVkNemjsYYWLPZAuaMUYAuZN82F2usa37znVryKKjrW5zfbKN.0ky',
    '+1',
    '9696857421',
    NULL,
    'sub_admin',
    NULL,
    NULL,
    '2022-05-05 13:27:42.270478',
    '2022-05-24 10:24:20.000000',
    '2022-05-24 10:24:20.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    0,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'da9716ad-b7ca-48b4-82a8-5dc6d8e7ba66',
    'Tester',
    'chetan.b@peerbits.com',
    '$2a$08$KHfGCxdJjLZkItGml0S0h.rjnq88nNZ7jsWCzGgJo3Cj3PGgt.xIm',
    '+1',
    '9876543210',
    NULL,
    'vendor',
    NULL,
    'cus_LlWKFQm4qAJTMK',
    '2022-05-27 14:46:25.866890',
    '2022-05-27 15:41:34.000000',
    '2022-05-27 15:41:34.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'db09859a-2123-4134-9137-7f9ef23b8c3e',
    'Sarang Test',
    'testadmin@gmail.com',
    NULL,
    '+1',
    '1111111112',
    NULL,
    'vendor',
    NULL,
    'cus_Lb0fUE14Ya2MZZ',
    '2022-04-29 13:24:16.054234',
    '2022-04-29 16:46:34.000000',
    '2022-04-29 16:46:34.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'dba7e817-66b8-467a-b7ca-7e021b42be79',
    'user1',
    'user1@peerbits.com',
    '$2a$10$im1/s.JWTCm/z0pIQZvoc.lkYBKjRTRrUd4Z5gcj4lV1GxMv6D95C',
    '+1',
    '112233445560',
    NULL,
    'user',
    NULL,
    'cus_Li89vTFcQudARq',
    '2022-05-18 13:35:33.576327',
    '2022-05-18 13:36:06.000000',
    '2022-05-18 13:36:06.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'df4f5541-cad0-46bf-8648-da321b6bb8b2',
    'user1',
    'user1@peerbits.com',
    '$2a$10$qLnvsuWlGjBQ.IC5SnrRDOtTrj0ma8y6ufWbW4I8CS9xQaHWnpReG',
    '+1',
    '112233445560',
    NULL,
    'user',
    NULL,
    'cus_Li88TOhOlv12nQ',
    '2022-05-18 13:35:03.992921',
    '2022-05-18 13:35:26.000000',
    '2022-05-18 13:35:26.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'df8e1eea-f87d-4034-95d1-b5392d33e68f',
    'test10',
    'test10@peerbits.com',
    '$2a$10$domBYmdHb/CdQTJjnik2sewr4ONoBZHrz.CREzrVDsBCO13Tt.Wc2',
    '+1',
    '1122334455',
    NULL,
    'user',
    NULL,
    'cus_Li696glv6cBMW8',
    '2022-05-18 11:32:02.172196',
    '2022-05-18 11:34:20.000000',
    '2022-05-18 11:34:20.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'e604ead9-2bf0-415a-a63b-be393e533e43',
    'test user 1',
    'user@gmail.com',
    '$2a$10$XXv7thYewpTHOh5RRWA4BeU96DH3uugzCj0m0U8c2wTtXRB0c1WyO',
    '+91',
    '9999999981',
    NULL,
    'user',
    NULL,
    'cus_LacDJ4ZAtjAIXW',
    '2022-04-28 12:07:24.471909',
    '2022-05-05 13:17:03.000000',
    NULL,
    NULL,
    NULL,
    1,
    NULL,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'e74fc492-9d57-4107-8edd-223d827f967a',
    'test',
    'sarang+4@gmail.com',
    '$2a$10$1goEQnbL6moxy1Sp1MooDuOQ.NFVeyd4u7gtHwGuNHdzAZjxc8rHm',
    '+91',
    '99999999835',
    NULL,
    'driver',
    NULL,
    'cus_LiDZ6oDfDD2Pfe',
    '2022-05-18 19:11:35.235744',
    '2022-05-18 19:12:12.000000',
    '2022-05-18 19:12:12.000000',
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'ece28936-ac09-4d54-baea-63e37a3962ee',
    'test',
    'sarang+4@gmail.com',
    '$2a$10$SUAETWbnN0SSVwjU3j7dSuRKHyA2xrAm8ZIXHv19hoZuzwUzB.xLm',
    '+91',
    '99999999828',
    NULL,
    'driver',
    NULL,
    'cus_LiDWXUee3zTptx',
    '2022-05-18 19:09:05.925516',
    '2022-05-18 19:10:47.000000',
    '2022-05-18 19:10:47.000000',
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'f3e52816-bfdb-49b1-95fd-d6947f09585b',
    'test10',
    'test10@peerbits.com',
    '$2a$10$l33tshuXd8rivX/UR4cw2uT6d.95z4zJIKBkiUfvcY4xWzbeLJSr.',
    '+1',
    '1122334455',
    NULL,
    'user',
    NULL,
    'cus_Li5aHYHFq7VgQW',
    '2022-05-18 10:56:48.533735',
    '2022-05-18 10:57:18.000000',
    '2022-05-18 10:57:18.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'f4a2486e-8115-4e8d-b444-5dcd2b6114de',
    'test',
    'sarang.p+33@peerbits.com',
    '$2a$10$arqee4jcXrUvMFkgTTrMbupaEUAMbzbFfflOfaOojRrN9fQfiqMGm',
    '+1',
    '6666644443',
    NULL,
    'driver',
    NULL,
    'cus_LiDFMP7DDtDYqd',
    '2022-05-18 18:52:19.229700',
    '2022-05-18 18:55:17.000000',
    '2022-05-18 18:55:17.000000',
    NULL,
    NULL,
    1,
    0,
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
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_subscription_count`,
    `last_purchase_date`
  )
VALUES
  (
    'fedc508c-07b3-4311-b5eb-36cfdd582375',
    'test11',
    'test11@peerbits.com',
    '$2a$10$9HmqioHdw4FGn8n1H2MeceJr4G2I5XuiUnB8wbJ3kp.V8/9KuwPBG',
    '+1',
    '11223344556',
    NULL,
    'user',
    NULL,
    'cus_Li6PQRkhoPKHCV',
    '2022-05-18 11:47:38.835477',
    '2022-05-18 11:48:08.000000',
    '2022-05-18 11:48:08.000000',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    0,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vendor_bank_details
# ------------------------------------------------------------

INSERT INTO
  `vendor_bank_details` (
    `id`,
    `bank_name`,
    `account_holder_name`,
    `account_number`,
    `branch_name`,
    `branch_code`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_id`
  )
VALUES
  (
    1,
    'test',
    'test',
    121854561321,
    'ret',
    '100200GET',
    '2022-05-25 11:05:47.016026',
    '2022-05-26 12:44:17.000000',
    NULL,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    1,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7'
  );
INSERT INTO
  `vendor_bank_details` (
    `id`,
    `bank_name`,
    `account_holder_name`,
    `account_number`,
    `branch_name`,
    `branch_code`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_id`
  )
VALUES
  (
    2,
    'SCBss',
    'PEERBITS',
    121216845115,
    'AMD',
    '2153 Test ',
    '2022-05-25 11:56:55.432368',
    '2022-05-26 12:43:09.000000',
    NULL,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    1,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7'
  );
INSERT INTO
  `vendor_bank_details` (
    `id`,
    `bank_name`,
    `account_holder_name`,
    `account_number`,
    `branch_name`,
    `branch_code`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_id`
  )
VALUES
  (
    3,
    'SVCBCB',
    'POPOA',
    1234567890,
    'BCD',
    'qweqweqw',
    '2022-05-25 12:43:14.743113',
    '2022-05-25 12:43:14.743113',
    NULL,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7',
    1,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7'
  );
INSERT INTO
  `vendor_bank_details` (
    `id`,
    `bank_name`,
    `account_holder_name`,
    `account_number`,
    `branch_name`,
    `branch_code`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_id`
  )
VALUES
  (
    4,
    'TEST NEW ADD',
    'CHECKING ',
    7228921472,
    'fds',
    'sdfsd',
    '2022-05-26 12:16:49.401421',
    '2022-05-26 12:16:49.401421',
    NULL,
    NULL,
    NULL,
    1,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7'
  );
INSERT INTO
  `vendor_bank_details` (
    `id`,
    `bank_name`,
    `account_holder_name`,
    `account_number`,
    `branch_name`,
    `branch_code`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_id`
  )
VALUES
  (
    5,
    'test',
    'test',
    121854561321,
    'ret',
    '100200GET',
    '2022-05-26 12:23:47.042646',
    '2022-05-26 12:25:13.000000',
    NULL,
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c'
  );
INSERT INTO
  `vendor_bank_details` (
    `id`,
    `bank_name`,
    `account_holder_name`,
    `account_number`,
    `branch_name`,
    `branch_code`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_id`
  )
VALUES
  (
    6,
    'sdfdsf',
    'dfsdfds',
    3424324324,
    'dsfsdf',
    'sdfdsf',
    '2022-05-26 12:46:34.561346',
    '2022-05-26 12:46:34.561346',
    NULL,
    NULL,
    NULL,
    1,
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7'
  );
INSERT INTO
  `vendor_bank_details` (
    `id`,
    `bank_name`,
    `account_holder_name`,
    `account_number`,
    `branch_name`,
    `branch_code`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `created_by`,
    `updated_by`,
    `is_active`,
    `user_id`
  )
VALUES
  (
    7,
    'BANK OF BARODA ',
    'Chetan Sharma ',
    123456789011,
    'Sarkhej',
    '0004',
    '2022-05-27 16:28:09.749907',
    '2022-05-27 16:28:59.000000',
    NULL,
    NULL,
    '4146a641-3e5a-4448-a7d0-15f302771426',
    1,
    '4146a641-3e5a-4448-a7d0-15f302771426'
  );

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
    'test',
    'Ahmedabad',
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-27 15:28:30.578323',
    '2022-04-27 15:57:14.485781',
    NULL,
    NULL,
    '1,2',
    NULL,
    0,
    0,
    6,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '761a35de-a2ca-4e4b-8784-08b94f2e5875'
  );
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
    2,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-27 15:30:11.519766',
    '2022-04-27 15:57:14.488351',
    NULL,
    NULL,
    '1,2,3',
    NULL,
    0,
    1,
    6,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    'a64037fb-229b-4090-9c3b-6b49e449f079'
  );
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
    3,
    'TEST',
    'Testing',
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-27 15:31:15.789669',
    '2022-04-27 15:57:14.489715',
    NULL,
    NULL,
    '1,2',
    NULL,
    0,
    1,
    6,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    'd319c66f-1f6f-4b3b-8c91-e19d9befb705'
  );
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
    4,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-27 15:31:15.856880',
    '2022-04-27 15:57:14.491385',
    NULL,
    NULL,
    '1,2',
    NULL,
    0,
    1,
    6,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '8fc2ab89-5bcd-4486-aa82-3a931ea6e32a'
  );
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
    5,
    'Sarang Test',
    'Ahmedabad, Gujarat, India',
    90,
    '10',
    NULL,
    NULL,
    '2022-04-27 15:39:45.623100',
    '2022-05-30 16:03:05.000000',
    NULL,
    NULL,
    '4,5,8,9',
    '2,64',
    0,
    1,
    6,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '6a7cdcd3-b4de-4bad-923a-b0b080876fd7'
  );
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
    6,
    'tdsadf',
    'sadfsda',
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-27 16:21:56.434458',
    '2022-04-27 16:22:07.000000',
    NULL,
    NULL,
    '1',
    NULL,
    0,
    1,
    2,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2334499c-4748-4027-8aff-19674e5f1187'
  );
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
    7,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-28 10:08:36.740823',
    '2022-04-28 10:08:36.740823',
    NULL,
    NULL,
    '5,4,2',
    NULL,
    0,
    0,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '80714615-3417-4a38-a540-104da6894149'
  );
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
    8,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-28 10:15:34.527707',
    '2022-04-28 10:15:34.527707',
    NULL,
    NULL,
    '2,4,5',
    NULL,
    0,
    0,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    'b53e33db-e131-425a-a619-f41d98317a00'
  );
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
    9,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-28 10:19:44.443678',
    '2022-04-28 10:19:44.443678',
    NULL,
    NULL,
    '4,5,8,2',
    NULL,
    0,
    1,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '037a9a07-3145-4133-bc9d-0989b7ee8580'
  );
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
    10,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-28 10:29:46.709602',
    '2022-04-28 10:29:46.709602',
    NULL,
    NULL,
    '2,4,5',
    NULL,
    0,
    1,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '6455b11f-2c5e-40ea-94c7-74849f817c25'
  );
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
    11,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-28 10:31:04.741024',
    '2022-04-28 10:31:04.741024',
    NULL,
    NULL,
    '2,4,5',
    NULL,
    0,
    1,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '7f6cd4d8-0f1d-4701-ad25-f91db93180a2'
  );
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
    12,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-28 10:31:26.780311',
    '2022-04-28 10:31:26.780311',
    NULL,
    NULL,
    '4,5,8,2',
    NULL,
    0,
    1,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2bc0cb6b-be1b-49c3-80ef-f4f8da9a1cac'
  );
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
    13,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-28 10:33:48.817265',
    '2022-04-28 10:33:48.817265',
    NULL,
    NULL,
    '4,5',
    NULL,
    0,
    1,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '326bacd0-0164-444b-8eef-500b44707825'
  );
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
    14,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-28 10:36:08.254609',
    '2022-04-28 10:36:08.254609',
    NULL,
    NULL,
    '5,4,8',
    NULL,
    0,
    0,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    'bff668dc-c411-482c-81cb-64009918df9b'
  );
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
    15,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-28 10:37:07.856762',
    '2022-04-28 10:37:07.856762',
    NULL,
    NULL,
    '5,8',
    NULL,
    0,
    0,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '86907473-69a5-4898-9d2a-e683d2d02565'
  );
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
    16,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-28 10:39:05.201414',
    '2022-04-28 10:39:05.201414',
    NULL,
    NULL,
    '5,4,8',
    NULL,
    0,
    1,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    'd6a45750-e012-4809-8b59-0608945030b9'
  );
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
    17,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-28 10:39:26.279096',
    '2022-04-28 10:39:26.279096',
    NULL,
    NULL,
    '4,5,8,2',
    NULL,
    0,
    1,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    'bfde0d10-c1c1-4bd2-93fb-467439097d13'
  );
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
    18,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-28 10:41:42.868233',
    '2022-04-28 10:41:42.868233',
    NULL,
    NULL,
    '2,4,5',
    NULL,
    0,
    1,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '75b869cd-3f2a-4eb8-ad88-90f9e6959eb4'
  );
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
    19,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-28 10:42:42.689871',
    '2022-04-28 10:42:42.689871',
    NULL,
    NULL,
    '4,2,5',
    NULL,
    0,
    1,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '8ba01fd1-6aaf-49db-8415-8cc11d93043a'
  );
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
    20,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-28 10:46:00.855965',
    '2022-04-28 10:46:00.855965',
    NULL,
    NULL,
    '4,5,8',
    NULL,
    0,
    1,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2b1b9fef-0203-4aa7-b8e9-2a380decefa5'
  );
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
    21,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-28 10:48:12.989983',
    '2022-04-28 10:48:12.989983',
    NULL,
    NULL,
    '2,4,5,8',
    NULL,
    0,
    1,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '1e033672-b8ea-47bb-9b8d-22662bb04026'
  );
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
    22,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-28 10:50:22.877294',
    '2022-04-28 10:50:22.877294',
    NULL,
    NULL,
    '2,4,5',
    NULL,
    0,
    1,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    'bce88ea5-cc92-4fc8-b94f-ba90d62bd4d6'
  );
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
    23,
    'Sarang Test',
    'Hamburg, Germany',
    95,
    '2',
    NULL,
    NULL,
    '2022-04-28 10:51:19.936638',
    '2022-04-29 12:26:59.000000',
    NULL,
    NULL,
    '4,5,8,9',
    '1,62,64',
    0,
    1,
    6,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '13183e4a-be4d-432c-96f5-3b603e6b6cd9'
  );
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
    24,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-28 10:53:47.017401',
    '2022-04-28 10:53:47.017401',
    NULL,
    NULL,
    '4,5,8',
    NULL,
    0,
    1,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '7ce71cc2-a0da-40bb-9b30-2145f168d49c'
  );
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
    25,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-28 11:23:12.264548',
    '2022-04-28 11:23:12.264548',
    NULL,
    NULL,
    '2,4,5',
    NULL,
    0,
    1,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '44efaf40-4738-4681-8bb7-336fac2e3cd1'
  );
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
    26,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-28 11:24:11.490890',
    '2022-04-28 11:24:11.490890',
    NULL,
    NULL,
    '5,4,8',
    NULL,
    0,
    1,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '561afdc9-bb80-4e09-80c0-6d7b47d112d0'
  );
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
    27,
    'fdfdd',
    'fdgfdg',
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-29 13:18:43.115920',
    '2022-04-29 13:18:59.000000',
    NULL,
    NULL,
    '5',
    NULL,
    0,
    1,
    2,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '3a9a1b62-4abb-44b3-b2c8-6026195c6ea5'
  );
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
    28,
    'Dell',
    'Hamburg, Germany',
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-29 13:24:15.475570',
    '2022-04-29 13:24:25.000000',
    NULL,
    NULL,
    '4,5,8,9',
    NULL,
    0,
    1,
    2,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '6be90c25-7f58-4502-ab3c-44b742e221a4'
  );
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
    29,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-04-29 13:24:16.066264',
    '2022-04-29 13:24:16.066264',
    NULL,
    NULL,
    '4,5,8,9',
    NULL,
    0,
    1,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    'db09859a-2123-4134-9137-7f9ef23b8c3e'
  );
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
    30,
    'TEST',
    'ADMIN',
    50,
    '50',
    NULL,
    NULL,
    '2022-05-02 13:13:43.233483',
    '2022-05-11 16:56:18.000000',
    NULL,
    NULL,
    '4,5,8,9',
    '62,64',
    0,
    0,
    6,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '6edea6c6-b8ad-45d6-bee9-928a8c599e30'
  );
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
    31,
    'test',
    'Ahmedabad',
    20,
    '10',
    NULL,
    NULL,
    '2022-05-16 12:59:18.507524',
    '2022-05-16 17:09:23.000000',
    NULL,
    NULL,
    '4,5,8,9',
    '64',
    0,
    0,
    6,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '3f3c9e66-e7b8-4ea8-bd46-96dd0de6d318'
  );
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
    32,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-05-16 18:35:46.156873',
    '2022-05-16 18:35:46.156873',
    NULL,
    NULL,
    '4,5,8',
    NULL,
    0,
    0,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '6fa17795-bea6-4ade-b6b4-1a341bc5149c'
  );
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
    33,
    'TEST',
    'Gujarat',
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-05-18 11:18:42.038877',
    '2022-05-18 19:06:12.000000',
    NULL,
    NULL,
    '5,8,9',
    '',
    0,
    0,
    5,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    'ade2ec99-f561-49fa-ab78-36f083faceba'
  );
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
    34,
    'TEST',
    'ADMIN',
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-05-18 14:43:56.333374',
    '2022-05-18 19:18:50.000000',
    NULL,
    NULL,
    '4,5',
    '1',
    0,
    0,
    5,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    'a202cb0f-ce05-4981-b2e6-311f24ddaf47'
  );
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
    35,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-05-20 10:34:56.135959',
    '2022-05-20 10:34:56.135959',
    NULL,
    NULL,
    '5',
    NULL,
    0,
    0,
    1,
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    NULL
  );
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
    36,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2022-05-27 14:41:40.918017',
    '2022-05-27 14:41:40.918017',
    NULL,
    NULL,
    '4',
    NULL,
    0,
    1,
    1,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '2a133863-2a45-4d1f-bf96-7f88ec2f8c61'
  );
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
    37,
    'Test Vendor',
    'etses',
    12,
    '21',
    NULL,
    NULL,
    '2022-05-27 14:46:25.879523',
    '2022-05-27 15:22:13.000000',
    NULL,
    NULL,
    '5',
    '1,62',
    0,
    1,
    6,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    'da9716ad-b7ca-48b4-82a8-5dc6d8e7ba66'
  );
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
    38,
    'test',
    't1',
    20,
    '15',
    NULL,
    NULL,
    '2022-05-27 15:30:23.615013',
    '2022-05-27 15:32:23.000000',
    NULL,
    NULL,
    '4,5',
    '1',
    0,
    1,
    6,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '3dcff22c-b066-4742-8d21-00fb0567a48a'
  );
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
    39,
    'cfh',
    'gvbhv',
    10,
    '20',
    NULL,
    NULL,
    '2022-05-27 15:42:44.473026',
    '2022-06-07 11:14:12.000000',
    NULL,
    NULL,
    '4,5',
    '1,62',
    1,
    1,
    6,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '4146a641-3e5a-4448-a7d0-15f302771426'
  );
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
    40,
    'b1',
    'b2',
    20,
    '25',
    NULL,
    NULL,
    '2022-05-30 16:10:10.383304',
    '2022-05-30 16:59:20.000000',
    NULL,
    NULL,
    '4',
    '62,64',
    0,
    1,
    6,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '098b2069-6aba-4686-88bd-76a757faf2e9'
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
    100,
    '2022-04-27 15:42:43.484330',
    '2022-04-29 13:04:30.000000',
    '2022-04-29 13:04:30.000000',
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
    2,
    100,
    '2022-04-27 15:42:43.495151',
    '2022-04-29 13:04:30.000000',
    '2022-04-29 13:04:30.000000',
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
    3,
    10,
    '2022-04-27 15:42:43.500708',
    '2022-04-29 13:04:30.000000',
    '2022-04-29 13:04:30.000000',
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
    4,
    20,
    '2022-04-27 15:42:43.506439',
    '2022-04-29 13:04:30.000000',
    '2022-04-29 13:04:30.000000',
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
    5,
    2,
    '2022-04-27 15:42:43.511291',
    '2022-04-29 13:04:30.000000',
    '2022-04-29 13:04:30.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    1,
    5,
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
    100,
    '2022-04-27 15:43:27.504013',
    '2022-05-18 17:01:36.000000',
    '2022-05-18 17:01:36.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    2,
    6,
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
    200,
    '2022-04-27 15:43:27.511494',
    '2022-05-18 17:01:36.000000',
    '2022-05-18 17:01:36.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    2,
    7,
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
    21,
    '2022-04-27 15:43:27.517428',
    '2022-05-18 17:01:36.000000',
    '2022-05-18 17:01:36.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    2,
    8,
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
    21,
    '2022-04-27 15:43:27.522093',
    '2022-05-18 17:01:36.000000',
    '2022-05-18 17:01:36.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    2,
    9,
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
    10,
    2,
    '2022-04-27 15:43:27.529934',
    '2022-05-18 17:01:36.000000',
    '2022-05-18 17:01:36.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    2,
    10,
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
    11,
    10,
    '2022-04-27 15:44:26.482077',
    '2022-04-27 15:44:29.000000',
    '2022-04-27 15:44:29.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    3,
    11,
    2,
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
    12,
    20,
    '2022-04-27 15:44:26.489021',
    '2022-04-27 15:44:29.000000',
    '2022-04-27 15:44:29.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    3,
    12,
    2,
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
    13,
    30,
    '2022-04-27 15:44:26.497097',
    '2022-04-27 15:44:29.000000',
    '2022-04-27 15:44:29.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    3,
    13,
    2,
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
    14,
    10,
    '2022-04-27 15:44:26.502112',
    '2022-04-27 15:44:29.000000',
    '2022-04-27 15:44:29.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    3,
    14,
    2,
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
    15,
    10,
    '2022-04-27 15:44:46.771497',
    '2022-05-18 17:33:41.000000',
    '2022-05-18 17:33:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    3,
    11,
    2,
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
    16,
    20,
    '2022-04-27 15:44:46.779396',
    '2022-05-18 17:33:41.000000',
    '2022-05-18 17:33:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    3,
    12,
    2,
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
    17,
    30,
    '2022-04-27 15:44:46.784424',
    '2022-05-18 17:33:41.000000',
    '2022-05-18 17:33:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    3,
    13,
    2,
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
    18,
    10,
    '2022-04-27 15:44:46.789122',
    '2022-05-18 17:33:41.000000',
    '2022-05-18 17:33:41.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    3,
    14,
    2,
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
    19,
    2,
    '2022-04-27 15:45:27.312359',
    '2022-04-29 12:17:30.000000',
    '2022-04-29 12:17:30.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    3,
    11,
    11,
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
    20,
    3,
    '2022-04-27 15:45:27.319902',
    '2022-04-29 12:17:30.000000',
    '2022-04-29 12:17:30.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    3,
    12,
    11,
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
    21,
    4,
    '2022-04-27 15:45:27.326130',
    '2022-04-29 12:17:30.000000',
    '2022-04-29 12:17:30.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    3,
    13,
    11,
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
    22,
    3,
    '2022-04-27 15:45:27.332817',
    '2022-04-29 12:17:30.000000',
    '2022-04-29 12:17:30.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    3,
    14,
    11,
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
    23,
    10,
    '2022-04-27 15:48:37.696479',
    '2022-04-29 13:17:16.000000',
    '2022-04-29 13:17:16.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    4,
    15,
    2,
    2
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
    24,
    10,
    '2022-04-27 15:48:37.702304',
    '2022-04-29 13:17:16.000000',
    '2022-04-29 13:17:16.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    4,
    16,
    2,
    2
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
    25,
    10,
    '2022-04-27 15:48:37.710327',
    '2022-04-29 13:17:16.000000',
    '2022-04-29 13:17:16.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    4,
    17,
    2,
    2
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
    26,
    10,
    '2022-04-27 15:48:37.715232',
    '2022-04-29 13:17:16.000000',
    '2022-04-29 13:17:16.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    4,
    18,
    2,
    2
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
    27,
    10,
    '2022-04-27 15:49:02.857377',
    '2022-04-29 13:17:16.000000',
    '2022-04-29 13:17:16.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    4,
    15,
    2,
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
    28,
    10,
    '2022-04-27 15:49:02.864526',
    '2022-04-29 13:17:16.000000',
    '2022-04-29 13:17:16.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    4,
    16,
    2,
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
    29,
    100,
    '2022-04-27 15:49:02.874919',
    '2022-04-29 13:17:16.000000',
    '2022-04-29 13:17:16.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    4,
    17,
    2,
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
    30,
    10,
    '2022-04-27 15:49:02.879892',
    '2022-04-29 13:17:16.000000',
    '2022-04-29 13:17:16.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    4,
    18,
    2,
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
    31,
    5,
    '2022-04-27 16:23:56.617168',
    '2022-04-27 16:25:52.000000',
    '2022-04-27 16:25:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    5,
    19,
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
    32,
    5,
    '2022-04-27 16:23:56.623315',
    '2022-04-27 16:25:52.000000',
    '2022-04-27 16:25:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    5,
    20,
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
    33,
    5,
    '2022-04-27 16:23:56.629716',
    '2022-04-27 16:25:52.000000',
    '2022-04-27 16:25:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    5,
    21,
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
    34,
    5,
    '2022-04-27 16:23:56.634755',
    '2022-04-27 16:25:52.000000',
    '2022-04-27 16:25:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    5,
    22,
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
    35,
    5,
    '2022-04-27 16:23:56.640070',
    '2022-04-27 16:25:52.000000',
    '2022-04-27 16:25:52.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    5,
    23,
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
    36,
    5,
    '2022-04-27 16:26:21.935918',
    '2022-04-27 16:26:21.935918',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    6,
    24,
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
    37,
    5,
    '2022-04-27 16:26:21.946060',
    '2022-04-27 16:26:21.946060',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    6,
    25,
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
    38,
    5,
    '2022-04-27 16:26:21.952994',
    '2022-04-27 16:26:21.952994',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    6,
    26,
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
    39,
    5,
    '2022-04-27 16:26:21.959148',
    '2022-04-27 16:26:21.959148',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    6,
    27,
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
    40,
    5,
    '2022-04-27 16:26:21.965209',
    '2022-04-27 16:26:21.965209',
    NULL,
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    6,
    28,
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
    41,
    10,
    '2022-04-27 16:27:26.738864',
    '2022-04-27 16:27:44.000000',
    '2022-04-27 16:27:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    7,
    29,
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
    42,
    10,
    '2022-04-27 16:27:26.743764',
    '2022-04-27 16:27:44.000000',
    '2022-04-27 16:27:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    7,
    30,
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
    43,
    10,
    '2022-04-27 16:27:26.749415',
    '2022-04-27 16:27:44.000000',
    '2022-04-27 16:27:44.000000',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    '706dd907-3b96-4ad7-84a4-f5ac91ebd68c',
    7,
    31,
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
    44,