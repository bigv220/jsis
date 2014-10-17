/*
MySQL Data Transfer
Source Host: localhost
Source Database: xxrshop
Target Host: localhost
Target Database: xxrshop
Date: 2014/3/9 10:56:16
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for js_address
-- ----------------------------
CREATE TABLE `js_address` (
  `address_id` int(11) NOT NULL auto_increment,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `tax_id` varchar(32) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL default '0',
  `zone_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_affiliate
-- ----------------------------
CREATE TABLE `js_affiliate` (
  `affiliate_id` int(11) NOT NULL auto_increment,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(32) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL default '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_affiliate_transaction
-- ----------------------------
CREATE TABLE `js_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL auto_increment,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_attribute
-- ----------------------------
CREATE TABLE `js_attribute` (
  `attribute_id` int(11) NOT NULL auto_increment,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`attribute_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_attribute_description
-- ----------------------------
CREATE TABLE `js_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY  (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_attribute_group
-- ----------------------------
CREATE TABLE `js_attribute_group` (
  `attribute_group_id` int(11) NOT NULL auto_increment,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`attribute_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_attribute_group_description
-- ----------------------------
CREATE TABLE `js_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY  (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_banner
-- ----------------------------
CREATE TABLE `js_banner` (
  `banner_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY  (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_banner_image
-- ----------------------------
CREATE TABLE `js_banner_image` (
  `banner_image_id` int(11) NOT NULL auto_increment,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY  (`banner_image_id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_banner_image_description
-- ----------------------------
CREATE TABLE `js_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY  (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_category
-- ----------------------------
CREATE TABLE `js_category` (
  `category_id` int(11) NOT NULL auto_increment,
  `image` varchar(255) default NULL,
  `parent_id` int(11) NOT NULL default '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL default '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_category_description
-- ----------------------------
CREATE TABLE `js_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY  (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_category_filter
-- ----------------------------
CREATE TABLE `js_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY  (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_category_path
-- ----------------------------
CREATE TABLE `js_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY  (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_category_to_layout
-- ----------------------------
CREATE TABLE `js_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY  (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_category_to_store
-- ----------------------------
CREATE TABLE `js_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY  (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_country
-- ----------------------------
CREATE TABLE `js_country` (
  `country_id` int(11) NOT NULL auto_increment,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=252 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_coupon
-- ----------------------------
CREATE TABLE `js_coupon` (
  `coupon_id` int(11) NOT NULL auto_increment,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL default '0000-00-00',
  `date_end` date NOT NULL default '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`coupon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_coupon_category
-- ----------------------------
CREATE TABLE `js_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY  (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_coupon_history
-- ----------------------------
CREATE TABLE `js_coupon_history` (
  `coupon_history_id` int(11) NOT NULL auto_increment,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_coupon_product
-- ----------------------------
CREATE TABLE `js_coupon_product` (
  `coupon_product_id` int(11) NOT NULL auto_increment,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY  (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_currency
-- ----------------------------
CREATE TABLE `js_currency` (
  `currency_id` int(11) NOT NULL auto_increment,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`currency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_custom_field
-- ----------------------------
CREATE TABLE `js_custom_field` (
  `custom_field_id` int(11) NOT NULL auto_increment,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  `location` varchar(32) NOT NULL,
  `position` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_custom_field_description
-- ----------------------------
CREATE TABLE `js_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY  (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_custom_field_to_customer_group
-- ----------------------------
CREATE TABLE `js_custom_field_to_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY  (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_custom_field_value
-- ----------------------------
CREATE TABLE `js_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL auto_increment,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_custom_field_value_description
-- ----------------------------
CREATE TABLE `js_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY  (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_customer
-- ----------------------------
CREATE TABLE `js_customer` (
  `customer_id` int(11) NOT NULL auto_increment,
  `store_id` int(11) NOT NULL default '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL default '0',
  `address_id` int(11) NOT NULL default '0',
  `customer_group_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL default '0',
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_customer_ban_ip
-- ----------------------------
CREATE TABLE `js_customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL auto_increment,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY  (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_customer_field
-- ----------------------------
CREATE TABLE `js_customer_field` (
  `customer_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`customer_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_customer_group
-- ----------------------------
CREATE TABLE `js_customer_group` (
  `customer_group_id` int(11) NOT NULL auto_increment,
  `approval` int(1) NOT NULL,
  `company_id_display` int(1) NOT NULL,
  `company_id_required` int(1) NOT NULL,
  `tax_id_display` int(1) NOT NULL,
  `tax_id_required` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`customer_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_customer_group_description
-- ----------------------------
CREATE TABLE `js_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY  (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_customer_history
-- ----------------------------
CREATE TABLE `js_customer_history` (
  `customer_history_id` int(11) NOT NULL auto_increment,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_customer_ip
-- ----------------------------
CREATE TABLE `js_customer_ip` (
  `customer_ip_id` int(11) NOT NULL auto_increment,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_customer_online
-- ----------------------------
CREATE TABLE `js_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_customer_reward
-- ----------------------------
CREATE TABLE `js_customer_reward` (
  `customer_reward_id` int(11) NOT NULL auto_increment,
  `customer_id` int(11) NOT NULL default '0',
  `order_id` int(11) NOT NULL default '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_customer_transaction
-- ----------------------------
CREATE TABLE `js_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL auto_increment,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_download
-- ----------------------------
CREATE TABLE `js_download` (
  `download_id` int(11) NOT NULL auto_increment,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(11) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_download_description
-- ----------------------------
CREATE TABLE `js_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY  (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_extension
-- ----------------------------
CREATE TABLE `js_extension` (
  `extension_id` int(11) NOT NULL auto_increment,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY  (`extension_id`)
) ENGINE=MyISAM AUTO_INCREMENT=443 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_filter
-- ----------------------------
CREATE TABLE `js_filter` (
  `filter_id` int(11) NOT NULL auto_increment,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_filter_description
-- ----------------------------
CREATE TABLE `js_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY  (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_filter_group
-- ----------------------------
CREATE TABLE `js_filter_group` (
  `filter_group_id` int(11) NOT NULL auto_increment,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`filter_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_filter_group_description
-- ----------------------------
CREATE TABLE `js_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY  (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_geo_zone
-- ----------------------------
CREATE TABLE `js_geo_zone` (
  `geo_zone_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_information
-- ----------------------------
CREATE TABLE `js_information` (
  `information_id` int(11) NOT NULL auto_increment,
  `bottom` int(1) NOT NULL default '0',
  `sort_order` int(3) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`information_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_information_description
-- ----------------------------
CREATE TABLE `js_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY  (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_information_to_layout
-- ----------------------------
CREATE TABLE `js_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY  (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_information_to_store
-- ----------------------------
CREATE TABLE `js_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY  (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_language
-- ----------------------------
CREATE TABLE `js_language` (
  `language_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `filename` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL default '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY  (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_layout
-- ----------------------------
CREATE TABLE `js_layout` (
  `layout_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY  (`layout_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_layout_route
-- ----------------------------
CREATE TABLE `js_layout_route` (
  `layout_route_id` int(11) NOT NULL auto_increment,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY  (`layout_route_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_length_class
-- ----------------------------
CREATE TABLE `js_length_class` (
  `length_class_id` int(11) NOT NULL auto_increment,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY  (`length_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_length_class_description
-- ----------------------------
CREATE TABLE `js_length_class_description` (
  `length_class_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY  (`length_class_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_manufacturer
-- ----------------------------
CREATE TABLE `js_manufacturer` (
  `manufacturer_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) default NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`manufacturer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_manufacturer_to_store
-- ----------------------------
CREATE TABLE `js_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY  (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_openbay_faq
-- ----------------------------
CREATE TABLE `js_openbay_faq` (
  `id` int(11) NOT NULL auto_increment,
  `route` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_option
-- ----------------------------
CREATE TABLE `js_option` (
  `option_id` int(11) NOT NULL auto_increment,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_option_description
-- ----------------------------
CREATE TABLE `js_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY  (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_option_value
-- ----------------------------
CREATE TABLE `js_option_value` (
  `option_value_id` int(11) NOT NULL auto_increment,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`option_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_option_value_description
-- ----------------------------
CREATE TABLE `js_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY  (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_order
-- ----------------------------
CREATE TABLE `js_order` (
  `order_id` int(11) NOT NULL auto_increment,
  `invoice_no` int(11) NOT NULL default '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL default '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL default '0',
  `customer_group_id` int(11) NOT NULL default '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(32) NOT NULL,
  `payment_company_id` varchar(32) NOT NULL,
  `payment_tax_id` varchar(32) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(32) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL default '0.0000',
  `order_status_id` int(11) NOT NULL default '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL default '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_order_download
-- ----------------------------
CREATE TABLE `js_order_download` (
  `order_download_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(3) NOT NULL default '0',
  PRIMARY KEY  (`order_download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_order_field
-- ----------------------------
CREATE TABLE `js_order_field` (
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`order_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_order_fraud
-- ----------------------------
CREATE TABLE `js_order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_order_history
-- ----------------------------
CREATE TABLE `js_order_history` (
  `order_history_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL default '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`order_history_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_order_option
-- ----------------------------
CREATE TABLE `js_order_option` (
  `order_option_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY  (`order_option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_order_product
-- ----------------------------
CREATE TABLE `js_order_product` (
  `order_product_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL default '0.0000',
  `total` decimal(15,4) NOT NULL default '0.0000',
  `tax` decimal(15,4) NOT NULL default '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY  (`order_product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_order_recurring
-- ----------------------------
CREATE TABLE `js_order_recurring` (
  `order_recurring_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `profile_name` varchar(255) NOT NULL,
  `profile_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `profile_reference` varchar(255) NOT NULL,
  PRIMARY KEY  (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_order_recurring_transaction
-- ----------------------------
CREATE TABLE `js_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL auto_increment,
  `order_recurring_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY  (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_order_status
-- ----------------------------
CREATE TABLE `js_order_status` (
  `order_status_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY  (`order_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_order_total
-- ----------------------------
CREATE TABLE `js_order_total` (
  `order_total_id` int(10) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL default '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`order_total_id`),
  KEY `idx_orders_total_orders_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_order_voucher
-- ----------------------------
CREATE TABLE `js_order_voucher` (
  `order_voucher_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY  (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_product
-- ----------------------------
CREATE TABLE `js_product` (
  `product_id` int(11) NOT NULL auto_increment,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL default '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) default NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL default '1',
  `price` decimal(15,4) NOT NULL default '0.0000',
  `points` int(8) NOT NULL default '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL,
  `weight` decimal(15,8) NOT NULL default '0.00000000',
  `weight_class_id` int(11) NOT NULL default '0',
  `length` decimal(15,8) NOT NULL default '0.00000000',
  `width` decimal(15,8) NOT NULL default '0.00000000',
  `height` decimal(15,8) NOT NULL default '0.00000000',
  `length_class_id` int(11) NOT NULL default '0',
  `subtract` tinyint(1) NOT NULL default '1',
  `minimum` int(11) NOT NULL default '1',
  `sort_order` int(11) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL default '0',
  PRIMARY KEY  (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=379 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_product_attribute
-- ----------------------------
CREATE TABLE `js_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY  (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_product_description
-- ----------------------------
CREATE TABLE `js_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  PRIMARY KEY  (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_product_discount
-- ----------------------------
CREATE TABLE `js_product_discount` (
  `product_discount_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL default '0',
  `priority` int(5) NOT NULL default '1',
  `price` decimal(15,4) NOT NULL default '0.0000',
  `date_start` date NOT NULL default '0000-00-00',
  `date_end` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=462 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_product_filter
-- ----------------------------
CREATE TABLE `js_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY  (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_product_image
-- ----------------------------
CREATE TABLE `js_product_image` (
  `product_image_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) default NULL,
  `sort_order` int(3) NOT NULL default '0',
  PRIMARY KEY  (`product_image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_product_option
-- ----------------------------
CREATE TABLE `js_product_option` (
  `product_option_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY  (`product_option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_product_option_value
-- ----------------------------
CREATE TABLE `js_product_option_value` (
  `product_option_value_id` int(11) NOT NULL auto_increment,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY  (`product_option_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_product_profile
-- ----------------------------
CREATE TABLE `js_product_profile` (
  `product_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY  (`product_id`,`profile_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_product_recurring
-- ----------------------------
CREATE TABLE `js_product_recurring` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY  (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_product_related
-- ----------------------------
CREATE TABLE `js_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY  (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_product_reward
-- ----------------------------
CREATE TABLE `js_product_reward` (
  `product_reward_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL default '0',
  `customer_group_id` int(11) NOT NULL default '0',
  `points` int(8) NOT NULL default '0',
  PRIMARY KEY  (`product_reward_id`)
) ENGINE=MyISAM AUTO_INCREMENT=608 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_product_special
-- ----------------------------
CREATE TABLE `js_product_special` (
  `product_special_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL default '1',
  `price` decimal(15,4) NOT NULL default '0.0000',
  `date_start` date NOT NULL default '0000-00-00',
  `date_end` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=457 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_product_to_category
-- ----------------------------
CREATE TABLE `js_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY  (`product_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_product_to_download
-- ----------------------------
CREATE TABLE `js_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY  (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_product_to_layout
-- ----------------------------
CREATE TABLE `js_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY  (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_product_to_store
-- ----------------------------
CREATE TABLE `js_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_profile
-- ----------------------------
CREATE TABLE `js_profile` (
  `profile_id` int(11) NOT NULL auto_increment,
  `sort_order` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`profile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_profile_description
-- ----------------------------
CREATE TABLE `js_profile_description` (
  `profile_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`profile_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_return
-- ----------------------------
CREATE TABLE `js_return` (
  `return_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_return_action
-- ----------------------------
CREATE TABLE `js_return_action` (
  `return_action_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL default '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY  (`return_action_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_return_history
-- ----------------------------
CREATE TABLE `js_return_history` (
  `return_history_id` int(11) NOT NULL auto_increment,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_return_reason
-- ----------------------------
CREATE TABLE `js_return_reason` (
  `return_reason_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL default '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY  (`return_reason_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_return_status
-- ----------------------------
CREATE TABLE `js_return_status` (
  `return_status_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL default '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY  (`return_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_review
-- ----------------------------
CREATE TABLE `js_review` (
  `review_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_setting
-- ----------------------------
CREATE TABLE `js_setting` (
  `setting_id` int(11) NOT NULL auto_increment,
  `store_id` int(11) NOT NULL default '0',
  `group` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY  (`setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3735 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_stock_status
-- ----------------------------
CREATE TABLE `js_stock_status` (
  `stock_status_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY  (`stock_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_store
-- ----------------------------
CREATE TABLE `js_store` (
  `store_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY  (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_tax_class
-- ----------------------------
CREATE TABLE `js_tax_class` (
  `tax_class_id` int(11) NOT NULL auto_increment,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`tax_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_tax_rate
-- ----------------------------
CREATE TABLE `js_tax_rate` (
  `tax_rate_id` int(11) NOT NULL auto_increment,
  `geo_zone_id` int(11) NOT NULL default '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL default '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`tax_rate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_tax_rate_to_customer_group
-- ----------------------------
CREATE TABLE `js_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY  (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_tax_rule
-- ----------------------------
CREATE TABLE `js_tax_rule` (
  `tax_rule_id` int(11) NOT NULL auto_increment,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL default '1',
  PRIMARY KEY  (`tax_rule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_url_alias
-- ----------------------------
CREATE TABLE `js_url_alias` (
  `url_alias_id` int(11) NOT NULL auto_increment,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY  (`url_alias_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1075 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_user
-- ----------------------------
CREATE TABLE `js_user` (
  `user_id` int(11) NOT NULL auto_increment,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_user_group
-- ----------------------------
CREATE TABLE `js_user_group` (
  `user_group_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY  (`user_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_voucher
-- ----------------------------
CREATE TABLE `js_voucher` (
  `voucher_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_voucher_history
-- ----------------------------
CREATE TABLE `js_voucher_history` (
  `voucher_history_id` int(11) NOT NULL auto_increment,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_voucher_theme
-- ----------------------------
CREATE TABLE `js_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL auto_increment,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY  (`voucher_theme_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_voucher_theme_description
-- ----------------------------
CREATE TABLE `js_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY  (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_weight_class
-- ----------------------------
CREATE TABLE `js_weight_class` (
  `weight_class_id` int(11) NOT NULL auto_increment,
  `value` decimal(15,8) NOT NULL default '0.00000000',
  PRIMARY KEY  (`weight_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_weight_class_description
-- ----------------------------
CREATE TABLE `js_weight_class_description` (
  `weight_class_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY  (`weight_class_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_zone
-- ----------------------------
CREATE TABLE `js_zone` (
  `zone_id` int(11) NOT NULL auto_increment,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4033 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for js_zone_to_geo_zone
-- ----------------------------
CREATE TABLE `js_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL auto_increment,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL default '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`zone_to_geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `js_address` VALUES ('1', '1', 'Aret', 'Sevan', '', '', '', '212 Lauzon', '', 'Laval', 'H7X4E3', '38', '612');
INSERT INTO `js_attribute` VALUES ('1', '6', '1');
INSERT INTO `js_attribute` VALUES ('2', '6', '5');
INSERT INTO `js_attribute` VALUES ('3', '6', '3');
INSERT INTO `js_attribute` VALUES ('4', '3', '1');
INSERT INTO `js_attribute` VALUES ('5', '3', '2');
INSERT INTO `js_attribute` VALUES ('6', '3', '3');
INSERT INTO `js_attribute` VALUES ('7', '3', '4');
INSERT INTO `js_attribute` VALUES ('8', '3', '5');
INSERT INTO `js_attribute` VALUES ('9', '3', '6');
INSERT INTO `js_attribute` VALUES ('10', '3', '7');
INSERT INTO `js_attribute` VALUES ('11', '3', '8');
INSERT INTO `js_attribute_description` VALUES ('1', '1', 'Description');
INSERT INTO `js_attribute_description` VALUES ('2', '1', 'No. of Cores');
INSERT INTO `js_attribute_description` VALUES ('4', '1', 'test 1');
INSERT INTO `js_attribute_description` VALUES ('5', '1', 'test 2');
INSERT INTO `js_attribute_description` VALUES ('6', '1', 'test 3');
INSERT INTO `js_attribute_description` VALUES ('7', '1', 'test 4');
INSERT INTO `js_attribute_description` VALUES ('8', '1', 'test 5');
INSERT INTO `js_attribute_description` VALUES ('9', '1', 'test 6');
INSERT INTO `js_attribute_description` VALUES ('10', '1', 'test 7');
INSERT INTO `js_attribute_description` VALUES ('11', '1', 'test 8');
INSERT INTO `js_attribute_description` VALUES ('3', '1', 'Clockspeed');
INSERT INTO `js_attribute_group` VALUES ('3', '2');
INSERT INTO `js_attribute_group` VALUES ('4', '1');
INSERT INTO `js_attribute_group` VALUES ('5', '3');
INSERT INTO `js_attribute_group` VALUES ('6', '4');
INSERT INTO `js_attribute_group_description` VALUES ('3', '1', 'Memory');
INSERT INTO `js_attribute_group_description` VALUES ('4', '1', 'Technical');
INSERT INTO `js_attribute_group_description` VALUES ('5', '1', 'Motherboard');
INSERT INTO `js_attribute_group_description` VALUES ('6', '1', 'Processor');
INSERT INTO `js_banner` VALUES ('6', 'HP Products', '1');
INSERT INTO `js_banner` VALUES ('7', 'Samsung Tab', '1');
INSERT INTO `js_banner` VALUES ('8', 'Manufacturers', '1');
INSERT INTO `js_banner` VALUES ('9', 'Slidershow', '1');
INSERT INTO `js_banner` VALUES ('10', 'Home 3 Banners', '1');
INSERT INTO `js_banner_image` VALUES ('54', '7', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'data/demo/samsung_banner.jpg');
INSERT INTO `js_banner_image` VALUES ('77', '6', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'data/demo/hp_banner.jpg');
INSERT INTO `js_banner_image` VALUES ('75', '8', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=5', 'data/demo/htc_logo.jpg');
INSERT INTO `js_banner_image` VALUES ('73', '8', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=8', 'data/demo/apple_logo.jpg');
INSERT INTO `js_banner_image` VALUES ('74', '8', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=9', 'data/demo/canon_logo.jpg');
INSERT INTO `js_banner_image` VALUES ('71', '8', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=10', 'data/demo/sony_logo.jpg');
INSERT INTO `js_banner_image` VALUES ('72', '8', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=6', 'data/demo/palm_logo.jpg');
INSERT INTO `js_banner_image` VALUES ('76', '8', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'data/demo/hp_logo.jpg');
INSERT INTO `js_banner_image` VALUES ('78', '9', 'shoes', 'data/banner1.png');
INSERT INTO `js_banner_image` VALUES ('79', '9', 'jeans', 'data/banner2.png');
INSERT INTO `js_banner_image` VALUES ('80', '9', 'men-clothing', 'data/banner3.png');
INSERT INTO `js_banner_image` VALUES ('81', '10', '', 'data/sm_banner1.png');
INSERT INTO `js_banner_image` VALUES ('82', '10', '', 'data/sm_banner2.png');
INSERT INTO `js_banner_image` VALUES ('83', '10', '', 'data/sm_banner3.png');
INSERT INTO `js_banner_image_description` VALUES ('54', '1', '7', 'Samsung Tab 10.1');
INSERT INTO `js_banner_image_description` VALUES ('77', '1', '6', 'HP Banner');
INSERT INTO `js_banner_image_description` VALUES ('75', '1', '8', 'HTC');
INSERT INTO `js_banner_image_description` VALUES ('74', '1', '8', 'Canon');
INSERT INTO `js_banner_image_description` VALUES ('73', '1', '8', 'Apple');
INSERT INTO `js_banner_image_description` VALUES ('72', '1', '8', 'Palm');
INSERT INTO `js_banner_image_description` VALUES ('71', '1', '8', 'Sony');
INSERT INTO `js_banner_image_description` VALUES ('76', '1', '8', 'Hewlett-Packard');
INSERT INTO `js_banner_image_description` VALUES ('78', '1', '9', 'shoes');
INSERT INTO `js_banner_image_description` VALUES ('79', '1', '9', 'jeans');
INSERT INTO `js_banner_image_description` VALUES ('80', '1', '9', 'Men\'s shirts');
INSERT INTO `js_banner_image_description` VALUES ('81', '1', '10', 'watches');
INSERT INTO `js_banner_image_description` VALUES ('82', '1', '10', 'Denims');
INSERT INTO `js_banner_image_description` VALUES ('83', '1', '10', 'Sales');
INSERT INTO `js_category` VALUES ('1', '', '0', '1', '0', '0', '1', '2014-03-05 11:35:43', '2014-03-05 11:35:43');
INSERT INTO `js_category` VALUES ('2', '', '0', '1', '0', '0', '1', '2014-03-05 11:40:27', '2014-03-05 11:40:27');
INSERT INTO `js_category` VALUES ('13', '', '0', '1', '0', '0', '1', '2014-03-05 11:38:07', '2014-03-05 11:38:07');
INSERT INTO `js_category` VALUES ('15', '', '0', '1', '0', '0', '1', '2014-03-05 11:40:59', '2014-03-05 11:40:59');
INSERT INTO `js_category` VALUES ('18', '', '0', '1', '0', '0', '1', '2014-03-05 11:39:11', '2014-03-05 11:39:11');
INSERT INTO `js_category` VALUES ('31', '', '0', '1', '0', '0', '1', '2014-03-05 11:40:32', '2014-03-05 11:40:32');
INSERT INTO `js_category` VALUES ('39', '', '0', '1', '0', '0', '1', '2014-03-05 11:43:43', '2014-03-05 11:43:43');
INSERT INTO `js_category` VALUES ('42', '', '0', '1', '0', '0', '1', '2014-03-05 11:43:43', '2014-03-05 11:43:43');
INSERT INTO `js_category` VALUES ('43', '', '0', '1', '0', '0', '1', '2014-03-05 11:43:43', '2014-03-05 11:43:43');
INSERT INTO `js_category` VALUES ('45', '', '0', '1', '0', '0', '1', '2014-03-05 11:43:43', '2014-03-05 11:43:43');
INSERT INTO `js_category` VALUES ('46', '', '0', '1', '0', '0', '1', '2014-03-05 11:43:43', '2014-03-05 11:43:43');
INSERT INTO `js_category` VALUES ('47', '', '0', '1', '0', '0', '1', '2014-03-05 11:43:43', '2014-03-05 11:43:43');
INSERT INTO `js_category` VALUES ('3', '', '39', '0', '0', '0', '1', '2014-03-05 11:43:29', '2014-03-05 11:43:29');
INSERT INTO `js_category` VALUES ('4', '', '39', '0', '0', '0', '1', '2014-03-05 11:43:17', '2014-03-05 11:43:17');
INSERT INTO `js_category` VALUES ('5', '', '39', '0', '0', '0', '1', '2014-03-05 11:43:40', '2014-03-05 11:43:40');
INSERT INTO `js_category` VALUES ('6', '', '39', '0', '0', '0', '1', '2014-03-05 11:35:54', '2014-03-05 11:35:54');
INSERT INTO `js_category` VALUES ('7', '', '39', '0', '0', '0', '1', '2014-03-05 11:43:19', '2014-03-05 11:43:19');
INSERT INTO `js_category` VALUES ('10', '', '39', '0', '0', '0', '1', '2014-03-05 11:36:01', '2014-03-05 11:36:01');
INSERT INTO `js_category` VALUES ('11', '', '39', '0', '0', '0', '1', '2014-03-05 11:45:08', '2014-03-05 11:45:08');
INSERT INTO `js_category` VALUES ('34', '', '39', '0', '0', '0', '1', '2014-03-05 11:43:17', '2014-03-05 11:43:17');
INSERT INTO `js_category` VALUES ('35', '', '39', '0', '0', '0', '1', '2014-03-05 11:43:17', '2014-03-05 11:43:17');
INSERT INTO `js_category` VALUES ('36', '', '39', '0', '0', '0', '1', '2014-03-05 11:43:24', '2014-03-05 11:43:24');
INSERT INTO `js_category` VALUES ('37', '', '39', '0', '0', '0', '1', '2014-03-05 11:43:32', '2014-03-05 11:43:32');
INSERT INTO `js_category` VALUES ('38', '', '39', '0', '0', '0', '1', '2014-03-05 11:43:43', '2014-03-05 11:43:43');
INSERT INTO `js_category` VALUES ('40', '', '39', '0', '0', '0', '1', '2014-03-05 11:43:43', '2014-03-05 11:43:43');
INSERT INTO `js_category` VALUES ('41', '', '39', '0', '0', '0', '1', '2014-03-05 11:43:43', '2014-03-05 11:43:43');
INSERT INTO `js_category` VALUES ('12', '', '42', '0', '0', '0', '1', '2014-03-05 11:42:37', '2014-03-05 11:42:37');
INSERT INTO `js_category` VALUES ('33', '', '42', '0', '0', '0', '1', '2014-03-05 11:42:23', '2014-03-05 11:42:23');
INSERT INTO `js_category` VALUES ('14', '', '43', '0', '0', '0', '1', '2014-03-05 11:38:48', '2014-03-05 11:38:48');
INSERT INTO `js_category` VALUES ('16', '', '43', '0', '0', '0', '1', '2014-03-05 11:36:40', '2014-03-05 11:36:40');
INSERT INTO `js_category` VALUES ('17', '', '43', '0', '0', '0', '1', '2014-03-05 11:39:20', '2014-03-05 11:39:20');
INSERT INTO `js_category` VALUES ('44', '', '43', '0', '0', '0', '1', '2014-03-05 11:43:43', '2014-03-05 11:43:43');
INSERT INTO `js_category` VALUES ('19', '', '44', '0', '0', '0', '1', '2014-03-05 11:37:07', '2014-03-05 11:37:07');
INSERT INTO `js_category` VALUES ('20', '', '44', '0', '0', '0', '1', '2014-03-05 11:37:14', '2014-03-05 11:37:14');
INSERT INTO `js_category` VALUES ('21', '', '44', '0', '0', '0', '1', '2014-03-05 11:37:19', '2014-03-05 11:37:19');
INSERT INTO `js_category` VALUES ('29', '', '45', '0', '0', '0', '1', '2014-03-05 11:39:59', '2014-03-05 11:39:59');
INSERT INTO `js_category` VALUES ('30', '', '45', '0', '0', '0', '1', '2014-03-05 11:40:14', '2014-03-05 11:40:14');
INSERT INTO `js_category` VALUES ('8', '', '46', '0', '0', '0', '1', '2014-03-05 11:35:57', '2014-03-05 11:35:57');
INSERT INTO `js_category` VALUES ('9', '', '46', '0', '0', '0', '1', '2014-03-05 11:35:59', '2014-03-05 11:35:59');
INSERT INTO `js_category` VALUES ('22', '', '46', '0', '0', '0', '1', '2014-03-05 11:38:03', '2014-03-05 11:38:03');
INSERT INTO `js_category` VALUES ('25', '', '46', '0', '0', '0', '1', '2014-03-05 11:38:50', '2014-03-05 11:38:50');
INSERT INTO `js_category` VALUES ('28', '', '46', '0', '0', '0', '1', '2014-03-05 11:39:46', '2014-03-05 11:39:46');
INSERT INTO `js_category` VALUES ('32', '', '46', '0', '0', '0', '1', '2014-03-05 11:41:17', '2014-03-05 11:41:17');
INSERT INTO `js_category` VALUES ('24', '', '47', '0', '0', '0', '1', '2014-03-05 11:38:22', '2014-03-05 11:38:22');
INSERT INTO `js_category` VALUES ('26', '', '47', '0', '0', '0', '1', '2014-03-05 11:39:00', '2014-03-05 11:39:00');
INSERT INTO `js_category` VALUES ('27', '', '47', '0', '0', '0', '1', '2014-03-05 11:39:13', '2014-03-05 11:39:13');
INSERT INTO `js_category_description` VALUES ('27', '1', '茶道', '', '', '');
INSERT INTO `js_category_description` VALUES ('1', '3', '车上用品', '', '', '');
INSERT INTO `js_category_description` VALUES ('26', '1', '锅类', '', '', '');
INSERT INTO `js_category_description` VALUES ('2', '3', '酒', '', '', '');
INSERT INTO `js_category_description` VALUES ('24', '1', '毛巾', '', '', '');
INSERT INTO `js_category_description` VALUES ('3', '3', '玛瑙把玩', '', '', '');
INSERT INTO `js_category_description` VALUES ('32', '1', '挂件', '', '', '');
INSERT INTO `js_category_description` VALUES ('4', '3', '玉佛', '', '', '');
INSERT INTO `js_category_description` VALUES ('28', '1', '包包', '', '', '');
INSERT INTO `js_category_description` VALUES ('5', '3', '水晶吊坠', '', '', '');
INSERT INTO `js_category_description` VALUES ('25', '1', '腰带', '', '', '');
INSERT INTO `js_category_description` VALUES ('6', '3', '观音', '', '', '');
INSERT INTO `js_category_description` VALUES ('22', '1', '剪纸', '', '', '');
INSERT INTO `js_category_description` VALUES ('7', '3', '翡翠吊坠', '', '', '');
INSERT INTO `js_category_description` VALUES ('9', '1', '牛角梳', '', '', '');
INSERT INTO `js_category_description` VALUES ('8', '3', '牛角', '', '', '');
INSERT INTO `js_category_description` VALUES ('8', '1', '牛角', '', '', '');
INSERT INTO `js_category_description` VALUES ('9', '3', '牛角梳', '', '', '');
INSERT INTO `js_category_description` VALUES ('30', '1', '保健品', '', '', '');
INSERT INTO `js_category_description` VALUES ('10', '3', '珍珠项链', '', '', '');
INSERT INTO `js_category_description` VALUES ('29', '1', '按摩器材', '', '', '');
INSERT INTO `js_category_description` VALUES ('11', '3', '玉镯', '', '', '');
INSERT INTO `js_category_description` VALUES ('21', '1', '獭兔', '', '', '');
INSERT INTO `js_category_description` VALUES ('12', '3', '餐具', '', '', '');
INSERT INTO `js_category_description` VALUES ('20', '1', '貂皮', '', '', '');
INSERT INTO `js_category_description` VALUES ('13', '3', '礼盒', '', '', '');
INSERT INTO `js_category_description` VALUES ('19', '1', '皮衣', '', '', '');
INSERT INTO `js_category_description` VALUES ('14', '3', '内衣', '', '', '');
INSERT INTO `js_category_description` VALUES ('44', '1', '皮草', '', '', '');
INSERT INTO `js_category_description` VALUES ('15', '3', '化妆品', '', '', '');
INSERT INTO `js_category_description` VALUES ('17', '1', '衣服', '', '', '');
INSERT INTO `js_category_description` VALUES ('16', '3', '羊皮棉衣', '', '', '');
INSERT INTO `js_category_description` VALUES ('16', '1', '羊皮棉衣', '', '', '');
INSERT INTO `js_category_description` VALUES ('17', '3', '衣服', '', '', '');
INSERT INTO `js_category_description` VALUES ('14', '1', '内衣', '', '', '');
INSERT INTO `js_category_description` VALUES ('18', '3', '床上用品', '', '', '');
INSERT INTO `js_category_description` VALUES ('33', '1', '茶具', '', '', '');
INSERT INTO `js_category_description` VALUES ('19', '3', '皮衣', '', '', '');
INSERT INTO `js_category_description` VALUES ('12', '1', '餐具', '', '', '');
INSERT INTO `js_category_description` VALUES ('20', '3', '貂皮', '', '', '');
INSERT INTO `js_category_description` VALUES ('41', '1', '紫水晶', '', '', '');
INSERT INTO `js_category_description` VALUES ('21', '3', '獭兔', '', '', '');
INSERT INTO `js_category_description` VALUES ('40', '1', '石榴石', '', '', '');
INSERT INTO `js_category_description` VALUES ('22', '3', '剪纸', '', '', '');
INSERT INTO `js_category_description` VALUES ('38', '1', '一叶发财', '', '', '');
INSERT INTO `js_category_description` VALUES ('24', '3', '毛巾', '', '', '');
INSERT INTO `js_category_description` VALUES ('37', '1', '手链', '', '', '');
INSERT INTO `js_category_description` VALUES ('25', '3', '腰带', '', '', '');
INSERT INTO `js_category_description` VALUES ('36', '1', '水晶手链', '', '', '');
INSERT INTO `js_category_description` VALUES ('26', '3', '锅类', '', '', '');
INSERT INTO `js_category_description` VALUES ('35', '1', '黑曜石', '', '', '');
INSERT INTO `js_category_description` VALUES ('27', '3', '茶道', '', '', '');
INSERT INTO `js_category_description` VALUES ('34', '1', '翡翠项链', '', '', '');
INSERT INTO `js_category_description` VALUES ('28', '3', '包包', '', '', '');
INSERT INTO `js_category_description` VALUES ('11', '1', '玉镯', '', '', '');
INSERT INTO `js_category_description` VALUES ('29', '3', '按摩器材', '', '', '');
INSERT INTO `js_category_description` VALUES ('10', '1', '珍珠项链', '', '', '');
INSERT INTO `js_category_description` VALUES ('30', '3', '保健品', '', '', '');
INSERT INTO `js_category_description` VALUES ('7', '1', '翡翠吊坠', '', '', '');
INSERT INTO `js_category_description` VALUES ('31', '3', '茶叶', '', '', '');
INSERT INTO `js_category_description` VALUES ('6', '1', '观音', '', '', '');
INSERT INTO `js_category_description` VALUES ('32', '3', '挂件', '', '', '');
INSERT INTO `js_category_description` VALUES ('5', '1', '水晶吊坠', '', '', '');
INSERT INTO `js_category_description` VALUES ('33', '3', '茶具', '', '', '');
INSERT INTO `js_category_description` VALUES ('4', '1', '玉佛', '', '', '');
INSERT INTO `js_category_description` VALUES ('34', '3', '翡翠项链', '', '', '');
INSERT INTO `js_category_description` VALUES ('3', '1', '玛瑙把玩', '', '', '');
INSERT INTO `js_category_description` VALUES ('35', '3', '黑曜石', '', '', '');
INSERT INTO `js_category_description` VALUES ('47', '1', '家庭用品', '', '', '');
INSERT INTO `js_category_description` VALUES ('36', '3', '水晶手链', '', '', '');
INSERT INTO `js_category_description` VALUES ('46', '1', '饰品', '', '', '');
INSERT INTO `js_category_description` VALUES ('37', '3', '手链', '', '', '');
INSERT INTO `js_category_description` VALUES ('45', '1', '保健用品', '', '', '');
INSERT INTO `js_category_description` VALUES ('38', '3', '一叶发财', '', '', '');
INSERT INTO `js_category_description` VALUES ('43', '1', '服装', '', '', '');
INSERT INTO `js_category_description` VALUES ('39', '3', '玉器', '', '', '');
INSERT INTO `js_category_description` VALUES ('42', '1', '瓷器', '', '', '');
INSERT INTO `js_category_description` VALUES ('40', '3', '石榴石', '', '', '');
INSERT INTO `js_category_description` VALUES ('39', '1', '玉器', '', '', '');
INSERT INTO `js_category_description` VALUES ('41', '3', '紫水晶', '', '', '');
INSERT INTO `js_category_description` VALUES ('31', '1', '茶叶', '', '', '');
INSERT INTO `js_category_description` VALUES ('42', '3', '瓷器', '', '', '');
INSERT INTO `js_category_description` VALUES ('18', '1', '床上用品', '', '', '');
INSERT INTO `js_category_description` VALUES ('43', '3', '服装', '', '', '');
INSERT INTO `js_category_description` VALUES ('15', '1', '化妆品', '', '', '');
INSERT INTO `js_category_description` VALUES ('44', '3', '皮草', '', '', '');
INSERT INTO `js_category_description` VALUES ('13', '1', '礼盒', '', '', '');
INSERT INTO `js_category_description` VALUES ('45', '3', '保健用品', '', '', '');
INSERT INTO `js_category_description` VALUES ('2', '1', '酒', '', '', '');
INSERT INTO `js_category_description` VALUES ('46', '3', '饰品', '', '', '');
INSERT INTO `js_category_description` VALUES ('1', '1', '车上用品', '', '', '');
INSERT INTO `js_category_description` VALUES ('47', '3', '家庭用品', '', '', '');
INSERT INTO `js_category_path` VALUES ('1', '1', '0');
INSERT INTO `js_category_path` VALUES ('2', '2', '0');
INSERT INTO `js_category_path` VALUES ('13', '13', '0');
INSERT INTO `js_category_path` VALUES ('15', '15', '0');
INSERT INTO `js_category_path` VALUES ('18', '18', '0');
INSERT INTO `js_category_path` VALUES ('31', '31', '0');
INSERT INTO `js_category_path` VALUES ('39', '39', '0');
INSERT INTO `js_category_path` VALUES ('3', '39', '0');
INSERT INTO `js_category_path` VALUES ('3', '3', '1');
INSERT INTO `js_category_path` VALUES ('4', '39', '0');
INSERT INTO `js_category_path` VALUES ('4', '4', '1');
INSERT INTO `js_category_path` VALUES ('5', '39', '0');
INSERT INTO `js_category_path` VALUES ('5', '5', '1');
INSERT INTO `js_category_path` VALUES ('6', '39', '0');
INSERT INTO `js_category_path` VALUES ('6', '6', '1');
INSERT INTO `js_category_path` VALUES ('7', '39', '0');
INSERT INTO `js_category_path` VALUES ('7', '7', '1');
INSERT INTO `js_category_path` VALUES ('10', '39', '0');
INSERT INTO `js_category_path` VALUES ('10', '10', '1');
INSERT INTO `js_category_path` VALUES ('11', '39', '0');
INSERT INTO `js_category_path` VALUES ('11', '11', '1');
INSERT INTO `js_category_path` VALUES ('34', '39', '0');
INSERT INTO `js_category_path` VALUES ('34', '34', '1');
INSERT INTO `js_category_path` VALUES ('35', '39', '0');
INSERT INTO `js_category_path` VALUES ('35', '35', '1');
INSERT INTO `js_category_path` VALUES ('36', '39', '0');
INSERT INTO `js_category_path` VALUES ('36', '36', '1');
INSERT INTO `js_category_path` VALUES ('37', '39', '0');
INSERT INTO `js_category_path` VALUES ('37', '37', '1');
INSERT INTO `js_category_path` VALUES ('38', '39', '0');
INSERT INTO `js_category_path` VALUES ('38', '38', '1');
INSERT INTO `js_category_path` VALUES ('40', '39', '0');
INSERT INTO `js_category_path` VALUES ('40', '40', '1');
INSERT INTO `js_category_path` VALUES ('41', '39', '0');
INSERT INTO `js_category_path` VALUES ('41', '41', '1');
INSERT INTO `js_category_path` VALUES ('42', '42', '0');
INSERT INTO `js_category_path` VALUES ('12', '42', '0');
INSERT INTO `js_category_path` VALUES ('12', '12', '1');
INSERT INTO `js_category_path` VALUES ('33', '42', '0');
INSERT INTO `js_category_path` VALUES ('33', '33', '1');
INSERT INTO `js_category_path` VALUES ('43', '43', '0');
INSERT INTO `js_category_path` VALUES ('14', '43', '0');
INSERT INTO `js_category_path` VALUES ('14', '14', '1');
INSERT INTO `js_category_path` VALUES ('16', '43', '0');
INSERT INTO `js_category_path` VALUES ('16', '16', '1');
INSERT INTO `js_category_path` VALUES ('17', '43', '0');
INSERT INTO `js_category_path` VALUES ('17', '17', '1');
INSERT INTO `js_category_path` VALUES ('44', '43', '0');
INSERT INTO `js_category_path` VALUES ('44', '44', '1');
INSERT INTO `js_category_path` VALUES ('19', '43', '0');
INSERT INTO `js_category_path` VALUES ('19', '44', '1');
INSERT INTO `js_category_path` VALUES ('19', '19', '2');
INSERT INTO `js_category_path` VALUES ('20', '43', '0');
INSERT INTO `js_category_path` VALUES ('20', '44', '1');
INSERT INTO `js_category_path` VALUES ('20', '20', '2');
INSERT INTO `js_category_path` VALUES ('21', '43', '0');
INSERT INTO `js_category_path` VALUES ('21', '44', '1');
INSERT INTO `js_category_path` VALUES ('21', '21', '2');
INSERT INTO `js_category_path` VALUES ('45', '45', '0');
INSERT INTO `js_category_path` VALUES ('29', '45', '0');
INSERT INTO `js_category_path` VALUES ('29', '29', '1');
INSERT INTO `js_category_path` VALUES ('30', '45', '0');
INSERT INTO `js_category_path` VALUES ('30', '30', '1');
INSERT INTO `js_category_path` VALUES ('46', '46', '0');
INSERT INTO `js_category_path` VALUES ('8', '46', '0');
INSERT INTO `js_category_path` VALUES ('8', '8', '1');
INSERT INTO `js_category_path` VALUES ('9', '46', '0');
INSERT INTO `js_category_path` VALUES ('9', '9', '1');
INSERT INTO `js_category_path` VALUES ('22', '46', '0');
INSERT INTO `js_category_path` VALUES ('22', '22', '1');
INSERT INTO `js_category_path` VALUES ('25', '46', '0');
INSERT INTO `js_category_path` VALUES ('25', '25', '1');
INSERT INTO `js_category_path` VALUES ('28', '46', '0');
INSERT INTO `js_category_path` VALUES ('28', '28', '1');
INSERT INTO `js_category_path` VALUES ('32', '46', '0');
INSERT INTO `js_category_path` VALUES ('32', '32', '1');
INSERT INTO `js_category_path` VALUES ('47', '47', '0');
INSERT INTO `js_category_path` VALUES ('24', '47', '0');
INSERT INTO `js_category_path` VALUES ('24', '24', '1');
INSERT INTO `js_category_path` VALUES ('26', '47', '0');
INSERT INTO `js_category_path` VALUES ('26', '26', '1');
INSERT INTO `js_category_path` VALUES ('27', '47', '0');
INSERT INTO `js_category_path` VALUES ('27', '27', '1');
INSERT INTO `js_category_to_store` VALUES ('1', '0');
INSERT INTO `js_category_to_store` VALUES ('2', '0');
INSERT INTO `js_category_to_store` VALUES ('3', '0');
INSERT INTO `js_category_to_store` VALUES ('4', '0');
INSERT INTO `js_category_to_store` VALUES ('5', '0');
INSERT INTO `js_category_to_store` VALUES ('6', '0');
INSERT INTO `js_category_to_store` VALUES ('7', '0');
INSERT INTO `js_category_to_store` VALUES ('8', '0');
INSERT INTO `js_category_to_store` VALUES ('9', '0');
INSERT INTO `js_category_to_store` VALUES ('10', '0');
INSERT INTO `js_category_to_store` VALUES ('11', '0');
INSERT INTO `js_category_to_store` VALUES ('12', '0');
INSERT INTO `js_category_to_store` VALUES ('13', '0');
INSERT INTO `js_category_to_store` VALUES ('14', '0');
INSERT INTO `js_category_to_store` VALUES ('15', '0');
INSERT INTO `js_category_to_store` VALUES ('16', '0');
INSERT INTO `js_category_to_store` VALUES ('17', '0');
INSERT INTO `js_category_to_store` VALUES ('18', '0');
INSERT INTO `js_category_to_store` VALUES ('19', '0');
INSERT INTO `js_category_to_store` VALUES ('20', '0');
INSERT INTO `js_category_to_store` VALUES ('21', '0');
INSERT INTO `js_category_to_store` VALUES ('22', '0');
INSERT INTO `js_category_to_store` VALUES ('24', '0');
INSERT INTO `js_category_to_store` VALUES ('25', '0');
INSERT INTO `js_category_to_store` VALUES ('26', '0');
INSERT INTO `js_category_to_store` VALUES ('27', '0');
INSERT INTO `js_category_to_store` VALUES ('28', '0');
INSERT INTO `js_category_to_store` VALUES ('29', '0');
INSERT INTO `js_category_to_store` VALUES ('30', '0');
INSERT INTO `js_category_to_store` VALUES ('31', '0');
INSERT INTO `js_category_to_store` VALUES ('32', '0');
INSERT INTO `js_category_to_store` VALUES ('33', '0');
INSERT INTO `js_category_to_store` VALUES ('34', '0');
INSERT INTO `js_category_to_store` VALUES ('35', '0');
INSERT INTO `js_category_to_store` VALUES ('36', '0');
INSERT INTO `js_category_to_store` VALUES ('37', '0');
INSERT INTO `js_category_to_store` VALUES ('38', '0');
INSERT INTO `js_category_to_store` VALUES ('39', '0');
INSERT INTO `js_category_to_store` VALUES ('40', '0');
INSERT INTO `js_category_to_store` VALUES ('41', '0');
INSERT INTO `js_category_to_store` VALUES ('42', '0');
INSERT INTO `js_category_to_store` VALUES ('43', '0');
INSERT INTO `js_category_to_store` VALUES ('44', '0');
INSERT INTO `js_category_to_store` VALUES ('45', '0');
INSERT INTO `js_category_to_store` VALUES ('46', '0');
INSERT INTO `js_category_to_store` VALUES ('47', '0');
INSERT INTO `js_country` VALUES ('1', 'Afghanistan', 'AF', 'AFG', '', '0', '1');
INSERT INTO `js_country` VALUES ('2', 'Albania', 'AL', 'ALB', '', '0', '1');
INSERT INTO `js_country` VALUES ('3', 'Algeria', 'DZ', 'DZA', '', '0', '1');
INSERT INTO `js_country` VALUES ('4', 'American Samoa', 'AS', 'ASM', '', '0', '1');
INSERT INTO `js_country` VALUES ('5', 'Andorra', 'AD', 'AND', '', '0', '1');
INSERT INTO `js_country` VALUES ('6', 'Angola', 'AO', 'AGO', '', '0', '1');
INSERT INTO `js_country` VALUES ('7', 'Anguilla', 'AI', 'AIA', '', '0', '1');
INSERT INTO `js_country` VALUES ('8', 'Antarctica', 'AQ', 'ATA', '', '0', '1');
INSERT INTO `js_country` VALUES ('9', 'Antigua and Barbuda', 'AG', 'ATG', '', '0', '1');
INSERT INTO `js_country` VALUES ('10', 'Argentina', 'AR', 'ARG', '', '0', '1');
INSERT INTO `js_country` VALUES ('11', 'Armenia', 'AM', 'ARM', '', '0', '1');
INSERT INTO `js_country` VALUES ('12', 'Aruba', 'AW', 'ABW', '', '0', '1');
INSERT INTO `js_country` VALUES ('13', 'Australia', 'AU', 'AUS', '', '0', '1');
INSERT INTO `js_country` VALUES ('14', 'Austria', 'AT', 'AUT', '', '0', '1');
INSERT INTO `js_country` VALUES ('15', 'Azerbaijan', 'AZ', 'AZE', '', '0', '1');
INSERT INTO `js_country` VALUES ('16', 'Bahamas', 'BS', 'BHS', '', '0', '1');
INSERT INTO `js_country` VALUES ('17', 'Bahrain', 'BH', 'BHR', '', '0', '1');
INSERT INTO `js_country` VALUES ('18', 'Bangladesh', 'BD', 'BGD', '', '0', '1');
INSERT INTO `js_country` VALUES ('19', 'Barbados', 'BB', 'BRB', '', '0', '1');
INSERT INTO `js_country` VALUES ('20', 'Belarus', 'BY', 'BLR', '', '0', '1');
INSERT INTO `js_country` VALUES ('21', 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', '0', '1');
INSERT INTO `js_country` VALUES ('22', 'Belize', 'BZ', 'BLZ', '', '0', '1');
INSERT INTO `js_country` VALUES ('23', 'Benin', 'BJ', 'BEN', '', '0', '1');
INSERT INTO `js_country` VALUES ('24', 'Bermuda', 'BM', 'BMU', '', '0', '1');
INSERT INTO `js_country` VALUES ('25', 'Bhutan', 'BT', 'BTN', '', '0', '1');
INSERT INTO `js_country` VALUES ('26', 'Bolivia', 'BO', 'BOL', '', '0', '1');
INSERT INTO `js_country` VALUES ('27', 'Bosnia and Herzegovina', 'BA', 'BIH', '', '0', '1');
INSERT INTO `js_country` VALUES ('28', 'Botswana', 'BW', 'BWA', '', '0', '1');
INSERT INTO `js_country` VALUES ('29', 'Bouvet Island', 'BV', 'BVT', '', '0', '1');
INSERT INTO `js_country` VALUES ('30', 'Brazil', 'BR', 'BRA', '', '0', '1');
INSERT INTO `js_country` VALUES ('31', 'British Indian Ocean Territory', 'IO', 'IOT', '', '0', '1');
INSERT INTO `js_country` VALUES ('32', 'Brunei Darussalam', 'BN', 'BRN', '', '0', '1');
INSERT INTO `js_country` VALUES ('33', 'Bulgaria', 'BG', 'BGR', '', '0', '1');
INSERT INTO `js_country` VALUES ('34', 'Burkina Faso', 'BF', 'BFA', '', '0', '1');
INSERT INTO `js_country` VALUES ('35', 'Burundi', 'BI', 'BDI', '', '0', '1');
INSERT INTO `js_country` VALUES ('36', 'Cambodia', 'KH', 'KHM', '', '0', '1');
INSERT INTO `js_country` VALUES ('37', 'Cameroon', 'CM', 'CMR', '', '0', '1');
INSERT INTO `js_country` VALUES ('38', 'Canada', 'CA', 'CAN', '', '0', '1');
INSERT INTO `js_country` VALUES ('39', 'Cape Verde', 'CV', 'CPV', '', '0', '1');
INSERT INTO `js_country` VALUES ('40', 'Cayman Islands', 'KY', 'CYM', '', '0', '1');
INSERT INTO `js_country` VALUES ('41', 'Central African Republic', 'CF', 'CAF', '', '0', '1');
INSERT INTO `js_country` VALUES ('42', 'Chad', 'TD', 'TCD', '', '0', '1');
INSERT INTO `js_country` VALUES ('43', 'Chile', 'CL', 'CHL', '', '0', '1');
INSERT INTO `js_country` VALUES ('44', 'China', 'CN', 'CHN', '', '0', '1');
INSERT INTO `js_country` VALUES ('45', 'Christmas Island', 'CX', 'CXR', '', '0', '1');
INSERT INTO `js_country` VALUES ('46', 'Cocos (Keeling) Islands', 'CC', 'CCK', '', '0', '1');
INSERT INTO `js_country` VALUES ('47', 'Colombia', 'CO', 'COL', '', '0', '1');
INSERT INTO `js_country` VALUES ('48', 'Comoros', 'KM', 'COM', '', '0', '1');
INSERT INTO `js_country` VALUES ('49', 'Congo', 'CG', 'COG', '', '0', '1');
INSERT INTO `js_country` VALUES ('50', 'Cook Islands', 'CK', 'COK', '', '0', '1');
INSERT INTO `js_country` VALUES ('51', 'Costa Rica', 'CR', 'CRI', '', '0', '1');
INSERT INTO `js_country` VALUES ('52', 'Cote D\'Ivoire', 'CI', 'CIV', '', '0', '1');
INSERT INTO `js_country` VALUES ('53', 'Croatia', 'HR', 'HRV', '', '0', '1');
INSERT INTO `js_country` VALUES ('54', 'Cuba', 'CU', 'CUB', '', '0', '1');
INSERT INTO `js_country` VALUES ('55', 'Cyprus', 'CY', 'CYP', '', '0', '1');
INSERT INTO `js_country` VALUES ('56', 'Czech Republic', 'CZ', 'CZE', '', '0', '1');
INSERT INTO `js_country` VALUES ('57', 'Denmark', 'DK', 'DNK', '', '0', '1');
INSERT INTO `js_country` VALUES ('58', 'Djibouti', 'DJ', 'DJI', '', '0', '1');
INSERT INTO `js_country` VALUES ('59', 'Dominica', 'DM', 'DMA', '', '0', '1');
INSERT INTO `js_country` VALUES ('60', 'Dominican Republic', 'DO', 'DOM', '', '0', '1');
INSERT INTO `js_country` VALUES ('61', 'East Timor', 'TL', 'TLS', '', '0', '1');
INSERT INTO `js_country` VALUES ('62', 'Ecuador', 'EC', 'ECU', '', '0', '1');
INSERT INTO `js_country` VALUES ('63', 'Egypt', 'EG', 'EGY', '', '0', '1');
INSERT INTO `js_country` VALUES ('64', 'El Salvador', 'SV', 'SLV', '', '0', '1');
INSERT INTO `js_country` VALUES ('65', 'Equatorial Guinea', 'GQ', 'GNQ', '', '0', '1');
INSERT INTO `js_country` VALUES ('66', 'Eritrea', 'ER', 'ERI', '', '0', '1');
INSERT INTO `js_country` VALUES ('67', 'Estonia', 'EE', 'EST', '', '0', '1');
INSERT INTO `js_country` VALUES ('68', 'Ethiopia', 'ET', 'ETH', '', '0', '1');
INSERT INTO `js_country` VALUES ('69', 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', '0', '1');
INSERT INTO `js_country` VALUES ('70', 'Faroe Islands', 'FO', 'FRO', '', '0', '1');
INSERT INTO `js_country` VALUES ('71', 'Fiji', 'FJ', 'FJI', '', '0', '1');
INSERT INTO `js_country` VALUES ('72', 'Finland', 'FI', 'FIN', '', '0', '1');
INSERT INTO `js_country` VALUES ('74', 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', '1', '1');
INSERT INTO `js_country` VALUES ('75', 'French Guiana', 'GF', 'GUF', '', '0', '1');
INSERT INTO `js_country` VALUES ('76', 'French Polynesia', 'PF', 'PYF', '', '0', '1');
INSERT INTO `js_country` VALUES ('77', 'French Southern Territories', 'TF', 'ATF', '', '0', '1');
INSERT INTO `js_country` VALUES ('78', 'Gabon', 'GA', 'GAB', '', '0', '1');
INSERT INTO `js_country` VALUES ('79', 'Gambia', 'GM', 'GMB', '', '0', '1');
INSERT INTO `js_country` VALUES ('80', 'Georgia', 'GE', 'GEO', '', '0', '1');
INSERT INTO `js_country` VALUES ('81', 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', '1', '1');
INSERT INTO `js_country` VALUES ('82', 'Ghana', 'GH', 'GHA', '', '0', '1');
INSERT INTO `js_country` VALUES ('83', 'Gibraltar', 'GI', 'GIB', '', '0', '1');
INSERT INTO `js_country` VALUES ('84', 'Greece', 'GR', 'GRC', '', '0', '1');
INSERT INTO `js_country` VALUES ('85', 'Greenland', 'GL', 'GRL', '', '0', '1');
INSERT INTO `js_country` VALUES ('86', 'Grenada', 'GD', 'GRD', '', '0', '1');
INSERT INTO `js_country` VALUES ('87', 'Guadeloupe', 'GP', 'GLP', '', '0', '1');
INSERT INTO `js_country` VALUES ('88', 'Guam', 'GU', 'GUM', '', '0', '1');
INSERT INTO `js_country` VALUES ('89', 'Guatemala', 'GT', 'GTM', '', '0', '1');
INSERT INTO `js_country` VALUES ('90', 'Guinea', 'GN', 'GIN', '', '0', '1');
INSERT INTO `js_country` VALUES ('91', 'Guinea-Bissau', 'GW', 'GNB', '', '0', '1');
INSERT INTO `js_country` VALUES ('92', 'Guyana', 'GY', 'GUY', '', '0', '1');
INSERT INTO `js_country` VALUES ('93', 'Haiti', 'HT', 'HTI', '', '0', '1');
INSERT INTO `js_country` VALUES ('94', 'Heard and Mc Donald Islands', 'HM', 'HMD', '', '0', '1');
INSERT INTO `js_country` VALUES ('95', 'Honduras', 'HN', 'HND', '', '0', '1');
INSERT INTO `js_country` VALUES ('96', 'Hong Kong', 'HK', 'HKG', '', '0', '1');
INSERT INTO `js_country` VALUES ('97', 'Hungary', 'HU', 'HUN', '', '0', '1');
INSERT INTO `js_country` VALUES ('98', 'Iceland', 'IS', 'ISL', '', '0', '1');
INSERT INTO `js_country` VALUES ('99', 'India', 'IN', 'IND', '', '0', '1');
INSERT INTO `js_country` VALUES ('100', 'Indonesia', 'ID', 'IDN', '', '0', '1');
INSERT INTO `js_country` VALUES ('101', 'Iran (Islamic Republic of)', 'IR', 'IRN', '', '0', '1');
INSERT INTO `js_country` VALUES ('102', 'Iraq', 'IQ', 'IRQ', '', '0', '1');
INSERT INTO `js_country` VALUES ('103', 'Ireland', 'IE', 'IRL', '', '0', '1');
INSERT INTO `js_country` VALUES ('104', 'Israel', 'IL', 'ISR', '', '0', '1');
INSERT INTO `js_country` VALUES ('105', 'Italy', 'IT', 'ITA', '', '0', '1');
INSERT INTO `js_country` VALUES ('106', 'Jamaica', 'JM', 'JAM', '', '0', '1');
INSERT INTO `js_country` VALUES ('107', 'Japan', 'JP', 'JPN', '', '0', '1');
INSERT INTO `js_country` VALUES ('108', 'Jordan', 'JO', 'JOR', '', '0', '1');
INSERT INTO `js_country` VALUES ('109', 'Kazakhstan', 'KZ', 'KAZ', '', '0', '1');
INSERT INTO `js_country` VALUES ('110', 'Kenya', 'KE', 'KEN', '', '0', '1');
INSERT INTO `js_country` VALUES ('111', 'Kiribati', 'KI', 'KIR', '', '0', '1');
INSERT INTO `js_country` VALUES ('112', 'North Korea', 'KP', 'PRK', '', '0', '1');
INSERT INTO `js_country` VALUES ('113', 'Korea, Republic of', 'KR', 'KOR', '', '0', '1');
INSERT INTO `js_country` VALUES ('114', 'Kuwait', 'KW', 'KWT', '', '0', '1');
INSERT INTO `js_country` VALUES ('115', 'Kyrgyzstan', 'KG', 'KGZ', '', '0', '1');
INSERT INTO `js_country` VALUES ('116', 'Lao People\'s Democratic Republic', 'LA', 'LAO', '', '0', '1');
INSERT INTO `js_country` VALUES ('117', 'Latvia', 'LV', 'LVA', '', '0', '1');
INSERT INTO `js_country` VALUES ('118', 'Lebanon', 'LB', 'LBN', '', '0', '1');
INSERT INTO `js_country` VALUES ('119', 'Lesotho', 'LS', 'LSO', '', '0', '1');
INSERT INTO `js_country` VALUES ('120', 'Liberia', 'LR', 'LBR', '', '0', '1');
INSERT INTO `js_country` VALUES ('121', 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', '0', '1');
INSERT INTO `js_country` VALUES ('122', 'Liechtenstein', 'LI', 'LIE', '', '0', '1');
INSERT INTO `js_country` VALUES ('123', 'Lithuania', 'LT', 'LTU', '', '0', '1');
INSERT INTO `js_country` VALUES ('124', 'Luxembourg', 'LU', 'LUX', '', '0', '1');
INSERT INTO `js_country` VALUES ('125', 'Macau', 'MO', 'MAC', '', '0', '1');
INSERT INTO `js_country` VALUES ('126', 'FYROM', 'MK', 'MKD', '', '0', '1');
INSERT INTO `js_country` VALUES ('127', 'Madagascar', 'MG', 'MDG', '', '0', '1');
INSERT INTO `js_country` VALUES ('128', 'Malawi', 'MW', 'MWI', '', '0', '1');
INSERT INTO `js_country` VALUES ('129', 'Malaysia', 'MY', 'MYS', '', '0', '1');
INSERT INTO `js_country` VALUES ('130', 'Maldives', 'MV', 'MDV', '', '0', '1');
INSERT INTO `js_country` VALUES ('131', 'Mali', 'ML', 'MLI', '', '0', '1');
INSERT INTO `js_country` VALUES ('132', 'Malta', 'MT', 'MLT', '', '0', '1');
INSERT INTO `js_country` VALUES ('133', 'Marshall Islands', 'MH', 'MHL', '', '0', '1');
INSERT INTO `js_country` VALUES ('134', 'Martinique', 'MQ', 'MTQ', '', '0', '1');
INSERT INTO `js_country` VALUES ('135', 'Mauritania', 'MR', 'MRT', '', '0', '1');
INSERT INTO `js_country` VALUES ('136', 'Mauritius', 'MU', 'MUS', '', '0', '1');
INSERT INTO `js_country` VALUES ('137', 'Mayotte', 'YT', 'MYT', '', '0', '1');
INSERT INTO `js_country` VALUES ('138', 'Mexico', 'MX', 'MEX', '', '0', '1');
INSERT INTO `js_country` VALUES ('139', 'Micronesia, Federated States of', 'FM', 'FSM', '', '0', '1');
INSERT INTO `js_country` VALUES ('140', 'Moldova, Republic of', 'MD', 'MDA', '', '0', '1');
INSERT INTO `js_country` VALUES ('141', 'Monaco', 'MC', 'MCO', '', '0', '1');
INSERT INTO `js_country` VALUES ('142', 'Mongolia', 'MN', 'MNG', '', '0', '1');
INSERT INTO `js_country` VALUES ('143', 'Montserrat', 'MS', 'MSR', '', '0', '1');
INSERT INTO `js_country` VALUES ('144', 'Morocco', 'MA', 'MAR', '', '0', '1');
INSERT INTO `js_country` VALUES ('145', 'Mozambique', 'MZ', 'MOZ', '', '0', '1');
INSERT INTO `js_country` VALUES ('146', 'Myanmar', 'MM', 'MMR', '', '0', '1');
INSERT INTO `js_country` VALUES ('147', 'Namibia', 'NA', 'NAM', '', '0', '1');
INSERT INTO `js_country` VALUES ('148', 'Nauru', 'NR', 'NRU', '', '0', '1');
INSERT INTO `js_country` VALUES ('149', 'Nepal', 'NP', 'NPL', '', '0', '1');
INSERT INTO `js_country` VALUES ('150', 'Netherlands', 'NL', 'NLD', '', '0', '1');
INSERT INTO `js_country` VALUES ('151', 'Netherlands Antilles', 'AN', 'ANT', '', '0', '1');
INSERT INTO `js_country` VALUES ('152', 'New Caledonia', 'NC', 'NCL', '', '0', '1');
INSERT INTO `js_country` VALUES ('153', 'New Zealand', 'NZ', 'NZL', '', '0', '1');
INSERT INTO `js_country` VALUES ('154', 'Nicaragua', 'NI', 'NIC', '', '0', '1');
INSERT INTO `js_country` VALUES ('155', 'Niger', 'NE', 'NER', '', '0', '1');
INSERT INTO `js_country` VALUES ('156', 'Nigeria', 'NG', 'NGA', '', '0', '1');
INSERT INTO `js_country` VALUES ('157', 'Niue', 'NU', 'NIU', '', '0', '1');
INSERT INTO `js_country` VALUES ('158', 'Norfolk Island', 'NF', 'NFK', '', '0', '1');
INSERT INTO `js_country` VALUES ('159', 'Northern Mariana Islands', 'MP', 'MNP', '', '0', '1');
INSERT INTO `js_country` VALUES ('160', 'Norway', 'NO', 'NOR', '', '0', '1');
INSERT INTO `js_country` VALUES ('161', 'Oman', 'OM', 'OMN', '', '0', '1');
INSERT INTO `js_country` VALUES ('162', 'Pakistan', 'PK', 'PAK', '', '0', '1');
INSERT INTO `js_country` VALUES ('163', 'Palau', 'PW', 'PLW', '', '0', '1');
INSERT INTO `js_country` VALUES ('164', 'Panama', 'PA', 'PAN', '', '0', '1');
INSERT INTO `js_country` VALUES ('165', 'Papua New Guinea', 'PG', 'PNG', '', '0', '1');
INSERT INTO `js_country` VALUES ('166', 'Paraguay', 'PY', 'PRY', '', '0', '1');
INSERT INTO `js_country` VALUES ('167', 'Peru', 'PE', 'PER', '', '0', '1');
INSERT INTO `js_country` VALUES ('168', 'Philippines', 'PH', 'PHL', '', '0', '1');
INSERT INTO `js_country` VALUES ('169', 'Pitcairn', 'PN', 'PCN', '', '0', '1');
INSERT INTO `js_country` VALUES ('170', 'Poland', 'PL', 'POL', '', '0', '1');
INSERT INTO `js_country` VALUES ('171', 'Portugal', 'PT', 'PRT', '', '0', '1');
INSERT INTO `js_country` VALUES ('172', 'Puerto Rico', 'PR', 'PRI', '', '0', '1');
INSERT INTO `js_country` VALUES ('173', 'Qatar', 'QA', 'QAT', '', '0', '1');
INSERT INTO `js_country` VALUES ('174', 'Reunion', 'RE', 'REU', '', '0', '1');
INSERT INTO `js_country` VALUES ('175', 'Romania', 'RO', 'ROM', '', '0', '1');
INSERT INTO `js_country` VALUES ('176', 'Russian Federation', 'RU', 'RUS', '', '0', '1');
INSERT INTO `js_country` VALUES ('177', 'Rwanda', 'RW', 'RWA', '', '0', '1');
INSERT INTO `js_country` VALUES ('178', 'Saint Kitts and Nevis', 'KN', 'KNA', '', '0', '1');
INSERT INTO `js_country` VALUES ('179', 'Saint Lucia', 'LC', 'LCA', '', '0', '1');
INSERT INTO `js_country` VALUES ('180', 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', '0', '1');
INSERT INTO `js_country` VALUES ('181', 'Samoa', 'WS', 'WSM', '', '0', '1');
INSERT INTO `js_country` VALUES ('182', 'San Marino', 'SM', 'SMR', '', '0', '1');
INSERT INTO `js_country` VALUES ('183', 'Sao Tome and Principe', 'ST', 'STP', '', '0', '1');
INSERT INTO `js_country` VALUES ('184', 'Saudi Arabia', 'SA', 'SAU', '', '0', '1');
INSERT INTO `js_country` VALUES ('185', 'Senegal', 'SN', 'SEN', '', '0', '1');
INSERT INTO `js_country` VALUES ('186', 'Seychelles', 'SC', 'SYC', '', '0', '1');
INSERT INTO `js_country` VALUES ('187', 'Sierra Leone', 'SL', 'SLE', '', '0', '1');
INSERT INTO `js_country` VALUES ('188', 'Singapore', 'SG', 'SGP', '', '0', '1');
INSERT INTO `js_country` VALUES ('189', 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', '0', '1');
INSERT INTO `js_country` VALUES ('190', 'Slovenia', 'SI', 'SVN', '', '0', '1');
INSERT INTO `js_country` VALUES ('191', 'Solomon Islands', 'SB', 'SLB', '', '0', '1');
INSERT INTO `js_country` VALUES ('192', 'Somalia', 'SO', 'SOM', '', '0', '1');
INSERT INTO `js_country` VALUES ('193', 'South Africa', 'ZA', 'ZAF', '', '0', '1');
INSERT INTO `js_country` VALUES ('194', 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', '0', '1');
INSERT INTO `js_country` VALUES ('195', 'Spain', 'ES', 'ESP', '', '0', '1');
INSERT INTO `js_country` VALUES ('196', 'Sri Lanka', 'LK', 'LKA', '', '0', '1');
INSERT INTO `js_country` VALUES ('197', 'St. Helena', 'SH', 'SHN', '', '0', '1');
INSERT INTO `js_country` VALUES ('198', 'St. Pierre and Miquelon', 'PM', 'SPM', '', '0', '1');
INSERT INTO `js_country` VALUES ('199', 'Sudan', 'SD', 'SDN', '', '0', '1');
INSERT INTO `js_country` VALUES ('200', 'Suriname', 'SR', 'SUR', '', '0', '1');
INSERT INTO `js_country` VALUES ('201', 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', '0', '1');
INSERT INTO `js_country` VALUES ('202', 'Swaziland', 'SZ', 'SWZ', '', '0', '1');
INSERT INTO `js_country` VALUES ('203', 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', '1', '1');
INSERT INTO `js_country` VALUES ('204', 'Switzerland', 'CH', 'CHE', '', '0', '1');
INSERT INTO `js_country` VALUES ('205', 'Syrian Arab Republic', 'SY', 'SYR', '', '0', '1');
INSERT INTO `js_country` VALUES ('206', 'Taiwan', 'TW', 'TWN', '', '0', '1');
INSERT INTO `js_country` VALUES ('207', 'Tajikistan', 'TJ', 'TJK', '', '0', '1');
INSERT INTO `js_country` VALUES ('208', 'Tanzania, United Republic of', 'TZ', 'TZA', '', '0', '1');
INSERT INTO `js_country` VALUES ('209', 'Thailand', 'TH', 'THA', '', '0', '1');
INSERT INTO `js_country` VALUES ('210', 'Togo', 'TG', 'TGO', '', '0', '1');
INSERT INTO `js_country` VALUES ('211', 'Tokelau', 'TK', 'TKL', '', '0', '1');
INSERT INTO `js_country` VALUES ('212', 'Tonga', 'TO', 'TON', '', '0', '1');
INSERT INTO `js_country` VALUES ('213', 'Trinidad and Tobago', 'TT', 'TTO', '', '0', '1');
INSERT INTO `js_country` VALUES ('214', 'Tunisia', 'TN', 'TUN', '', '0', '1');
INSERT INTO `js_country` VALUES ('215', 'Turkey', 'TR', 'TUR', '', '0', '1');
INSERT INTO `js_country` VALUES ('216', 'Turkmenistan', 'TM', 'TKM', '', '0', '1');
INSERT INTO `js_country` VALUES ('217', 'Turks and Caicos Islands', 'TC', 'TCA', '', '0', '1');
INSERT INTO `js_country` VALUES ('218', 'Tuvalu', 'TV', 'TUV', '', '0', '1');
INSERT INTO `js_country` VALUES ('219', 'Uganda', 'UG', 'UGA', '', '0', '1');
INSERT INTO `js_country` VALUES ('220', 'Ukraine', 'UA', 'UKR', '', '0', '1');
INSERT INTO `js_country` VALUES ('221', 'United Arab Emirates', 'AE', 'ARE', '', '0', '1');
INSERT INTO `js_country` VALUES ('222', 'United Kingdom', 'GB', 'GBR', '', '1', '1');
INSERT INTO `js_country` VALUES ('223', 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', '0', '1');
INSERT INTO `js_country` VALUES ('224', 'United States Minor Outlying Islands', 'UM', 'UMI', '', '0', '1');
INSERT INTO `js_country` VALUES ('225', 'Uruguay', 'UY', 'URY', '', '0', '1');
INSERT INTO `js_country` VALUES ('226', 'Uzbekistan', 'UZ', 'UZB', '', '0', '1');
INSERT INTO `js_country` VALUES ('227', 'Vanuatu', 'VU', 'VUT', '', '0', '1');
INSERT INTO `js_country` VALUES ('228', 'Vatican City State (Holy See)', 'VA', 'VAT', '', '0', '1');
INSERT INTO `js_country` VALUES ('229', 'Venezuela', 'VE', 'VEN', '', '0', '1');
INSERT INTO `js_country` VALUES ('230', 'Viet Nam', 'VN', 'VNM', '', '0', '1');
INSERT INTO `js_country` VALUES ('231', 'Virgin Islands (British)', 'VG', 'VGB', '', '0', '1');
INSERT INTO `js_country` VALUES ('232', 'Virgin Islands (U.S.)', 'VI', 'VIR', '', '0', '1');
INSERT INTO `js_country` VALUES ('233', 'Wallis and Futuna Islands', 'WF', 'WLF', '', '0', '1');
INSERT INTO `js_country` VALUES ('234', 'Western Sahara', 'EH', 'ESH', '', '0', '1');
INSERT INTO `js_country` VALUES ('235', 'Yemen', 'YE', 'YEM', '', '0', '1');
INSERT INTO `js_country` VALUES ('237', 'Democratic Republic of Congo', 'CD', 'COD', '', '0', '1');
INSERT INTO `js_country` VALUES ('238', 'Zambia', 'ZM', 'ZMB', '', '0', '1');
INSERT INTO `js_country` VALUES ('239', 'Zimbabwe', 'ZW', 'ZWE', '', '0', '1');
INSERT INTO `js_country` VALUES ('240', 'Jersey', 'JE', 'JEY', '', '1', '1');
INSERT INTO `js_country` VALUES ('241', 'Guernsey', 'GG', 'GGY', '', '1', '1');
INSERT INTO `js_country` VALUES ('242', 'Montenegro', 'ME', 'MNE', '', '0', '1');
INSERT INTO `js_country` VALUES ('243', 'Serbia', 'RS', 'SRB', '', '0', '1');
INSERT INTO `js_country` VALUES ('244', 'Aaland Islands', 'AX', 'ALA', '', '0', '1');
INSERT INTO `js_country` VALUES ('245', 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', '0', '1');
INSERT INTO `js_country` VALUES ('246', 'Curacao', 'CW', 'CUW', '', '0', '1');
INSERT INTO `js_country` VALUES ('247', 'Palestinian Territory, Occupied', 'PS', 'PSE', '', '0', '1');
INSERT INTO `js_country` VALUES ('248', 'South Sudan', 'SS', 'SSD', '', '0', '1');
INSERT INTO `js_country` VALUES ('249', 'St. Barthelemy', 'BL', 'BLM', '', '0', '1');
INSERT INTO `js_country` VALUES ('250', 'St. Martin (French part)', 'MF', 'MAF', '', '0', '1');
INSERT INTO `js_country` VALUES ('251', 'Canary Islands', 'IC', 'ICA', '', '0', '1');
INSERT INTO `js_coupon` VALUES ('4', '-10% Discount', '2222', 'P', '10.0000', '0', '0', '0.0000', '2011-01-01', '2012-01-01', '10', '10', '1', '2009-01-27 13:55:03');
INSERT INTO `js_coupon` VALUES ('5', 'Free Shipping', '3333', 'P', '0.0000', '0', '1', '100.0000', '2009-03-01', '2009-08-31', '10', '10', '1', '2009-03-14 21:13:53');
INSERT INTO `js_coupon` VALUES ('6', '-10.00 Discount', '1111', 'F', '10.0000', '0', '0', '10.0000', '1970-11-01', '2020-11-01', '100000', '10000', '1', '2009-03-14 21:15:18');
INSERT INTO `js_currency` VALUES ('2', 'RMB', 'CNY', '¥', '', '2', '1.00000000', '1', '2014-03-08 16:04:18');
INSERT INTO `js_customer` VALUES ('1', '0', 'Aret', 'Sevan', 'aret@sevanco.com', '514-893-0007', '', '04abadd945dd1343643cca8f2e2b72cc871f61f5', 'e7d11dba7', 'a:1:{s:4:\"46::\";i:1;}', '', '0', '1', '1', '173.177.123.92', '1', '1', '', '2013-08-14 21:11:50');
INSERT INTO `js_customer_group` VALUES ('1', '0', '1', '0', '0', '1', '1');
INSERT INTO `js_customer_group` VALUES ('2', '1', '0', '0', '0', '0', '2');
INSERT INTO `js_customer_group_description` VALUES ('1', '1', 'Client', 'Client');
INSERT INTO `js_customer_group_description` VALUES ('2', '1', 'Wholesale', 'Wholesale');
INSERT INTO `js_customer_ip` VALUES ('1', '1', '173.177.123.92', '2013-08-14 21:11:51');
INSERT INTO `js_customer_online` VALUES ('127.0.0.1', '0', 'http://localhost:807/jsister/index.php?route=product/category&amp;path=39&amp;page=2', 'http://localhost:807/jsister/index.php?route=product/category&amp;path=39', '2014-03-09 01:23:51');
INSERT INTO `js_extension` VALUES ('23', 'payment', 'cod');
INSERT INTO `js_extension` VALUES ('22', 'total', 'shipping');
INSERT INTO `js_extension` VALUES ('57', 'total', 'sub_total');
INSERT INTO `js_extension` VALUES ('58', 'total', 'tax');
INSERT INTO `js_extension` VALUES ('59', 'total', 'total');
INSERT INTO `js_extension` VALUES ('410', 'module', 'banner');
INSERT INTO `js_extension` VALUES ('426', 'module', 'carousel');
INSERT INTO `js_extension` VALUES ('390', 'total', 'credit');
INSERT INTO `js_extension` VALUES ('387', 'shipping', 'flat');
INSERT INTO `js_extension` VALUES ('349', 'total', 'handling');
INSERT INTO `js_extension` VALUES ('350', 'total', 'low_order_fee');
INSERT INTO `js_extension` VALUES ('389', 'total', 'coupon');
INSERT INTO `js_extension` VALUES ('413', 'module', 'category');
INSERT INTO `js_extension` VALUES ('411', 'module', 'affiliate');
INSERT INTO `js_extension` VALUES ('408', 'module', 'account');
INSERT INTO `js_extension` VALUES ('393', 'total', 'reward');
INSERT INTO `js_extension` VALUES ('398', 'total', 'voucher');
INSERT INTO `js_extension` VALUES ('407', 'payment', 'free_checkout');
INSERT INTO `js_extension` VALUES ('427', 'module', 'featured');
INSERT INTO `js_extension` VALUES ('429', 'module', 'custom_slideshow');
INSERT INTO `js_extension` VALUES ('428', 'module', 'filter');
INSERT INTO `js_extension` VALUES ('430', 'module', 'custom_banner');
INSERT INTO `js_extension` VALUES ('431', 'module', 'bestseller');
INSERT INTO `js_extension` VALUES ('432', 'module', 'latest');
INSERT INTO `js_extension` VALUES ('433', 'module', 'special');
INSERT INTO `js_extension` VALUES ('434', 'module', 'welcome');
INSERT INTO `js_extension` VALUES ('435', 'module', 'price');
INSERT INTO `js_extension` VALUES ('436', 'shipping', 'ups');
INSERT INTO `js_extension` VALUES ('437', 'payment', 'pp_standard');
INSERT INTO `js_extension` VALUES ('438', 'shipping', 'canadapost');
INSERT INTO `js_extension` VALUES ('439', 'shipping', 'canada_post_ws_rest');
INSERT INTO `js_extension` VALUES ('440', 'payment', 'pp_pro');
INSERT INTO `js_extension` VALUES ('441', 'payment', 'authorizenet_aim');
INSERT INTO `js_extension` VALUES ('442', 'module', 'supermenu');
INSERT INTO `js_filter_group` VALUES ('1', '2');
INSERT INTO `js_filter_group_description` VALUES ('1', '1', 'GroupTest1');
INSERT INTO `js_geo_zone` VALUES ('3', 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25');
INSERT INTO `js_geo_zone` VALUES ('4', 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');
INSERT INTO `js_geo_zone` VALUES ('5', 'Canada - QC', 'Canada - QC', '2013-08-14 22:38:37', '2013-08-14 22:32:45');
INSERT INTO `js_geo_zone` VALUES ('6', 'Canada - Fed', 'Canada - Fed', '2013-08-14 22:48:09', '2013-08-14 22:37:49');
INSERT INTO `js_information` VALUES ('3', '1', '3', '1');
INSERT INTO `js_information` VALUES ('4', '1', '1', '1');
INSERT INTO `js_information` VALUES ('5', '1', '4', '1');
INSERT INTO `js_information` VALUES ('6', '1', '2', '1');
INSERT INTO `js_information_description` VALUES ('5', '1', '服务条款', '&lt;p&gt;Terms &amp;amp; Conditions&lt;/p&gt;\r\n');
INSERT INTO `js_information_description` VALUES ('3', '1', '玺鑫荣企业愿景', '&lt;p&gt;&lt;span style=&quot;letter-spacing:-3px;&quot;&gt;&lt;span style=&quot;font-size: 16px; letter-spacing: 0px; font-family: \'Microsoft YaHei\';&quot;&gt;&amp;nbsp; &amp;nbsp; 3年内 &lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n&lt;span style=&quot;letter-spacing: 0px; font-size: 16px; font-family: \'Microsoft YaHei\';&quot;&gt;&amp;nbsp; &amp;nbsp; 在总部建立一个大型的现代化卖场。卖场将汇集众多的知名品牌，与市场同等价格的各类商品，让消费 &amp;nbsp;&amp;nbsp;者有更广泛的选择，享受更人性化的服务。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size: 16px; font-family: \'Microsoft YaHei\';&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;3年 - 5年内&lt;/span&gt;&lt;br /&gt;\r\n&lt;span style=&quot;font-size: 16px; font-family: \'Microsoft YaHei\';&quot;&gt;&amp;nbsp; &amp;nbsp; 在全国建立3到6家的大型现代化卖场，前期的阶段性股东可以成为新卖场的终生制股东，让更多的中小 &amp;nbsp;&amp;nbsp;企业在卖场成长为品牌企业！为卖场所在地及周边地区，拉动消费，带动就业，增加税收作出积极贡献！&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size: 16px; font-family: \'Microsoft YaHei\';&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;5年---10年&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size: 16px; font-family: \'Microsoft YaHei\';&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;在全国建立20—30家大型现代化卖场，组建众多消费领域的异业联盟，让我们消费变的更有价值，为国&amp;nbsp; 家经济结构的调整，由投资经济和出口经济转变为消费经济的发展作出贡献！&lt;/span&gt;&lt;/p&gt;\r\n');
INSERT INTO `js_information_description` VALUES ('6', '1', '配送信息', '&lt;p&gt;Delivery Information&lt;/p&gt;\r\n');
INSERT INTO `js_information_description` VALUES ('4', '1', '公司简介', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://localhost:807/jsister/image/data/us.jpg&quot; style=&quot;float: left; width: 329px; height: 211px;padding-right:10px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size:13px;&quot;&gt;玺鑫荣是以高端创新营销的新型公司，集经营、管理、销售和异业联盟于一体的现代化、国际化、高效化的创新营销平台，以立足山东、面向全国、走向国际、打造知名品牌，增加国际知名度为目标。公司将坚持以科学发展、人性化发展为主导，以加快创新发展方式为主线，以稳中求进为基调，以科技进步和人才为动力，以经济效益和社会效益为目的，以就业、富员、强企、福国利民为目标，以高效管理为核心，推进跨越式发展，努力向“世界500强”迈进，打造“中国玺鑫荣”知名品牌。&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size:13px;&quot;&gt;玺鑫荣贸易有限公司全新、绿色、环保的大型现代化卖场，用诚信、实力和信念为加快山东半岛蓝色经济区的建设和发展做贡献！&lt;/p&gt;\r\n');
INSERT INTO `js_information_to_store` VALUES ('3', '0');
INSERT INTO `js_information_to_store` VALUES ('4', '0');
INSERT INTO `js_information_to_store` VALUES ('5', '0');
INSERT INTO `js_information_to_store` VALUES ('6', '0');
INSERT INTO `js_language` VALUES ('1', 'Chinese', 'cn', 'zh,zh-hk,zh-cn,zh-cn.UTF-8,cn-gb,chinese', 'cn.png', 'chinese', 'chinese', '1', '1');
INSERT INTO `js_layout` VALUES ('1', 'Home');
INSERT INTO `js_layout` VALUES ('2', 'Product');
INSERT INTO `js_layout` VALUES ('3', 'Category');
INSERT INTO `js_layout` VALUES ('4', 'Default');
INSERT INTO `js_layout` VALUES ('5', 'Manufacturer');
INSERT INTO `js_layout` VALUES ('6', 'Account');
INSERT INTO `js_layout` VALUES ('7', 'Checkout');
INSERT INTO `js_layout` VALUES ('8', 'Contact');
INSERT INTO `js_layout` VALUES ('9', 'Sitemap');
INSERT INTO `js_layout` VALUES ('10', 'Affiliate');
INSERT INTO `js_layout` VALUES ('11', 'Information');
INSERT INTO `js_layout_route` VALUES ('30', '6', '0', 'account');
INSERT INTO `js_layout_route` VALUES ('17', '10', '0', 'affiliate/');
INSERT INTO `js_layout_route` VALUES ('29', '3', '0', 'product/category');
INSERT INTO `js_layout_route` VALUES ('26', '1', '0', 'common/home');
INSERT INTO `js_layout_route` VALUES ('20', '2', '0', 'product/product');
INSERT INTO `js_layout_route` VALUES ('24', '11', '0', 'information/information');
INSERT INTO `js_layout_route` VALUES ('22', '5', '0', 'product/manufacturer');
INSERT INTO `js_layout_route` VALUES ('23', '7', '0', 'checkout/');
INSERT INTO `js_layout_route` VALUES ('31', '8', '0', 'information/contact');
INSERT INTO `js_layout_route` VALUES ('32', '9', '0', 'information/sitemap');
INSERT INTO `js_length_class` VALUES ('1', '1.00000000');
INSERT INTO `js_length_class` VALUES ('2', '10.00000000');
INSERT INTO `js_length_class` VALUES ('3', '0.39370000');
INSERT INTO `js_length_class_description` VALUES ('1', '1', 'Centimeter', 'cm');
INSERT INTO `js_length_class_description` VALUES ('2', '1', 'Millimeter', 'mm');
INSERT INTO `js_length_class_description` VALUES ('3', '1', 'Inch', 'in');
INSERT INTO `js_manufacturer` VALUES ('5', 'HTC', 'data/demo/htc_logo.jpg', '0');
INSERT INTO `js_manufacturer` VALUES ('6', 'Palm', 'data/demo/palm_logo.jpg', '0');
INSERT INTO `js_manufacturer` VALUES ('7', 'Hewlett-Packard', 'data/demo/hp_logo.jpg', '0');
INSERT INTO `js_manufacturer` VALUES ('8', 'Apple', 'data/demo/apple_logo.jpg', '0');
INSERT INTO `js_manufacturer` VALUES ('9', 'Canon', 'data/demo/canon_logo.jpg', '0');
INSERT INTO `js_manufacturer` VALUES ('10', 'Sony', 'data/demo/sony_logo.jpg', '0');
INSERT INTO `js_option` VALUES ('1', 'radio', '2');
INSERT INTO `js_option` VALUES ('2', 'checkbox', '3');
INSERT INTO `js_option` VALUES ('4', 'text', '4');
INSERT INTO `js_option` VALUES ('5', 'select', '1');
INSERT INTO `js_option` VALUES ('6', 'textarea', '5');
INSERT INTO `js_option` VALUES ('7', 'file', '6');
INSERT INTO `js_option` VALUES ('8', 'date', '7');
INSERT INTO `js_option` VALUES ('9', 'time', '8');
INSERT INTO `js_option` VALUES ('10', 'datetime', '9');
INSERT INTO `js_option` VALUES ('11', 'select', '1');
INSERT INTO `js_option` VALUES ('12', 'date', '1');
INSERT INTO `js_option_description` VALUES ('1', '1', 'Radio');
INSERT INTO `js_option_description` VALUES ('2', '1', 'Checkbox');
INSERT INTO `js_option_description` VALUES ('4', '1', 'Text');
INSERT INTO `js_option_description` VALUES ('6', '1', 'Textarea');
INSERT INTO `js_option_description` VALUES ('8', '1', 'Date');
INSERT INTO `js_option_description` VALUES ('7', '1', 'File');
INSERT INTO `js_option_description` VALUES ('5', '1', 'Select');
INSERT INTO `js_option_description` VALUES ('9', '1', 'Time');
INSERT INTO `js_option_description` VALUES ('10', '1', 'Date &amp; Time');
INSERT INTO `js_option_description` VALUES ('12', '1', 'Delivery Date');
INSERT INTO `js_option_description` VALUES ('11', '1', 'Size');
INSERT INTO `js_option_value` VALUES ('43', '1', '', '3');
INSERT INTO `js_option_value` VALUES ('32', '1', '', '1');
INSERT INTO `js_option_value` VALUES ('45', '2', '', '4');
INSERT INTO `js_option_value` VALUES ('44', '2', '', '3');
INSERT INTO `js_option_value` VALUES ('42', '5', '', '4');
INSERT INTO `js_option_value` VALUES ('41', '5', '', '3');
INSERT INTO `js_option_value` VALUES ('39', '5', '', '1');
INSERT INTO `js_option_value` VALUES ('40', '5', '', '2');
INSERT INTO `js_option_value` VALUES ('31', '1', '', '2');
INSERT INTO `js_option_value` VALUES ('23', '2', '', '1');
INSERT INTO `js_option_value` VALUES ('24', '2', '', '2');
INSERT INTO `js_option_value` VALUES ('46', '11', '', '1');
INSERT INTO `js_option_value` VALUES ('47', '11', '', '2');
INSERT INTO `js_option_value` VALUES ('48', '11', '', '3');
INSERT INTO `js_option_value_description` VALUES ('43', '1', '1', 'Large');
INSERT INTO `js_option_value_description` VALUES ('32', '1', '1', 'Small');
INSERT INTO `js_option_value_description` VALUES ('45', '1', '2', 'Checkbox 4');
INSERT INTO `js_option_value_description` VALUES ('44', '1', '2', 'Checkbox 3');
INSERT INTO `js_option_value_description` VALUES ('31', '1', '1', 'Medium');
INSERT INTO `js_option_value_description` VALUES ('42', '1', '5', 'Yellow');
INSERT INTO `js_option_value_description` VALUES ('41', '1', '5', 'Green');
INSERT INTO `js_option_value_description` VALUES ('39', '1', '5', 'Red');
INSERT INTO `js_option_value_description` VALUES ('40', '1', '5', 'Blue');
INSERT INTO `js_option_value_description` VALUES ('23', '1', '2', 'Checkbox 1');
INSERT INTO `js_option_value_description` VALUES ('24', '1', '2', 'Checkbox 2');
INSERT INTO `js_option_value_description` VALUES ('48', '1', '11', 'Large');
INSERT INTO `js_option_value_description` VALUES ('47', '1', '11', 'Medium');
INSERT INTO `js_option_value_description` VALUES ('46', '1', '11', 'Small');
INSERT INTO `js_order` VALUES ('2', '0', 'INV-2013-00', '0', 'JSisters Boutique', 'http://jsisters.ca/', '1', '1', 'Aret', 'Sevan', 'aret@sevanco.com', '514-893-0007', '', 'Aret', 'Sevan', '', '', '', '212 Lauzon', '', 'Laval', 'H7X4E3', 'Canada', '38', 'Qu&eacute;bec', '612', '', 'Cash On Delivery', 'cod', 'Aret', 'Sevan', '', '212 Lauzon', '', 'Laval', 'H7X4E3', 'Canada', '38', 'Qu&eacute;bec', '612', '', 'UPS Expedited', 'ups.02', '', '97.0217', '0', '0', '0.0000', '1', '4', 'CAD', '1.03279996', '173.177.123.92', '', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'en-US', '2013-08-14 21:12:25', '2013-08-14 21:12:25');
INSERT INTO `js_order` VALUES ('3', '0', 'INV-2013-00', '0', 'JSisters Boutique', 'http://jsisters.ca/', '1', '1', 'Aret', 'Sevan', 'aret@sevanco.com', '514-893-0007', '', 'Aret', 'Sevan', '', '', '', '212 Lauzon', '', 'Laval', 'H7X4E3', 'Canada', '38', 'Qu&eacute;bec', '612', '', 'Cash On Delivery', 'cod', 'Aret', 'Sevan', '', '212 Lauzon', '', 'Laval', 'H7X4E3', 'Canada', '38', 'Qu&eacute;bec', '612', '', 'UPS Saver', 'ups.13', '', '97.2928', '0', '0', '0.0000', '1', '4', 'CAD', '1.03279996', '173.177.123.92', '', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'en-US', '2013-08-14 22:42:31', '2013-08-14 22:42:31');
INSERT INTO `js_order` VALUES ('4', '0', 'INV-2013-00', '0', 'JSisters Boutique', 'http://jsisters.ca/', '1', '1', 'Aret', 'Sevan', 'aret@sevanco.com', '514-893-0007', '', 'Aret', 'Sevan', '', '', '', '212 Lauzon', '', 'Laval', 'H7X4E3', 'Canada', '38', 'Qu&eacute;bec', '612', '', 'Cash On Delivery', 'cod', 'Aret', 'Sevan', '', '212 Lauzon', '', 'Laval', 'H7X4E3', 'Canada', '38', 'Qu&eacute;bec', '612', '', 'Flat Shipping Rate', 'flat.flat', '', '85.0000', '0', '0', '0.0000', '1', '4', 'CAD', '1.03279996', '173.177.123.92', '', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'en-US', '2013-08-14 22:52:45', '2013-08-14 22:52:45');
INSERT INTO `js_order` VALUES ('6', '0', 'INV-2013-00', '0', 'JSisters Boutique', 'http://jsisters.ca/', '1', '1', 'Aret', 'Sevan', 'aret@sevanco.com', '514-893-0007', '', 'Aret', 'Sevan', '', '', '', '212 Lauzon', '', 'Laval', 'H7X4E3', 'Canada', '38', 'Qu&eacute;bec', '612', '', 'PayPal', 'pp_standard', 'Aret', 'Sevan', '', '212 Lauzon', '', 'Laval', 'H7X4E3', 'Canada', '38', 'Qu&eacute;bec', '612', '', 'UPS Saver', 'ups.13', '', '201.2528', '0', '0', '0.0000', '1', '4', 'CAD', '1.03279996', '173.177.123.92', '', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'en-US', '2013-08-15 01:10:09', '2013-08-15 01:10:09');
INSERT INTO `js_order` VALUES ('7', '0', 'INV-2013-00', '0', 'JSisters Boutique', 'http://jsisters.ca/', '1', '1', 'Aret', 'Sevan', 'aret@sevanco.com', '514-893-0007', '', 'Aret', 'Sevan', '', '', '', '212 Lauzon', '', 'Laval', 'H7X4E3', 'Canada', '38', 'Qu&eacute;bec', '612', '', 'Credit Card / Debit Card (Authorize.Net)', 'authorizenet_aim', 'Aret', 'Sevan', '', '212 Lauzon', '', 'Laval', 'H7X4E3', 'Canada', '38', 'Qu&eacute;bec', '612', '', 'Expedited Parcel (Expected Delivery: 21/09/2011)', 'canada_post_ws_rest.canada_post_ws_rest_0', 'just a test', '310.7889', '0', '0', '0.0000', '1', '4', 'CAD', '1.03100002', '173.177.123.92', '', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'en-US', '2013-08-26 16:18:04', '2013-08-26 16:18:04');
INSERT INTO `js_order` VALUES ('9', '0', 'INV-2013-00', '0', 'JSisters Boutique', 'http://jsisters.ca/', '1', '1', 'Aret', 'Sevan', 'aret@sevanco.com', '514-893-0007', '', 'Aret', 'Sevan', '', '', '', '212 Lauzon', '', 'Laval', 'H7X4E3', 'Canada', '38', 'Qu&eacute;bec', '612', '', 'Credit Card / Debit Card (Authorize.Net)', 'authorizenet_aim', 'Aret', 'Sevan', '', '212 Lauzon', '', 'Laval', 'H7X4E3', 'Canada', '38', 'Qu&eacute;bec', '612', '', 'Expedited Parcel (Expected Delivery: 21/09/2011)', 'canada_post_ws_rest.canada_post_ws_rest_0', 'test2', '1160.4542', '0', '0', '0.0000', '1', '4', 'CAD', '1.03100002', '173.177.123.92', '', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'en-US', '2013-08-26 16:53:27', '2013-08-26 16:53:27');
INSERT INTO `js_order_option` VALUES ('1', '2', '3', '226', '15', 'Select', 'Red', 'select');
INSERT INTO `js_order_option` VALUES ('2', '3', '4', '226', '15', 'Select', 'Red', 'select');
INSERT INTO `js_order_option` VALUES ('3', '4', '5', '226', '15', 'Select', 'Red', 'select');
INSERT INTO `js_order_option` VALUES ('5', '6', '7', '226', '15', 'Select', 'Red', 'select');
INSERT INTO `js_order_option` VALUES ('6', '7', '9', '226', '15', 'Select', 'Red', 'select');
INSERT INTO `js_order_product` VALUES ('3', '2', '30', 'Canon EOS 5D', 'Product 3', '1', '80.0000', '80.0000', '0.0000', '200');
INSERT INTO `js_order_product` VALUES ('4', '3', '30', 'Canon EOS 5D', 'Product 3', '1', '80.0000', '80.0000', '0.0000', '200');
INSERT INTO `js_order_product` VALUES ('5', '4', '30', 'Canon EOS 5D', 'Product 3', '1', '80.0000', '80.0000', '0.0000', '200');
INSERT INTO `js_order_product` VALUES ('7', '6', '30', 'Canon EOS 5D', 'Product 3', '2', '80.0000', '160.0000', '11.9800', '400');
INSERT INTO `js_order_product` VALUES ('8', '7', '40', 'iPhone', 'product 11', '1', '101.0000', '101.0000', '15.1248', '0');
INSERT INTO `js_order_product` VALUES ('9', '7', '30', 'Canon EOS 5D', 'Product 3', '2', '80.0000', '160.0000', '11.9800', '400');
INSERT INTO `js_order_product` VALUES ('12', '9', '46', 'Sony VAIO', 'Product 19', '1', '1000.0000', '1000.0000', '149.7500', '0');
INSERT INTO `js_order_status` VALUES ('2', '1', 'Processing');
INSERT INTO `js_order_status` VALUES ('3', '1', 'Shipped');
INSERT INTO `js_order_status` VALUES ('7', '1', 'Canceled');
INSERT INTO `js_order_status` VALUES ('5', '1', 'Complete');
INSERT INTO `js_order_status` VALUES ('8', '1', 'Denied');
INSERT INTO `js_order_status` VALUES ('9', '1', 'Canceled Reversal');
INSERT INTO `js_order_status` VALUES ('10', '1', 'Failed');
INSERT INTO `js_order_status` VALUES ('11', '1', 'Refunded');
INSERT INTO `js_order_status` VALUES ('12', '1', 'Reversed');
INSERT INTO `js_order_status` VALUES ('13', '1', 'Chargeback');
INSERT INTO `js_order_status` VALUES ('1', '1', 'Pending');
INSERT INTO `js_order_status` VALUES ('16', '1', 'Voided');
INSERT INTO `js_order_status` VALUES ('15', '1', 'Processed');
INSERT INTO `js_order_status` VALUES ('14', '1', 'Expired');
INSERT INTO `js_order_total` VALUES ('4', '2', 'sub_total', 'Sub-Total', '$82.62', '80.0000', '1');
INSERT INTO `js_order_total` VALUES ('5', '2', 'shipping', 'UPS Expedited', '$17.58', '17.0217', '3');
INSERT INTO `js_order_total` VALUES ('6', '2', 'total', 'Total', '$100.20', '97.0217', '9');
INSERT INTO `js_order_total` VALUES ('7', '3', 'sub_total', 'Sub-Total', '$82.62', '80.0000', '1');
INSERT INTO `js_order_total` VALUES ('8', '3', 'shipping', 'UPS Saver', '$17.86', '17.2928', '3');
INSERT INTO `js_order_total` VALUES ('9', '3', 'total', 'Total', '$100.48', '97.2928', '9');
INSERT INTO `js_order_total` VALUES ('10', '4', 'sub_total', 'Sub-Total', '$82.62', '80.0000', '1');
INSERT INTO `js_order_total` VALUES ('11', '4', 'shipping', 'Flat Shipping Rate', '$5.16', '5.0000', '3');
INSERT INTO `js_order_total` VALUES ('12', '4', 'total', 'Total', '$87.79', '85.0000', '9');
INSERT INTO `js_order_total` VALUES ('16', '6', 'sub_total', 'Sub-Total', '$165.25', '160.0000', '1');
INSERT INTO `js_order_total` VALUES ('17', '6', 'shipping', 'UPS Saver', '$17.86', '17.2928', '3');
INSERT INTO `js_order_total` VALUES ('18', '6', 'tax', 'Fed (5%)', '$8.26', '8.0000', '5');
INSERT INTO `js_order_total` VALUES ('19', '6', 'tax', 'QC (9.975%)', '$16.48', '15.9600', '5');
INSERT INTO `js_order_total` VALUES ('20', '6', 'total', 'Total', '$207.85', '201.2528', '9');
INSERT INTO `js_order_total` VALUES ('21', '7', 'sub_total', 'Sub-Total', '$269.09', '261.0000', '1');
INSERT INTO `js_order_total` VALUES ('22', '7', 'shipping', 'Expedited Parcel (Expected Delivery: 21/09/2011)', '$9.60', '9.3100', '3');
INSERT INTO `js_order_total` VALUES ('23', '7', 'tax', 'Fed (5%)', '$13.93', '13.5155', '5');
INSERT INTO `js_order_total` VALUES ('24', '7', 'tax', 'QC (9.975%)', '$27.80', '26.9634', '5');
INSERT INTO `js_order_total` VALUES ('25', '7', 'total', 'Total', '$320.42', '310.7889', '9');
INSERT INTO `js_order_total` VALUES ('31', '9', 'sub_total', 'Sub-Total', '$1,031.00', '1000.0000', '1');
INSERT INTO `js_order_total` VALUES ('32', '9', 'shipping', 'Expedited Parcel (Expected Delivery: 21/09/2011)', '$9.60', '9.3100', '3');
INSERT INTO `js_order_total` VALUES ('33', '9', 'tax', 'Fed (5%)', '$52.03', '50.4655', '5');
INSERT INTO `js_order_total` VALUES ('34', '9', 'tax', 'QC (9.975%)', '$103.80', '100.6787', '5');
INSERT INTO `js_order_total` VALUES ('35', '9', 'total', 'Total', '$1,196.43', '1160.4542', '9');
INSERT INTO `js_product` VALUES ('1', 'XXR_1502', '', '', '', '', '', '', '', '100', '0', 'data/products/V5tG.JPG', '0', '1', '0.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:43', '2014-03-05 11:35:43', '0');
INSERT INTO `js_product` VALUES ('2', 'XXR_1501', '', '', '', '', '', '', '', '100', '0', 'data/products/k4jA.jpg', '0', '1', '528.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:44', '2014-03-05 11:35:44', '0');
INSERT INTO `js_product` VALUES ('3', 'XXR_1500', '', '', '', '', '', '', '', '100', '0', 'data/products/BB2q.jpg', '0', '1', '1680.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:44', '2014-03-05 11:35:44', '0');
INSERT INTO `js_product` VALUES ('4', 'XXR_1499', '', '', '', '', '', '', '', '100', '0', 'data/products/3Eyi.jpg', '0', '1', '1980.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:45', '2014-03-05 11:35:45', '0');
INSERT INTO `js_product` VALUES ('5', 'XXR_1498', '', '', '', '', '', '', '', '100', '0', 'data/products/UGBa.jpg', '0', '1', '1280.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:45', '2014-03-05 11:35:45', '0');
INSERT INTO `js_product` VALUES ('6', 'XXR_1497', '', '', '', '', '', '', '', '100', '0', 'data/products/NAno.jpg', '0', '1', '2580.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:46', '2014-03-05 11:35:46', '0');
INSERT INTO `js_product` VALUES ('7', 'XXR_1496', '', '', '', '', '', '', '', '100', '0', 'data/products/aH8d.jpg', '0', '1', '1760.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:47', '2014-03-05 11:35:47', '0');
INSERT INTO `js_product` VALUES ('8', 'XXR_1495', '', '', '', '', '', '', '', '100', '0', 'data/products/PnLq.jpg', '0', '1', '2360.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:47', '2014-03-05 11:35:47', '0');
INSERT INTO `js_product` VALUES ('9', 'XXR_1494', '', '', '', '', '', '', '', '100', '0', 'data/products/qMb2.jpg', '0', '1', '4280.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:48', '2014-03-05 11:35:48', '0');
INSERT INTO `js_product` VALUES ('10', 'XXR_1493', '', '', '', '', '', '', '', '100', '0', 'data/products/s_HI5V.jpg', '0', '1', '1580.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:49', '2014-03-05 11:35:49', '0');
INSERT INTO `js_product` VALUES ('11', 'XXR_1492', '', '', '', '', '', '', '', '100', '0', 'data/products/SzSE.jpg', '0', '1', '1580.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:49', '2014-03-05 11:35:49', '0');
INSERT INTO `js_product` VALUES ('12', 'XXR_1491', '', '', '', '', '', '', '', '100', '0', 'data/products/FpZj.jpg', '0', '1', '4580.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:50', '2014-03-05 11:35:50', '0');
INSERT INTO `js_product` VALUES ('13', 'XXR_1490', '', '', '', '', '', '', '', '100', '0', 'data/products/nbNQ.jpg', '0', '1', '3580.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:50', '2014-03-05 11:35:50', '0');
INSERT INTO `js_product` VALUES ('14', 'XXR_1489', '', '', '', '', '', '', '', '100', '0', 'data/products/a4GT.jpg', '0', '1', '6680.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:51', '2014-03-05 11:35:51', '0');
INSERT INTO `js_product` VALUES ('15', 'XXR_1488', '', '', '', '', '', '', '', '100', '0', 'data/products/JgzG.jpg', '0', '1', '7800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:52', '2014-03-05 11:35:52', '0');
INSERT INTO `js_product` VALUES ('16', 'XXR_1487', '', '', '', '', '', '', '', '100', '0', 'data/products/R3BT.jpg', '0', '1', '5800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:53', '2014-03-05 11:35:53', '0');
INSERT INTO `js_product` VALUES ('17', 'XXR_1486', '', '', '', '', '', '', '', '100', '0', 'data/products/bFRI.jpg', '0', '1', '7800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:53', '2014-03-05 11:35:53', '0');
INSERT INTO `js_product` VALUES ('18', 'XXR_1485', '', '', '', '', '', '', '', '100', '0', 'data/products/lv7Q.jpg', '0', '1', '12800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:54', '2014-03-05 11:35:54', '0');
INSERT INTO `js_product` VALUES ('19', 'XXR_1484', '', '', '', '', '', '', '', '100', '0', 'data/products/auvb.jpg', '0', '1', '3280.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:54', '2014-03-05 11:35:54', '0');
INSERT INTO `js_product` VALUES ('20', 'XXR_1483', '', '', '', '', '', '', '', '100', '0', 'data/products/TpoN.jpg', '0', '1', '3280.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:55', '2014-03-05 11:35:55', '0');
INSERT INTO `js_product` VALUES ('21', 'XXR_1482', '', '', '', '', '', '', '', '100', '0', 'data/products/d_rLdH.jpg', '0', '1', '0.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:55', '2014-03-05 11:35:55', '0');
INSERT INTO `js_product` VALUES ('22', 'XXR_1481', '', '', '', '', '', '', '', '100', '0', 'data/products/4yyx.jpg', '0', '1', '6180.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:56', '2014-03-05 11:35:56', '0');
INSERT INTO `js_product` VALUES ('23', 'XXR_1480', '', '', '', '', '', '', '', '100', '0', 'data/products/BawD.jpg', '0', '1', '6180.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:56', '2014-03-05 11:35:56', '0');
INSERT INTO `js_product` VALUES ('24', 'XXR_1479', '', '', '', '', '', '', '', '100', '0', 'data/products/s_y0UA.jpg', '0', '1', '5280.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:57', '2014-03-05 11:35:57', '0');
INSERT INTO `js_product` VALUES ('25', 'XXR_1478', '', '', '', '', '', '', '', '100', '0', 'data/products/haNl.jpg', '0', '1', '760.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:57', '2014-03-05 11:35:57', '0');
INSERT INTO `js_product` VALUES ('26', 'XXR_1477', '', '', '', '', '', '', '', '100', '0', 'data/products/ejYn.jpg', '0', '1', '960.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:58', '2014-03-05 11:35:58', '0');
INSERT INTO `js_product` VALUES ('27', 'XXR_1476', '', '', '', '', '', '', '', '100', '0', 'data/products/A4uA.jpg', '0', '1', '158.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:35:59', '2014-03-05 11:35:59', '0');
INSERT INTO `js_product` VALUES ('28', 'XXR_1475', '', '', '', '', '', '', '', '100', '0', 'data/products/ZVTz.jpg', '0', '1', '128.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:00', '2014-03-05 11:36:00', '0');
INSERT INTO `js_product` VALUES ('29', 'XXR_1474', '', '', '', '', '', '', '', '100', '0', 'data/products/Vhp8.jpg', '0', '1', '760.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:01', '2014-03-05 11:36:01', '0');
INSERT INTO `js_product` VALUES ('30', 'XXR_1472', '', '', '', '', '', '', '', '100', '0', 'data/products/SeC2.jpg', '0', '1', '760.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:01', '2014-03-05 11:36:01', '0');
INSERT INTO `js_product` VALUES ('31', 'XXR_1471', '', '', '', '', '', '', '', '100', '0', 'data/products/HS8R.jpg', '0', '1', '860.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:02', '2014-03-05 11:36:02', '0');
INSERT INTO `js_product` VALUES ('32', 'XXR_1470', '', '', '', '', '', '', '', '100', '0', 'data/products/NArk.jpg', '0', '1', '15000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:03', '2014-03-05 11:36:03', '0');
INSERT INTO `js_product` VALUES ('33', 'XXR_1469', '', '', '', '', '', '', '', '100', '0', 'data/products/DRMd.jpg', '0', '1', '17600.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:06', '2014-03-05 11:36:06', '0');
INSERT INTO `js_product` VALUES ('34', 'XXR_1468', '', '', '', '', '', '', '', '100', '0', 'data/products/Z4Mq.jpg', '0', '1', '16800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:11', '2014-03-05 11:36:11', '0');
INSERT INTO `js_product` VALUES ('35', 'XXR_1467', '', '', '', '', '', '', '', '100', '0', 'data/products/Rxm5.jpg', '0', '1', '17800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:15', '2014-03-05 11:36:15', '0');
INSERT INTO `js_product` VALUES ('36', 'XXR_1466', '', '', '', '', '', '', '', '100', '0', 'data/products/LdnW.jpg', '0', '1', '15800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:18', '2014-03-05 11:36:18', '0');
INSERT INTO `js_product` VALUES ('37', 'XXR_1465', '', '', '', '', '', '', '', '100', '0', 'data/products/Uow1.jpg', '0', '1', '14800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:19', '2014-03-05 11:36:19', '0');
INSERT INTO `js_product` VALUES ('38', 'XXR_1464', '', '', '', '', '', '', '', '100', '0', 'data/products/jC70.jpg', '0', '1', '4800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:20', '2014-03-05 11:36:20', '0');
INSERT INTO `js_product` VALUES ('39', 'XXR_1463', '', '', '', '', '', '', '', '100', '0', 'data/products/9aLb.jpg', '0', '1', '7280.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:21', '2014-03-05 11:36:21', '0');
INSERT INTO `js_product` VALUES ('40', 'XXR_1462', '', '', '', '', '', '', '', '100', '0', 'data/products/ZswT.jpg', '0', '1', '7800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:22', '2014-03-05 11:36:22', '3');
INSERT INTO `js_product` VALUES ('41', 'XXR_1461', '', '', '', '', '', '', '', '100', '0', 'data/products/BQ0U.jpg', '0', '1', '2628.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:23', '2014-03-05 11:36:23', '0');
INSERT INTO `js_product` VALUES ('42', 'XXR_1460', '', '', '', '', '', '', '', '100', '0', 'data/products/Y4ip.jpg', '0', '1', '2628.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:24', '2014-03-05 11:36:24', '0');
INSERT INTO `js_product` VALUES ('43', 'XXR_1459', '', '', '', '', '', '', '', '100', '0', 'data/products/5211_fHwn.jpg', '0', '1', '2180.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:24', '2014-03-05 11:36:24', '2');
INSERT INTO `js_product` VALUES ('44', 'XXR_1458', '', '', '', '', '', '', '', '100', '0', 'data/products/45_1gpT.jpg', '0', '1', '3800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:25', '2014-03-05 11:36:25', '0');
INSERT INTO `js_product` VALUES ('45', 'XXR_1457', '', '', '', '', '', '', '', '100', '0', 'data/products/4R1P_1.jpg', '0', '1', '550.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:25', '2014-03-05 11:36:25', '0');
INSERT INTO `js_product` VALUES ('46', 'XXR_1456', '', '', '', '', '', '', '', '100', '0', 'data/products/4R1P_1.jpg', '0', '1', '550.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:25', '2014-03-05 11:36:25', '0');
INSERT INTO `js_product` VALUES ('47', 'XXR_1455', '', '', '', '', '', '', '', '100', '0', 'data/products/O2wy.jpg', '0', '1', '680.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:26', '2014-03-05 11:36:26', '0');
INSERT INTO `js_product` VALUES ('48', 'XXR_1454', '', '', '', '', '', '', '', '100', '0', 'data/products/D13n.jpg', '0', '1', '460.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:29', '2014-03-05 11:36:29', '0');
INSERT INTO `js_product` VALUES ('49', 'XXR_1453', '', '', '', '', '', '', '', '100', '0', 'data/products/1gyf.jpg', '0', '1', '790.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:30', '2014-03-05 11:36:30', '0');
INSERT INTO `js_product` VALUES ('50', 'XXR_1452', '', '', '', '', '', '', '', '100', '0', 'data/products/TANO_1.jpg', '0', '1', '790.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:30', '2014-03-05 11:36:30', '0');
INSERT INTO `js_product` VALUES ('51', 'XXR_1451', '', '', '', '', '', '', '', '100', '0', 'data/products/XOzG.jpg', '0', '1', '645.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:31', '2014-03-05 11:36:31', '0');
INSERT INTO `js_product` VALUES ('52', 'XXR_1450', '', '', '', '', '', '', '', '100', '0', 'data/products/ZeDQ.jpg', '0', '1', '265.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:33', '2014-03-05 11:36:33', '0');
INSERT INTO `js_product` VALUES ('53', 'XXR_1449', '', '', '', '', '', '', '', '100', '0', 'data/products/IzKP.jpg', '0', '1', '295.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:33', '2014-03-05 11:36:33', '0');
INSERT INTO `js_product` VALUES ('54', 'XXR_1448', '', '', '', '', '', '', '', '100', '0', 'data/products/wic0.jpg', '0', '1', '245.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:34', '2014-03-05 11:36:34', '0');
INSERT INTO `js_product` VALUES ('55', 'XXR_1447', '', '', '', '', '', '', '', '100', '0', 'data/products/KIlA.jpg', '0', '1', '4000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:35', '2014-03-05 11:36:35', '0');
INSERT INTO `js_product` VALUES ('56', 'XXR_1446', '', '', '', '', '', '', '', '100', '0', 'data/products/AecJ.jpg', '0', '1', '10000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:35', '2014-03-05 11:36:35', '0');
INSERT INTO `js_product` VALUES ('57', 'XXR_1445', '', '', '', '', '', '', '', '100', '0', 'data/products/YkfP.jpg', '0', '1', '10500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:36', '2014-03-05 11:36:36', '0');
INSERT INTO `js_product` VALUES ('58', 'XXR_1444', '', '', '', '', '', '', '', '100', '0', 'data/products/zfZs.jpg', '0', '1', '10500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:36', '2014-03-05 11:36:36', '0');
INSERT INTO `js_product` VALUES ('59', 'XXR_1443', '', '', '', '', '', '', '', '100', '0', 'data/products/rwFI.jpg', '0', '1', '11000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:36', '2014-03-05 11:36:36', '0');
INSERT INTO `js_product` VALUES ('60', 'XXR_1442', '', '', '', '', '', '', '', '100', '0', 'data/products/CVRN.jpg', '0', '1', '9500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:37', '2014-03-05 11:36:37', '0');
INSERT INTO `js_product` VALUES ('61', 'XXR_1441', '', '', '', '', '', '', '', '100', '0', 'data/products/vmmO.jpg', '0', '1', '9000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:37', '2014-03-05 11:36:37', '0');
INSERT INTO `js_product` VALUES ('62', 'XXR_1440', '', '', '', '', '', '', '', '100', '0', 'data/products/nHC9.jpg', '0', '1', '9500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:37', '2014-03-05 11:36:37', '0');
INSERT INTO `js_product` VALUES ('63', 'XXR_1439', '', '', '', '', '', '', '', '100', '0', 'data/products/JGhd.jpg', '0', '1', '8500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:38', '2014-03-05 11:36:38', '0');
INSERT INTO `js_product` VALUES ('64', 'XXR_1438', '', '', '', '', '', '', '', '100', '0', 'data/products/dI7e.jpg', '0', '1', '10000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:38', '2014-03-05 11:36:38', '0');
INSERT INTO `js_product` VALUES ('65', 'XXR_1437', '', '', '', '', '', '', '', '100', '0', 'data/products/bSNu.jpg', '0', '1', '10000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:39', '2014-03-05 11:36:39', '0');
INSERT INTO `js_product` VALUES ('66', 'XXR_1436', '', '', '', '', '', '', '', '100', '0', 'data/products/p89f.jpg', '0', '1', '8900.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:39', '2014-03-05 11:36:39', '0');
INSERT INTO `js_product` VALUES ('67', 'XXR_1435', '', '', '', '', '', '', '', '100', '0', 'data/products/ug9v.jpg', '0', '1', '8750.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:39', '2014-03-05 11:36:39', '0');
INSERT INTO `js_product` VALUES ('68', 'XXR_1434', '', '', '', '', '', '', '', '100', '0', 'data/products/nXhm.jpg', '0', '1', '10500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:39', '2014-03-05 11:36:39', '0');
INSERT INTO `js_product` VALUES ('69', 'XXR_1433', '', '', '', '', '', '', '', '100', '0', 'data/products/0t0t.jpg', '0', '1', '10500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:40', '2014-03-05 11:36:40', '0');
INSERT INTO `js_product` VALUES ('70', 'XXR_1432', '', '', '', '', '', '', '', '100', '0', 'data/products/KKLq.jpg', '0', '1', '20000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:40', '2014-03-05 11:36:40', '0');
INSERT INTO `js_product` VALUES ('71', 'XXR_1431', '', '', '', '', '', '', '', '100', '0', 'data/products/JV5N.jpg', '0', '1', '10000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:40', '2014-03-05 11:36:40', '0');
INSERT INTO `js_product` VALUES ('72', 'XXR_1430', '', '', '', '', '', '', '', '100', '0', 'data/products/kbiq.jpg', '0', '1', '10000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:40', '2014-03-05 11:36:40', '0');
INSERT INTO `js_product` VALUES ('73', 'XXR_1429', '', '', '', '', '', '', '', '100', '0', 'data/products/g0wa.jpg', '0', '1', '420.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:42', '2014-03-05 11:36:42', '0');
INSERT INTO `js_product` VALUES ('74', 'XXR_1428', '', '', '', '', '', '', '', '100', '0', 'data/products/xYVD.jpg', '0', '1', '420.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:43', '2014-03-05 11:36:43', '0');
INSERT INTO `js_product` VALUES ('75', 'XXR_1427', '', '', '', '', '', '', '', '100', '0', 'data/products/1_tKOS.jpg', '0', '1', '330.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:43', '2014-03-05 11:36:43', '0');
INSERT INTO `js_product` VALUES ('76', 'XXR_1426', '', '', '', '', '', '', '', '100', '0', 'data/products/k7gR.jpg', '0', '1', '128.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:44', '2014-03-05 11:36:44', '0');
INSERT INTO `js_product` VALUES ('77', 'XXR_1424', '', '', '', '', '', '', '', '100', '0', 'data/products/n0fl.jpg', '0', '1', '180.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:45', '2014-03-05 11:36:45', '0');
INSERT INTO `js_product` VALUES ('78', 'XXR_1423', '', '', '', '', '', '', '', '100', '0', 'data/products/E_dyWf.jpg', '0', '1', '1438.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:46', '2014-03-05 11:36:46', '0');
INSERT INTO `js_product` VALUES ('79', 'XXR_1422', '', '', '', '', '', '', '', '100', '0', 'data/products/D_gAwH.jpg', '0', '1', '1438.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:47', '2014-03-05 11:36:47', '0');
INSERT INTO `js_product` VALUES ('80', 'XXR_1421', '', '', '', '', '', '', '', '100', '0', 'data/products/C_o1ng.jpg', '0', '1', '1438.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:47', '2014-03-05 11:36:47', '0');
INSERT INTO `js_product` VALUES ('81', 'XXR_1420', '', '', '', '', '', '', '', '100', '0', 'data/products/B_9980.jpg', '0', '1', '1438.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:48', '2014-03-05 11:36:48', '0');
INSERT INTO `js_product` VALUES ('82', 'XXR_1419', '', '', '', '', '', '', '', '100', '0', 'data/products/A_SANR.jpg', '0', '1', '1438.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:49', '2014-03-05 11:36:49', '0');
INSERT INTO `js_product` VALUES ('83', 'XXR_1418', '', '', '', '', '', '', '', '100', '0', 'data/products/v5TF.jpg', '0', '1', '1188.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:50', '2014-03-05 11:36:50', '0');
INSERT INTO `js_product` VALUES ('84', 'XXR_1417', '', '', '', '', '', '', '', '100', '0', 'data/products/5Mfe.jpg', '0', '1', '1188.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:51', '2014-03-05 11:36:51', '0');
INSERT INTO `js_product` VALUES ('85', 'XXR_1416', '', '', '', '', '', '', '', '100', '0', 'data/products/vqrR.jpg', '0', '1', '1188.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:52', '2014-03-05 11:36:52', '0');
INSERT INTO `js_product` VALUES ('86', 'XXR_1415', '', '', '', '', '', '', '', '100', '0', 'data/products/RO0Q.jpg', '0', '1', '1188.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:53', '2014-03-05 11:36:53', '0');
INSERT INTO `js_product` VALUES ('87', 'XXR_1414', '', '', '', '', '', '', '', '100', '0', 'data/products/tv8L.jpg', '0', '1', '1188.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:54', '2014-03-05 11:36:54', '0');
INSERT INTO `js_product` VALUES ('88', 'XXR_1413', '', '', '', '', '', '', '', '100', '0', 'data/products/KFta.jpg', '0', '1', '2628.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:54', '2014-03-05 11:36:54', '0');
INSERT INTO `js_product` VALUES ('89', 'XXR_1412', '', '', '', '', '', '', '', '100', '0', 'data/products/wyX6.jpg', '0', '1', '2000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:55', '2014-03-05 11:36:55', '0');
INSERT INTO `js_product` VALUES ('90', 'XXR_1411', '', '', '', '', '', '', '', '100', '0', 'data/products/80_dmt7.jpg', '0', '1', '80.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:55', '2014-03-05 11:36:55', '0');
INSERT INTO `js_product` VALUES ('91', 'XXR_1410', '', '', '', '', '', '', '', '100', '0', 'data/products/55_UyNG.jpg', '0', '1', '55.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:55', '2014-03-05 11:36:55', '0');
INSERT INTO `js_product` VALUES ('92', 'XXR_1409', '', '', '', '', '', '', '', '100', '0', 'data/products/125_1DCc.jpg', '0', '1', '125.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:55', '2014-03-05 11:36:55', '0');
INSERT INTO `js_product` VALUES ('93', 'XXR_1408', '', '', '', '', '', '', '', '100', '0', 'data/products/125_3JH5.jpg', '0', '1', '125.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:56', '2014-03-05 11:36:56', '0');
INSERT INTO `js_product` VALUES ('94', 'XXR_1407', '', '', '', '', '', '', '', '100', '0', 'data/products/95_oMoB.jpg', '0', '1', '95.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:56', '2014-03-05 11:36:56', '0');
INSERT INTO `js_product` VALUES ('95', 'XXR_1406', '', '', '', '', '', '', '', '100', '0', 'data/products/715_BcNm.jpg', '0', '1', '758.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:57', '2014-03-05 11:36:57', '0');
INSERT INTO `js_product` VALUES ('96', 'XXR_1405', '', '', '', '', '', '', '', '100', '0', 'data/products/4280_hZLT.jpg', '0', '1', '4280.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:57', '2014-03-05 11:36:57', '0');
INSERT INTO `js_product` VALUES ('97', 'XXR_1404', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0035P_ITz0.JPG', '0', '1', '6500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:58', '2014-03-05 11:36:58', '0');
INSERT INTO `js_product` VALUES ('98', 'XXR_1403', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0033P_bRDB.JPG', '0', '1', '48000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:36:59', '2014-03-05 11:36:59', '0');
INSERT INTO `js_product` VALUES ('99', 'XXR_1402', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0032P_sNxM.JPG', '0', '1', '57500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:00', '2014-03-05 11:37:00', '0');
INSERT INTO `js_product` VALUES ('100', 'XXR_1401', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0031P_FyAy.JPG', '0', '1', '6500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:01', '2014-03-05 11:37:01', '0');
INSERT INTO `js_product` VALUES ('101', 'XXR_1400', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '5000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:01', '2014-03-05 11:37:01', '0');
INSERT INTO `js_product` VALUES ('102', 'XXR_1399', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0029P_69DI.JPG', '0', '1', '5000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:02', '2014-03-05 11:37:02', '0');
INSERT INTO `js_product` VALUES ('103', 'XXR_1398', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0028P_l6w5.JPG', '0', '1', '9000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:02', '2014-03-05 11:37:02', '0');
INSERT INTO `js_product` VALUES ('104', 'XXR_1397', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0027P_YDwq.JPG', '0', '1', '5000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:03', '2014-03-05 11:37:03', '0');
INSERT INTO `js_product` VALUES ('105', 'XXR_1396', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0026P_gzc3.JPG', '0', '1', '5000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:05', '2014-03-05 11:37:05', '0');
INSERT INTO `js_product` VALUES ('106', 'XXR_1395', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0025P_ykVo.JPG', '0', '1', '9000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:05', '2014-03-05 11:37:05', '0');
INSERT INTO `js_product` VALUES ('107', 'XXR_1394', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0023P_bc5t.JPG', '0', '1', '9000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:06', '2014-03-05 11:37:06', '0');
INSERT INTO `js_product` VALUES ('108', 'XXR_1393', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0022P_PSTh.JPG', '0', '1', '5000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:06', '2014-03-05 11:37:06', '0');
INSERT INTO `js_product` VALUES ('109', 'XXR_1392', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0021P_Yzba.JPG', '0', '1', '7500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:07', '2014-03-05 11:37:07', '0');
INSERT INTO `js_product` VALUES ('110', 'XXR_1391', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0020P_rbtb.JPG', '0', '1', '5000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:08', '2014-03-05 11:37:08', '0');
INSERT INTO `js_product` VALUES ('111', 'XXR_1390', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0019P_wEp1.JPG', '0', '1', '48000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:09', '2014-03-05 11:37:09', '0');
INSERT INTO `js_product` VALUES ('112', 'XXR_1389', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0018P_YZMD.JPG', '0', '1', '57500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:09', '2014-03-05 11:37:09', '0');
INSERT INTO `js_product` VALUES ('113', 'XXR_1388', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0017P_AI75.JPG', '0', '1', '30000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:10', '2014-03-05 11:37:10', '0');
INSERT INTO `js_product` VALUES ('114', 'XXR_1387', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0016P_1RAc.JPG', '0', '1', '52500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:10', '2014-03-05 11:37:10', '0');
INSERT INTO `js_product` VALUES ('115', 'XXR_1386', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0015P_blFQ.JPG', '0', '1', '53500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:11', '2014-03-05 11:37:11', '0');
INSERT INTO `js_product` VALUES ('116', 'XXR_1385', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0013P_qOcp.JPG', '0', '1', '34000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:12', '2014-03-05 11:37:12', '0');
INSERT INTO `js_product` VALUES ('117', 'XXR_1384', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0012P_9fkb.JPG', '0', '1', '61000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:13', '2014-03-05 11:37:13', '0');
INSERT INTO `js_product` VALUES ('118', 'XXR_1383', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0011P_dyxR.JPG', '0', '1', '52500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:14', '2014-03-05 11:37:14', '0');
INSERT INTO `js_product` VALUES ('119', 'XXR_1382', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0010P_0scD.JPG', '0', '1', '50000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:14', '2014-03-05 11:37:14', '0');
INSERT INTO `js_product` VALUES ('120', 'XXR_1381', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0009P_jP9t.JPG', '0', '1', '50000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:15', '2014-03-05 11:37:15', '0');
INSERT INTO `js_product` VALUES ('121', 'XXR_1380', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0008P_gvl1.JPG', '0', '1', '6000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:16', '2014-03-05 11:37:16', '0');
INSERT INTO `js_product` VALUES ('122', 'XXR_1379', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0007P_vd8p.JPG', '0', '1', '6000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:17', '2014-03-05 11:37:17', '0');
INSERT INTO `js_product` VALUES ('123', 'XXR_1378', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '0.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:17', '2014-03-05 11:37:17', '0');
INSERT INTO `js_product` VALUES ('124', 'XXR_1377', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0005P_6fYf.JPG', '0', '1', '4000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:18', '2014-03-05 11:37:18', '0');
INSERT INTO `js_product` VALUES ('125', 'XXR_1376', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0003P_f2Fo.JPG', '0', '1', '2500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:18', '2014-03-05 11:37:18', '0');
INSERT INTO `js_product` VALUES ('126', 'XXR_1375', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0002P_SPSI.JPG', '0', '1', '60000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:19', '2014-03-05 11:37:19', '0');
INSERT INTO `js_product` VALUES ('127', 'XXR_1374', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0001P_pehI.JPG', '0', '1', '30000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:20', '2014-03-05 11:37:20', '0');
INSERT INTO `js_product` VALUES ('128', 'XXR_1373', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0208_iqtX.JPG', '0', '1', '4000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:22', '2014-03-05 11:37:22', '0');
INSERT INTO `js_product` VALUES ('129', 'XXR_1372', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0207_s72e.JPG', '0', '1', '588.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:25', '2014-03-05 11:37:25', '0');
INSERT INTO `js_product` VALUES ('130', 'XXR_1371', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0206_4uQG.JPG', '0', '1', '588.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:27', '2014-03-05 11:37:27', '0');
INSERT INTO `js_product` VALUES ('131', 'XXR_1370', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0205_xXP4.JPG', '0', '1', '588.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:31', '2014-03-05 11:37:31', '0');
INSERT INTO `js_product` VALUES ('132', 'XXR_1369', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0202_XtJg.JPG', '0', '1', '588.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:32', '2014-03-05 11:37:32', '0');
INSERT INTO `js_product` VALUES ('133', 'XXR_1368', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0203_2CbN.JPG', '0', '1', '588.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:33', '2014-03-05 11:37:33', '0');
INSERT INTO `js_product` VALUES ('134', 'XXR_1367', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0200_5uzK.JPG', '0', '1', '488.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:34', '2014-03-05 11:37:34', '0');
INSERT INTO `js_product` VALUES ('135', 'XXR_1366', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0201_jA4n.JPG', '0', '1', '588.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:35', '2014-03-05 11:37:35', '0');
INSERT INTO `js_product` VALUES ('136', 'XXR_1365', '', '', '', '', '', '', '', '100', '0', 'data/products/DSC_3983_252H.JPG', '0', '1', '1100.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:36', '2014-03-05 11:37:36', '0');
INSERT INTO `js_product` VALUES ('137', 'XXR_1364', '', '', '', '', '', '', '', '100', '0', 'data/products/DSC_3986_aqHO.JPG', '0', '1', '1900.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:39', '2014-03-05 11:37:39', '0');
INSERT INTO `js_product` VALUES ('138', 'XXR_1363', '', '', '', '', '', '', '', '100', '0', 'data/products/DSC_4002_aCON.JPG', '0', '1', '2600.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:47', '2014-03-05 11:37:47', '0');
INSERT INTO `js_product` VALUES ('139', 'XXR_1362', '', '', '', '', '', '', '', '100', '0', 'data/products/DSC_3997_mlu5.JPG', '0', '1', '1300.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:37:52', '2014-03-05 11:37:52', '0');
INSERT INTO `js_product` VALUES ('140', 'XXR_1361', '', '', '', '', '', '', '', '100', '0', 'data/products/DSC_3990_qMn7.JPG', '0', '1', '750.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:03', '2014-03-05 11:38:03', '0');
INSERT INTO `js_product` VALUES ('141', 'XXR_1360', '', '', '', '', '', '', '', '100', '0', 'data/products/DSC_3978_p5Ew.JPG', '0', '1', '6000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:07', '2014-03-05 11:38:07', '0');
INSERT INTO `js_product` VALUES ('142', 'XXR_1359', '', '', '', '', '', '', '', '100', '0', 'data/products/1_DQrz.jpg', '0', '1', '90.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:10', '2014-03-05 11:38:10', '0');
INSERT INTO `js_product` VALUES ('144', 'XXR_1358', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0123_2rGN.JPG', '0', '1', '78.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:14', '2014-03-05 11:38:14', '0');
INSERT INTO `js_product` VALUES ('146', 'XXR_1357', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0122_Bo5s.JPG', '0', '1', '78.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:18', '2014-03-05 11:38:18', '0');
INSERT INTO `js_product` VALUES ('147', 'XXR_1356', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0121_A5aa.JPG', '0', '1', '58.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:22', '2014-03-05 11:38:22', '0');
INSERT INTO `js_product` VALUES ('148', 'XXR_1355', '', '', '', '', '', '', '', '100', '0', 'data/products/0aHF.JPG', '0', '1', '58.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:22', '2014-03-05 11:38:22', '0');
INSERT INTO `js_product` VALUES ('149', 'XXR_1354', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0119_PS0H.JPG', '0', '1', '68.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:25', '2014-03-05 11:38:25', '0');
INSERT INTO `js_product` VALUES ('150', 'XXR_1353', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '38.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:25', '2014-03-05 11:38:25', '0');
INSERT INTO `js_product` VALUES ('151', 'XXR_1352', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '318.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:25', '2014-03-05 11:38:25', '0');
INSERT INTO `js_product` VALUES ('152', 'XXR_1351', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0080_hc6d.JPG', '0', '1', '228.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:33', '2014-03-05 11:38:33', '0');
INSERT INTO `js_product` VALUES ('153', 'XXR_1350', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0079_gzwV.JPG', '0', '1', '248.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:42', '2014-03-05 11:38:42', '0');
INSERT INTO `js_product` VALUES ('154', 'XXR_1349', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '228.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:42', '2014-03-05 11:38:42', '0');
INSERT INTO `js_product` VALUES ('155', 'XXR_1348', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '488.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:42', '2014-03-05 11:38:42', '0');
INSERT INTO `js_product` VALUES ('156', 'XXR_1347', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0118D_bGiu.JPG', '0', '1', '38.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:45', '2014-03-05 11:38:45', '0');
INSERT INTO `js_product` VALUES ('157', 'XXR_1346', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '45.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:45', '2014-03-05 11:38:45', '0');
INSERT INTO `js_product` VALUES ('158', 'XXR_1345', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '48.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:45', '2014-03-05 11:38:45', '0');
INSERT INTO `js_product` VALUES ('159', 'XXR_1344', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '198.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:45', '2014-03-05 11:38:45', '0');
INSERT INTO `js_product` VALUES ('160', 'XXR_1343', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '148.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:45', '2014-03-05 11:38:45', '0');
INSERT INTO `js_product` VALUES ('161', 'XXR_1342', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '156.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:45', '2014-03-05 11:38:45', '0');
INSERT INTO `js_product` VALUES ('162', 'XXR_1341', '', '', '', '', '', '', '', '100', '0', 'data/products/1314_a6vf.JPG', '0', '1', '85.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:46', '2014-03-05 11:38:46', '0');
INSERT INTO `js_product` VALUES ('163', 'XXR_1340', '', '', '', '', '', '', '', '100', '0', 'data/products/1223_04lL.JPG', '0', '1', '82.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:47', '2014-03-05 11:38:47', '0');
INSERT INTO `js_product` VALUES ('164', 'XXR_1339', '', '', '', '', '', '', '', '100', '0', 'data/products/1304,_WL8L.JPG', '0', '1', '85.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:48', '2014-03-05 11:38:48', '0');
INSERT INTO `js_product` VALUES ('165', 'XXR_1338', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '82.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:48', '2014-03-05 11:38:48', '0');
INSERT INTO `js_product` VALUES ('166', 'XXR_1337', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0002_HAY8.JPG', '0', '1', '388.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:50', '2014-03-05 11:38:50', '0');
INSERT INTO `js_product` VALUES ('167', 'XXR_1336', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0001_11IX.JPG', '0', '1', '228.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:53', '2014-03-05 11:38:53', '0');
INSERT INTO `js_product` VALUES ('168', 'XXR_1335', '', '', '', '', '', '', '', '100', '0', 'data/products/YL-A4_uv9A.jpg', '0', '1', '798.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:55', '2014-03-05 11:38:55', '0');
INSERT INTO `js_product` VALUES ('169', 'XXR_1334', '', '', '', '', '', '', '', '100', '0', 'data/products/YL-A1_uL0l.jpg', '0', '1', '698.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:57', '2014-03-05 11:38:57', '0');
INSERT INTO `js_product` VALUES ('170', 'XXR_1333', '', '', '', '', '', '', '', '100', '0', 'data/products/YL-A3_bWqO.jpg', '0', '1', '698.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:58', '2014-03-05 11:38:58', '0');
INSERT INTO `js_product` VALUES ('171', 'XXR_1332', '', '', '', '', '', '', '', '100', '0', 'data/products/A6_jlJz.jpg', '0', '1', '698.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:59', '2014-03-05 11:38:59', '0');
INSERT INTO `js_product` VALUES ('172', 'XXR_1331', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0007_JEZp.jpg', '0', '1', '418.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:38:59', '2014-03-05 11:38:59', '0');
INSERT INTO `js_product` VALUES ('173', 'XXR_1330', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0006_Vtpi.JPG', '0', '1', '450.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:00', '2014-03-05 11:39:00', '0');
INSERT INTO `js_product` VALUES ('174', 'XXR_1329', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0005_ZTrG.JPG', '0', '1', '380.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:02', '2014-03-05 11:39:02', '0');
INSERT INTO `js_product` VALUES ('175', 'XXR_1328', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0007A_TVJN.JPG', '0', '1', '415.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:02', '2014-03-05 11:39:02', '0');
INSERT INTO `js_product` VALUES ('176', 'XXR_1327', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0006A_aMSi.JPG', '0', '1', '1450.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:03', '2014-03-05 11:39:03', '0');
INSERT INTO `js_product` VALUES ('177', 'XXR_1326', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0002A_v7Wd.JPG', '0', '1', '1030.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:04', '2014-03-05 11:39:04', '0');
INSERT INTO `js_product` VALUES ('178', 'XXR_1325', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0001A_2Y6Q.JPG', '0', '1', '1378.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:05', '2014-03-05 11:39:05', '0');
INSERT INTO `js_product` VALUES ('179', 'XXR_1324', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0019A_CP1g.JPG', '0', '1', '948.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:06', '2014-03-05 11:39:06', '0');
INSERT INTO `js_product` VALUES ('180', 'XXR_1323', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0018A_WNIL.JPG', '0', '1', '1378.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:07', '2014-03-05 11:39:07', '0');
INSERT INTO `js_product` VALUES ('181', 'XXR_1322', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0017 (1)_bcAi.JPG', '0', '1', '1118.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:07', '2014-03-05 11:39:07', '0');
INSERT INTO `js_product` VALUES ('182', 'XXR_1321', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0016A_MSgL.JPG', '0', '1', '1118.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:08', '2014-03-05 11:39:08', '0');
INSERT INTO `js_product` VALUES ('183', 'XXR_1320', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0107_H531.JPG', '0', '1', '378.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:09', '2014-03-05 11:39:09', '0');
INSERT INTO `js_product` VALUES ('184', 'XXR_1319', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0106_5YAS.JPG', '0', '1', '378.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:10', '2014-03-05 11:39:10', '0');
INSERT INTO `js_product` VALUES ('185', 'XXR_1318', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0012A (2)_W7jh.JPG', '0', '1', '850.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:10', '2014-03-05 11:39:10', '0');
INSERT INTO `js_product` VALUES ('186', 'XXR_1317', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0011A (2)_W1ah.JPG', '0', '1', '1065.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:10', '2014-03-05 11:39:10', '0');
INSERT INTO `js_product` VALUES ('187', 'XXR_1316', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0010A_4x4d.JPG', '0', '1', '848.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:11', '2014-03-05 11:39:11', '0');
INSERT INTO `js_product` VALUES ('188', 'XXR_1315', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0009A (2)_QYhR.JPG', '0', '1', '500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:11', '2014-03-05 11:39:11', '0');
INSERT INTO `js_product` VALUES ('189', 'XXR_1314', '', '', '', '', '', '', '', '100', '0', 'data/products/KT-302A_kmAv.jpg', '0', '1', '528.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:13', '2014-03-05 11:39:13', '0');
INSERT INTO `js_product` VALUES ('190', 'XXR_1313', '', '', '', '', '', '', '', '100', '0', 'data/products/KT-301A_UNw3.jpg', '0', '1', '528.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:14', '2014-03-05 11:39:14', '0');
INSERT INTO `js_product` VALUES ('191', 'XXR_1311', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0116_weP2.JPG', '0', '1', '6400.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:15', '2014-03-05 11:39:15', '0');
INSERT INTO `js_product` VALUES ('192', 'XXR_1310', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0115_pgPx.JPG', '0', '1', '19000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:15', '2014-03-05 11:39:15', '0');
INSERT INTO `js_product` VALUES ('193', 'XXR_1309', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0095_GSxa.JPG', '0', '1', '158.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:16', '2014-03-05 11:39:16', '0');
INSERT INTO `js_product` VALUES ('194', 'XXR_1308', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0093_5EpO.JPG', '0', '1', '428.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:16', '2014-03-05 11:39:16', '0');
INSERT INTO `js_product` VALUES ('195', 'XXR_1307', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0092_dCxp.JPG', '0', '1', '278.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:17', '2014-03-05 11:39:17', '0');
INSERT INTO `js_product` VALUES ('196', 'XXR_1306', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0091_B4rU.JPG', '0', '1', '300.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:18', '2014-03-05 11:39:18', '0');
INSERT INTO `js_product` VALUES ('197', 'XXR_1305', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0090_1_ZQFR.JPG', '0', '1', '258.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:18', '2014-03-05 11:39:18', '0');
INSERT INTO `js_product` VALUES ('198', 'XXR_1304', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0089_oEnL.JPG', '0', '1', '288.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:19', '2014-03-05 11:39:19', '0');
INSERT INTO `js_product` VALUES ('199', 'XXR_1303', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0088 (2)_cWRa.JPG', '0', '1', '358.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:19', '2014-03-05 11:39:19', '0');
INSERT INTO `js_product` VALUES ('200', 'XXR_1302', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0086_1_CiJE.JPG', '0', '1', '258.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:20', '2014-03-05 11:39:20', '0');
INSERT INTO `js_product` VALUES ('201', 'XXR_1301', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0085_2_6UTp.JPG', '0', '1', '238.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:20', '2014-03-05 11:39:20', '0');
INSERT INTO `js_product` VALUES ('202', 'XXR_1300', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '258.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:20', '2014-03-05 11:39:20', '0');
INSERT INTO `js_product` VALUES ('203', 'XXR_1299', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0082_DWOV.JPG', '0', '1', '238.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:21', '2014-03-05 11:39:21', '0');
INSERT INTO `js_product` VALUES ('204', 'XXR_1298', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0113_pCd7.JPG', '0', '1', '98.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:23', '2014-03-05 11:39:23', '0');
INSERT INTO `js_product` VALUES ('205', 'XXR_1297', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0102_FCTI.JPG', '0', '1', '780.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:26', '2014-03-05 11:39:26', '0');
INSERT INTO `js_product` VALUES ('206', 'XXR_1296', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0101_AW30.JPG', '0', '1', '728.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:28', '2014-03-05 11:39:28', '0');
INSERT INTO `js_product` VALUES ('207', 'XXR_1295', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0112_sFil.JPG', '0', '1', '388.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:31', '2014-03-05 11:39:31', '0');
INSERT INTO `js_product` VALUES ('208', 'XXR_1294', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0111_KEQB.JPG', '0', '1', '138.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:34', '2014-03-05 11:39:34', '0');
INSERT INTO `js_product` VALUES ('209', 'XXR_1293', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '128.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:34', '2014-03-05 11:39:34', '0');
INSERT INTO `js_product` VALUES ('210', 'XXR_1292', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0110_Fydl.JPG', '0', '1', '358.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:38', '2014-03-05 11:39:38', '0');
INSERT INTO `js_product` VALUES ('211', 'XXR_1291', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '138.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:38', '2014-03-05 11:39:38', '0');
INSERT INTO `js_product` VALUES ('212', 'XXR_1290', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0109_oIYf.JPG', '0', '1', '198.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:41', '2014-03-05 11:39:41', '0');
INSERT INTO `js_product` VALUES ('213', 'XXR_1289', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0108_doo4.JPG', '0', '1', '118.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:44', '2014-03-05 11:39:44', '0');
INSERT INTO `js_product` VALUES ('214', 'XXR_1288', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0107_k98D.JPG', '0', '1', '168.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:46', '2014-03-05 11:39:46', '0');
INSERT INTO `js_product` VALUES ('215', 'XXR_1287', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0106_8ptN.JPG', '0', '1', '328.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:48', '2014-03-05 11:39:48', '0');
INSERT INTO `js_product` VALUES ('216', 'XXR_1286', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0073_rEbI.jpg', '0', '1', '198.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:52', '2014-03-05 11:39:52', '0');
INSERT INTO `js_product` VALUES ('217', 'XXR_1285', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0072_abiH.JPG', '0', '1', '285.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:55', '2014-03-05 11:39:55', '0');
INSERT INTO `js_product` VALUES ('218', 'XXR_1284', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '580.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:55', '2014-03-05 11:39:55', '0');
INSERT INTO `js_product` VALUES ('219', 'XXR_1283', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0070_aV8l.jpg', '0', '1', '258.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:57', '2014-03-05 11:39:57', '0');
INSERT INTO `js_product` VALUES ('220', 'XXR_1282', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0069_F4s7.JPG', '0', '1', '580.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:39:59', '2014-03-05 11:39:59', '0');
INSERT INTO `js_product` VALUES ('221', 'XXR_1281', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0068_Ylun.JPG', '0', '1', '728.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:02', '2014-03-05 11:40:02', '0');
INSERT INTO `js_product` VALUES ('222', 'XXR_1280', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0029_SWCs.JPG', '0', '1', '1980.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:05', '2014-03-05 11:40:05', '0');
INSERT INTO `js_product` VALUES ('223', 'XXR_1279', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0028_1_055B.JPG', '0', '1', '1100.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:07', '2014-03-05 11:40:07', '0');
INSERT INTO `js_product` VALUES ('224', 'XXR_1278', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0027_TkHD.JPG', '0', '1', '250.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:10', '2014-03-05 11:40:10', '0');
INSERT INTO `js_product` VALUES ('225', 'XXR_1277', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0026_SCY6.JPG', '0', '1', '250.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:14', '2014-03-05 11:40:14', '0');
INSERT INTO `js_product` VALUES ('226', 'XXR_1276', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0023_aVhA.JPG', '0', '1', '370.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:16', '2014-03-05 11:40:16', '0');
INSERT INTO `js_product` VALUES ('227', 'XXR_1275', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0062_2eoI.JPG', '0', '1', '260.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:17', '2014-03-05 11:40:17', '0');
INSERT INTO `js_product` VALUES ('228', 'XXR_1274', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0061_lTyi.JPG', '0', '1', '390.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:19', '2014-03-05 11:40:19', '0');
INSERT INTO `js_product` VALUES ('229', 'XXR_1273', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0060_vYXR.JPG', '0', '1', '435.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:23', '2014-03-05 11:40:23', '0');
INSERT INTO `js_product` VALUES ('230', 'XXR_1272', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0059_DhNd.JPG', '0', '1', '285.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:27', '2014-03-05 11:40:27', '0');
INSERT INTO `js_product` VALUES ('231', 'XXR_1271', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0058_5v0S.JPG', '0', '1', '225.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:29', '2014-03-05 11:40:29', '0');
INSERT INTO `js_product` VALUES ('232', 'XXR_1270', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0057_ILwv.jpg', '0', '1', '2280.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:30', '2014-03-05 11:40:30', '0');
INSERT INTO `js_product` VALUES ('233', 'XXR_1269', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0056_tHxa.jpg', '0', '1', '1860.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:30', '2014-03-05 11:40:30', '0');
INSERT INTO `js_product` VALUES ('234', 'XXR_1268', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0055_J3Hw.jpg', '0', '1', '1500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:30', '2014-03-05 11:40:30', '0');
INSERT INTO `js_product` VALUES ('235', 'XXR_1267', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0053_HQef.jpg', '0', '1', '1400.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:31', '2014-03-05 11:40:31', '0');
INSERT INTO `js_product` VALUES ('236', 'XXR_1266', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0052_GdHe.jpg', '0', '1', '1200.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:31', '2014-03-05 11:40:31', '0');
INSERT INTO `js_product` VALUES ('237', 'XXR_1265', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0051_rf3i.jpg', '0', '1', '1660.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:32', '2014-03-05 11:40:32', '0');
INSERT INTO `js_product` VALUES ('238', 'XXR_1264', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0050_zrMN.jpg', '0', '1', '1800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:32', '2014-03-05 11:40:32', '0');
INSERT INTO `js_product` VALUES ('239', 'XXR_1263', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0039_ETnC.jpg', '0', '1', '2200.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:32', '2014-03-05 11:40:32', '0');
INSERT INTO `js_product` VALUES ('240', 'XXR_1262', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0038_JdCx.jpg', '0', '1', '1600.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:33', '2014-03-05 11:40:33', '0');
INSERT INTO `js_product` VALUES ('241', 'XXR_1261', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0067A_OZga.JPG', '0', '1', '118.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:36', '2014-03-05 11:40:36', '0');
INSERT INTO `js_product` VALUES ('242', 'XXR_1260', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0066_gUsw.JPG', '0', '1', '778.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:39', '2014-03-05 11:40:39', '0');
INSERT INTO `js_product` VALUES ('243', 'XXR_1259', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0065_ryLn.JPG', '0', '1', '778.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:42', '2014-03-05 11:40:42', '0');
INSERT INTO `js_product` VALUES ('244', 'XXR_1258', '', '', '', '', '', '', '', '100', '0', 'data/products/c4KU.jpg', '0', '1', '1190.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:44', '2014-03-05 11:40:44', '0');
INSERT INTO `js_product` VALUES ('245', 'XXR_1257', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0025_d35n.JPG', '0', '1', '60.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:46', '2014-03-05 11:40:46', '0');
INSERT INTO `js_product` VALUES ('246', 'XXR_1256', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0037_17xj.JPG', '0', '1', '778.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:48', '2014-03-05 11:40:48', '0');
INSERT INTO `js_product` VALUES ('247', 'XXR_1255', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '778.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:48', '2014-03-05 11:40:48', '0');
INSERT INTO `js_product` VALUES ('248', 'XXR_1254', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0032_QAeH.JPG', '0', '1', '65.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:49', '2014-03-05 11:40:49', '0');
INSERT INTO `js_product` VALUES ('249', 'XXR_1253', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0031_KO21.JPG', '0', '1', '60.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:52', '2014-03-05 11:40:52', '0');
INSERT INTO `js_product` VALUES ('250', 'XXR_1252', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0022_G07Q.JPG', '0', '1', '180.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:55', '2014-03-05 11:40:55', '0');
INSERT INTO `js_product` VALUES ('251', 'XXR_1251', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0021_LSuW.JPG', '0', '1', '180.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:40:59', '2014-03-05 11:40:59', '0');
INSERT INTO `js_product` VALUES ('252', 'XXR_1250', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0020_21z6.JPG', '0', '1', '180.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:04', '2014-03-05 11:41:04', '0');
INSERT INTO `js_product` VALUES ('253', 'XXR_1249', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0019_8KzB.jpg', '0', '1', '68.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:05', '2014-03-05 11:41:05', '0');
INSERT INTO `js_product` VALUES ('254', 'XXR_1248', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0018_E6oN.jpg', '0', '1', '68.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:07', '2014-03-05 11:41:07', '0');
INSERT INTO `js_product` VALUES ('255', 'XXR_1247', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0017_VxQg.jpg', '0', '1', '68.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:09', '2014-03-05 11:41:09', '0');
INSERT INTO `js_product` VALUES ('256', 'XXR_1246', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0016 (2)_TANG.jpg', '0', '1', '68.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:09', '2014-03-05 11:41:09', '0');
INSERT INTO `js_product` VALUES ('257', 'XXR_1245', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0015 (2)_BpXB.jpg', '0', '1', '150.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:09', '2014-03-05 11:41:09', '0');
INSERT INTO `js_product` VALUES ('258', 'XXR_1244', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0013_5jMZ.jpg', '0', '1', '150.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:11', '2014-03-05 11:41:11', '0');
INSERT INTO `js_product` VALUES ('259', 'XXR_1243', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0012_bQpA.jpg', '0', '1', '150.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:13', '2014-03-05 11:41:13', '0');
INSERT INTO `js_product` VALUES ('260', 'XXR_1242', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '150.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:13', '2014-03-05 11:41:13', '0');
INSERT INTO `js_product` VALUES ('261', 'XXR_1241', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0010_L0Af.jpg', '0', '1', '150.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:15', '2014-03-05 11:41:15', '0');
INSERT INTO `js_product` VALUES ('262', 'XXR_1240', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0009_Pdbc.jpg', '0', '1', '150.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:17', '2014-03-05 11:41:17', '0');
INSERT INTO `js_product` VALUES ('263', 'XXR_1239', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0008_9f2m.jpg', '0', '1', '150.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:19', '2014-03-05 11:41:19', '0');
INSERT INTO `js_product` VALUES ('264', 'XXR_1238', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0059_3_ONfI.JPG', '0', '1', '448.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:19', '2014-03-05 11:41:19', '0');
INSERT INTO `js_product` VALUES ('265', 'XXR_1237', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '1128.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:19', '2014-03-05 11:41:19', '0');
INSERT INTO `js_product` VALUES ('266', 'XXR_1236', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0055_RklE.JPG', '0', '1', '1128.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:22', '2014-03-05 11:41:22', '0');
INSERT INTO `js_product` VALUES ('267', 'XXR_1235', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0053_F5C6.JPG', '0', '1', '690.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:24', '2014-03-05 11:41:24', '0');
INSERT INTO `js_product` VALUES ('268', 'XXR_1234', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0051_MPnf.JPG', '0', '1', '1310.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:26', '2014-03-05 11:41:26', '0');
INSERT INTO `js_product` VALUES ('269', 'XXR_1233', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0050_tz6S.JPG', '0', '1', '1310.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:27', '2014-03-05 11:41:27', '0');
INSERT INTO `js_product` VALUES ('270', 'XXR_1232', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0062_xqTH.JPG', '0', '1', '690.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:29', '2014-03-05 11:41:29', '0');
INSERT INTO `js_product` VALUES ('271', 'XXR_1231', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '1258.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:29', '2014-03-05 11:41:29', '0');
INSERT INTO `js_product` VALUES ('272', 'XXR_1230', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0037_dDeo.JPG', '0', '1', '500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:31', '2014-03-05 11:41:31', '0');
INSERT INTO `js_product` VALUES ('273', 'XXR_1229', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '1128.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:31', '2014-03-05 11:41:31', '0');
INSERT INTO `js_product` VALUES ('274', 'XXR_1228', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0035_rFgZ.JPG', '0', '1', '568.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:33', '2014-03-05 11:41:33', '0');
INSERT INTO `js_product` VALUES ('275', 'XXR_1227', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0033_lddK.JPG', '0', '1', '528.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:35', '2014-03-05 11:41:35', '0');
INSERT INTO `js_product` VALUES ('276', 'XXR_1226', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0060_d9kv.JPG', '0', '1', '1125.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:38', '2014-03-05 11:41:38', '0');
INSERT INTO `js_product` VALUES ('277', 'XXR_1225', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0008_iFoO.jpg', '0', '1', '318.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:40', '2014-03-05 11:41:40', '0');
INSERT INTO `js_product` VALUES ('278', 'XXR_1224', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0032_0h02.JPG', '0', '1', '290.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:42', '2014-03-05 11:41:42', '0');
INSERT INTO `js_product` VALUES ('279', 'XXR_1223', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0031_M4Q9.JPG', '0', '1', '230.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:44', '2014-03-05 11:41:44', '0');
INSERT INTO `js_product` VALUES ('280', 'XXR_1222', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0030_QE8N.JPG', '0', '1', '290.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:44', '2014-03-05 11:41:44', '0');
INSERT INTO `js_product` VALUES ('281', 'XXR_1221', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0029_6gz3.JPG', '0', '1', '1125.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:47', '2014-03-05 11:41:47', '0');
INSERT INTO `js_product` VALUES ('282', 'XXR_1220', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0061_d9jZ.JPG', '0', '1', '500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:50', '2014-03-05 11:41:50', '0');
INSERT INTO `js_product` VALUES ('283', 'XXR_1219', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0027_jnCs.JPG', '0', '1', '1318.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:53', '2014-03-05 11:41:53', '0');
INSERT INTO `js_product` VALUES ('284', 'XXR_1218', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0026_Tbrg.JPG', '0', '1', '500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:55', '2014-03-05 11:41:55', '0');
INSERT INTO `js_product` VALUES ('285', 'XXR_1217', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0025_1lzK.JPG', '0', '1', '470.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:41:58', '2014-03-05 11:41:58', '0');
INSERT INTO `js_product` VALUES ('286', 'XXR_1216', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0023_AcYx.JPG', '0', '1', '378.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:01', '2014-03-05 11:42:01', '0');
INSERT INTO `js_product` VALUES ('287', 'XXR_1215', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0022_lkjP.JPG', '0', '1', '378.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:03', '2014-03-05 11:42:03', '0');
INSERT INTO `js_product` VALUES ('288', 'XXR_1214', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0021_MNzL.JPG', '0', '1', '348.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:06', '2014-03-05 11:42:06', '0');
INSERT INTO `js_product` VALUES ('289', 'XXR_1213', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0020_u3Yj.JPG', '0', '1', '628.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:07', '2014-03-05 11:42:07', '0');
INSERT INTO `js_product` VALUES ('290', 'XXR_1212', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0019_ALoW.JPG', '0', '1', '688.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:09', '2014-03-05 11:42:09', '0');
INSERT INTO `js_product` VALUES ('291', 'XXR_1211', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0017_kCmd.JPG', '0', '1', '285.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:11', '2014-03-05 11:42:11', '0');
INSERT INTO `js_product` VALUES ('292', 'XXR_1210', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '290.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:11', '2014-03-05 11:42:11', '0');
INSERT INTO `js_product` VALUES ('293', 'XXR_1209', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0013_6JFI.JPG', '0', '1', '750.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:13', '2014-03-05 11:42:13', '0');
INSERT INTO `js_product` VALUES ('294', 'XXR_1208', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '225.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:13', '2014-03-05 11:42:13', '0');
INSERT INTO `js_product` VALUES ('295', 'XXR_1207', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0006_vKvq.JPG', '0', '1', '1128.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:15', '2014-03-05 11:42:15', '0');
INSERT INTO `js_product` VALUES ('296', 'XXR_1206', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0005_Ncxi.JPG', '0', '1', '1125.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:17', '2014-03-05 11:42:17', '0');
INSERT INTO `js_product` VALUES ('297', 'XXR_1205', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0002_x9w0.JPG', '0', '1', '625.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:20', '2014-03-05 11:42:20', '0');
INSERT INTO `js_product` VALUES ('298', 'XXR_1204', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0001_U9Pp.JPG', '0', '1', '500.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:21', '2014-03-05 11:42:21', '0');
INSERT INTO `js_product` VALUES ('299', 'XXR_1203', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0008_iFoO.jpg', '0', '1', '1125.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:23', '2014-03-05 11:42:23', '0');
INSERT INTO `js_product` VALUES ('300', 'XXR_1202', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ0009_C81b.JPG', '0', '1', '200.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:25', '2014-03-05 11:42:25', '0');
INSERT INTO `js_product` VALUES ('301', 'XXR_1201', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ012_7FJ5.JPG', '0', '1', '2000.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:28', '2014-03-05 11:42:28', '0');
INSERT INTO `js_product` VALUES ('302', 'XXR_1200', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ011_oUb3.JPG', '0', '1', '1818.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:29', '2014-03-05 11:42:29', '0');
INSERT INTO `js_product` VALUES ('303', 'XXR_1199', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ009_2VZB.jpg', '0', '1', '2628.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:31', '2014-03-05 11:42:31', '0');
INSERT INTO `js_product` VALUES ('304', 'XXR_1198', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ007_1_Lt84.jpg', '0', '1', '1818.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:32', '2014-03-05 11:42:32', '0');
INSERT INTO `js_product` VALUES ('305', 'XXR_1197', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ006_6eQJ.jpg', '0', '1', '600.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:34', '2014-03-05 11:42:34', '0');
INSERT INTO `js_product` VALUES ('306', 'XXR_1196', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '1628.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:34', '2014-03-05 11:42:34', '0');
INSERT INTO `js_product` VALUES ('307', 'XXR_1195', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ002_xMCD.jpg', '0', '1', '1818.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:37', '2014-03-05 11:42:37', '0');
INSERT INTO `js_product` VALUES ('308', 'XXR_1194', '', '', '', '', '', '', '', '100', '0', 'data/products/WJ001_u3PI.jpg', '0', '1', '2625.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:38', '2014-03-05 11:42:38', '0');
INSERT INTO `js_product` VALUES ('309', 'XXR_1193', '', '', '', '', '', '', '', '100', '0', 'data/products/A1021_reci.JPG', '0', '1', '510.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:40', '2014-03-05 11:42:40', '0');
INSERT INTO `js_product` VALUES ('310', 'XXR_1192', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '628.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:40', '2014-03-05 11:42:40', '0');
INSERT INTO `js_product` VALUES ('311', 'XXR_1191', '', '', '', '', '', '', '', '100', '0', 'data/products/A1018_L6aj.JPG', '0', '1', '580.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:43', '2014-03-05 11:42:43', '0');
INSERT INTO `js_product` VALUES ('312', 'XXR_1190', '', '', '', '', '', '', '', '100', '0', 'data/products/A1017_uRpU.JPG', '0', '1', '680.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:45', '2014-03-05 11:42:45', '0');
INSERT INTO `js_product` VALUES ('313', 'XXR_1189', '', '', '', '', '', '', '', '100', '0', 'data/products/A1016_bt72.JPG', '0', '1', '780.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:49', '2014-03-05 11:42:49', '0');
INSERT INTO `js_product` VALUES ('314', 'XXR_1188', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '680.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:49', '2014-03-05 11:42:49', '0');
INSERT INTO `js_product` VALUES ('315', 'XXR_1187', '', '', '', '', '', '', '', '100', '0', 'data/products/A1013_b0tR.JPG', '0', '1', '698.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:56', '2014-03-05 11:42:56', '0');
INSERT INTO `js_product` VALUES ('316', 'XXR_1186', '', '', '', '', '', '', '', '100', '0', 'data/products/A1012_ZJpF.JPG', '0', '1', '788.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:42:57', '2014-03-05 11:42:57', '0');
INSERT INTO `js_product` VALUES ('317', 'XXR_1185', '', '', '', '', '', '', '', '100', '0', 'data/products/A0010_aQex.JPG', '0', '1', '1580.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:00', '2014-03-05 11:43:00', '0');
INSERT INTO `js_product` VALUES ('318', 'XXR_1184', '', '', '', '', '', '', '', '100', '0', 'data/products/A1009_FtpB.JPG', '0', '1', '1980.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:03', '2014-03-05 11:43:03', '0');
INSERT INTO `js_product` VALUES ('319', 'XXR_1183', '', '', '', '', '', '', '', '100', '0', 'data/products/A1008_SlXm.jpg', '0', '1', '1280.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:06', '2014-03-05 11:43:06', '0');
INSERT INTO `js_product` VALUES ('320', 'XXR_1182', '', '', '', '', '', '', '', '100', '0', 'data/products/A1007_V55Y.JPG', '0', '1', '1680.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:08', '2014-03-05 11:43:08', '0');
INSERT INTO `js_product` VALUES ('321', 'XXR_1181', '', '', '', '', '', '', '', '100', '0', 'data/products/A1006_tlhE.JPG', '0', '1', '2580.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:11', '2014-03-05 11:43:11', '0');
INSERT INTO `js_product` VALUES ('322', 'XXR_1180', '', '', '', '', '', '', '', '100', '0', 'data/products/A1005_Wa8w.JPG', '0', '1', '2600.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:14', '2014-03-05 11:43:14', '0');
INSERT INTO `js_product` VALUES ('323', 'XXR_1179', '', '', '', '', '', '', '', '100', '0', 'data/products/A1002_Ltde.JPG', '0', '1', '3980.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:17', '2014-03-05 11:43:17', '0');
INSERT INTO `js_product` VALUES ('324', 'XXR_1178', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '5800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:17', '2014-03-05 11:43:17', '0');
INSERT INTO `js_product` VALUES ('325', 'XXR_1177', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '288.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:17', '2014-03-05 11:43:17', '0');
INSERT INTO `js_product` VALUES ('326', 'XXR_1176', '', '', '', '', '', '', '', '100', '0', 'data/products/XR0103_AZCp.JPG', '0', '1', '388.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:17', '2014-03-05 11:43:17', '0');
INSERT INTO `js_product` VALUES ('327', 'XXR_1175', '', '', '', '', '', '', '', '100', '0', 'data/products/C0005_zp03.jpg', '0', '1', '580.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:18', '2014-03-05 11:43:18', '0');
INSERT INTO `js_product` VALUES ('328', 'XXR_1174', '', '', '', '', '', '', '', '100', '0', 'data/products/C0002_DlUx.jpg', '0', '1', '680.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:19', '2014-03-05 11:43:19', '0');
INSERT INTO `js_product` VALUES ('329', 'XXR_1173', '', '', '', '', '', '', '', '100', '0', 'data/products/C0001_ukMx.jpg', '0', '1', '680.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:19', '2014-03-05 11:43:19', '0');
INSERT INTO `js_product` VALUES ('330', 'XXR_1172', '', '', '', '', '', '', '', '100', '0', 'data/products/L0018_6CUV.JPG', '0', '1', '398.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:20', '2014-03-05 11:43:20', '0');
INSERT INTO `js_product` VALUES ('331', 'XXR_1171', '', '', '', '', '', '', '', '100', '0', 'data/products/L0017_WvBo.JPG', '0', '1', '958.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:21', '2014-03-05 11:43:21', '0');
INSERT INTO `js_product` VALUES ('332', 'XXR_1170', '', '', '', '', '', '', '', '100', '0', 'data/products/L0016_6HLB.JPG', '0', '1', '780.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:21', '2014-03-05 11:43:21', '0');
INSERT INTO `js_product` VALUES ('333', 'XXR_1169', '', '', '', '', '', '', '', '100', '0', 'data/products/L0015_b8ul.JPG', '0', '1', '828.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:23', '2014-03-05 11:43:23', '0');
INSERT INTO `js_product` VALUES ('334', 'XXR_1168', '', '', '', '', '', '', '', '100', '0', 'data/products/L0012_PYLO.JPG', '0', '1', '520.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:24', '2014-03-05 11:43:24', '0');
INSERT INTO `js_product` VALUES ('335', 'XXR_1167', '', '', '', '', '', '', '', '100', '0', 'data/products/L0011_Jfmq.JPG', '0', '1', '558.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:26', '2014-03-05 11:43:26', '0');
INSERT INTO `js_product` VALUES ('336', 'XXR_1166', '', '', '', '', '', '', '', '100', '0', 'data/products/W107_VoQl.JPG', '0', '1', '1268.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:27', '2014-03-05 11:43:27', '0');
INSERT INTO `js_product` VALUES ('337', 'XXR_1165', '', '', '', '', '', '', '', '100', '0', 'data/products/W105_Qez1.JPG', '0', '1', '1368.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:28', '2014-03-05 11:43:28', '0');
INSERT INTO `js_product` VALUES ('338', 'XXR_1164', '', '', '', '', '', '', '', '100', '0', 'data/products/W103_7yYb.JPG', '0', '1', '1280.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:29', '2014-03-05 11:43:29', '0');
INSERT INTO `js_product` VALUES ('339', 'XXR_1163', '', '', '', '', '', '', '', '100', '0', 'data/products/W102_dtnG.JPG', '0', '1', '1380.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:29', '2014-03-05 11:43:29', '0');
INSERT INTO `js_product` VALUES ('340', 'XXR_1162', '', '', '', '', '', '', '', '100', '0', 'data/products/W101_DFfV.JPG', '0', '1', '1580.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:30', '2014-03-05 11:43:30', '0');
INSERT INTO `js_product` VALUES ('341', 'XXR_1161', '', '', '', '', '', '', '', '100', '0', 'data/products/L0021_e9Ac.JPG', '0', '1', '1258.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:31', '2014-03-05 11:43:31', '0');
INSERT INTO `js_product` VALUES ('342', 'XXR_1160', '', '', '', '', '', '', '', '100', '0', 'data/products/L0020_OLVT.JPG', '0', '1', '1280.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:32', '2014-03-05 11:43:32', '0');
INSERT INTO `js_product` VALUES ('343', 'XXR_1159', '', '', '', '', '', '', '', '100', '0', 'data/products/L0019 (2)_Fpcy.JPG', '0', '1', '980.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:32', '2014-03-05 11:43:32', '0');
INSERT INTO `js_product` VALUES ('344', 'XXR_1158', '', '', '', '', '', '', '', '100', '0', 'data/products/D1019_bf1A.JPG', '0', '1', '760.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:33', '2014-03-05 11:43:33', '0');
INSERT INTO `js_product` VALUES ('345', 'XXR_1157', '', '', '', '', '', '', '', '100', '0', 'data/products/D1018_QSPE.JPG', '0', '1', '768.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:33', '2014-03-05 11:43:33', '0');
INSERT INTO `js_product` VALUES ('346', 'XXR_1156', '', '', '', '', '', '', '', '100', '0', 'data/products/D1017_G4Nq.JPG', '0', '1', '560.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:34', '2014-03-05 11:43:34', '0');
INSERT INTO `js_product` VALUES ('347', 'XXR_1155', '', '', '', '', '', '', '', '100', '0', 'data/products/D1016_VrcT.JPG', '0', '1', '580.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:35', '2014-03-05 11:43:35', '0');
INSERT INTO `js_product` VALUES ('348', 'XXR_1154', '', '', '', '', '', '', '', '100', '0', 'data/products/D1015_jVD6.JPG', '0', '1', '890.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:35', '2014-03-05 11:43:35', '0');
INSERT INTO `js_product` VALUES ('349', 'XXR_1153', '', '', '', '', '', '', '', '100', '0', 'data/products/D1012_GyUH.JPG', '0', '1', '980.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:36', '2014-03-05 11:43:36', '0');
INSERT INTO `js_product` VALUES ('350', 'XXR_1152', '', '', '', '', '', '', '', '100', '0', 'data/products/D1011_ZXtG.JPG', '0', '1', '960.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:37', '2014-03-05 11:43:37', '0');
INSERT INTO `js_product` VALUES ('351', 'XXR_1151', '', '', '', '', '', '', '', '100', '0', 'data/products/D1009_6YVv.JPG', '0', '1', '998.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:38', '2014-03-05 11:43:38', '0');
INSERT INTO `js_product` VALUES ('352', 'XXR_1150', '', '', '', '', '', '', '', '100', '0', 'data/products/D1008_0uS2.JPG', '0', '1', '1680.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:38', '2014-03-05 11:43:38', '0');
INSERT INTO `js_product` VALUES ('353', 'XXR_1149', '', '', '', '', '', '', '', '100', '0', 'data/products/D1007_eYNQ.JPG', '0', '1', '580.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:39', '2014-03-05 11:43:39', '0');
INSERT INTO `js_product` VALUES ('354', 'XXR_1148', '', '', '', '', '', '', '', '100', '0', 'data/products/D1005_9LD3.JPG', '0', '1', '860.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:40', '2014-03-05 11:43:40', '0');
INSERT INTO `js_product` VALUES ('355', 'XXR_1147', '', '', '', '', '', '', '', '100', '0', 'data/products/D1003_tliB.JPG', '0', '1', '980.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:41', '2014-03-05 11:43:41', '0');
INSERT INTO `js_product` VALUES ('356', 'XXR_1146', '', '', '', '', '', '', '', '100', '0', 'data/products/A1028_BFee.JPG', '0', '1', '760.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:42', '2014-03-05 11:43:42', '0');
INSERT INTO `js_product` VALUES ('357', 'XXR_1145', '', '', '', '', '', '', '', '100', '0', 'data/products/A1027_8kcu.JPG', '0', '1', '580.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:42', '2014-03-05 11:43:42', '0');
INSERT INTO `js_product` VALUES ('358', 'XXR_1144', '', '', '', '', '', '', '', '100', '0', 'data/products/A1026_i0Oh.JPG', '0', '1', '680.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:43', '2014-03-05 11:43:43', '0');
INSERT INTO `js_product` VALUES ('359', 'XXR_1143', '', '', '', '', '', '', '', '100', '0', 'data/products/A1025_XiUj.JPG', '0', '1', '960.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:44', '2014-03-05 11:43:44', '0');
INSERT INTO `js_product` VALUES ('360', 'XXR_1142', '', '', '', '', '', '', '', '100', '0', 'data/products/A0031_R3c1.JPG', '0', '1', '11600.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:46', '2014-03-05 11:43:46', '0');
INSERT INTO `js_product` VALUES ('361', 'XXR_1141', '', '', '', '', '', '', '', '100', '0', 'data/products/A0026_mMSX.JPG', '0', '1', '13800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:51', '2014-03-05 11:43:51', '0');
INSERT INTO `js_product` VALUES ('362', 'XXR_1140', '', '', '', '', '', '', '', '100', '0', 'data/products/A0023_eBcc.JPG', '0', '1', '17600.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:56', '2014-03-05 11:43:56', '0');
INSERT INTO `js_product` VALUES ('363', 'XXR_1139', '', '', '', '', '', '', '', '100', '0', '', '0', '1', '14800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:43:56', '2014-03-05 11:43:56', '0');
INSERT INTO `js_product` VALUES ('364', 'XXR_1138', '', '', '', '', '', '', '', '100', '0', 'data/products/A0021_qgdV.JPG', '0', '1', '16800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:44:03', '2014-03-05 11:44:03', '0');
INSERT INTO `js_product` VALUES ('365', 'XXR_1137', '', '', '', '', '', '', '', '100', '0', 'data/products/A0020_Gxit.JPG', '0', '1', '11800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:44:11', '2014-03-05 11:44:11', '0');
INSERT INTO `js_product` VALUES ('366', 'XXR_1136', '', '', '', '', '', '', '', '100', '0', 'data/products/A0019_ls8t.JPG', '0', '1', '7580.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:44:21', '2014-03-05 11:44:21', '0');
INSERT INTO `js_product` VALUES ('367', 'XXR_1135', '', '', '', '', '', '', '', '100', '0', 'data/products/A0018_nOT2.JPG', '0', '1', '10600.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:44:29', '2014-03-05 11:44:29', '0');
INSERT INTO `js_product` VALUES ('368', 'XXR_1134', '', '', '', '', '', '', '', '100', '0', 'data/products/A0016_DcPA.JPG', '0', '1', '6800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:44:40', '2014-03-05 11:44:40', '0');
INSERT INTO `js_product` VALUES ('369', 'XXR_1133', '', '', '', '', '', '', '', '100', '0', 'data/products/A0015_ybE5.JPG', '0', '1', '13800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:44:46', '2014-03-05 11:44:46', '0');
INSERT INTO `js_product` VALUES ('370', 'XXR_1132', '', '', '', '', '', '', '', '100', '0', 'data/products/A0013_az8h.JPG', '0', '1', '10600.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:44:53', '2014-03-05 11:44:53', '0');
INSERT INTO `js_product` VALUES ('371', 'XXR_1131', '', '', '', '', '', '', '', '100', '0', 'data/products/A0012_rAxd.JPG', '0', '1', '12800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:44:55', '2014-03-05 11:44:55', '0');
INSERT INTO `js_product` VALUES ('372', 'XXR_1130', '', '', '', '', '', '', '', '100', '0', 'data/products/A0011_cuHe.JPG', '0', '1', '15800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:44:57', '2014-03-05 11:44:57', '0');
INSERT INTO `js_product` VALUES ('373', 'XXR_1129', '', '', '', '', '', '', '', '100', '0', 'data/products/A0010_xya8.JPG', '0', '1', '11800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:44:59', '2014-03-05 11:44:59', '0');
INSERT INTO `js_product` VALUES ('374', 'XXR_1128', '', '', '', '', '', '', '', '100', '0', 'data/products/A0009_l14E.JPG', '0', '1', '7890.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:45:02', '2014-03-05 11:45:02', '0');
INSERT INTO `js_product` VALUES ('375', 'XXR_1127', '', '', '', '', '', '', '', '100', '0', 'data/products/A0007_RQdW.JPG', '0', '1', '9680.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:45:03', '2014-03-05 11:45:03', '0');
INSERT INTO `js_product` VALUES ('376', 'XXR_1126', '', '', '', '', '', '', '', '100', '0', 'data/products/A0006_4yZY.JPG', '0', '1', '13600.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:45:06', '2014-03-05 11:45:06', '0');
INSERT INTO `js_product` VALUES ('377', 'XXR_1125', '', '', '', '', '', '', '', '100', '0', 'data/products/A0005_wsKw.JPG', '0', '1', '12800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:45:08', '2014-03-05 11:45:08', '0');
INSERT INTO `js_product` VALUES ('378', 'XXR_1124', '', '', '', '', '', '', '', '100', '0', 'data/products/A0001_4Y4D.JPG', '0', '1', '13800.0000', '0', '0', '2014-03-05', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2014-03-05 11:45:10', '2014-03-05 11:45:10', '0');
INSERT INTO `js_product_description` VALUES ('1', '3', '轿车用高级机油3.3kg', '国际领先的自修复技术，降低摩擦系数50%，减少磨损80%。有害气体总排放量减少20-50%，延长发动机使用寿命1倍以上。', '', '', '');
INSERT INTO `js_product_description` VALUES ('2', '3', '红魁黄酒', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('3', '3', '貔貅', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('4', '3', '如意貔貅', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('5', '3', '鼠来宝', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('6', '3', '龙龟把件', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('7', '3', '一夜封侯', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('8', '3', '富贵缠身', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('9', '3', 'A1059', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('10', '3', 'A1063', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('11', '3', 'A1062', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('12', '3', 'A1058', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('13', '3', 'A1061', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('14', '3', '水晶吊坠（1对）', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('15', '3', '水晶吊坠（1对）', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('16', '3', '水晶吊坠（1对）', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('17', '3', '观音  吊坠', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('18', '3', '观音  吊坠', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('19', '3', '观音 吊坠', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('20', '3', '观音', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('21', '3', '(如意）吊坠', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('22', '3', '(如意）吊坠', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('23', '3', '(如意）吊坠', '<ul>	<li>	</li></ul>', '', '', '');
INSERT INTO `js_product_description` VALUES ('24', '3', '（如意）吊坠', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('25', '3', '小牛角', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('26', '3', '（大牛角）', '<p>	&nbsp;</p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('27', '3', '大牛角梳', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('28', '3', '小牛角梳', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('29', '3', '小珍珠项链', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('30', '3', '米粒珍珠项链', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('31', '3', '大珍珠项链', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('32', '3', 'A0037', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('33', '3', 'A0035', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('34', '3', 'A0038', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('35', '3', 'A0032', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('36', '3', 'A0036', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('37', '3', 'A0039', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('38', '3', '水晶吊坠', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('39', '3', '金蝉吊坠', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('40', '3', '水晶吊坠（1对）', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('41', '3', '春之花', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('42', '3', '圆形佳人', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('43', '3', '花胶', '&nbsp;<div>	<div>		<span style=\"font-size:156%;\"><span style=\"font-family:Wingdings;color:#dc5900;font-size:75%;\">v</span></span><span style=\"font-family:宋体;font-size:28pt;\"><b>花胶的</b></span><span style=\"font-family:宋体;font-size:28pt;\"><b><a href=\"http://www.99.com.cn/special/zhongcaoyao.htm\" target=\"_parent\">功效</a></b></span><span style=\"font-family:宋体;font-size:28pt;\"><b>与作用：</b></span><span style=\"font-size:28pt;\"><b><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></b></span><span style=\"font-family:宋体;font-size:28pt;\">甘，平。补肾益精，滋养筋</span><span style=\"font-family:宋体;font-size:28pt;\">脉，止血，散瘀，消肿。治</span><span style=\"font-family:宋体;font-size:28pt;\"><a href=\"http://bj.99.com.cn/shzd/77897.htm\" target=\"_parent\">肾虚</a></span><span style=\"font-family:宋体;font-size:28pt;\">滑精，</span><span style=\"font-family:宋体;font-size:28pt;\"><a href=\"http://ye.99.com.cn/fenmian/\" target=\"_parent\">产后</a></span><span style=\"font-family:宋体;font-size:28pt;\">风痉，破</span><span style=\"font-family:宋体;font-size:28pt;\">伤风，吐血，血崩，创伤出血，痔疮。</span><span style=\"font-family:宋体;font-size:28pt;\"><b> </b></span>	</div>	<div>		<span style=\"font-size:156%;\"><span style=\"font-family:Wingdings;color:#dc5900;font-size:75%;\">v</span></span><span style=\"font-family:宋体;font-size:28pt;\"><b>　　花胶的营养价值：</b></span><span style=\"font-family:宋体;font-size:28pt;\"> </span>	</div>	<div>		<span style=\"font-size:156%;\"><span style=\"font-family:Wingdings;color:#dc5900;font-size:75%;\">v</span></span><span style=\"font-family:宋体;font-size:28pt;\">　　含蛋白质，脂肪，钙，磷，铁等。 </span>	</div>	<div>	</div></div>', '', '', '');
INSERT INTO `js_product_description` VALUES ('44', '3', '印尼进口燕窝', '&nbsp;<div>	<div>		<span style=\"font-size:67%;\"><span style=\"font-family:Wingdings;color:#dc5900;font-size:75%;\">v</span></span><span style=\"font-family:宋体;font-size:12pt;\"><b>功效：</b></span><span style=\"font-family:宋体;font-size:12pt;\"> </span> 	</div>	<div>		<span style=\"font-size:67%;\"><span style=\"font-family:Wingdings;color:#dc5900;font-size:75%;\">v</span></span><span style=\"font-family:宋体;font-size:12pt;\">　　</span><span style=\"font-size:12pt;\">1</span><span style=\"font-family:宋体;font-size:12pt;\">、补肺养阴、止肺虚性咳嗽、减少肺气病变。包括肺阴虚之哮喘、气促、久咳、痰中带血、咳血、咯血、</span><span style=\"font-family:宋体;font-size:12pt;\"><a href=\"http://www.pclady.com.cn/tlist/15949.html\" target=\"_parent\">支气管炎</a></span><span style=\"font-family:宋体;font-size:12pt;\">、出</span><span style=\"font-family:宋体;font-size:12pt;\">汗、低潮热。 </span> 	</div>	<div>		<span style=\"font-size:67%;\"><span style=\"font-family:Wingdings;color:#dc5900;font-size:75%;\">v</span></span><span style=\"font-family:宋体;font-size:12pt;\">　　</span><span style=\"font-size:12pt;\">2</span><span style=\"font-family:宋体;font-size:12pt;\">、补虚养胃、止胃寒性、呕吐。胃阴虚引起之反胃、干呕、肠鸣声。 </span> 	</div>	<div>		<span style=\"font-size:67%;\"><span style=\"font-family:Wingdings;color:#dc5900;font-size:75%;\">v</span></span><span style=\"font-family:宋体;font-size:12pt;\">　　</span><span style=\"font-size:12pt;\">3</span><span style=\"font-family:宋体;font-size:12pt;\">、凡病后虚弱、痨伤、中气亏损各症，配合</span><span style=\"font-family:宋体;font-size:12pt;\"><a href=\"http://health.pclady.com.cn/healthzq/bupin/yanwo/\" target=\"_parent\">燕窝</a></span><span style=\"font-family:宋体;font-size:12pt;\">作食，能滋阴调中。 </span> 	</div>	<div>		<span style=\"font-size:67%;\"><span style=\"font-family:Wingdings;color:#dc5900;font-size:75%;\">v</span></span><span style=\"font-family:宋体;font-size:12pt;\">　　</span><span style=\"font-size:12pt;\">4</span><span style=\"font-family:宋体;font-size:12pt;\">、止汗、气虚、脾虚之多汗、小便频繁、夜尿。 </span> 	</div>	<div>		<span style=\"font-size:67%;\"><span style=\"font-family:Wingdings;color:#dc5900;font-size:75%;\">v</span></span><span style=\"font-family:宋体;font-size:12pt;\">　　</span><span style=\"font-size:12pt;\">5</span><span style=\"font-family:宋体;font-size:12pt;\">、使人</span><span style=\"font-family:宋体;font-size:12pt;\"><a href=\"http://health.pclady.com.cn/pf/\" target=\"_parent\">皮肤</a></span><span style=\"font-family:宋体;font-size:12pt;\">光滑、有弹性和光泽，从而</span><span style=\"font-family:宋体;font-size:12pt;\"><a href=\"http://www.pclady.com.cn/tlist/23509.html\" target=\"_parent\">减少皱纹</a></span><span style=\"font-family:宋体;font-size:12pt;\">。 </span> 	</div>	<div>		<span style=\"font-size:67%;\"><span style=\"font-family:Wingdings;color:#dc5900;font-size:75%;\">v</span></span><span style=\"font-family:宋体;font-size:12pt;\">　　</span><span style=\"font-size:12pt;\">6</span><span style=\"font-family:宋体;font-size:12pt;\">、燕窝含多种氨基酸，婴幼儿和儿童常吃能长智慧、增加思维、抗敏感、补其先后天之不足。 </span> 	</div>	<div>		<span style=\"font-size:67%;\"><span style=\"font-family:Wingdings;color:#dc5900;font-size:75%;\">v</span></span><span style=\"font-family:宋体;font-size:12pt;\">　　</span><span style=\"font-size:12pt;\">7</span><span style=\"font-family:宋体;font-size:12pt;\">、孕妇在妊娠期间、</span><span style=\"font-family:宋体;font-size:12pt;\"><a href=\"http://www.pclady.com.cn/tlist/26521.html\" target=\"_parent\">产前产后</a></span><span style=\"font-family:宋体;font-size:12pt;\">进食，则有安胎、补胎之效。 </span> 	</div>	<div>		<span style=\"font-size:67%;\"><span style=\"font-family:Wingdings;color:#dc5900;font-size:75%;\">v</span></span><span style=\"font-family:宋体;font-size:12pt;\">　　</span><span style=\"font-size:12pt;\">8</span><span style=\"font-family:宋体;font-size:12pt;\">、燕窝是天然增津液的食品，并含多种氨基酸，对食道癌，咽喉癌、胃癌、肝癌、直肠癌等有抑止和抗衡作用。 </span> 	</div>	<div>		<span style=\"font-size:67%;\"><span style=\"font-family:Wingdings;color:#dc5900;font-size:75%;\">v</span></span><span style=\"font-family:宋体;font-size:12pt;\">　　</span><span style=\"font-size:12pt;\">9</span><span style=\"font-family:宋体;font-size:12pt;\">、凡经电疗、化疗而引起的后遗症，如咽干、咽痛、肿胀、便秘、声嘶、作呕等，食燕窝都有明显的改善。 </span> 	</div>	<div>		<span style=\"font-size:67%;\"><span style=\"font-family:Wingdings;color:#dc5900;font-size:75%;\">v</span></span><span style=\"font-family:宋体;font-size:12pt;\">　　</span><span style=\"font-size:12pt;\">10</span><span style=\"font-family:宋体;font-size:12pt;\">、燕窝味甘性平、滋阴润燥，是有营养的有益食品，有保健食疗之效，是大众欢迎之健康食品。 </span> 	</div>	<div>	</div></div>', '', '', '');
INSERT INTO `js_product_description` VALUES ('45', '3', '女咖啡炭健康内衣', '货号：121607<br />颜色：蓝灰细条<br />尺码：M-XXL<br />1.此款采用的是咖啡碳的面料，咖啡碳是一种功能性的面料，它的特点是，抑菌：人体出汗后产生的真菌在身体表面繁殖，咖啡碳能够有效的抑制真菌，预防皮肤病的发生，除臭：人体出汗后的矿物质和毒素排出体外，常年穿着咖啡碳内衣能够去除身体异味。防止紫外线：内层具有防辐射保护层，适合在电脑前长期工作的人员。储存热量：身体内产生的热量因为功能性面料的关系80%折射回体内，以达到保暖的效果。此款面料的吸湿透气性能佳，为四面弹产品，横向弹力1:2.5，纵向弹力1:2，穿着舒适、贴身、尽显人体曲线美感。<br />2.色纺纱线交替交织构成，是用纱线先染色再织造的面料，染料附着力小，对皮肤无伤害，适合各种肌肤的人群穿着，市面上的其他产品水洗后浮色的原因为，都是织成面料后再染色，所以色牢度不好，染料附着比较多，长期穿着会对人体造成伤害。<br />3.此款衣服百洗不变形，，导购推销的时候可以放心的向顾客介绍，，领型采用对条对格工艺，此工艺技术要求高，费料多，损耗大；合缝采用四针六线工艺，平面穿着无压痕。<br />4.此款面料为我公司专利产品，碳化纳米，咖啡豆的壳经过最新科技碳化纳米技术，中国专利号GL200410086547.4号。<br />', '', '', '');
INSERT INTO `js_product_description` VALUES ('46', '3', '男咖啡炭健康内衣', '货号：121606<br />颜色：蓝灰条纹<br />尺码：M-XXL<br />1.此款采用的是咖啡碳的面料，咖啡碳是一种功能性的面料，它的特点是，抑菌：人体出汗后产生的真菌在身体表面繁殖，咖啡碳能够有效的抑制真菌，预防皮肤病的发生，除臭：人体出汗后的矿物质和毒素排出体外，常年穿着咖啡碳内衣能够去除身体异味。防止紫外线：内层具有防辐射保护层，适合在电脑前长期工作的人员。储存热量：身体内产生的热量因为功能性面料的关系80%折射回体内，以达到保暖的效果。此款面料的吸湿透气性能佳，为四面弹产品，横向弹力1:2.5，纵向弹力1:2，穿着舒适、贴身、尽显人体曲线美感。<br />2.色纺纱线交替交织构成，是用纱线先染色再织造的面料，染料附着力小，对皮肤无伤害，适合各种肌肤的人群穿着，市面上的其他产品水洗后浮色的原因为，都是织成面料后再染色，所以色牢度不好，染料附着比较多，长期穿着会对人体造成伤害。<br />3.此款衣服百洗不变形，，导购推销的时候可以放心的向顾客介绍，，领型采用对条对格工艺，此工艺技术要求高，费料多，损耗大；合缝采用四针六线工艺，平面穿着无压痕。<br />4.此款面料为我公司专利产品，碳化纳米，咖啡豆的壳经过最新科技碳化纳米技术，中国专利号GL200410086547.4号。<br />', '', '', '');
INSERT INTO `js_product_description` VALUES ('47', '3', '女磨毛套装', '货号：131603<br />颜色：紫色<br />尺码：M-XXL<br />1.此款面料内层为发热保暖绒，采用双抗开司米材料，抗起球，抗静电，另外开司米具有羊绒的暖度和舒适度，在面料中被称之为仿羊绒。<br />2.颈部增加了磁性理疗贴片，有效的保护了颈椎部的血液循环，起到理疗颈椎的作用。<br />3.此款衣服先采用三线合缝技术，后用三针五线压缝，一道工序分两步完成是为了不易开线，缝合处面料平整，优于其它品牌产品。<br />4.独有魔咔3D智能美体技术：1.四片立体拼片裁剪技术，彻底颠覆传统内衣前后两片裁剪缝合手法，完全去除腰部多余的布料，与其他内衣相比穿后更显腰身。人不是一张纸，是立体的，合理裁剪已经把多余的面料都裁减掉，合体是特点，不是版型小2.五大靶向定位魔咔美体结构：托胸：魔咔弧托胸环带，按人体工学设计，配合文胸充分起到聚拢支撑作用，倍现胸型曲线。胸部是立体的，撑开之后是按照人体工学设计的。直背：X型直背带设计，在行动中自动拉伸背部曲线； 收腰：独有环形束腰环带和菱形收腹角带，瞬间平腹打造小蛮腰；提臀：独有双向U型提臀环带，发挥包臀提升效用雕塑峰翘美臀；美腿：独有拉长美腿带，具有腿型修正功能。<br />', '', '', '');
INSERT INTO `js_product_description` VALUES ('48', '3', '蕾丝保暖美体内衣', '货号：124605<br />颜色：麻紫<br />尺码：M-XXL<br />1.独有魔咔3D智能美体技术：1.四片立体拼片裁剪技术，彻底颠覆传统内衣前后两片裁剪缝合手法，完全去除腰部多余的布料，与其他内衣相比穿后更显腰身。人不是一张纸，是立体的，合理裁剪已经把多余的面料都裁减掉，合体是特点，不是版型小；<br />2.五大靶向定位魔咔美体结构：托胸：魔咔弧托胸环带，按人体工学设计，配合文胸充分起到聚拢支撑作用，倍现胸型曲线。胸部是立体的，撑开之后是按照人体工学设计的。直背：X型直背带设计，采用蜂窝状六棱型拉力网布，在行动中自动拉伸背部曲线； 收腰：独有环形束腰环带和菱形收腹角带，蜂窝状六棱型拉力网布，瞬间平腹打造小蛮腰；提臀：独有双向U型提臀环带，发挥包臀提升效用雕塑峰翘美臀；美腿：独有拉长美腿带，具有腿型修正功能。<br />3.面料采用的是65支长绒棉，产地新疆，阳光照射时间长，摸上去有暖融融的感觉，面料弹性极佳<br />', '', '', '');
INSERT INTO `js_product_description` VALUES ('49', '3', '女士羊绒套装', '货号：131607<br />颜色：水粉色<br />尺码：M-XXL<br />1.此款衣服先采用三线合缝技术，后用三针五线压缝，一道工序分两步完成是为了不易开线，缝合处面料平整，优于其它品牌产品<br />2.此款产品采用兰精木代尔，兰精木代尔为榉木纤维，是一种纯绿色、环保纤维，低碳、柔软，如雪花般纯净，垂性好，吸水能力高于棉50%，干爽透气，利于人体血液循环，是最适合贴身穿着的保健面料。百洗不缩水、不变型、不掉色，因为纯植物纤维，适合各种敏感肌肤，对肌肤不会产生一点负担，蚕丝般的光泽和柔性，表面覆短纤绒状，贴身穿着舒适，越洗越柔软，同样25次洗涤，棉越洗越硬，莫代尔越洗越柔软，有光泽。<br />3.独有魔咔3D智能美体技术：1.四片立体拼片裁剪技术，彻底颠覆传统内衣前后两片裁剪缝合手法，完全去除腰部多余的布料，与其他内衣相比穿后更显腰身。人不是一张纸，是立体的，合理裁剪已经把多余的面料都裁减掉，合体是特点，不是版型小2.五大靶向定位魔咔美体结构：托胸：魔咔弧托胸环带，按人体工学设计，配合文胸充分起到聚拢支撑作用，倍现胸型曲线。胸部是立体的，撑开之后是按照人体工学设计的。直背：X型直背带设计，在行动中自动拉伸背部曲线； 收腰：独有环形束腰环带和菱形收腹角带，瞬间平腹打造小蛮腰；提臀：独有双向U型提臀环带，发挥包臀提升效用雕塑峰翘美臀；美腿：独有拉长美腿带，具有腿型修正功能。<br />', '', '', '');
INSERT INTO `js_product_description` VALUES ('50', '3', '男士羊绒套装', '货号：131606<br />颜色：黑色&nbsp; 灰色<br />尺码：M-XXL<br />1.此款衣服先采用三线合缝技术，后用三针五线压缝，一道工序分两步完成是为了不易开线，缝合处面料平整，优于其它品牌产品<br />2.此款产品采用兰精木代尔，兰精木代尔为榉木纤维，是一种纯绿色、环保纤维，低碳、柔软，如雪花般纯净，垂性好，吸水能力高于棉50%，干爽透气，利于人体血液循环，是最适合贴身穿着的保健面料。百洗不缩水、不变型、不掉色，因为纯植物纤维，适合各种敏感肌肤，对肌肤不会产生一点负担，蚕丝般的光泽和柔性，表面覆短纤绒状，贴身穿着舒适，越洗越柔软，同样25次洗涤，棉越洗越硬，莫代尔越洗越柔软，有光泽。<br />3.独有魔咔3D智能美体技术：1.四片立体拼片裁剪技术，彻底颠覆传统内衣前后两片裁剪缝合手法，完全去除腰部多余的布料，与其他内衣相比穿后更显腰身。人不是一张纸，是立体的，合理裁剪已经把多余的面料都裁减掉，合体是特点，不是版型小2.五大靶向定位魔咔美体结构：托胸：魔咔弧托胸环带，按人体工学设计，配合文胸充分起到聚拢支撑作用，倍现胸型曲线。胸部是立体的，撑开之后是按照人体工学设计的。直背：X型直背带设计，在行动中自动拉伸背部曲线； 收腰：独有环形束腰环带和菱形收腹角带，瞬间平腹打造小蛮腰；提臀：独有双向U型提臀环带，发挥包臀提升效用雕塑峰翘美臀；美腿：独有拉长美腿带，具有腿型修正功能。<br />', '', '', '');
INSERT INTO `js_product_description` VALUES ('51', '3', '非常6+1保暖裤', '货号：133601<br />颜色：黑色<br />尺码：M-XXL<br />1、楔形环带，前低后高，环型高腰腰带，收腹效果极佳，穿上之后腰围立减3公分，塑造女运动员的腰线，内层采用远红外提臀带，远红外具有对皮肤下2-3cm的血液改善微循环，增强自愈能力，提高免疫能力，加速新陈代谢。<br />2、前四层为：蜂窝状六棱形拉力布<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 超细密羔羊绒&nbsp; 扎染紫<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 超细密羔羊绒<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 纯棉收腹片（护宫）<br />后三层为：蜂窝状六棱形拉力布<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 超细密羔羊绒<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 远红外环形提臀带<br />', '', '', '');
INSERT INTO `js_product_description` VALUES ('52', '3', '塑暖男士保暖裤', '货号：123602<br />颜色：浅灰<br />尺码：M-XXL', '', '', '');
INSERT INTO `js_product_description` VALUES ('53', '3', '羊毛丽绒男套装', '货号：121602<br />颜色：黑色<br />尺码：L<br />', '', '', '');
INSERT INTO `js_product_description` VALUES ('54', '3', '炫彩美体裤', '<p>	货号：123621<br />颜色：蓝绿色<br />尺码：M-XL</p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('55', '3', '青春肽美白化妆品', '功效: 美白 补水 <br />保湿规格: 正常规格<br />品牌: 肌源<br />面部护理套装: 其它肌源单品<br />适合肤质: 所有肤质化妆<br />品特性: 温和度 气味', '', '', '');
INSERT INTO `js_product_description` VALUES ('56', '3', '1673型', '<li title=\"&nbsp;自主实拍图\">	主图来源:&nbsp;自主实拍图</li><li title=\"&nbsp;修身型\">	货号：1673</li><li title=\"&nbsp;修身型\">	板型:&nbsp;修身型</li><li title=\"&nbsp;加厚\">	厚薄:&nbsp;加厚</li><li title=\"&nbsp;通勤\">	风格:&nbsp;通勤</li><li title=\"&nbsp;韩版\">	通勤:&nbsp;韩版</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	衣长:&nbsp;中长款</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	袖长:&nbsp;长袖</li><li title=\"&nbsp;圆领\">	领子:&nbsp;狐狸领</li><li title=\"&nbsp;常规袖\">	袖型:&nbsp;常规袖</li><li title=\"&nbsp;带毛领\">	流行元素/工艺:&nbsp;带毛领</li><li title=\"&nbsp;羊皮\">	面料材质:&nbsp;羊皮</li><li title=\"&nbsp;2013冬季\">	年份/季节:&nbsp;2013冬季</li><li title=\"&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）\">	颜色分类:&nbsp;黑色</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('57', '3', '303型', '<li title=\"&nbsp;自主实拍图\">	主图来源:&nbsp;自主实拍图</li><li title=\"&nbsp;修身型\">	货号：303</li><li title=\"&nbsp;修身型\">	板型:&nbsp;修身型</li><li title=\"&nbsp;加厚\">	厚薄:&nbsp;加厚</li><li title=\"&nbsp;通勤\">	风格:&nbsp;通勤</li><li title=\"&nbsp;韩版\">	通勤:&nbsp;韩版</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	衣长:&nbsp;中长款</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	袖长:&nbsp;长袖</li><li title=\"&nbsp;圆领\">	领子:&nbsp;狐狸领</li><li title=\"&nbsp;常规袖\">	袖型:&nbsp;常规袖</li><li title=\"&nbsp;拉链\">	衣门襟:&nbsp;拉链</li><li title=\"&nbsp;带毛领\">	流行元素/工艺:&nbsp;带毛领</li><li title=\"&nbsp;羊皮\">	面料材质:&nbsp;羊皮</li><li title=\"&nbsp;2013冬季\">	年份/季节:&nbsp;2013冬季</li><li title=\"&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）\">	颜色分类:&nbsp;图片色</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('58', '3', '1307型', '<li title=\"&nbsp;自主实拍图\">	主图来源:&nbsp;自主实拍图</li><li title=\"&nbsp;修身型\">	货号：1307</li><li title=\"&nbsp;修身型\">	板型:&nbsp;修身型</li><li title=\"&nbsp;加厚\">	厚薄:&nbsp;加厚</li><li title=\"&nbsp;通勤\">	风格:&nbsp;通勤</li><li title=\"&nbsp;韩版\">	通勤:&nbsp;韩版</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	衣长:&nbsp;中长款</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	袖长:&nbsp;长袖</li><li title=\"&nbsp;圆领\">	领子:&nbsp;狐狸领</li><li title=\"&nbsp;常规袖\">	袖型:&nbsp;常规袖</li><li title=\"&nbsp;拉链\">	衣门襟:&nbsp;纽扣</li><li title=\"&nbsp;拉链\">	流行元素/工艺:&nbsp;带毛领</li><li title=\"&nbsp;羊皮\">	面料材质:&nbsp;羊皮</li><li title=\"&nbsp;2013冬季\">	年份/季节:&nbsp;2013冬季</li><li title=\"&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）\">	颜色分类:&nbsp;粉色</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('59', '3', '308型', '<li title=\"&nbsp;自主实拍图\">	主图来源:&nbsp;自主实拍图</li><li title=\"&nbsp;修身型\">	货号：308</li><li title=\"&nbsp;修身型\">	板型:&nbsp;修身型</li><li title=\"&nbsp;加厚\">	厚薄:&nbsp;加厚</li><li title=\"&nbsp;通勤\">	风格:&nbsp;通勤</li><li title=\"&nbsp;韩版\">	通勤:&nbsp;韩版</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	衣长:&nbsp;常规款</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	袖长:&nbsp;长袖</li><li title=\"&nbsp;圆领\">	领子:&nbsp;狐狸领</li><li title=\"&nbsp;常规袖\">	袖型:&nbsp;常规袖</li><li title=\"&nbsp;拉链\">	衣门襟:&nbsp;纽扣</li><li title=\"&nbsp;带毛领\">	流行元素/工艺:&nbsp;带毛领</li><li title=\"&nbsp;羊皮\">	面料材质:&nbsp;羊皮</li><li title=\"&nbsp;2013冬季\">	年份/季节:&nbsp;2013冬季</li><li title=\"&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）\">	颜色分类:&nbsp;图片色</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('60', '3', '1206型', '<li title=\"&nbsp;自主实拍图\">	主图来源:&nbsp;自主实拍图</li><li title=\"&nbsp;修身型\">	货号：1206</li><li title=\"&nbsp;修身型\">	板型:&nbsp;修身型</li><li title=\"&nbsp;加厚\">	厚薄:&nbsp;加厚</li><li title=\"&nbsp;通勤\">	风格:&nbsp;通勤</li><li title=\"&nbsp;韩版\">	通勤:&nbsp;韩版</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	衣长:&nbsp;常规款</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	袖长:&nbsp;长袖</li><li title=\"&nbsp;圆领\">	领子:&nbsp;狐狸领</li><li title=\"&nbsp;常规袖\">	袖型:&nbsp;常规袖</li><li title=\"&nbsp;带毛领\">	流行元素/工艺:&nbsp;带毛领</li><li title=\"&nbsp;羊皮\">	面料材质:&nbsp;羊皮</li><li title=\"&nbsp;2013冬季\">	年份/季节:&nbsp;2013冬季</li><li title=\"&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）\">	颜色分类:&nbsp;黑色</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('61', '3', '13-95型', '<li title=\"&nbsp;自主实拍图\">	主图来源:&nbsp;自主实拍图</li><li title=\"&nbsp;修身型\">	货号：13-95</li><li title=\"&nbsp;修身型\">	板型:&nbsp;修身型</li><li title=\"&nbsp;加厚\">	厚薄:&nbsp;加厚</li><li title=\"&nbsp;通勤\">	风格:&nbsp;通勤</li><li title=\"&nbsp;韩版\">	通勤:&nbsp;韩版</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	衣长:&nbsp;常规款</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	袖长:&nbsp;长袖</li><li title=\"&nbsp;圆领\">	领子:&nbsp;狐狸领</li><li title=\"&nbsp;常规袖\">	袖型:&nbsp;常规袖</li><li title=\"&nbsp;拉链\">	衣门襟:&nbsp;拉链</li><li title=\"&nbsp;带毛领\">	流行元素/工艺:&nbsp;带毛领</li><li title=\"&nbsp;羊皮\">	面料材质:&nbsp;羊皮</li><li title=\"&nbsp;2013冬季\">	年份/季节:&nbsp;2013冬季</li><li title=\"&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）\">	颜色分类:&nbsp;图片色</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('62', '3', '1208型', '<li title=\"&nbsp;自主实拍图\">	主图来源:&nbsp;自主实拍图</li><li title=\"&nbsp;凯思达\">	货号：1208</li><li title=\"&nbsp;凯思达\">	板型:&nbsp;修身型</li><li title=\"&nbsp;加厚\">	厚薄:&nbsp;加厚</li><li title=\"&nbsp;通勤\">	风格:&nbsp;通勤</li><li title=\"&nbsp;韩版\">	通勤:&nbsp;韩版</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	衣长:中长款</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	袖长:&nbsp;长袖</li><li title=\"&nbsp;圆领\">	领子:&nbsp;圆领</li><li title=\"&nbsp;常规袖\">	袖型:&nbsp;常规袖</li><li title=\"&nbsp;拉链\">	衣门襟:&nbsp;拉链</li><li title=\"&nbsp;带毛领\">	流行元素/工艺:&nbsp;带毛领</li><li title=\"&nbsp;羊皮\">	面料材质:&nbsp;羊皮</li><li title=\"&nbsp;2013冬季\">	年份/季节:&nbsp;2013冬季</li><li title=\"&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）\">	颜色分类:&nbsp;黑色&nbsp;&nbsp; 白色</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('63', '3', '1358型', '<li title=\"&nbsp;自主实拍图\">	主图来源:&nbsp;自主实拍图</li><li title=\"&nbsp;修身型\">	货号：1358</li><li title=\"&nbsp;修身型\">	板型:&nbsp;修身型</li><li title=\"&nbsp;加厚\">	厚薄:&nbsp;加厚</li><li title=\"&nbsp;通勤\">	风格:&nbsp;通勤</li><li title=\"&nbsp;韩版\">	通勤:&nbsp;韩版</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	衣长:&nbsp;常规款</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	袖长:&nbsp;长袖</li><li title=\"&nbsp;圆领\">	领子:&nbsp;圆领</li><li title=\"&nbsp;常规袖\">	袖型:&nbsp;常规袖</li><li title=\"&nbsp;拉链\">	衣门襟:&nbsp;纽扣</li><li title=\"&nbsp;拉链\">	图案:&nbsp;纯色</li><li title=\"&nbsp;带毛领\">	流行元素/工艺:&nbsp;带毛领</li><li title=\"&nbsp;羊皮\">	面料材质:&nbsp;羊皮</li><li title=\"&nbsp;2013冬季\">	年份/季节:&nbsp;2013冬季</li><li title=\"&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）\">	颜色分类:&nbsp;白色</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('64', '3', '7307型', '<div class=\"wp-products-detail-desc\">	<li title=\"&nbsp;直筒型\">		<li title=\"&nbsp;自主实拍图\">			主图来源:&nbsp;自主实拍图		</li>&nbsp;&nbsp;&nbsp;货号：7307	</li>	<li title=\"&nbsp;直筒型\">		&nbsp;板型:&nbsp;直筒型	</li>	<li title=\"&nbsp;常规\">		厚薄:&nbsp;常规	</li>	<li title=\"&nbsp;街头\">		风格:&nbsp;街头	</li>	<li title=\"&nbsp;欧美\">		街头:&nbsp;欧美	</li>	<li title=\"&nbsp;中长款(65cm<衣长≤80cm)\">		衣长:&nbsp;中长款	</li>	<li title=\"&nbsp;中长款(65cm<衣长≤80cm)\">		袖长:&nbsp;长袖	</li>	<li title=\"&nbsp;拉链\">		衣门襟:&nbsp;纽扣	</li>	<li title=\"&nbsp;拉链\">		年份/季节:&nbsp;2013秋季	</li>	<li title=\"&nbsp;明星同款（如图）\">		颜色分类:&nbsp;（如图）	</li>	<li title=\"&nbsp;明星同款（如图）\">		款式：&nbsp; 男士	</li></div>', '', '', '');
INSERT INTO `js_product_description` VALUES ('65', '3', '1398型', '<li title=\"&nbsp;自主实拍图\">	主图来源:&nbsp;自主实拍图</li><li title=\"&nbsp;修身型\">	货号：1398</li><li title=\"&nbsp;修身型\">	板型:&nbsp;修身型</li><li title=\"&nbsp;通勤\">	风格:&nbsp;通勤</li><li title=\"&nbsp;韩版\">	通勤:&nbsp;韩版</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	衣长:&nbsp;常规款</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	袖长:&nbsp;长袖</li><li title=\"&nbsp;圆领\">	领子:&nbsp;狐狸领</li><li title=\"&nbsp;常规袖\">	袖型:&nbsp;常规袖</li><li title=\"&nbsp;纯色\">	图案:&nbsp;纯色</li><li title=\"&nbsp;带毛领\">	流行元素/工艺:&nbsp;带毛领</li><li title=\"&nbsp;羊皮\">	面料材质:&nbsp;羊皮</li><li title=\"&nbsp;2013冬季\">	年份/季节:&nbsp;2013冬季</li><li title=\"&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）\">	颜色分类:&nbsp;图片色</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('66', '3', '1391型', '<li title=\"&nbsp;自主实拍图\">	主图来源:&nbsp;自主实拍图</li><li title=\"&nbsp;修身型\">	货号：1391</li><li title=\"&nbsp;修身型\">	板型:&nbsp;修身型</li><li title=\"&nbsp;通勤\">	风格:&nbsp;通勤</li><li title=\"&nbsp;韩版\">	通勤:&nbsp;韩版</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	衣长:&nbsp;常规款</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	袖长:&nbsp;长袖</li><li title=\"&nbsp;圆领\">	领子:&nbsp;貂领</li><li title=\"&nbsp;常规袖\">	袖型:&nbsp;常规袖</li><li title=\"&nbsp;拉链\">	图案:&nbsp;纯色</li><li title=\"&nbsp;带毛领\">	流行元素/工艺:&nbsp;带毛领</li><li title=\"&nbsp;羊皮\">	面料材质:&nbsp;羊皮</li><li title=\"&nbsp;2013冬季\">	年份/季节:&nbsp;2013冬季</li><li title=\"&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）\">	颜色分类:&nbsp;白色</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('67', '3', '12210型', '<li title=\"&nbsp;自主实拍图\">	主图来源:&nbsp;自主实拍图</li><li title=\"&nbsp;修身型\">	板型:&nbsp;修身型</li><li title=\"&nbsp;通勤\">	风格:&nbsp;通勤</li><li title=\"&nbsp;韩版\">	通勤:&nbsp;韩版</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	衣长:&nbsp;常规款</li><li title=\"&nbsp;常规款(50cm<衣长≤65cm)\">	袖长:&nbsp;长袖</li><li title=\"&nbsp;圆领\">	领子:&nbsp;圆领</li><li title=\"&nbsp;常规袖\">	袖型:&nbsp;常规袖</li><li title=\"&nbsp;拉链\">	衣门襟:&nbsp;纽扣</li><li title=\"&nbsp;拉链\">	图案:&nbsp;纯色</li><li title=\"&nbsp;带毛领\">	流行元素/工艺:&nbsp;带毛领</li><li title=\"&nbsp;羊皮\">	面料材质:&nbsp;羊皮</li><li title=\"&nbsp;2013冬季\">	年份/季节:&nbsp;2013冬季</li><li title=\"&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）\">	颜色分类:&nbsp;白色</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('68', '3', '13106型', '<li title=\"&nbsp;自主实拍图\">	主图来源:&nbsp;自主实拍图</li><li title=\"&nbsp;KFN134P014\">	货号:&nbsp;13106</li><li title=\"&nbsp;KFN134P014\">	板型:&nbsp;修身型</li><li title=\"&nbsp;通勤\">	风格:&nbsp;通勤</li><li title=\"&nbsp;韩版\">	通勤:&nbsp;韩版</li><li title=\"&nbsp;中长款(65cm<衣长≤80cm)\">	款式:&nbsp;中长款</li><li title=\"&nbsp;中长款(65cm<衣长≤80cm)\">	袖长:&nbsp;长袖</li><li title=\"&nbsp;V领\">	领型:&nbsp;狐狸领</li><li title=\"&nbsp;常规袖\">	袖型:&nbsp;常规袖</li><li title=\"&nbsp;三粒扣\">	衣门襟:&nbsp;拉链</li><li title=\"&nbsp;三粒扣\">	皮质:&nbsp;羊皮</li><li title=\"&nbsp;纽扣&nbsp;毛领&nbsp;口袋&nbsp;系带/腰带\">	流行元素/工艺:&nbsp;拉链&nbsp;毛领&nbsp;口袋&nbsp;系带/腰带</li><li title=\"&nbsp;2013冬季\">	年份/季节:&nbsp;2013冬季</li><li title=\"&nbsp;棕色金属腰带&nbsp;棕色&nbsp;黑色金属腰带&nbsp;黑色\">	颜色分类:&nbsp;图片色</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('69', '3', '13507型', '<li title=\"&nbsp;自主实拍图\">	主图来源:&nbsp;自主实拍图</li><li title=\"&nbsp;修身型\">	板型:&nbsp;修身型</li><li title=\"&nbsp;通勤\">	风格:&nbsp;通勤</li><li title=\"&nbsp;淑女\">	通勤:&nbsp;淑女</li><li title=\"&nbsp;中长款(65cm<衣长≤80cm)\">	款式:&nbsp;中长款(65cm&lt;衣长≤80cm)</li><li title=\"&nbsp;长袖\">	袖长:&nbsp;长袖</li><li title=\"&nbsp;连帽/帽领\">	领型:&nbsp;圆领</li><li title=\"&nbsp;其他袖型\">	袖型:&nbsp;其他袖型</li><li title=\"&nbsp;单排两粒扣\">	衣门襟:&nbsp;单排粒扣</li><li title=\"&nbsp;羊皮\">	皮质:&nbsp;纯羊皮</li><li title=\"&nbsp;纽扣&nbsp;毛领&nbsp;口袋\">	流行元素/工艺:&nbsp;纽扣&nbsp;毛领&nbsp;口袋</li><li title=\"&nbsp;黑色&nbsp;红色\">	颜色分类:&nbsp;粉色</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('70', '3', 'M08', '<li title=\"&nbsp;直筒型\">	板型:&nbsp;直筒型</li><li title=\"&nbsp;常规\">	厚薄:&nbsp;常规</li><li title=\"&nbsp;街头\">	风格:&nbsp;街头</li><li title=\"&nbsp;欧美\">	街头:&nbsp;欧美</li><li title=\"&nbsp;中长款(65cm<衣长≤80cm)\">	衣长:&nbsp;中长款(65cm&lt;衣长≤80cm)</li><li title=\"&nbsp;长袖\">	袖长:&nbsp;长袖</li><li title=\"&nbsp;拉链\">	衣门襟:&nbsp;拉链</li><li title=\"&nbsp;2013秋季\">	年份/季节:&nbsp;2013秋季</li><li title=\"&nbsp;明星同款（如图）\">	颜色分类:&nbsp;（如图）</li><li title=\"&nbsp;明星同款（如图）\">	款式：&nbsp; 男士</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('71', '3', '大狐头型', '<li title=\"&nbsp;自主实拍图\">	主图来源:&nbsp;自主实拍图</li><li title=\"&nbsp;LY006\">	货号:大狐头型</li><li title=\"&nbsp;LY006\">	板型:&nbsp;修身型</li><li title=\"&nbsp;通勤\">	风格:&nbsp;通勤</li><li title=\"&nbsp;韩版\">	通勤:&nbsp;韩版</li><li title=\"&nbsp;中长款(65cm<衣长≤80cm)\">	款式:&nbsp;中长款</li><li title=\"&nbsp;中长款(65cm<衣长≤80cm)\">	袖长:&nbsp;长袖</li><li title=\"&nbsp;翻领/POLO领\">	领型:狐狸领</li><li title=\"&nbsp;常规袖\">	袖型:&nbsp;常规袖</li><li title=\"&nbsp;其他门襟样式\">	衣门襟:&nbsp;其他门襟样式</li><li title=\"&nbsp;羊皮\">	皮质:&nbsp;纯羊皮</li><li title=\"&nbsp;毛领&nbsp;系带/腰带\">	流行元素/工艺:&nbsp;毛领&nbsp;系带/腰带</li><li title=\"&nbsp;2013冬季\">	年份/季节:&nbsp;2013冬季</li><li title=\"&nbsp;2013冬季\">	颜色分类:&nbsp;黑色</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('72', '3', '8999型', '<li title=\"&nbsp;自主实拍图\">	主图来源:&nbsp;自主实拍图</li><li title=\"&nbsp;KFN134P014\">	货号:8999</li><li title=\"&nbsp;KFN134P014\">	板型:&nbsp;修身型</li><li title=\"&nbsp;通勤\">	风格:&nbsp;通勤</li><li title=\"&nbsp;韩版\">	通勤:&nbsp;韩版</li><li title=\"&nbsp;中长款(65cm<衣长≤80cm)\">	款式:&nbsp;中长款</li><li title=\"&nbsp;中长款(65cm<衣长≤80cm)\">	袖长:&nbsp;长袖</li><li title=\"&nbsp;V领\">	领型:&nbsp;貂领</li><li title=\"&nbsp;常规袖\">	袖型:&nbsp;常规袖</li><li title=\"&nbsp;羊皮\">	皮质:&nbsp;纯羊皮</li><li title=\"&nbsp;纽扣&nbsp;毛领&nbsp;口袋&nbsp;系带/腰带\">	流行元素/工艺:&nbsp;纽扣&nbsp;毛领&nbsp;</li><li title=\"&nbsp;纽扣&nbsp;毛领&nbsp;口袋&nbsp;系带/腰带\">	年份/季节:&nbsp;2013冬季</li><li title=\"&nbsp;棕色金属腰带&nbsp;棕色&nbsp;黑色金属腰带&nbsp;黑色\">	颜色分类:图片色</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('73', '3', '宫面', '<div>	&nbsp;据说，早在明朝时期，河北省藁城一带的面食艺人，就以精于制作挂面而驰名燕赵之地。清光绪年间，地方官吏曾以此进贡皇宫，列为宫廷佳品，故得名“宫面”。对此，《藁城县志》曾有这栏的记载：“吾邑之挂面，系土人所艺，味极适口，相传数百载，曾进贡清皇室，故名产也。”在民国时期，藁城“宫面”曾出口朝鲜，并受过孙中山南京总统府颁发的“国光银牌”嘉奖。<br />&nbsp;&nbsp;&nbsp;&nbsp;相传，唐太宗李世民平定天下之后，也想仿效秦始皇东巡大海寻求长生不老之药。这一天，李世民行走在藁城界内，突然病重，吃什么都不管用。这可急坏了娘娘、太监和御医。县令万般无奈，只好找到了当时马记面食店的掌柜马九华。当时马九华三十来岁，马记面食店传到他手已经有八代了。李世民吃了他做的面条，竞鬼使神差般痊愈了。从此藁城宫面成了宫庭御膳。马九华可谓宫面的祖师爷。北宋、元朝时已开始生产挂面，明代、清代为生产旺盛时期。<br />&nbsp;&nbsp;&nbsp;&nbsp;林翰儒所著民国十二年出版的《藁城乡土地理》中说：“若食品中之挂面，味极适口，故名产也。”当时直隶总督荣禄和李鸿章都曾直接向慈禧太后进贡“藁邑挂面两盒”，以表忠心。<br />&nbsp;&nbsp;&nbsp;&nbsp;据史料记载，在民国初年，曾风行一时的藁城东南、西南的李老春、张光朴两家挂面店弃营之后，由杨氏福元单独经营，取字号“双胜永”。他做的挂面被当时的藁城事业局选中，邮往南京、上海参加评试，结果被南京工商部授予孙中山总统府“国光”银奖。同时，南京、上海两个工商部还寄给他名优产品画册和奖状十余张，朝鲜也给他奖状一张。可见当时宫面已经传到了朝鲜。难怪人们常说：“藁城的宫面好做．眼(空心)难钻。”<br />&nbsp;&nbsp;&nbsp;&nbsp;爱新觉罗溥杰吃了宫面之后欣然提诗一首表达对宫面的赞美之情：<br /></div>', '', '', '');
INSERT INTO `js_product_description` VALUES ('74', '3', '宫面', '据说，早在明朝时期，河北省藁城一带的面食艺人，就以精于制作挂面而驰名燕赵之地。清光绪年间，地方官吏曾以此进贡皇宫，列为宫廷佳品，故得名“宫面”。对此，《藁城县志》曾有这栏的记载：“吾邑之挂面，系土人所艺，味极适口，相传数百载，曾进贡清皇室，故名产也。”在民国时期，藁城“宫面”曾出口朝鲜，并受过孙中山南京总统府颁发的“国光银牌”嘉奖。    相传，唐太宗李世民平定天下之后，也想仿效秦始皇东巡大海寻求长生不老之药。这一天，李世民行走在藁城界内，突然病重，吃什么都不管用。这可急坏了娘娘、太监和御医。县令万般无奈，只好找到了当时马记面食店的掌柜马九华。当时马九华三十来岁，马记面食店传到他手已经有八代了。李世民吃了他做的面条，竞鬼使神差般痊愈了。从此藁城宫面成了宫庭御膳。马九华可谓宫面的祖师爷。北宋、元朝时已开始生产挂面，明代、清代为生产旺盛时期。    林翰儒所著民国十二年出版的《藁城乡土地理》中说：“若食品中之挂面，味极适口，故名产也。”当时直隶总督荣禄和李鸿章都曾直接向慈禧太后进贡“藁邑挂面两盒”，以表忠心。    据史料记载，在民国初年，曾风行一时的藁城东南、西南的李老春、张光朴两家挂面店弃营之后，由杨氏福元单独经营，取字号“双胜永”。他做的挂面被当时的藁城事业局选中，邮往南京、上海参加评试，结果被南京工商部授予孙中山总统府“国光”银奖。同时，南京、上海两个工商部还寄给他名优产品画册和奖状十余张，朝鲜也给他奖状一张。可见当时宫面已经传到了朝鲜。难怪人们常说：“藁城的宫面好做．眼(空心)难钻。”    爱新觉罗溥杰吃了宫面之后欣然提诗一首表达对宫面的赞美之情：', '', '', '');
INSERT INTO `js_product_description` VALUES ('75', '3', '宫面', '<div>	&nbsp;据说，早在明朝时期，河北省藁城一带的面食艺人，就以精于制作挂面而驰名燕赵之地。清光绪年间，地方官吏曾以此进贡皇宫，列为宫廷佳品，故得名“宫面”。对此，《藁城县志》曾有这栏的记载：“吾邑之挂面，系土人所艺，味极适口，相传数百载，曾进贡清皇室，故名产也。”在民国时期，藁城“宫面”曾出口朝鲜，并受过孙中山南京总统府颁发的“国光银牌”嘉奖。<br />&nbsp;&nbsp;&nbsp;&nbsp;相传，唐太宗李世民平定天下之后，也想仿效秦始皇东巡大海寻求长生不老之药。这一天，李世民行走在藁城界内，突然病重，吃什么都不管用。这可急坏了娘娘、太监和御医。县令万般无奈，只好找到了当时马记面食店的掌柜马九华。当时马九华三十来岁，马记面食店传到他手已经有八代了。李世民吃了他做的面条，竞鬼使神差般痊愈了。从此藁城宫面成了宫庭御膳。马九华可谓宫面的祖师爷。北宋、元朝时已开始生产挂面，明代、清代为生产旺盛时期。<br />&nbsp;&nbsp;&nbsp;&nbsp;林翰儒所著民国十二年出版的《藁城乡土地理》中说：“若食品中之挂面，味极适口，故名产也。”当时直隶总督荣禄和李鸿章都曾直接向慈禧太后进贡“藁邑挂面两盒”，以表忠心。<br />&nbsp;&nbsp;&nbsp;&nbsp;据史料记载，在民国初年，曾风行一时的藁城东南、西南的李老春、张光朴两家挂面店弃营之后，由杨氏福元单独经营，取字号“双胜永”。他做的挂面被当时的藁城事业局选中，邮往南京、上海参加评试，结果被南京工商部授予孙中山总统府“国光”银奖。同时，南京、上海两个工商部还寄给他名优产品画册和奖状十余张，朝鲜也给他奖状一张。可见当时宫面已经传到了朝鲜。难怪人们常说：“藁城的宫面好做．眼(空心)难钻。”<br />&nbsp;&nbsp;&nbsp;&nbsp;爱新觉罗溥杰吃了宫面之后欣然提诗一首表达对宫面的赞美之情：<br /></div>', '', '', '');
INSERT INTO `js_product_description` VALUES ('76', '3', '马大哈鱼鱼片', '<table style=\"font-size:15px;\" cellspacing=\"0\" cellpadding=\"3\" width=\"740\">	<tbody>		<tr>			<td valign=\"top\" width=\"500\">				<table class=\"ke-zeroborder\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\" width=\"500\" height=\"100%\">					<tbody>						<tr>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\" height=\"36\" width=\"90\">								<img style=\"margin:0px;width:80px;float:none;height:30px;\" alt=\"\" src=\"http://img04.taobaocdn.com/imgextra/i4/249999786/T2z95kXolXXXXXXXXX_!!249999786.gif\" _ks_lazy_width=\"80\" _ks_lazy_height=\"30\" /> 							</td>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\" colspan=\"3\">								<strong style=\"color:#ff0000;\">马大哈鱼鱼片</strong> 							</td>						</tr>						<tr>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\" height=\"36\">								<img style=\"margin:0px;width:80px;float:none;height:30px;\" src=\"http://img02.taobaocdn.com/imgextra/i2/249999786/T2Wm5kXn0XXXXXXXXX_!!249999786.gif\" width=\"80\" height=\"30\" _ks_lazy_width=\"80\" _ks_lazy_height=\"30\" /> 							</td>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\">								红岛海鲜							</td>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\">								<img style=\"margin:0px;width:80px;float:none;height:30px;\" src=\"http://img01.taobaocdn.com/imgextra/i1/249999786/T2jS5kXoNXXXXXXXXX_!!249999786.gif\" width=\"80\" height=\"30\" _ks_lazy_width=\"80\" _ks_lazy_height=\"30\" /> 							</td>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\" align=\"left\">								山东							</td>						</tr>						<tr>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\" height=\"36\">								<img style=\"margin:0px;width:80px;float:none;height:30px;\" alt=\"\" src=\"http://img01.taobaocdn.com/imgextra/i1/249999786/T2PC5kXn4XXXXXXXXX_!!249999786.gif\" _ks_lazy_width=\"80\" _ks_lazy_height=\"30\" /> 							</td>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\">								128/斤							</td>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\">								<img style=\"margin:0px;width:80px;float:none;height:30px;\" src=\"http://img03.taobaocdn.com/imgextra/i3/249999786/T2nm9kXnhXXXXXXXXX_!!249999786.gif\" width=\"80\" height=\"30\" _ks_lazy_width=\"80\" _ks_lazy_height=\"30\" /> 							</td>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\" align=\"left\">								袋装&nbsp; 散装&nbsp; 箱装							</td>						</tr>						<tr>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\" height=\"36\">								<img style=\"margin:0px;width:80px;float:none;height:30px;\" src=\"http://img02.taobaocdn.com/imgextra/i2/249999786/T2F95kXodXXXXXXXXX_!!249999786.gif\" width=\"80\" height=\"30\" _ks_lazy_width=\"80\" _ks_lazy_height=\"30\" /> 							</td>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\">								散装零食							</td>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\">								<img style=\"margin:0px;width:80px;float:none;height:30px;\" src=\"http://img03.taobaocdn.com/imgextra/i3/249999786/T2r95kXoxXXXXXXXXX_!!249999786.gif\" width=\"80\" height=\"30\" _ks_lazy_width=\"80\" _ks_lazy_height=\"30\" /> 							</td>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\" align=\"left\">								微咸带甜，不辣							</td>						</tr>						<tr>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\" height=\"36\">								<img style=\"margin:0px;width:80px;float:none;height:30px;\" src=\"http://img04.taobaocdn.com/imgextra/i4/249999786/T25S5kXnNXXXXXXXXX_!!249999786.gif\" width=\"80\" height=\"30\" _ks_lazy_width=\"80\" _ks_lazy_height=\"30\" /> 							</td>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\">								8.5成							</td>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\">								<br />							</td>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\" align=\"left\">								<br />							</td>						</tr>						<tr>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\" height=\"36\">								<img style=\"margin:0px;width:80px;float:none;height:30px;\" src=\"http://img01.taobaocdn.com/imgextra/i1/249999786/T2ZC1kXXhaXXXXXXXX_!!249999786.gif\" width=\"80\" height=\"30\" _ks_lazy_width=\"80\" _ks_lazy_height=\"30\" /> 							</td>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\">								常温、冷藏							</td>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\">								<br />							</td>							<td style=\"border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;\" align=\"left\">								<br />							</td>						</tr>					</tbody>				</table>			</td>		</tr>	</tbody></table>', '', '', '');
INSERT INTO `js_product_description` VALUES ('77', '3', '女式裤子', '出口日本正品外贸女式裤子', '', '', '');
INSERT INTO `js_product_description` VALUES ('78', '3', '优卡丝四件套E', '<li title=\"&nbsp;四件套\">	床品套件:&nbsp;四件套</li><li title=\"&nbsp;NteLose尼特罗斯\">	货号:&nbsp;WJ0072A</li><li title=\"&nbsp;100022\">	面料材质:&nbsp;全棉</li><li title=\"&nbsp;一般全棉\">	全棉种类:&nbsp;全棉</li><li title=\"&nbsp;绗缝&nbsp;提花&nbsp;贡缎\">	床品工艺:&nbsp;绗缝&nbsp;提花&nbsp;贡</li><li title=\"&nbsp;绗缝&nbsp;提花&nbsp;贡缎\">	款式:&nbsp;床单式</li><li title=\"&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情\">	颜色分类:&nbsp;图片色</li><li title=\"&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情\">	产品等级:&nbsp;一等品</li><li title=\"&nbsp;欧美风\">	床品风格:&nbsp;欧美风</li><li title=\"&nbsp;符合相关国家标准\">	色牢度（级）:&nbsp;符合相关国家标准</li><li title=\"&nbsp;符合相关国家标准\">	缩水率（水洗尺寸变化）:&nbsp;符合相关国家标准</li><li title=\"&nbsp;欧式\">	家装风格:&nbsp;欧式</li><li title=\"&nbsp;活性印花\">	印花工艺:&nbsp;活性印花</li><li title=\"&nbsp;提花\">	织造工艺:&nbsp;提花</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('79', '3', '优卡丝四件套D', '<li title=\"&nbsp;四件套\">	床品套件:&nbsp;四件套</li><li title=\"&nbsp;NteLose尼特罗斯\">	货号:&nbsp;WJ0071A</li><li title=\"&nbsp;100022\">	面料材质:&nbsp;全棉</li><li title=\"&nbsp;一般全棉\">	全棉种类:&nbsp;全棉</li><li title=\"&nbsp;绗缝&nbsp;提花&nbsp;贡缎\">	床品工艺:&nbsp;绗缝&nbsp;提花&nbsp;贡缎</li><li title=\"&nbsp;床单式\">	款式:&nbsp;床单式</li><li title=\"&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情\">	颜色分类:&nbsp;图片色</li><li title=\"&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情\">	产品等级:&nbsp;一等品</li><li title=\"&nbsp;欧美风\">	床品风格:&nbsp;欧美风</li><li title=\"&nbsp;符合相关国家标准\">	色牢度（级）:&nbsp;符合相关国家标准</li><li title=\"&nbsp;符合相关国家标准\">	缩水率（水洗尺寸变化）:&nbsp;符合相关国家标准</li><li title=\"&nbsp;欧式\">	家装风格:&nbsp;欧式</li><li title=\"&nbsp;活性印花\">	印花工艺:&nbsp;活性印花</li><li title=\"&nbsp;提花\">	织造工艺:&nbsp;提花</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('80', '3', '优卡丝四件套C', '已售完，暂无货', '', '', '');
INSERT INTO `js_product_description` VALUES ('81', '3', '优卡丝四件套B', '暂无货', '', '', '');
INSERT INTO `js_product_description` VALUES ('82', '3', '优卡丝四件套A', '<p>	已售完，暂无货</p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('83', '3', '拉拉花园', '<li title=\"&nbsp;四件套\">	床品套件:&nbsp;四件套</li><li title=\"&nbsp;NteLose尼特罗斯\">	货号:&nbsp;WJ007A</li><li title=\"&nbsp;100022\">	面料材质:&nbsp;全棉</li><li title=\"&nbsp;一般全棉\">	全棉种类:&nbsp;全棉</li><li title=\"&nbsp;绗缝&nbsp;提花&nbsp;贡缎\">	床品工艺:&nbsp;绗缝&nbsp;提花&nbsp;贡缎</li><li title=\"&nbsp;床单式\">	款式:&nbsp;床单式</li><li title=\"&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情\">	颜色分类:&nbsp;图片色</li><li title=\"&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情\">	产品等级:&nbsp;一等品</li><li title=\"&nbsp;欧美风\">	床品风格:韩版</li><li title=\"&nbsp;欧美风\">	色牢度（级）:&nbsp;符合相关国家标准</li><li title=\"&nbsp;符合相关国家标准\">	缩水率（水洗尺寸变化）:&nbsp;符合相关国家标准</li><li title=\"&nbsp;活性印花\">	印花工艺:&nbsp;活性印花</li><li title=\"&nbsp;提花\">	织造工艺:&nbsp;提花</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('84', '3', '春色之约 ', '<li title=\"&nbsp;四件套\">	床品套件:&nbsp;四件套</li><li title=\"&nbsp;NteLose尼特罗斯\">	货号:&nbsp;WJ0078A</li><li title=\"&nbsp;100022\">	面料材质:&nbsp;全棉</li><li title=\"&nbsp;一般全棉\">	全棉种类:&nbsp;全棉</li><li title=\"&nbsp;绗缝&nbsp;提花&nbsp;贡缎\">	床品工艺:&nbsp;绗缝&nbsp;提花&nbsp;贡缎</li><li title=\"&nbsp;床单式\">	款式:&nbsp;床单式</li><li title=\"&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情\">	颜色分类:&nbsp;图片色</li><li title=\"&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情\">	产品等级:&nbsp;一等品</li><li title=\"&nbsp;欧美风\">	床品风格:韩版</li><li title=\"&nbsp;欧美风\">	色牢度（级）:&nbsp;符合相关国家标准</li><li title=\"&nbsp;符合相关国家标准\">	缩水率（水洗尺寸变化）:&nbsp;符合相关国家标准</li><li title=\"&nbsp;活性印花\">	印花工艺:&nbsp;活性印花</li><li title=\"&nbsp;提花\">	织造工艺:&nbsp;提花</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('85', '3', '午后红茶', '<li title=\"&nbsp;四件套\">	床品套件:&nbsp;四件套</li><li title=\"&nbsp;NteLose尼特罗斯\">	货号:&nbsp;WJ0075A</li><li title=\"&nbsp;100022\">	面料材质:&nbsp;全棉</li><li title=\"&nbsp;一般全棉\">	全棉种类:&nbsp;全棉</li><li title=\"&nbsp;绗缝&nbsp;提花&nbsp;贡缎\">	床品工艺:&nbsp;绗缝&nbsp;提花&nbsp;贡缎</li><li title=\"&nbsp;床单式\">	款式:&nbsp;床单式</li><li title=\"&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情\">	颜色分类:&nbsp;图片色</li><li title=\"&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情\">	产品等级:&nbsp;一等品</li><li title=\"&nbsp;欧美风\">	床品风格:韩版</li><li title=\"&nbsp;欧美风\">	色牢度（级）:&nbsp;符合相关国家标准</li><li title=\"&nbsp;符合相关国家标准\">	缩水率（水洗尺寸变化）:&nbsp;符合相关国家标准</li><li title=\"&nbsp;活性印花\">	印花工艺:&nbsp;活性印花</li><li title=\"&nbsp;提花\">	织造工艺:&nbsp;提花</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('86', '3', '浪漫满屋  ', '<li title=\"&nbsp;四件套\">	床品套件:&nbsp;四件套</li><li title=\"&nbsp;NteLose尼特罗斯\">	货号:&nbsp;WJ0076A</li><li title=\"&nbsp;100022\">	面料材质:&nbsp;全棉</li><li title=\"&nbsp;一般全棉\">	全棉种类:&nbsp;全棉</li><li title=\"&nbsp;绗缝&nbsp;提花&nbsp;贡缎\">	床品工艺:&nbsp;绗缝&nbsp;提花&nbsp;贡缎</li><li title=\"&nbsp;床单式\">	款式:&nbsp;床单式</li><li title=\"&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情\">	颜色分类:&nbsp;图片色</li><li title=\"&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情\">	产品等级:&nbsp;一等品</li><li title=\"&nbsp;欧美风\">	床品风格:韩版</li><li title=\"&nbsp;欧美风\">	色牢度（级）:&nbsp;符合相关国家标准</li><li title=\"&nbsp;符合相关国家标准\">	缩水率（水洗尺寸变化）:&nbsp;符合相关国家标准</li><li title=\"&nbsp;活性印花\">	印花工艺:&nbsp;活性印花</li><li title=\"&nbsp;提花\">	织造工艺:&nbsp;提花</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('87', '3', '美丽花房', '<li title=\"&nbsp;四件套\">	床品套件:&nbsp;四件套</li><li title=\"&nbsp;NteLose尼特罗斯\">	货号:&nbsp;WJ0077A</li><li title=\"&nbsp;100022\">	面料材质:&nbsp;全棉</li><li title=\"&nbsp;一般全棉\">	全棉种类:&nbsp;全棉</li><li title=\"&nbsp;绗缝&nbsp;提花&nbsp;贡缎\">	床品工艺:&nbsp;绗缝&nbsp;提花&nbsp;贡缎</li><li title=\"&nbsp;床单式\">	款式:&nbsp;床单式</li><li title=\"&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情\">	颜色分类:&nbsp;图片色</li><li title=\"&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情\">	产品等级:&nbsp;一等品</li><li title=\"&nbsp;欧美风\">	床品风格:韩版</li><li title=\"&nbsp;欧美风\">	色牢度（级）:&nbsp;符合相关国家标准</li><li title=\"&nbsp;符合相关国家标准\">	缩水率（水洗尺寸变化）:&nbsp;符合相关国家标准</li><li title=\"&nbsp;活性印花\">	印花工艺:&nbsp;活性印花</li><li title=\"&nbsp;提花\">	织造工艺:&nbsp;提花</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('88', '3', '冰清玉洁   50头', '<table style=\"width:100%;\" class=\"ke-zeroborder\" title=\"tbdescguide\" border=\"0\">	<tbody>		<tr>			<td>				<p style=\"text-align:center;\">					<span style=\"font-size:18px;\"><span style=\"color:#444444;\"><span style=\"font-size:18px;\"><strong><span style=\"font-size:18px;\">骨 质瓷是目前唯一世界上公认的高档瓷种，是权利和地位的象征，号称瓷器之王！骨质瓷制造工艺复杂，经过高温素烧和低温烧制而成的，欧洲标准上好的骨质瓷的骨 炭含量是40%以上，套装均价在几千元左右。其主要特点有瓷质细腻通透、器形美观典雅、瓷质轻薄、彩面润泽光亮。优质品用瓷勺敲打或手指轻弹，清脆响亮， 宛如洪钟。</span></strong></span></span></span> 				</p>				<p style=\"text-align:center;\">					<span style=\"font-size:18px;\"><span style=\"color:#444444;\"><span style=\"font-size:18px;\"><strong><span style=\"font-size:18px;\">骨质瓷一定要用手清洗，不可用洗碗机。有金边的餐具，勿放入微波炉，以免腐蚀。如有刮花，可以用牙膏略打磨。如有茶渍，可用柠檬汁或食醋清洗。不要用明火直接烧用！</span></strong></span></span></span> 				</p>			</td>		</tr>	</tbody></table><p>	&nbsp;</p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('89', '3', '贵凤', '40头<table style=\"width:100%;\" class=\"ke-zeroborder\" title=\"tbdescguide\" border=\"0\">	<tbody>		<tr>			<td>				<p style=\"text-align:center;\">					<span style=\"font-size:18px;\"><span style=\"color:#444444;\"><span style=\"font-size:18px;\"><strong><span style=\"font-size:18px;\">骨 质瓷是目前唯一世界上公认的高档瓷种，是权利和地位的象征，号称瓷器之王！骨质瓷制造工艺复杂，经过高温素烧和低温烧制而成的，欧洲标准上好的骨质瓷的骨 炭含量是40%以上，套装均价在几千元左右。其主要特点有瓷质细腻通透、器形美观典雅、瓷质轻薄、彩面润泽光亮。优质品用瓷勺敲打或手指轻弹，清脆响亮， 宛如洪钟。</span></strong></span></span></span> 				</p>				<p style=\"text-align:center;\">					<span style=\"font-size:18px;\"><span style=\"color:#444444;\"><span style=\"font-size:18px;\"><strong><span style=\"font-size:18px;\">骨质瓷一定要用手清洗，不可用洗碗机。有金边的餐具，勿放入微波炉，以免腐蚀。如有刮花，可以用牙膏略打磨。如有茶渍，可用柠檬汁或食醋清洗。不要用明火直接烧用！</span></strong></span></span></span> 				</p>			</td>		</tr>	</tbody></table>', '', '', '');
INSERT INTO `js_product_description` VALUES ('90', '3', '贻贝肉', '<span style=\"white-space:nowrap;\">贻贝肉80元一桶<br /><p>	<span style=\"text-indent:28pt;font-family:宋体;font-size:14pt;\"><span style=\"white-space:nowrap;\">贻</span>贝因</span><span style=\"text-indent:28pt;font-family:宋体;letter-spacing:0.45pt;color:black;font-size:13pt;\">肉质细腻、口味鲜美、营养价值高而享誉海内外。扇贝</span><span style=\"text-indent:28pt;font-family:宋体;font-size:14pt;\">含有丰富的蛋白质、铁和钙等人体必需的氨基酸和微量元素。是高蛋白、低脂肪、高钙质的天然保健品。</span></p><p style=\"text-indent:28pt;\">	<span style=\"font-size:14pt;\"></span></p><p>	<b style=\"line-height:1.5;text-indent:35.8pt;\"><span style=\"font-family:宋体;letter-spacing:0.4pt;color:black;font-size:14pt;\">产品特点：采用黄海优质扇</span></b><b style=\"line-height:1.5;text-indent:35.8pt;\"><span style=\"font-family:宋体;font-size:14pt;\">贝</span></b><b style=\"line-height:1.5;text-indent:35.8pt;\"><span style=\"font-family:宋体;letter-spacing:0.4pt;color:black;font-size:14pt;\">加工而成，鲜中带香，入口既溶，鲜味浓郁。</span></b></p><p>	<b style=\"line-height:1.5;text-indent:35.8pt;\"><span style=\"font-family:宋体;letter-spacing:0.4pt;color:black;font-size:14pt;\"></span></b><b><span style=\"font-family:宋体;font-size:14pt;\">食用方法：</span><span style=\"font-family:宋体;letter-spacing:0.4pt;color:black;font-size:14pt;\">开盖即食 &nbsp;&nbsp;</span></b><b style=\"line-height:1.5;\"><span style=\"font-family:宋体;letter-spacing:0.4pt;color:black;font-size:14pt;\">储存方法</span><span style=\"font-family:arial sans-serif;letter-spacing:0.4pt;color:black;font-size:14pt;\">:</span><span style=\"font-family:宋体;letter-spacing:0.4pt;color:black;font-size:14pt;\">常温保存</span></b></p></span>', '', '', '');
INSERT INTO `js_product_description` VALUES ('91', '3', '精品虾皮', '<h2 style=\"text-indent:8.85pt;background:white;margin-left:-3.8pt;\">	<span style=\"color:#444444;font-size:9pt;\">精品虾皮</span><span style=\"font-family:Tahoma;color:#444444;font-size:9pt;\">55</span><span style=\"color:#444444;font-size:9pt;\">元一桶</span><span style=\"font-family:Tahoma;color:#444444;font-size:9pt;\"></span> </h2>', '', '', '');
INSERT INTO `js_product_description` VALUES ('92', '3', '精品虾米', '<h2 style=\"text-indent:8.75pt;background:white;margin-left:-3.8pt;\">	<span style=\"color:#444444;font-size:9pt;\">精品虾米</span><span style=\"font-family:Tahoma;color:#444444;font-size:9pt;\">125</span><span style=\"color:#444444;font-size:9pt;\">元一桶</span><span style=\"font-family:Tahoma;color:#444444;font-size:9pt;\"></span> <img align=\"middle\" src=\"http://img.taobaocdn.com/imgextra/http://img03.taobaocdn.com/imgextra/i3/1677714540/T2AkUqXeRaXXXXXXXX_!!1677714540.jpg\" _ks_lazy_height=\"85\" _ks_lazy_width=\"85\" /></h2>', '', '', '');
INSERT INTO `js_product_description` VALUES ('93', '3', '精品扇贝柱', '<h2 style=\"margin-left:-3.8pt;text-indent:8.85pt;background:white;\">	<span style=\"font-size:9.0pt;color:#444444;\"><span style=\"white-space:nowrap;\">精品扇贝柱125元一桶</span></span><span style=\"font-size:9.0pt;color:#444444;\"></span><span style=\"font-size:9.0pt;font-family:Tahoma;color:#444444;\"></span> </h2>', '', '', '');
INSERT INTO `js_product_description` VALUES ('94', '3', '精品蛤蜊肉', '<h2 style=\"margin-left:-3.8pt;text-indent:8.85pt;background:white;\">	<span style=\"font-size:9.0pt;color:#444444;\">精品蛤蜊肉</span><span style=\"font-size:9.0pt;font-family:Tahoma;color:#444444;\">95</span><span style=\"font-size:9.0pt;color:#444444;\">元一桶</span><span style=\"font-size:9.0pt;font-family:Tahoma;color:#444444;\"></span></h2>', '', '', '');
INSERT INTO `js_product_description` VALUES ('95', '3', '海鲜大礼盒', '<span style=\"font-family:宋体;color:#444444;font-size:9pt;\">海鲜大礼盒</span><span style=\"font-family:Tahoma;color:#444444;font-size:9pt;\">758</span><span style=\"font-family:宋体;color:#444444;font-size:9pt;\">元一盒</span>', '', '', '');
INSERT INTO `js_product_description` VALUES ('96', '3', '野生海参', '<span style=\"font-size:9.0pt;font-family:宋体;\">野生海参</span><span style=\"font-size:9.0pt;font-family:;\" \"=\"\">4280</span><span style=\"font-size:9.0pt;font-family:宋体;\">元一斤</span>', '', '', '');
INSERT INTO `js_product_description` VALUES ('97', '3', 'XR0035P', '<div style=\"text-align:center;\">	<span style=\"font-family:宋体;font-size:14px;\">衣长</span><span style=\"font-size:14px;\">:</span><span style=\"font-family:Arial;font-size:14px;\"> </span><span style=\"font-family:宋体;font-size:14px;\">一袖长 </span> </div><div style=\"text-align:center;\">	<span style=\"font-family:宋体;font-size:14px;\">版型</span><span style=\"font-size:14px;\">:</span><span style=\"font-family:Arial;font-size:14px;\"> </span><span style=\"font-family:宋体;font-size:14px;\">修身型 </span> </div><div style=\"text-align:center;\">	<span style=\"font-family:宋体;font-size:14px;\">领型</span><span style=\"font-size:14px;\">:</span><span style=\"font-family:Arial;font-size:14px;\"> </span><span style=\"font-family:宋体;font-size:14px;\">立领 </span> </div><div style=\"text-align:center;\">	<span style=\"font-family:宋体;font-size:14px;\">门襟</span><span style=\"font-size:14px;\">:</span><span style=\"font-family:Arial;font-size:14px;\"> </span><span style=\"font-family:宋体;font-size:14px;\">拉链 </span> </div><div style=\"text-align:center;\">	<span style=\"font-family:宋体;font-size:14px;\">颜色</span><span style=\"font-size:14px;\">:</span><span style=\"font-family:Arial;font-size:14px;\"> </span><span style=\"font-family:宋体;font-size:14px;\">黑色<br /></span><span style=\"font-family:宋体;font-size:14px;\">皮衣材质</span><span style=\"font-size:14px;\">:</span><span style=\"font-size:24pt;\"> </span><span style=\"font-family:宋体;font-size:14px;\"><span style=\"text-align:center;white-space:normal;\">羊</span><span style=\"text-align:center;white-space:normal;\">皮</span></span> </div><div style=\"text-align:center;\">	<span style=\"font-family:宋体;font-size:14px;\">品牌</span><span style=\"font-size:14px;\">:</span><span style=\"font-family:Arial;font-size:14px;\"> </span><span style=\"font-family:宋体;font-size:14px;\">诺博万 </span> </div><div style=\"text-align:center;\">	<span style=\"font-family:宋体;font-size:14px;\">款式品名</span><span style=\"font-size:14px;\">:</span><span style=\"font-family:Arial;font-size:14px;\"> </span><span style=\"font-family:宋体;font-size:14px;\">皮衣 </span> </div><div style=\"text-align:center;\">	<span style=\"font-family:宋体;font-size:14px;\">下摆设计</span><span style=\"font-size:14px;\">:</span><span style=\"font-family:Arial;font-size:14px;\"> </span><span style=\"font-family:宋体;font-size:14px;\">本布下摆（针对拉链门襟） </span> </div><div style=\"text-align:center;\">	<span style=\"font-family:宋体;font-size:14px;\">基础风格</span><span style=\"font-size:14px;\">:</span><span style=\"font-family:Arial;font-size:14px;\"> </span><span style=\"font-family:宋体;font-size:14px;\">青春流行 </span> </div><div style=\"text-align:center;\">	<span style=\"font-family:宋体;font-size:14px;\"> 颜色：深棕色</span> </div><div></div>', '', '', '');
INSERT INTO `js_product_description` VALUES ('98', '3', 'XR0033P', '<span style=\"white-space:nowrap;\">此款衣服外纯羊皮内有进口貂皮</span>', '此款衣服外纯羊皮内有进口貂皮', '', '');
INSERT INTO `js_product_description` VALUES ('99', '3', 'XR0032P', '<div>	<div style=\"text-align:left;\">		此款衣服内有纯进口貂皮领子也是貂绒的外皮是羊皮	</div>	<div>	</div></div>', '此款衣服内有纯进口貂皮领子也是貂绒的外皮是羊皮', '', '');
INSERT INTO `js_product_description` VALUES ('100', '3', 'XR0031P', '<div>	<div style=\"text-align:center;\">		<span style=\"font-family:宋体;font-size:14px;\">货号</span><span style=\"font-size:14px;\">:XR0031P </span> 	</div>	<div style=\"text-align:center;\">		<span style=\"font-family:宋体;font-size:14px;\">板型</span><span style=\"font-size:14px;\">:</span><span style=\"font-family:Arial;font-size:14px;\"> </span><span style=\"font-family:宋体;font-size:14px;\">修身型 </span> 	</div>	<div style=\"text-align:center;\">		<span style=\"font-family:宋体;font-size:14px;\">风格</span><span style=\"font-size:14px;\">:</span><span style=\"font-family:Arial;font-size:14px;\"> </span><span style=\"font-family:宋体;font-size:14px;\">通勤 </span> 	</div>	<div style=\"text-align:center;\">		<span style=\"font-family:宋体;font-size:14px;\">通勤</span><span style=\"font-size:14px;\">:</span><span style=\"font-family:Arial;font-size:14px;\"> </span><span style=\"font-family:宋体;font-size:14px;\">韩版 </span> 	</div>	<div style=\"text-align:center;\">		<span style=\"font-family:宋体;font-size:14px;\">款式</span><span style=\"font-size:14px;\">:</span><span style=\"font-family:Arial;font-size:14px;\"> </span><span style=\"font-family:宋体;font-size:14px;\">常规款 </span> 	</div>	<div style=\"text-align:center;\">		<span style=\"font-family:宋体;font-size:14px;\">袖长</span><span style=\"font-size:14px;\">:</span><span style=\"font-family:Arial;font-size:14px;\"> </span><span style=\"font-family:宋体;font-size:14px;\">长袖 </span> 	</div>	<div style=\"text-align:center;\">		<span style=\"font-family:宋体;font-size:14px;\">领型</span><span style=\"font-size:14px;\">:</span><span style=\"font-family:Arial;font-size:14px;\"> </span><span style=\"font-family:宋体;font-size:14px;\">立领 </span> 	</div>	<div style=\"text-align:center;\">		<span style=\"font-family:宋体;font-size:14px;\">袖型</span><span style=\"font-size:14px;\">:</span><span style=\"font-family:Arial;font-size:14px;\"> </span><span style=\"font-family:宋体;font-size:14px;\">常规袖 </span> 	</div>	<div style=\"text-align:center;\">		<span style=\"font-family:宋体;font-size:14px;\">衣门襟</span><span style=\"font-size:14px;\">:</span><span style=\"font-family:Arial;font-size:14px;\"> </span><span style=\"font-family:宋体;font-size:14px;\">拉链 </span> 	</div>	<div style=\"text-align:center;\">		<span style=\"font-family:宋体;font-size:14px;\">皮质</span><span style=\"font-size:14px;\">:</span><span style=\"font-family:Arial;font-size:14px;\"> </span><span style=\"font-size:14px;\"><span style=\"text-align:center;white-space:normal;\">羊</span><span style=\"text-align:center;white-space:normal;\">皮</span></span><span style=\"font-family:宋体;font-size:14px;\"> </span> 	</div>	<div style=\"text-align:center;\">		<span style=\"font-family:宋体;font-size:14px;\">流行元素</span><span style=\"font-size:14px;\">/</span><span style=\"font-family:宋体;font-size:14px;\">工艺</span><span style=\"font-size:14px;\">:</span><span style=\"font-family:Arial;font-size:14px;\"> </span><span style=\"font-family:宋体;font-size:14px;\">拉链</span><span style=\"font-family:Arial;font-size:14px;\"> </span><span style=\"font-family:宋体;font-size:20pt;\"> </span> 	</div>	<div style=\"text-align:center;\">		<span style=\"font-family:宋体;font-size:14px;\">颜色分类</span><span style=\"font-size:14px;\">:</span><span style=\"font-family:Arial;font-size:14px;\"> </span><span style=\"font-family:宋体;font-size:14px;\">黑色</span> 	</div></div>', '', '', '');
INSERT INTO `js_product_description` VALUES ('101', '3', 'XR0030P', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('102', '3', 'XR0029P', '<div>	<div style=\"text-align:center;\">		主图来源:&nbsp;自主实拍图	</div>	<div style=\"text-align:center;\">		货号:XR0031P	</div>	<div style=\"text-align:center;\">		板型:&nbsp;修身型	</div>	<div style=\"text-align:center;\">		风格:&nbsp;通勤	</div>	<div style=\"text-align:center;\">		通勤:&nbsp;韩版	</div>	<div style=\"text-align:center;\">		款式:&nbsp;常规款	</div>	<div style=\"text-align:center;\">		袖长:&nbsp;长袖	</div>	<div style=\"text-align:center;\">		领型:&nbsp;立领	</div>	<div style=\"text-align:center;\">		袖型:&nbsp;常规袖	</div>	<div style=\"text-align:center;\">		皮质:&nbsp;<span style=\"text-align:center;white-space:normal;\">羊</span><span style=\"text-align:center;white-space:normal;\">皮</span>	</div>	<div style=\"text-align:center;\">		流行元素/工艺:&nbsp;纽扣	</div>	<div style=\"text-align:center;\">		颜色分类:&nbsp;图片色	</div></div>', '', '', '');
INSERT INTO `js_product_description` VALUES ('103', '3', 'XR0028P', '<div>	<div style=\"text-align:center;\">		主图来源:&nbsp;自主实拍图	</div>	<div style=\"text-align:center;\">		货号:XR0031P	</div>	<div style=\"text-align:center;\">		风格:&nbsp;通勤	</div>	<div style=\"text-align:center;\">		通勤:&nbsp;韩版	</div>	<div style=\"text-align:center;\">		款式:&nbsp;常规款	</div>	<div style=\"text-align:center;\">		袖长:&nbsp;长袖	</div>	<div style=\"text-align:center;\">		领型:&nbsp;带帽	</div>	<div style=\"text-align:center;\">		袖型:&nbsp;常规袖	</div>	<div style=\"text-align:center;\">		皮质:&nbsp;羊皮	</div>	<div style=\"text-align:center;\">		流行元素/工艺:&nbsp;纽扣	</div>	<div style=\"text-align:center;\">		颜色分类:&nbsp;图片色	</div></div>', '', '', '');
INSERT INTO `js_product_description` VALUES ('378', '1', '玉镯A0001', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('377', '1', '玉镯A0005', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('376', '1', '玉镯A0006', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('375', '1', '玉镯A0007', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('374', '1', '玉镯A0009', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('373', '1', '玉镯A0010', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('372', '1', '玉镯A0011', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('371', '1', '玉镯A0012', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('370', '1', '玉镯A0013', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('369', '1', '玉镯A0015', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('368', '1', '玉镯A0016', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('367', '1', '玉镯A0018', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('366', '1', '玉镯A0019', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('365', '1', '玉镯A0020', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('364', '1', '玉镯A0021', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('363', '1', '玉镯A0022', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('362', '1', '玉镯A0023', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('361', '1', '玉镯A0026', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('360', '1', '玉镯A0031', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('359', '1', '一叶发财A1025', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('358', '1', '一叶发财A1026', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('357', '1', '一叶发财A1027', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('356', '1', '一叶发财A1028', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('104', '3', 'XR0027P', '<div>	<div style=\"text-align:center;\">		主图来源:&nbsp;自主实拍图	</div>	<div style=\"text-align:center;\">		货号:&nbsp;XR0027P	</div>	<div style=\"text-align:center;\">		风格:&nbsp;街头	</div>	<div style=\"text-align:center;\">		款式:&nbsp;短款	</div>	<div style=\"text-align:center;\">		袖长:&nbsp;长袖	</div>	<div style=\"text-align:center;\">		领型:&nbsp;连帽/帽领	</div>	<div style=\"text-align:center;\">		袖型:&nbsp;其他袖型	</div>	<div style=\"text-align:center;\">		衣门襟:&nbsp;拉链	</div>	<div style=\"text-align:center;\">		皮质:&nbsp;羊皮	</div>	<div style=\"text-align:center;\">		流行元素/工艺:&nbsp;拉链&nbsp;	</div>	<div style=\"text-align:center;\">		&nbsp;口袋	</div>	<div style=\"text-align:center;\">		品牌:&nbsp;潮流街头	</div>	<div style=\"text-align:center;\">		颜色分类:&nbsp;&nbsp;深棕色	</div>	<div>	</div></div>', '', '', '');
INSERT INTO `js_product_description` VALUES ('355', '1', '水晶吊坠D1003', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('354', '1', '水晶吊坠D1005', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('353', '1', '水晶吊坠D1007', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('352', '1', '水晶吊坠D1008', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('351', '1', '水晶吊坠D1009', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('350', '1', '水晶吊坠D1011', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('349', '1', '水晶吊坠D1012', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('348', '1', '水晶吊坠D1015', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('347', '1', '水晶吊坠D1016', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('346', '1', '水晶吊坠D1017', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('345', '1', '水晶吊坠D1018', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('344', '1', '水晶吊坠D1019', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('343', '1', '手链石榴石L0019', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('342', '1', '手链紫水晶L0020', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('341', '1', '手链石榴石L0021', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('340', '1', '玛瑙把玩W101', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('339', '1', '玛瑙把玩W102', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('338', '1', '玛瑙把玩W103', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('337', '1', '玛瑙把玩W105', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('336', '1', '玛瑙把玩W107', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('335', '1', '水晶手链L0011', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('334', '1', '水晶手链L0012', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('333', '1', '水晶手链L0015', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('332', '1', '水晶手链L0016', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('331', '1', '水晶手链L0017', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('330', '1', '水晶手链L0018', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('329', '1', '翡翠吊坠C0001', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('328', '1', '翡翠吊坠C0002', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('327', '1', '翡翠吊坠C0005', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('326', '1', '黑曜石XR0103', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('325', '1', '翡翠项链XR0105', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('324', '1', '玉佛A1001', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('323', '1', '玉佛A1002', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('322', '1', '玉佛A1005', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('321', '1', '玉佛A1006', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('320', '1', '玉佛A1007', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('319', '1', '玉佛A1008', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('318', '1', '玉佛A1009', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('317', '1', '玉佛A1010', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('316', '1', '玉佛A1012', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('315', '1', '玉佛A1013', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('314', '1', '玉佛A1015', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('313', '1', '玉佛A1016', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('105', '3', 'XR0026P', '<div>	<div style=\"text-align:center;\">		主图来源:&nbsp;自主实拍图	</div>	<div style=\"text-align:center;\">		货号:&nbsp;XR0026P	</div>	<div style=\"text-align:center;\">		风格:&nbsp;街头	</div>	<div style=\"text-align:center;\">		款式:&nbsp;短款	</div>	<div style=\"text-align:center;\">		袖长:&nbsp;长袖	</div>	<div style=\"text-align:center;\">		领型:&nbsp;连帽/帽领	</div>	<div style=\"text-align:center;\">		袖型:&nbsp;其他袖型	</div>	<div style=\"text-align:center;\">		衣门襟:&nbsp;拉链	</div>	<div style=\"text-align:center;\">		皮质:&nbsp;羊皮	</div>	<div style=\"text-align:center;\">		流行元素/工艺:&nbsp;拉链&nbsp;	</div>	<div style=\"text-align:center;\">		&nbsp;口袋	</div>	<div style=\"text-align:center;\">		品牌:&nbsp;潮流街头	</div>	<div style=\"text-align:center;\">		颜色分类:&nbsp;&nbsp;深棕色	</div>	<div>	</div></div>', '', '', '');
INSERT INTO `js_product_description` VALUES ('312', '1', '玉佛A1017', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('311', '1', '玉佛A1018', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('310', '1', '玉佛A1019', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('309', '1', '玉佛A1021', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('308', '1', '维多利亚', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('303', '1', '清雅名媛   50头', '&lt;table style=&quot;width:100%;&quot; class=&quot;ke-zeroborder&quot; title=&quot;tbdescguide&quot; border=&quot;0&quot;&gt;	&lt;tbody&gt;		&lt;tr&gt;			&lt;td&gt;				&lt;p style=&quot;text-align:center;&quot;&gt;					&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:#444444;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;骨 质瓷是目前唯一世界上公认的高档瓷种，是权利和地位的象征，号称瓷器之王！骨质瓷制造工艺复杂，经过高温素烧和低温烧制而成的，欧洲标准上好的骨质瓷的骨 炭含量是40%以上，套装均价在几千元左右。其主要特点有瓷质细腻通透、器形美观典雅、瓷质轻薄、彩面润泽光亮。优质品用瓷勺敲打或手指轻弹，清脆响亮， 宛如洪钟。&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt; 				&lt;/p&gt;				&lt;p style=&quot;text-align:center;&quot;&gt;					&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:#444444;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;骨质瓷一定要用手清洗，不可用洗碗机。有金边的餐具，勿放入微波炉，以免腐蚀。如有刮花，可以用牙膏略打磨。如有茶渍，可用柠檬汁或食醋清洗。不要用明火直接烧用！&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt; 				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;	&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;	&nbsp;&lt;/p&gt;&lt;p&gt;	&nbsp;&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('106', '3', 'XR0025P', '<div>	<div style=\"text-align:center;\">		主图来源:&nbsp;自主实拍图	</div>	<div style=\"text-align:center;\">		货号:&nbsp;XR0025P	</div>	<div style=\"text-align:center;\">		板型:&nbsp;修身型	</div>	<div style=\"text-align:center;\">		风格:&nbsp;通勤	</div>	<div style=\"text-align:center;\">		通勤:&nbsp;韩版	</div>	<div style=\"text-align:center;\">		款式:&nbsp;常规款	</div>	<div style=\"text-align:center;\">		袖长:&nbsp;长袖	</div>	<div style=\"text-align:center;\">		领型:&nbsp;圆领	</div>	<div style=\"text-align:center;\">		袖型:&nbsp;常规袖	</div>	<div style=\"text-align:center;\">		衣门襟:&nbsp;拉链	</div>	<div style=\"text-align:center;\">		皮质:&nbsp;羊皮	</div>	<div style=\"text-align:center;\">		流行元素/工艺:&nbsp;拉链&nbsp;&nbsp;高温定型&nbsp;口袋&nbsp;拼贴/拼接&nbsp;不对称	</div>	<div style=\"text-align:center;\">		颜色分类:&nbsp;&nbsp;图片色	</div></div>', '', '', '');
INSERT INTO `js_product_description` VALUES ('304', '1', '粉红花', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('305', '1', '金芙蓉', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('306', '1', '头桎梏', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('307', '1', '银牛花   WJ002', '&lt;table style=&quot;width:100%;&quot; class=&quot;ke-zeroborder&quot; title=&quot;tbdescguide&quot; border=&quot;0&quot;&gt;	&lt;tbody&gt;		&lt;tr&gt;			&lt;td&gt;				&lt;p style=&quot;text-align:center;&quot;&gt;					&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:#444444;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;骨 质瓷是目前唯一世界上公认的高档瓷种，是权利和地位的象征，号称瓷器之王！骨质瓷制造工艺复杂，经过高温素烧和低温烧制而成的，欧洲标准上好的骨质瓷的骨 炭含量是40%以上，套装均价在几千元左右。其主要特点有瓷质细腻通透、器形美观典雅、瓷质轻薄、彩面润泽光亮。优质品用瓷勺敲打或手指轻弹，清脆响亮， 宛如洪钟。&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt; 				&lt;/p&gt;				&lt;p style=&quot;text-align:center;&quot;&gt;					&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:#444444;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;骨质瓷一定要用手清洗，不可用洗碗机。有金边的餐具，勿放入微波炉，以免腐蚀。如有刮花，可以用牙膏略打磨。如有茶渍，可用柠檬汁或食醋清洗。不要用明火直接烧用！&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt; 				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;	&lt;/tbody&gt;&lt;/table&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('107', '3', 'XR0023P', '<div>	<div style=\"text-align:center;\">		主图来源:&nbsp;自主实拍图	</div>	<div style=\"text-align:center;\">		货号:&nbsp;XR0023P	</div>	<div style=\"text-align:center;\">		板型:&nbsp;修身型	</div>	<div style=\"text-align:center;\">		风格:&nbsp;通勤	</div>	<div style=\"text-align:center;\">		通勤:&nbsp;韩版	</div>	<div style=\"text-align:center;\">		款式:&nbsp;常规款	</div>	<div style=\"text-align:center;\">		袖长:&nbsp;长袖	</div>	<div style=\"text-align:center;\">		领型:&nbsp;圆领	</div>	<div style=\"text-align:center;\">		袖型:&nbsp;常规袖	</div>	<div style=\"text-align:center;\">		衣门襟:&nbsp;纽扣	</div>	<div style=\"text-align:center;\">		皮质:&nbsp;羊皮	</div>	<div style=\"text-align:center;\">		流行元素/工艺:&nbsp;拉链&nbsp;&nbsp;高温定型&nbsp;口袋&nbsp;拼贴/拼接&nbsp;	</div>	<div style=\"text-align:center;\">		颜色分类:&nbsp;&nbsp;图片色	</div></div>', '', '', '');
INSERT INTO `js_product_description` VALUES ('299', '1', '木棉花', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('300', '1', '小木盒茶具', '&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的&ldquo;益茶&rdquo;。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【陶瓷茶具常保养】：&lt;br /&gt;1、可用洗碗机要选择有&ldquo;瓷器及水晶类&rdquo;洗涤功能的洗碗机。&lt;br /&gt;2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。&lt;br /&gt;3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。&lt;br /&gt;4、如果有茶渍，可用柠檬汁或食醋清洗。&lt;/span&gt;&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('108', '3', 'XR0022P', '<span style=\"white-space:nowrap;\">主图来源: 自主实拍图</span><br /><span style=\"white-space:nowrap;\">货号: XR0022P</span><br /><span style=\"white-space:nowrap;\">板型: 修身型</span><br /><span style=\"white-space:nowrap;\">风格: 通勤</span><br /><span style=\"white-space:nowrap;\">通勤: 韩版</span><br /><span style=\"white-space:nowrap;\">款式: 常规款</span><br /><span style=\"white-space:nowrap;\">袖长: 长袖</span><br /><span style=\"white-space:nowrap;\">领型: 圆领</span><br /><span style=\"white-space:nowrap;\">袖型: 常规袖</span><br /><span style=\"white-space:nowrap;\">衣门襟: 拉链</span><br /><span style=\"white-space:nowrap;\">皮质: 羊皮</span><br /><span style=\"white-space:nowrap;\">流行元素/工艺: 拉链 &nbsp;高温定型 口袋 拼贴/拼接 </span><br /><span style=\"white-space:nowrap;\">颜色分类: &nbsp;黑色</span><br />', '', '', '');
INSERT INTO `js_product_description` VALUES ('301', '1', '心方缘', '&lt;table style=&quot;width:100%;&quot; class=&quot;ke-zeroborder&quot; title=&quot;tbdescguide&quot; border=&quot;0&quot;&gt;	&lt;tbody&gt;		&lt;tr&gt;			&lt;td&gt;				&lt;p style=&quot;text-align:center;&quot;&gt;					&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:#444444;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;46头&nbsp;&nbsp; 骨 质瓷是目前唯一世界上公认的高档瓷种，是权利和地位的象征，号称瓷器之王！骨质瓷制造工艺复杂，经过高温素烧和低温烧制而成的，欧洲标准上好的骨质瓷的骨 炭含量是40%以上，套装均价在几千元左右。其主要特点有瓷质细腻通透、器形美观典雅、瓷质轻薄、彩面润泽光亮。优质品用瓷勺敲打或手指轻弹，清脆响亮， 宛如洪钟。&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt; 				&lt;/p&gt;				&lt;p style=&quot;text-align:center;&quot;&gt;					&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:#444444;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;骨质瓷一定要用手清洗，不可用洗碗机。有金边的餐具，勿放入微波炉，以免腐蚀。如有刮花，可以用牙膏略打磨。如有茶渍，可用柠檬汁或食醋清洗。不要用明火直接烧用！&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt; 				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;	&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;	&nbsp;&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('109', '3', 'XR0021P', '<span style=\"white-space:nowrap;\">主图来源: 自主实拍图</span><br /><span style=\"white-space:nowrap;\">货号: XR0021P</span><br /><span style=\"white-space:nowrap;\">板型: 修身型</span><br /><span style=\"white-space:nowrap;\">风格: 通勤</span><br /><span style=\"white-space:nowrap;\">通勤: 韩版</span><br /><span style=\"white-space:nowrap;\">款式: 常规款</span><br /><span style=\"white-space:nowrap;\">袖长: 长袖</span><br /><span style=\"white-space:nowrap;\">领型: 圆领</span><br /><span style=\"white-space:nowrap;\">袖型: 常规袖</span><br /><span style=\"white-space:nowrap;\">衣门襟: 纽扣 拉链</span><br /><span style=\"white-space:nowrap;\">皮质: 羊皮</span><br /><span style=\"white-space:nowrap;\">流行元素/工艺: 拉链 &nbsp;高温定型 口袋 拼贴/拼接&nbsp;</span><br /><span style=\"white-space:nowrap;\">颜色分类: &nbsp;图片色</span><br />', '', '', '');
INSERT INTO `js_product_description` VALUES ('302', '1', '金粉世家', '&lt;table style=&quot;width:100%;&quot; class=&quot;ke-zeroborder&quot; title=&quot;tbdescguide&quot; border=&quot;0&quot;&gt;	&lt;tbody&gt;		&lt;tr&gt;			&lt;td&gt;				&lt;p style=&quot;text-align:center;&quot;&gt;					&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:#444444;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;46头&nbsp;&nbsp; 骨 质瓷是目前唯一世界上公认的高档瓷种，是权利和地位的象征，号称瓷器之王！骨质瓷制造工艺复杂，经过高温素烧和低温烧制而成的，欧洲标准上好的骨质瓷的骨 炭含量是40%以上，套装均价在几千元左右。其主要特点有瓷质细腻通透、器形美观典雅、瓷质轻薄、彩面润泽光亮。优质品用瓷勺敲打或手指轻弹，清脆响亮， 宛如洪钟。&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt; 				&lt;/p&gt;				&lt;p style=&quot;text-align:center;&quot;&gt;					&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:#444444;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;骨质瓷一定要用手清洗，不可用洗碗机。有金边的餐具，勿放入微波炉，以免腐蚀。如有刮花，可以用牙膏略打磨。如有茶渍，可用柠檬汁或食醋清洗。不要用明火直接烧用！&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt; 				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;	&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;	&nbsp;&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('110', '3', 'XR0020P', '<span style=\"white-space:nowrap;\">主图来源: 自主实拍图</span><br /><span style=\"white-space:nowrap;\">货号: XR0020P</span><br /><span style=\"white-space:nowrap;\">板型: 修身型</span><br /><span style=\"white-space:nowrap;\">风格: 通勤</span><br /><span style=\"white-space:nowrap;\">通勤: 韩版</span><br /><span style=\"white-space:nowrap;\">款式: 常规款</span><br /><span style=\"white-space:nowrap;\">袖长: 长袖</span><br /><span style=\"white-space:nowrap;\">领型: 圆领</span><br /><span style=\"white-space:nowrap;\">袖型: 常规袖</span><br /><span style=\"white-space:nowrap;\">衣门襟: 拉链</span><br /><span style=\"white-space:nowrap;\">皮质: 羊皮</span><br /><span style=\"white-space:nowrap;\">流行元素/工艺: 拉链 &nbsp;高温定型 口袋 拼贴/拼接&nbsp;</span><br /><span style=\"white-space:nowrap;\">颜色分类: &nbsp;图片色</span><br />', '', '', '');
INSERT INTO `js_product_description` VALUES ('285', '1', '青花展示盒', '&lt;li title=&quot;&nbsp;ZSH-06&quot;&gt;	货号:WJ0025&lt;/li&gt;&lt;li title=&quot;&nbsp;德化&quot;&gt;	茶具产地:&nbsp;景德镇&lt;/li&gt;&lt;li title=&quot;&nbsp;陶瓷&quot;&gt;	材质:&nbsp;陶瓷&lt;/li&gt;&lt;li title=&quot;&nbsp;青花&quot;&gt;	工艺:&nbsp;青花&lt;/li&gt;&lt;li title=&quot;&nbsp;否&quot;&gt;	配茶盘:&nbsp;否&lt;/li&gt;&lt;li title=&quot;&nbsp;其他分销图&quot;&gt;	主图来源:&nbsp;自主拍摄&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('286', '1', '竹子彩画', '&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的&ldquo;益茶&rdquo;。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【陶瓷茶具常保养】：&lt;br /&gt;1、可用洗碗机要选择有&ldquo;瓷器及水晶类&rdquo;洗涤功能的洗碗机。&lt;br /&gt;2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。&lt;br /&gt;3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。&lt;br /&gt;4、如果有茶渍，可用柠檬汁或食醋清洗。&lt;/span&gt;&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('111', '3', 'XR0019P', '<span style=\"white-space:nowrap;\">主图来源: 自主实拍图</span><br /><span style=\"white-space:nowrap;\">品牌: 诺博万</span><br /><span style=\"white-space:nowrap;\">货号: XR0019P</span><br /><span style=\"white-space:nowrap;\">风格: 通勤</span><br /><span style=\"white-space:nowrap;\">衣长: 长款(80cm&lt;衣长≤100cm)</span><br /><span style=\"white-space:nowrap;\">袖长: 长袖</span><br /><span style=\"white-space:nowrap;\">领型: 毛领袖型: 常规袖</span><br /><span style=\"white-space:nowrap;\">面料材质: 貂毛</span><br /><span style=\"white-space:nowrap;\">流行元素/工艺: 口袋 毛领</span><br /><span style=\"white-space:nowrap;\">年份/季节: 2013冬季</span><br /><span style=\"white-space:nowrap;\">颜色分类: 黑色</span><br /><div style=\"white-space:nowrap;\">	<br /></div>', '', '', '');
INSERT INTO `js_product_description` VALUES ('298', '1', '红色腾', '&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的&ldquo;益茶&rdquo;。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【陶瓷茶具常保养】：&lt;br /&gt;1、可用洗碗机要选择有&ldquo;瓷器及水晶类&rdquo;洗涤功能的洗碗机。&lt;br /&gt;2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。&lt;br /&gt;3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。&lt;br /&gt;4、如果有茶渍，可用柠檬汁或食醋清洗。&lt;/span&gt;&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('112', '3', 'XR0018P', '<span style=\"white-space:nowrap;\">主图来源: 自主实拍图</span><br /><span style=\"white-space:nowrap;\">品牌: 诺博万</span><br /><span style=\"white-space:nowrap;\">货号: XR0018P</span><br /><span style=\"white-space:nowrap;\">风格: 通勤</span><br /><span style=\"white-space:nowrap;\">衣长: 长款</span><br /><span style=\"white-space:nowrap;\">袖长: 长袖</span><br /><span style=\"white-space:nowrap;\">领型: 毛领</span><br /><span style=\"white-space:nowrap;\">袖型: 常规袖</span><br /><span style=\"white-space:nowrap;\">面料材质: 貂毛</span><br /><span style=\"white-space:nowrap;\">流行元素/工艺: 口袋 毛领</span><br /><span style=\"white-space:nowrap;\">年份/季节: 2013冬季</span><br /><span style=\"white-space:nowrap;\">颜色分类: 黑色</span><br />', '', '', '');
INSERT INTO `js_product_description` VALUES ('113', '3', 'XR0017P', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('114', '3', 'XR0016P', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('115', '3', 'XR0015P', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('116', '3', 'XR0013P', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('294', '1', '亚光山水', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('295', '1', '荷花雪花釉', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('296', '1', '贤人指福', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('297', '1', '小七件紫纱', '&lt;li title=&quot;&nbsp;TZ-0422&quot;&gt;	货号:&nbsp;WJ0002&lt;/li&gt;&lt;li title=&quot;&nbsp;宜兴&quot;&gt;	茶具产地:&nbsp;景德镇&lt;/li&gt;&lt;li title=&quot;&nbsp;紫砂&quot;&gt;	材质:&nbsp;紫砂&lt;/li&gt;&lt;li title=&quot;&nbsp;6人&quot;&gt;	推荐使用人数:&nbsp;6人&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('288', '1', '简易青花', '&lt;li title=&quot;&nbsp;ZSH-06&quot;&gt;	货号:WJ0021&lt;/li&gt;&lt;li title=&quot;&nbsp;德化&quot;&gt;	茶具产地:&nbsp;景德镇&lt;/li&gt;&lt;li title=&quot;&nbsp;陶瓷&quot;&gt;	材质:&nbsp;陶瓷&lt;/li&gt;&lt;li title=&quot;&nbsp;青花&quot;&gt;	工艺:&nbsp;青花&lt;/li&gt;&lt;li title=&quot;&nbsp;否&quot;&gt;	配茶盘:&nbsp;否&lt;/li&gt;&lt;li title=&quot;&nbsp;其他分销图&quot;&gt;	主图来源:&nbsp;自主拍摄&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('289', '1', '邑窑', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('290', '1', '新玲珑', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('291', '1', '冰裂瓷茶具', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('292', '1', '青色茶叶罐', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('293', '1', '普通茶道', '&lt;li title=&quot;&nbsp;TZ-0422&quot;&gt;	货号:&nbsp;WJ0013&lt;/li&gt;&lt;li title=&quot;&nbsp;宜兴&quot;&gt;	茶具产地:&nbsp;景德镇&lt;/li&gt;&lt;li title=&quot;&nbsp;紫砂&quot;&gt;	材质:&nbsp;紫砂&lt;/li&gt;&lt;li title=&quot;&nbsp;6人&quot;&gt;	推荐使用人数:&nbsp;6人&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('117', '3', 'XR0012P', '<span style=\"white-space:nowrap;\">主图来源: 自主实拍图</span><br /><span style=\"white-space:nowrap;\">品牌: 诺博万</span><br /><span style=\"white-space:nowrap;\">货号: XR0016P</span><br /><span style=\"white-space:nowrap;\">风格: 通勤</span><br /><span style=\"white-space:nowrap;\">衣长: 长款</span><br /><span style=\"white-space:nowrap;\">袖长: 长袖</span><br /><span style=\"white-space:nowrap;\">领型: 毛领</span><br /><span style=\"white-space:nowrap;\">袖型: 常规袖</span><br /><span style=\"white-space:nowrap;\">面料材质: 貂毛</span><br /><span style=\"white-space:nowrap;\">流行元素/工艺: 口袋 毛领</span><br /><span style=\"white-space:nowrap;\">年份/季节: 2013冬季</span><br /><span style=\"white-space:nowrap;\">颜色分类: 豹纹</span><br />', '', '', '');
INSERT INTO `js_product_description` VALUES ('278', '1', '亚光茶叶罐', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('279', '1', '招财进宝茶叶罐', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('280', '1', '亚光茶叶罐纯色', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('281', '1', '汝窑', '&lt;li title=&quot;&nbsp;xlhbz&quot;&gt;	货号:&nbsp;WJ0029&lt;/li&gt;&lt;li title=&quot;&nbsp;汝窑&quot;&gt;	茶具产地:&nbsp;汝窑&lt;/li&gt;&lt;li title=&quot;&nbsp;5人&quot;&gt;	推荐使用人数:&nbsp;6人&lt;/li&gt;&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	主图来源:&nbsp;自主实拍图&lt;/li&gt;汝窑，釉中含有玛瑙，色泽青翠华滋，釉汁肥润莹亮，被历代称颂，有&ldquo;宋瓷之冠&rdquo;美誉，又与同期官窑、哥窑、钧窑、定窑合称&ldquo;宋代五大名窑&rdquo;。&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('282', '1', '景德镇', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('283', '1', '秀色荷花', '&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的&ldquo;益茶&rdquo;。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【陶瓷茶具常保养】：&lt;br /&gt;1、可用洗碗机要选择有&ldquo;瓷器及水晶类&rdquo;洗涤功能的洗碗机。&lt;br /&gt;2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。&lt;br /&gt;3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。&lt;br /&gt;4、如果有茶渍，可用柠檬汁或食醋清洗。&lt;/span&gt;&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('118', '3', 'XR0011P', '<span style=\"white-space:nowrap;\">主图来源: 自主实拍图</span><br /><span style=\"white-space:nowrap;\">品牌: 诺博万</span><br /><span style=\"white-space:nowrap;\">货号: XR0011P</span><br /><span style=\"white-space:nowrap;\">风格: 通勤</span><br /><span style=\"white-space:nowrap;\">衣长: 长款</span><br /><span style=\"white-space:nowrap;\">袖长: 长袖</span><br /><span style=\"white-space:nowrap;\">领型: 毛领</span><br /><span style=\"white-space:nowrap;\">袖型: 常规袖</span><br /><span style=\"white-space:nowrap;\">面料材质: 貂毛</span><br /><span style=\"white-space:nowrap;\">流行元素/工艺: 口袋 毛领</span><br /><span style=\"white-space:nowrap;\">年份/季节: 2013冬季</span><br /><span style=\"white-space:nowrap;\">颜色分类: 黑色</span><br /><br /><br />', '', '', '');
INSERT INTO `js_product_description` VALUES ('287', '1', '亚光彩画', '&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的&ldquo;益茶&rdquo;。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【陶瓷茶具常保养】：&lt;br /&gt;1、可用洗碗机要选择有&ldquo;瓷器及水晶类&rdquo;洗涤功能的洗碗机。&lt;br /&gt;2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。&lt;br /&gt;3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。&lt;br /&gt;4、如果有茶渍，可用柠檬汁或食醋清洗。&lt;/span&gt;&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('119', '3', 'XR0010P', '<span style=\"white-space:nowrap;\">主图来源: 自主实拍图</span><br /><span style=\"white-space:nowrap;\">品牌: 诺博万</span><br /><span style=\"white-space:nowrap;\">货号: XR0010P</span><br /><span style=\"white-space:nowrap;\">风格: 通勤</span><br /><span style=\"white-space:nowrap;\">衣长: 长款</span><br /><span style=\"white-space:nowrap;\">袖长: 长袖</span><br /><span style=\"white-space:nowrap;\">领型: 毛领</span><br /><span style=\"white-space:nowrap;\">袖型: 常规袖</span><br /><span style=\"white-space:nowrap;\">面料材质: 貂毛</span><br /><span style=\"white-space:nowrap;\">流行元素/工艺: 口袋 毛领</span><br /><span style=\"white-space:nowrap;\">年份/季节: 2013冬季</span><br /><span style=\"white-space:nowrap;\">颜色分类: 红黑色</span><br /><div style=\"white-space:nowrap;\">	<br /></div>', '', '', '');
INSERT INTO `js_product_description` VALUES ('284', '1', '腊梅罗汉', '&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的&ldquo;益茶&rdquo;。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【陶瓷茶具常保养】：&lt;br /&gt;1、可用洗碗机要选择有&ldquo;瓷器及水晶类&rdquo;洗涤功能的洗碗机。&lt;br /&gt;2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。&lt;br /&gt;3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。&lt;br /&gt;4、如果有茶渍，可用柠檬汁或食醋清洗。&lt;/span&gt;&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('120', '3', 'XR0009P', '<span style=\"white-space:nowrap;\">主图来源: 店主实拍</span><br /><span style=\"white-space:nowrap;\">品牌:诺博万</span><br /><span style=\"white-space:nowrap;\">货号: XR0009P</span><br /><span style=\"white-space:nowrap;\">风格: 通勤</span><br /><span style=\"white-space:nowrap;\">衣长: 中款</span><br /><span style=\"white-space:nowrap;\">袖长: 长袖</span><br /><span style=\"white-space:nowrap;\">领型: 圆领</span><br /><span style=\"white-space:nowrap;\">衣门襟: 开门襟样式</span><br /><span style=\"white-space:nowrap;\">面料材质: 獭兔毛&nbsp;</span><br /><span style=\"white-space:nowrap;\">年份/季节: 2013冬季</span><br /><span style=\"white-space:nowrap;\">颜色分类:米色</span><br />', '', '', '');
INSERT INTO `js_product_description` VALUES ('277', '1', '大红曲把', '&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的&ldquo;益茶&rdquo;。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【陶瓷茶具常保养】：&lt;br /&gt;1、可用洗碗机要选择有&ldquo;瓷器及水晶类&rdquo;洗涤功能的洗碗机。&lt;br /&gt;2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。&lt;br /&gt;3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。&lt;br /&gt;4、如果有茶渍，可用柠檬汁或食醋清洗。&lt;/span&gt;&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('121', '3', 'XR0008P', '<span style=\"white-space:nowrap;\">主图来源: 店主实拍</span><br /><span style=\"white-space:nowrap;\">品牌:诺博万</span><br /><span style=\"white-space:nowrap;\">货号: XR0008P</span><br /><span style=\"white-space:nowrap;\">风格: 通勤</span><br /><span style=\"white-space:nowrap;\">衣长: 短款</span><br /><span style=\"white-space:nowrap;\">袖长: 长袖</span><br /><span style=\"white-space:nowrap;\">领型: 圆领</span><br /><span style=\"white-space:nowrap;\">衣门襟: 开门襟样式</span><br /><span style=\"white-space:nowrap;\">面料材质: 獭兔毛&nbsp;</span><br /><span style=\"white-space:nowrap;\">年份/季节: 2013冬季</span><br /><span style=\"white-space:nowrap;\">颜色分类: 黄色</span><br /><div style=\"white-space:nowrap;\">	<br /></div>', '', '', '');
INSERT INTO `js_product_description` VALUES ('275', '1', '龙泉青虎威', '&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的&ldquo;益茶&rdquo;。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【陶瓷茶具常保养】：&lt;br /&gt;1、可用洗碗机要选择有&ldquo;瓷器及水晶类&rdquo;洗涤功能的洗碗机。&lt;br /&gt;2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。&lt;br /&gt;3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。&lt;br /&gt;4、如果有茶渍，可用柠檬汁或食醋清洗。&lt;/span&gt;&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('276', '1', '金陵十三钗', '&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的&ldquo;益茶&rdquo;。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【陶瓷茶具常保养】：&lt;br /&gt;1、可用洗碗机要选择有&ldquo;瓷器及水晶类&rdquo;洗涤功能的洗碗机。&lt;br /&gt;2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。&lt;br /&gt;3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。&lt;br /&gt;4、如果有茶渍，可用柠檬汁或食醋清洗。&lt;/span&gt;&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('122', '3', 'XR0007P', '<span style=\"white-space:nowrap;\">主图来源: 店主实拍</span><br /><span style=\"white-space:nowrap;\">品牌:诺博万</span><br /><span style=\"white-space:nowrap;\">货号: XR0007P</span><br /><span style=\"white-space:nowrap;\">风格: 通勤</span><br /><span style=\"white-space:nowrap;\">通勤: 韩版</span><br /><span style=\"white-space:nowrap;\">衣长: 短款</span><br /><span style=\"white-space:nowrap;\">袖长: 七分袖</span><br /><span style=\"white-space:nowrap;\">领型: 圆领</span><br /><span style=\"white-space:nowrap;\">袖型: 其他袖型</span><br /><span style=\"white-space:nowrap;\">衣门襟: 其他门襟样式</span><br /><span style=\"white-space:nowrap;\">面料材质: 獭兔毛</span><br /><span style=\"white-space:nowrap;\">流行元素/工艺: 拼贴/拼接&nbsp;</span><br /><span style=\"white-space:nowrap;\">年份/季节: 2013冬季</span><br /><span style=\"white-space:nowrap;\">颜色分类: 米粉色 &nbsp; 黑白色 砖红黑色</span><br />', '', '', '');
INSERT INTO `js_product_description` VALUES ('123', '3', 'XR0006P', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('271', '1', '哥窑', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('272', '1', '南金金边花', '&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的&ldquo;益茶&rdquo;。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【陶瓷茶具常保养】：&lt;br /&gt;1、可用洗碗机要选择有&ldquo;瓷器及水晶类&rdquo;洗涤功能的洗碗机。&lt;br /&gt;2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。&lt;br /&gt;3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。&lt;br /&gt;4、如果有茶渍，可用柠檬汁或食醋清洗。&lt;/span&gt;&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('124', '3', 'XR0005P', '<span style=\"white-space:nowrap;\">图来源: 店主实拍</span><br /><span style=\"white-space:nowrap;\">品牌:诺博万</span><br /><span style=\"white-space:nowrap;\">货号: XR0005P</span><br /><span style=\"white-space:nowrap;\">风格: 通勤</span><br /><span style=\"white-space:nowrap;\">衣长: 中款</span><br /><span style=\"white-space:nowrap;\">袖长: 长袖</span><br /><span style=\"white-space:nowrap;\">领型: 圆领</span><br /><span style=\"white-space:nowrap;\">衣门襟: 开门襟样式带有珍珠</span><br /><span style=\"white-space:nowrap;\">&nbsp;年份/季节: 2013冬季</span><br /><span style=\"white-space:nowrap;\">颜色分类: 图片色</span><br />', '', '', '');
INSERT INTO `js_product_description` VALUES ('125', '3', 'XR0003P', '<span style=\"white-space:nowrap;\">主图来源: 店主实拍</span><br /><span style=\"white-space:nowrap;\">品牌:诺博万</span><br /><span style=\"white-space:nowrap;\">货号: XR0003P</span><br /><span style=\"white-space:nowrap;\">风格: 通勤</span><br /><span style=\"white-space:nowrap;\">衣长: 短款</span><br /><span style=\"white-space:nowrap;\">袖长: 无袖</span><br /><span style=\"white-space:nowrap;\">领型: 圆领</span><br /><span style=\"white-space:nowrap;\">衣门襟: 开门襟样式</span><br /><span style=\"white-space:nowrap;\">面料材质: 獭兔毛&nbsp;</span><br /><span style=\"white-space:nowrap;\">年份/季节: 2013冬季</span><br /><span style=\"white-space:nowrap;\">颜色分类: 图片色</span><br />', '', '', '');
INSERT INTO `js_product_description` VALUES ('126', '3', 'XR0002P', '<span style=\"white-space:nowrap;\">主图来源: 店主实拍</span><br /><span style=\"white-space:nowrap;\">品牌:诺博万</span><br /><span style=\"white-space:nowrap;\">货号: XR0002P</span><br /><span style=\"white-space:nowrap;\">风格: 通勤</span><br /><span style=\"white-space:nowrap;\">衣长: 中款</span><br /><span style=\"white-space:nowrap;\">袖长: 短袖</span><br /><span style=\"white-space:nowrap;\">领型: 圆领</span><br /><span style=\"white-space:nowrap;\">衣门襟: 开门襟样式</span><br /><span style=\"white-space:nowrap;\">面料材质: 獭兔毛&nbsp;</span><br /><span style=\"white-space:nowrap;\">年份/季节: 2013冬季</span><br /><span style=\"white-space:nowrap;\">颜色分类: 粉色</span><br />', '', '', '');
INSERT INTO `js_product_description` VALUES ('273', '1', '韩国', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('274', '1', '鼎尊', '&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的&ldquo;益茶&rdquo;。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【陶瓷茶具常保养】：&lt;br /&gt;1、可用洗碗机要选择有&ldquo;瓷器及水晶类&rdquo;洗涤功能的洗碗机。&lt;br /&gt;2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。&lt;br /&gt;3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。&lt;br /&gt;4、如果有茶渍，可用柠檬汁或食醋清洗。&lt;/span&gt;&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('269', '1', '台湾黑陶', '&lt;li title=&quot;&nbsp;时尚茶具&quot;&gt;	品牌:&nbsp;时尚茶具&lt;/li&gt;&lt;li title=&quot;&nbsp;陶&quot;&gt;	材质:&nbsp;陶&lt;/li&gt;&lt;li title=&quot;&nbsp;整套功夫茶具&quot;&gt;	类型:&nbsp;整套功夫茶具&lt;/li&gt;&lt;li title=&quot;&nbsp;CJ-003&quot;&gt;	货号:WJ0050&lt;/li&gt;&lt;li title=&quot;&nbsp;CJ-003&quot;&gt;	&nbsp;茶具产地:&nbsp;景德镇&lt;/li&gt;&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	主图来源:&nbsp;自主实拍图&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('270', '1', '南金亚光定窑兰花秋韵', '&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的&ldquo;益茶&rdquo;。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color:#613c1f;&quot; align=&quot;left&quot;&gt;	&lt;span style=&quot;font-size:x-small;&quot;&gt;【陶瓷茶具常保养】：&lt;br /&gt;1、可用洗碗机要选择有&ldquo;瓷器及水晶类&rdquo;洗涤功能的洗碗机。&lt;br /&gt;2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。&lt;br /&gt;3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。&lt;br /&gt;4、如果有茶渍，可用柠檬汁或食醋清洗。&lt;/span&gt;&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('127', '3', 'XR0001P', '<span style=\"white-space:nowrap;\">主图来源: 店主实拍</span><br /><span style=\"white-space:nowrap;\">品牌:诺博万</span><br /><span style=\"white-space:nowrap;\">货号: XR0001P</span><br /><span style=\"white-space:nowrap;\">风格: 通勤</span><br /><span style=\"white-space:nowrap;\">通勤: 韩版</span><br /><span style=\"white-space:nowrap;\">衣长: 长款</span><br /><span style=\"white-space:nowrap;\">袖长: 长袖</span><br /><span style=\"white-space:nowrap;\">领型: 圆领</span><br /><span style=\"white-space:nowrap;\">面料材质: 獭兔毛</span><br /><span style=\"white-space:nowrap;\">流行元素/工艺: 拼贴/拼接&nbsp;</span><br /><span style=\"white-space:nowrap;\">年份/季节: 2013冬季</span><br /><span style=\"white-space:nowrap;\">颜色分类: 蓝色</span><br />', '', '', '');
INSERT INTO `js_product_description` VALUES ('252', '1', '胶原蛋白补水面膜', '&lt;b&gt;&lt;span style=&quot;font-family:宋体;font-size:10.5pt;&quot;&gt;蚕丝胶原蛋白补水面膜&lt;/span&gt;&lt;SPAN style=&quot;FONT-FAMILY: ; FONT-SIZE: 10.5pt&quot; ?&gt;:&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-family:宋体;font-size:10.5pt;&quot;&gt;采用天然蚕丝材质，带来完美贴服的丝质感觉，可确保精华液充分吸收。增加多种保湿补水因子和纯天然植物提取物，更特别添加美泰专有技术生产的胶原蛋白，快速深层补水，滋养肌肤。长期使用能令肌肤水嫩弹滑，时刻焕发动人光彩&lt;/span&gt;', '1.	蚕丝胶原蛋白补水面膜:采用天然蚕丝材质，带来完美贴服的丝质感觉，可确保精华液充分吸收。增加多种保湿补水因子和纯天然植物提取物，更特别添加美泰专有技术生产的胶原蛋白，快速深层补水，滋养肌肤。长期使用能令肌肤水嫩弹滑，时刻焕发动人光彩', '', '');
INSERT INTO `js_product_description` VALUES ('253', '1', '金刚核桃', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('254', '1', '千眼菩提', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('255', '1', '一叶发财', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('256', '1', '招财树', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('257', '1', '菩提根', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('258', '1', '木鱼果', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('259', '1', '缅甸茄', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('260', '1', '太阳子', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('261', '1', '十八子', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('262', '1', '金刚菩提', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('263', '1', '金钱菩提', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('264', '1', '快客杯', '&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	主图来源:&nbsp;自主实拍图&lt;/li&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 产地：景德镇&lt;br /&gt;&lt;li title=&quot;&nbsp;1人&quot;&gt;	推荐使用人数:&nbsp;1人&lt;/li&gt;&lt;li title=&quot;&nbsp;否&quot;&gt;	配茶盘:&nbsp;否&lt;/li&gt;&lt;li title=&quot;&nbsp;其他功夫茶用具&quot;&gt;	类型:&nbsp;其他功夫茶用具&lt;/li&gt;&lt;li title=&quot;&nbsp;1人&quot;&gt;	货号：WJ0059&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('265', '1', '雪花釉', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('266', '1', '一堂和气', '&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	主图来源:&nbsp;自主实拍图&lt;/li&gt;&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	产地：景德镇&lt;/li&gt;&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	货号：WJ0055&lt;/li&gt;&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('267', '1', '京陶', '&lt;li title=&quot;&nbsp;QH-X3CA&quot;&gt;	货号:&nbsp;WJ0053&lt;/li&gt;&lt;li title=&quot;&nbsp;景德镇&quot;&gt;	茶具产地:&nbsp;景德镇&lt;/li&gt;&lt;li title=&quot;&nbsp;陶与瓷混合&quot;&gt;	材质:&nbsp;陶与瓷混合&lt;/li&gt;&lt;li title=&quot;&nbsp;6人&quot;&gt;	推荐使用人数:&nbsp;6人&lt;/li&gt;&lt;li title=&quot;&nbsp;青瓷&quot;&gt;	工艺:&nbsp;青瓷&lt;/li&gt;&lt;li title=&quot;&nbsp;否&quot;&gt;	配茶盘:&nbsp;否&lt;/li&gt;&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	主图来源:&nbsp;自主实拍图&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('268', '1', '张生朱砂陶', '&lt;span style=&quot;line-height:27px;font-family:宋体;color:#790000;font-size:large;&quot;&gt;【产品配置】茶壶1个 + 公道杯1个 + 茶杯6个&lt;br /&gt;产品介绍&lt;br /&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;font-family:黑体;color:#790000;&quot;&gt;&lt;span style=&quot;font-family:仿宋_gb2312;&quot;&gt;&lt;span style=&quot;color:#000000;&quot;&gt;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14pt;&quot;&gt;&lt;span style=&quot;font-family:黑体;color:#790000;&quot;&gt;&lt;span style=&quot;font-size:medium;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;font-family:仿宋_gb2312;&quot;&gt;&lt;span style=&quot;color:#000000;&quot;&gt;朱泥呈鹅黄色，朱泥是属于紫砂红泥中的一种泥，朱泥是红泥中之精品、因主要成份为红泥（含铁量极高）、又产在嫩泥矿之下层、又称&ldquo;未触风曰之石骨&rdquo;，石骨的意思就是未完全风化的土块，质坚如顽石，但遇水则自行溃散。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt; &lt;div style=&quot;color:#404040;&quot; align=&quot;left&quot;&gt;	&lt;p style=&quot;text-indent:24pt;margin:0cm 0cm 0pt;&quot;&gt;		&lt;span style=&quot;font-size:14pt;&quot;&gt;&lt;span style=&quot;font-family:黑体;color:#790000;&quot;&gt;&lt;span style=&quot;font-size:medium;&quot;&gt;&lt;span style=&quot;font-family:仿宋_gb2312;font-size:12pt;&quot;&gt;&lt;span style=&quot;color:#000000;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;	&lt;/p&gt;	&lt;p style=&quot;margin:0cm 0cm 0pt;&quot;&gt;		&lt;span style=&quot;font-size:14pt;&quot;&gt;&lt;span style=&quot;font-family:黑体;color:#790000;&quot;&gt;&lt;span style=&quot;font-size:medium;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;font-family:仿宋_gb2312;&quot;&gt;&lt;span style=&quot;color:#000000;&quot;&gt;朱泥壶制作比其他的紫砂壶制作难度大，成品率低。主要因素是朱泥收缩大，在高温烧制时，朱泥系因收缩或砂浆比率的缘故，所以壶身表面易现：&ldquo;节皱纹&rdquo;。故有古人云：&ldquo;无皱不成朱&rdquo;，这也是古今爱壶人认定上品朱泥壶的要件之一。同时，朱泥的成品表面呈哑光，视觉并不鲜亮，颜色微红带黄，砂感若隐若现，养成后砂感明显，润泽透亮。此外，朱泥壶透气性好，能在壶表面形成包浆，所以越用越光亮鲜艳，其组织细密，保香性能优于其他紫砂壶。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;	&lt;/p&gt;&lt;/div&gt;&lt;/span&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('128', '3', '青春系列套装', '1.青春增效水养乳<br />2.青春水透雪肤霜<br />3.<a href=\"http://website-edit.websiteonline.cn/product_detail?_v=preview&amp;domain=proddf830&amp;SessionID=cc7c034f13a8dce86777f9e321784eb5&amp;product_id=1371\">青春增效水养霜<br /></a>4.<a href=\"http://website-edit.websiteonline.cn/product_detail?_v=preview&amp;domain=proddf830&amp;SessionID=cc7c034f13a8dce86777f9e321784eb5&amp;product_id=1370\">青春隔离防护霜<br /></a>5.<a href=\"http://website-edit.websiteonline.cn/product_detail?_v=preview&amp;domain=proddf830&amp;SessionID=cc7c034f13a8dce86777f9e321784eb5&amp;product_id=1368\">青春增效白精华</a><br />6.<a href=\"http://website-edit.websiteonline.cn/product_detail?_v=preview&amp;domain=proddf830&amp;SessionID=cc7c034f13a8dce86777f9e321784eb5&amp;product_id=1367\">青春深层洁颜泡<br /></a>7.<a href=\"http://website-edit.websiteonline.cn/product_detail?_v=preview&amp;domain=proddf830&amp;SessionID=cc7c034f13a8dce86777f9e321784eb5&amp;product_id=1366\">青春精华保湿液</a><br /><table style=\"width:108pt;border-collapse:collapse;\" width=\"144\" height=\"133\">	<tbody>		<tr>			<td style=\"font-style:normal;color:#000000;font-size:10.5pt;vertical-align:middle;font-weight:700;text-decoration:none;\" height=\"19\" width=\"72\">			</td>			<td style=\"font-style:normal;color:#000000;font-size:12pt;vertical-align:middle;font-weight:400;text-decoration:none;\" height=\"19\" width=\"72\">			</td>		</tr>		<tr>			<td style=\"font-style:normal;color:#000000;font-size:10.5pt;vertical-align:middle;font-weight:700;text-decoration:none;\" height=\"19\" width=\"72\">			</td>			<td style=\"font-style:normal;color:#000000;font-size:12pt;vertical-align:middle;font-weight:400;text-decoration:none;\" height=\"19\" width=\"72\">			</td>		</tr>		<tr>			<td style=\"font-style:normal;color:#000000;font-size:10.5pt;vertical-align:middle;font-weight:700;text-decoration:none;\" height=\"19\" width=\"72\">			</td>			<td style=\"font-style:normal;color:#000000;font-size:12pt;vertical-align:middle;font-weight:400;text-decoration:none;\" height=\"19\" width=\"72\">			</td>		</tr>		<tr>			<td style=\"font-style:normal;color:#000000;font-size:10.5pt;vertical-align:middle;font-weight:700;text-decoration:none;\" height=\"19\" width=\"72\">			</td>			<td style=\"font-style:normal;color:#000000;font-size:12pt;vertical-align:middle;font-weight:400;text-decoration:none;\" height=\"19\" width=\"72\">			</td>		</tr>		<tr>			<td style=\"font-style:normal;color:#000000;font-size:10.5pt;vertical-align:middle;font-weight:700;text-decoration:none;\" height=\"19\" width=\"72\">			</td>			<td style=\"font-style:normal;color:#000000;font-size:12pt;vertical-align:middle;font-weight:400;text-decoration:none;\" height=\"19\" width=\"72\">			</td>		</tr>		<tr>			<td style=\"font-style:normal;color:#000000;font-size:10.5pt;vertical-align:middle;font-weight:700;text-decoration:none;\" height=\"19\" width=\"72\">			</td>			<td style=\"font-style:normal;color:#000000;font-size:12pt;vertical-align:middle;font-weight:400;text-decoration:none;\" height=\"19\" width=\"72\">			</td>		</tr>		<tr>			<td style=\"font-style:normal;color:#000000;font-size:10.5pt;vertical-align:middle;font-weight:700;text-decoration:none;\" height=\"19\" width=\"72\">			</td>			<td style=\"font-style:normal;color:#000000;font-size:12pt;vertical-align:middle;font-weight:400;text-decoration:none;\" height=\"19\" width=\"72\">			</td>		</tr>	</tbody></table>', '', '', '');
INSERT INTO `js_product_description` VALUES ('129', '3', '青春水透雪肤霜', '适用肤质：干性和混合性肤质<br />主要功效：蕴含多种名贵天然草本植物精华；质地非常细腻、清爽，能迅速渗透皮肤表层，全面呵护肌肤，重塑婴儿般的柔嫩、光滑。改善粗糙的表皮，修复受损的肌肤，令肌肤晶莹白皙。<br />使用方法:洁面、爽肤后，取适量置于掌心，涂抹整个脸部。<br />注意事项:使用后请拧紧瓶盖，请置于阴凉干燥处，避免阳光直射，请置于幼儿无法取得之处。<br />', '', '', '');
INSERT INTO `js_product_description` VALUES ('130', '3', '青春增效水养霜', '<li title=\"&nbsp;面霜\">	乳液/面霜品类:&nbsp;面霜</li><li title=\"&nbsp;正常规格\">	规格:&nbsp;正常规格</li><li title=\"&nbsp;美白&nbsp;补水&nbsp;其他功效\">	功效:&nbsp;美白&nbsp;补水&nbsp;其他功效</li><li title=\"&nbsp;50g/ml\">	化妆品容量:&nbsp;1.05FL OZLIQ/30g</li><li title=\"&nbsp;other/其他\">	品牌:&nbsp;肌源</li><li title=\"&nbsp;other/其他\">	乳液/面霜单品:&nbsp;其他单品</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('131', '3', '青春隔离防护霜', '<em>产品参数：</em> <ul id=\"J_AttrUL\">	<li title=\"阿芙 ve高等防护霜\">		产品名称：青春隔离防护霜	</li>	<li title=\"&nbsp;面霜\">		乳液/面霜品类:&nbsp;面霜	</li>	<li title=\"&nbsp;正常规格\">		规格:&nbsp;正常规格	</li>	<li title=\"&nbsp;美白&nbsp;保湿\">		功效:&nbsp;美白&nbsp;保湿	</li>	<li title=\"&nbsp;所有肤质\">		适合肤质:&nbsp;所有肤质	</li>	<li title=\"&nbsp;78g/ml\">		化妆品容量:&nbsp;1.05FL OZLIQ/30g	</li>	<li id=\"J_attrBrandName\" title=\"&nbsp;阿芙\">		品牌:&nbsp;肌源	</li>	<li title=\"&nbsp;ve高等防护霜\">		乳液/面霜单品:&nbsp;ve高等防护霜	</li></ul>', '', '', '');
INSERT INTO `js_product_description` VALUES ('243', '1', '小红参', '&lt;b&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;小红参：&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;&quot;&gt;适合肤质：适合各类肌肤&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;color:#333333;&quot;&gt;,&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;&quot;&gt;对于去皱及抗衰老特别适用。&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;color:#333333;&quot;&gt;&lt;br /&gt;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;&quot;&gt;产品功效：含人参皂甙，增强胶原纤维和弹力纤维的功效，使皮肤紧实、富有光泽、改善皱纹；小麦蛋白极佳抗氧化和活肤效果，直接保护和激活细胞活力；高效保湿，有效预防肌肤衰老和干燥，锁住青春，永葆肌肤水嫩。&lt;/span&gt;', '小红参：适合肤质：适合各类肌肤,对于去皱及抗衰老特别适用。 产品功效：含人参皂甙，增强胶原纤维和弹力纤维的功效，使皮肤紧实、富有光泽、改善皱纹；小麦蛋白极佳抗氧化和活肤效果，直接保护和激活细胞活力；高效保湿，有效预防肌肤衰老和干燥，锁住青春，永葆肌肤水嫩。', '', '');
INSERT INTO `js_product_description` VALUES ('132', '3', '青春增效水养乳', '<p>	&nbsp;</p><li title=\"膜法世家·1908 金沙水养嫩白乳液\">	产品名称：青春增效水养乳</li><li title=\"膜法世家·1908 金沙水养嫩白乳液\">	乳液/面霜品类:&nbsp;乳液</li><li title=\"&nbsp;正常规格\">	规格:&nbsp;正常规格</li><li title=\"&nbsp;提亮肤色&nbsp;抗氧化&nbsp;美白&nbsp;补水&nbsp;保湿&nbsp;其他功效&nbsp;抗衰老/抗皱&nbsp;晒后修护&nbsp;收缩毛孔抗衰老/抗皱\">	功效:&nbsp;提亮肤色&nbsp;抗氧化&nbsp;美白&nbsp;补水&nbsp;保湿&nbsp;其他功效&nbsp;抗衰老/抗皱&nbsp;晒后修护&nbsp;收缩毛孔抗衰老/抗皱</li><li title=\"&nbsp;所有肤质\">	适合肤质:&nbsp;所有肤质</li><li title=\"&nbsp;100g/ml\">	化妆品容量:&nbsp;3.5FL OZ LIQ/100ml</li><li title=\"&nbsp;100g/ml\">	品牌:&nbsp;肌源</li><li title=\"&nbsp;100g/ml\">	乳液/面霜单品:&nbsp;水养嫩白乳液</li><li title=\"&nbsp;吸收度&nbsp;温和度&nbsp;舒适度&nbsp;自然度&nbsp;滋润度\">	化妆品特性:&nbsp;吸收度&nbsp;温和度&nbsp;舒适度&nbsp;自然度&nbsp;滋润度</li><li title=\"&nbsp;无\">	特殊用途化妆品批准文号:&nbsp;无</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('235', '1', '铁观音浓香', '&lt;p style=&quot;margin-left:18.0pt;text-indent:-18.0pt;&quot;&gt;	&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;铁观音浓香：&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-family:宋体;background:white;&quot;&gt;浓香型铁观音属传统半发醇的安溪铁观音茶，适合资深茶友饮用，因为口感较重，叶子的成色看上去在绿色的茶叶后面还有轻黑和微黄的叶子。&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/p&gt;', '铁观音浓香：浓香型铁观音属传统半发醇的安溪铁观音茶，适合资深茶友饮用，因为口感较重，叶子的成色看上去在绿色的茶叶后面还有轻黑和微黄的叶子。', '', '');
INSERT INTO `js_product_description` VALUES ('236', '1', '铁观音清香', '&lt;p&gt;	&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;铁观音清香：&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-family:宋体;background:white;&quot;&gt;铁观音&lt;/span&gt;&lt;span style=&quot;font-family:Arial;background:white;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;background:white;&quot;&gt;问着淡香&lt;/span&gt;&lt;span style=&quot;font-family:Arial;background:white;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;background:white;&quot;&gt;泡出来是清香&lt;/span&gt;&lt;span style=&quot;font-family:Arial;background:white;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;background:white;&quot;&gt;茗一口&lt;/span&gt;&lt;span style=&quot;font-family:Arial;background:white;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;background:white;&quot;&gt;唇齿甘甜&lt;/span&gt;&lt;span style=&quot;font-family:Arial;background:white;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;background:white;&quot;&gt;回味清香悠远&lt;/span&gt;&lt;span style=&quot;font-family:Arial;background:white;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;background:white;&quot;&gt;白茶&lt;/span&gt;&lt;span style=&quot;font-family:Arial;background:white;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;background:white;&quot;&gt;品在口中是清鲜淡然&lt;/span&gt;&lt;span style=&quot;font-family:Arial;background:white;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;background:white;&quot;&gt;虽没有铁观音那么的香醇&lt;/span&gt;&lt;span style=&quot;font-family:Arial;background:white;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;background:white;&quot;&gt;但是淡淡的清香浑然是自成一派&lt;/span&gt;&lt;span style=&quot;font-family:Arial;background:white;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;background:white;&quot;&gt;别致而独特&lt;/span&gt;&lt;span style=&quot;font-family:Arial;background:white;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;background:white;&quot;&gt;永远无法割舍与淡忘&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/p&gt;', '铁观音清香：铁观音 问着淡香 泡出来是清香 茗一口 唇齿甘甜 回味清香悠远 白茶 品在口中是清鲜淡然 虽没有铁观音那么的香醇 但是淡淡的清香浑然是自成一派 别致而独特 永远无法割舍与淡忘', '', '');
INSERT INTO `js_product_description` VALUES ('237', '1', '正山小种瑞草', '&lt;b&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;正山小种瑞草：&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;background:white;&quot;&gt;正山小种有机红茶汤色红亮&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;background:white;&quot;&gt;，滋味甘醇，具有天然的桂圆味及特有的松烟香。由于其产于原始森林内，野生采集，传统工艺制作，茶叶具有独特的保健功效，长期饮用保健养身，&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:;&quot; &quot;=&quot;&quot;&gt;&lt;a href=&quot;http://baike.baidu.com/view/3565.htm&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-family:宋体;color:#136EC2;background:white;text-decoration:none;&quot;&gt;&lt;span&gt;英国&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;background:white;&quot;&gt;的一位老茶&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:;&quot; &quot;=&quot;&quot;&gt;&lt;a href=&quot;http://baike.baidu.com/view/1042162.htm&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-family:宋体;color:#136EC2;background:white;text-decoration:none;&quot;&gt;&lt;span&gt;师曾&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;background:white;&quot;&gt;说：&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;color:#333333;background:white;&quot;&gt;&ldquo;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;background:white;&quot;&gt;喝这种茶胜过饮人参汤&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;color:#333333;background:white;&quot;&gt;&rdquo;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;background:white;&quot;&gt;。&lt;/span&gt;', '正山小种瑞草：正山小种有机红茶汤色红亮，滋味甘醇，具有天然的桂圆味及特有的松烟香。由于其产于原始森林内，野生采集，传统工艺制作，茶叶具有独特的保健功效，长期饮用保健养身，英国的一位老茶师曾说：&ldquo;喝这种茶胜过饮人参汤&rdquo;。', '', '');
INSERT INTO `js_product_description` VALUES ('133', '3', '青春增效白精华', '<table class=\"ke-zeroborder\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"740\">	<tbody>		<tr>			<td style=\"border-bottom:#cccccc 1px solid;padding-bottom:8px;padding-top:8px;\" width=\"118\">				<strong><span style=\"font-family:simhei;\"><span style=\"font-size:15px;\">主要功能</span></span></strong>			</td>			<td style=\"border-bottom:#cccccc 1px solid;padding-bottom:8px;padding-top:8px;\">				<span style=\"font-size:x-small;\">保湿、补水 美白去黄气</span>			</td>		</tr>		<tr>			<td style=\"border-bottom:#cccccc 1px solid;padding-bottom:8px;padding-top:8px;\" width=\"118\">				<strong><span style=\"font-family:simhei;\"><span style=\"font-size:15px;\">适合人群</span></span></strong>			</td>			<td style=\"border-bottom:#cccccc 1px solid;padding-bottom:8px;padding-top:8px;\">				<p>					<span style=\"font-size:12px;\"><span style=\"font-family:simsun;\"><span style=\"font-size:x-small;\">适用年龄：22岁以上</span></span></span>				</p>				<p>					<span style=\"font-size:12px;\"><span style=\"font-family:simsun;\"><span style=\"font-size:x-small;\">适用肤质：任何肌肤</span></span></span>				</p>				<p>					<span style=\"font-size:12px;\"><span style=\"font-family:simsun;\"></span></span><span style=\"font-size:12px;\"><span style=\"font-family:simsun;\"><span style=\"font-size:x-small;\">适用对象：肌肤缺水干燥的人群、面色暗黄粗糙的人群、注重肌肤保养的人群、有一定品牌意识的人群</span></span></span>				</p>			</td>		</tr>		<tr>			<td style=\"border-bottom:#cccccc 1px solid;padding-bottom:8px;padding-top:8px;\" width=\"118\">				<strong><span style=\"font-size:15px;\"><span style=\"font-family:simhei;\">主要成分</span></span></strong>			</td>			<td style=\"border-bottom:#cccccc 1px solid;padding-bottom:8px;padding-top:8px;\">				<span style=\"font-family:宋体;font-size:x-small;\">先进科技萃取甘草、当归、灵芝等珍贵的中药植物精华与精油成分</span>			</td>		</tr>		<tr>			<td style=\"border-bottom:#cccccc 1px solid;padding-bottom:8px;padding-top:8px;\" width=\"118\">				<strong><span style=\"font-family:simhei;\"><span style=\"font-size:15px;\">产品说明</span></span></strong>			</td>			<td style=\"border-bottom:#cccccc 1px solid;padding-bottom:8px;padding-top:8px;\">				<span style=\"font-family:宋体;font-size:x-small;\"><span style=\"font-size:x-small;\"><span style=\"font-size:x-small;\"> 				<p>					<span style=\"font-size:x-small;\">改善皮肤粗糙、黑黄现象、还能快速修复细胞组织，增进皮肤对营养成份的吸收，恢复皮肤光滑、白嫩、细腻状态！</span>				</p></span></span></span>			</td>		</tr>		<tr>			<td style=\"border-bottom:#cccccc 1px solid;padding-bottom:8px;padding-top:8px;\" width=\"118\">				<strong><span style=\"font-family:simhei;\"><span style=\"font-size:15px;\">使用方法</span></span></strong>			</td>			<td style=\"border-bottom:#cccccc 1px solid;padding-bottom:8px;padding-top:8px;\">				<span style=\"font-size:x-small;\"> 				<p>					用法：早晚使用、取适量本品于面部轻拍至吸收。				</p>				<p>					提示：建议与快乐细白晚霜搭配一起于夜间使用效果佳，欲想要加快效果可配合炫丽真白晚霜一起使用效果更佳。				</p></span>			</td>		</tr>	</tbody></table>', '', '', '');
INSERT INTO `js_product_description` VALUES ('251', '1', '胶原蛋白美白面膜', '&lt;p&gt;	&lt;span style=&quot;font-family:宋体;&quot;&gt;蚕丝胶原蛋白美白面膜：采用天然蚕丝材质，带来完美贴服的丝质感觉，可确保精华液充分吸收。添加多种美白因子和纯天然植物提取物，更特别添加美泰专有技术生产的胶原蛋白，深层击退黑色素、淡化色斑、滋养肌肤、抵抗紫外线。长期使用能令肌肤时刻两百嫩滑，焕发白皙光彩&lt;/span&gt;&lt;/p&gt;', '蚕丝胶原蛋白美白面膜：采用天然蚕丝材质，带来完美贴服的丝质感觉，可确保精华液充分吸收。添加多种美白因子和纯天然植物提取物，更特别添加美泰专有技术生产的胶原蛋白，深层击退黑色素、淡化色斑、滋养肌肤、抵抗紫外线。长期使用能令肌肤时刻两百嫩滑，焕发白皙光彩', '', '');
INSERT INTO `js_product_description` VALUES ('247', '1', '小蜗牛', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('248', '1', '牙膏', '&lt;span style=&quot;font-size:10.5pt;font-family:&quot;&quot;&gt;2080&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;牙膏：&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&quot;&quot;&gt;&lt;a href=&quot;http://baike.baidu.com/view/3682114.htm&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;color:windowtext;text-decoration:none;&quot;&gt;2080&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;是韩国爱敬集团旗下的口腔护理品牌。其口号&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&quot;&quot;&gt;&ldquo;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;让&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&quot;&quot;&gt;20&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;颗健康的牙齿保持到&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&quot;&quot;&gt;80&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;岁&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&quot;&quot;&gt;&rdquo;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;具有：&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&quot;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;美白&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&quot;&quot;&gt;,&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;抗敏感&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&quot;&quot;&gt;,&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;去牙渍&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&quot;&quot;&gt;,&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;防蛀&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&quot;&quot;&gt;/&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;固齿&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&quot;&quot;&gt;,&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;抗菌&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&quot;&quot;&gt;/&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;牙龈护理&lt;/span&gt;', '2080牙膏：2080是韩国爱敬集团旗下的口腔护理品牌。其口号&ldquo;让20颗健康的牙齿保持到80岁&rdquo;具有： 美白,抗敏感,去牙渍,防蛀/固齿,抗菌/牙龈护理', '', '');
INSERT INTO `js_product_description` VALUES ('134', '3', '青春深层洁颜泡', '<li title=\"&nbsp;正常规格\">	规格:&nbsp;正常规格</li><li title=\"&nbsp;180g/ml\">	化妆品容量:4.2FL OZ LIQ/120m</li><li title=\"&nbsp;180g/ml\">	适合肤质:&nbsp;所有肤质</li><li title=\"&nbsp;泡沫洁面\">	起泡程度:&nbsp;泡沫洁面</li><li title=\"&nbsp;洁面摩丝\">	洁面分类:&nbsp;洁面摩丝</li><li title=\"&nbsp;保湿&nbsp;控油&nbsp;去角质&nbsp;收缩毛孔&nbsp;深层清洁&nbsp;深层清洁：补水\">	功效:&nbsp;保湿&nbsp;控油&nbsp;去角质&nbsp;收缩毛孔&nbsp;深层清洁&nbsp;深层清洁：补水</li><li id=\"J_attrBrandName\" title=\"&nbsp;Neogence/霓净思\">	品牌:&nbsp;肌源</li><li title=\"&nbsp;Neogence/霓净思\">	洁面单品:&nbsp;氨基酸保湿洁颜泡沫</li><li title=\"&nbsp;清洁度&nbsp;无残留&nbsp;温和度&nbsp;清爽度\">	化妆品特性:&nbsp;清洁度&nbsp;无残留&nbsp;温和度&nbsp;</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('135', '3', '青春精华保湿液', '<p style=\"text-align:left;\">	<span style=\"color:#a64d79;\">品牌：肌源<br />名称：青春精华保湿液<br /></span><span style=\"color:#a64d79;\">包装：全新有外盒，无塑封</span><br /><span style=\"color:#a64d79;\">主要功效：<br />蕴含大西洋红藻美白精粹、海洋复合休眠因子等多重靓白成分，配合靶向脂质体，快速、深入、准确改善顽固暗沉色块，令肌肤呈现纯净无瑕质感<br />蕴含海洋浮游生物赋能精华GP4G，由内而外净除肌肤杂质，迅速改善不均匀肤色<br />蕴含海洋角质莹透因子Lumiflex、海洋深层水、岩藻多糖以及天然碧玺宝石粉，带来充足滋养，重整角质层，修复外来污染、日常辐射、日照、压力等肌肤伤害，同时进一步预防暗沉问题，肌肤水润白皙，无瑕肤质仿若天成</span><br /><span style=\"color:#a64d79;\"><br />适合人群：<br />适合所有肤质</span></p><p style=\"text-align:left;\">	<span style=\"color:#a64d79;\">使用方法：<br />使用精华素后，取适量乳液，按肌肤纹理轻柔地涂抹于整个面部和颈部</span></p><p>	&nbsp;</p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('136', '3', '明扇', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('137', '3', '名家花鸟', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('138', '3', '竖牡丹', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('139', '3', '动物集锦', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('140', '3', '京剧脸谱', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('141', '3', '清明上河图', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('240', '1', '金骏眉清风', '&lt;p style=&quot;background:white;&quot;&gt;	&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;金骏眉清风：&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-family:宋体;color:#333333;&quot;&gt;金骏眉首创于&lt;/span&gt;&lt;span style=&quot;font-family:Arial;color:#333333;&quot;&gt;2005&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#333333;&quot;&gt;年，是在武夷山&lt;/span&gt;&lt;span style=&quot;font-family:Arial;color:#333333;&quot;&gt;&lt;a href=&quot;http://baike.baidu.com/view/27510.htm&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-family:宋体;color:#136EC2;text-decoration:none;&quot;&gt;正山小种&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#333333;&quot;&gt;红茶传统工艺基础上进行改良，采用创新工艺研发的高端&lt;/span&gt;&lt;span style=&quot;font-family:Arial;color:#333333;&quot;&gt;&lt;a href=&quot;http://baike.baidu.com/view/6025.htm&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-family:宋体;color:#136EC2;text-decoration:none;&quot;&gt;红茶&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#333333;&quot;&gt;，它的诞生填补了国内市场无高端&lt;/span&gt;&lt;span style=&quot;font-family:Arial;color:#333333;&quot;&gt;&lt;a href=&quot;http://baike.baidu.com/view/6025.htm&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-family:宋体;color:#136EC2;text-decoration:none;&quot;&gt;红茶&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#333333;&quot;&gt;的空白，其名寓意：希冀金贵之茶犹如骏马奔腾般发展。金骏眉原料产自&lt;/span&gt;&lt;span style=&quot;font-family:Arial;color:#333333;&quot;&gt;&lt;a href=&quot;http://baike.baidu.com/view/20069.htm&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-family:宋体;color:#136EC2;text-decoration:none;&quot;&gt;武夷山&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#333333;&quot;&gt;国家级自然保护区内方圆&lt;/span&gt;&lt;span style=&quot;font-family:Arial;color:#333333;&quot;&gt;565&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#333333;&quot;&gt;平方公里的原生态茶山，手工采摘后由茶师精心制作，每&lt;/span&gt;&lt;span style=&quot;font-family:Arial;color:#333333;&quot;&gt;500&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#333333;&quot;&gt;克&lt;/span&gt;&lt;span style=&quot;font-family:Arial;color:#333333;&quot;&gt;&lt;a href=&quot;http://baike.baidu.com/view/2151158.htm&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-family:宋体;color:#136EC2;text-decoration:none;&quot;&gt;金骏眉&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#333333;&quot;&gt;约需&lt;/span&gt;&lt;span style=&quot;font-family:Arial;color:#333333;&quot;&gt;6&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#333333;&quot;&gt;～&lt;/span&gt;&lt;span style=&quot;font-family:Arial;color:#333333;&quot;&gt;8&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#333333;&quot;&gt;万颗芽尖。&lt;/span&gt;&lt;span style=&quot;font-family:Arial;color:#333333;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;left&quot; style=&quot;margin-left:42pt;background-color:white;&quot;&gt;	&lt;span style=&quot;font-family:宋体;color:#333333;&quot;&gt;正宗外形条索紧秀，略显绒毛，隽茂、重实；色泽为&lt;/span&gt;&lt;span style=&quot;font-family:Arial;color:#333333;&quot;&gt;&lt;a href=&quot;http://baike.baidu.com/view/36077.htm&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-family:宋体;color:#136EC2;text-decoration:none;&quot;&gt;金&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#333333;&quot;&gt;、&lt;/span&gt;&lt;span style=&quot;font-family:Arial;color:#333333;&quot;&gt;&lt;a href=&quot;http://baike.baidu.com/view/39214.htm&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-family:宋体;color:#136EC2;text-decoration:none;&quot;&gt;黄&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#333333;&quot;&gt;、&lt;/span&gt;&lt;span style=&quot;font-family:Arial;color:#333333;&quot;&gt;&lt;a href=&quot;http://baike.baidu.com/view/65616.htm&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-family:宋体;color:#136EC2;text-decoration:none;&quot;&gt;黑&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#333333;&quot;&gt;相间，色润；开汤汤色为金黄色，清澈有金圈；其水、香、味似果、蜜、花、薯等综合香型；啜一口入喉，甘甜感顿生，滋味鲜活甘爽，高山韵显，喉韵悠长，沁人心脾，仿佛使人置身于森林幽谷之中；杯底冷、热、温，不同时嗅之，底香持久、变幻令人遐想，连泡&lt;/span&gt;&lt;span style=&quot;font-family:Arial;color:#333333;&quot;&gt;12&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#333333;&quot;&gt;次，口感仍然饱满甘甜；叶底舒展后，芽尖鲜活，秀挺亮丽，叶色呈古铜色。总之，金骏眉实属可遇不可求之茶中珍品。乃世界红茶之顶尖。&lt;/span&gt;&lt;a name=&quot;2&quot;&gt;&lt;/a&gt;&lt;a name=&quot;sub2151158_2&quot;&gt;&lt;/a&gt;&lt;span style=&quot;font-family:Arial;color:#333333;&quot;&gt;&lt;/span&gt;&lt;/p&gt;', '金骏眉清风：金骏眉首创于2005年，是在武夷山正山小种红茶传统工艺基础上进行改良，采用创新工艺研发的高端红茶，它的诞生填补了国内市场无高端红茶的空白，其名寓意：希冀金贵之茶犹如骏马奔腾般发展。金骏眉原料产自武夷山国家级自然保护区内方圆565平方公里的原生态茶山，手工采摘后由茶师精心制作，每500克金骏眉约需6～8万颗芽尖。 正宗外形条索紧秀，略显绒毛，隽茂、重实；色泽为金、黄、黑相间，色润；开汤汤色为金黄色，清澈有金圈；其水、香、味似果、蜜、花、薯等综合香型；啜一口入喉，甘甜感顿生，滋味鲜活甘爽，高山韵显', '', '');
INSERT INTO `js_product_description` VALUES ('142', '3', '秦岭鲜都1号', '<span style=\"font-size:12.0pt;font-family:宋体;\"> 秦岭鲜都</span><span style=\"font-size:12.0pt;font-family:;\" \"=\"\">1</span><span style=\"font-size:12.0pt;font-family:宋体;\">号具有酸甜可口、芳香怡人和丰富全面的营养的特点，素有“保健奇果”“营养金矿”之称，早熟，可于中秋，“十一”前上市，近似苛刻的品质要求、全程冷链控制、环保便捷的包装，使这珍稀的猕猴桃内在品质得以彰显，实为新鲜美味，营养全面的高档礼品，是馈赠亲友的佳品之选。</span>', '', '', '');
INSERT INTO `js_product_description` VALUES ('144', '3', '竹纤维双层毛巾', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('146', '3', '竹纤维战马毛巾', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('147', '3', '竹纤维竹棉毛巾', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('148', '3', '竹纤维小兔毛巾', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('149', '3', '竹纤维全竹毛巾', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('150', '3', '竹纤维内裤', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('151', '3', '莫代尔男士内衣', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('152', '3', '男士印花内衣', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('153', '3', '男士休闲提花内衣', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('154', '3', '女士休闲印花内衣', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('155', '3', '女士美体保暖内衣', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('156', '3', '男士内裤', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('157', '3', '男士内裤（大）', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('158', '3', '女士内裤', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('159', '3', '女士内衣9024', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('160', '3', '女士内衣9037', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('161', '3', '女士内衣A921', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('162', '3', '女士内衣1314', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('163', '3', '女士内衣1223', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('164', '3', '女士内衣1304', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('165', '3', '女士内衣1313', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('238', '1', '正山小种古韵', '&lt;b&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;正山小种江南古韵：&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&quot;&quot;&gt;&lt;a href=&quot;http://baike.baidu.com/view/782339.htm&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-family:宋体;color:#136EC2;background:white;text-decoration:none;&quot;&gt;&lt;span&gt;正山小种红茶&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;background:white;&quot;&gt;，是世界红茶的鼻祖。又称拉普山小种，是&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&quot;&quot;&gt;&lt;a href=&quot;http://baike.baidu.com/view/61891.htm&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-family:宋体;color:#136EC2;background:white;text-decoration:none;&quot;&gt;&lt;span&gt;中国&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;background:white;&quot;&gt;生产的一种红茶，茶叶是用松针或松柴熏制而成，有着非常浓烈的香味。因为熏制的原因，茶叶呈黑色，但茶汤为深红色。正山小种产地在&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&quot;&quot;&gt;&lt;a href=&quot;http://baike.baidu.com/view/2212.htm&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-family:宋体;color:#136EC2;background:white;text-decoration:none;&quot;&gt;&lt;span&gt;福建省&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;background:white;&quot;&gt;武夷山市，受原产地保护。正山小种红茶是最古老的一种红茶，后来在正山小种的基础上发展了功夫红茶。&lt;/span&gt;', '5》	正山小种江南古韵：正山小种红茶，是世界红茶的鼻祖。又称拉普山小种，是中国生产的一种红茶，茶叶是用松针或松柴熏制而成，有着非常浓烈的香味。因为熏制的原因，茶叶呈黑色，但茶汤为深红色。正山小种产地在福建省武夷山市，受原产地保护。正山小种红茶是最古老的一种红茶，后来在正山小种的基础上发展了功夫红茶。', '', '');
INSERT INTO `js_product_description` VALUES ('166', '3', '金豹鼠', '<li title=\"&nbsp;袋鼠\">	品牌:&nbsp;金豹鼠</li><li title=\"&nbsp;腰带\">	款式:&nbsp;腰带</li><li title=\"&nbsp;牛皮\">	主材质:&nbsp;牛皮</li><li title=\"&nbsp;光面\">	材质特性:&nbsp;光面</li><li title=\"&nbsp;光身\">	带身元素:&nbsp;光身</li><li title=\"&nbsp;自动扣\">	带扣:&nbsp;自动扣</li><li title=\"&nbsp;合金头\">	带扣材质:&nbsp;合金头</li><li title=\"&nbsp;光板\">	流行元素:&nbsp;光板</li><li title=\"&nbsp;3-4cm\">	带身宽度:&nbsp;3-4cm</li><li title=\"&nbsp;商务\">	风格:&nbsp;商务</li><li title=\"&nbsp;腰带\">	佩戴部位:&nbsp;腰带</li><li title=\"&nbsp;单圈\">	长度:&nbsp;单圈</li><li title=\"&nbsp;男士\">	配件性别:&nbsp;男士</li><li title=\"&nbsp;SV522567\">	货号:&nbsp;XR0002</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('249', '1', '香皂', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('250', '1', '胶原蛋白滋养面膜', '&lt;p&gt;	&lt;span style=&quot;font-family:宋体;&quot;&gt;蚕丝胶原蛋白滋养面膜：采用天然蚕丝材质，带来完美贴服的丝质感觉，可确保精华液充分吸收。增加美泰专有技术生产的胶原蛋白以及多种保湿、美白因子和纯天然植物提取物，深层补充肌肤所需营养，长期使用能滋养肌肤，清除细纹，提亮肤色，减少暗沉，时刻焕发青春光彩&lt;/span&gt;&lt;/p&gt;', '蚕丝胶原蛋白滋养面膜：采用天然蚕丝材质，带来完美贴服的丝质感觉，可确保精华液充分吸收。增加美泰专有技术生产的胶原蛋白以及多种保湿、美白因子和纯天然植物提取物，深层补充肌肤所需营养，长期使用能滋养肌肤，清除细纹，提亮肤色，减少暗沉，时刻焕发青春光彩', '', '');
INSERT INTO `js_product_description` VALUES ('245', '1', 'MT胶原蛋白眼贴', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('167', '3', '老人头', '<li title=\"&nbsp;袋鼠\">	品牌:&nbsp;老人头</li><li title=\"&nbsp;袋鼠\">	款式:&nbsp;腰带</li><li title=\"&nbsp;牛皮\">	主材质:&nbsp;牛皮</li><li title=\"&nbsp;光面\">	材质特性:&nbsp;光面</li><li title=\"&nbsp;光身\">	带身元素:&nbsp;光身</li><li title=\"&nbsp;自动扣\">	带扣:&nbsp;自动扣</li><li title=\"&nbsp;合金头\">	带扣材质:&nbsp;合金头</li><li title=\"&nbsp;光板\">	流行元素:&nbsp;光板</li><li title=\"&nbsp;3-4cm\">	带身宽度:&nbsp;3-4cm</li><li title=\"&nbsp;商务\">	风格:&nbsp;商务</li><li title=\"&nbsp;腰带\">	佩戴部位:&nbsp;腰带</li><li title=\"&nbsp;单圈\">	长度:&nbsp;单圈</li><li title=\"&nbsp;男士\">	配件性别:&nbsp;男士</li><li title=\"&nbsp;SV522567\">	货号:&nbsp;XR0001</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('244', '1', '大红参', '&lt;pre&gt;&lt;b&gt;大红参：&lt;/b&gt;&lt;span style=&quot;font-size:10.5pt;color:#333333;&quot;&gt;适合肤质：适合各类肌肤&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;color:#333333;&quot;&gt;,&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;color:#333333;&quot;&gt;对于去皱及抗衰老特别适用。&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;color:#333333;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;color:#333333;&quot;&gt;产品功效：含人参皂甙，增强胶原纤维和弹力纤维的功效，使皮肤紧实、富有光泽、改善皱纹；小麦蛋白极佳抗氧化和活肤效果，直接保护和激活细胞活力；高效保湿，有效预防肌肤衰老和干燥，锁住青春，永葆肌肤水嫩。&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;color:#333333;&quot;&gt;&lt;/span&gt;&lt;/pre&gt;', '大红参：适合肤质：适合各类肌肤,对于去皱及抗衰老特别适用。 产品功效：含人参皂甙，增强胶原纤维和弹力纤维的功效，使皮肤紧实、富有光泽、改善皱纹；小麦蛋白极佳抗氧化和活肤效果，直接保护和激活细胞活力；高效保湿，有效预防肌肤衰老和干燥，锁住青春，永葆肌肤水嫩。', '', '');
INSERT INTO `js_product_description` VALUES ('168', '3', '金元宝电热锅YL-A4', '<p>	<span style=\"font-family:宋体;\">金元宝电热锅：炒、煮、蒸、煎、炸、炖</span> <span style=\"font-family:宋体;\">全能一体锅，买一只依灵多功能电热锅，相当于同时购买了电饭锅、不粘锅、电炒锅、电磁炉、蒸锅、电饼铛，买一锅等于买六锅！超级实用！</span></p>', '金元宝电热锅：炒、煮、蒸、煎、炸、炖 全能一体锅，买一只依灵多功能电热锅，相当于同时购买了电饭锅、不粘锅、电炒锅、电磁炉、蒸锅、电饼铛，买一锅等于买六锅！超级实用！', '', '');
INSERT INTO `js_product_description` VALUES ('169', '3', '韩式电热锅YL-A1', '<p>	<span style=\"font-family:宋体;\">韩版电热锅：产品性能稳定、热效率高、省时、省电、使用方便，具有安全、卫生、无毒、无味、美观大方等特点。铝锅传热效能高，传热均匀，发热管选用优质材料，发热均匀并且耐用。透明强化玻璃盖，便于观察。锅内温度任意调节，干烧自动断电。工艺精湛，造型美观。</span></p>', '韩版电热锅：产品性能稳定、热效率高、省时、省电、使用方便，具有安全、卫生、无毒、无味、美观大方等特点。铝锅传热效能高，传热均匀，发热管选用优质材料，发热均匀并且耐用。透明强化玻璃盖，便于观察。锅内温度任意调节，干烧自动断电。工艺精湛，造型美观。', '', '');
INSERT INTO `js_product_description` VALUES ('170', '3', '韩式电热锅YL-A3', '<p>	<span style=\"font-family:宋体;\">韩版电热锅：产品性能稳定、热效率高、省时、省电、使用方便，具有安全、卫生、无毒、无味、美观大方等特点。铝锅传热效能高，传热均匀，发热管选用优质材料，发热均匀并且耐用。透明强化玻璃盖，便于观察。锅内温度任意调节，干烧自动断电。工艺精湛，造型美观。</span></p>', '韩版电热锅：产品性能稳定、热效率高、省时、省电、使用方便，具有安全、卫生、无毒、无味、美观大方等特点。铝锅传热效能高，传热均匀，发热管选用优质材料，发热均匀并且耐用。透明强化玻璃盖，便于观察。锅内温度任意调节，干烧自动断电。工艺精湛，造型美观。', '', '');
INSERT INTO `js_product_description` VALUES ('234', '1', '凤凰单枞署来', '&lt;p style=&quot;background:white;&quot;&gt;	&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;凤凰单纵署来：&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-family:宋体;color:#333333;&quot;&gt;单枞茶&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-family:Arial;color:#333333;&quot;&gt;&nbsp;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#333333;&quot;&gt;单枞茶，属半发酵的乌龙茶系，条形细长、紧索，呈青褐色、红褐色或暗褐色，主产于广东省潮州市。潮州境内又分三个产区：潮安县的凤凰镇、铁铺镇，饶平县。其中以凤凰镇的茶叶最负盛名，因此单枞茶又被称为凤凰单枞或凤凰茶。&lt;/span&gt;&lt;span style=&quot;font-family:Arial;color:#333333;&quot;&gt;&lt;/span&gt;&lt;/p&gt;', '凤凰单纵署来：单枞茶 单枞茶，属半发酵的乌龙茶系，条形细长、紧索，呈青褐色、红褐色或暗褐色，主产于广东省潮州市。潮州境内又分三个产区：潮安县的凤凰镇、铁铺镇，饶平县。其中以凤凰镇的茶叶最负盛名，因此单枞茶又被称为凤凰单枞或凤凰茶。', '', '');
INSERT INTO `js_product_description` VALUES ('171', '3', '韩式电热锅A6', '<p>	<span style=\"font-family:宋体;\">韩版电热锅：产品性能稳定、热效率高、省时、省电、使用方便，具有安全、卫生、无毒、无味、美观大方等特点。铝锅传热效能高，传热均匀，发热管选用优质材料，发热均匀并且耐用。透明强化玻璃盖，便于观察。锅内温度任意调节，干烧自动断电。工艺精湛，造型美观。</span></p>', '韩版电热锅：产品性能稳定、热效率高、省时、省电、使用方便，具有安全、卫生、无毒、无味、美观大方等特点。铝锅传热效能高，传热均匀，发热管选用优质材料，发热均匀并且耐用。透明强化玻璃盖，便于观察。锅内温度任意调节，干烧自动断电。工艺精湛，造型美观。', '', '');
INSERT INTO `js_product_description` VALUES ('246', '1', '粉蜗牛', '&lt;b&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;粉蜗牛：&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;background:white;&quot;&gt;功效：保湿&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Tahoma;color:#333333;background:white;&quot;&gt;,&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;background:white;&quot;&gt;补水&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Tahoma;color:#333333;background:white;&quot;&gt;,&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;background:white;&quot;&gt;提拉紧致&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Tahoma;color:#333333;background:white;&quot;&gt;,&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;background:white;&quot;&gt;抗皱&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Tahoma;color:#333333;background:white;&quot;&gt;,&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;background:white;&quot;&gt;抗衰老&lt;/span&gt;', '粉蜗牛：功效：保湿,补水,提拉紧致,抗皱,抗衰老', '', '');
INSERT INTO `js_product_description` VALUES ('241', '1', '面膜', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('242', '1', '小蜗牛', '&lt;p style=&quot;margin-left:63.0pt;background:white;&quot;&gt;	&lt;b&gt;小蜗牛：&lt;/b&gt;&lt;span style=&quot;font-size:10.0pt;color:#333333;&quot;&gt;蜗牛粘液过滤物（粘蛋白：&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;font-family:Tahoma;color:#333333;&quot;&gt;Mucin&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;color:#333333;&quot;&gt;）和植物干细胞（植物性干细胞：&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;font-family:Tahoma;color:#333333;&quot;&gt;Phyto stem cell)&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;color:#333333;&quot;&gt;的&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;font-family:Tahoma;color:#333333;&quot;&gt;6&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;color:#333333;&quot;&gt;种&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;font-family:Tahoma;color:#333333;&quot;&gt;Complex&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;color:#333333;&quot;&gt;按照适当的比例配比，最为第一道程序涂抹于面部。可以为肌肤提供充足的营养和水分，天然的&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;font-family:Tahoma;color:#333333;&quot;&gt;Aroma oil&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;color:#333333;&quot;&gt;为敏感的肌肤抵抗外界刺激提供保障、出色的修复和保湿效果，仅仅只使用化妆水也能得到充分的补水效果。&lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:Tahoma;color:#333333;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;background:white;&quot;&gt;	&lt;span style=&quot;font-size:10.0pt;color:#333333;&quot;&gt;蜗牛粘液过滤物（粘蛋白：&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;font-family:Tahoma;color:#333333;&quot;&gt;Mucin&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;color:#333333;&quot;&gt;）和植物干细胞（植物性干细胞：&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;font-family:Tahoma;color:#333333;&quot;&gt;Phyto stemcell)6&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;color:#333333;&quot;&gt;种&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;font-family:Tahoma;color:#333333;&quot;&gt;Complex&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;color:#333333;&quot;&gt;按照适当的比例配比，最为第二道程序涂抹于面部。蜗牛粘液过滤物和植物干细胞&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;font-family:Tahoma;color:#333333;&quot;&gt;Complex&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;color:#333333;&quot;&gt;可以提升因外界环境的刺激而变得干燥的肌肤的柔软性，提供充分的营养和水分，令肌肤水水嫩嫩；天然的&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;font-family:Tahoma;color:#333333;&quot;&gt;Aroma oil&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;color:#333333;&quot;&gt;为敏感的肌肤抵抗外界刺激提供保障。&lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:Tahoma;color:#333333;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;background:white;&quot;&gt;	&lt;span style=&quot;font-size:10.0pt;color:#333333;&quot;&gt;作为含有&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;font-family:Tahoma;color:#333333;&quot;&gt;30%&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;color:#333333;&quot;&gt;蜗牛粘液过滤物（粘蛋白：&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;font-family:Tahoma;color:#333333;&quot;&gt;Mucin&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;color:#333333;&quot;&gt;）和植物干细胞（植物性干细胞：&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;font-family:Tahoma;color:#333333;&quot;&gt;Phyto stemcell)&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;color:#333333;&quot;&gt;的&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;font-family:Tahoma;color:#333333;&quot;&gt;6&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;color:#333333;&quot;&gt;种&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;font-family:Tahoma;color:#333333;&quot;&gt;COMPLEX&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;color:#333333;&quot;&gt;按照适当的比例配比，同时含有令肌肤恢复弹性的腺苷（&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;font-family:Tahoma;color:#333333;&quot;&gt;Adenosine)&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;color:#333333;&quot;&gt;的第三道程序涂抹于面部。提升已经松弛的面部肌肤，天然的&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;font-family:Tahoma;color:#333333;&quot;&gt;Aroma oil &lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;color:#333333;&quot;&gt;为敏感的肌肤抵抗外界刺激提供保障。&lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:Tahoma;color:#333333;&quot;&gt;&lt;/span&gt;&lt;/p&gt;', '小蜗牛：蜗牛粘液过滤物（粘蛋白：Mucin）和植物干细胞（植物性干细胞：Phyto stem cell)的6种Complex按照适当的比例配比，最为第一道程序涂抹于面部。可以为肌肤提供充足的营养和水分，天然的Aroma oil为敏感的肌肤抵抗外界刺激提供保障、出色的修复和保湿效果，仅仅只使用化妆水也能得到充分的补水效果。', '', '');
INSERT INTO `js_product_description` VALUES ('172', '3', '韩版电煎锅', '<span style=\"font-size:10.5pt;font-family:宋体;\">韩版电煎锅：１．采用最新压铸工艺，解决拉伸锅锅体变形烦恼。锅底压花，喷涂不粘层、煎、烤、炸、炒食物不粘锅、易清洗．传热均匀，使用无有烟。</span><span style=\"font-size:10.5pt;font-family:&quot;\"><br /></span><span style=\"font-size:10.5pt;font-family:宋体;\">２．加热快，锅内可到的温度区域大．锅内最高温度可达到３００℃，可以适应各种烹调技法所需的温度要求．</span><span style=\"font-size:10.5pt;font-family:&quot;\"><br /></span><span style=\"font-size:10.5pt;font-family:宋体;\">３．产品整体设计，带有浓郁的韩式风格，豪华大方．锅盖采用强化玻璃钢盖，可随时观察锅内食物烹饪的情况．贴心的耐高温手柄，保证您不会因为锅内的高温，对您的手有丝毫损伤．整体结构小巧玲珑，占用空间少</span>', '韩版电煎锅：１．采用最新压铸工艺，解决拉伸锅锅体变形烦恼。锅底压花，喷涂不粘层、煎、烤、炸、炒食物不粘锅、易清洗．传热均匀，使用无有烟。 ２．加热快，锅内可到的温度区域大．锅内最高温度可达到３００℃，可以适应各种烹调技法所需的温度要求． ３．产品整体设计，带有浓郁的韩式风格，豪华大方．锅盖采用强化玻璃钢盖，可随时观察锅内食物烹饪的情况．贴心的耐高温手柄，保证您不会因为锅内的高温，对您的手有丝毫损伤．整体结构小巧玲珑，占用空间少', '', '');
INSERT INTO `js_product_description` VALUES ('227', '1', '干白', '&lt;span style=&quot;font-size:10.0pt;font-family:&quot;color:#CC0000;&quot;&gt;Aldoba&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;font-family:宋体;color:black;&quot;&gt;即&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;font-family:宋体;color:#CC0000;&quot;&gt;干白&lt;/span&gt;&lt;span style=&quot;font-size:10.0pt;font-family:宋体;color:black;&quot;&gt;葡萄酒，是用白皮白肉或红皮白肉的葡萄经去皮发酵而成，这类酒的颜色以黄色调为主，主要有近似无色、微黄带绿、浅黄色、禾杆黄色、金黄色等，糖分含量非常低。&lt;/span&gt;', 'Aldoba即干白葡萄酒，是用白皮白肉或红皮白肉的葡萄经去皮发酵而成，这类酒的颜色以黄色调为主，主要有近似无色、微黄带绿、浅黄色、禾杆黄色、金黄色等，糖分含量非常低。', '青岛 干白 商贸 葡萄酒', '');
INSERT INTO `js_product_description` VALUES ('228', '1', '梅鹿辄干红葡萄酒（95珍藏版）', '&lt;p style=&quot;text-indent:15.75pt;&quot;&gt;	&lt;span style=&quot;font-family:Arial;background-color:white;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;background-color:white;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;梅鹿辄干红葡萄酒（95珍藏版）&lt;/span&gt;本产品呈宝石红色，有亚洲辛香料和木莓的香气，口感美妙柔滑，带有纯净而高贵的成熟单宁味，及带有淡雅的果香味。&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;background-color:white;&quot;&gt;选用法国著名葡萄产区栽培的国际酿酒名种葡萄&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;background-color:white;&quot;&gt;-&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;background-color:white;&quot;&gt;梅乐为主要原料，采用先进的生产设备和传统的酿造工艺，有效的浸提葡萄中的优质单宁、色素及其他成分，并经窖藏酿造而成&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;background-color:white;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;font-family:Arial;background-color:white;&quot;&gt;&lt;/span&gt; &lt;/p&gt;', ' 梅鹿辄干红葡萄酒（95珍藏版）本产品呈宝石红色，有亚洲辛香料和木莓的香气，口感美妙柔滑，带有纯净而高贵的成熟单宁味，及带有淡雅的果香味。选用法国著名葡萄产区栽培的国际酿酒名种葡萄-梅乐为主要原料，采用先进的生产设备和传统的酿造工艺，有效的浸提葡萄中的优质单宁、色素及其他成分，并经窖藏酿造而成', '', '');
INSERT INTO `js_product_description` VALUES ('173', '3', '五味香厨炒锅', '<p>	<span style=\"font-family:宋体;\">五味香厨炒锅：</span></p><p>	<span style=\"font-family:宋体;\">爆炒王炒锅：锅身经高压冷泉技术硬质氧化处理，抗刮耐磨，锅体内表面陶晶不沾处理，安全健康。可立宽边玻璃盖，健康美味看得见，隔热防烫硅胶手柄配置，安全舒适好把握。高强度导磁片复底，适用于电磁炉，煤气炉，电炉，电陶炉等</span></p>', '五味香厨炒锅： 爆炒王炒锅：锅身经高压冷泉技术硬质氧化处理，抗刮耐磨，锅体内表面陶晶不沾处理，安全健康。可立宽边玻璃盖，健康美味看得见，隔热防烫硅胶手柄配置，安全舒适好把握。高强度导磁片复底，适用于电磁炉，煤气炉，电炉，电陶炉等', '', '');
INSERT INTO `js_product_description` VALUES ('174', '3', '爆炒王炒锅', '<p>	<span style=\"font-family:宋体;\">爆炒王炒锅：锅身经高压冷泉技术硬质氧化处理，抗刮耐磨，锅体内表面陶晶不沾处理，安全健康。可立宽边玻璃盖，健康美味看得见，隔热防烫硅胶手柄配置，安全舒适好把握。高强度导磁片复底，适用于电磁炉，煤气炉，电炉，电陶炉等</span> </p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('175', '3', '纯棉四件套', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('176', '3', '五件套冰丝席', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('177', '3', '撞色黑白', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('178', '3', '上海多米乐', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('179', '3', '印花线边四件套', '被套200*230+-3cm床单230*250+-3cm枕套45*75cm、<br />江苏南通', '', '', '');
INSERT INTO `js_product_description` VALUES ('180', '3', '天丝四件套', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('181', '3', '花海天空', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('182', '3', '裸婚时代', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('183', '3', '荞麦枕一对', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('184', '3', '丝枕', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('239', '1', '金骏眉醇之味', '&lt;p style=&quot;margin-left:18.0pt;text-indent:-18.0pt;&quot;&gt;	&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;金骏眉醇之味：&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:9.0pt;font-family:宋体;background:white;&quot;&gt;金骏眉&lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:Arial;background:white;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:宋体;background:white;&quot;&gt;味道醇厚&lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:Arial;background:white;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:宋体;background:white;&quot;&gt;甘甜宜人&lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:Arial;background:white;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:宋体;background:white;&quot;&gt;相较于一般的红茶&lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:Arial;background:white;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:宋体;background:white;&quot;&gt;金骏眉更甘甜淡爽&lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:Arial;background:white;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:宋体;background:white;&quot;&gt;也没有那么涩嘴&lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:Arial;background:white;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:宋体;background:white;&quot;&gt;回味爽滑&lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:Arial;background:white;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:宋体;background:white;&quot;&gt;香不绝口&lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:Arial;background:white;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:宋体;background:white;&quot;&gt;且是带着果香的&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/p&gt;', '金骏眉醇之味：金骏眉 味道醇厚 甘甜宜人 相较于一般的红茶 金骏眉更甘甜淡爽 也没有那么涩嘴 回味爽滑 香不绝口 且是带着果香的', '', '');
INSERT INTO `js_product_description` VALUES ('229', '1', '卡佰纳干红葡萄酒（95经典窖藏）', '&lt;b&gt;&lt;span style=&quot;font-size:10.5pt;font-family:;&quot; &quot;=&quot;&quot;&gt; &lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;卡佰纳干红葡萄酒（95经典窖藏）&lt;/span&gt;本产品是选用国际酿酒名种葡萄&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:;&quot; &quot;=&quot;&quot;&gt;-&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;赤霞珠为主的几种优质葡萄品种原料，采用先进生产设备和传统的酿造工艺，并经橡木桶窖藏精酿而成。本产品呈深紫红色，果香浓郁而丰富多样，十分怡人，木香和果酸交相辉映，留香较长，质感柔滑精致&lt;/span&gt;', ' 卡佰纳干红葡萄酒（95经典窖藏）本产品是选用国际酿酒名种葡萄-赤霞珠为主的几种优质葡萄品种原料，采用先进生产设备和传统的酿造工艺，并经橡木桶窖藏精酿而成。本产品呈深紫红色，果香浓郁而丰富多样，十分怡人，木香和果酸交相辉映，留香较长，质感柔滑精致', '', '');
INSERT INTO `js_product_description` VALUES ('230', '1', ' 赤霞珠干红葡萄酒（05尊爵）', '&lt;p&gt;	&lt;b&gt;&nbsp;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;赤霞珠干红葡萄酒（&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span&gt;05&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;尊爵）&lt;/span&gt;&lt;/b&gt;&lt;b&gt; &lt;/b&gt;&lt;span style=&quot;font-family:Arial;background-color:white;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent:15.75pt;&quot;&gt;	&lt;span style=&quot;font-family:Arial;background-color:white;&quot;&gt;&nbsp;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;background-color:white;&quot;&gt;本产品呈深宝石红色，香气浓郁、优雅、散发着单宁的芬芳和可可树细腻的清香，口感和谐醇厚。选用法国著名葡萄产区栽培的国际酿酒名种葡萄&lt;/span&gt;&lt;span style=&quot;font-family:Arial;background-color:white;&quot;&gt;-&lt;/span&gt;&lt;span style=&quot;font-family:宋体;background-color:white;&quot;&gt;赤霞珠为原料，采用先进的生产设备和传统的酿造工艺，有效的浸提葡萄中的优质单宁、色素及其他成分，并经窖藏酿造而成。&lt;/span&gt;&lt;span style=&quot;font-family:Arial;background-color:white;&quot;&gt;&lt;/span&gt;&lt;/p&gt;', ' 赤霞珠干红葡萄酒（05尊爵）   本产品呈深宝石红色，香气浓郁、优雅、散发着单宁的芬芳和可可树细腻的清香，口感和谐醇厚。选用法国著名葡萄产区栽培的国际酿酒名种葡萄-赤霞珠为原料，采用先进的生产设备和传统的酿造工艺，有效的浸提葡萄中的优质单宁、色素及其他成分，并经窖藏酿造而成。', '', '');
INSERT INTO `js_product_description` VALUES ('185', '3', '蚕丝被', '<table style=\"width:790px;\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" width=\"790\">	<tbody>		<tr>			<td style=\"width:136px;height:25px;\">				<p align=\"center\">					&nbsp;				</p>			</td>			<td style=\"width:586px;height:25px;\">				<p align=\"left\">					&nbsp;				</p>			</td>		</tr>		<tr>			<td style=\"width:136px;height:32px;\">				<p align=\"center\">					商&nbsp;品&nbsp;名&nbsp;称				</p>			</td>			<td style=\"width:586px;height:32px;\">				<p align=\"left\">					蚕丝被				</p>			</td>		</tr>		<tr>			<td style=\"width:136px;height:20px;\">				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 货号			</td>			<td style=\"width:586px;height:20px;\">				<p align=\"left\">					WJ0012A				</p>			</td>		</tr>		<tr>			<td style=\"width:136px;height:20px;\">			</td>			<td style=\"width:586px;height:20px;\">				<p align=\"left\">					双人				</p>			</td>		</tr>		<tr>			<td style=\"width:136px;height:22px;\">			</td>			<td style=\"width:586px;height:22px;\">				<p align=\"left\">					&nbsp;				</p>			</td>		</tr>		<tr>			<td style=\"width:136px;height:78px;\">				<p align=\"center\">					产&nbsp;品&nbsp;重&nbsp;量				</p>			</td>			<td style=\"width:586px;height:78px;\">				<p align=\"left\">					&nbsp;4-5斤备注：产品重量为样品中抽取称重，由于产品不同可能重量存在小误差，介意者慎拍。				</p>				<p align=\"left\">					本店被芯存在±5cm的误差，不属于质量问题，符合国家统一标准，介意者慎拍。				</p>			</td>		</tr>		<tr>			<td style=\"width:136px;height:45px;\">				<p align=\"center\">					洗&nbsp;涤&nbsp;说&nbsp;明				</p>			</td>			<td style=\"width:586px;height:45px;\">				<p style=\"margin-left:9.05pt;\" align=\"left\">					不可水洗，不可漂白，不可熨烫，不可干洗，请勿接触锐器或用力撕拉				</p>			</td>		</tr>		<tr>			<td style=\"width:136px;height:70px;\">				<p align=\"center\">					温&nbsp;馨&nbsp;提&nbsp;示				</p>			</td>			<td style=\"width:586px;height:70px;\">				<p align=\"left\">					1芯类产品尽可能不要洗涤，如有需要洗涤，请根据产品洗涤标识洗涤。建议局部洗涤并选择柔和洗涤。				</p>				<p align=\"left\">					2存放选择干燥处，避免受潮发霉。				</p>				<p align=\"left\">					3具体说明请参考产品水洗标				</p>			</td>		</tr>	</tbody></table>', '', '', '');
INSERT INTO `js_product_description` VALUES ('233', '1', '凤凰单枞水仙', '&lt;b&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;凤凰单枞水仙：&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;凤凰水仙品种分布于广东&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;&quot;&gt;&lt;a href=&quot;http://baike.baidu.com/view/82690.htm&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-family:宋体;color:windowtext;text-decoration:none;&quot;&gt;潮安&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;、饶平、丰顺、焦岭、平远等县，为有性群体，小乔木型，主于粗，分枝粗壮较疏，较直立或半开展。大部分植株分校离地约&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;&quot;&gt; 20&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;～&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;&quot;&gt;40&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;厘米，叶多水平略向上着生。叶型大，呈长椭圆形或椭圆形，多数平展或略向叶面卷，色泽绿，有油光，或淡绿欠油光，先端多突尖，叶尖下垂，略似鸟嘴，因此当地农民称之为&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;&quot;&gt;&ldquo;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;乌嘴茶&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;&quot;&gt;&rdquo;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;，叶的锯齿浅疏尚明，嫩芽梢多淡绿而少毫。从叶片结构看，凤凰水仙比&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;&quot;&gt;&lt;a href=&quot;http://baike.baidu.com/view/3523779.htm&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-family:宋体;color:windowtext;text-decoration:none;&quot;&gt;福建水仙&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;品种更接近于野生型，抗逆性强。凤凰水仙植株较高大，树姿较直立，分枝较稀。叶片呈稍上斜状着生。叶长椭圆或椭圆形，叶面较平，叶身稍内折。春茶&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;&quot;&gt;3&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;月&lt;span style=&quot;color:#333333;&quot;&gt;下旬萌发，一&lt;b&gt;芽三叶&lt;/b&gt;盛期在&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;color:#333333;&quot;&gt;4&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;&quot;&gt;月中旬，百芽重&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;color:#333333;&quot;&gt;86.2&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;&quot;&gt;克，芽叶肥壮，少茸毛，淡绿色。结实力较强。产量高，最高亩产达&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;color:#333333;&quot;&gt;400&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;&quot;&gt;千克。&lt;/span&gt;', '凤凰单枞水仙：凤凰水仙品种分布于广东潮安、饶平、丰顺、焦岭、平远等县，为有性群体，小乔木型，主于粗，分枝粗壮较疏，较直立或半开展。大部分植株分校离地约 20～40厘米，叶多水平略向上着生。叶型大，呈长椭圆形或椭圆形，多数平展或略向叶面卷，色泽绿，有油光，或淡绿欠油光，先端多突尖，叶尖下垂，略似鸟嘴，因此当地农民称之为&ldquo;乌嘴茶&rdquo;，叶的锯齿浅疏尚明，嫩芽梢多淡绿而少毫。从叶片结构看，凤凰水仙比福建水仙品种更接近于野生型，抗逆性强。凤凰水仙植株较高大，树姿较直立，分枝较稀。叶片呈稍上斜状', '', '');
INSERT INTO `js_product_description` VALUES ('232', '1', '大红袍水仙', '&lt;b&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;大红袍水仙：&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;background:white;&quot;&gt;大红袍，字面诠释是大红色的衣袍。一般用作红色植物的比喻和代称，最著名的是茶叶大红袍，产于福建&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&quot;&quot;&gt;&lt;a href=&quot;http://baike.baidu.com/view/20069.htm&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-family:宋体;color:#136EC2;background:white;text-decoration:none;&quot;&gt;&lt;span&gt;武夷山&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;background:white;&quot;&gt;，属&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&quot;&quot;&gt;&lt;a href=&quot;http://baike.baidu.com/view/37254.htm&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-family:宋体;color:#136EC2;background:white;text-decoration:none;&quot;&gt;&lt;span&gt;武夷岩茶&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;background:white;&quot;&gt;，是中国十大名茶之一。品质优异。另外有与大红袍同名的豆科植物&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;color:#333333;background:white;&quot;&gt;&ldquo;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;background:white;&quot;&gt;扁皂角&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;color:#333333;background:white;&quot;&gt;&rdquo;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;background:white;&quot;&gt;；浙江余杭等地的主栽桔子品种；京剧传统剧目；同名商标如甘肃省东乡县名牌花椒；&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&quot;&quot;&gt;&lt;a href=&quot;http://baike.baidu.com/view/4194.htm&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-family:宋体;color:#136EC2;background:white;text-decoration:none;&quot;&gt;&lt;span&gt;霹雳布袋戏&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;color:#333333;background:white;&quot;&gt;虚拟人物等。&lt;/span&gt;', '4》	大红袍水仙：大红袍，字面诠释是大红色的衣袍。一般用作红色植物的比喻和代称，最著名的是茶叶大红袍，产于福建武夷山，属武夷岩茶，是中国十大名茶之一。品质优异。另外有与大红袍同名的豆科植物&ldquo;扁皂角&rdquo;；浙江余杭等地的主栽桔子品种；京剧传统剧目；同名商标如甘肃省东乡县名牌花椒；霹雳布袋戏虚拟人物等。', '', '');
INSERT INTO `js_product_description` VALUES ('186', '3', '红豆家纺', '<table style=\"width:790px;\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" width=\"790\">	<tbody>		<tr>			<td style=\"width:136px;height:25px;\">				<p align=\"center\">					品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;牌				</p>			</td>			<td style=\"width:586px;height:25px;\">				<p align=\"left\">					红豆家纺				</p>			</td>		</tr>		<tr>			<td style=\"width:136px;height:32px;\">				<p align=\"center\">					商&nbsp;品&nbsp;名&nbsp;称				</p>			</td>			<td style=\"width:586px;height:32px;\">				<p align=\"left\">					蚕丝被				</p>			</td>		</tr>		<tr>			<td style=\"width:136px;height:20px;\">				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 货号			</td>			<td style=\"width:586px;height:20px;\">				<p align=\"left\">					WJ0011A				</p>			</td>		</tr>		<tr>			<td style=\"width:136px;height:20px;\">			</td>			<td style=\"width:586px;height:20px;\">				<p align=\"left\">					双人				</p>			</td>		</tr>		<tr>			<td style=\"width:136px;height:22px;\">			</td>			<td style=\"width:586px;height:22px;\">				<p align=\"left\">					&nbsp;				</p>			</td>		</tr>		<tr>			<td style=\"width:136px;height:78px;\">				<p align=\"center\">					产&nbsp;品&nbsp;重&nbsp;量				</p>			</td>			<td style=\"width:586px;height:78px;\">				<p align=\"left\">					&nbsp;4-5斤备注：产品重量为样品中抽取称重，由于产品不同可能重量存在小误差，介意者慎拍。				</p>				<p align=\"left\">					本店被芯存在±5cm的误差，不属于质量问题，符合国家统一标准，介意者慎拍。				</p>			</td>		</tr>		<tr>			<td style=\"width:136px;height:45px;\">				<p align=\"center\">					洗&nbsp;涤&nbsp;说&nbsp;明				</p>			</td>			<td style=\"width:586px;height:45px;\">				<p style=\"margin-left:9.05pt;\" align=\"left\">					不可水洗，不可漂白，不可熨烫，不可干洗，请勿接触锐器或用力撕拉				</p>			</td>		</tr>		<tr>			<td style=\"width:136px;height:70px;\">				<p align=\"center\">					温&nbsp;馨&nbsp;提&nbsp;示				</p>			</td>			<td style=\"width:586px;height:70px;\">				<p align=\"left\">					1芯类产品尽可能不要洗涤，如有需要洗涤，请根据产品洗涤标识洗涤。建议局部洗涤并选择柔和洗涤。				</p>				<p align=\"left\">					2存放选择干燥处，避免受潮发霉。				</p>				<p align=\"left\">					3具体说明请参考产品水洗标				</p>			</td>		</tr>	</tbody></table><p>	<img src=\"http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif\" _ks_lazy_width=\"85\" _ks_lazy_height=\"85\" /></p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('187', '3', '精品四件套', '被套200*230cm床单1.8枕套50*80cm<p>	江苏南通</p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('188', '3', '活性芦荟棉四件套', '<ul>	被套200*230cm床单230*240cm枕套50*80cm&nbsp;	<li>		江苏南通	</li></ul>', '', '', '');
INSERT INTO `js_product_description` VALUES ('189', '3', '茶道KT-302A红色', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('190', '3', '茶道KT-301A白色', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('191', '3', '獭兔皮草', '黑色 中长版', '', '', '');
INSERT INTO `js_product_description` VALUES ('192', '3', '貂皮皮草', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('193', '3', '金漢', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('194', '3', '赛欧美琳', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('195', '3', '百卉红T恤', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('196', '3', '火金蝶', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('197', '3', '大红鹰305', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('198', '3', '大红鹰127-9', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('199', '3', '名格鸟V领', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('200', '3', '百卉红长', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('201', '3', '百卉红中', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('202', '3', '韵蝶长', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('203', '3', '韵蝶中', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('204', '3', '钥匙包', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('205', '3', '女包', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('231', '1', '赤霞珠干红葡萄酒（08庄园之星）', '&lt;p style=&quot;text-indent:10.45pt;&quot;&gt;	&lt;b&gt;&lt;span style=&quot;font-family:宋体;background-color:white;&quot;&gt;赤霞珠干红葡萄酒（&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-family:Arial;background-color:white;&quot;&gt;08&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-family:宋体;background-color:white;&quot;&gt;庄园之星）&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-family:Arial;background-color:white;&quot;&gt;&lt;/span&gt;&lt;/b&gt;&lt;/p&gt;&lt;b&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;background-color:white;&quot;&gt;&nbsp; &lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;background-color:white;&quot;&gt;本产品呈深宝石红色，香气浓郁、优雅、散发着单宁的芬芳和可可树细腻的清香，口感和谐醇厚。选用法国著名葡萄产区栽培的国际酿酒名种葡萄&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:Arial;background-color:white;&quot;&gt;-&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;background-color:white;&quot;&gt;赤霞珠为原料，采用先进的生产设备和传统的酿造工艺，有效的浸提葡萄中的优质单宁、色素及其他成分，并经窖藏酿造而成&lt;/span&gt;', '赤霞珠干红葡萄酒（08庄园之星）   本产品呈深宝石红色，香气浓郁、优雅、散发着单宁的芬芳和可可树细腻的清香，口感和谐醇厚。选用法国著名葡萄产区栽培的国际酿酒名种葡萄-赤霞珠为原料，采用先进的生产设备和传统的酿造工艺，有效的浸提葡萄中的优质单宁、色素及其他成分，并经窖藏酿造而成', '', '');
INSERT INTO `js_product_description` VALUES ('206', '3', 'LV包', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('207', '3', '阿玛尼钱包', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('208', '3', '女士钱包', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('209', '3', '女士钱包', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('210', '3', '酷奇男士手包', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('211', '3', '手编织钱包', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('212', '3', '带盒Bogesi钱包', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('213', '3', '男士钱夹', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('214', '3', '阿玛尼钱包', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('215', '3', '带盒老爷车钱夹', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('216', '3', '数码经络治疗仪', '<p>	<span style=\"font-family:宋体;\">数码经络治疗仪：数码经络治疗仪是根据物理学、仿生学、生物电学、传统中医经络学原理结合大量临床实践，采用现代微电子技术研制开发的最新一代保健精品。它不仅具有针灸、捶击、按摩、火罐、推拿、刮痧、瘦身等多种功能，还具有独一无二的免疫调节功能，并且独创性地研制出常温红外频谱电极，使治疗作用更加深入，功力更加深厚，效果更加美妙。</span></p>', '数码经络治疗仪：数码经络治疗仪是根据物理学、仿生学、生物电学、传统中医经络学原理结合大量临床实践，采用现代微电子技术研制开发的最新一代保健精品。它不仅具有针灸、捶击、按摩、火罐、推拿、刮痧、瘦身等多种功能，还具有独一无二的免疫调节功能，并且独创性地研制出常温红外频谱电极，使治疗作用更加深入，功力更加深厚，效果更加美妙。', '', '');
INSERT INTO `js_product_description` VALUES ('217', '3', '磁疗颈椎摩枕', '<p>	<span style=\"font-family:宋体;\">磁疗颈椎按摩枕：舒适经络、平衡阴阳，补充肌体磁性、增强细胞活力，降低血液粘度、改善血脂代谢，清除精神疲劳、打造深度睡眠，处进血液循环、提高免疫能力，休息时呵护头颈部、保持正确坐姿，避免脖子扭伤</span></p>', '磁疗颈椎按摩枕：舒适经络、平衡阴阳，补充肌体磁性、增强细胞活力，降低血液粘度、改善血脂代谢，清除精神疲劳、打造深度睡眠，处进血液循环、提高免疫能力，休息时呵护头颈部、保持正确坐姿，避免脖子扭伤', '', '');
INSERT INTO `js_product_description` VALUES ('218', '3', '颈肩乐养生按摩器', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('219', '3', '推脂按摩机', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('225', '1', '蜜迪雪颜果饮', '=&quot;left&quot;&gt;	&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;font-family:microsoft yahei;&quot;&gt;&lt;span&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;span style=&quot;color:#000000;&quot;&gt;&lt;span style=&quot;font-family:&#039;microsoft yahei&#039;;color:#ff0000;font-size:large;&quot;&gt;&lt;span style=&quot;line-height:36px;&quot;&gt;&lt;span style=&quot;font-family:宋体;letter-spacing:0.4pt;color:black;font-size:12pt;&quot;&gt;随着年龄的增长和紫外线、自由基等的侵害，女性在&lt;span&gt;25&lt;/span&gt;岁后，合成新的胶原蛋白的能力逐渐下降，肌肤就会因胶原蛋白的流失、变质，而使皮肤变得松弛、缺水、敏感、晦暗，容易产生细纹、色斑和毛孔粗大，使身体逐渐呈老化趋势。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt; &lt;/p&gt;&lt;p style=&quot;text-align:left;margin:0cm 0cm 0pt;&quot; align=&quot;left&quot;&gt;	&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;font-family:microsoft yahei;&quot;&gt;&lt;span&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;span style=&quot;color:#000000;&quot;&gt;&lt;span style=&quot;font-family:&#039;microsoft yahei&#039;;color:#ff0000;font-size:large;&quot;&gt;&lt;span style=&quot;line-height:36px;&quot;&gt;&lt;span style=&quot;font-family:宋体;letter-spacing:0.4pt;color:black;font-size:12pt;&quot;&gt;　　胶原蛋白的有&lt;span&gt;6&lt;/span&gt;大作用：紧肤平皱、保湿滋润、恢复皮肤弹性、修复组织、美白淡斑等。胶原蛋白通过表皮进入真皮层组织后，改善松弛的皮肤，收紧皮肤，减少深皱纹、缩小毛孔，使皮肤紧绷且富有弹性。胶原蛋白可以使细胞变得丰满，从而保持肌肤弹性与润泽，维持肌肤细腻光滑，有效防止老化。胶原蛋白能使细胞粘接更紧密，阻止络氨酸转化为黑色素，不给黑色素、毒素藏身之地，令皮肤肤色白暂、色斑淡出。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt; &lt;/p&gt;&lt;p style=&quot;text-align:left;margin:0cm 0cm 0pt;&quot; align=&quot;left&quot;&gt;	&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;font-family:microsoft yahei;&quot;&gt;&lt;span&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;span style=&quot;color:#000000;&quot;&gt;&lt;span style=&quot;font-family:&#039;microsoft yahei&#039;;color:#ff0000;font-size:large;&quot;&gt;&lt;span style=&quot;line-height:36px;&quot;&gt;&lt;span style=&quot;font-family:宋体;letter-spacing:0.4pt;color:black;font-size:12pt;&quot;&gt;胶原蛋白是肌肤弹力组织的主要结构成份之一，有效修补肌肤机能失调所致的问题，如皱纹。所以肌肤内胶原蛋白的多寡直接影响面部肌肤的弹性及光滑度。而且胶原蛋白能强化结缔组织的保湿力，有助于维持肌肤水润饱满&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt; &lt;/p&gt;&lt;p style=&quot;text-align:left;margin:0cm 0cm 0pt;&quot; align=&quot;left&quot;&gt;	&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;font-family:microsoft yahei;&quot;&gt;&lt;span&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;span style=&quot;color:#000000;&quot;&gt;&lt;span style=&quot;font-family:&#039;microsoft yahei&#039;;color:#ff0000;font-size:large;&quot;&gt;&lt;span style=&quot;line-height:36px;&quot;&gt;&lt;span style=&quot;font-family:宋体;letter-spacing:0.4pt;color:black;font-size:12pt;&quot;&gt;真正的护肤之道在于&ldquo;内养外护&rdquo;，不仅要选择正确的外用护肤产品，还需要体内补充高含量、高效能的胶原蛋白，内外兼修，很多肌肤问题改善起来，就容易很多了。&lt;span&gt;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt; &lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('220', '3', '舒乐按摩枕', '<p>	<span style=\"font-family:宋体;\">斐凡舒乐按摩枕：舒乐按摩枕指压按摩、揉捏按摩、红外加热功能，对身体局部按摩达到完美的效果，小巧、时尚的外观的设计，满足家用的同时，考虑到驾车人士的需要，让您在车内也能感受到按摩的乐趣，对身体局部按摩达到完美的效果</span></p>', '斐凡舒乐按摩枕：舒乐按摩枕指压按摩、揉捏按摩、红外加热功能，对身体局部按摩达到完美的效果，小巧、时尚的外观的设计，满足家用的同时，考虑到驾车人士的需要，让您在车内也能感受到按摩的乐趣，对身体局部按摩达到完美的效果', '', '');
INSERT INTO `js_product_description` VALUES ('226', '1', 'MT胶原蛋白粉', '&lt;p&gt;	&lt;span style=&quot;font-family:宋体;&quot;&gt;胶原蛋白粉：&lt;/span&gt;&lt;span&gt;MT&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;胶原蛋白粉是以高纯度小分子胶原蛋白分为原料、采用先进的技术和生产工艺制而成的营养固体饮料。&lt;/span&gt; &lt;/p&gt;', '胶原蛋白粉：MT胶原蛋白粉是以高纯度小分子胶原蛋白分为原料、采用先进的技术和生产工艺制而成的营养固体饮料。', '', '');
INSERT INTO `js_product_description` VALUES ('221', '3', '多功能按摩垫', '<p>	<span style=\"font-family:宋体;\">多功能养生按摩垫</span><span>:</span><span style=\"font-family:宋体;\">消除疲劳，增强免疫力。增强背部皮肤透气性，增进气血循环，成倍提升按摩功效。促进睡眠，改善神经衰弱失眠症。调整血压，血脂高等。防止脑血栓、眩晕、夜尿频多，便秘等。</span></p>', '多功能养生按摩垫:消除疲劳，增强免疫力。增强背部皮肤透气性，增进气血循环，成倍提升按摩功效。促进睡眠，改善神经衰弱失眠症。调整血压，血脂高等。防止脑血栓、眩晕、夜尿频多，便秘等。', '', '');
INSERT INTO `js_product_description` VALUES ('222', '3', '关捷卫士氨糖软骨素', '<p>	&nbsp;</p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('224', '1', '蜜迪胶原蛋白液态饮', '=&quot;left&quot;&gt;	&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;font-family:microsoft yahei;&quot;&gt;&lt;span&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;span style=&quot;color:#000000;&quot;&gt;&lt;span style=&quot;font-family:&#039;microsoft yahei&#039;;color:#ff0000;font-size:large;&quot;&gt;&lt;span style=&quot;line-height:36px;&quot;&gt;&lt;span style=&quot;font-family:宋体;letter-spacing:0.4pt;color:black;font-size:12pt;&quot;&gt;随着年龄的增长和紫外线、自由基等的侵害，女性在&lt;span&gt;25&lt;/span&gt;岁后，合成新的胶原蛋白的能力逐渐下降，肌肤就会因胶原蛋白的流失、变质，而使皮肤变得松弛、缺水、敏感、晦暗，容易产生细纹、色斑和毛孔粗大，使身体逐渐呈老化趋势。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt; &lt;/p&gt;&lt;p style=&quot;text-align:left;margin:0cm 0cm 0pt;&quot; align=&quot;left&quot;&gt;	&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;font-family:microsoft yahei;&quot;&gt;&lt;span&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;span style=&quot;color:#000000;&quot;&gt;&lt;span style=&quot;font-family:&#039;microsoft yahei&#039;;color:#ff0000;font-size:large;&quot;&gt;&lt;span style=&quot;line-height:36px;&quot;&gt;&lt;span style=&quot;font-family:宋体;letter-spacing:0.4pt;color:black;font-size:12pt;&quot;&gt;　　胶原蛋白的有&lt;span&gt;6&lt;/span&gt;大作用：紧肤平皱、保湿滋润、恢复皮肤弹性、修复组织、美白淡斑等。胶原蛋白通过表皮进入真皮层组织后，改善松弛的皮肤，收紧皮肤，减少深皱纹、缩小毛孔，使皮肤紧绷且富有弹性。胶原蛋白可以使细胞变得丰满，从而保持肌肤弹性与润泽，维持肌肤细腻光滑，有效防止老化。胶原蛋白能使细胞粘接更紧密，阻止络氨酸转化为黑色素，不给黑色素、毒素藏身之地，令皮肤肤色白暂、色斑淡出。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt; &lt;/p&gt;&lt;p style=&quot;text-align:left;margin:0cm 0cm 0pt;&quot; align=&quot;left&quot;&gt;	&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;font-family:microsoft yahei;&quot;&gt;&lt;span&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;span style=&quot;color:#000000;&quot;&gt;&lt;span style=&quot;font-family:&#039;microsoft yahei&#039;;color:#ff0000;font-size:large;&quot;&gt;&lt;span style=&quot;line-height:36px;&quot;&gt;&lt;span style=&quot;font-family:宋体;letter-spacing:0.4pt;color:black;font-size:12pt;&quot;&gt;胶原蛋白是肌肤弹力组织的主要结构成份之一，有效修补肌肤机能失调所致的问题，如皱纹。所以肌肤内胶原蛋白的多寡直接影响面部肌肤的弹性及光滑度。而且胶原蛋白能强化结缔组织的保湿力，有助于维持肌肤水润饱满&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt; &lt;/p&gt;&lt;p style=&quot;text-align:left;margin:0cm 0cm 0pt;&quot; align=&quot;left&quot;&gt;	&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;font-family:microsoft yahei;&quot;&gt;&lt;span&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;span style=&quot;color:#000000;&quot;&gt;&lt;span style=&quot;font-family:&#039;microsoft yahei&#039;;color:#ff0000;font-size:large;&quot;&gt;&lt;span style=&quot;line-height:36px;&quot;&gt;&lt;span style=&quot;font-family:宋体;letter-spacing:0.4pt;color:black;font-size:12pt;&quot;&gt;真正的护肤之道在于&ldquo;内养外护&rdquo;，不仅要选择正确的外用护肤产品，还需要体内补充高含量、高效能的胶原蛋白，内外兼修，很多肌肤问题改善起来，就容易很多了。&lt;span&gt;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt; &lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('187', '1', '精品四件套', '被套200*230cm床单1.8枕套50*80cm&lt;p&gt;	江苏南通&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('188', '1', '活性芦荟棉四件套', '&lt;ul&gt;	被套200*230cm床单230*240cm枕套50*80cm&nbsp;	&lt;li&gt;		江苏南通	&lt;/li&gt;&lt;/ul&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('189', '1', '茶道KT-302A红色', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('190', '1', '茶道KT-301A白色', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('191', '1', '獭兔皮草', '黑色 中长版', '', '', '');
INSERT INTO `js_product_description` VALUES ('192', '1', '貂皮皮草', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('193', '1', '金漢', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('194', '1', '赛欧美琳', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('195', '1', '百卉红T恤', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('196', '1', '火金蝶', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('197', '1', '大红鹰305', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('198', '1', '大红鹰127-9', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('199', '1', '名格鸟V领', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('200', '1', '百卉红长', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('201', '1', '百卉红中', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('202', '1', '韵蝶长', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('203', '1', '韵蝶中', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('204', '1', '钥匙包', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('205', '1', '女包', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('206', '1', 'LV包', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('207', '1', '阿玛尼钱包', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('208', '1', '女士钱包', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('209', '1', '女士钱包', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('210', '1', '酷奇男士手包', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('211', '1', '手编织钱包', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('212', '1', '带盒Bogesi钱包', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('213', '1', '男士钱夹', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('214', '1', '阿玛尼钱包', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('215', '1', '带盒老爷车钱夹', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('216', '1', '数码经络治疗仪', '&lt;p&gt;	&lt;span style=&quot;font-family:宋体;&quot;&gt;数码经络治疗仪：数码经络治疗仪是根据物理学、仿生学、生物电学、传统中医经络学原理结合大量临床实践，采用现代微电子技术研制开发的最新一代保健精品。它不仅具有针灸、捶击、按摩、火罐、推拿、刮痧、瘦身等多种功能，还具有独一无二的免疫调节功能，并且独创性地研制出常温红外频谱电极，使治疗作用更加深入，功力更加深厚，效果更加美妙。&lt;/span&gt;&lt;/p&gt;', '数码经络治疗仪：数码经络治疗仪是根据物理学、仿生学、生物电学、传统中医经络学原理结合大量临床实践，采用现代微电子技术研制开发的最新一代保健精品。它不仅具有针灸、捶击、按摩、火罐、推拿、刮痧、瘦身等多种功能，还具有独一无二的免疫调节功能，并且独创性地研制出常温红外频谱电极，使治疗作用更加深入，功力更加深厚，效果更加美妙。', '', '');
INSERT INTO `js_product_description` VALUES ('217', '1', '磁疗颈椎摩枕', '&lt;p&gt;	&lt;span style=&quot;font-family:宋体;&quot;&gt;磁疗颈椎按摩枕：舒适经络、平衡阴阳，补充肌体磁性、增强细胞活力，降低血液粘度、改善血脂代谢，清除精神疲劳、打造深度睡眠，处进血液循环、提高免疫能力，休息时呵护头颈部、保持正确坐姿，避免脖子扭伤&lt;/span&gt;&lt;/p&gt;', '磁疗颈椎按摩枕：舒适经络、平衡阴阳，补充肌体磁性、增强细胞活力，降低血液粘度、改善血脂代谢，清除精神疲劳、打造深度睡眠，处进血液循环、提高免疫能力，休息时呵护头颈部、保持正确坐姿，避免脖子扭伤', '', '');
INSERT INTO `js_product_description` VALUES ('218', '1', '颈肩乐养生按摩器', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('219', '1', '推脂按摩机', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('220', '1', '舒乐按摩枕', '&lt;p&gt;	&lt;span style=&quot;font-family:宋体;&quot;&gt;斐凡舒乐按摩枕：舒乐按摩枕指压按摩、揉捏按摩、红外加热功能，对身体局部按摩达到完美的效果，小巧、时尚的外观的设计，满足家用的同时，考虑到驾车人士的需要，让您在车内也能感受到按摩的乐趣，对身体局部按摩达到完美的效果&lt;/span&gt;&lt;/p&gt;', '斐凡舒乐按摩枕：舒乐按摩枕指压按摩、揉捏按摩、红外加热功能，对身体局部按摩达到完美的效果，小巧、时尚的外观的设计，满足家用的同时，考虑到驾车人士的需要，让您在车内也能感受到按摩的乐趣，对身体局部按摩达到完美的效果', '', '');
INSERT INTO `js_product_description` VALUES ('221', '1', '多功能按摩垫', '&lt;p&gt;	&lt;span style=&quot;font-family:宋体;&quot;&gt;多功能养生按摩垫&lt;/span&gt;&lt;span&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;消除疲劳，增强免疫力。增强背部皮肤透气性，增进气血循环，成倍提升按摩功效。促进睡眠，改善神经衰弱失眠症。调整血压，血脂高等。防止脑血栓、眩晕、夜尿频多，便秘等。&lt;/span&gt;&lt;/p&gt;', '多功能养生按摩垫:消除疲劳，增强免疫力。增强背部皮肤透气性，增进气血循环，成倍提升按摩功效。促进睡眠，改善神经衰弱失眠症。调整血压，血脂高等。防止脑血栓、眩晕、夜尿频多，便秘等。', '', '');
INSERT INTO `js_product_description` VALUES ('222', '1', '关捷卫士氨糖软骨素', '&lt;p&gt;	&nbsp;&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('223', '1', '关捷卫士骨胶原蛋白', '&lt;table class=&quot;ke-zeroborder&quot; border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; width=&quot;740&quot;&gt;	&lt;tbody&gt;		&lt;tr&gt;			&lt;td width=&quot;500&quot;&gt;				&lt;table class=&quot;ke-zeroborder&quot; border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; width=&quot;100%&quot; height=&quot;100%&quot;&gt;					&lt;tbody&gt;						&lt;tr&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; width=&quot;86&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:center;margin-top:0px;margin-bottom:0px;&quot;&gt;									&lt;img src=&quot;http://img03.taobaocdn.com/imgextra/i3/1470033/T22bWeXllaXXXXXXXX_!!1470033.jpg&quot; _ks_lazy_width=&quot;90&quot; _ks_lazy_height=&quot;90&quot; /&gt; 								&lt;/p&gt;							&lt;/td&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; width=&quot;112&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;&quot;&gt;									&lt;span style=&quot;font-size:11pt;&quot;&gt;关节卫士&lt;/span&gt; 								&lt;/p&gt;							&lt;/td&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; width=&quot;80&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;&quot;&gt;									&lt;img src=&quot;http://img02.taobaocdn.com/imgextra/i2/1470033/T2PHWeXlxaXXXXXXXX_!!1470033.jpg&quot; _ks_lazy_width=&quot;90&quot; _ks_lazy_height=&quot;90&quot; /&gt; 								&lt;/p&gt;							&lt;/td&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;&quot;&gt;									关节卫士骨胶原蛋白								&lt;/p&gt;							&lt;/td&gt;						&lt;/tr&gt;						&lt;tr&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; width=&quot;86&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;&quot;&gt;									&lt;img src=&quot;http://img01.taobaocdn.com/imgextra/i1/1470033/T2LYWeXlFaXXXXXXXX_!!1470033.jpg&quot; _ks_lazy_width=&quot;90&quot; _ks_lazy_height=&quot;90&quot; /&gt; 								&lt;/p&gt;							&lt;/td&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; width=&quot;112&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;&quot;&gt;									&lt;span style=&quot;font-size:11pt;&quot;&gt;单瓶装&lt;/span&gt; 								&lt;/p&gt;							&lt;/td&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; width=&quot;80&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;&quot;&gt;									&lt;img src=&quot;http://img04.taobaocdn.com/imgextra/i4/1470033/T2IYWeXlJaXXXXXXXX_!!1470033.jpg&quot; _ks_lazy_width=&quot;90&quot; _ks_lazy_height=&quot;90&quot; /&gt; 								&lt;/p&gt;							&lt;/td&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; width=&quot;215&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;&quot;&gt;									&lt;span style=&quot;font-size:11pt;&quot;&gt;60粒/瓶&lt;/span&gt; *6瓶								&lt;/p&gt;							&lt;/td&gt;						&lt;/tr&gt;						&lt;tr&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; width=&quot;86&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;&quot;&gt;									&lt;img src=&quot;http://img01.taobaocdn.com/imgextra/i1/1470033/T2ErWeXlVaXXXXXXXX_!!1470033.jpg&quot; _ks_lazy_width=&quot;90&quot; _ks_lazy_height=&quot;90&quot; /&gt; 								&lt;/p&gt;							&lt;/td&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; width=&quot;112&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;&quot;&gt;									&lt;span style=&quot;font-size:11pt;&quot;&gt;广东河源&lt;/span&gt; 								&lt;/p&gt;							&lt;/td&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; width=&quot;80&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;&quot;&gt;									&nbsp;								&lt;/p&gt;							&lt;/td&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; width=&quot;215&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;&quot;&gt;									&nbsp;								&lt;/p&gt;							&lt;/td&gt;						&lt;/tr&gt;						&lt;tr&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; width=&quot;86&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;&quot;&gt;									&lt;img src=&quot;http://img04.taobaocdn.com/imgextra/i4/1470033/T2BHWeXlVaXXXXXXXX_!!1470033.jpg&quot; _ks_lazy_width=&quot;90&quot; _ks_lazy_height=&quot;90&quot; /&gt; 								&lt;/p&gt;							&lt;/td&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; colspan=&quot;3&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;&quot;&gt;									&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;span style=&quot;font-size:11pt;&quot;&gt;见瓶侧面喷码（&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#000000;font-size:11pt;&quot;&gt;过期日标于瓶身侧面，形式：EXP.Date：月/年&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;span style=&quot;font-size:11pt;&quot;&gt;)&lt;/span&gt;&lt;/span&gt; 								&lt;/p&gt;							&lt;/td&gt;						&lt;/tr&gt;						&lt;tr&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; width=&quot;86&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;&quot;&gt;									&lt;img src=&quot;http://img03.taobaocdn.com/imgextra/i3/1470033/T2094LXp4aXXXXXXXX-1470033.jpg&quot; _ks_lazy_width=&quot;90&quot; _ks_lazy_height=&quot;90&quot; /&gt; 								&lt;/p&gt;							&lt;/td&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; colspan=&quot;3&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;&quot;&gt;									&lt;span style=&quot;font-family:宋体;font-size:11pt;&quot;&gt;每颗含有600毫克100％纯鸡软骨胶原蛋白。&lt;/span&gt; 								&lt;/p&gt;							&lt;/td&gt;						&lt;/tr&gt;					&lt;/tbody&gt;				&lt;/table&gt;			&lt;/td&gt;			&lt;td width=&quot;240&quot;&gt;				&lt;table class=&quot;ke-zeroborder&quot; border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; width=&quot;240&quot; align=&quot;right&quot; height=&quot;100%&quot;&gt;					&lt;tbody&gt;						&lt;tr&gt;							&lt;td valign=&quot;center&quot; colspan=&quot;2&quot; align=&quot;middle&quot;&gt;								&lt;p style=&quot;text-align:center;margin-top:0px;margin-bottom:0px;&quot;&gt;									&lt;a href=&quot;http://www.taobao.com/view_image.php?pic=Wx0GGlFDXA1VUwMDWx0SCwkNGRFcVxxQW1UcCxMFRBkDCFdVV1cRRhpVRDhHEXthdWtYblAxKjIYMxoLAGsCAkVeR11FBgYV&amp;title=ob7O5bvKudrV/ca3ob/DwLn6TmVvY2VsbCAy0M25x7261K21sLDXIMjzu6y52L3aILT4t8DOsQ==&amp;version=2&amp;c=NmQzNDJhYTM0ZDAxMjQzNzNiYThlMjExYTE3MjYwZjc=&amp;itemId=1898505415&amp;shopId=1470033&amp;sellerRate=484937&amp;dbId=&amp;fv=9&quot; target=&quot;_blank&quot;&gt;&lt;/a&gt;&nbsp;								&lt;/p&gt;							&lt;/td&gt;						&lt;/tr&gt;						&lt;tr&gt;							&lt;td&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;&quot;&gt;									&lt;a href=&quot;http://favorite.taobao.com/popup/add_collection_2.htm?id=62266783&amp;itemtype=0&amp;is_tmall=&amp;is_lp=&amp;is_taohua=&quot; target=&quot;_blank&quot;&gt;&lt;/a&gt;&nbsp;								&lt;/p&gt;							&lt;/td&gt;							&lt;td&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;&quot;&gt;									&lt;a href=&quot;http://favorite.taobao.com/popup/add_collection.htm?spm=a220o.1000855.0.0.e322Ib&amp;id=6842724940&amp;itemtype=1&amp;scjjc=1&amp;_tb_token_=DIrBYQdpgXsE&quot; target=&quot;_blank&quot;&gt;&lt;/a&gt;&nbsp;								&lt;/p&gt;							&lt;/td&gt;						&lt;/tr&gt;					&lt;/tbody&gt;				&lt;/table&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td colspan=&quot;2&quot;&gt;				&lt;table class=&quot;ke-zeroborder&quot; border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; width=&quot;740&quot;&gt;					&lt;tbody&gt;						&lt;tr&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; width=&quot;86&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;&quot;&gt;									&lt;img src=&quot;http://img04.taobaocdn.com/imgextra/i4/1470033/T2BHQdXhtbXXXXXXXX-1470033.jpg&quot; _ks_lazy_width=&quot;90&quot; _ks_lazy_height=&quot;90&quot; /&gt; 								&lt;/p&gt;							&lt;/td&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; width=&quot;654&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;&quot;&gt;									&lt;span style=&quot;font-size:11pt;&quot;&gt;&middot;&lt;/span&gt;&lt;span style=&quot;color:#000000;font-size:11pt;&quot;&gt;免疫细胞分子骨胶原II型是当今补关节最热门的健康食品。&lt;/span&gt; 								&lt;/p&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;&quot;&gt;									&lt;span style=&quot;color:#000000;font-size:11pt;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;font-size:11pt;&quot;&gt;&middot;&lt;/span&gt;&lt;span style=&quot;color:#000000;font-size:11pt;&quot;&gt;此胶原蛋白II型是人体骨关节内含量最高的蛋白胶原成份。&lt;/span&gt; 								&lt;/p&gt;							&lt;/td&gt;						&lt;/tr&gt;						&lt;tr&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; width=&quot;86&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;&quot;&gt;									&lt;span style=&quot;font-family:simsun;color:#000000;font-size:14px;&quot;&gt;&nbsp;&lt;/span&gt;&lt;img src=&quot;http://img04.taobaocdn.com/imgextra/i4/1470033/T2jo4MXxVXXXXXXXXX-1470033.jpg&quot; _ks_lazy_width=&quot;90&quot; _ks_lazy_height=&quot;90&quot; /&gt; 								&lt;/p&gt;&lt;br /&gt;							&lt;/td&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;&quot;&gt;									&lt;span style=&quot;font-size:11pt;&quot;&gt;&middot;运动量较大的人群&lt;br /&gt;&middot;骨折后需要修复的人群&nbsp;&lt;br /&gt;&middot;有风湿骨痛的人群&nbsp;&lt;/span&gt; 								&lt;/p&gt;							&lt;/td&gt;						&lt;/tr&gt;						&lt;tr&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; width=&quot;86&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;&quot;&gt;									&lt;br /&gt;								&lt;/p&gt;							&lt;/td&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;&quot;&gt;									&lt;span style=&quot;color:#000000;font-size:11pt;&quot;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/span&gt; 								&lt;/p&gt;							&lt;/td&gt;						&lt;/tr&gt;						&lt;tr&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; width=&quot;86&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;&quot;&gt;									&lt;img src=&quot;http://img04.taobaocdn.com/imgextra/i4/1470033/T2ibWeXmlaXXXXXXXX_!!1470033.jpg&quot; _ks_lazy_width=&quot;90&quot; _ks_lazy_height=&quot;90&quot; /&gt; 								&lt;/p&gt;							&lt;/td&gt;							&lt;td style=&quot;border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;&quot; align=&quot;left&quot;&gt;								&lt;p style=&quot;text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;&quot;&gt;									&lt;strong&gt;&lt;span style=&quot;color:#ff0000;font-size:11pt;&quot;&gt;骨胶原是胶原蛋白的一种，由真皮中的纤维细胞产生，随着年龄的增长，骨胶原蛋白日益减少，进而引发一系列的骨质问题，NeoCell&nbsp;2型骨胶原蛋白，采用专利配方2型骨胶原制成，提取自纯鸡软骨，含量高于同类产品，可有效润滑关节 。&lt;/span&gt;&lt;/strong&gt; 								&lt;/p&gt;							&lt;/td&gt;						&lt;/tr&gt;					&lt;/tbody&gt;				&lt;/table&gt;			&lt;/td&gt;		&lt;/tr&gt;	&lt;/tbody&gt;&lt;/table&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('223', '3', '关捷卫士骨胶原蛋白', '<table class=\"ke-zeroborder\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"740\">	<tbody>		<tr>			<td width=\"500\">				<table class=\"ke-zeroborder\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" height=\"100%\">					<tbody>						<tr>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" width=\"86\" align=\"left\">								<p style=\"text-align:center;margin-top:0px;margin-bottom:0px;\">									<img src=\"http://img03.taobaocdn.com/imgextra/i3/1470033/T22bWeXllaXXXXXXXX_!!1470033.jpg\" _ks_lazy_width=\"90\" _ks_lazy_height=\"90\" /> 								</p>							</td>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" width=\"112\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;\">									<span style=\"font-size:11pt;\">关节卫士</span> 								</p>							</td>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" width=\"80\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;\">									<img src=\"http://img02.taobaocdn.com/imgextra/i2/1470033/T2PHWeXlxaXXXXXXXX_!!1470033.jpg\" _ks_lazy_width=\"90\" _ks_lazy_height=\"90\" /> 								</p>							</td>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;\">									关节卫士骨胶原蛋白								</p>							</td>						</tr>						<tr>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" width=\"86\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;\">									<img src=\"http://img01.taobaocdn.com/imgextra/i1/1470033/T2LYWeXlFaXXXXXXXX_!!1470033.jpg\" _ks_lazy_width=\"90\" _ks_lazy_height=\"90\" /> 								</p>							</td>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" width=\"112\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;\">									<span style=\"font-size:11pt;\">单瓶装</span> 								</p>							</td>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" width=\"80\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;\">									<img src=\"http://img04.taobaocdn.com/imgextra/i4/1470033/T2IYWeXlJaXXXXXXXX_!!1470033.jpg\" _ks_lazy_width=\"90\" _ks_lazy_height=\"90\" /> 								</p>							</td>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" width=\"215\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;\">									<span style=\"font-size:11pt;\">60粒/瓶</span> *6瓶								</p>							</td>						</tr>						<tr>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" width=\"86\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;\">									<img src=\"http://img01.taobaocdn.com/imgextra/i1/1470033/T2ErWeXlVaXXXXXXXX_!!1470033.jpg\" _ks_lazy_width=\"90\" _ks_lazy_height=\"90\" /> 								</p>							</td>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" width=\"112\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;\">									<span style=\"font-size:11pt;\">广东河源</span> 								</p>							</td>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" width=\"80\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;\">									&nbsp;								</p>							</td>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" width=\"215\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;\">									&nbsp;								</p>							</td>						</tr>						<tr>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" width=\"86\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;\">									<img src=\"http://img04.taobaocdn.com/imgextra/i4/1470033/T2BHWeXlVaXXXXXXXX_!!1470033.jpg\" _ks_lazy_width=\"90\" _ks_lazy_height=\"90\" /> 								</p>							</td>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" colspan=\"3\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;\">									<span style=\"font-family:宋体;\"><span style=\"font-size:11pt;\">见瓶侧面喷码（</span></span><span style=\"font-family:宋体;color:#000000;font-size:11pt;\">过期日标于瓶身侧面，形式：EXP.Date：月/年</span><span style=\"font-family:宋体;\"><span style=\"font-size:11pt;\">)</span></span> 								</p>							</td>						</tr>						<tr>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" width=\"86\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;\">									<img src=\"http://img03.taobaocdn.com/imgextra/i3/1470033/T2094LXp4aXXXXXXXX-1470033.jpg\" _ks_lazy_width=\"90\" _ks_lazy_height=\"90\" /> 								</p>							</td>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" colspan=\"3\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;\">									<span style=\"font-family:宋体;font-size:11pt;\">每颗含有600毫克100％纯鸡软骨胶原蛋白。</span> 								</p>							</td>						</tr>					</tbody>				</table>			</td>			<td width=\"240\">				<table class=\"ke-zeroborder\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"240\" align=\"right\" height=\"100%\">					<tbody>						<tr>							<td valign=\"center\" colspan=\"2\" align=\"middle\">								<p style=\"text-align:center;margin-top:0px;margin-bottom:0px;\">									<a href=\"http://www.taobao.com/view_image.php?pic=Wx0GGlFDXA1VUwMDWx0SCwkNGRFcVxxQW1UcCxMFRBkDCFdVV1cRRhpVRDhHEXthdWtYblAxKjIYMxoLAGsCAkVeR11FBgYV&amp;title=ob7O5bvKudrV/ca3ob/DwLn6TmVvY2VsbCAy0M25x7261K21sLDXIMjzu6y52L3aILT4t8DOsQ==&amp;version=2&amp;c=NmQzNDJhYTM0ZDAxMjQzNzNiYThlMjExYTE3MjYwZjc=&amp;itemId=1898505415&amp;shopId=1470033&amp;sellerRate=484937&amp;dbId=&amp;fv=9\" target=\"_blank\"></a>&nbsp;								</p>							</td>						</tr>						<tr>							<td>								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;\">									<a href=\"http://favorite.taobao.com/popup/add_collection_2.htm?id=62266783&amp;itemtype=0&amp;is_tmall=&amp;is_lp=&amp;is_taohua=\" target=\"_blank\"></a>&nbsp;								</p>							</td>							<td>								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;\">									<a href=\"http://favorite.taobao.com/popup/add_collection.htm?spm=a220o.1000855.0.0.e322Ib&amp;id=6842724940&amp;itemtype=1&amp;scjjc=1&amp;_tb_token_=DIrBYQdpgXsE\" target=\"_blank\"></a>&nbsp;								</p>							</td>						</tr>					</tbody>				</table>			</td>		</tr>		<tr>			<td colspan=\"2\">				<table class=\"ke-zeroborder\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"740\">					<tbody>						<tr>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" width=\"86\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;\">									<img src=\"http://img04.taobaocdn.com/imgextra/i4/1470033/T2BHQdXhtbXXXXXXXX-1470033.jpg\" _ks_lazy_width=\"90\" _ks_lazy_height=\"90\" /> 								</p>							</td>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" width=\"654\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;\">									<span style=\"font-size:11pt;\">·</span><span style=\"color:#000000;font-size:11pt;\">免疫细胞分子骨胶原II型是当今补关节最热门的健康食品。</span> 								</p>								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;\">									<span style=\"color:#000000;font-size:11pt;\"></span><span style=\"font-size:11pt;\">·</span><span style=\"color:#000000;font-size:11pt;\">此胶原蛋白II型是人体骨关节内含量最高的蛋白胶原成份。</span> 								</p>							</td>						</tr>						<tr>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" width=\"86\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;\">									<span style=\"font-family:simsun;color:#000000;font-size:14px;\">&nbsp;</span><img src=\"http://img04.taobaocdn.com/imgextra/i4/1470033/T2jo4MXxVXXXXXXXXX-1470033.jpg\" _ks_lazy_width=\"90\" _ks_lazy_height=\"90\" /> 								</p><br />							</td>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;\">									<span style=\"font-size:11pt;\">·运动量较大的人群<br />·骨折后需要修复的人群&nbsp;<br />·有风湿骨痛的人群&nbsp;</span> 								</p>							</td>						</tr>						<tr>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" width=\"86\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;\">									<br />								</p>							</td>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;\">									<span style=\"color:#000000;font-size:11pt;\">&nbsp;&nbsp;&nbsp;&nbsp;</span> 								</p>							</td>						</tr>						<tr>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" width=\"86\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;\">									<img src=\"http://img04.taobaocdn.com/imgextra/i4/1470033/T2ibWeXmlaXXXXXXXX_!!1470033.jpg\" _ks_lazy_width=\"90\" _ks_lazy_height=\"90\" /> 								</p>							</td>							<td style=\"border-bottom:#cccccc 1px dashed;padding-bottom:10px;padding-top:10px;\" align=\"left\">								<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;margin-left:20px;\">									<strong><span style=\"color:#ff0000;font-size:11pt;\">骨胶原是胶原蛋白的一种，由真皮中的纤维细胞产生，随着年龄的增长，骨胶原蛋白日益减少，进而引发一系列的骨质问题，NeoCell&nbsp;2型骨胶原蛋白，采用专利配方2型骨胶原制成，提取自纯鸡软骨，含量高于同类产品，可有效润滑关节 。</span></strong> 								</p>							</td>						</tr>					</tbody>				</table>			</td>		</tr>	</tbody></table>', '', '', '');
INSERT INTO `js_product_description` VALUES ('175', '1', '纯棉四件套', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('176', '1', '五件套冰丝席', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('177', '1', '撞色黑白', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('178', '1', '上海多米乐', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('179', '1', '印花线边四件套', '被套200*230+-3cm床单230*250+-3cm枕套45*75cm、&lt;br /&gt;江苏南通', '', '', '');
INSERT INTO `js_product_description` VALUES ('180', '1', '天丝四件套', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('181', '1', '花海天空', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('182', '1', '裸婚时代', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('183', '1', '荞麦枕一对', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('184', '1', '丝枕', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('185', '1', '蚕丝被', '&lt;table style=&quot;width:790px;&quot; border=&quot;1&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; width=&quot;790&quot;&gt;	&lt;tbody&gt;		&lt;tr&gt;			&lt;td style=&quot;width:136px;height:25px;&quot;&gt;				&lt;p align=&quot;center&quot;&gt;					&nbsp;				&lt;/p&gt;			&lt;/td&gt;			&lt;td style=&quot;width:586px;height:25px;&quot;&gt;				&lt;p align=&quot;left&quot;&gt;					&nbsp;				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;width:136px;height:32px;&quot;&gt;				&lt;p align=&quot;center&quot;&gt;					商&nbsp;品&nbsp;名&nbsp;称				&lt;/p&gt;			&lt;/td&gt;			&lt;td style=&quot;width:586px;height:32px;&quot;&gt;				&lt;p align=&quot;left&quot;&gt;					蚕丝被				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;width:136px;height:20px;&quot;&gt;				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 货号			&lt;/td&gt;			&lt;td style=&quot;width:586px;height:20px;&quot;&gt;				&lt;p align=&quot;left&quot;&gt;					WJ0012A				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;width:136px;height:20px;&quot;&gt;			&lt;/td&gt;			&lt;td style=&quot;width:586px;height:20px;&quot;&gt;				&lt;p align=&quot;left&quot;&gt;					双人				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;width:136px;height:22px;&quot;&gt;			&lt;/td&gt;			&lt;td style=&quot;width:586px;height:22px;&quot;&gt;				&lt;p align=&quot;left&quot;&gt;					&nbsp;				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;width:136px;height:78px;&quot;&gt;				&lt;p align=&quot;center&quot;&gt;					产&nbsp;品&nbsp;重&nbsp;量				&lt;/p&gt;			&lt;/td&gt;			&lt;td style=&quot;width:586px;height:78px;&quot;&gt;				&lt;p align=&quot;left&quot;&gt;					&nbsp;4-5斤备注：产品重量为样品中抽取称重，由于产品不同可能重量存在小误差，介意者慎拍。				&lt;/p&gt;				&lt;p align=&quot;left&quot;&gt;					本店被芯存在&plusmn;5cm的误差，不属于质量问题，符合国家统一标准，介意者慎拍。				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;width:136px;height:45px;&quot;&gt;				&lt;p align=&quot;center&quot;&gt;					洗&nbsp;涤&nbsp;说&nbsp;明				&lt;/p&gt;			&lt;/td&gt;			&lt;td style=&quot;width:586px;height:45px;&quot;&gt;				&lt;p style=&quot;margin-left:9.05pt;&quot; align=&quot;left&quot;&gt;					不可水洗，不可漂白，不可熨烫，不可干洗，请勿接触锐器或用力撕拉				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;width:136px;height:70px;&quot;&gt;				&lt;p align=&quot;center&quot;&gt;					温&nbsp;馨&nbsp;提&nbsp;示				&lt;/p&gt;			&lt;/td&gt;			&lt;td style=&quot;width:586px;height:70px;&quot;&gt;				&lt;p align=&quot;left&quot;&gt;					1芯类产品尽可能不要洗涤，如有需要洗涤，请根据产品洗涤标识洗涤。建议局部洗涤并选择柔和洗涤。				&lt;/p&gt;				&lt;p align=&quot;left&quot;&gt;					2存放选择干燥处，避免受潮发霉。				&lt;/p&gt;				&lt;p align=&quot;left&quot;&gt;					3具体说明请参考产品水洗标				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;	&lt;/tbody&gt;&lt;/table&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('186', '1', '红豆家纺', '&lt;table style=&quot;width:790px;&quot; border=&quot;1&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; width=&quot;790&quot;&gt;	&lt;tbody&gt;		&lt;tr&gt;			&lt;td style=&quot;width:136px;height:25px;&quot;&gt;				&lt;p align=&quot;center&quot;&gt;					品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;牌				&lt;/p&gt;			&lt;/td&gt;			&lt;td style=&quot;width:586px;height:25px;&quot;&gt;				&lt;p align=&quot;left&quot;&gt;					红豆家纺				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;width:136px;height:32px;&quot;&gt;				&lt;p align=&quot;center&quot;&gt;					商&nbsp;品&nbsp;名&nbsp;称				&lt;/p&gt;			&lt;/td&gt;			&lt;td style=&quot;width:586px;height:32px;&quot;&gt;				&lt;p align=&quot;left&quot;&gt;					蚕丝被				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;width:136px;height:20px;&quot;&gt;				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 货号			&lt;/td&gt;			&lt;td style=&quot;width:586px;height:20px;&quot;&gt;				&lt;p align=&quot;left&quot;&gt;					WJ0011A				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;width:136px;height:20px;&quot;&gt;			&lt;/td&gt;			&lt;td style=&quot;width:586px;height:20px;&quot;&gt;				&lt;p align=&quot;left&quot;&gt;					双人				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;width:136px;height:22px;&quot;&gt;			&lt;/td&gt;			&lt;td style=&quot;width:586px;height:22px;&quot;&gt;				&lt;p align=&quot;left&quot;&gt;					&nbsp;				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;width:136px;height:78px;&quot;&gt;				&lt;p align=&quot;center&quot;&gt;					产&nbsp;品&nbsp;重&nbsp;量				&lt;/p&gt;			&lt;/td&gt;			&lt;td style=&quot;width:586px;height:78px;&quot;&gt;				&lt;p align=&quot;left&quot;&gt;					&nbsp;4-5斤备注：产品重量为样品中抽取称重，由于产品不同可能重量存在小误差，介意者慎拍。				&lt;/p&gt;				&lt;p align=&quot;left&quot;&gt;					本店被芯存在&plusmn;5cm的误差，不属于质量问题，符合国家统一标准，介意者慎拍。				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;width:136px;height:45px;&quot;&gt;				&lt;p align=&quot;center&quot;&gt;					洗&nbsp;涤&nbsp;说&nbsp;明				&lt;/p&gt;			&lt;/td&gt;			&lt;td style=&quot;width:586px;height:45px;&quot;&gt;				&lt;p style=&quot;margin-left:9.05pt;&quot; align=&quot;left&quot;&gt;					不可水洗，不可漂白，不可熨烫，不可干洗，请勿接触锐器或用力撕拉				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;width:136px;height:70px;&quot;&gt;				&lt;p align=&quot;center&quot;&gt;					温&nbsp;馨&nbsp;提&nbsp;示				&lt;/p&gt;			&lt;/td&gt;			&lt;td style=&quot;width:586px;height:70px;&quot;&gt;				&lt;p align=&quot;left&quot;&gt;					1芯类产品尽可能不要洗涤，如有需要洗涤，请根据产品洗涤标识洗涤。建议局部洗涤并选择柔和洗涤。				&lt;/p&gt;				&lt;p align=&quot;left&quot;&gt;					2存放选择干燥处，避免受潮发霉。				&lt;/p&gt;				&lt;p align=&quot;left&quot;&gt;					3具体说明请参考产品水洗标				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;	&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;	&lt;img src=&quot;http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif&quot; _ks_lazy_width=&quot;85&quot; _ks_lazy_height=&quot;85&quot; /&gt;&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('224', '3', '蜜迪胶原蛋白液态饮', '=\"left\">	<strong><span style=\"font-size:18px;\"><span style=\"font-family:microsoft yahei;\"><span><span style=\"color:#ff0000;\"><span style=\"color:#000000;\"><span style=\"font-family:\'microsoft yahei\';color:#ff0000;font-size:large;\"><span style=\"line-height:36px;\"><span style=\"font-family:宋体;letter-spacing:0.4pt;color:black;font-size:12pt;\">随着年龄的增长和紫外线、自由基等的侵害，女性在<span>25</span>岁后，合成新的胶原蛋白的能力逐渐下降，肌肤就会因胶原蛋白的流失、变质，而使皮肤变得松弛、缺水、敏感、晦暗，容易产生细纹、色斑和毛孔粗大，使身体逐渐呈老化趋势。</span></span></span></span></span></span></span></span></strong> </p><p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\">	<strong><span style=\"font-size:18px;\"><span style=\"font-family:microsoft yahei;\"><span><span style=\"color:#ff0000;\"><span style=\"color:#000000;\"><span style=\"font-family:\'microsoft yahei\';color:#ff0000;font-size:large;\"><span style=\"line-height:36px;\"><span style=\"font-family:宋体;letter-spacing:0.4pt;color:black;font-size:12pt;\">　　胶原蛋白的有<span>6</span>大作用：紧肤平皱、保湿滋润、恢复皮肤弹性、修复组织、美白淡斑等。胶原蛋白通过表皮进入真皮层组织后，改善松弛的皮肤，收紧皮肤，减少深皱纹、缩小毛孔，使皮肤紧绷且富有弹性。胶原蛋白可以使细胞变得丰满，从而保持肌肤弹性与润泽，维持肌肤细腻光滑，有效防止老化。胶原蛋白能使细胞粘接更紧密，阻止络氨酸转化为黑色素，不给黑色素、毒素藏身之地，令皮肤肤色白暂、色斑淡出。</span></span></span></span></span></span></span></span></strong> </p><p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\">	<strong><span style=\"font-size:18px;\"><span style=\"font-family:microsoft yahei;\"><span><span style=\"color:#ff0000;\"><span style=\"color:#000000;\"><span style=\"font-family:\'microsoft yahei\';color:#ff0000;font-size:large;\"><span style=\"line-height:36px;\"><span style=\"font-family:宋体;letter-spacing:0.4pt;color:black;font-size:12pt;\">胶原蛋白是肌肤弹力组织的主要结构成份之一，有效修补肌肤机能失调所致的问题，如皱纹。所以肌肤内胶原蛋白的多寡直接影响面部肌肤的弹性及光滑度。而且胶原蛋白能强化结缔组织的保湿力，有助于维持肌肤水润饱满</span></span></span></span></span></span></span></span></strong> </p><p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\">	<strong><span style=\"font-size:18px;\"><span style=\"font-family:microsoft yahei;\"><span><span style=\"color:#ff0000;\"><span style=\"color:#000000;\"><span style=\"font-family:\'microsoft yahei\';color:#ff0000;font-size:large;\"><span style=\"line-height:36px;\"><span style=\"font-family:宋体;letter-spacing:0.4pt;color:black;font-size:12pt;\">真正的护肤之道在于“内养外护”，不仅要选择正确的外用护肤产品，还需要体内补充高含量、高效能的胶原蛋白，内外兼修，很多肌肤问题改善起来，就容易很多了。<span>&nbsp;</span></span></span></span></span></span></span></span></span></strong> </p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('174', '1', '爆炒王炒锅', '&lt;p&gt;	&lt;span style=&quot;font-family:宋体;&quot;&gt;爆炒王炒锅：锅身经高压冷泉技术硬质氧化处理，抗刮耐磨，锅体内表面陶晶不沾处理，安全健康。可立宽边玻璃盖，健康美味看得见，隔热防烫硅胶手柄配置，安全舒适好把握。高强度导磁片复底，适用于电磁炉，煤气炉，电炉，电陶炉等&lt;/span&gt; &lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('173', '1', '五味香厨炒锅', '&lt;p&gt;	&lt;span style=&quot;font-family:宋体;&quot;&gt;五味香厨炒锅：&lt;/span&gt;&lt;/p&gt;&lt;p&gt;	&lt;span style=&quot;font-family:宋体;&quot;&gt;爆炒王炒锅：锅身经高压冷泉技术硬质氧化处理，抗刮耐磨，锅体内表面陶晶不沾处理，安全健康。可立宽边玻璃盖，健康美味看得见，隔热防烫硅胶手柄配置，安全舒适好把握。高强度导磁片复底，适用于电磁炉，煤气炉，电炉，电陶炉等&lt;/span&gt;&lt;/p&gt;', '五味香厨炒锅： 爆炒王炒锅：锅身经高压冷泉技术硬质氧化处理，抗刮耐磨，锅体内表面陶晶不沾处理，安全健康。可立宽边玻璃盖，健康美味看得见，隔热防烫硅胶手柄配置，安全舒适好把握。高强度导磁片复底，适用于电磁炉，煤气炉，电炉，电陶炉等', '', '');
INSERT INTO `js_product_description` VALUES ('172', '1', '韩版电煎锅', '&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;韩版电煎锅：１．采用最新压铸工艺，解决拉伸锅锅体变形烦恼。锅底压花，喷涂不粘层、煎、烤、炸、炒食物不粘锅、易清洗．传热均匀，使用无有烟。&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&quot;&quot;&gt;&lt;br /&gt;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;２．加热快，锅内可到的温度区域大．锅内最高温度可达到３００℃，可以适应各种烹调技法所需的温度要求．&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&quot;&quot;&gt;&lt;br /&gt;&lt;/span&gt;&lt;span style=&quot;font-size:10.5pt;font-family:宋体;&quot;&gt;３．产品整体设计，带有浓郁的韩式风格，豪华大方．锅盖采用强化玻璃钢盖，可随时观察锅内食物烹饪的情况．贴心的耐高温手柄，保证您不会因为锅内的高温，对您的手有丝毫损伤．整体结构小巧玲珑，占用空间少&lt;/span&gt;', '韩版电煎锅：１．采用最新压铸工艺，解决拉伸锅锅体变形烦恼。锅底压花，喷涂不粘层、煎、烤、炸、炒食物不粘锅、易清洗．传热均匀，使用无有烟。 ２．加热快，锅内可到的温度区域大．锅内最高温度可达到３００℃，可以适应各种烹调技法所需的温度要求． ３．产品整体设计，带有浓郁的韩式风格，豪华大方．锅盖采用强化玻璃钢盖，可随时观察锅内食物烹饪的情况．贴心的耐高温手柄，保证您不会因为锅内的高温，对您的手有丝毫损伤．整体结构小巧玲珑，占用空间少', '', '');
INSERT INTO `js_product_description` VALUES ('171', '1', '韩式电热锅A6', '&lt;p&gt;	&lt;span style=&quot;font-family:宋体;&quot;&gt;韩版电热锅：产品性能稳定、热效率高、省时、省电、使用方便，具有安全、卫生、无毒、无味、美观大方等特点。铝锅传热效能高，传热均匀，发热管选用优质材料，发热均匀并且耐用。透明强化玻璃盖，便于观察。锅内温度任意调节，干烧自动断电。工艺精湛，造型美观。&lt;/span&gt;&lt;/p&gt;', '韩版电热锅：产品性能稳定、热效率高、省时、省电、使用方便，具有安全、卫生、无毒、无味、美观大方等特点。铝锅传热效能高，传热均匀，发热管选用优质材料，发热均匀并且耐用。透明强化玻璃盖，便于观察。锅内温度任意调节，干烧自动断电。工艺精湛，造型美观。', '', '');
INSERT INTO `js_product_description` VALUES ('169', '1', '韩式电热锅YL-A1', '&lt;p&gt;	&lt;span style=&quot;font-family:宋体;&quot;&gt;韩版电热锅：产品性能稳定、热效率高、省时、省电、使用方便，具有安全、卫生、无毒、无味、美观大方等特点。铝锅传热效能高，传热均匀，发热管选用优质材料，发热均匀并且耐用。透明强化玻璃盖，便于观察。锅内温度任意调节，干烧自动断电。工艺精湛，造型美观。&lt;/span&gt;&lt;/p&gt;', '韩版电热锅：产品性能稳定、热效率高、省时、省电、使用方便，具有安全、卫生、无毒、无味、美观大方等特点。铝锅传热效能高，传热均匀，发热管选用优质材料，发热均匀并且耐用。透明强化玻璃盖，便于观察。锅内温度任意调节，干烧自动断电。工艺精湛，造型美观。', '', '');
INSERT INTO `js_product_description` VALUES ('170', '1', '韩式电热锅YL-A3', '&lt;p&gt;	&lt;span style=&quot;font-family:宋体;&quot;&gt;韩版电热锅：产品性能稳定、热效率高、省时、省电、使用方便，具有安全、卫生、无毒、无味、美观大方等特点。铝锅传热效能高，传热均匀，发热管选用优质材料，发热均匀并且耐用。透明强化玻璃盖，便于观察。锅内温度任意调节，干烧自动断电。工艺精湛，造型美观。&lt;/span&gt;&lt;/p&gt;', '韩版电热锅：产品性能稳定、热效率高、省时、省电、使用方便，具有安全、卫生、无毒、无味、美观大方等特点。铝锅传热效能高，传热均匀，发热管选用优质材料，发热均匀并且耐用。透明强化玻璃盖，便于观察。锅内温度任意调节，干烧自动断电。工艺精湛，造型美观。', '', '');
INSERT INTO `js_product_description` VALUES ('225', '3', '蜜迪雪颜果饮', '=\"left\">	<strong><span style=\"font-size:18px;\"><span style=\"font-family:microsoft yahei;\"><span><span style=\"color:#ff0000;\"><span style=\"color:#000000;\"><span style=\"font-family:\'microsoft yahei\';color:#ff0000;font-size:large;\"><span style=\"line-height:36px;\"><span style=\"font-family:宋体;letter-spacing:0.4pt;color:black;font-size:12pt;\">随着年龄的增长和紫外线、自由基等的侵害，女性在<span>25</span>岁后，合成新的胶原蛋白的能力逐渐下降，肌肤就会因胶原蛋白的流失、变质，而使皮肤变得松弛、缺水、敏感、晦暗，容易产生细纹、色斑和毛孔粗大，使身体逐渐呈老化趋势。</span></span></span></span></span></span></span></span></strong> </p><p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\">	<strong><span style=\"font-size:18px;\"><span style=\"font-family:microsoft yahei;\"><span><span style=\"color:#ff0000;\"><span style=\"color:#000000;\"><span style=\"font-family:\'microsoft yahei\';color:#ff0000;font-size:large;\"><span style=\"line-height:36px;\"><span style=\"font-family:宋体;letter-spacing:0.4pt;color:black;font-size:12pt;\">　　胶原蛋白的有<span>6</span>大作用：紧肤平皱、保湿滋润、恢复皮肤弹性、修复组织、美白淡斑等。胶原蛋白通过表皮进入真皮层组织后，改善松弛的皮肤，收紧皮肤，减少深皱纹、缩小毛孔，使皮肤紧绷且富有弹性。胶原蛋白可以使细胞变得丰满，从而保持肌肤弹性与润泽，维持肌肤细腻光滑，有效防止老化。胶原蛋白能使细胞粘接更紧密，阻止络氨酸转化为黑色素，不给黑色素、毒素藏身之地，令皮肤肤色白暂、色斑淡出。</span></span></span></span></span></span></span></span></strong> </p><p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\">	<strong><span style=\"font-size:18px;\"><span style=\"font-family:microsoft yahei;\"><span><span style=\"color:#ff0000;\"><span style=\"color:#000000;\"><span style=\"font-family:\'microsoft yahei\';color:#ff0000;font-size:large;\"><span style=\"line-height:36px;\"><span style=\"font-family:宋体;letter-spacing:0.4pt;color:black;font-size:12pt;\">胶原蛋白是肌肤弹力组织的主要结构成份之一，有效修补肌肤机能失调所致的问题，如皱纹。所以肌肤内胶原蛋白的多寡直接影响面部肌肤的弹性及光滑度。而且胶原蛋白能强化结缔组织的保湿力，有助于维持肌肤水润饱满</span></span></span></span></span></span></span></span></strong> </p><p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\">	<strong><span style=\"font-size:18px;\"><span style=\"font-family:microsoft yahei;\"><span><span style=\"color:#ff0000;\"><span style=\"color:#000000;\"><span style=\"font-family:\'microsoft yahei\';color:#ff0000;font-size:large;\"><span style=\"line-height:36px;\"><span style=\"font-family:宋体;letter-spacing:0.4pt;color:black;font-size:12pt;\">真正的护肤之道在于“内养外护”，不仅要选择正确的外用护肤产品，还需要体内补充高含量、高效能的胶原蛋白，内外兼修，很多肌肤问题改善起来，就容易很多了。<span>&nbsp;</span></span></span></span></span></span></span></span></span></strong> </p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('156', '1', '男士内裤', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('157', '1', '男士内裤（大）', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('158', '1', '女士内裤', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('159', '1', '女士内衣9024', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('160', '1', '女士内衣9037', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('161', '1', '女士内衣A921', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('162', '1', '女士内衣1314', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('163', '1', '女士内衣1223', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('164', '1', '女士内衣1304', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('165', '1', '女士内衣1313', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('166', '1', '金豹鼠', '&lt;li title=&quot;&nbsp;袋鼠&quot;&gt;	品牌:&nbsp;金豹鼠&lt;/li&gt;&lt;li title=&quot;&nbsp;腰带&quot;&gt;	款式:&nbsp;腰带&lt;/li&gt;&lt;li title=&quot;&nbsp;牛皮&quot;&gt;	主材质:&nbsp;牛皮&lt;/li&gt;&lt;li title=&quot;&nbsp;光面&quot;&gt;	材质特性:&nbsp;光面&lt;/li&gt;&lt;li title=&quot;&nbsp;光身&quot;&gt;	带身元素:&nbsp;光身&lt;/li&gt;&lt;li title=&quot;&nbsp;自动扣&quot;&gt;	带扣:&nbsp;自动扣&lt;/li&gt;&lt;li title=&quot;&nbsp;合金头&quot;&gt;	带扣材质:&nbsp;合金头&lt;/li&gt;&lt;li title=&quot;&nbsp;光板&quot;&gt;	流行元素:&nbsp;光板&lt;/li&gt;&lt;li title=&quot;&nbsp;3-4cm&quot;&gt;	带身宽度:&nbsp;3-4cm&lt;/li&gt;&lt;li title=&quot;&nbsp;商务&quot;&gt;	风格:&nbsp;商务&lt;/li&gt;&lt;li title=&quot;&nbsp;腰带&quot;&gt;	佩戴部位:&nbsp;腰带&lt;/li&gt;&lt;li title=&quot;&nbsp;单圈&quot;&gt;	长度:&nbsp;单圈&lt;/li&gt;&lt;li title=&quot;&nbsp;男士&quot;&gt;	配件性别:&nbsp;男士&lt;/li&gt;&lt;li title=&quot;&nbsp;SV522567&quot;&gt;	货号:&nbsp;XR0002&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('226', '3', 'MT胶原蛋白粉', '<p>	<span style=\"font-family:宋体;\">胶原蛋白粉：</span><span>MT</span><span style=\"font-family:宋体;\">胶原蛋白粉是以高纯度小分子胶原蛋白分为原料、采用先进的技术和生产工艺制而成的营养固体饮料。</span> </p>', '胶原蛋白粉：MT胶原蛋白粉是以高纯度小分子胶原蛋白分为原料、采用先进的技术和生产工艺制而成的营养固体饮料。', '', '');
INSERT INTO `js_product_description` VALUES ('168', '1', '金元宝电热锅YL-A4', '&lt;p&gt;	&lt;span style=&quot;font-family:宋体;&quot;&gt;金元宝电热锅：炒、煮、蒸、煎、炸、炖&lt;/span&gt; &lt;span style=&quot;font-family:宋体;&quot;&gt;全能一体锅，买一只依灵多功能电热锅，相当于同时购买了电饭锅、不粘锅、电炒锅、电磁炉、蒸锅、电饼铛，买一锅等于买六锅！超级实用！&lt;/span&gt;&lt;/p&gt;', '金元宝电热锅：炒、煮、蒸、煎、炸、炖 全能一体锅，买一只依灵多功能电热锅，相当于同时购买了电饭锅、不粘锅、电炒锅、电磁炉、蒸锅、电饼铛，买一锅等于买六锅！超级实用！', '', '');
INSERT INTO `js_product_description` VALUES ('167', '1', '老人头', '&lt;li title=&quot;&nbsp;袋鼠&quot;&gt;	品牌:&nbsp;老人头&lt;/li&gt;&lt;li title=&quot;&nbsp;袋鼠&quot;&gt;	款式:&nbsp;腰带&lt;/li&gt;&lt;li title=&quot;&nbsp;牛皮&quot;&gt;	主材质:&nbsp;牛皮&lt;/li&gt;&lt;li title=&quot;&nbsp;光面&quot;&gt;	材质特性:&nbsp;光面&lt;/li&gt;&lt;li title=&quot;&nbsp;光身&quot;&gt;	带身元素:&nbsp;光身&lt;/li&gt;&lt;li title=&quot;&nbsp;自动扣&quot;&gt;	带扣:&nbsp;自动扣&lt;/li&gt;&lt;li title=&quot;&nbsp;合金头&quot;&gt;	带扣材质:&nbsp;合金头&lt;/li&gt;&lt;li title=&quot;&nbsp;光板&quot;&gt;	流行元素:&nbsp;光板&lt;/li&gt;&lt;li title=&quot;&nbsp;3-4cm&quot;&gt;	带身宽度:&nbsp;3-4cm&lt;/li&gt;&lt;li title=&quot;&nbsp;商务&quot;&gt;	风格:&nbsp;商务&lt;/li&gt;&lt;li title=&quot;&nbsp;腰带&quot;&gt;	佩戴部位:&nbsp;腰带&lt;/li&gt;&lt;li title=&quot;&nbsp;单圈&quot;&gt;	长度:&nbsp;单圈&lt;/li&gt;&lt;li title=&quot;&nbsp;男士&quot;&gt;	配件性别:&nbsp;男士&lt;/li&gt;&lt;li title=&quot;&nbsp;SV522567&quot;&gt;	货号:&nbsp;XR0001&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('227', '3', '干白', '<span style=\"font-size:10.0pt;font-family:&quot;color:#CC0000;\">Aldoba</span><span style=\"font-size:10.0pt;font-family:宋体;color:black;\">即</span><span style=\"font-size:10.0pt;font-family:宋体;color:#CC0000;\">干白</span><span style=\"font-size:10.0pt;font-family:宋体;color:black;\">葡萄酒，是用白皮白肉或红皮白肉的葡萄经去皮发酵而成，这类酒的颜色以黄色调为主，主要有近似无色、微黄带绿、浅黄色、禾杆黄色、金黄色等，糖分含量非常低。</span>', 'Aldoba即干白葡萄酒，是用白皮白肉或红皮白肉的葡萄经去皮发酵而成，这类酒的颜色以黄色调为主，主要有近似无色、微黄带绿、浅黄色、禾杆黄色、金黄色等，糖分含量非常低。', '青岛 干白 商贸 葡萄酒', '');
INSERT INTO `js_product_description` VALUES ('228', '3', '梅鹿辄干红葡萄酒（95珍藏版）', '<p style=\"text-indent:15.75pt;\">	<span style=\"font-family:Arial;background-color:white;\"> </span><span style=\"font-family:宋体;background-color:white;\"><span style=\"font-size:10.5pt;font-family:宋体;\"><span style=\"white-space:nowrap;\">梅鹿辄干红葡萄酒（95珍藏版）</span>本产品呈宝石红色，有亚洲辛香料和木莓的香气，口感美妙柔滑，带有纯净而高贵的成熟单宁味，及带有淡雅的果香味。</span><span style=\"font-size:10.5pt;font-family:宋体;background-color:white;\">选用法国著名葡萄产区栽培的国际酿酒名种葡萄</span><span style=\"font-size:10.5pt;font-family:Arial;background-color:white;\">-</span><span style=\"font-size:10.5pt;font-family:宋体;background-color:white;\">梅乐为主要原料，采用先进的生产设备和传统的酿造工艺，有效的浸提葡萄中的优质单宁、色素及其他成分，并经窖藏酿造而成</span></span><span style=\"font-family:宋体;background-color:white;\"></span><span style=\"font-family:Arial;background-color:white;\"></span> </p>', ' 梅鹿辄干红葡萄酒（95珍藏版）本产品呈宝石红色，有亚洲辛香料和木莓的香气，口感美妙柔滑，带有纯净而高贵的成熟单宁味，及带有淡雅的果香味。选用法国著名葡萄产区栽培的国际酿酒名种葡萄-梅乐为主要原料，采用先进的生产设备和传统的酿造工艺，有效的浸提葡萄中的优质单宁、色素及其他成分，并经窖藏酿造而成', '', '');
INSERT INTO `js_product_description` VALUES ('135', '1', '青春精华保湿液', '&lt;p style=&quot;text-align:left;&quot;&gt;	&lt;span style=&quot;color:#a64d79;&quot;&gt;品牌：肌源&lt;br /&gt;名称：青春精华保湿液&lt;br /&gt;&lt;/span&gt;&lt;span style=&quot;color:#a64d79;&quot;&gt;包装：全新有外盒，无塑封&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;color:#a64d79;&quot;&gt;主要功效：&lt;br /&gt;蕴含大西洋红藻美白精粹、海洋复合休眠因子等多重靓白成分，配合靶向脂质体，快速、深入、准确改善顽固暗沉色块，令肌肤呈现纯净无瑕质感&lt;br /&gt;蕴含海洋浮游生物赋能精华GP4G，由内而外净除肌肤杂质，迅速改善不均匀肤色&lt;br /&gt;蕴含海洋角质莹透因子Lumiflex、海洋深层水、岩藻多糖以及天然碧玺宝石粉，带来充足滋养，重整角质层，修复外来污染、日常辐射、日照、压力等肌肤伤害，同时进一步预防暗沉问题，肌肤水润白皙，无瑕肤质仿若天成&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;color:#a64d79;&quot;&gt;&lt;br /&gt;适合人群：&lt;br /&gt;适合所有肤质&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align:left;&quot;&gt;	&lt;span style=&quot;color:#a64d79;&quot;&gt;使用方法：&lt;br /&gt;使用精华素后，取适量乳液，按肌肤纹理轻柔地涂抹于整个面部和颈部&lt;/span&gt;&lt;/p&gt;&lt;p&gt;	&nbsp;&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('134', '1', '青春深层洁颜泡', '&lt;li title=&quot;&nbsp;正常规格&quot;&gt;	规格:&nbsp;正常规格&lt;/li&gt;&lt;li title=&quot;&nbsp;180g/ml&quot;&gt;	化妆品容量:4.2FL OZ LIQ/120m&lt;/li&gt;&lt;li title=&quot;&nbsp;180g/ml&quot;&gt;	适合肤质:&nbsp;所有肤质&lt;/li&gt;&lt;li title=&quot;&nbsp;泡沫洁面&quot;&gt;	起泡程度:&nbsp;泡沫洁面&lt;/li&gt;&lt;li title=&quot;&nbsp;洁面摩丝&quot;&gt;	洁面分类:&nbsp;洁面摩丝&lt;/li&gt;&lt;li title=&quot;&nbsp;保湿&nbsp;控油&nbsp;去角质&nbsp;收缩毛孔&nbsp;深层清洁&nbsp;深层清洁：补水&quot;&gt;	功效:&nbsp;保湿&nbsp;控油&nbsp;去角质&nbsp;收缩毛孔&nbsp;深层清洁&nbsp;深层清洁：补水&lt;/li&gt;&lt;li id=&quot;J_attrBrandName&quot; title=&quot;&nbsp;Neogence/霓净思&quot;&gt;	品牌:&nbsp;肌源&lt;/li&gt;&lt;li title=&quot;&nbsp;Neogence/霓净思&quot;&gt;	洁面单品:&nbsp;氨基酸保湿洁颜泡沫&lt;/li&gt;&lt;li title=&quot;&nbsp;清洁度&nbsp;无残留&nbsp;温和度&nbsp;清爽度&quot;&gt;	化妆品特性:&nbsp;清洁度&nbsp;无残留&nbsp;温和度&nbsp;&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('229', '3', '卡佰纳干红葡萄酒（95经典窖藏）', '<b><span style=\"font-size:10.5pt;font-family:;\" \"=\"\"> </span></b><span style=\"font-size:10.5pt;font-family:宋体;\"><span style=\"white-space:nowrap;\">卡佰纳干红葡萄酒（95经典窖藏）</span>本产品是选用国际酿酒名种葡萄</span><span style=\"font-size:10.5pt;font-family:;\" \"=\"\">-</span><span style=\"font-size:10.5pt;font-family:宋体;\">赤霞珠为主的几种优质葡萄品种原料，采用先进生产设备和传统的酿造工艺，并经橡木桶窖藏精酿而成。本产品呈深紫红色，果香浓郁而丰富多样，十分怡人，木香和果酸交相辉映，留香较长，质感柔滑精致</span>', ' 卡佰纳干红葡萄酒（95经典窖藏）本产品是选用国际酿酒名种葡萄-赤霞珠为主的几种优质葡萄品种原料，采用先进生产设备和传统的酿造工艺，并经橡木桶窖藏精酿而成。本产品呈深紫红色，果香浓郁而丰富多样，十分怡人，木香和果酸交相辉映，留香较长，质感柔滑精致', '', '');
INSERT INTO `js_product_description` VALUES ('136', '1', '明扇', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('137', '1', '名家花鸟', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('138', '1', '竖牡丹', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('139', '1', '动物集锦', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('140', '1', '京剧脸谱', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('141', '1', '清明上河图', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('142', '1', '秦岭鲜都1号', '&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt; 秦岭鲜都&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;font-family:;&quot; &quot;=&quot;&quot;&gt;1&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;号具有酸甜可口、芳香怡人和丰富全面的营养的特点，素有&ldquo;保健奇果&rdquo;&ldquo;营养金矿&rdquo;之称，早熟，可于中秋，&ldquo;十一&rdquo;前上市，近似苛刻的品质要求、全程冷链控制、环保便捷的包装，使这珍稀的猕猴桃内在品质得以彰显，实为新鲜美味，营养全面的高档礼品，是馈赠亲友的佳品之选。&lt;/span&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('144', '1', '竹纤维双层毛巾', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('146', '1', '竹纤维战马毛巾', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('147', '1', '竹纤维竹棉毛巾', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('148', '1', '竹纤维小兔毛巾', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('149', '1', '竹纤维全竹毛巾', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('150', '1', '竹纤维内裤', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('151', '1', '莫代尔男士内衣', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('152', '1', '男士印花内衣', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('153', '1', '男士休闲提花内衣', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('154', '1', '女士休闲印花内衣', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('155', '1', '女士美体保暖内衣', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('230', '3', ' 赤霞珠干红葡萄酒（05尊爵）', '<p>	<b>&nbsp;</b><b><span style=\"font-family:宋体;\">赤霞珠干红葡萄酒（</span></b><b><span>05</span></b><b><span style=\"font-family:宋体;\">尊爵）</span></b><b> </b><span style=\"font-family:Arial;background-color:white;\"></span></p><p style=\"text-indent:15.75pt;\">	<span style=\"font-family:Arial;background-color:white;\">&nbsp;</span><span style=\"font-family:宋体;background-color:white;\">本产品呈深宝石红色，香气浓郁、优雅、散发着单宁的芬芳和可可树细腻的清香，口感和谐醇厚。选用法国著名葡萄产区栽培的国际酿酒名种葡萄</span><span style=\"font-family:Arial;background-color:white;\">-</span><span style=\"font-family:宋体;background-color:white;\">赤霞珠为原料，采用先进的生产设备和传统的酿造工艺，有效的浸提葡萄中的优质单宁、色素及其他成分，并经窖藏酿造而成。</span><span style=\"font-family:Arial;background-color:white;\"></span></p>', ' 赤霞珠干红葡萄酒（05尊爵）   本产品呈深宝石红色，香气浓郁、优雅、散发着单宁的芬芳和可可树细腻的清香，口感和谐醇厚。选用法国著名葡萄产区栽培的国际酿酒名种葡萄-赤霞珠为原料，采用先进的生产设备和传统的酿造工艺，有效的浸提葡萄中的优质单宁、色素及其他成分，并经窖藏酿造而成。', '', '');
INSERT INTO `js_product_description` VALUES ('133', '1', '青春增效白精华', '&lt;table class=&quot;ke-zeroborder&quot; border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; width=&quot;740&quot;&gt;	&lt;tbody&gt;		&lt;tr&gt;			&lt;td style=&quot;border-bottom:#cccccc 1px solid;padding-bottom:8px;padding-top:8px;&quot; width=&quot;118&quot;&gt;				&lt;strong&gt;&lt;span style=&quot;font-family:simhei;&quot;&gt;&lt;span style=&quot;font-size:15px;&quot;&gt;主要功能&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;			&lt;/td&gt;			&lt;td style=&quot;border-bottom:#cccccc 1px solid;padding-bottom:8px;padding-top:8px;&quot;&gt;				&lt;span style=&quot;font-size:x-small;&quot;&gt;保湿、补水 美白去黄气&lt;/span&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;border-bottom:#cccccc 1px solid;padding-bottom:8px;padding-top:8px;&quot; width=&quot;118&quot;&gt;				&lt;strong&gt;&lt;span style=&quot;font-family:simhei;&quot;&gt;&lt;span style=&quot;font-size:15px;&quot;&gt;适合人群&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;			&lt;/td&gt;			&lt;td style=&quot;border-bottom:#cccccc 1px solid;padding-bottom:8px;padding-top:8px;&quot;&gt;				&lt;p&gt;					&lt;span style=&quot;font-size:12px;&quot;&gt;&lt;span style=&quot;font-family:simsun;&quot;&gt;&lt;span style=&quot;font-size:x-small;&quot;&gt;适用年龄：22岁以上&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;				&lt;/p&gt;				&lt;p&gt;					&lt;span style=&quot;font-size:12px;&quot;&gt;&lt;span style=&quot;font-family:simsun;&quot;&gt;&lt;span style=&quot;font-size:x-small;&quot;&gt;适用肤质：任何肌肤&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;				&lt;/p&gt;				&lt;p&gt;					&lt;span style=&quot;font-size:12px;&quot;&gt;&lt;span style=&quot;font-family:simsun;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12px;&quot;&gt;&lt;span style=&quot;font-family:simsun;&quot;&gt;&lt;span style=&quot;font-size:x-small;&quot;&gt;适用对象：肌肤缺水干燥的人群、面色暗黄粗糙的人群、注重肌肤保养的人群、有一定品牌意识的人群&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;border-bottom:#cccccc 1px solid;padding-bottom:8px;padding-top:8px;&quot; width=&quot;118&quot;&gt;				&lt;strong&gt;&lt;span style=&quot;font-size:15px;&quot;&gt;&lt;span style=&quot;font-family:simhei;&quot;&gt;主要成分&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;			&lt;/td&gt;			&lt;td style=&quot;border-bottom:#cccccc 1px solid;padding-bottom:8px;padding-top:8px;&quot;&gt;				&lt;span style=&quot;font-family:宋体;font-size:x-small;&quot;&gt;先进科技萃取甘草、当归、灵芝等珍贵的中药植物精华与精油成分&lt;/span&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;border-bottom:#cccccc 1px solid;padding-bottom:8px;padding-top:8px;&quot; width=&quot;118&quot;&gt;				&lt;strong&gt;&lt;span style=&quot;font-family:simhei;&quot;&gt;&lt;span style=&quot;font-size:15px;&quot;&gt;产品说明&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;			&lt;/td&gt;			&lt;td style=&quot;border-bottom:#cccccc 1px solid;padding-bottom:8px;padding-top:8px;&quot;&gt;				&lt;span style=&quot;font-family:宋体;font-size:x-small;&quot;&gt;&lt;span style=&quot;font-size:x-small;&quot;&gt;&lt;span style=&quot;font-size:x-small;&quot;&gt; 				&lt;p&gt;					&lt;span style=&quot;font-size:x-small;&quot;&gt;改善皮肤粗糙、黑黄现象、还能快速修复细胞组织，增进皮肤对营养成份的吸收，恢复皮肤光滑、白嫩、细腻状态！&lt;/span&gt;				&lt;/p&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;border-bottom:#cccccc 1px solid;padding-bottom:8px;padding-top:8px;&quot; width=&quot;118&quot;&gt;				&lt;strong&gt;&lt;span style=&quot;font-family:simhei;&quot;&gt;&lt;span style=&quot;font-size:15px;&quot;&gt;使用方法&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;			&lt;/td&gt;			&lt;td style=&quot;border-bottom:#cccccc 1px solid;padding-bottom:8px;padding-top:8px;&quot;&gt;				&lt;span style=&quot;font-size:x-small;&quot;&gt; 				&lt;p&gt;					用法：早晚使用、取适量本品于面部轻拍至吸收。				&lt;/p&gt;				&lt;p&gt;					提示：建议与快乐细白晚霜搭配一起于夜间使用效果佳，欲想要加快效果可配合炫丽真白晚霜一起使用效果更佳。				&lt;/p&gt;&lt;/span&gt;			&lt;/td&gt;		&lt;/tr&gt;	&lt;/tbody&gt;&lt;/table&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('231', '3', '赤霞珠干红葡萄酒（08庄园之星）', '<p style=\"text-indent:10.45pt;\">	<b><span style=\"font-family:宋体;background-color:white;\">赤霞珠干红葡萄酒（</span></b><b><span style=\"font-family:Arial;background-color:white;\">08</span></b><b><span style=\"font-family:宋体;background-color:white;\">庄园之星）</span></b><b><span style=\"font-family:Arial;background-color:white;\"></span></b></p><b><span style=\"font-size:10.5pt;font-family:Arial;background-color:white;\">&nbsp; </span></b><span style=\"font-size:10.5pt;font-family:宋体;background-color:white;\">本产品呈深宝石红色，香气浓郁、优雅、散发着单宁的芬芳和可可树细腻的清香，口感和谐醇厚。选用法国著名葡萄产区栽培的国际酿酒名种葡萄</span><span style=\"font-size:10.5pt;font-family:Arial;background-color:white;\">-</span><span style=\"font-size:10.5pt;font-family:宋体;background-color:white;\">赤霞珠为原料，采用先进的生产设备和传统的酿造工艺，有效的浸提葡萄中的优质单宁、色素及其他成分，并经窖藏酿造而成</span>', '赤霞珠干红葡萄酒（08庄园之星）   本产品呈深宝石红色，香气浓郁、优雅、散发着单宁的芬芳和可可树细腻的清香，口感和谐醇厚。选用法国著名葡萄产区栽培的国际酿酒名种葡萄-赤霞珠为原料，采用先进的生产设备和传统的酿造工艺，有效的浸提葡萄中的优质单宁、色素及其他成分，并经窖藏酿造而成', '', '');
INSERT INTO `js_product_description` VALUES ('129', '1', '青春水透雪肤霜', '适用肤质：干性和混合性肤质&lt;br /&gt;主要功效：蕴含多种名贵天然草本植物精华；质地非常细腻、清爽，能迅速渗透皮肤表层，全面呵护肌肤，重塑婴儿般的柔嫩、光滑。改善粗糙的表皮，修复受损的肌肤，令肌肤晶莹白皙。&lt;br /&gt;使用方法:洁面、爽肤后，取适量置于掌心，涂抹整个脸部。&lt;br /&gt;注意事项:使用后请拧紧瓶盖，请置于阴凉干燥处，避免阳光直射，请置于幼儿无法取得之处。&lt;br /&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('130', '1', '青春增效水养霜', '&lt;li title=&quot;&nbsp;面霜&quot;&gt;	乳液/面霜品类:&nbsp;面霜&lt;/li&gt;&lt;li title=&quot;&nbsp;正常规格&quot;&gt;	规格:&nbsp;正常规格&lt;/li&gt;&lt;li title=&quot;&nbsp;美白&nbsp;补水&nbsp;其他功效&quot;&gt;	功效:&nbsp;美白&nbsp;补水&nbsp;其他功效&lt;/li&gt;&lt;li title=&quot;&nbsp;50g/ml&quot;&gt;	化妆品容量:&nbsp;1.05FL OZLIQ/30g&lt;/li&gt;&lt;li title=&quot;&nbsp;other/其他&quot;&gt;	品牌:&nbsp;肌源&lt;/li&gt;&lt;li title=&quot;&nbsp;other/其他&quot;&gt;	乳液/面霜单品:&nbsp;其他单品&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('131', '1', '青春隔离防护霜', '&lt;em&gt;产品参数：&lt;/em&gt; &lt;ul id=&quot;J_AttrUL&quot;&gt;	&lt;li title=&quot;阿芙 ve高等防护霜&quot;&gt;		产品名称：青春隔离防护霜	&lt;/li&gt;	&lt;li title=&quot;&nbsp;面霜&quot;&gt;		乳液/面霜品类:&nbsp;面霜	&lt;/li&gt;	&lt;li title=&quot;&nbsp;正常规格&quot;&gt;		规格:&nbsp;正常规格	&lt;/li&gt;	&lt;li title=&quot;&nbsp;美白&nbsp;保湿&quot;&gt;		功效:&nbsp;美白&nbsp;保湿	&lt;/li&gt;	&lt;li title=&quot;&nbsp;所有肤质&quot;&gt;		适合肤质:&nbsp;所有肤质	&lt;/li&gt;	&lt;li title=&quot;&nbsp;78g/ml&quot;&gt;		化妆品容量:&nbsp;1.05FL OZLIQ/30g	&lt;/li&gt;	&lt;li id=&quot;J_attrBrandName&quot; title=&quot;&nbsp;阿芙&quot;&gt;		品牌:&nbsp;肌源	&lt;/li&gt;	&lt;li title=&quot;&nbsp;ve高等防护霜&quot;&gt;		乳液/面霜单品:&nbsp;ve高等防护霜	&lt;/li&gt;&lt;/ul&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('132', '1', '青春增效水养乳', '&lt;p&gt;	&nbsp;&lt;/p&gt;&lt;li title=&quot;膜法世家&middot;1908 金沙水养嫩白乳液&quot;&gt;	产品名称：青春增效水养乳&lt;/li&gt;&lt;li title=&quot;膜法世家&middot;1908 金沙水养嫩白乳液&quot;&gt;	乳液/面霜品类:&nbsp;乳液&lt;/li&gt;&lt;li title=&quot;&nbsp;正常规格&quot;&gt;	规格:&nbsp;正常规格&lt;/li&gt;&lt;li title=&quot;&nbsp;提亮肤色&nbsp;抗氧化&nbsp;美白&nbsp;补水&nbsp;保湿&nbsp;其他功效&nbsp;抗衰老/抗皱&nbsp;晒后修护&nbsp;收缩毛孔抗衰老/抗皱&quot;&gt;	功效:&nbsp;提亮肤色&nbsp;抗氧化&nbsp;美白&nbsp;补水&nbsp;保湿&nbsp;其他功效&nbsp;抗衰老/抗皱&nbsp;晒后修护&nbsp;收缩毛孔抗衰老/抗皱&lt;/li&gt;&lt;li title=&quot;&nbsp;所有肤质&quot;&gt;	适合肤质:&nbsp;所有肤质&lt;/li&gt;&lt;li title=&quot;&nbsp;100g/ml&quot;&gt;	化妆品容量:&nbsp;3.5FL OZ LIQ/100ml&lt;/li&gt;&lt;li title=&quot;&nbsp;100g/ml&quot;&gt;	品牌:&nbsp;肌源&lt;/li&gt;&lt;li title=&quot;&nbsp;100g/ml&quot;&gt;	乳液/面霜单品:&nbsp;水养嫩白乳液&lt;/li&gt;&lt;li title=&quot;&nbsp;吸收度&nbsp;温和度&nbsp;舒适度&nbsp;自然度&nbsp;滋润度&quot;&gt;	化妆品特性:&nbsp;吸收度&nbsp;温和度&nbsp;舒适度&nbsp;自然度&nbsp;滋润度&lt;/li&gt;&lt;li title=&quot;&nbsp;无&quot;&gt;	特殊用途化妆品批准文号:&nbsp;无&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('232', '3', '大红袍水仙', '<b><span style=\"font-size:10.5pt;font-family:宋体;\">大红袍水仙：</span></b><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;background:white;\">大红袍，字面诠释是大红色的衣袍。一般用作红色植物的比喻和代称，最著名的是茶叶大红袍，产于福建</span><span style=\"font-size:10.5pt;font-family:&quot;\"><a href=\"http://baike.baidu.com/view/20069.htm\" target=\"_blank\"><span style=\"font-family:宋体;color:#136EC2;background:white;text-decoration:none;\"><span>武夷山</span></span></a></span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;background:white;\">，属</span><span style=\"font-size:10.5pt;font-family:&quot;\"><a href=\"http://baike.baidu.com/view/37254.htm\" target=\"_blank\"><span style=\"font-family:宋体;color:#136EC2;background:white;text-decoration:none;\"><span>武夷岩茶</span></span></a></span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;background:white;\">，是中国十大名茶之一。品质优异。另外有与大红袍同名的豆科植物</span><span style=\"font-size:10.5pt;font-family:Arial;color:#333333;background:white;\">“</span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;background:white;\">扁皂角</span><span style=\"font-size:10.5pt;font-family:Arial;color:#333333;background:white;\">”</span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;background:white;\">；浙江余杭等地的主栽桔子品种；京剧传统剧目；同名商标如甘肃省东乡县名牌花椒；</span><span style=\"font-size:10.5pt;font-family:&quot;\"><a href=\"http://baike.baidu.com/view/4194.htm\" target=\"_blank\"><span style=\"font-family:宋体;color:#136EC2;background:white;text-decoration:none;\"><span>霹雳布袋戏</span></span></a></span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;background:white;\">虚拟人物等。</span>', '4》	大红袍水仙：大红袍，字面诠释是大红色的衣袍。一般用作红色植物的比喻和代称，最著名的是茶叶大红袍，产于福建武夷山，属武夷岩茶，是中国十大名茶之一。品质优异。另外有与大红袍同名的豆科植物“扁皂角”；浙江余杭等地的主栽桔子品种；京剧传统剧目；同名商标如甘肃省东乡县名牌花椒；霹雳布袋戏虚拟人物等。', '', '');
INSERT INTO `js_product_description` VALUES ('113', '1', 'XR0017P', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('114', '1', 'XR0016P', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('115', '1', 'XR0015P', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('116', '1', 'XR0013P', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('117', '1', 'XR0012P', '&lt;span style=&quot;white-space:nowrap;&quot;&gt;主图来源: 自主实拍图&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;品牌: 诺博万&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;货号: XR0016P&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;风格: 通勤&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;衣长: 长款&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖长: 长袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;领型: 毛领&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖型: 常规袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;面料材质: 貂毛&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;流行元素/工艺: 口袋 毛领&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;年份/季节: 2013冬季&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;颜色分类: 豹纹&lt;/span&gt;&lt;br /&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('118', '1', 'XR0011P', '&lt;span style=&quot;white-space:nowrap;&quot;&gt;主图来源: 自主实拍图&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;品牌: 诺博万&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;货号: XR0011P&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;风格: 通勤&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;衣长: 长款&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖长: 长袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;领型: 毛领&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖型: 常规袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;面料材质: 貂毛&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;流行元素/工艺: 口袋 毛领&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;年份/季节: 2013冬季&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;颜色分类: 黑色&lt;/span&gt;&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('119', '1', 'XR0010P', '&lt;span style=&quot;white-space:nowrap;&quot;&gt;主图来源: 自主实拍图&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;品牌: 诺博万&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;货号: XR0010P&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;风格: 通勤&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;衣长: 长款&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖长: 长袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;领型: 毛领&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖型: 常规袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;面料材质: 貂毛&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;流行元素/工艺: 口袋 毛领&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;年份/季节: 2013冬季&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;颜色分类: 红黑色&lt;/span&gt;&lt;br /&gt;&lt;div style=&quot;white-space:nowrap;&quot;&gt;	&lt;br /&gt;&lt;/div&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('120', '1', 'XR0009P', '&lt;span style=&quot;white-space:nowrap;&quot;&gt;主图来源: 店主实拍&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;品牌:诺博万&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;货号: XR0009P&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;风格: 通勤&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;衣长: 中款&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖长: 长袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;领型: 圆领&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;衣门襟: 开门襟样式&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;面料材质: 獭兔毛&nbsp;&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;年份/季节: 2013冬季&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;颜色分类:米色&lt;/span&gt;&lt;br /&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('121', '1', 'XR0008P', '&lt;span style=&quot;white-space:nowrap;&quot;&gt;主图来源: 店主实拍&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;品牌:诺博万&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;货号: XR0008P&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;风格: 通勤&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;衣长: 短款&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖长: 长袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;领型: 圆领&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;衣门襟: 开门襟样式&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;面料材质: 獭兔毛&nbsp;&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;年份/季节: 2013冬季&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;颜色分类: 黄色&lt;/span&gt;&lt;br /&gt;&lt;div style=&quot;white-space:nowrap;&quot;&gt;	&lt;br /&gt;&lt;/div&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('122', '1', 'XR0007P', '&lt;span style=&quot;white-space:nowrap;&quot;&gt;主图来源: 店主实拍&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;品牌:诺博万&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;货号: XR0007P&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;风格: 通勤&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;通勤: 韩版&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;衣长: 短款&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖长: 七分袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;领型: 圆领&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖型: 其他袖型&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;衣门襟: 其他门襟样式&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;面料材质: 獭兔毛&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;流行元素/工艺: 拼贴/拼接&nbsp;&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;年份/季节: 2013冬季&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;颜色分类: 米粉色 &nbsp; 黑白色 砖红黑色&lt;/span&gt;&lt;br /&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('233', '3', '凤凰单枞水仙', '<b><span style=\"font-size:10.5pt;font-family:宋体;\">凤凰单枞水仙：</span></b><span style=\"font-size:10.5pt;font-family:宋体;\">凤凰水仙品种分布于广东</span><span style=\"font-size:10.5pt;font-family:Arial;\"><a href=\"http://baike.baidu.com/view/82690.htm\" target=\"_blank\"><span style=\"font-family:宋体;color:windowtext;text-decoration:none;\">潮安</span></a></span><span style=\"font-size:10.5pt;font-family:宋体;\">、饶平、丰顺、焦岭、平远等县，为有性群体，小乔木型，主于粗，分枝粗壮较疏，较直立或半开展。大部分植株分校离地约</span><span style=\"font-size:10.5pt;font-family:Arial;\"> 20</span><span style=\"font-size:10.5pt;font-family:宋体;\">～</span><span style=\"font-size:10.5pt;font-family:Arial;\">40</span><span style=\"font-size:10.5pt;font-family:宋体;\">厘米，叶多水平略向上着生。叶型大，呈长椭圆形或椭圆形，多数平展或略向叶面卷，色泽绿，有油光，或淡绿欠油光，先端多突尖，叶尖下垂，略似鸟嘴，因此当地农民称之为</span><span style=\"font-size:10.5pt;font-family:Arial;\">“</span><span style=\"font-size:10.5pt;font-family:宋体;\">乌嘴茶</span><span style=\"font-size:10.5pt;font-family:Arial;\">”</span><span style=\"font-size:10.5pt;font-family:宋体;\">，叶的锯齿浅疏尚明，嫩芽梢多淡绿而少毫。从叶片结构看，凤凰水仙比</span><span style=\"font-size:10.5pt;font-family:Arial;\"><a href=\"http://baike.baidu.com/view/3523779.htm\" target=\"_blank\"><span style=\"font-family:宋体;color:windowtext;text-decoration:none;\">福建水仙</span></a></span><span style=\"font-size:10.5pt;font-family:宋体;\">品种更接近于野生型，抗逆性强。凤凰水仙植株较高大，树姿较直立，分枝较稀。叶片呈稍上斜状着生。叶长椭圆或椭圆形，叶面较平，叶身稍内折。春茶</span><span style=\"font-size:10.5pt;font-family:Arial;\">3</span><span style=\"font-size:10.5pt;font-family:宋体;\">月<span style=\"color:#333333;\">下旬萌发，一<b>芽三叶</b>盛期在</span></span><span style=\"font-size:10.5pt;font-family:Arial;color:#333333;\">4</span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;\">月中旬，百芽重</span><span style=\"font-size:10.5pt;font-family:Arial;color:#333333;\">86.2</span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;\">克，芽叶肥壮，少茸毛，淡绿色。结实力较强。产量高，最高亩产达</span><span style=\"font-size:10.5pt;font-family:Arial;color:#333333;\">400</span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;\">千克。</span>', '凤凰单枞水仙：凤凰水仙品种分布于广东潮安、饶平、丰顺、焦岭、平远等县，为有性群体，小乔木型，主于粗，分枝粗壮较疏，较直立或半开展。大部分植株分校离地约 20～40厘米，叶多水平略向上着生。叶型大，呈长椭圆形或椭圆形，多数平展或略向叶面卷，色泽绿，有油光，或淡绿欠油光，先端多突尖，叶尖下垂，略似鸟嘴，因此当地农民称之为“乌嘴茶”，叶的锯齿浅疏尚明，嫩芽梢多淡绿而少毫。从叶片结构看，凤凰水仙比福建水仙品种更接近于野生型，抗逆性强。凤凰水仙植株较高大，树姿较直立，分枝较稀。叶片呈稍上斜状着生。叶长椭圆或椭圆形，', '', '');
INSERT INTO `js_product_description` VALUES ('128', '1', '青春系列套装', '1.青春增效水养乳&lt;br /&gt;2.青春水透雪肤霜&lt;br /&gt;3.&lt;a href=&quot;http://website-edit.websiteonline.cn/product_detail?_v=preview&amp;domain=proddf830&amp;SessionID=cc7c034f13a8dce86777f9e321784eb5&amp;product_id=1371&quot;&gt;青春增效水养霜&lt;br /&gt;&lt;/a&gt;4.&lt;a href=&quot;http://website-edit.websiteonline.cn/product_detail?_v=preview&amp;domain=proddf830&amp;SessionID=cc7c034f13a8dce86777f9e321784eb5&amp;product_id=1370&quot;&gt;青春隔离防护霜&lt;br /&gt;&lt;/a&gt;5.&lt;a href=&quot;http://website-edit.websiteonline.cn/product_detail?_v=preview&amp;domain=proddf830&amp;SessionID=cc7c034f13a8dce86777f9e321784eb5&amp;product_id=1368&quot;&gt;青春增效白精华&lt;/a&gt;&lt;br /&gt;6.&lt;a href=&quot;http://website-edit.websiteonline.cn/product_detail?_v=preview&amp;domain=proddf830&amp;SessionID=cc7c034f13a8dce86777f9e321784eb5&amp;product_id=1367&quot;&gt;青春深层洁颜泡&lt;br /&gt;&lt;/a&gt;7.&lt;a href=&quot;http://website-edit.websiteonline.cn/product_detail?_v=preview&amp;domain=proddf830&amp;SessionID=cc7c034f13a8dce86777f9e321784eb5&amp;product_id=1366&quot;&gt;青春精华保湿液&lt;/a&gt;&lt;br /&gt;&lt;table style=&quot;width:108pt;border-collapse:collapse;&quot; width=&quot;144&quot; height=&quot;133&quot;&gt;	&lt;tbody&gt;		&lt;tr&gt;			&lt;td style=&quot;font-style:normal;color:#000000;font-size:10.5pt;vertical-align:middle;font-weight:700;text-decoration:none;&quot; height=&quot;19&quot; width=&quot;72&quot;&gt;			&lt;/td&gt;			&lt;td style=&quot;font-style:normal;color:#000000;font-size:12pt;vertical-align:middle;font-weight:400;text-decoration:none;&quot; height=&quot;19&quot; width=&quot;72&quot;&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;font-style:normal;color:#000000;font-size:10.5pt;vertical-align:middle;font-weight:700;text-decoration:none;&quot; height=&quot;19&quot; width=&quot;72&quot;&gt;			&lt;/td&gt;			&lt;td style=&quot;font-style:normal;color:#000000;font-size:12pt;vertical-align:middle;font-weight:400;text-decoration:none;&quot; height=&quot;19&quot; width=&quot;72&quot;&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;font-style:normal;color:#000000;font-size:10.5pt;vertical-align:middle;font-weight:700;text-decoration:none;&quot; height=&quot;19&quot; width=&quot;72&quot;&gt;			&lt;/td&gt;			&lt;td style=&quot;font-style:normal;color:#000000;font-size:12pt;vertical-align:middle;font-weight:400;text-decoration:none;&quot; height=&quot;19&quot; width=&quot;72&quot;&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;font-style:normal;color:#000000;font-size:10.5pt;vertical-align:middle;font-weight:700;text-decoration:none;&quot; height=&quot;19&quot; width=&quot;72&quot;&gt;			&lt;/td&gt;			&lt;td style=&quot;font-style:normal;color:#000000;font-size:12pt;vertical-align:middle;font-weight:400;text-decoration:none;&quot; height=&quot;19&quot; width=&quot;72&quot;&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;font-style:normal;color:#000000;font-size:10.5pt;vertical-align:middle;font-weight:700;text-decoration:none;&quot; height=&quot;19&quot; width=&quot;72&quot;&gt;			&lt;/td&gt;			&lt;td style=&quot;font-style:normal;color:#000000;font-size:12pt;vertical-align:middle;font-weight:400;text-decoration:none;&quot; height=&quot;19&quot; width=&quot;72&quot;&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;font-style:normal;color:#000000;font-size:10.5pt;vertical-align:middle;font-weight:700;text-decoration:none;&quot; height=&quot;19&quot; width=&quot;72&quot;&gt;			&lt;/td&gt;			&lt;td style=&quot;font-style:normal;color:#000000;font-size:12pt;vertical-align:middle;font-weight:400;text-decoration:none;&quot; height=&quot;19&quot; width=&quot;72&quot;&gt;			&lt;/td&gt;		&lt;/tr&gt;		&lt;tr&gt;			&lt;td style=&quot;font-style:normal;color:#000000;font-size:10.5pt;vertical-align:middle;font-weight:700;text-decoration:none;&quot; height=&quot;19&quot; width=&quot;72&quot;&gt;			&lt;/td&gt;			&lt;td style=&quot;font-style:normal;color:#000000;font-size:12pt;vertical-align:middle;font-weight:400;text-decoration:none;&quot; height=&quot;19&quot; width=&quot;72&quot;&gt;			&lt;/td&gt;		&lt;/tr&gt;	&lt;/tbody&gt;&lt;/table&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('127', '1', 'XR0001P', '&lt;span style=&quot;white-space:nowrap;&quot;&gt;主图来源: 店主实拍&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;品牌:诺博万&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;货号: XR0001P&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;风格: 通勤&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;通勤: 韩版&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;衣长: 长款&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖长: 长袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;领型: 圆领&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;面料材质: 獭兔毛&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;流行元素/工艺: 拼贴/拼接&nbsp;&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;年份/季节: 2013冬季&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;颜色分类: 蓝色&lt;/span&gt;&lt;br /&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('234', '3', '凤凰单枞署来', '<p style=\"background:white;\">	<b><span style=\"font-family:宋体;\">凤凰单纵署来：</span></b><b><span style=\"font-family:宋体;color:#333333;\">单枞茶</span></b><span style=\"font-family:Arial;color:#333333;\">&nbsp;</span><span style=\"font-family:宋体;color:#333333;\">单枞茶，属半发酵的乌龙茶系，条形细长、紧索，呈青褐色、红褐色或暗褐色，主产于广东省潮州市。潮州境内又分三个产区：潮安县的凤凰镇、铁铺镇，饶平县。其中以凤凰镇的茶叶最负盛名，因此单枞茶又被称为凤凰单枞或凤凰茶。</span><span style=\"font-family:Arial;color:#333333;\"></span></p>', '凤凰单纵署来：单枞茶 单枞茶，属半发酵的乌龙茶系，条形细长、紧索，呈青褐色、红褐色或暗褐色，主产于广东省潮州市。潮州境内又分三个产区：潮安县的凤凰镇、铁铺镇，饶平县。其中以凤凰镇的茶叶最负盛名，因此单枞茶又被称为凤凰单枞或凤凰茶。', '', '');
INSERT INTO `js_product_description` VALUES ('126', '1', 'XR0002P', '&lt;span style=&quot;white-space:nowrap;&quot;&gt;主图来源: 店主实拍&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;品牌:诺博万&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;货号: XR0002P&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;风格: 通勤&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;衣长: 中款&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖长: 短袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;领型: 圆领&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;衣门襟: 开门襟样式&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;面料材质: 獭兔毛&nbsp;&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;年份/季节: 2013冬季&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;颜色分类: 粉色&lt;/span&gt;&lt;br /&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('235', '3', '铁观音浓香', '<p style=\"margin-left:18.0pt;text-indent:-18.0pt;\">	<b><span style=\"font-family:宋体;\">铁观音浓香：</span></b><span style=\"font-family:宋体;background:white;\">浓香型铁观音属传统半发醇的安溪铁观音茶，适合资深茶友饮用，因为口感较重，叶子的成色看上去在绿色的茶叶后面还有轻黑和微黄的叶子。</span><span></span></p>', '铁观音浓香：浓香型铁观音属传统半发醇的安溪铁观音茶，适合资深茶友饮用，因为口感较重，叶子的成色看上去在绿色的茶叶后面还有轻黑和微黄的叶子。', '', '');
INSERT INTO `js_product_description` VALUES ('112', '1', 'XR0018P', '&lt;span style=&quot;white-space:nowrap;&quot;&gt;主图来源: 自主实拍图&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;品牌: 诺博万&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;货号: XR0018P&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;风格: 通勤&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;衣长: 长款&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖长: 长袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;领型: 毛领&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖型: 常规袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;面料材质: 貂毛&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;流行元素/工艺: 口袋 毛领&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;年份/季节: 2013冬季&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;颜色分类: 黑色&lt;/span&gt;&lt;br /&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('125', '1', 'XR0003P', '&lt;span style=&quot;white-space:nowrap;&quot;&gt;主图来源: 店主实拍&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;品牌:诺博万&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;货号: XR0003P&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;风格: 通勤&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;衣长: 短款&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖长: 无袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;领型: 圆领&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;衣门襟: 开门襟样式&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;面料材质: 獭兔毛&nbsp;&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;年份/季节: 2013冬季&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;颜色分类: 图片色&lt;/span&gt;&lt;br /&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('123', '1', 'XR0006P', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('124', '1', 'XR0005P', '&lt;span style=&quot;white-space:nowrap;&quot;&gt;图来源: 店主实拍&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;品牌:诺博万&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;货号: XR0005P&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;风格: 通勤&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;衣长: 中款&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖长: 长袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;领型: 圆领&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;衣门襟: 开门襟样式带有珍珠&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;&nbsp;年份/季节: 2013冬季&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;颜色分类: 图片色&lt;/span&gt;&lt;br /&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('236', '3', '铁观音清香', '<p>	<b><span style=\"font-family:宋体;\">铁观音清香：</span></b><span style=\"font-family:宋体;background:white;\">铁观音</span><span style=\"font-family:Arial;background:white;\"> </span><span style=\"font-family:宋体;background:white;\">问着淡香</span><span style=\"font-family:Arial;background:white;\"> </span><span style=\"font-family:宋体;background:white;\">泡出来是清香</span><span style=\"font-family:Arial;background:white;\"> </span><span style=\"font-family:宋体;background:white;\">茗一口</span><span style=\"font-family:Arial;background:white;\"> </span><span style=\"font-family:宋体;background:white;\">唇齿甘甜</span><span style=\"font-family:Arial;background:white;\"> </span><span style=\"font-family:宋体;background:white;\">回味清香悠远</span><span style=\"font-family:Arial;background:white;\"> </span><span style=\"font-family:宋体;background:white;\">白茶</span><span style=\"font-family:Arial;background:white;\"> </span><span style=\"font-family:宋体;background:white;\">品在口中是清鲜淡然</span><span style=\"font-family:Arial;background:white;\"> </span><span style=\"font-family:宋体;background:white;\">虽没有铁观音那么的香醇</span><span style=\"font-family:Arial;background:white;\"> </span><span style=\"font-family:宋体;background:white;\">但是淡淡的清香浑然是自成一派</span><span style=\"font-family:Arial;background:white;\"> </span><span style=\"font-family:宋体;background:white;\">别致而独特</span><span style=\"font-family:Arial;background:white;\"> </span><span style=\"font-family:宋体;background:white;\">永远无法割舍与淡忘</span><span></span></p>', '铁观音清香：铁观音 问着淡香 泡出来是清香 茗一口 唇齿甘甜 回味清香悠远 白茶 品在口中是清鲜淡然 虽没有铁观音那么的香醇 但是淡淡的清香浑然是自成一派 别致而独特 永远无法割舍与淡忘', '', '');
INSERT INTO `js_product_description` VALUES ('107', '1', 'XR0023P', '&lt;div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		主图来源:&nbsp;自主实拍图	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		货号:&nbsp;XR0023P	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		板型:&nbsp;修身型	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		风格:&nbsp;通勤	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		通勤:&nbsp;韩版	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		款式:&nbsp;常规款	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		袖长:&nbsp;长袖	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		领型:&nbsp;圆领	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		袖型:&nbsp;常规袖	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		衣门襟:&nbsp;纽扣	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		皮质:&nbsp;羊皮	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		流行元素/工艺:&nbsp;拉链&nbsp;&nbsp;高温定型&nbsp;口袋&nbsp;拼贴/拼接&nbsp;	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		颜色分类:&nbsp;&nbsp;图片色	&lt;/div&gt;&lt;/div&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('108', '1', 'XR0022P', '&lt;span style=&quot;white-space:nowrap;&quot;&gt;主图来源: 自主实拍图&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;货号: XR0022P&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;板型: 修身型&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;风格: 通勤&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;通勤: 韩版&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;款式: 常规款&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖长: 长袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;领型: 圆领&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖型: 常规袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;衣门襟: 拉链&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;皮质: 羊皮&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;流行元素/工艺: 拉链 &nbsp;高温定型 口袋 拼贴/拼接 &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;颜色分类: &nbsp;黑色&lt;/span&gt;&lt;br /&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('109', '1', 'XR0021P', '&lt;span style=&quot;white-space:nowrap;&quot;&gt;主图来源: 自主实拍图&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;货号: XR0021P&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;板型: 修身型&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;风格: 通勤&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;通勤: 韩版&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;款式: 常规款&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖长: 长袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;领型: 圆领&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖型: 常规袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;衣门襟: 纽扣 拉链&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;皮质: 羊皮&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;流行元素/工艺: 拉链 &nbsp;高温定型 口袋 拼贴/拼接&nbsp;&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;颜色分类: &nbsp;图片色&lt;/span&gt;&lt;br /&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('237', '3', '正山小种瑞草', '<b><span style=\"font-size:10.5pt;font-family:宋体;\">正山小种瑞草：</span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;background:white;\">正山小种有机红茶汤色红亮</span></b><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;background:white;\">，滋味甘醇，具有天然的桂圆味及特有的松烟香。由于其产于原始森林内，野生采集，传统工艺制作，茶叶具有独特的保健功效，长期饮用保健养身，</span><span style=\"font-size:10.5pt;font-family:;\" \"=\"\"><a href=\"http://baike.baidu.com/view/3565.htm\" target=\"_blank\"><span style=\"font-family:宋体;color:#136EC2;background:white;text-decoration:none;\"><span>英国</span></span></a></span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;background:white;\">的一位老茶</span><span style=\"font-size:10.5pt;font-family:;\" \"=\"\"><a href=\"http://baike.baidu.com/view/1042162.htm\" target=\"_blank\"><span style=\"font-family:宋体;color:#136EC2;background:white;text-decoration:none;\"><span>师曾</span></span></a></span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;background:white;\">说：</span><span style=\"font-size:10.5pt;font-family:Arial;color:#333333;background:white;\">“</span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;background:white;\">喝这种茶胜过饮人参汤</span><span style=\"font-size:10.5pt;font-family:Arial;color:#333333;background:white;\">”</span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;background:white;\">。</span>', '正山小种瑞草：正山小种有机红茶汤色红亮，滋味甘醇，具有天然的桂圆味及特有的松烟香。由于其产于原始森林内，野生采集，传统工艺制作，茶叶具有独特的保健功效，长期饮用保健养身，英国的一位老茶师曾说：“喝这种茶胜过饮人参汤”。', '', '');
INSERT INTO `js_product_description` VALUES ('110', '1', 'XR0020P', '&lt;span style=&quot;white-space:nowrap;&quot;&gt;主图来源: 自主实拍图&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;货号: XR0020P&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;板型: 修身型&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;风格: 通勤&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;通勤: 韩版&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;款式: 常规款&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖长: 长袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;领型: 圆领&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖型: 常规袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;衣门襟: 拉链&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;皮质: 羊皮&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;流行元素/工艺: 拉链 &nbsp;高温定型 口袋 拼贴/拼接&nbsp;&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;颜色分类: &nbsp;图片色&lt;/span&gt;&lt;br /&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('111', '1', 'XR0019P', '&lt;span style=&quot;white-space:nowrap;&quot;&gt;主图来源: 自主实拍图&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;品牌: 诺博万&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;货号: XR0019P&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;风格: 通勤&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;衣长: 长款(80cm&lt;衣长&le;100cm)&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;袖长: 长袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;领型: 毛领袖型: 常规袖&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;面料材质: 貂毛&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;流行元素/工艺: 口袋 毛领&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;年份/季节: 2013冬季&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;颜色分类: 黑色&lt;/span&gt;&lt;br /&gt;&lt;div style=&quot;white-space:nowrap;&quot;&gt;	&lt;br /&gt;&lt;/div&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('238', '3', '正山小种古韵', '<b><span style=\"font-size:10.5pt;font-family:宋体;\">正山小种江南古韵：</span></b><span style=\"font-size:10.5pt;font-family:&quot;\"><a href=\"http://baike.baidu.com/view/782339.htm\" target=\"_blank\"><span style=\"font-family:宋体;color:#136EC2;background:white;text-decoration:none;\"><span>正山小种红茶</span></span></a></span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;background:white;\">，是世界红茶的鼻祖。又称拉普山小种，是</span><span style=\"font-size:10.5pt;font-family:&quot;\"><a href=\"http://baike.baidu.com/view/61891.htm\" target=\"_blank\"><span style=\"font-family:宋体;color:#136EC2;background:white;text-decoration:none;\"><span>中国</span></span></a></span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;background:white;\">生产的一种红茶，茶叶是用松针或松柴熏制而成，有着非常浓烈的香味。因为熏制的原因，茶叶呈黑色，但茶汤为深红色。正山小种产地在</span><span style=\"font-size:10.5pt;font-family:&quot;\"><a href=\"http://baike.baidu.com/view/2212.htm\" target=\"_blank\"><span style=\"font-family:宋体;color:#136EC2;background:white;text-decoration:none;\"><span>福建省</span></span></a></span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;background:white;\">武夷山市，受原产地保护。正山小种红茶是最古老的一种红茶，后来在正山小种的基础上发展了功夫红茶。</span>', '5》	正山小种江南古韵：正山小种红茶，是世界红茶的鼻祖。又称拉普山小种，是中国生产的一种红茶，茶叶是用松针或松柴熏制而成，有着非常浓烈的香味。因为熏制的原因，茶叶呈黑色，但茶汤为深红色。正山小种产地在福建省武夷山市，受原产地保护。正山小种红茶是最古老的一种红茶，后来在正山小种的基础上发展了功夫红茶。', '', '');
INSERT INTO `js_product_description` VALUES ('104', '1', 'XR0027P', '&lt;div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		主图来源:&nbsp;自主实拍图	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		货号:&nbsp;XR0027P	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		风格:&nbsp;街头	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		款式:&nbsp;短款	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		袖长:&nbsp;长袖	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		领型:&nbsp;连帽/帽领	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		袖型:&nbsp;其他袖型	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		衣门襟:&nbsp;拉链	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		皮质:&nbsp;羊皮	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		流行元素/工艺:&nbsp;拉链&nbsp;	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		&nbsp;口袋	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		品牌:&nbsp;潮流街头	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		颜色分类:&nbsp;&nbsp;深棕色	&lt;/div&gt;	&lt;div&gt;	&lt;/div&gt;&lt;/div&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('105', '1', 'XR0026P', '&lt;div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		主图来源:&nbsp;自主实拍图	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		货号:&nbsp;XR0026P	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		风格:&nbsp;街头	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		款式:&nbsp;短款	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		袖长:&nbsp;长袖	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		领型:&nbsp;连帽/帽领	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		袖型:&nbsp;其他袖型	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		衣门襟:&nbsp;拉链	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		皮质:&nbsp;羊皮	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		流行元素/工艺:&nbsp;拉链&nbsp;	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		&nbsp;口袋	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		品牌:&nbsp;潮流街头	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		颜色分类:&nbsp;&nbsp;深棕色	&lt;/div&gt;	&lt;div&gt;	&lt;/div&gt;&lt;/div&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('106', '1', 'XR0025P', '&lt;div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		主图来源:&nbsp;自主实拍图	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		货号:&nbsp;XR0025P	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		板型:&nbsp;修身型	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		风格:&nbsp;通勤	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		通勤:&nbsp;韩版	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		款式:&nbsp;常规款	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		袖长:&nbsp;长袖	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		领型:&nbsp;圆领	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		袖型:&nbsp;常规袖	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		衣门襟:&nbsp;拉链	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		皮质:&nbsp;羊皮	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		流行元素/工艺:&nbsp;拉链&nbsp;&nbsp;高温定型&nbsp;口袋&nbsp;拼贴/拼接&nbsp;不对称	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		颜色分类:&nbsp;&nbsp;图片色	&lt;/div&gt;&lt;/div&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('239', '3', '金骏眉醇之味', '<p style=\"margin-left:18.0pt;text-indent:-18.0pt;\">	<b><span style=\"font-family:宋体;\">金骏眉醇之味：</span></b><span style=\"font-size:9.0pt;font-family:宋体;background:white;\">金骏眉</span><span style=\"font-size:9.0pt;font-family:Arial;background:white;\"> </span><span style=\"font-size:9.0pt;font-family:宋体;background:white;\">味道醇厚</span><span style=\"font-size:9.0pt;font-family:Arial;background:white;\"> </span><span style=\"font-size:9.0pt;font-family:宋体;background:white;\">甘甜宜人</span><span style=\"font-size:9.0pt;font-family:Arial;background:white;\"> </span><span style=\"font-size:9.0pt;font-family:宋体;background:white;\">相较于一般的红茶</span><span style=\"font-size:9.0pt;font-family:Arial;background:white;\"> </span><span style=\"font-size:9.0pt;font-family:宋体;background:white;\">金骏眉更甘甜淡爽</span><span style=\"font-size:9.0pt;font-family:Arial;background:white;\"> </span><span style=\"font-size:9.0pt;font-family:宋体;background:white;\">也没有那么涩嘴</span><span style=\"font-size:9.0pt;font-family:Arial;background:white;\"> </span><span style=\"font-size:9.0pt;font-family:宋体;background:white;\">回味爽滑</span><span style=\"font-size:9.0pt;font-family:Arial;background:white;\"> </span><span style=\"font-size:9.0pt;font-family:宋体;background:white;\">香不绝口</span><span style=\"font-size:9.0pt;font-family:Arial;background:white;\"> </span><span style=\"font-size:9.0pt;font-family:宋体;background:white;\">且是带着果香的</span><span></span></p>', '金骏眉醇之味：金骏眉 味道醇厚 甘甜宜人 相较于一般的红茶 金骏眉更甘甜淡爽 也没有那么涩嘴 回味爽滑 香不绝口 且是带着果香的', '', '');
INSERT INTO `js_product_description` VALUES ('88', '1', '冰清玉洁   50头', '&lt;table style=&quot;width:100%;&quot; class=&quot;ke-zeroborder&quot; title=&quot;tbdescguide&quot; border=&quot;0&quot;&gt;	&lt;tbody&gt;		&lt;tr&gt;			&lt;td&gt;				&lt;p style=&quot;text-align:center;&quot;&gt;					&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:#444444;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;骨 质瓷是目前唯一世界上公认的高档瓷种，是权利和地位的象征，号称瓷器之王！骨质瓷制造工艺复杂，经过高温素烧和低温烧制而成的，欧洲标准上好的骨质瓷的骨 炭含量是40%以上，套装均价在几千元左右。其主要特点有瓷质细腻通透、器形美观典雅、瓷质轻薄、彩面润泽光亮。优质品用瓷勺敲打或手指轻弹，清脆响亮， 宛如洪钟。&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt; 				&lt;/p&gt;				&lt;p style=&quot;text-align:center;&quot;&gt;					&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:#444444;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;骨质瓷一定要用手清洗，不可用洗碗机。有金边的餐具，勿放入微波炉，以免腐蚀。如有刮花，可以用牙膏略打磨。如有茶渍，可用柠檬汁或食醋清洗。不要用明火直接烧用！&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt; 				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;	&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;	&nbsp;&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('103', '1', 'XR0028P', '&lt;div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		主图来源:&nbsp;自主实拍图	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		货号:XR0031P	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		风格:&nbsp;通勤	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		通勤:&nbsp;韩版	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		款式:&nbsp;常规款	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		袖长:&nbsp;长袖	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		领型:&nbsp;带帽	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		袖型:&nbsp;常规袖	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		皮质:&nbsp;羊皮	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		流行元素/工艺:&nbsp;纽扣	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		颜色分类:&nbsp;图片色	&lt;/div&gt;&lt;/div&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('101', '1', 'XR0030P', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('102', '1', 'XR0029P', '&lt;div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		主图来源:&nbsp;自主实拍图	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		货号:XR0031P	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		板型:&nbsp;修身型	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		风格:&nbsp;通勤	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		通勤:&nbsp;韩版	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		款式:&nbsp;常规款	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		袖长:&nbsp;长袖	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		领型:&nbsp;立领	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		袖型:&nbsp;常规袖	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		皮质:&nbsp;&lt;span style=&quot;text-align:center;white-space:normal;&quot;&gt;羊&lt;/span&gt;&lt;span style=&quot;text-align:center;white-space:normal;&quot;&gt;皮&lt;/span&gt;	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		流行元素/工艺:&nbsp;纽扣	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		颜色分类:&nbsp;图片色	&lt;/div&gt;&lt;/div&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('98', '1', 'XR0033P', '&lt;span style=&quot;white-space:nowrap;&quot;&gt;此款衣服外纯羊皮内有进口貂皮&lt;/span&gt;', '此款衣服外纯羊皮内有进口貂皮', '', '');
INSERT INTO `js_product_description` VALUES ('99', '1', 'XR0032P', '&lt;div&gt;	&lt;div style=&quot;text-align:left;&quot;&gt;		此款衣服内有纯进口貂皮领子也是貂绒的外皮是羊皮	&lt;/div&gt;	&lt;div&gt;	&lt;/div&gt;&lt;/div&gt;', '此款衣服内有纯进口貂皮领子也是貂绒的外皮是羊皮', '', '');
INSERT INTO `js_product_description` VALUES ('100', '1', 'XR0031P', '&lt;div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;货号&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:XR0031P &lt;/span&gt; 	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;板型&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:Arial;font-size:14px;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;修身型 &lt;/span&gt; 	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;风格&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:Arial;font-size:14px;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;通勤 &lt;/span&gt; 	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;通勤&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:Arial;font-size:14px;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;韩版 &lt;/span&gt; 	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;款式&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:Arial;font-size:14px;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;常规款 &lt;/span&gt; 	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;袖长&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:Arial;font-size:14px;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;长袖 &lt;/span&gt; 	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;领型&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:Arial;font-size:14px;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;立领 &lt;/span&gt; 	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;袖型&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:Arial;font-size:14px;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;常规袖 &lt;/span&gt; 	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;衣门襟&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:Arial;font-size:14px;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;拉链 &lt;/span&gt; 	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;皮质&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:Arial;font-size:14px;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;text-align:center;white-space:normal;&quot;&gt;羊&lt;/span&gt;&lt;span style=&quot;text-align:center;white-space:normal;&quot;&gt;皮&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt; &lt;/span&gt; 	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;流行元素&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;/&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;工艺&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:Arial;font-size:14px;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;拉链&lt;/span&gt;&lt;span style=&quot;font-family:Arial;font-size:14px;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:20pt;&quot;&gt; &lt;/span&gt; 	&lt;/div&gt;	&lt;div style=&quot;text-align:center;&quot;&gt;		&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;颜色分类&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:Arial;font-size:14px;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;黑色&lt;/span&gt; 	&lt;/div&gt;&lt;/div&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('240', '3', '金骏眉清风', '<p style=\"background:white;\">	<b><span style=\"font-family:宋体;\">金骏眉清风：</span></b><span style=\"font-family:宋体;color:#333333;\">金骏眉首创于</span><span style=\"font-family:Arial;color:#333333;\">2005</span><span style=\"font-family:宋体;color:#333333;\">年，是在武夷山</span><span style=\"font-family:Arial;color:#333333;\"><a href=\"http://baike.baidu.com/view/27510.htm\" target=\"_blank\"><span style=\"font-family:宋体;color:#136EC2;text-decoration:none;\">正山小种</span></a></span><span style=\"font-family:宋体;color:#333333;\">红茶传统工艺基础上进行改良，采用创新工艺研发的高端</span><span style=\"font-family:Arial;color:#333333;\"><a href=\"http://baike.baidu.com/view/6025.htm\" target=\"_blank\"><span style=\"font-family:宋体;color:#136EC2;text-decoration:none;\">红茶</span></a></span><span style=\"font-family:宋体;color:#333333;\">，它的诞生填补了国内市场无高端</span><span style=\"font-family:Arial;color:#333333;\"><a href=\"http://baike.baidu.com/view/6025.htm\" target=\"_blank\"><span style=\"font-family:宋体;color:#136EC2;text-decoration:none;\">红茶</span></a></span><span style=\"font-family:宋体;color:#333333;\">的空白，其名寓意：希冀金贵之茶犹如骏马奔腾般发展。金骏眉原料产自</span><span style=\"font-family:Arial;color:#333333;\"><a href=\"http://baike.baidu.com/view/20069.htm\" target=\"_blank\"><span style=\"font-family:宋体;color:#136EC2;text-decoration:none;\">武夷山</span></a></span><span style=\"font-family:宋体;color:#333333;\">国家级自然保护区内方圆</span><span style=\"font-family:Arial;color:#333333;\">565</span><span style=\"font-family:宋体;color:#333333;\">平方公里的原生态茶山，手工采摘后由茶师精心制作，每</span><span style=\"font-family:Arial;color:#333333;\">500</span><span style=\"font-family:宋体;color:#333333;\">克</span><span style=\"font-family:Arial;color:#333333;\"><a href=\"http://baike.baidu.com/view/2151158.htm\" target=\"_blank\"><span style=\"font-family:宋体;color:#136EC2;text-decoration:none;\">金骏眉</span></a></span><span style=\"font-family:宋体;color:#333333;\">约需</span><span style=\"font-family:Arial;color:#333333;\">6</span><span style=\"font-family:宋体;color:#333333;\">～</span><span style=\"font-family:Arial;color:#333333;\">8</span><span style=\"font-family:宋体;color:#333333;\">万颗芽尖。</span><span style=\"font-family:Arial;color:#333333;\"></span></p><p align=\"left\" style=\"margin-left:42pt;background-color:white;\">	<span style=\"font-family:宋体;color:#333333;\">正宗外形条索紧秀，略显绒毛，隽茂、重实；色泽为</span><span style=\"font-family:Arial;color:#333333;\"><a href=\"http://baike.baidu.com/view/36077.htm\" target=\"_blank\"><span style=\"font-family:宋体;color:#136EC2;text-decoration:none;\">金</span></a></span><span style=\"font-family:宋体;color:#333333;\">、</span><span style=\"font-family:Arial;color:#333333;\"><a href=\"http://baike.baidu.com/view/39214.htm\" target=\"_blank\"><span style=\"font-family:宋体;color:#136EC2;text-decoration:none;\">黄</span></a></span><span style=\"font-family:宋体;color:#333333;\">、</span><span style=\"font-family:Arial;color:#333333;\"><a href=\"http://baike.baidu.com/view/65616.htm\" target=\"_blank\"><span style=\"font-family:宋体;color:#136EC2;text-decoration:none;\">黑</span></a></span><span style=\"font-family:宋体;color:#333333;\">相间，色润；开汤汤色为金黄色，清澈有金圈；其水、香、味似果、蜜、花、薯等综合香型；啜一口入喉，甘甜感顿生，滋味鲜活甘爽，高山韵显，喉韵悠长，沁人心脾，仿佛使人置身于森林幽谷之中；杯底冷、热、温，不同时嗅之，底香持久、变幻令人遐想，连泡</span><span style=\"font-family:Arial;color:#333333;\">12</span><span style=\"font-family:宋体;color:#333333;\">次，口感仍然饱满甘甜；叶底舒展后，芽尖鲜活，秀挺亮丽，叶色呈古铜色。总之，金骏眉实属可遇不可求之茶中珍品。乃世界红茶之顶尖。</span><a name=\"2\"></a><a name=\"sub2151158_2\"></a><span style=\"font-family:Arial;color:#333333;\"></span></p>', '金骏眉清风：金骏眉首创于2005年，是在武夷山正山小种红茶传统工艺基础上进行改良，采用创新工艺研发的高端红茶，它的诞生填补了国内市场无高端红茶的空白，其名寓意：希冀金贵之茶犹如骏马奔腾般发展。金骏眉原料产自武夷山国家级自然保护区内方圆565平方公里的原生态茶山，手工采摘后由茶师精心制作，每500克金骏眉约需6～8万颗芽尖。 正宗外形条索紧秀，略显绒毛，隽茂、重实；色泽为金、黄、黑相间，色润；开汤汤色为金黄色，清澈有金圈；其水、香、味似果、蜜、花、薯等综合香型；啜一口入喉，甘甜感顿生，滋味鲜活甘爽，高山韵显', '', '');
INSERT INTO `js_product_description` VALUES ('241', '3', '面膜', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('79', '1', '优卡丝四件套D', '&lt;li title=&quot;&nbsp;四件套&quot;&gt;	床品套件:&nbsp;四件套&lt;/li&gt;&lt;li title=&quot;&nbsp;NteLose尼特罗斯&quot;&gt;	货号:&nbsp;WJ0071A&lt;/li&gt;&lt;li title=&quot;&nbsp;100022&quot;&gt;	面料材质:&nbsp;全棉&lt;/li&gt;&lt;li title=&quot;&nbsp;一般全棉&quot;&gt;	全棉种类:&nbsp;全棉&lt;/li&gt;&lt;li title=&quot;&nbsp;绗缝&nbsp;提花&nbsp;贡缎&quot;&gt;	床品工艺:&nbsp;绗缝&nbsp;提花&nbsp;贡缎&lt;/li&gt;&lt;li title=&quot;&nbsp;床单式&quot;&gt;	款式:&nbsp;床单式&lt;/li&gt;&lt;li title=&quot;&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情&quot;&gt;	颜色分类:&nbsp;图片色&lt;/li&gt;&lt;li title=&quot;&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情&quot;&gt;	产品等级:&nbsp;一等品&lt;/li&gt;&lt;li title=&quot;&nbsp;欧美风&quot;&gt;	床品风格:&nbsp;欧美风&lt;/li&gt;&lt;li title=&quot;&nbsp;符合相关国家标准&quot;&gt;	色牢度（级）:&nbsp;符合相关国家标准&lt;/li&gt;&lt;li title=&quot;&nbsp;符合相关国家标准&quot;&gt;	缩水率（水洗尺寸变化）:&nbsp;符合相关国家标准&lt;/li&gt;&lt;li title=&quot;&nbsp;欧式&quot;&gt;	家装风格:&nbsp;欧式&lt;/li&gt;&lt;li title=&quot;&nbsp;活性印花&quot;&gt;	印花工艺:&nbsp;活性印花&lt;/li&gt;&lt;li title=&quot;&nbsp;提花&quot;&gt;	织造工艺:&nbsp;提花&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('80', '1', '优卡丝四件套C', '已售完，暂无货', '', '', '');
INSERT INTO `js_product_description` VALUES ('81', '1', '优卡丝四件套B', '暂无货', '', '', '');
INSERT INTO `js_product_description` VALUES ('82', '1', '优卡丝四件套A', '&lt;p&gt;	已售完，暂无货&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('83', '1', '拉拉花园', '&lt;li title=&quot;&nbsp;四件套&quot;&gt;	床品套件:&nbsp;四件套&lt;/li&gt;&lt;li title=&quot;&nbsp;NteLose尼特罗斯&quot;&gt;	货号:&nbsp;WJ007A&lt;/li&gt;&lt;li title=&quot;&nbsp;100022&quot;&gt;	面料材质:&nbsp;全棉&lt;/li&gt;&lt;li title=&quot;&nbsp;一般全棉&quot;&gt;	全棉种类:&nbsp;全棉&lt;/li&gt;&lt;li title=&quot;&nbsp;绗缝&nbsp;提花&nbsp;贡缎&quot;&gt;	床品工艺:&nbsp;绗缝&nbsp;提花&nbsp;贡缎&lt;/li&gt;&lt;li title=&quot;&nbsp;床单式&quot;&gt;	款式:&nbsp;床单式&lt;/li&gt;&lt;li title=&quot;&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情&quot;&gt;	颜色分类:&nbsp;图片色&lt;/li&gt;&lt;li title=&quot;&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情&quot;&gt;	产品等级:&nbsp;一等品&lt;/li&gt;&lt;li title=&quot;&nbsp;欧美风&quot;&gt;	床品风格:韩版&lt;/li&gt;&lt;li title=&quot;&nbsp;欧美风&quot;&gt;	色牢度（级）:&nbsp;符合相关国家标准&lt;/li&gt;&lt;li title=&quot;&nbsp;符合相关国家标准&quot;&gt;	缩水率（水洗尺寸变化）:&nbsp;符合相关国家标准&lt;/li&gt;&lt;li title=&quot;&nbsp;活性印花&quot;&gt;	印花工艺:&nbsp;活性印花&lt;/li&gt;&lt;li title=&quot;&nbsp;提花&quot;&gt;	织造工艺:&nbsp;提花&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('84', '1', '春色之约 ', '&lt;li title=&quot;&nbsp;四件套&quot;&gt;	床品套件:&nbsp;四件套&lt;/li&gt;&lt;li title=&quot;&nbsp;NteLose尼特罗斯&quot;&gt;	货号:&nbsp;WJ0078A&lt;/li&gt;&lt;li title=&quot;&nbsp;100022&quot;&gt;	面料材质:&nbsp;全棉&lt;/li&gt;&lt;li title=&quot;&nbsp;一般全棉&quot;&gt;	全棉种类:&nbsp;全棉&lt;/li&gt;&lt;li title=&quot;&nbsp;绗缝&nbsp;提花&nbsp;贡缎&quot;&gt;	床品工艺:&nbsp;绗缝&nbsp;提花&nbsp;贡缎&lt;/li&gt;&lt;li title=&quot;&nbsp;床单式&quot;&gt;	款式:&nbsp;床单式&lt;/li&gt;&lt;li title=&quot;&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情&quot;&gt;	颜色分类:&nbsp;图片色&lt;/li&gt;&lt;li title=&quot;&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情&quot;&gt;	产品等级:&nbsp;一等品&lt;/li&gt;&lt;li title=&quot;&nbsp;欧美风&quot;&gt;	床品风格:韩版&lt;/li&gt;&lt;li title=&quot;&nbsp;欧美风&quot;&gt;	色牢度（级）:&nbsp;符合相关国家标准&lt;/li&gt;&lt;li title=&quot;&nbsp;符合相关国家标准&quot;&gt;	缩水率（水洗尺寸变化）:&nbsp;符合相关国家标准&lt;/li&gt;&lt;li title=&quot;&nbsp;活性印花&quot;&gt;	印花工艺:&nbsp;活性印花&lt;/li&gt;&lt;li title=&quot;&nbsp;提花&quot;&gt;	织造工艺:&nbsp;提花&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('85', '1', '午后红茶', '&lt;li title=&quot;&nbsp;四件套&quot;&gt;	床品套件:&nbsp;四件套&lt;/li&gt;&lt;li title=&quot;&nbsp;NteLose尼特罗斯&quot;&gt;	货号:&nbsp;WJ0075A&lt;/li&gt;&lt;li title=&quot;&nbsp;100022&quot;&gt;	面料材质:&nbsp;全棉&lt;/li&gt;&lt;li title=&quot;&nbsp;一般全棉&quot;&gt;	全棉种类:&nbsp;全棉&lt;/li&gt;&lt;li title=&quot;&nbsp;绗缝&nbsp;提花&nbsp;贡缎&quot;&gt;	床品工艺:&nbsp;绗缝&nbsp;提花&nbsp;贡缎&lt;/li&gt;&lt;li title=&quot;&nbsp;床单式&quot;&gt;	款式:&nbsp;床单式&lt;/li&gt;&lt;li title=&quot;&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情&quot;&gt;	颜色分类:&nbsp;图片色&lt;/li&gt;&lt;li title=&quot;&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情&quot;&gt;	产品等级:&nbsp;一等品&lt;/li&gt;&lt;li title=&quot;&nbsp;欧美风&quot;&gt;	床品风格:韩版&lt;/li&gt;&lt;li title=&quot;&nbsp;欧美风&quot;&gt;	色牢度（级）:&nbsp;符合相关国家标准&lt;/li&gt;&lt;li title=&quot;&nbsp;符合相关国家标准&quot;&gt;	缩水率（水洗尺寸变化）:&nbsp;符合相关国家标准&lt;/li&gt;&lt;li title=&quot;&nbsp;活性印花&quot;&gt;	印花工艺:&nbsp;活性印花&lt;/li&gt;&lt;li title=&quot;&nbsp;提花&quot;&gt;	织造工艺:&nbsp;提花&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('86', '1', '浪漫满屋  ', '&lt;li title=&quot;&nbsp;四件套&quot;&gt;	床品套件:&nbsp;四件套&lt;/li&gt;&lt;li title=&quot;&nbsp;NteLose尼特罗斯&quot;&gt;	货号:&nbsp;WJ0076A&lt;/li&gt;&lt;li title=&quot;&nbsp;100022&quot;&gt;	面料材质:&nbsp;全棉&lt;/li&gt;&lt;li title=&quot;&nbsp;一般全棉&quot;&gt;	全棉种类:&nbsp;全棉&lt;/li&gt;&lt;li title=&quot;&nbsp;绗缝&nbsp;提花&nbsp;贡缎&quot;&gt;	床品工艺:&nbsp;绗缝&nbsp;提花&nbsp;贡缎&lt;/li&gt;&lt;li title=&quot;&nbsp;床单式&quot;&gt;	款式:&nbsp;床单式&lt;/li&gt;&lt;li title=&quot;&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情&quot;&gt;	颜色分类:&nbsp;图片色&lt;/li&gt;&lt;li title=&quot;&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情&quot;&gt;	产品等级:&nbsp;一等品&lt;/li&gt;&lt;li title=&quot;&nbsp;欧美风&quot;&gt;	床品风格:韩版&lt;/li&gt;&lt;li title=&quot;&nbsp;欧美风&quot;&gt;	色牢度（级）:&nbsp;符合相关国家标准&lt;/li&gt;&lt;li title=&quot;&nbsp;符合相关国家标准&quot;&gt;	缩水率（水洗尺寸变化）:&nbsp;符合相关国家标准&lt;/li&gt;&lt;li title=&quot;&nbsp;活性印花&quot;&gt;	印花工艺:&nbsp;活性印花&lt;/li&gt;&lt;li title=&quot;&nbsp;提花&quot;&gt;	织造工艺:&nbsp;提花&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('242', '3', '小蜗牛', '<p style=\"margin-left:63.0pt;background:white;\">	<b>小蜗牛：</b><span style=\"font-size:10.0pt;color:#333333;\">蜗牛粘液过滤物（粘蛋白：</span><span style=\"font-size:10.0pt;font-family:Tahoma;color:#333333;\">Mucin</span><span style=\"font-size:10.0pt;color:#333333;\">）和植物干细胞（植物性干细胞：</span><span style=\"font-size:10.0pt;font-family:Tahoma;color:#333333;\">Phyto stem cell)</span><span style=\"font-size:10.0pt;color:#333333;\">的</span><span style=\"font-size:10.0pt;font-family:Tahoma;color:#333333;\">6</span><span style=\"font-size:10.0pt;color:#333333;\">种</span><span style=\"font-size:10.0pt;font-family:Tahoma;color:#333333;\">Complex</span><span style=\"font-size:10.0pt;color:#333333;\">按照适当的比例配比，最为第一道程序涂抹于面部。可以为肌肤提供充足的营养和水分，天然的</span><span style=\"font-size:10.0pt;font-family:Tahoma;color:#333333;\">Aroma oil</span><span style=\"font-size:10.0pt;color:#333333;\">为敏感的肌肤抵抗外界刺激提供保障、出色的修复和保湿效果，仅仅只使用化妆水也能得到充分的补水效果。</span><span style=\"font-size:9.0pt;font-family:Tahoma;color:#333333;\"></span></p><p style=\"background:white;\">	<span style=\"font-size:10.0pt;color:#333333;\">蜗牛粘液过滤物（粘蛋白：</span><span style=\"font-size:10.0pt;font-family:Tahoma;color:#333333;\">Mucin</span><span style=\"font-size:10.0pt;color:#333333;\">）和植物干细胞（植物性干细胞：</span><span style=\"font-size:10.0pt;font-family:Tahoma;color:#333333;\">Phyto stemcell)6</span><span style=\"font-size:10.0pt;color:#333333;\">种</span><span style=\"font-size:10.0pt;font-family:Tahoma;color:#333333;\">Complex</span><span style=\"font-size:10.0pt;color:#333333;\">按照适当的比例配比，最为第二道程序涂抹于面部。蜗牛粘液过滤物和植物干细胞</span><span style=\"font-size:10.0pt;font-family:Tahoma;color:#333333;\">Complex</span><span style=\"font-size:10.0pt;color:#333333;\">可以提升因外界环境的刺激而变得干燥的肌肤的柔软性，提供充分的营养和水分，令肌肤水水嫩嫩；天然的</span><span style=\"font-size:10.0pt;font-family:Tahoma;color:#333333;\">Aroma oil</span><span style=\"font-size:10.0pt;color:#333333;\">为敏感的肌肤抵抗外界刺激提供保障。</span><span style=\"font-size:9.0pt;font-family:Tahoma;color:#333333;\"></span></p><p style=\"background:white;\">	<span style=\"font-size:10.0pt;color:#333333;\">作为含有</span><span style=\"font-size:10.0pt;font-family:Tahoma;color:#333333;\">30%</span><span style=\"font-size:10.0pt;color:#333333;\">蜗牛粘液过滤物（粘蛋白：</span><span style=\"font-size:10.0pt;font-family:Tahoma;color:#333333;\">Mucin</span><span style=\"font-size:10.0pt;color:#333333;\">）和植物干细胞（植物性干细胞：</span><span style=\"font-size:10.0pt;font-family:Tahoma;color:#333333;\">Phyto stemcell)</span><span style=\"font-size:10.0pt;color:#333333;\">的</span><span style=\"font-size:10.0pt;font-family:Tahoma;color:#333333;\">6</span><span style=\"font-size:10.0pt;color:#333333;\">种</span><span style=\"font-size:10.0pt;font-family:Tahoma;color:#333333;\">COMPLEX</span><span style=\"font-size:10.0pt;color:#333333;\">按照适当的比例配比，同时含有令肌肤恢复弹性的腺苷（</span><span style=\"font-size:10.0pt;font-family:Tahoma;color:#333333;\">Adenosine)</span><span style=\"font-size:10.0pt;color:#333333;\">的第三道程序涂抹于面部。提升已经松弛的面部肌肤，天然的</span><span style=\"font-size:10.0pt;font-family:Tahoma;color:#333333;\">Aroma oil </span><span style=\"font-size:10.0pt;color:#333333;\">为敏感的肌肤抵抗外界刺激提供保障。</span><span style=\"font-size:9.0pt;font-family:Tahoma;color:#333333;\"></span></p>', '小蜗牛：蜗牛粘液过滤物（粘蛋白：Mucin）和植物干细胞（植物性干细胞：Phyto stem cell)的6种Complex按照适当的比例配比，最为第一道程序涂抹于面部。可以为肌肤提供充足的营养和水分，天然的Aroma oil为敏感的肌肤抵抗外界刺激提供保障、出色的修复和保湿效果，仅仅只使用化妆水也能得到充分的补水效果。', '', '');
INSERT INTO `js_product_description` VALUES ('97', '1', 'XR0035P', '&lt;div style=&quot;text-align:center;&quot;&gt;	&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;衣长&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:Arial;font-size:14px;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;一袖长 &lt;/span&gt; &lt;/div&gt;&lt;div style=&quot;text-align:center;&quot;&gt;	&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;版型&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:Arial;font-size:14px;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;修身型 &lt;/span&gt; &lt;/div&gt;&lt;div style=&quot;text-align:center;&quot;&gt;	&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;领型&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:Arial;font-size:14px;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;立领 &lt;/span&gt; &lt;/div&gt;&lt;div style=&quot;text-align:center;&quot;&gt;	&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;门襟&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:Arial;font-size:14px;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;拉链 &lt;/span&gt; &lt;/div&gt;&lt;div style=&quot;text-align:center;&quot;&gt;	&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;颜色&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:Arial;font-size:14px;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;黑色&lt;br /&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;皮衣材质&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-size:24pt;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;&lt;span style=&quot;text-align:center;white-space:normal;&quot;&gt;羊&lt;/span&gt;&lt;span style=&quot;text-align:center;white-space:normal;&quot;&gt;皮&lt;/span&gt;&lt;/span&gt; &lt;/div&gt;&lt;div style=&quot;text-align:center;&quot;&gt;	&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;品牌&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:Arial;font-size:14px;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;诺博万 &lt;/span&gt; &lt;/div&gt;&lt;div style=&quot;text-align:center;&quot;&gt;	&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;款式品名&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:Arial;font-size:14px;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;皮衣 &lt;/span&gt; &lt;/div&gt;&lt;div style=&quot;text-align:center;&quot;&gt;	&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;下摆设计&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:Arial;font-size:14px;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;本布下摆（针对拉链门襟） &lt;/span&gt; &lt;/div&gt;&lt;div style=&quot;text-align:center;&quot;&gt;	&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;基础风格&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:Arial;font-size:14px;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt;青春流行 &lt;/span&gt; &lt;/div&gt;&lt;div style=&quot;text-align:center;&quot;&gt;	&lt;span style=&quot;font-family:宋体;font-size:14px;&quot;&gt; 颜色：深棕色&lt;/span&gt; &lt;/div&gt;&lt;div&gt;&lt;/div&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('243', '3', '小红参', '<b><span style=\"font-size:10.5pt;font-family:宋体;\">小红参：</span></b><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;\">适合肤质：适合各类肌肤</span><span style=\"font-size:10.5pt;font-family:Arial;color:#333333;\">,</span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;\">对于去皱及抗衰老特别适用。</span><span style=\"font-size:10.5pt;font-family:Arial;color:#333333;\"><br /></span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;\">产品功效：含人参皂甙，增强胶原纤维和弹力纤维的功效，使皮肤紧实、富有光泽、改善皱纹；小麦蛋白极佳抗氧化和活肤效果，直接保护和激活细胞活力；高效保湿，有效预防肌肤衰老和干燥，锁住青春，永葆肌肤水嫩。</span>', '小红参：适合肤质：适合各类肌肤,对于去皱及抗衰老特别适用。 产品功效：含人参皂甙，增强胶原纤维和弹力纤维的功效，使皮肤紧实、富有光泽、改善皱纹；小麦蛋白极佳抗氧化和活肤效果，直接保护和激活细胞活力；高效保湿，有效预防肌肤衰老和干燥，锁住青春，永葆肌肤水嫩。', '', '');
INSERT INTO `js_product_description` VALUES ('91', '1', '精品虾皮', '&lt;h2 style=&quot;text-indent:8.85pt;background:white;margin-left:-3.8pt;&quot;&gt;	&lt;span style=&quot;color:#444444;font-size:9pt;&quot;&gt;精品虾皮&lt;/span&gt;&lt;span style=&quot;font-family:Tahoma;color:#444444;font-size:9pt;&quot;&gt;55&lt;/span&gt;&lt;span style=&quot;color:#444444;font-size:9pt;&quot;&gt;元一桶&lt;/span&gt;&lt;span style=&quot;font-family:Tahoma;color:#444444;font-size:9pt;&quot;&gt;&lt;/span&gt; &lt;/h2&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('244', '3', '大红参', '<pre><b>大红参：</b><span style=\"font-size:10.5pt;color:#333333;\">适合肤质：适合各类肌肤</span><span style=\"font-size:10.5pt;font-family:Arial;color:#333333;\">,</span><span style=\"font-size:10.5pt;color:#333333;\">对于去皱及抗衰老特别适用。</span><span style=\"font-size:10.5pt;font-family:Arial;color:#333333;\"> </span><span style=\"font-size:10.5pt;color:#333333;\">产品功效：含人参皂甙，增强胶原纤维和弹力纤维的功效，使皮肤紧实、富有光泽、改善皱纹；小麦蛋白极佳抗氧化和活肤效果，直接保护和激活细胞活力；高效保湿，有效预防肌肤衰老和干燥，锁住青春，永葆肌肤水嫩。</span><span style=\"font-size:10.5pt;font-family:Arial;color:#333333;\"></span></pre>', '大红参：适合肤质：适合各类肌肤,对于去皱及抗衰老特别适用。 产品功效：含人参皂甙，增强胶原纤维和弹力纤维的功效，使皮肤紧实、富有光泽、改善皱纹；小麦蛋白极佳抗氧化和活肤效果，直接保护和激活细胞活力；高效保湿，有效预防肌肤衰老和干燥，锁住青春，永葆肌肤水嫩。', '', '');
INSERT INTO `js_product_description` VALUES ('245', '3', 'MT胶原蛋白眼贴', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('95', '1', '海鲜大礼盒', '&lt;span style=&quot;font-family:宋体;color:#444444;font-size:9pt;&quot;&gt;海鲜大礼盒&lt;/span&gt;&lt;span style=&quot;font-family:Tahoma;color:#444444;font-size:9pt;&quot;&gt;758&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#444444;font-size:9pt;&quot;&gt;元一盒&lt;/span&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('246', '3', '粉蜗牛', '<b><span style=\"font-size:10.5pt;font-family:宋体;\">粉蜗牛：</span></b><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;background:white;\">功效：保湿</span><span style=\"font-size:10.5pt;font-family:Tahoma;color:#333333;background:white;\">,</span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;background:white;\">补水</span><span style=\"font-size:10.5pt;font-family:Tahoma;color:#333333;background:white;\">,</span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;background:white;\">提拉紧致</span><span style=\"font-size:10.5pt;font-family:Tahoma;color:#333333;background:white;\">,</span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;background:white;\">抗皱</span><span style=\"font-size:10.5pt;font-family:Tahoma;color:#333333;background:white;\">,</span><span style=\"font-size:10.5pt;font-family:宋体;color:#333333;background:white;\">抗衰老</span>', '粉蜗牛：功效：保湿,补水,提拉紧致,抗皱,抗衰老', '', '');
INSERT INTO `js_product_description` VALUES ('247', '3', '小蜗牛', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('92', '1', '精品虾米', '&lt;h2 style=&quot;text-indent:8.75pt;background:white;margin-left:-3.8pt;&quot;&gt;	&lt;span style=&quot;color:#444444;font-size:9pt;&quot;&gt;精品虾米&lt;/span&gt;&lt;span style=&quot;font-family:Tahoma;color:#444444;font-size:9pt;&quot;&gt;125&lt;/span&gt;&lt;span style=&quot;color:#444444;font-size:9pt;&quot;&gt;元一桶&lt;/span&gt;&lt;span style=&quot;font-family:Tahoma;color:#444444;font-size:9pt;&quot;&gt;&lt;/span&gt; &lt;img align=&quot;middle&quot; src=&quot;http://img.taobaocdn.com/imgextra/http://img03.taobaocdn.com/imgextra/i3/1677714540/T2AkUqXeRaXXXXXXXX_!!1677714540.jpg&quot; _ks_lazy_height=&quot;85&quot; _ks_lazy_width=&quot;85&quot; /&gt;&lt;/h2&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('93', '1', '精品扇贝柱', '&lt;h2 style=&quot;margin-left:-3.8pt;text-indent:8.85pt;background:white;&quot;&gt;	&lt;span style=&quot;font-size:9.0pt;color:#444444;&quot;&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;精品扇贝柱125元一桶&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;color:#444444;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:Tahoma;color:#444444;&quot;&gt;&lt;/span&gt; &lt;/h2&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('94', '1', '精品蛤蜊肉', '&lt;h2 style=&quot;margin-left:-3.8pt;text-indent:8.85pt;background:white;&quot;&gt;	&lt;span style=&quot;font-size:9.0pt;color:#444444;&quot;&gt;精品蛤蜊肉&lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:Tahoma;color:#444444;&quot;&gt;95&lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;color:#444444;&quot;&gt;元一桶&lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:Tahoma;color:#444444;&quot;&gt;&lt;/span&gt;&lt;/h2&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('89', '1', '贵凤', '40头&lt;table style=&quot;width:100%;&quot; class=&quot;ke-zeroborder&quot; title=&quot;tbdescguide&quot; border=&quot;0&quot;&gt;	&lt;tbody&gt;		&lt;tr&gt;			&lt;td&gt;				&lt;p style=&quot;text-align:center;&quot;&gt;					&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:#444444;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;骨 质瓷是目前唯一世界上公认的高档瓷种，是权利和地位的象征，号称瓷器之王！骨质瓷制造工艺复杂，经过高温素烧和低温烧制而成的，欧洲标准上好的骨质瓷的骨 炭含量是40%以上，套装均价在几千元左右。其主要特点有瓷质细腻通透、器形美观典雅、瓷质轻薄、彩面润泽光亮。优质品用瓷勺敲打或手指轻弹，清脆响亮， 宛如洪钟。&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt; 				&lt;/p&gt;				&lt;p style=&quot;text-align:center;&quot;&gt;					&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:#444444;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;骨质瓷一定要用手清洗，不可用洗碗机。有金边的餐具，勿放入微波炉，以免腐蚀。如有刮花，可以用牙膏略打磨。如有茶渍，可用柠檬汁或食醋清洗。不要用明火直接烧用！&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt; 				&lt;/p&gt;			&lt;/td&gt;		&lt;/tr&gt;	&lt;/tbody&gt;&lt;/table&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('90', '1', '贻贝肉', '&lt;span style=&quot;white-space:nowrap;&quot;&gt;贻贝肉80元一桶&lt;br /&gt;&lt;p&gt;	&lt;span style=&quot;text-indent:28pt;font-family:宋体;font-size:14pt;&quot;&gt;&lt;span style=&quot;white-space:nowrap;&quot;&gt;贻&lt;/span&gt;贝因&lt;/span&gt;&lt;span style=&quot;text-indent:28pt;font-family:宋体;letter-spacing:0.45pt;color:black;font-size:13pt;&quot;&gt;肉质细腻、口味鲜美、营养价值高而享誉海内外。扇贝&lt;/span&gt;&lt;span style=&quot;text-indent:28pt;font-family:宋体;font-size:14pt;&quot;&gt;含有丰富的蛋白质、铁和钙等人体必需的氨基酸和微量元素。是高蛋白、低脂肪、高钙质的天然保健品。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent:28pt;&quot;&gt;	&lt;span style=&quot;font-size:14pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;	&lt;b style=&quot;line-height:1.5;text-indent:35.8pt;&quot;&gt;&lt;span style=&quot;font-family:宋体;letter-spacing:0.4pt;color:black;font-size:14pt;&quot;&gt;产品特点：采用黄海优质扇&lt;/span&gt;&lt;/b&gt;&lt;b style=&quot;line-height:1.5;text-indent:35.8pt;&quot;&gt;&lt;span style=&quot;font-family:宋体;font-size:14pt;&quot;&gt;贝&lt;/span&gt;&lt;/b&gt;&lt;b style=&quot;line-height:1.5;text-indent:35.8pt;&quot;&gt;&lt;span style=&quot;font-family:宋体;letter-spacing:0.4pt;color:black;font-size:14pt;&quot;&gt;加工而成，鲜中带香，入口既溶，鲜味浓郁。&lt;/span&gt;&lt;/b&gt;&lt;/p&gt;&lt;p&gt;	&lt;b style=&quot;line-height:1.5;text-indent:35.8pt;&quot;&gt;&lt;span style=&quot;font-family:宋体;letter-spacing:0.4pt;color:black;font-size:14pt;&quot;&gt;&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-family:宋体;font-size:14pt;&quot;&gt;食用方法：&lt;/span&gt;&lt;span style=&quot;font-family:宋体;letter-spacing:0.4pt;color:black;font-size:14pt;&quot;&gt;开盖即食 &nbsp;&nbsp;&lt;/span&gt;&lt;/b&gt;&lt;b style=&quot;line-height:1.5;&quot;&gt;&lt;span style=&quot;font-family:宋体;letter-spacing:0.4pt;color:black;font-size:14pt;&quot;&gt;储存方法&lt;/span&gt;&lt;span style=&quot;font-family:arial sans-serif;letter-spacing:0.4pt;color:black;font-size:14pt;&quot;&gt;:&lt;/span&gt;&lt;span style=&quot;font-family:宋体;letter-spacing:0.4pt;color:black;font-size:14pt;&quot;&gt;常温保存&lt;/span&gt;&lt;/b&gt;&lt;/p&gt;&lt;/span&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('248', '3', '牙膏', '<span style=\"font-size:10.5pt;font-family:&quot;\">2080</span><span style=\"font-size:10.5pt;font-family:宋体;\">牙膏：</span><span style=\"font-size:10.5pt;font-family:&quot;\"><a href=\"http://baike.baidu.com/view/3682114.htm\" target=\"_blank\"><span style=\"color:windowtext;text-decoration:none;\">2080</span></a></span><span style=\"font-size:10.5pt;font-family:宋体;\">是韩国爱敬集团旗下的口腔护理品牌。其口号</span><span style=\"font-size:10.5pt;font-family:&quot;\">“</span><span style=\"font-size:10.5pt;font-family:宋体;\">让</span><span style=\"font-size:10.5pt;font-family:&quot;\">20</span><span style=\"font-size:10.5pt;font-family:宋体;\">颗健康的牙齿保持到</span><span style=\"font-size:10.5pt;font-family:&quot;\">80</span><span style=\"font-size:10.5pt;font-family:宋体;\">岁</span><span style=\"font-size:10.5pt;font-family:&quot;\">”</span><span style=\"font-size:10.5pt;font-family:宋体;\">具有：</span><span style=\"font-size:10.5pt;font-family:&quot;\"> </span><span style=\"font-size:10.5pt;font-family:宋体;\">美白</span><span style=\"font-size:10.5pt;font-family:&quot;\">,</span><span style=\"font-size:10.5pt;font-family:宋体;\">抗敏感</span><span style=\"font-size:10.5pt;font-family:&quot;\">,</span><span style=\"font-size:10.5pt;font-family:宋体;\">去牙渍</span><span style=\"font-size:10.5pt;font-family:&quot;\">,</span><span style=\"font-size:10.5pt;font-family:宋体;\">防蛀</span><span style=\"font-size:10.5pt;font-family:&quot;\">/</span><span style=\"font-size:10.5pt;font-family:宋体;\">固齿</span><span style=\"font-size:10.5pt;font-family:&quot;\">,</span><span style=\"font-size:10.5pt;font-family:宋体;\">抗菌</span><span style=\"font-size:10.5pt;font-family:&quot;\">/</span><span style=\"font-size:10.5pt;font-family:宋体;\">牙龈护理</span>', '2080牙膏：2080是韩国爱敬集团旗下的口腔护理品牌。其口号“让20颗健康的牙齿保持到80岁”具有： 美白,抗敏感,去牙渍,防蛀/固齿,抗菌/牙龈护理', '', '');
INSERT INTO `js_product_description` VALUES ('249', '3', '香皂', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('96', '1', '野生海参', '&lt;span style=&quot;font-size:9.0pt;font-family:宋体;&quot;&gt;野生海参&lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:;&quot; &quot;=&quot;&quot;&gt;4280&lt;/span&gt;&lt;span style=&quot;font-size:9.0pt;font-family:宋体;&quot;&gt;元一斤&lt;/span&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('87', '1', '美丽花房', '&lt;li title=&quot;&nbsp;四件套&quot;&gt;	床品套件:&nbsp;四件套&lt;/li&gt;&lt;li title=&quot;&nbsp;NteLose尼特罗斯&quot;&gt;	货号:&nbsp;WJ0077A&lt;/li&gt;&lt;li title=&quot;&nbsp;100022&quot;&gt;	面料材质:&nbsp;全棉&lt;/li&gt;&lt;li title=&quot;&nbsp;一般全棉&quot;&gt;	全棉种类:&nbsp;全棉&lt;/li&gt;&lt;li title=&quot;&nbsp;绗缝&nbsp;提花&nbsp;贡缎&quot;&gt;	床品工艺:&nbsp;绗缝&nbsp;提花&nbsp;贡缎&lt;/li&gt;&lt;li title=&quot;&nbsp;床单式&quot;&gt;	款式:&nbsp;床单式&lt;/li&gt;&lt;li title=&quot;&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情&quot;&gt;	颜色分类:&nbsp;图片色&lt;/li&gt;&lt;li title=&quot;&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情&quot;&gt;	产品等级:&nbsp;一等品&lt;/li&gt;&lt;li title=&quot;&nbsp;欧美风&quot;&gt;	床品风格:韩版&lt;/li&gt;&lt;li title=&quot;&nbsp;欧美风&quot;&gt;	色牢度（级）:&nbsp;符合相关国家标准&lt;/li&gt;&lt;li title=&quot;&nbsp;符合相关国家标准&quot;&gt;	缩水率（水洗尺寸变化）:&nbsp;符合相关国家标准&lt;/li&gt;&lt;li title=&quot;&nbsp;活性印花&quot;&gt;	印花工艺:&nbsp;活性印花&lt;/li&gt;&lt;li title=&quot;&nbsp;提花&quot;&gt;	织造工艺:&nbsp;提花&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('250', '3', '胶原蛋白滋养面膜', '<p>	<span style=\"font-family:宋体;\">蚕丝胶原蛋白滋养面膜：采用天然蚕丝材质，带来完美贴服的丝质感觉，可确保精华液充分吸收。增加美泰专有技术生产的胶原蛋白以及多种保湿、美白因子和纯天然植物提取物，深层补充肌肤所需营养，长期使用能滋养肌肤，清除细纹，提亮肤色，减少暗沉，时刻焕发青春光彩</span></p>', '蚕丝胶原蛋白滋养面膜：采用天然蚕丝材质，带来完美贴服的丝质感觉，可确保精华液充分吸收。增加美泰专有技术生产的胶原蛋白以及多种保湿、美白因子和纯天然植物提取物，深层补充肌肤所需营养，长期使用能滋养肌肤，清除细纹，提亮肤色，减少暗沉，时刻焕发青春光彩', '', '');
INSERT INTO `js_product_description` VALUES ('251', '3', '胶原蛋白美白面膜', '<p>	<span style=\"font-family:宋体;\">蚕丝胶原蛋白美白面膜：采用天然蚕丝材质，带来完美贴服的丝质感觉，可确保精华液充分吸收。添加多种美白因子和纯天然植物提取物，更特别添加美泰专有技术生产的胶原蛋白，深层击退黑色素、淡化色斑、滋养肌肤、抵抗紫外线。长期使用能令肌肤时刻两百嫩滑，焕发白皙光彩</span></p>', '蚕丝胶原蛋白美白面膜：采用天然蚕丝材质，带来完美贴服的丝质感觉，可确保精华液充分吸收。添加多种美白因子和纯天然植物提取物，更特别添加美泰专有技术生产的胶原蛋白，深层击退黑色素、淡化色斑、滋养肌肤、抵抗紫外线。长期使用能令肌肤时刻两百嫩滑，焕发白皙光彩', '', '');
INSERT INTO `js_product_description` VALUES ('252', '3', '胶原蛋白补水面膜', '<b><span style=\"font-family:宋体;font-size:10.5pt;\">蚕丝胶原蛋白补水面膜</span><SPAN style=\"FONT-FAMILY: ; FONT-SIZE: 10.5pt\" ?>:</span></b><span style=\"font-family:宋体;font-size:10.5pt;\">采用天然蚕丝材质，带来完美贴服的丝质感觉，可确保精华液充分吸收。增加多种保湿补水因子和纯天然植物提取物，更特别添加美泰专有技术生产的胶原蛋白，快速深层补水，滋养肌肤。长期使用能令肌肤水嫩弹滑，时刻焕发动人光彩</span>', '1.	蚕丝胶原蛋白补水面膜:采用天然蚕丝材质，带来完美贴服的丝质感觉，可确保精华液充分吸收。增加多种保湿补水因子和纯天然植物提取物，更特别添加美泰专有技术生产的胶原蛋白，快速深层补水，滋养肌肤。长期使用能令肌肤水嫩弹滑，时刻焕发动人光彩', '', '');
INSERT INTO `js_product_description` VALUES ('253', '3', '金刚核桃', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('77', '1', '女式裤子', '出口日本正品外贸女式裤子', '', '', '');
INSERT INTO `js_product_description` VALUES ('254', '3', '千眼菩提', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('255', '3', '一叶发财', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('78', '1', '优卡丝四件套E', '&lt;li title=&quot;&nbsp;四件套&quot;&gt;	床品套件:&nbsp;四件套&lt;/li&gt;&lt;li title=&quot;&nbsp;NteLose尼特罗斯&quot;&gt;	货号:&nbsp;WJ0072A&lt;/li&gt;&lt;li title=&quot;&nbsp;100022&quot;&gt;	面料材质:&nbsp;全棉&lt;/li&gt;&lt;li title=&quot;&nbsp;一般全棉&quot;&gt;	全棉种类:&nbsp;全棉&lt;/li&gt;&lt;li title=&quot;&nbsp;绗缝&nbsp;提花&nbsp;贡缎&quot;&gt;	床品工艺:&nbsp;绗缝&nbsp;提花&nbsp;贡&lt;/li&gt;&lt;li title=&quot;&nbsp;绗缝&nbsp;提花&nbsp;贡缎&quot;&gt;	款式:&nbsp;床单式&lt;/li&gt;&lt;li title=&quot;&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情&quot;&gt;	颜色分类:&nbsp;图片色&lt;/li&gt;&lt;li title=&quot;&nbsp;翩然雅致&nbsp;塞维利亚&nbsp;相伴一生米白&nbsp;香奈儿&nbsp;巴黎春天&nbsp;寐&nbsp;专柜正品，限时送靠垫套&nbsp;伊莎贝尔【&nbsp;伊甸园&nbsp;维也纳高雅灰&nbsp;时尚芭莎&nbsp;盛世经典&nbsp;柔情密语&nbsp;情丝爱语&nbsp;青花瓷&nbsp;金枝玉叶&nbsp;经典迷情&nbsp;皇家风范&nbsp;花都丽影&nbsp;贵族豪情&quot;&gt;	产品等级:&nbsp;一等品&lt;/li&gt;&lt;li title=&quot;&nbsp;欧美风&quot;&gt;	床品风格:&nbsp;欧美风&lt;/li&gt;&lt;li title=&quot;&nbsp;符合相关国家标准&quot;&gt;	色牢度（级）:&nbsp;符合相关国家标准&lt;/li&gt;&lt;li title=&quot;&nbsp;符合相关国家标准&quot;&gt;	缩水率（水洗尺寸变化）:&nbsp;符合相关国家标准&lt;/li&gt;&lt;li title=&quot;&nbsp;欧式&quot;&gt;	家装风格:&nbsp;欧式&lt;/li&gt;&lt;li title=&quot;&nbsp;活性印花&quot;&gt;	印花工艺:&nbsp;活性印花&lt;/li&gt;&lt;li title=&quot;&nbsp;提花&quot;&gt;	织造工艺:&nbsp;提花&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('256', '3', '招财树', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('257', '3', '菩提根', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('258', '3', '木鱼果', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('259', '3', '缅甸茄', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('260', '3', '太阳子', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('261', '3', '十八子', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('262', '3', '金刚菩提', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('263', '3', '金钱菩提', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('264', '3', '快客杯', '<li title=\"&nbsp;自主实拍图\">	主图来源:&nbsp;自主实拍图</li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 产地：景德镇<br /><li title=\"&nbsp;1人\">	推荐使用人数:&nbsp;1人</li><li title=\"&nbsp;否\">	配茶盘:&nbsp;否</li><li title=\"&nbsp;其他功夫茶用具\">	类型:&nbsp;其他功夫茶用具</li><li title=\"&nbsp;1人\">	货号：WJ0059</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('265', '3', '雪花釉', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('266', '3', '一堂和气', '<li title=\"&nbsp;自主实拍图\">	主图来源:&nbsp;自主实拍图</li><li title=\"&nbsp;自主实拍图\">	产地：景德镇</li><li title=\"&nbsp;自主实拍图\">	货号：WJ0055</li><li title=\"&nbsp;自主实拍图\"></li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('267', '3', '京陶', '<li title=\"&nbsp;QH-X3CA\">	货号:&nbsp;WJ0053</li><li title=\"&nbsp;景德镇\">	茶具产地:&nbsp;景德镇</li><li title=\"&nbsp;陶与瓷混合\">	材质:&nbsp;陶与瓷混合</li><li title=\"&nbsp;6人\">	推荐使用人数:&nbsp;6人</li><li title=\"&nbsp;青瓷\">	工艺:&nbsp;青瓷</li><li title=\"&nbsp;否\">	配茶盘:&nbsp;否</li><li title=\"&nbsp;自主实拍图\">	主图来源:&nbsp;自主实拍图</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('76', '1', '马大哈鱼鱼片', '&lt;table style=&quot;font-size:15px;&quot; cellspacing=&quot;0&quot; cellpadding=&quot;3&quot; width=&quot;740&quot;&gt;	&lt;tbody&gt;		&lt;tr&gt;			&lt;td valign=&quot;top&quot; width=&quot;500&quot;&gt;				&lt;table class=&quot;ke-zeroborder&quot; border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;3&quot; width=&quot;500&quot; height=&quot;100%&quot;&gt;					&lt;tbody&gt;						&lt;tr&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot; height=&quot;36&quot; width=&quot;90&quot;&gt;								&lt;img style=&quot;margin:0px;width:80px;float:none;height:30px;&quot; alt=&quot;&quot; src=&quot;http://img04.taobaocdn.com/imgextra/i4/249999786/T2z95kXolXXXXXXXXX_!!249999786.gif&quot; _ks_lazy_width=&quot;80&quot; _ks_lazy_height=&quot;30&quot; /&gt; 							&lt;/td&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot; colspan=&quot;3&quot;&gt;								&lt;strong style=&quot;color:#ff0000;&quot;&gt;马大哈鱼鱼片&lt;/strong&gt; 							&lt;/td&gt;						&lt;/tr&gt;						&lt;tr&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot; height=&quot;36&quot;&gt;								&lt;img style=&quot;margin:0px;width:80px;float:none;height:30px;&quot; src=&quot;http://img02.taobaocdn.com/imgextra/i2/249999786/T2Wm5kXn0XXXXXXXXX_!!249999786.gif&quot; width=&quot;80&quot; height=&quot;30&quot; _ks_lazy_width=&quot;80&quot; _ks_lazy_height=&quot;30&quot; /&gt; 							&lt;/td&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot;&gt;								红岛海鲜							&lt;/td&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot;&gt;								&lt;img style=&quot;margin:0px;width:80px;float:none;height:30px;&quot; src=&quot;http://img01.taobaocdn.com/imgextra/i1/249999786/T2jS5kXoNXXXXXXXXX_!!249999786.gif&quot; width=&quot;80&quot; height=&quot;30&quot; _ks_lazy_width=&quot;80&quot; _ks_lazy_height=&quot;30&quot; /&gt; 							&lt;/td&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot; align=&quot;left&quot;&gt;								山东							&lt;/td&gt;						&lt;/tr&gt;						&lt;tr&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot; height=&quot;36&quot;&gt;								&lt;img style=&quot;margin:0px;width:80px;float:none;height:30px;&quot; alt=&quot;&quot; src=&quot;http://img01.taobaocdn.com/imgextra/i1/249999786/T2PC5kXn4XXXXXXXXX_!!249999786.gif&quot; _ks_lazy_width=&quot;80&quot; _ks_lazy_height=&quot;30&quot; /&gt; 							&lt;/td&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot;&gt;								128/斤							&lt;/td&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot;&gt;								&lt;img style=&quot;margin:0px;width:80px;float:none;height:30px;&quot; src=&quot;http://img03.taobaocdn.com/imgextra/i3/249999786/T2nm9kXnhXXXXXXXXX_!!249999786.gif&quot; width=&quot;80&quot; height=&quot;30&quot; _ks_lazy_width=&quot;80&quot; _ks_lazy_height=&quot;30&quot; /&gt; 							&lt;/td&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot; align=&quot;left&quot;&gt;								袋装&nbsp; 散装&nbsp; 箱装							&lt;/td&gt;						&lt;/tr&gt;						&lt;tr&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot; height=&quot;36&quot;&gt;								&lt;img style=&quot;margin:0px;width:80px;float:none;height:30px;&quot; src=&quot;http://img02.taobaocdn.com/imgextra/i2/249999786/T2F95kXodXXXXXXXXX_!!249999786.gif&quot; width=&quot;80&quot; height=&quot;30&quot; _ks_lazy_width=&quot;80&quot; _ks_lazy_height=&quot;30&quot; /&gt; 							&lt;/td&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot;&gt;								散装零食							&lt;/td&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot;&gt;								&lt;img style=&quot;margin:0px;width:80px;float:none;height:30px;&quot; src=&quot;http://img03.taobaocdn.com/imgextra/i3/249999786/T2r95kXoxXXXXXXXXX_!!249999786.gif&quot; width=&quot;80&quot; height=&quot;30&quot; _ks_lazy_width=&quot;80&quot; _ks_lazy_height=&quot;30&quot; /&gt; 							&lt;/td&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot; align=&quot;left&quot;&gt;								微咸带甜，不辣							&lt;/td&gt;						&lt;/tr&gt;						&lt;tr&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot; height=&quot;36&quot;&gt;								&lt;img style=&quot;margin:0px;width:80px;float:none;height:30px;&quot; src=&quot;http://img04.taobaocdn.com/imgextra/i4/249999786/T25S5kXnNXXXXXXXXX_!!249999786.gif&quot; width=&quot;80&quot; height=&quot;30&quot; _ks_lazy_width=&quot;80&quot; _ks_lazy_height=&quot;30&quot; /&gt; 							&lt;/td&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot;&gt;								8.5成							&lt;/td&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot;&gt;								&lt;br /&gt;							&lt;/td&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot; align=&quot;left&quot;&gt;								&lt;br /&gt;							&lt;/td&gt;						&lt;/tr&gt;						&lt;tr&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot; height=&quot;36&quot;&gt;								&lt;img style=&quot;margin:0px;width:80px;float:none;height:30px;&quot; src=&quot;http://img01.taobaocdn.com/imgextra/i1/249999786/T2ZC1kXXhaXXXXXXXX_!!249999786.gif&quot; width=&quot;80&quot; height=&quot;30&quot; _ks_lazy_width=&quot;80&quot; _ks_lazy_height=&quot;30&quot; /&gt; 							&lt;/td&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot;&gt;								常温、冷藏							&lt;/td&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot;&gt;								&lt;br /&gt;							&lt;/td&gt;							&lt;td style=&quot;border-bottom:1px dashed;border-left:medium none;border-top:medium none;border-right:medium none;&quot; align=&quot;left&quot;&gt;								&lt;br /&gt;							&lt;/td&gt;						&lt;/tr&gt;					&lt;/tbody&gt;				&lt;/table&gt;			&lt;/td&gt;		&lt;/tr&gt;	&lt;/tbody&gt;&lt;/table&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('268', '3', '张生朱砂陶', '<span style=\"line-height:27px;font-family:宋体;color:#790000;font-size:large;\">【产品配置】茶壶1个 + 公道杯1个 + 茶杯6个<br />产品介绍<br /><span style=\"font-size:18px;\"><span style=\"font-family:黑体;color:#790000;\"><span style=\"font-family:仿宋_gb2312;\"><span style=\"color:#000000;\">&nbsp;</span></span></span></span><span style=\"font-size:14pt;\"><span style=\"font-family:黑体;color:#790000;\"><span style=\"font-size:medium;\"><span style=\"font-size:18px;\"><span style=\"font-family:仿宋_gb2312;\"><span style=\"color:#000000;\">朱泥呈鹅黄色，朱泥是属于紫砂红泥中的一种泥，朱泥是红泥中之精品、因主要成份为红泥（含铁量极高）、又产在嫩泥矿之下层、又称“未触风曰之石骨”，石骨的意思就是未完全风化的土块，质坚如顽石，但遇水则自行溃散。</span></span></span></span></span></span> <div style=\"color:#404040;\" align=\"left\">	<p style=\"text-indent:24pt;margin:0cm 0cm 0pt;\">		<span style=\"font-size:14pt;\"><span style=\"font-family:黑体;color:#790000;\"><span style=\"font-size:medium;\"><span style=\"font-family:仿宋_gb2312;font-size:12pt;\"><span style=\"color:#000000;\"></span></span></span></span></span>	</p>	<p style=\"margin:0cm 0cm 0pt;\">		<span style=\"font-size:14pt;\"><span style=\"font-family:黑体;color:#790000;\"><span style=\"font-size:medium;\"><span style=\"font-size:18px;\"><span style=\"font-family:仿宋_gb2312;\"><span style=\"color:#000000;\">朱泥壶制作比其他的紫砂壶制作难度大，成品率低。主要因素是朱泥收缩大，在高温烧制时，朱泥系因收缩或砂浆比率的缘故，所以壶身表面易现：“节皱纹”。故有古人云：“无皱不成朱”，这也是古今爱壶人认定上品朱泥壶的要件之一。同时，朱泥的成品表面呈哑光，视觉并不鲜亮，颜色微红带黄，砂感若隐若现，养成后砂感明显，润泽透亮。此外，朱泥壶透气性好，能在壶表面形成包浆，所以越用越光亮鲜艳，其组织细密，保香性能优于其他紫砂壶。</span></span></span></span></span></span>	</p></div></span>', '', '', '');
INSERT INTO `js_product_description` VALUES ('269', '3', '台湾黑陶', '<li title=\"&nbsp;时尚茶具\">	品牌:&nbsp;时尚茶具</li><li title=\"&nbsp;陶\">	材质:&nbsp;陶</li><li title=\"&nbsp;整套功夫茶具\">	类型:&nbsp;整套功夫茶具</li><li title=\"&nbsp;CJ-003\">	货号:WJ0050</li><li title=\"&nbsp;CJ-003\">	&nbsp;茶具产地:&nbsp;景德镇</li><li title=\"&nbsp;自主实拍图\">	主图来源:&nbsp;自主实拍图</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('75', '1', '宫面', '&lt;div&gt;	&nbsp;据说，早在明朝时期，河北省藁城一带的面食艺人，就以精于制作挂面而驰名燕赵之地。清光绪年间，地方官吏曾以此进贡皇宫，列为宫廷佳品，故得名&ldquo;宫面&rdquo;。对此，《藁城县志》曾有这栏的记载：&ldquo;吾邑之挂面，系土人所艺，味极适口，相传数百载，曾进贡清皇室，故名产也。&rdquo;在民国时期，藁城&ldquo;宫面&rdquo;曾出口朝鲜，并受过孙中山南京总统府颁发的&ldquo;国光银牌&rdquo;嘉奖。&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;相传，唐太宗李世民平定天下之后，也想仿效秦始皇东巡大海寻求长生不老之药。这一天，李世民行走在藁城界内，突然病重，吃什么都不管用。这可急坏了娘娘、太监和御医。县令万般无奈，只好找到了当时马记面食店的掌柜马九华。当时马九华三十来岁，马记面食店传到他手已经有八代了。李世民吃了他做的面条，竞鬼使神差般痊愈了。从此藁城宫面成了宫庭御膳。马九华可谓宫面的祖师爷。北宋、元朝时已开始生产挂面，明代、清代为生产旺盛时期。&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;林翰儒所著民国十二年出版的《藁城乡土地理》中说：&ldquo;若食品中之挂面，味极适口，故名产也。&rdquo;当时直隶总督荣禄和李鸿章都曾直接向慈禧太后进贡&ldquo;藁邑挂面两盒&rdquo;，以表忠心。&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;据史料记载，在民国初年，曾风行一时的藁城东南、西南的李老春、张光朴两家挂面店弃营之后，由杨氏福元单独经营，取字号&ldquo;双胜永&rdquo;。他做的挂面被当时的藁城事业局选中，邮往南京、上海参加评试，结果被南京工商部授予孙中山总统府&ldquo;国光&rdquo;银奖。同时，南京、上海两个工商部还寄给他名优产品画册和奖状十余张，朝鲜也给他奖状一张。可见当时宫面已经传到了朝鲜。难怪人们常说：&ldquo;藁城的宫面好做．眼(空心)难钻。&rdquo;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;爱新觉罗溥杰吃了宫面之后欣然提诗一首表达对宫面的赞美之情：&lt;br /&gt;&lt;/div&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('270', '3', '南金亚光定窑兰花秋韵', '<p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的“益茶”。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。</span></p><p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【陶瓷茶具常保养】：<br />1、可用洗碗机要选择有“瓷器及水晶类”洗涤功能的洗碗机。<br />2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。<br />3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。<br />4、如果有茶渍，可用柠檬汁或食醋清洗。</span></p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('271', '3', '哥窑', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('73', '1', '宫面', '&lt;div&gt;	&nbsp;据说，早在明朝时期，河北省藁城一带的面食艺人，就以精于制作挂面而驰名燕赵之地。清光绪年间，地方官吏曾以此进贡皇宫，列为宫廷佳品，故得名&ldquo;宫面&rdquo;。对此，《藁城县志》曾有这栏的记载：&ldquo;吾邑之挂面，系土人所艺，味极适口，相传数百载，曾进贡清皇室，故名产也。&rdquo;在民国时期，藁城&ldquo;宫面&rdquo;曾出口朝鲜，并受过孙中山南京总统府颁发的&ldquo;国光银牌&rdquo;嘉奖。&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;相传，唐太宗李世民平定天下之后，也想仿效秦始皇东巡大海寻求长生不老之药。这一天，李世民行走在藁城界内，突然病重，吃什么都不管用。这可急坏了娘娘、太监和御医。县令万般无奈，只好找到了当时马记面食店的掌柜马九华。当时马九华三十来岁，马记面食店传到他手已经有八代了。李世民吃了他做的面条，竞鬼使神差般痊愈了。从此藁城宫面成了宫庭御膳。马九华可谓宫面的祖师爷。北宋、元朝时已开始生产挂面，明代、清代为生产旺盛时期。&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;林翰儒所著民国十二年出版的《藁城乡土地理》中说：&ldquo;若食品中之挂面，味极适口，故名产也。&rdquo;当时直隶总督荣禄和李鸿章都曾直接向慈禧太后进贡&ldquo;藁邑挂面两盒&rdquo;，以表忠心。&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;据史料记载，在民国初年，曾风行一时的藁城东南、西南的李老春、张光朴两家挂面店弃营之后，由杨氏福元单独经营，取字号&ldquo;双胜永&rdquo;。他做的挂面被当时的藁城事业局选中，邮往南京、上海参加评试，结果被南京工商部授予孙中山总统府&ldquo;国光&rdquo;银奖。同时，南京、上海两个工商部还寄给他名优产品画册和奖状十余张，朝鲜也给他奖状一张。可见当时宫面已经传到了朝鲜。难怪人们常说：&ldquo;藁城的宫面好做．眼(空心)难钻。&rdquo;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;爱新觉罗溥杰吃了宫面之后欣然提诗一首表达对宫面的赞美之情：&lt;br /&gt;&lt;/div&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('272', '3', '南金金边花', '<p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的“益茶”。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。</span></p><p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【陶瓷茶具常保养】：<br />1、可用洗碗机要选择有“瓷器及水晶类”洗涤功能的洗碗机。<br />2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。<br />3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。<br />4、如果有茶渍，可用柠檬汁或食醋清洗。</span></p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('273', '3', '韩国', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('69', '1', '13507型', '&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	主图来源:&nbsp;自主实拍图&lt;/li&gt;&lt;li title=&quot;&nbsp;修身型&quot;&gt;	板型:&nbsp;修身型&lt;/li&gt;&lt;li title=&quot;&nbsp;通勤&quot;&gt;	风格:&nbsp;通勤&lt;/li&gt;&lt;li title=&quot;&nbsp;淑女&quot;&gt;	通勤:&nbsp;淑女&lt;/li&gt;&lt;li title=&quot;&nbsp;中长款(65cm&lt;衣长&le;80cm)&quot;&gt;	款式:&nbsp;中长款(65cm&lt;衣长&le;80cm)&lt;/li&gt;&lt;li title=&quot;&nbsp;长袖&quot;&gt;	袖长:&nbsp;长袖&lt;/li&gt;&lt;li title=&quot;&nbsp;连帽/帽领&quot;&gt;	领型:&nbsp;圆领&lt;/li&gt;&lt;li title=&quot;&nbsp;其他袖型&quot;&gt;	袖型:&nbsp;其他袖型&lt;/li&gt;&lt;li title=&quot;&nbsp;单排两粒扣&quot;&gt;	衣门襟:&nbsp;单排粒扣&lt;/li&gt;&lt;li title=&quot;&nbsp;羊皮&quot;&gt;	皮质:&nbsp;纯羊皮&lt;/li&gt;&lt;li title=&quot;&nbsp;纽扣&nbsp;毛领&nbsp;口袋&quot;&gt;	流行元素/工艺:&nbsp;纽扣&nbsp;毛领&nbsp;口袋&lt;/li&gt;&lt;li title=&quot;&nbsp;黑色&nbsp;红色&quot;&gt;	颜色分类:&nbsp;粉色&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('70', '1', 'M08', '&lt;li title=&quot;&nbsp;直筒型&quot;&gt;	板型:&nbsp;直筒型&lt;/li&gt;&lt;li title=&quot;&nbsp;常规&quot;&gt;	厚薄:&nbsp;常规&lt;/li&gt;&lt;li title=&quot;&nbsp;街头&quot;&gt;	风格:&nbsp;街头&lt;/li&gt;&lt;li title=&quot;&nbsp;欧美&quot;&gt;	街头:&nbsp;欧美&lt;/li&gt;&lt;li title=&quot;&nbsp;中长款(65cm&lt;衣长&le;80cm)&quot;&gt;	衣长:&nbsp;中长款(65cm&lt;衣长&le;80cm)&lt;/li&gt;&lt;li title=&quot;&nbsp;长袖&quot;&gt;	袖长:&nbsp;长袖&lt;/li&gt;&lt;li title=&quot;&nbsp;拉链&quot;&gt;	衣门襟:&nbsp;拉链&lt;/li&gt;&lt;li title=&quot;&nbsp;2013秋季&quot;&gt;	年份/季节:&nbsp;2013秋季&lt;/li&gt;&lt;li title=&quot;&nbsp;明星同款（如图）&quot;&gt;	颜色分类:&nbsp;（如图）&lt;/li&gt;&lt;li title=&quot;&nbsp;明星同款（如图）&quot;&gt;	款式：&nbsp; 男士&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('274', '3', '鼎尊', '<p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的“益茶”。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。</span></p><p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【陶瓷茶具常保养】：<br />1、可用洗碗机要选择有“瓷器及水晶类”洗涤功能的洗碗机。<br />2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。<br />3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。<br />4、如果有茶渍，可用柠檬汁或食醋清洗。</span></p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('66', '1', '1391型', '&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	主图来源:&nbsp;自主实拍图&lt;/li&gt;&lt;li title=&quot;&nbsp;修身型&quot;&gt;	货号：1391&lt;/li&gt;&lt;li title=&quot;&nbsp;修身型&quot;&gt;	板型:&nbsp;修身型&lt;/li&gt;&lt;li title=&quot;&nbsp;通勤&quot;&gt;	风格:&nbsp;通勤&lt;/li&gt;&lt;li title=&quot;&nbsp;韩版&quot;&gt;	通勤:&nbsp;韩版&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	衣长:&nbsp;常规款&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	袖长:&nbsp;长袖&lt;/li&gt;&lt;li title=&quot;&nbsp;圆领&quot;&gt;	领子:&nbsp;貂领&lt;/li&gt;&lt;li title=&quot;&nbsp;常规袖&quot;&gt;	袖型:&nbsp;常规袖&lt;/li&gt;&lt;li title=&quot;&nbsp;拉链&quot;&gt;	图案:&nbsp;纯色&lt;/li&gt;&lt;li title=&quot;&nbsp;带毛领&quot;&gt;	流行元素/工艺:&nbsp;带毛领&lt;/li&gt;&lt;li title=&quot;&nbsp;羊皮&quot;&gt;	面料材质:&nbsp;羊皮&lt;/li&gt;&lt;li title=&quot;&nbsp;2013冬季&quot;&gt;	年份/季节:&nbsp;2013冬季&lt;/li&gt;&lt;li title=&quot;&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）&quot;&gt;	颜色分类:&nbsp;白色&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('67', '1', '12210型', '&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	主图来源:&nbsp;自主实拍图&lt;/li&gt;&lt;li title=&quot;&nbsp;修身型&quot;&gt;	板型:&nbsp;修身型&lt;/li&gt;&lt;li title=&quot;&nbsp;通勤&quot;&gt;	风格:&nbsp;通勤&lt;/li&gt;&lt;li title=&quot;&nbsp;韩版&quot;&gt;	通勤:&nbsp;韩版&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	衣长:&nbsp;常规款&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	袖长:&nbsp;长袖&lt;/li&gt;&lt;li title=&quot;&nbsp;圆领&quot;&gt;	领子:&nbsp;圆领&lt;/li&gt;&lt;li title=&quot;&nbsp;常规袖&quot;&gt;	袖型:&nbsp;常规袖&lt;/li&gt;&lt;li title=&quot;&nbsp;拉链&quot;&gt;	衣门襟:&nbsp;纽扣&lt;/li&gt;&lt;li title=&quot;&nbsp;拉链&quot;&gt;	图案:&nbsp;纯色&lt;/li&gt;&lt;li title=&quot;&nbsp;带毛领&quot;&gt;	流行元素/工艺:&nbsp;带毛领&lt;/li&gt;&lt;li title=&quot;&nbsp;羊皮&quot;&gt;	面料材质:&nbsp;羊皮&lt;/li&gt;&lt;li title=&quot;&nbsp;2013冬季&quot;&gt;	年份/季节:&nbsp;2013冬季&lt;/li&gt;&lt;li title=&quot;&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）&quot;&gt;	颜色分类:&nbsp;白色&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('275', '3', '龙泉青虎威', '<p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的“益茶”。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。</span></p><p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【陶瓷茶具常保养】：<br />1、可用洗碗机要选择有“瓷器及水晶类”洗涤功能的洗碗机。<br />2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。<br />3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。<br />4、如果有茶渍，可用柠檬汁或食醋清洗。</span></p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('72', '1', '8999型', '&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	主图来源:&nbsp;自主实拍图&lt;/li&gt;&lt;li title=&quot;&nbsp;KFN134P014&quot;&gt;	货号:8999&lt;/li&gt;&lt;li title=&quot;&nbsp;KFN134P014&quot;&gt;	板型:&nbsp;修身型&lt;/li&gt;&lt;li title=&quot;&nbsp;通勤&quot;&gt;	风格:&nbsp;通勤&lt;/li&gt;&lt;li title=&quot;&nbsp;韩版&quot;&gt;	通勤:&nbsp;韩版&lt;/li&gt;&lt;li title=&quot;&nbsp;中长款(65cm&lt;衣长&le;80cm)&quot;&gt;	款式:&nbsp;中长款&lt;/li&gt;&lt;li title=&quot;&nbsp;中长款(65cm&lt;衣长&le;80cm)&quot;&gt;	袖长:&nbsp;长袖&lt;/li&gt;&lt;li title=&quot;&nbsp;V领&quot;&gt;	领型:&nbsp;貂领&lt;/li&gt;&lt;li title=&quot;&nbsp;常规袖&quot;&gt;	袖型:&nbsp;常规袖&lt;/li&gt;&lt;li title=&quot;&nbsp;羊皮&quot;&gt;	皮质:&nbsp;纯羊皮&lt;/li&gt;&lt;li title=&quot;&nbsp;纽扣&nbsp;毛领&nbsp;口袋&nbsp;系带/腰带&quot;&gt;	流行元素/工艺:&nbsp;纽扣&nbsp;毛领&nbsp;&lt;/li&gt;&lt;li title=&quot;&nbsp;纽扣&nbsp;毛领&nbsp;口袋&nbsp;系带/腰带&quot;&gt;	年份/季节:&nbsp;2013冬季&lt;/li&gt;&lt;li title=&quot;&nbsp;棕色金属腰带&nbsp;棕色&nbsp;黑色金属腰带&nbsp;黑色&quot;&gt;	颜色分类:图片色&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('71', '1', '大狐头型', '&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	主图来源:&nbsp;自主实拍图&lt;/li&gt;&lt;li title=&quot;&nbsp;LY006&quot;&gt;	货号:大狐头型&lt;/li&gt;&lt;li title=&quot;&nbsp;LY006&quot;&gt;	板型:&nbsp;修身型&lt;/li&gt;&lt;li title=&quot;&nbsp;通勤&quot;&gt;	风格:&nbsp;通勤&lt;/li&gt;&lt;li title=&quot;&nbsp;韩版&quot;&gt;	通勤:&nbsp;韩版&lt;/li&gt;&lt;li title=&quot;&nbsp;中长款(65cm&lt;衣长&le;80cm)&quot;&gt;	款式:&nbsp;中长款&lt;/li&gt;&lt;li title=&quot;&nbsp;中长款(65cm&lt;衣长&le;80cm)&quot;&gt;	袖长:&nbsp;长袖&lt;/li&gt;&lt;li title=&quot;&nbsp;翻领/POLO领&quot;&gt;	领型:狐狸领&lt;/li&gt;&lt;li title=&quot;&nbsp;常规袖&quot;&gt;	袖型:&nbsp;常规袖&lt;/li&gt;&lt;li title=&quot;&nbsp;其他门襟样式&quot;&gt;	衣门襟:&nbsp;其他门襟样式&lt;/li&gt;&lt;li title=&quot;&nbsp;羊皮&quot;&gt;	皮质:&nbsp;纯羊皮&lt;/li&gt;&lt;li title=&quot;&nbsp;毛领&nbsp;系带/腰带&quot;&gt;	流行元素/工艺:&nbsp;毛领&nbsp;系带/腰带&lt;/li&gt;&lt;li title=&quot;&nbsp;2013冬季&quot;&gt;	年份/季节:&nbsp;2013冬季&lt;/li&gt;&lt;li title=&quot;&nbsp;2013冬季&quot;&gt;	颜色分类:&nbsp;黑色&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('276', '3', '金陵十三钗', '<p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的“益茶”。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。</span></p><p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【陶瓷茶具常保养】：<br />1、可用洗碗机要选择有“瓷器及水晶类”洗涤功能的洗碗机。<br />2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。<br />3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。<br />4、如果有茶渍，可用柠檬汁或食醋清洗。</span></p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('62', '1', '1208型', '&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	主图来源:&nbsp;自主实拍图&lt;/li&gt;&lt;li title=&quot;&nbsp;凯思达&quot;&gt;	货号：1208&lt;/li&gt;&lt;li title=&quot;&nbsp;凯思达&quot;&gt;	板型:&nbsp;修身型&lt;/li&gt;&lt;li title=&quot;&nbsp;加厚&quot;&gt;	厚薄:&nbsp;加厚&lt;/li&gt;&lt;li title=&quot;&nbsp;通勤&quot;&gt;	风格:&nbsp;通勤&lt;/li&gt;&lt;li title=&quot;&nbsp;韩版&quot;&gt;	通勤:&nbsp;韩版&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	衣长:中长款&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	袖长:&nbsp;长袖&lt;/li&gt;&lt;li title=&quot;&nbsp;圆领&quot;&gt;	领子:&nbsp;圆领&lt;/li&gt;&lt;li title=&quot;&nbsp;常规袖&quot;&gt;	袖型:&nbsp;常规袖&lt;/li&gt;&lt;li title=&quot;&nbsp;拉链&quot;&gt;	衣门襟:&nbsp;拉链&lt;/li&gt;&lt;li title=&quot;&nbsp;带毛领&quot;&gt;	流行元素/工艺:&nbsp;带毛领&lt;/li&gt;&lt;li title=&quot;&nbsp;羊皮&quot;&gt;	面料材质:&nbsp;羊皮&lt;/li&gt;&lt;li title=&quot;&nbsp;2013冬季&quot;&gt;	年份/季节:&nbsp;2013冬季&lt;/li&gt;&lt;li title=&quot;&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）&quot;&gt;	颜色分类:&nbsp;黑色&nbsp;&nbsp; 白色&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('63', '1', '1358型', '&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	主图来源:&nbsp;自主实拍图&lt;/li&gt;&lt;li title=&quot;&nbsp;修身型&quot;&gt;	货号：1358&lt;/li&gt;&lt;li title=&quot;&nbsp;修身型&quot;&gt;	板型:&nbsp;修身型&lt;/li&gt;&lt;li title=&quot;&nbsp;加厚&quot;&gt;	厚薄:&nbsp;加厚&lt;/li&gt;&lt;li title=&quot;&nbsp;通勤&quot;&gt;	风格:&nbsp;通勤&lt;/li&gt;&lt;li title=&quot;&nbsp;韩版&quot;&gt;	通勤:&nbsp;韩版&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	衣长:&nbsp;常规款&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	袖长:&nbsp;长袖&lt;/li&gt;&lt;li title=&quot;&nbsp;圆领&quot;&gt;	领子:&nbsp;圆领&lt;/li&gt;&lt;li title=&quot;&nbsp;常规袖&quot;&gt;	袖型:&nbsp;常规袖&lt;/li&gt;&lt;li title=&quot;&nbsp;拉链&quot;&gt;	衣门襟:&nbsp;纽扣&lt;/li&gt;&lt;li title=&quot;&nbsp;拉链&quot;&gt;	图案:&nbsp;纯色&lt;/li&gt;&lt;li title=&quot;&nbsp;带毛领&quot;&gt;	流行元素/工艺:&nbsp;带毛领&lt;/li&gt;&lt;li title=&quot;&nbsp;羊皮&quot;&gt;	面料材质:&nbsp;羊皮&lt;/li&gt;&lt;li title=&quot;&nbsp;2013冬季&quot;&gt;	年份/季节:&nbsp;2013冬季&lt;/li&gt;&lt;li title=&quot;&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）&quot;&gt;	颜色分类:&nbsp;白色&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('277', '3', '大红曲把', '<p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的“益茶”。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。</span></p><p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【陶瓷茶具常保养】：<br />1、可用洗碗机要选择有“瓷器及水晶类”洗涤功能的洗碗机。<br />2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。<br />3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。<br />4、如果有茶渍，可用柠檬汁或食醋清洗。</span></p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('278', '3', '亚光茶叶罐', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('74', '1', '宫面', '据说，早在明朝时期，河北省藁城一带的面食艺人，就以精于制作挂面而驰名燕赵之地。清光绪年间，地方官吏曾以此进贡皇宫，列为宫廷佳品，故得名&ldquo;宫面&rdquo;。对此，《藁城县志》曾有这栏的记载：&ldquo;吾邑之挂面，系土人所艺，味极适口，相传数百载，曾进贡清皇室，故名产也。&rdquo;在民国时期，藁城&ldquo;宫面&rdquo;曾出口朝鲜，并受过孙中山南京总统府颁发的&ldquo;国光银牌&rdquo;嘉奖。    相传，唐太宗李世民平定天下之后，也想仿效秦始皇东巡大海寻求长生不老之药。这一天，李世民行走在藁城界内，突然病重，吃什么都不管用。这可急坏了娘娘、太监和御医。县令万般无奈，只好找到了当时马记面食店的掌柜马九华。当时马九华三十来岁，马记面食店传到他手已经有八代了。李世民吃了他做的面条，竞鬼使神差般痊愈了。从此藁城宫面成了宫庭御膳。马九华可谓宫面的祖师爷。北宋、元朝时已开始生产挂面，明代、清代为生产旺盛时期。    林翰儒所著民国十二年出版的《藁城乡土地理》中说：&ldquo;若食品中之挂面，味极适口，故名产也。&rdquo;当时直隶总督荣禄和李鸿章都曾直接向慈禧太后进贡&ldquo;藁邑挂面两盒&rdquo;，以表忠心。    据史料记载，在民国初年，曾风行一时的藁城东南、西南的李老春、张光朴两家挂面店弃营之后，由杨氏福元单独经营，取字号&ldquo;双胜永&rdquo;。他做的挂面被当时的藁城事业局选中，邮往南京、上海参加评试，结果被南京工商部授予孙中山总统府&ldquo;国光&rdquo;银奖。同时，南京、上海两个工商部还寄给他名优产品画册和奖状十余张，朝鲜也给他奖状一张。可见当时宫面已经传到了朝鲜。难怪人们常说：&ldquo;藁城的宫面好做．眼(空心)难钻。&rdquo;    爱新觉罗溥杰吃了宫面之后欣然提诗一首表达对宫面的赞美之情：', '', '', '');
INSERT INTO `js_product_description` VALUES ('279', '3', '招财进宝茶叶罐', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('280', '3', '亚光茶叶罐纯色', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('68', '1', '13106型', '&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	主图来源:&nbsp;自主实拍图&lt;/li&gt;&lt;li title=&quot;&nbsp;KFN134P014&quot;&gt;	货号:&nbsp;13106&lt;/li&gt;&lt;li title=&quot;&nbsp;KFN134P014&quot;&gt;	板型:&nbsp;修身型&lt;/li&gt;&lt;li title=&quot;&nbsp;通勤&quot;&gt;	风格:&nbsp;通勤&lt;/li&gt;&lt;li title=&quot;&nbsp;韩版&quot;&gt;	通勤:&nbsp;韩版&lt;/li&gt;&lt;li title=&quot;&nbsp;中长款(65cm&lt;衣长&le;80cm)&quot;&gt;	款式:&nbsp;中长款&lt;/li&gt;&lt;li title=&quot;&nbsp;中长款(65cm&lt;衣长&le;80cm)&quot;&gt;	袖长:&nbsp;长袖&lt;/li&gt;&lt;li title=&quot;&nbsp;V领&quot;&gt;	领型:&nbsp;狐狸领&lt;/li&gt;&lt;li title=&quot;&nbsp;常规袖&quot;&gt;	袖型:&nbsp;常规袖&lt;/li&gt;&lt;li title=&quot;&nbsp;三粒扣&quot;&gt;	衣门襟:&nbsp;拉链&lt;/li&gt;&lt;li title=&quot;&nbsp;三粒扣&quot;&gt;	皮质:&nbsp;羊皮&lt;/li&gt;&lt;li title=&quot;&nbsp;纽扣&nbsp;毛领&nbsp;口袋&nbsp;系带/腰带&quot;&gt;	流行元素/工艺:&nbsp;拉链&nbsp;毛领&nbsp;口袋&nbsp;系带/腰带&lt;/li&gt;&lt;li title=&quot;&nbsp;2013冬季&quot;&gt;	年份/季节:&nbsp;2013冬季&lt;/li&gt;&lt;li title=&quot;&nbsp;棕色金属腰带&nbsp;棕色&nbsp;黑色金属腰带&nbsp;黑色&quot;&gt;	颜色分类:&nbsp;图片色&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('281', '3', '汝窑', '<li title=\"&nbsp;xlhbz\">	货号:&nbsp;WJ0029</li><li title=\"&nbsp;汝窑\">	茶具产地:&nbsp;汝窑</li><li title=\"&nbsp;5人\">	推荐使用人数:&nbsp;6人</li><li title=\"&nbsp;自主实拍图\">	主图来源:&nbsp;自主实拍图</li>汝窑，釉中含有玛瑙，色泽青翠华滋，釉汁肥润莹亮，被历代称颂，有“宋瓷之冠”美誉，又与同期官窑、哥窑、钧窑、定窑合称“宋代五大名窑”。<li title=\"&nbsp;自主实拍图\"></li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('282', '3', '景德镇', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('65', '1', '1398型', '&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	主图来源:&nbsp;自主实拍图&lt;/li&gt;&lt;li title=&quot;&nbsp;修身型&quot;&gt;	货号：1398&lt;/li&gt;&lt;li title=&quot;&nbsp;修身型&quot;&gt;	板型:&nbsp;修身型&lt;/li&gt;&lt;li title=&quot;&nbsp;通勤&quot;&gt;	风格:&nbsp;通勤&lt;/li&gt;&lt;li title=&quot;&nbsp;韩版&quot;&gt;	通勤:&nbsp;韩版&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	衣长:&nbsp;常规款&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	袖长:&nbsp;长袖&lt;/li&gt;&lt;li title=&quot;&nbsp;圆领&quot;&gt;	领子:&nbsp;狐狸领&lt;/li&gt;&lt;li title=&quot;&nbsp;常规袖&quot;&gt;	袖型:&nbsp;常规袖&lt;/li&gt;&lt;li title=&quot;&nbsp;纯色&quot;&gt;	图案:&nbsp;纯色&lt;/li&gt;&lt;li title=&quot;&nbsp;带毛领&quot;&gt;	流行元素/工艺:&nbsp;带毛领&lt;/li&gt;&lt;li title=&quot;&nbsp;羊皮&quot;&gt;	面料材质:&nbsp;羊皮&lt;/li&gt;&lt;li title=&quot;&nbsp;2013冬季&quot;&gt;	年份/季节:&nbsp;2013冬季&lt;/li&gt;&lt;li title=&quot;&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）&quot;&gt;	颜色分类:&nbsp;图片色&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('64', '1', '7307型', '&lt;div class=&quot;wp-products-detail-desc&quot;&gt;	&lt;li title=&quot;&nbsp;直筒型&quot;&gt;		&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;			主图来源:&nbsp;自主实拍图		&lt;/li&gt;&nbsp;&nbsp;&nbsp;货号：7307	&lt;/li&gt;	&lt;li title=&quot;&nbsp;直筒型&quot;&gt;		&nbsp;板型:&nbsp;直筒型	&lt;/li&gt;	&lt;li title=&quot;&nbsp;常规&quot;&gt;		厚薄:&nbsp;常规	&lt;/li&gt;	&lt;li title=&quot;&nbsp;街头&quot;&gt;		风格:&nbsp;街头	&lt;/li&gt;	&lt;li title=&quot;&nbsp;欧美&quot;&gt;		街头:&nbsp;欧美	&lt;/li&gt;	&lt;li title=&quot;&nbsp;中长款(65cm&lt;衣长&le;80cm)&quot;&gt;		衣长:&nbsp;中长款	&lt;/li&gt;	&lt;li title=&quot;&nbsp;中长款(65cm&lt;衣长&le;80cm)&quot;&gt;		袖长:&nbsp;长袖	&lt;/li&gt;	&lt;li title=&quot;&nbsp;拉链&quot;&gt;		衣门襟:&nbsp;纽扣	&lt;/li&gt;	&lt;li title=&quot;&nbsp;拉链&quot;&gt;		年份/季节:&nbsp;2013秋季	&lt;/li&gt;	&lt;li title=&quot;&nbsp;明星同款（如图）&quot;&gt;		颜色分类:&nbsp;（如图）	&lt;/li&gt;	&lt;li title=&quot;&nbsp;明星同款（如图）&quot;&gt;		款式：&nbsp; 男士	&lt;/li&gt;&lt;/div&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('283', '3', '秀色荷花', '<p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的“益茶”。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。</span></p><p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【陶瓷茶具常保养】：<br />1、可用洗碗机要选择有“瓷器及水晶类”洗涤功能的洗碗机。<br />2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。<br />3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。<br />4、如果有茶渍，可用柠檬汁或食醋清洗。</span></p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('59', '1', '308型', '&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	主图来源:&nbsp;自主实拍图&lt;/li&gt;&lt;li title=&quot;&nbsp;修身型&quot;&gt;	货号：308&lt;/li&gt;&lt;li title=&quot;&nbsp;修身型&quot;&gt;	板型:&nbsp;修身型&lt;/li&gt;&lt;li title=&quot;&nbsp;加厚&quot;&gt;	厚薄:&nbsp;加厚&lt;/li&gt;&lt;li title=&quot;&nbsp;通勤&quot;&gt;	风格:&nbsp;通勤&lt;/li&gt;&lt;li title=&quot;&nbsp;韩版&quot;&gt;	通勤:&nbsp;韩版&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	衣长:&nbsp;常规款&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	袖长:&nbsp;长袖&lt;/li&gt;&lt;li title=&quot;&nbsp;圆领&quot;&gt;	领子:&nbsp;狐狸领&lt;/li&gt;&lt;li title=&quot;&nbsp;常规袖&quot;&gt;	袖型:&nbsp;常规袖&lt;/li&gt;&lt;li title=&quot;&nbsp;拉链&quot;&gt;	衣门襟:&nbsp;纽扣&lt;/li&gt;&lt;li title=&quot;&nbsp;带毛领&quot;&gt;	流行元素/工艺:&nbsp;带毛领&lt;/li&gt;&lt;li title=&quot;&nbsp;羊皮&quot;&gt;	面料材质:&nbsp;羊皮&lt;/li&gt;&lt;li title=&quot;&nbsp;2013冬季&quot;&gt;	年份/季节:&nbsp;2013冬季&lt;/li&gt;&lt;li title=&quot;&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）&quot;&gt;	颜色分类:&nbsp;图片色&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('60', '1', '1206型', '&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	主图来源:&nbsp;自主实拍图&lt;/li&gt;&lt;li title=&quot;&nbsp;修身型&quot;&gt;	货号：1206&lt;/li&gt;&lt;li title=&quot;&nbsp;修身型&quot;&gt;	板型:&nbsp;修身型&lt;/li&gt;&lt;li title=&quot;&nbsp;加厚&quot;&gt;	厚薄:&nbsp;加厚&lt;/li&gt;&lt;li title=&quot;&nbsp;通勤&quot;&gt;	风格:&nbsp;通勤&lt;/li&gt;&lt;li title=&quot;&nbsp;韩版&quot;&gt;	通勤:&nbsp;韩版&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	衣长:&nbsp;常规款&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	袖长:&nbsp;长袖&lt;/li&gt;&lt;li title=&quot;&nbsp;圆领&quot;&gt;	领子:&nbsp;狐狸领&lt;/li&gt;&lt;li title=&quot;&nbsp;常规袖&quot;&gt;	袖型:&nbsp;常规袖&lt;/li&gt;&lt;li title=&quot;&nbsp;带毛领&quot;&gt;	流行元素/工艺:&nbsp;带毛领&lt;/li&gt;&lt;li title=&quot;&nbsp;羊皮&quot;&gt;	面料材质:&nbsp;羊皮&lt;/li&gt;&lt;li title=&quot;&nbsp;2013冬季&quot;&gt;	年份/季节:&nbsp;2013冬季&lt;/li&gt;&lt;li title=&quot;&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）&quot;&gt;	颜色分类:&nbsp;黑色&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('61', '1', '13-95型', '&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	主图来源:&nbsp;自主实拍图&lt;/li&gt;&lt;li title=&quot;&nbsp;修身型&quot;&gt;	货号：13-95&lt;/li&gt;&lt;li title=&quot;&nbsp;修身型&quot;&gt;	板型:&nbsp;修身型&lt;/li&gt;&lt;li title=&quot;&nbsp;加厚&quot;&gt;	厚薄:&nbsp;加厚&lt;/li&gt;&lt;li title=&quot;&nbsp;通勤&quot;&gt;	风格:&nbsp;通勤&lt;/li&gt;&lt;li title=&quot;&nbsp;韩版&quot;&gt;	通勤:&nbsp;韩版&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	衣长:&nbsp;常规款&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	袖长:&nbsp;长袖&lt;/li&gt;&lt;li title=&quot;&nbsp;圆领&quot;&gt;	领子:&nbsp;狐狸领&lt;/li&gt;&lt;li title=&quot;&nbsp;常规袖&quot;&gt;	袖型:&nbsp;常规袖&lt;/li&gt;&lt;li title=&quot;&nbsp;拉链&quot;&gt;	衣门襟:&nbsp;拉链&lt;/li&gt;&lt;li title=&quot;&nbsp;带毛领&quot;&gt;	流行元素/工艺:&nbsp;带毛领&lt;/li&gt;&lt;li title=&quot;&nbsp;羊皮&quot;&gt;	面料材质:&nbsp;羊皮&lt;/li&gt;&lt;li title=&quot;&nbsp;2013冬季&quot;&gt;	年份/季节:&nbsp;2013冬季&lt;/li&gt;&lt;li title=&quot;&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）&quot;&gt;	颜色分类:&nbsp;图片色&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('284', '3', '腊梅罗汉', '<p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的“益茶”。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。</span></p><p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【陶瓷茶具常保养】：<br />1、可用洗碗机要选择有“瓷器及水晶类”洗涤功能的洗碗机。<br />2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。<br />3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。<br />4、如果有茶渍，可用柠檬汁或食醋清洗。</span></p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('52', '1', '塑暖男士保暖裤', '货号：123602&lt;br /&gt;颜色：浅灰&lt;br /&gt;尺码：M-XXL', '', '', '');
INSERT INTO `js_product_description` VALUES ('53', '1', '羊毛丽绒男套装', '货号：121602&lt;br /&gt;颜色：黑色&lt;br /&gt;尺码：L&lt;br /&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('54', '1', '炫彩美体裤', '&lt;p&gt;	货号：123621&lt;br /&gt;颜色：蓝绿色&lt;br /&gt;尺码：M-XL&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('55', '1', '青春肽美白化妆品', '功效: 美白 补水 &lt;br /&gt;保湿规格: 正常规格&lt;br /&gt;品牌: 肌源&lt;br /&gt;面部护理套装: 其它肌源单品&lt;br /&gt;适合肤质: 所有肤质化妆&lt;br /&gt;品特性: 温和度 气味', '', '', '');
INSERT INTO `js_product_description` VALUES ('285', '3', '青花展示盒', '<li title=\"&nbsp;ZSH-06\">	货号:WJ0025</li><li title=\"&nbsp;德化\">	茶具产地:&nbsp;景德镇</li><li title=\"&nbsp;陶瓷\">	材质:&nbsp;陶瓷</li><li title=\"&nbsp;青花\">	工艺:&nbsp;青花</li><li title=\"&nbsp;否\">	配茶盘:&nbsp;否</li><li title=\"&nbsp;其他分销图\">	主图来源:&nbsp;自主拍摄</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('57', '1', '303型', '&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	主图来源:&nbsp;自主实拍图&lt;/li&gt;&lt;li title=&quot;&nbsp;修身型&quot;&gt;	货号：303&lt;/li&gt;&lt;li title=&quot;&nbsp;修身型&quot;&gt;	板型:&nbsp;修身型&lt;/li&gt;&lt;li title=&quot;&nbsp;加厚&quot;&gt;	厚薄:&nbsp;加厚&lt;/li&gt;&lt;li title=&quot;&nbsp;通勤&quot;&gt;	风格:&nbsp;通勤&lt;/li&gt;&lt;li title=&quot;&nbsp;韩版&quot;&gt;	通勤:&nbsp;韩版&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	衣长:&nbsp;中长款&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	袖长:&nbsp;长袖&lt;/li&gt;&lt;li title=&quot;&nbsp;圆领&quot;&gt;	领子:&nbsp;狐狸领&lt;/li&gt;&lt;li title=&quot;&nbsp;常规袖&quot;&gt;	袖型:&nbsp;常规袖&lt;/li&gt;&lt;li title=&quot;&nbsp;拉链&quot;&gt;	衣门襟:&nbsp;拉链&lt;/li&gt;&lt;li title=&quot;&nbsp;带毛领&quot;&gt;	流行元素/工艺:&nbsp;带毛领&lt;/li&gt;&lt;li title=&quot;&nbsp;羊皮&quot;&gt;	面料材质:&nbsp;羊皮&lt;/li&gt;&lt;li title=&quot;&nbsp;2013冬季&quot;&gt;	年份/季节:&nbsp;2013冬季&lt;/li&gt;&lt;li title=&quot;&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）&quot;&gt;	颜色分类:&nbsp;图片色&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('58', '1', '1307型', '&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	主图来源:&nbsp;自主实拍图&lt;/li&gt;&lt;li title=&quot;&nbsp;修身型&quot;&gt;	货号：1307&lt;/li&gt;&lt;li title=&quot;&nbsp;修身型&quot;&gt;	板型:&nbsp;修身型&lt;/li&gt;&lt;li title=&quot;&nbsp;加厚&quot;&gt;	厚薄:&nbsp;加厚&lt;/li&gt;&lt;li title=&quot;&nbsp;通勤&quot;&gt;	风格:&nbsp;通勤&lt;/li&gt;&lt;li title=&quot;&nbsp;韩版&quot;&gt;	通勤:&nbsp;韩版&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	衣长:&nbsp;中长款&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	袖长:&nbsp;长袖&lt;/li&gt;&lt;li title=&quot;&nbsp;圆领&quot;&gt;	领子:&nbsp;狐狸领&lt;/li&gt;&lt;li title=&quot;&nbsp;常规袖&quot;&gt;	袖型:&nbsp;常规袖&lt;/li&gt;&lt;li title=&quot;&nbsp;拉链&quot;&gt;	衣门襟:&nbsp;纽扣&lt;/li&gt;&lt;li title=&quot;&nbsp;拉链&quot;&gt;	流行元素/工艺:&nbsp;带毛领&lt;/li&gt;&lt;li title=&quot;&nbsp;羊皮&quot;&gt;	面料材质:&nbsp;羊皮&lt;/li&gt;&lt;li title=&quot;&nbsp;2013冬季&quot;&gt;	年份/季节:&nbsp;2013冬季&lt;/li&gt;&lt;li title=&quot;&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）&quot;&gt;	颜色分类:&nbsp;粉色&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('286', '3', '竹子彩画', '<p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的“益茶”。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。</span></p><p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【陶瓷茶具常保养】：<br />1、可用洗碗机要选择有“瓷器及水晶类”洗涤功能的洗碗机。<br />2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。<br />3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。<br />4、如果有茶渍，可用柠檬汁或食醋清洗。</span></p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('50', '1', '男士羊绒套装', '货号：131606&lt;br /&gt;颜色：黑色&nbsp; 灰色&lt;br /&gt;尺码：M-XXL&lt;br /&gt;1.此款衣服先采用三线合缝技术，后用三针五线压缝，一道工序分两步完成是为了不易开线，缝合处面料平整，优于其它品牌产品&lt;br /&gt;2.此款产品采用兰精木代尔，兰精木代尔为榉木纤维，是一种纯绿色、环保纤维，低碳、柔软，如雪花般纯净，垂性好，吸水能力高于棉50%，干爽透气，利于人体血液循环，是最适合贴身穿着的保健面料。百洗不缩水、不变型、不掉色，因为纯植物纤维，适合各种敏感肌肤，对肌肤不会产生一点负担，蚕丝般的光泽和柔性，表面覆短纤绒状，贴身穿着舒适，越洗越柔软，同样25次洗涤，棉越洗越硬，莫代尔越洗越柔软，有光泽。&lt;br /&gt;3.独有魔咔3D智能美体技术：1.四片立体拼片裁剪技术，彻底颠覆传统内衣前后两片裁剪缝合手法，完全去除腰部多余的布料，与其他内衣相比穿后更显腰身。人不是一张纸，是立体的，合理裁剪已经把多余的面料都裁减掉，合体是特点，不是版型小2.五大靶向定位魔咔美体结构：托胸：魔咔弧托胸环带，按人体工学设计，配合文胸充分起到聚拢支撑作用，倍现胸型曲线。胸部是立体的，撑开之后是按照人体工学设计的。直背：X型直背带设计，在行动中自动拉伸背部曲线； 收腰：独有环形束腰环带和菱形收腹角带，瞬间平腹打造小蛮腰；提臀：独有双向U型提臀环带，发挥包臀提升效用雕塑峰翘美臀；美腿：独有拉长美腿带，具有腿型修正功能。&lt;br /&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('51', '1', '非常6+1保暖裤', '货号：133601&lt;br /&gt;颜色：黑色&lt;br /&gt;尺码：M-XXL&lt;br /&gt;1、楔形环带，前低后高，环型高腰腰带，收腹效果极佳，穿上之后腰围立减3公分，塑造女运动员的腰线，内层采用远红外提臀带，远红外具有对皮肤下2-3cm的血液改善微循环，增强自愈能力，提高免疫能力，加速新陈代谢。&lt;br /&gt;2、前四层为：蜂窝状六棱形拉力布&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 超细密羔羊绒&nbsp; 扎染紫&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 超细密羔羊绒&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 纯棉收腹片（护宫）&lt;br /&gt;后三层为：蜂窝状六棱形拉力布&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 超细密羔羊绒&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 远红外环形提臀带&lt;br /&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('287', '3', '亚光彩画', '<p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的“益茶”。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。</span></p><p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【陶瓷茶具常保养】：<br />1、可用洗碗机要选择有“瓷器及水晶类”洗涤功能的洗碗机。<br />2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。<br />3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。<br />4、如果有茶渍，可用柠檬汁或食醋清洗。</span></p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('288', '3', '简易青花', '<li title=\"&nbsp;ZSH-06\">	货号:WJ0021</li><li title=\"&nbsp;德化\">	茶具产地:&nbsp;景德镇</li><li title=\"&nbsp;陶瓷\">	材质:&nbsp;陶瓷</li><li title=\"&nbsp;青花\">	工艺:&nbsp;青花</li><li title=\"&nbsp;否\">	配茶盘:&nbsp;否</li><li title=\"&nbsp;其他分销图\">	主图来源:&nbsp;自主拍摄</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('289', '3', '邑窑', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('290', '3', '新玲珑', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('291', '3', '冰裂瓷茶具', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('56', '1', '1673型', '&lt;li title=&quot;&nbsp;自主实拍图&quot;&gt;	主图来源:&nbsp;自主实拍图&lt;/li&gt;&lt;li title=&quot;&nbsp;修身型&quot;&gt;	货号：1673&lt;/li&gt;&lt;li title=&quot;&nbsp;修身型&quot;&gt;	板型:&nbsp;修身型&lt;/li&gt;&lt;li title=&quot;&nbsp;加厚&quot;&gt;	厚薄:&nbsp;加厚&lt;/li&gt;&lt;li title=&quot;&nbsp;通勤&quot;&gt;	风格:&nbsp;通勤&lt;/li&gt;&lt;li title=&quot;&nbsp;韩版&quot;&gt;	通勤:&nbsp;韩版&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	衣长:&nbsp;中长款&lt;/li&gt;&lt;li title=&quot;&nbsp;常规款(50cm&lt;衣长&le;65cm)&quot;&gt;	袖长:&nbsp;长袖&lt;/li&gt;&lt;li title=&quot;&nbsp;圆领&quot;&gt;	领子:&nbsp;狐狸领&lt;/li&gt;&lt;li title=&quot;&nbsp;常规袖&quot;&gt;	袖型:&nbsp;常规袖&lt;/li&gt;&lt;li title=&quot;&nbsp;带毛领&quot;&gt;	流行元素/工艺:&nbsp;带毛领&lt;/li&gt;&lt;li title=&quot;&nbsp;羊皮&quot;&gt;	面料材质:&nbsp;羊皮&lt;/li&gt;&lt;li title=&quot;&nbsp;2013冬季&quot;&gt;	年份/季节:&nbsp;2013冬季&lt;/li&gt;&lt;li title=&quot;&nbsp;黑色（高仿狐狸毛领）&nbsp;白色（高仿狐狸毛领）&quot;&gt;	颜色分类:&nbsp;黑色&lt;/li&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('292', '3', '青色茶叶罐', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('293', '3', '普通茶道', '<li title=\"&nbsp;TZ-0422\">	货号:&nbsp;WJ0013</li><li title=\"&nbsp;宜兴\">	茶具产地:&nbsp;景德镇</li><li title=\"&nbsp;紫砂\">	材质:&nbsp;紫砂</li><li title=\"&nbsp;6人\">	推荐使用人数:&nbsp;6人</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('294', '3', '亚光山水', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('295', '3', '荷花雪花釉', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('296', '3', '贤人指福', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('297', '3', '小七件紫纱', '<li title=\"&nbsp;TZ-0422\">	货号:&nbsp;WJ0002</li><li title=\"&nbsp;宜兴\">	茶具产地:&nbsp;景德镇</li><li title=\"&nbsp;紫砂\">	材质:&nbsp;紫砂</li><li title=\"&nbsp;6人\">	推荐使用人数:&nbsp;6人</li>', '', '', '');
INSERT INTO `js_product_description` VALUES ('298', '3', '红色腾', '<p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的“益茶”。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。</span></p><p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【陶瓷茶具常保养】：<br />1、可用洗碗机要选择有“瓷器及水晶类”洗涤功能的洗碗机。<br />2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。<br />3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。<br />4、如果有茶渍，可用柠檬汁或食醋清洗。</span></p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('299', '3', '木棉花', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('49', '1', '女士羊绒套装', '货号：131607&lt;br /&gt;颜色：水粉色&lt;br /&gt;尺码：M-XXL&lt;br /&gt;1.此款衣服先采用三线合缝技术，后用三针五线压缝，一道工序分两步完成是为了不易开线，缝合处面料平整，优于其它品牌产品&lt;br /&gt;2.此款产品采用兰精木代尔，兰精木代尔为榉木纤维，是一种纯绿色、环保纤维，低碳、柔软，如雪花般纯净，垂性好，吸水能力高于棉50%，干爽透气，利于人体血液循环，是最适合贴身穿着的保健面料。百洗不缩水、不变型、不掉色，因为纯植物纤维，适合各种敏感肌肤，对肌肤不会产生一点负担，蚕丝般的光泽和柔性，表面覆短纤绒状，贴身穿着舒适，越洗越柔软，同样25次洗涤，棉越洗越硬，莫代尔越洗越柔软，有光泽。&lt;br /&gt;3.独有魔咔3D智能美体技术：1.四片立体拼片裁剪技术，彻底颠覆传统内衣前后两片裁剪缝合手法，完全去除腰部多余的布料，与其他内衣相比穿后更显腰身。人不是一张纸，是立体的，合理裁剪已经把多余的面料都裁减掉，合体是特点，不是版型小2.五大靶向定位魔咔美体结构：托胸：魔咔弧托胸环带，按人体工学设计，配合文胸充分起到聚拢支撑作用，倍现胸型曲线。胸部是立体的，撑开之后是按照人体工学设计的。直背：X型直背带设计，在行动中自动拉伸背部曲线； 收腰：独有环形束腰环带和菱形收腹角带，瞬间平腹打造小蛮腰；提臀：独有双向U型提臀环带，发挥包臀提升效用雕塑峰翘美臀；美腿：独有拉长美腿带，具有腿型修正功能。&lt;br /&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('300', '3', '小木盒茶具', '<p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【瓷器】是中华民族的伟大发明，是数千年文明的见证，也是中国文化的象征。从传统的品茶艺术、茶饮文化而言，茶器是整个品茶艺术过程中不可缺少的一部分。质地精良、造型优美且富有文化意蕴的茶器，对于衬托茶汤、保持茶香、提高品茶的情趣，都有着十分重要的作用，这就是陆羽所说的“益茶”。这款茶具产自中国三大瓷都之一的德化，属玉瓷精品，做工精美，质量上乘。淘宝直营，减少中间环节，相当于商场三至六折售价。瓷质细腻，白度柔和，器皿形状规整。环保瓷：低铅或无铅产品。由于是欧美社会的基本保障，在产品质量方面都与欧美看齐。</span></p><p style=\"color:#613c1f;\" align=\"left\">	<span style=\"font-size:x-small;\">【陶瓷茶具常保养】：<br />1、可用洗碗机要选择有“瓷器及水晶类”洗涤功能的洗碗机。<br />2、带有黄金和铂金边装饰的瓷器不宜放入微波炉加热。<br />3、洗剂PH值须在11-11.5之间。勿将热杯直接浸入冷水中，以免温度迅速改变损伤瓷质。<br />4、如果有茶渍，可用柠檬汁或食醋清洗。</span></p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('301', '3', '心方缘', '<table style=\"width:100%;\" class=\"ke-zeroborder\" title=\"tbdescguide\" border=\"0\">	<tbody>		<tr>			<td>				<p style=\"text-align:center;\">					<span style=\"font-size:18px;\"><span style=\"color:#444444;\"><span style=\"font-size:18px;\"><strong><span style=\"font-size:18px;\">46头&nbsp;&nbsp; 骨 质瓷是目前唯一世界上公认的高档瓷种，是权利和地位的象征，号称瓷器之王！骨质瓷制造工艺复杂，经过高温素烧和低温烧制而成的，欧洲标准上好的骨质瓷的骨 炭含量是40%以上，套装均价在几千元左右。其主要特点有瓷质细腻通透、器形美观典雅、瓷质轻薄、彩面润泽光亮。优质品用瓷勺敲打或手指轻弹，清脆响亮， 宛如洪钟。</span></strong></span></span></span> 				</p>				<p style=\"text-align:center;\">					<span style=\"font-size:18px;\"><span style=\"color:#444444;\"><span style=\"font-size:18px;\"><strong><span style=\"font-size:18px;\">骨质瓷一定要用手清洗，不可用洗碗机。有金边的餐具，勿放入微波炉，以免腐蚀。如有刮花，可以用牙膏略打磨。如有茶渍，可用柠檬汁或食醋清洗。不要用明火直接烧用！</span></strong></span></span></span> 				</p>			</td>		</tr>	</tbody></table><p>	&nbsp;</p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('45', '1', '女咖啡炭健康内衣', '货号：121607&lt;br /&gt;颜色：蓝灰细条&lt;br /&gt;尺码：M-XXL&lt;br /&gt;1.此款采用的是咖啡碳的面料，咖啡碳是一种功能性的面料，它的特点是，抑菌：人体出汗后产生的真菌在身体表面繁殖，咖啡碳能够有效的抑制真菌，预防皮肤病的发生，除臭：人体出汗后的矿物质和毒素排出体外，常年穿着咖啡碳内衣能够去除身体异味。防止紫外线：内层具有防辐射保护层，适合在电脑前长期工作的人员。储存热量：身体内产生的热量因为功能性面料的关系80%折射回体内，以达到保暖的效果。此款面料的吸湿透气性能佳，为四面弹产品，横向弹力1:2.5，纵向弹力1:2，穿着舒适、贴身、尽显人体曲线美感。&lt;br /&gt;2.色纺纱线交替交织构成，是用纱线先染色再织造的面料，染料附着力小，对皮肤无伤害，适合各种肌肤的人群穿着，市面上的其他产品水洗后浮色的原因为，都是织成面料后再染色，所以色牢度不好，染料附着比较多，长期穿着会对人体造成伤害。&lt;br /&gt;3.此款衣服百洗不变形，，导购推销的时候可以放心的向顾客介绍，，领型采用对条对格工艺，此工艺技术要求高，费料多，损耗大；合缝采用四针六线工艺，平面穿着无压痕。&lt;br /&gt;4.此款面料为我公司专利产品，碳化纳米，咖啡豆的壳经过最新科技碳化纳米技术，中国专利号GL200410086547.4号。&lt;br /&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('46', '1', '男咖啡炭健康内衣', '货号：121606&lt;br /&gt;颜色：蓝灰条纹&lt;br /&gt;尺码：M-XXL&lt;br /&gt;1.此款采用的是咖啡碳的面料，咖啡碳是一种功能性的面料，它的特点是，抑菌：人体出汗后产生的真菌在身体表面繁殖，咖啡碳能够有效的抑制真菌，预防皮肤病的发生，除臭：人体出汗后的矿物质和毒素排出体外，常年穿着咖啡碳内衣能够去除身体异味。防止紫外线：内层具有防辐射保护层，适合在电脑前长期工作的人员。储存热量：身体内产生的热量因为功能性面料的关系80%折射回体内，以达到保暖的效果。此款面料的吸湿透气性能佳，为四面弹产品，横向弹力1:2.5，纵向弹力1:2，穿着舒适、贴身、尽显人体曲线美感。&lt;br /&gt;2.色纺纱线交替交织构成，是用纱线先染色再织造的面料，染料附着力小，对皮肤无伤害，适合各种肌肤的人群穿着，市面上的其他产品水洗后浮色的原因为，都是织成面料后再染色，所以色牢度不好，染料附着比较多，长期穿着会对人体造成伤害。&lt;br /&gt;3.此款衣服百洗不变形，，导购推销的时候可以放心的向顾客介绍，，领型采用对条对格工艺，此工艺技术要求高，费料多，损耗大；合缝采用四针六线工艺，平面穿着无压痕。&lt;br /&gt;4.此款面料为我公司专利产品，碳化纳米，咖啡豆的壳经过最新科技碳化纳米技术，中国专利号GL200410086547.4号。&lt;br /&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('302', '3', '金粉世家', '<table style=\"width:100%;\" class=\"ke-zeroborder\" title=\"tbdescguide\" border=\"0\">	<tbody>		<tr>			<td>				<p style=\"text-align:center;\">					<span style=\"font-size:18px;\"><span style=\"color:#444444;\"><span style=\"font-size:18px;\"><strong><span style=\"font-size:18px;\">46头&nbsp;&nbsp; 骨 质瓷是目前唯一世界上公认的高档瓷种，是权利和地位的象征，号称瓷器之王！骨质瓷制造工艺复杂，经过高温素烧和低温烧制而成的，欧洲标准上好的骨质瓷的骨 炭含量是40%以上，套装均价在几千元左右。其主要特点有瓷质细腻通透、器形美观典雅、瓷质轻薄、彩面润泽光亮。优质品用瓷勺敲打或手指轻弹，清脆响亮， 宛如洪钟。</span></strong></span></span></span> 				</p>				<p style=\"text-align:center;\">					<span style=\"font-size:18px;\"><span style=\"color:#444444;\"><span style=\"font-size:18px;\"><strong><span style=\"font-size:18px;\">骨质瓷一定要用手清洗，不可用洗碗机。有金边的餐具，勿放入微波炉，以免腐蚀。如有刮花，可以用牙膏略打磨。如有茶渍，可用柠檬汁或食醋清洗。不要用明火直接烧用！</span></strong></span></span></span> 				</p>			</td>		</tr>	</tbody></table><p>	&nbsp;</p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('47', '1', '女磨毛套装', '货号：131603&lt;br /&gt;颜色：紫色&lt;br /&gt;尺码：M-XXL&lt;br /&gt;1.此款面料内层为发热保暖绒，采用双抗开司米材料，抗起球，抗静电，另外开司米具有羊绒的暖度和舒适度，在面料中被称之为仿羊绒。&lt;br /&gt;2.颈部增加了磁性理疗贴片，有效的保护了颈椎部的血液循环，起到理疗颈椎的作用。&lt;br /&gt;3.此款衣服先采用三线合缝技术，后用三针五线压缝，一道工序分两步完成是为了不易开线，缝合处面料平整，优于其它品牌产品。&lt;br /&gt;4.独有魔咔3D智能美体技术：1.四片立体拼片裁剪技术，彻底颠覆传统内衣前后两片裁剪缝合手法，完全去除腰部多余的布料，与其他内衣相比穿后更显腰身。人不是一张纸，是立体的，合理裁剪已经把多余的面料都裁减掉，合体是特点，不是版型小2.五大靶向定位魔咔美体结构：托胸：魔咔弧托胸环带，按人体工学设计，配合文胸充分起到聚拢支撑作用，倍现胸型曲线。胸部是立体的，撑开之后是按照人体工学设计的。直背：X型直背带设计，在行动中自动拉伸背部曲线； 收腰：独有环形束腰环带和菱形收腹角带，瞬间平腹打造小蛮腰；提臀：独有双向U型提臀环带，发挥包臀提升效用雕塑峰翘美臀；美腿：独有拉长美腿带，具有腿型修正功能。&lt;br /&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('48', '1', '蕾丝保暖美体内衣', '货号：124605&lt;br /&gt;颜色：麻紫&lt;br /&gt;尺码：M-XXL&lt;br /&gt;1.独有魔咔3D智能美体技术：1.四片立体拼片裁剪技术，彻底颠覆传统内衣前后两片裁剪缝合手法，完全去除腰部多余的布料，与其他内衣相比穿后更显腰身。人不是一张纸，是立体的，合理裁剪已经把多余的面料都裁减掉，合体是特点，不是版型小；&lt;br /&gt;2.五大靶向定位魔咔美体结构：托胸：魔咔弧托胸环带，按人体工学设计，配合文胸充分起到聚拢支撑作用，倍现胸型曲线。胸部是立体的，撑开之后是按照人体工学设计的。直背：X型直背带设计，采用蜂窝状六棱型拉力网布，在行动中自动拉伸背部曲线； 收腰：独有环形束腰环带和菱形收腹角带，蜂窝状六棱型拉力网布，瞬间平腹打造小蛮腰；提臀：独有双向U型提臀环带，发挥包臀提升效用雕塑峰翘美臀；美腿：独有拉长美腿带，具有腿型修正功能。&lt;br /&gt;3.面料采用的是65支长绒棉，产地新疆，阳光照射时间长，摸上去有暖融融的感觉，面料弹性极佳&lt;br /&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('303', '3', '清雅名媛   50头', '<table style=\"width:100%;\" class=\"ke-zeroborder\" title=\"tbdescguide\" border=\"0\">	<tbody>		<tr>			<td>				<p style=\"text-align:center;\">					<span style=\"font-size:18px;\"><span style=\"color:#444444;\"><span style=\"font-size:18px;\"><strong><span style=\"font-size:18px;\">骨 质瓷是目前唯一世界上公认的高档瓷种，是权利和地位的象征，号称瓷器之王！骨质瓷制造工艺复杂，经过高温素烧和低温烧制而成的，欧洲标准上好的骨质瓷的骨 炭含量是40%以上，套装均价在几千元左右。其主要特点有瓷质细腻通透、器形美观典雅、瓷质轻薄、彩面润泽光亮。优质品用瓷勺敲打或手指轻弹，清脆响亮， 宛如洪钟。</span></strong></span></span></span> 				</p>				<p style=\"text-align:center;\">					<span style=\"font-size:18px;\"><span style=\"color:#444444;\"><span style=\"font-size:18px;\"><strong><span style=\"font-size:18px;\">骨质瓷一定要用手清洗，不可用洗碗机。有金边的餐具，勿放入微波炉，以免腐蚀。如有刮花，可以用牙膏略打磨。如有茶渍，可用柠檬汁或食醋清洗。不要用明火直接烧用！</span></strong></span></span></span> 				</p>			</td>		</tr>	</tbody></table><p>	&nbsp;</p><p>	&nbsp;</p>', '', '', '');
INSERT INTO `js_product_description` VALUES ('304', '3', '粉红花', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('305', '3', '金芙蓉', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('306', '3', '头桎梏', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('43', '1', '花胶', '&nbsp;&lt;div&gt;	&lt;div&gt;		&lt;span style=&quot;font-size:156%;&quot;&gt;&lt;span style=&quot;font-family:Wingdings;color:#dc5900;font-size:75%;&quot;&gt;v&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:28pt;&quot;&gt;&lt;b&gt;花胶的&lt;/b&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:28pt;&quot;&gt;&lt;b&gt;&lt;a href=&quot;http://www.99.com.cn/special/zhongcaoyao.htm&quot; target=&quot;_parent&quot;&gt;功效&lt;/a&gt;&lt;/b&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:28pt;&quot;&gt;&lt;b&gt;与作用：&lt;/b&gt;&lt;/span&gt;&lt;span style=&quot;font-size:28pt;&quot;&gt;&lt;b&gt;&lt;span&gt;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:28pt;&quot;&gt;甘，平。补肾益精，滋养筋&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:28pt;&quot;&gt;脉，止血，散瘀，消肿。治&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:28pt;&quot;&gt;&lt;a href=&quot;http://bj.99.com.cn/shzd/77897.htm&quot; target=&quot;_parent&quot;&gt;肾虚&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:28pt;&quot;&gt;滑精，&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:28pt;&quot;&gt;&lt;a href=&quot;http://ye.99.com.cn/fenmian/&quot; target=&quot;_parent&quot;&gt;产后&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:28pt;&quot;&gt;风痉，破&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:28pt;&quot;&gt;伤风，吐血，血崩，创伤出血，痔疮。&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:28pt;&quot;&gt;&lt;b&gt; &lt;/b&gt;&lt;/span&gt;	&lt;/div&gt;	&lt;div&gt;		&lt;span style=&quot;font-size:156%;&quot;&gt;&lt;span style=&quot;font-family:Wingdings;color:#dc5900;font-size:75%;&quot;&gt;v&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:28pt;&quot;&gt;&lt;b&gt;　　花胶的营养价值：&lt;/b&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:28pt;&quot;&gt; &lt;/span&gt;	&lt;/div&gt;	&lt;div&gt;		&lt;span style=&quot;font-size:156%;&quot;&gt;&lt;span style=&quot;font-family:Wingdings;color:#dc5900;font-size:75%;&quot;&gt;v&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:28pt;&quot;&gt;　　含蛋白质，脂肪，钙，磷，铁等。 &lt;/span&gt;	&lt;/div&gt;	&lt;div&gt;	&lt;/div&gt;&lt;/div&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('307', '3', '银牛花   WJ002', '<table style=\"width:100%;\" class=\"ke-zeroborder\" title=\"tbdescguide\" border=\"0\">	<tbody>		<tr>			<td>				<p style=\"text-align:center;\">					<span style=\"font-size:18px;\"><span style=\"color:#444444;\"><span style=\"font-size:18px;\"><strong><span style=\"font-size:18px;\">骨 质瓷是目前唯一世界上公认的高档瓷种，是权利和地位的象征，号称瓷器之王！骨质瓷制造工艺复杂，经过高温素烧和低温烧制而成的，欧洲标准上好的骨质瓷的骨 炭含量是40%以上，套装均价在几千元左右。其主要特点有瓷质细腻通透、器形美观典雅、瓷质轻薄、彩面润泽光亮。优质品用瓷勺敲打或手指轻弹，清脆响亮， 宛如洪钟。</span></strong></span></span></span> 				</p>				<p style=\"text-align:center;\">					<span style=\"font-size:18px;\"><span style=\"color:#444444;\"><span style=\"font-size:18px;\"><strong><span style=\"font-size:18px;\">骨质瓷一定要用手清洗，不可用洗碗机。有金边的餐具，勿放入微波炉，以免腐蚀。如有刮花，可以用牙膏略打磨。如有茶渍，可用柠檬汁或食醋清洗。不要用明火直接烧用！</span></strong></span></span></span> 				</p>			</td>		</tr>	</tbody></table>', '', '', '');
INSERT INTO `js_product_description` VALUES ('308', '3', '维多利亚', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('309', '3', '玉佛A1021', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('310', '3', '玉佛A1019', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('311', '3', '玉佛A1018', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('312', '3', '玉佛A1017', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('313', '3', '玉佛A1016', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('314', '3', '玉佛A1015', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('315', '3', '玉佛A1013', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('316', '3', '玉佛A1012', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('44', '1', '印尼进口燕窝', '&nbsp;&lt;div&gt;	&lt;div&gt;		&lt;span style=&quot;font-size:67%;&quot;&gt;&lt;span style=&quot;font-family:Wingdings;color:#dc5900;font-size:75%;&quot;&gt;v&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;&lt;b&gt;功效：&lt;/b&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt; &lt;/span&gt; 	&lt;/div&gt;	&lt;div&gt;		&lt;span style=&quot;font-size:67%;&quot;&gt;&lt;span style=&quot;font-family:Wingdings;color:#dc5900;font-size:75%;&quot;&gt;v&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;　　&lt;/span&gt;&lt;span style=&quot;font-size:12pt;&quot;&gt;1&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;、补肺养阴、止肺虚性咳嗽、减少肺气病变。包括肺阴虚之哮喘、气促、久咳、痰中带血、咳血、咯血、&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;&lt;a href=&quot;http://www.pclady.com.cn/tlist/15949.html&quot; target=&quot;_parent&quot;&gt;支气管炎&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;、出&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;汗、低潮热。 &lt;/span&gt; 	&lt;/div&gt;	&lt;div&gt;		&lt;span style=&quot;font-size:67%;&quot;&gt;&lt;span style=&quot;font-family:Wingdings;color:#dc5900;font-size:75%;&quot;&gt;v&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;　　&lt;/span&gt;&lt;span style=&quot;font-size:12pt;&quot;&gt;2&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;、补虚养胃、止胃寒性、呕吐。胃阴虚引起之反胃、干呕、肠鸣声。 &lt;/span&gt; 	&lt;/div&gt;	&lt;div&gt;		&lt;span style=&quot;font-size:67%;&quot;&gt;&lt;span style=&quot;font-family:Wingdings;color:#dc5900;font-size:75%;&quot;&gt;v&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;　　&lt;/span&gt;&lt;span style=&quot;font-size:12pt;&quot;&gt;3&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;、凡病后虚弱、痨伤、中气亏损各症，配合&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;&lt;a href=&quot;http://health.pclady.com.cn/healthzq/bupin/yanwo/&quot; target=&quot;_parent&quot;&gt;燕窝&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;作食，能滋阴调中。 &lt;/span&gt; 	&lt;/div&gt;	&lt;div&gt;		&lt;span style=&quot;font-size:67%;&quot;&gt;&lt;span style=&quot;font-family:Wingdings;color:#dc5900;font-size:75%;&quot;&gt;v&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;　　&lt;/span&gt;&lt;span style=&quot;font-size:12pt;&quot;&gt;4&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;、止汗、气虚、脾虚之多汗、小便频繁、夜尿。 &lt;/span&gt; 	&lt;/div&gt;	&lt;div&gt;		&lt;span style=&quot;font-size:67%;&quot;&gt;&lt;span style=&quot;font-family:Wingdings;color:#dc5900;font-size:75%;&quot;&gt;v&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;　　&lt;/span&gt;&lt;span style=&quot;font-size:12pt;&quot;&gt;5&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;、使人&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;&lt;a href=&quot;http://health.pclady.com.cn/pf/&quot; target=&quot;_parent&quot;&gt;皮肤&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;光滑、有弹性和光泽，从而&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;&lt;a href=&quot;http://www.pclady.com.cn/tlist/23509.html&quot; target=&quot;_parent&quot;&gt;减少皱纹&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;。 &lt;/span&gt; 	&lt;/div&gt;	&lt;div&gt;		&lt;span style=&quot;font-size:67%;&quot;&gt;&lt;span style=&quot;font-family:Wingdings;color:#dc5900;font-size:75%;&quot;&gt;v&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;　　&lt;/span&gt;&lt;span style=&quot;font-size:12pt;&quot;&gt;6&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;、燕窝含多种氨基酸，婴幼儿和儿童常吃能长智慧、增加思维、抗敏感、补其先后天之不足。 &lt;/span&gt; 	&lt;/div&gt;	&lt;div&gt;		&lt;span style=&quot;font-size:67%;&quot;&gt;&lt;span style=&quot;font-family:Wingdings;color:#dc5900;font-size:75%;&quot;&gt;v&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;　　&lt;/span&gt;&lt;span style=&quot;font-size:12pt;&quot;&gt;7&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;、孕妇在妊娠期间、&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;&lt;a href=&quot;http://www.pclady.com.cn/tlist/26521.html&quot; target=&quot;_parent&quot;&gt;产前产后&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;进食，则有安胎、补胎之效。 &lt;/span&gt; 	&lt;/div&gt;	&lt;div&gt;		&lt;span style=&quot;font-size:67%;&quot;&gt;&lt;span style=&quot;font-family:Wingdings;color:#dc5900;font-size:75%;&quot;&gt;v&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;　　&lt;/span&gt;&lt;span style=&quot;font-size:12pt;&quot;&gt;8&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;、燕窝是天然增津液的食品，并含多种氨基酸，对食道癌，咽喉癌、胃癌、肝癌、直肠癌等有抑止和抗衡作用。 &lt;/span&gt; 	&lt;/div&gt;	&lt;div&gt;		&lt;span style=&quot;font-size:67%;&quot;&gt;&lt;span style=&quot;font-family:Wingdings;color:#dc5900;font-size:75%;&quot;&gt;v&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;　　&lt;/span&gt;&lt;span style=&quot;font-size:12pt;&quot;&gt;9&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;、凡经电疗、化疗而引起的后遗症，如咽干、咽痛、肿胀、便秘、声嘶、作呕等，食燕窝都有明显的改善。 &lt;/span&gt; 	&lt;/div&gt;	&lt;div&gt;		&lt;span style=&quot;font-size:67%;&quot;&gt;&lt;span style=&quot;font-family:Wingdings;color:#dc5900;font-size:75%;&quot;&gt;v&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;　　&lt;/span&gt;&lt;span style=&quot;font-size:12pt;&quot;&gt;10&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:12pt;&quot;&gt;、燕窝味甘性平、滋阴润燥，是有营养的有益食品，有保健食疗之效，是大众欢迎之健康食品。 &lt;/span&gt; 	&lt;/div&gt;	&lt;div&gt;	&lt;/div&gt;&lt;/div&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('317', '3', '玉佛A1010', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('318', '3', '玉佛A1009', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('319', '3', '玉佛A1008', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('320', '3', '玉佛A1007', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('321', '3', '玉佛A1006', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('322', '3', '玉佛A1005', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('323', '3', '玉佛A1002', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('324', '3', '玉佛A1001', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('325', '3', '翡翠项链XR0105', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('326', '3', '黑曜石XR0103', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('327', '3', '翡翠吊坠C0005', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('328', '3', '翡翠吊坠C0002', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('329', '3', '翡翠吊坠C0001', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('330', '3', '水晶手链L0018', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('331', '3', '水晶手链L0017', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('332', '3', '水晶手链L0016', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('333', '3', '水晶手链L0015', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('42', '1', '圆形佳人', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('334', '3', '水晶手链L0012', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('41', '1', '春之花', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('335', '3', '水晶手链L0011', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('40', '1', '水晶吊坠（1对）', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('336', '3', '玛瑙把玩W107', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('39', '1', '金蝉吊坠', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('337', '3', '玛瑙把玩W105', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('38', '1', '水晶吊坠', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('338', '3', '玛瑙把玩W103', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('37', '1', 'A0039', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('339', '3', '玛瑙把玩W102', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('36', '1', 'A0036', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('340', '3', '玛瑙把玩W101', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('35', '1', 'A0032', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('34', '1', 'A0038', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('341', '3', '手链石榴石L0021', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('33', '1', 'A0035', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('32', '1', 'A0037', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('342', '3', '手链紫水晶L0020', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('31', '1', '大珍珠项链', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('343', '3', '手链石榴石L0019', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('30', '1', '米粒珍珠项链', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('344', '3', '水晶吊坠D1019', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('29', '1', '小珍珠项链', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('345', '3', '水晶吊坠D1018', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('28', '1', '小牛角梳', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('346', '3', '水晶吊坠D1017', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('27', '1', '大牛角梳', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('347', '3', '水晶吊坠D1016', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('26', '1', '（大牛角）', '&lt;p&gt;	&nbsp;&lt;/p&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('348', '3', '水晶吊坠D1015', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('25', '1', '小牛角', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('349', '3', '水晶吊坠D1012', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('24', '1', '（如意）吊坠', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('350', '3', '水晶吊坠D1011', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('23', '1', '(如意）吊坠', '&lt;ul&gt;	&lt;li&gt;	&lt;/li&gt;&lt;/ul&gt;', '', '', '');
INSERT INTO `js_product_description` VALUES ('351', '3', '水晶吊坠D1009', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('352', '3', '水晶吊坠D1008', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('22', '1', '(如意）吊坠', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('353', '3', '水晶吊坠D1007', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('21', '1', '(如意）吊坠', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('354', '3', '水晶吊坠D1005', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('20', '1', '观音', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('355', '3', '水晶吊坠D1003', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('19', '1', '观音 吊坠', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('356', '3', '一叶发财A1028', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('18', '1', '观音  吊坠', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('357', '3', '一叶发财A1027', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('17', '1', '观音  吊坠', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('358', '3', '一叶发财A1026', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('16', '1', '水晶吊坠（1对）', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('359', '3', '一叶发财A1025', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('15', '1', '水晶吊坠（1对）', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('360', '3', '玉镯A0031', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('14', '1', '水晶吊坠（1对）', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('361', '3', '玉镯A0026', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('13', '1', 'A1061', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('362', '3', '玉镯A0023', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('12', '1', 'A1058', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('363', '3', '玉镯A0022', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('11', '1', 'A1062', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('364', '3', '玉镯A0021', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('10', '1', 'A1063', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('365', '3', '玉镯A0020', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('9', '1', 'A1059', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('366', '3', '玉镯A0019', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('8', '1', '富贵缠身', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('367', '3', '玉镯A0018', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('7', '1', '一夜封侯', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('368', '3', '玉镯A0016', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('6', '1', '龙龟把件', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('369', '3', '玉镯A0015', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('5', '1', '鼠来宝', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('370', '3', '玉镯A0013', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('4', '1', '如意貔貅', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('371', '3', '玉镯A0012', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('3', '1', '貔貅', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('372', '3', '玉镯A0011', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('2', '1', '红魁黄酒', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('373', '3', '玉镯A0010', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('1', '1', '轿车用高级机油3.3kg', '国际领先的自修复技术，降低摩擦系数50%，减少磨损80%。有害气体总排放量减少20-50%，延长发动机使用寿命1倍以上。', '', '', '');
INSERT INTO `js_product_description` VALUES ('374', '3', '玉镯A0009', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('375', '3', '玉镯A0007', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('376', '3', '玉镯A0006', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('377', '3', '玉镯A0005', '', '', '', '');
INSERT INTO `js_product_description` VALUES ('378', '3', '玉镯A0001', '', '', '', '');
INSERT INTO `js_product_related` VALUES ('40', '42');
INSERT INTO `js_product_related` VALUES ('41', '42');
INSERT INTO `js_product_related` VALUES ('42', '40');
INSERT INTO `js_product_related` VALUES ('42', '41');
INSERT INTO `js_product_to_category` VALUES ('1', '1');
INSERT INTO `js_product_to_category` VALUES ('2', '2');
INSERT INTO `js_product_to_category` VALUES ('3', '3');
INSERT INTO `js_product_to_category` VALUES ('4', '3');
INSERT INTO `js_product_to_category` VALUES ('5', '3');
INSERT INTO `js_product_to_category` VALUES ('6', '3');
INSERT INTO `js_product_to_category` VALUES ('7', '3');
INSERT INTO `js_product_to_category` VALUES ('8', '3');
INSERT INTO `js_product_to_category` VALUES ('9', '4');
INSERT INTO `js_product_to_category` VALUES ('10', '4');
INSERT INTO `js_product_to_category` VALUES ('11', '4');
INSERT INTO `js_product_to_category` VALUES ('12', '4');
INSERT INTO `js_product_to_category` VALUES ('13', '4');
INSERT INTO `js_product_to_category` VALUES ('14', '5');
INSERT INTO `js_product_to_category` VALUES ('15', '5');
INSERT INTO `js_product_to_category` VALUES ('16', '5');
INSERT INTO `js_product_to_category` VALUES ('17', '6');
INSERT INTO `js_product_to_category` VALUES ('18', '6');
INSERT INTO `js_product_to_category` VALUES ('19', '6');
INSERT INTO `js_product_to_category` VALUES ('20', '6');
INSERT INTO `js_product_to_category` VALUES ('21', '7');
INSERT INTO `js_product_to_category` VALUES ('22', '7');
INSERT INTO `js_product_to_category` VALUES ('23', '7');
INSERT INTO `js_product_to_category` VALUES ('24', '7');
INSERT INTO `js_product_to_category` VALUES ('25', '8');
INSERT INTO `js_product_to_category` VALUES ('25', '46');
INSERT INTO `js_product_to_category` VALUES ('26', '8');
INSERT INTO `js_product_to_category` VALUES ('26', '46');
INSERT INTO `js_product_to_category` VALUES ('27', '9');
INSERT INTO `js_product_to_category` VALUES ('27', '46');
INSERT INTO `js_product_to_category` VALUES ('28', '9');
INSERT INTO `js_product_to_category` VALUES ('28', '46');
INSERT INTO `js_product_to_category` VALUES ('29', '10');
INSERT INTO `js_product_to_category` VALUES ('30', '10');
INSERT INTO `js_product_to_category` VALUES ('31', '10');
INSERT INTO `js_product_to_category` VALUES ('32', '11');
INSERT INTO `js_product_to_category` VALUES ('33', '11');
INSERT INTO `js_product_to_category` VALUES ('34', '11');
INSERT INTO `js_product_to_category` VALUES ('35', '11');
INSERT INTO `js_product_to_category` VALUES ('36', '11');
INSERT INTO `js_product_to_category` VALUES ('37', '11');
INSERT INTO `js_product_to_category` VALUES ('38', '5');
INSERT INTO `js_product_to_category` VALUES ('39', '5');
INSERT INTO `js_product_to_category` VALUES ('40', '5');
INSERT INTO `js_product_to_category` VALUES ('41', '12');
INSERT INTO `js_product_to_category` VALUES ('42', '12');
INSERT INTO `js_product_to_category` VALUES ('43', '13');
INSERT INTO `js_product_to_category` VALUES ('44', '13');
INSERT INTO `js_product_to_category` VALUES ('45', '14');
INSERT INTO `js_product_to_category` VALUES ('45', '43');
INSERT INTO `js_product_to_category` VALUES ('46', '14');
INSERT INTO `js_product_to_category` VALUES ('46', '43');
INSERT INTO `js_product_to_category` VALUES ('47', '14');
INSERT INTO `js_product_to_category` VALUES ('47', '43');
INSERT INTO `js_product_to_category` VALUES ('48', '14');
INSERT INTO `js_product_to_category` VALUES ('48', '43');
INSERT INTO `js_product_to_category` VALUES ('49', '14');
INSERT INTO `js_product_to_category` VALUES ('49', '43');
INSERT INTO `js_product_to_category` VALUES ('50', '14');
INSERT INTO `js_product_to_category` VALUES ('50', '43');
INSERT INTO `js_product_to_category` VALUES ('51', '14');
INSERT INTO `js_product_to_category` VALUES ('51', '43');
INSERT INTO `js_product_to_category` VALUES ('52', '14');
INSERT INTO `js_product_to_category` VALUES ('52', '43');
INSERT INTO `js_product_to_category` VALUES ('53', '14');
INSERT INTO `js_product_to_category` VALUES ('53', '43');
INSERT INTO `js_product_to_category` VALUES ('54', '14');
INSERT INTO `js_product_to_category` VALUES ('54', '43');
INSERT INTO `js_product_to_category` VALUES ('55', '15');
INSERT INTO `js_product_to_category` VALUES ('56', '16');
INSERT INTO `js_product_to_category` VALUES ('56', '43');
INSERT INTO `js_product_to_category` VALUES ('57', '16');
INSERT INTO `js_product_to_category` VALUES ('57', '43');
INSERT INTO `js_product_to_category` VALUES ('58', '16');
INSERT INTO `js_product_to_category` VALUES ('58', '43');
INSERT INTO `js_product_to_category` VALUES ('59', '16');
INSERT INTO `js_product_to_category` VALUES ('59', '43');
INSERT INTO `js_product_to_category` VALUES ('60', '16');
INSERT INTO `js_product_to_category` VALUES ('60', '43');
INSERT INTO `js_product_to_category` VALUES ('61', '16');
INSERT INTO `js_product_to_category` VALUES ('61', '43');
INSERT INTO `js_product_to_category` VALUES ('62', '16');
INSERT INTO `js_product_to_category` VALUES ('62', '43');
INSERT INTO `js_product_to_category` VALUES ('63', '16');
INSERT INTO `js_product_to_category` VALUES ('63', '43');
INSERT INTO `js_product_to_category` VALUES ('64', '16');
INSERT INTO `js_product_to_category` VALUES ('64', '43');
INSERT INTO `js_product_to_category` VALUES ('65', '16');
INSERT INTO `js_product_to_category` VALUES ('65', '43');
INSERT INTO `js_product_to_category` VALUES ('66', '16');
INSERT INTO `js_product_to_category` VALUES ('66', '43');
INSERT INTO `js_product_to_category` VALUES ('67', '16');
INSERT INTO `js_product_to_category` VALUES ('67', '43');
INSERT INTO `js_product_to_category` VALUES ('68', '16');
INSERT INTO `js_product_to_category` VALUES ('68', '43');
INSERT INTO `js_product_to_category` VALUES ('69', '16');
INSERT INTO `js_product_to_category` VALUES ('69', '43');
INSERT INTO `js_product_to_category` VALUES ('70', '16');
INSERT INTO `js_product_to_category` VALUES ('70', '43');
INSERT INTO `js_product_to_category` VALUES ('71', '16');
INSERT INTO `js_product_to_category` VALUES ('71', '43');
INSERT INTO `js_product_to_category` VALUES ('72', '16');
INSERT INTO `js_product_to_category` VALUES ('72', '43');
INSERT INTO `js_product_to_category` VALUES ('73', '13');
INSERT INTO `js_product_to_category` VALUES ('74', '13');
INSERT INTO `js_product_to_category` VALUES ('75', '13');
INSERT INTO `js_product_to_category` VALUES ('76', '13');
INSERT INTO `js_product_to_category` VALUES ('77', '17');
INSERT INTO `js_product_to_category` VALUES ('77', '43');
INSERT INTO `js_product_to_category` VALUES ('78', '18');
INSERT INTO `js_product_to_category` VALUES ('79', '18');
INSERT INTO `js_product_to_category` VALUES ('80', '18');
INSERT INTO `js_product_to_category` VALUES ('81', '18');
INSERT INTO `js_product_to_category` VALUES ('82', '18');
INSERT INTO `js_product_to_category` VALUES ('83', '18');
INSERT INTO `js_product_to_category` VALUES ('84', '18');
INSERT INTO `js_product_to_category` VALUES ('85', '18');
INSERT INTO `js_product_to_category` VALUES ('86', '18');
INSERT INTO `js_product_to_category` VALUES ('87', '18');
INSERT INTO `js_product_to_category` VALUES ('88', '12');
INSERT INTO `js_product_to_category` VALUES ('89', '12');
INSERT INTO `js_product_to_category` VALUES ('90', '13');
INSERT INTO `js_product_to_category` VALUES ('91', '13');
INSERT INTO `js_product_to_category` VALUES ('92', '13');
INSERT INTO `js_product_to_category` VALUES ('93', '13');
INSERT INTO `js_product_to_category` VALUES ('94', '13');
INSERT INTO `js_product_to_category` VALUES ('95', '13');
INSERT INTO `js_product_to_category` VALUES ('96', '13');
INSERT INTO `js_product_to_category` VALUES ('97', '19');
INSERT INTO `js_product_to_category` VALUES ('97', '43');
INSERT INTO `js_product_to_category` VALUES ('97', '44');
INSERT INTO `js_product_to_category` VALUES ('98', '19');
INSERT INTO `js_product_to_category` VALUES ('98', '43');
INSERT INTO `js_product_to_category` VALUES ('98', '44');
INSERT INTO `js_product_to_category` VALUES ('99', '19');
INSERT INTO `js_product_to_category` VALUES ('99', '43');
INSERT INTO `js_product_to_category` VALUES ('99', '44');
INSERT INTO `js_product_to_category` VALUES ('100', '19');
INSERT INTO `js_product_to_category` VALUES ('100', '43');
INSERT INTO `js_product_to_category` VALUES ('100', '44');
INSERT INTO `js_product_to_category` VALUES ('101', '19');
INSERT INTO `js_product_to_category` VALUES ('101', '43');
INSERT INTO `js_product_to_category` VALUES ('101', '44');
INSERT INTO `js_product_to_category` VALUES ('102', '19');
INSERT INTO `js_product_to_category` VALUES ('102', '43');
INSERT INTO `js_product_to_category` VALUES ('102', '44');
INSERT INTO `js_product_to_category` VALUES ('103', '19');
INSERT INTO `js_product_to_category` VALUES ('103', '43');
INSERT INTO `js_product_to_category` VALUES ('103', '44');
INSERT INTO `js_product_to_category` VALUES ('104', '19');
INSERT INTO `js_product_to_category` VALUES ('104', '43');
INSERT INTO `js_product_to_category` VALUES ('104', '44');
INSERT INTO `js_product_to_category` VALUES ('105', '19');
INSERT INTO `js_product_to_category` VALUES ('105', '43');
INSERT INTO `js_product_to_category` VALUES ('105', '44');
INSERT INTO `js_product_to_category` VALUES ('106', '19');
INSERT INTO `js_product_to_category` VALUES ('106', '43');
INSERT INTO `js_product_to_category` VALUES ('106', '44');
INSERT INTO `js_product_to_category` VALUES ('107', '19');
INSERT INTO `js_product_to_category` VALUES ('107', '43');
INSERT INTO `js_product_to_category` VALUES ('107', '44');
INSERT INTO `js_product_to_category` VALUES ('108', '19');
INSERT INTO `js_product_to_category` VALUES ('108', '43');
INSERT INTO `js_product_to_category` VALUES ('108', '44');
INSERT INTO `js_product_to_category` VALUES ('109', '19');
INSERT INTO `js_product_to_category` VALUES ('109', '43');
INSERT INTO `js_product_to_category` VALUES ('109', '44');
INSERT INTO `js_product_to_category` VALUES ('110', '19');
INSERT INTO `js_product_to_category` VALUES ('110', '43');
INSERT INTO `js_product_to_category` VALUES ('110', '44');
INSERT INTO `js_product_to_category` VALUES ('111', '20');
INSERT INTO `js_product_to_category` VALUES ('111', '43');
INSERT INTO `js_product_to_category` VALUES ('111', '44');
INSERT INTO `js_product_to_category` VALUES ('112', '20');
INSERT INTO `js_product_to_category` VALUES ('112', '43');
INSERT INTO `js_product_to_category` VALUES ('112', '44');
INSERT INTO `js_product_to_category` VALUES ('113', '20');
INSERT INTO `js_product_to_category` VALUES ('113', '43');
INSERT INTO `js_product_to_category` VALUES ('113', '44');
INSERT INTO `js_product_to_category` VALUES ('114', '20');
INSERT INTO `js_product_to_category` VALUES ('114', '43');
INSERT INTO `js_product_to_category` VALUES ('114', '44');
INSERT INTO `js_product_to_category` VALUES ('115', '20');
INSERT INTO `js_product_to_category` VALUES ('115', '43');
INSERT INTO `js_product_to_category` VALUES ('115', '44');
INSERT INTO `js_product_to_category` VALUES ('116', '20');
INSERT INTO `js_product_to_category` VALUES ('116', '43');
INSERT INTO `js_product_to_category` VALUES ('116', '44');
INSERT INTO `js_product_to_category` VALUES ('117', '20');
INSERT INTO `js_product_to_category` VALUES ('117', '43');
INSERT INTO `js_product_to_category` VALUES ('117', '44');
INSERT INTO `js_product_to_category` VALUES ('118', '20');
INSERT INTO `js_product_to_category` VALUES ('118', '43');
INSERT INTO `js_product_to_category` VALUES ('118', '44');
INSERT INTO `js_product_to_category` VALUES ('119', '20');
INSERT INTO `js_product_to_category` VALUES ('119', '43');
INSERT INTO `js_product_to_category` VALUES ('119', '44');
INSERT INTO `js_product_to_category` VALUES ('120', '21');
INSERT INTO `js_product_to_category` VALUES ('120', '43');
INSERT INTO `js_product_to_category` VALUES ('120', '44');
INSERT INTO `js_product_to_category` VALUES ('121', '21');
INSERT INTO `js_product_to_category` VALUES ('121', '43');
INSERT INTO `js_product_to_category` VALUES ('121', '44');
INSERT INTO `js_product_to_category` VALUES ('122', '21');
INSERT INTO `js_product_to_category` VALUES ('122', '43');
INSERT INTO `js_product_to_category` VALUES ('122', '44');
INSERT INTO `js_product_to_category` VALUES ('123', '21');
INSERT INTO `js_product_to_category` VALUES ('123', '43');
INSERT INTO `js_product_to_category` VALUES ('123', '44');
INSERT INTO `js_product_to_category` VALUES ('124', '21');
INSERT INTO `js_product_to_category` VALUES ('124', '43');
INSERT INTO `js_product_to_category` VALUES ('124', '44');
INSERT INTO `js_product_to_category` VALUES ('125', '21');
INSERT INTO `js_product_to_category` VALUES ('125', '43');
INSERT INTO `js_product_to_category` VALUES ('125', '44');
INSERT INTO `js_product_to_category` VALUES ('126', '21');
INSERT INTO `js_product_to_category` VALUES ('126', '43');
INSERT INTO `js_product_to_category` VALUES ('126', '44');
INSERT INTO `js_product_to_category` VALUES ('127', '21');
INSERT INTO `js_product_to_category` VALUES ('127', '43');
INSERT INTO `js_product_to_category` VALUES ('127', '44');
INSERT INTO `js_product_to_category` VALUES ('128', '15');
INSERT INTO `js_product_to_category` VALUES ('129', '15');
INSERT INTO `js_product_to_category` VALUES ('130', '15');
INSERT INTO `js_product_to_category` VALUES ('131', '15');
INSERT INTO `js_product_to_category` VALUES ('132', '15');
INSERT INTO `js_product_to_category` VALUES ('133', '15');
INSERT INTO `js_product_to_category` VALUES ('134', '15');
INSERT INTO `js_product_to_category` VALUES ('135', '15');
INSERT INTO `js_product_to_category` VALUES ('136', '22');
INSERT INTO `js_product_to_category` VALUES ('136', '46');
INSERT INTO `js_product_to_category` VALUES ('137', '22');
INSERT INTO `js_product_to_category` VALUES ('137', '46');
INSERT INTO `js_product_to_category` VALUES ('138', '22');
INSERT INTO `js_product_to_category` VALUES ('138', '46');
INSERT INTO `js_product_to_category` VALUES ('139', '22');
INSERT INTO `js_product_to_category` VALUES ('139', '46');
INSERT INTO `js_product_to_category` VALUES ('140', '22');
INSERT INTO `js_product_to_category` VALUES ('140', '46');
INSERT INTO `js_product_to_category` VALUES ('141', '22');
INSERT INTO `js_product_to_category` VALUES ('141', '46');
INSERT INTO `js_product_to_category` VALUES ('142', '13');
INSERT INTO `js_product_to_category` VALUES ('144', '24');
INSERT INTO `js_product_to_category` VALUES ('144', '47');
INSERT INTO `js_product_to_category` VALUES ('146', '24');
INSERT INTO `js_product_to_category` VALUES ('146', '47');
INSERT INTO `js_product_to_category` VALUES ('147', '24');
INSERT INTO `js_product_to_category` VALUES ('147', '47');
INSERT INTO `js_product_to_category` VALUES ('148', '24');
INSERT INTO `js_product_to_category` VALUES ('148', '47');
INSERT INTO `js_product_to_category` VALUES ('149', '24');
INSERT INTO `js_product_to_category` VALUES ('149', '47');
INSERT INTO `js_product_to_category` VALUES ('150', '14');
INSERT INTO `js_product_to_category` VALUES ('151', '14');
INSERT INTO `js_product_to_category` VALUES ('152', '14');
INSERT INTO `js_product_to_category` VALUES ('153', '14');
INSERT INTO `js_product_to_category` VALUES ('154', '14');
INSERT INTO `js_product_to_category` VALUES ('155', '14');
INSERT INTO `js_product_to_category` VALUES ('156', '14');
INSERT INTO `js_product_to_category` VALUES ('157', '14');
INSERT INTO `js_product_to_category` VALUES ('158', '14');
INSERT INTO `js_product_to_category` VALUES ('159', '14');
INSERT INTO `js_product_to_category` VALUES ('160', '14');
INSERT INTO `js_product_to_category` VALUES ('161', '14');
INSERT INTO `js_product_to_category` VALUES ('162', '14');
INSERT INTO `js_product_to_category` VALUES ('163', '14');
INSERT INTO `js_product_to_category` VALUES ('164', '14');
INSERT INTO `js_product_to_category` VALUES ('165', '14');
INSERT INTO `js_product_to_category` VALUES ('166', '25');
INSERT INTO `js_product_to_category` VALUES ('166', '46');
INSERT INTO `js_product_to_category` VALUES ('167', '25');
INSERT INTO `js_product_to_category` VALUES ('167', '46');
INSERT INTO `js_product_to_category` VALUES ('168', '26');
INSERT INTO `js_product_to_category` VALUES ('168', '47');
INSERT INTO `js_product_to_category` VALUES ('169', '26');
INSERT INTO `js_product_to_category` VALUES ('169', '47');
INSERT INTO `js_product_to_category` VALUES ('170', '26');
INSERT INTO `js_product_to_category` VALUES ('170', '47');
INSERT INTO `js_product_to_category` VALUES ('171', '26');
INSERT INTO `js_product_to_category` VALUES ('171', '47');
INSERT INTO `js_product_to_category` VALUES ('172', '26');
INSERT INTO `js_product_to_category` VALUES ('172', '47');
INSERT INTO `js_product_to_category` VALUES ('173', '26');
INSERT INTO `js_product_to_category` VALUES ('173', '47');
INSERT INTO `js_product_to_category` VALUES ('174', '26');
INSERT INTO `js_product_to_category` VALUES ('174', '47');
INSERT INTO `js_product_to_category` VALUES ('175', '18');
INSERT INTO `js_product_to_category` VALUES ('176', '18');
INSERT INTO `js_product_to_category` VALUES ('177', '18');
INSERT INTO `js_product_to_category` VALUES ('178', '18');
INSERT INTO `js_product_to_category` VALUES ('179', '18');
INSERT INTO `js_product_to_category` VALUES ('180', '18');
INSERT INTO `js_product_to_category` VALUES ('181', '18');
INSERT INTO `js_product_to_category` VALUES ('182', '18');
INSERT INTO `js_product_to_category` VALUES ('183', '18');
INSERT INTO `js_product_to_category` VALUES ('184', '18');
INSERT INTO `js_product_to_category` VALUES ('185', '18');
INSERT INTO `js_product_to_category` VALUES ('186', '18');
INSERT INTO `js_product_to_category` VALUES ('187', '18');
INSERT INTO `js_product_to_category` VALUES ('188', '18');
INSERT INTO `js_product_to_category` VALUES ('189', '27');
INSERT INTO `js_product_to_category` VALUES ('189', '47');
INSERT INTO `js_product_to_category` VALUES ('190', '27');
INSERT INTO `js_product_to_category` VALUES ('190', '47');
INSERT INTO `js_product_to_category` VALUES ('191', '17');
INSERT INTO `js_product_to_category` VALUES ('191', '43');
INSERT INTO `js_product_to_category` VALUES ('192', '17');
INSERT INTO `js_product_to_category` VALUES ('192', '43');
INSERT INTO `js_product_to_category` VALUES ('193', '17');
INSERT INTO `js_product_to_category` VALUES ('193', '43');
INSERT INTO `js_product_to_category` VALUES ('194', '17');
INSERT INTO `js_product_to_category` VALUES ('194', '43');
INSERT INTO `js_product_to_category` VALUES ('195', '17');
INSERT INTO `js_product_to_category` VALUES ('195', '43');
INSERT INTO `js_product_to_category` VALUES ('196', '17');
INSERT INTO `js_product_to_category` VALUES ('196', '43');
INSERT INTO `js_product_to_category` VALUES ('197', '17');
INSERT INTO `js_product_to_category` VALUES ('197', '43');
INSERT INTO `js_product_to_category` VALUES ('198', '17');
INSERT INTO `js_product_to_category` VALUES ('198', '43');
INSERT INTO `js_product_to_category` VALUES ('199', '17');
INSERT INTO `js_product_to_category` VALUES ('199', '43');
INSERT INTO `js_product_to_category` VALUES ('200', '17');
INSERT INTO `js_product_to_category` VALUES ('200', '43');
INSERT INTO `js_product_to_category` VALUES ('201', '17');
INSERT INTO `js_product_to_category` VALUES ('201', '43');
INSERT INTO `js_product_to_category` VALUES ('202', '17');
INSERT INTO `js_product_to_category` VALUES ('202', '43');
INSERT INTO `js_product_to_category` VALUES ('203', '17');
INSERT INTO `js_product_to_category` VALUES ('203', '43');
INSERT INTO `js_product_to_category` VALUES ('204', '28');
INSERT INTO `js_product_to_category` VALUES ('204', '46');
INSERT INTO `js_product_to_category` VALUES ('205', '28');
INSERT INTO `js_product_to_category` VALUES ('205', '46');
INSERT INTO `js_product_to_category` VALUES ('206', '28');
INSERT INTO `js_product_to_category` VALUES ('206', '46');
INSERT INTO `js_product_to_category` VALUES ('207', '28');
INSERT INTO `js_product_to_category` VALUES ('207', '46');
INSERT INTO `js_product_to_category` VALUES ('208', '28');
INSERT INTO `js_product_to_category` VALUES ('208', '46');
INSERT INTO `js_product_to_category` VALUES ('209', '28');
INSERT INTO `js_product_to_category` VALUES ('209', '46');
INSERT INTO `js_product_to_category` VALUES ('210', '28');
INSERT INTO `js_product_to_category` VALUES ('210', '46');
INSERT INTO `js_product_to_category` VALUES ('211', '28');
INSERT INTO `js_product_to_category` VALUES ('211', '46');
INSERT INTO `js_product_to_category` VALUES ('212', '28');
INSERT INTO `js_product_to_category` VALUES ('212', '46');
INSERT INTO `js_product_to_category` VALUES ('213', '28');
INSERT INTO `js_product_to_category` VALUES ('213', '46');
INSERT INTO `js_product_to_category` VALUES ('214', '28');
INSERT INTO `js_product_to_category` VALUES ('214', '46');
INSERT INTO `js_product_to_category` VALUES ('215', '28');
INSERT INTO `js_product_to_category` VALUES ('215', '46');
INSERT INTO `js_product_to_category` VALUES ('216', '29');
INSERT INTO `js_product_to_category` VALUES ('216', '45');
INSERT INTO `js_product_to_category` VALUES ('217', '29');
INSERT INTO `js_product_to_category` VALUES ('217', '45');
INSERT INTO `js_product_to_category` VALUES ('218', '29');
INSERT INTO `js_product_to_category` VALUES ('218', '45');
INSERT INTO `js_product_to_category` VALUES ('219', '29');
INSERT INTO `js_product_to_category` VALUES ('219', '45');
INSERT INTO `js_product_to_category` VALUES ('220', '29');
INSERT INTO `js_product_to_category` VALUES ('220', '45');
INSERT INTO `js_product_to_category` VALUES ('221', '29');
INSERT INTO `js_product_to_category` VALUES ('221', '45');
INSERT INTO `js_product_to_category` VALUES ('222', '30');
INSERT INTO `js_product_to_category` VALUES ('222', '45');
INSERT INTO `js_product_to_category` VALUES ('223', '30');
INSERT INTO `js_product_to_category` VALUES ('223', '45');
INSERT INTO `js_product_to_category` VALUES ('224', '30');
INSERT INTO `js_product_to_category` VALUES ('224', '45');
INSERT INTO `js_product_to_category` VALUES ('225', '30');
INSERT INTO `js_product_to_category` VALUES ('225', '45');
INSERT INTO `js_product_to_category` VALUES ('226', '30');
INSERT INTO `js_product_to_category` VALUES ('226', '45');
INSERT INTO `js_product_to_category` VALUES ('227', '2');
INSERT INTO `js_product_to_category` VALUES ('228', '2');
INSERT INTO `js_product_to_category` VALUES ('229', '2');
INSERT INTO `js_product_to_category` VALUES ('230', '2');
INSERT INTO `js_product_to_category` VALUES ('231', '2');
INSERT INTO `js_product_to_category` VALUES ('232', '31');
INSERT INTO `js_product_to_category` VALUES ('233', '31');
INSERT INTO `js_product_to_category` VALUES ('234', '31');
INSERT INTO `js_product_to_category` VALUES ('235', '31');
INSERT INTO `js_product_to_category` VALUES ('236', '31');
INSERT INTO `js_product_to_category` VALUES ('237', '31');
INSERT INTO `js_product_to_category` VALUES ('238', '31');
INSERT INTO `js_product_to_category` VALUES ('239', '31');
INSERT INTO `js_product_to_category` VALUES ('240', '31');
INSERT INTO `js_product_to_category` VALUES ('241', '15');
INSERT INTO `js_product_to_category` VALUES ('242', '15');
INSERT INTO `js_product_to_category` VALUES ('243', '15');
INSERT INTO `js_product_to_category` VALUES ('244', '15');
INSERT INTO `js_product_to_category` VALUES ('245', '15');
INSERT INTO `js_product_to_category` VALUES ('246', '15');
INSERT INTO `js_product_to_category` VALUES ('247', '15');
INSERT INTO `js_product_to_category` VALUES ('248', '15');
INSERT INTO `js_product_to_category` VALUES ('249', '15');
INSERT INTO `js_product_to_category` VALUES ('250', '15');
INSERT INTO `js_product_to_category` VALUES ('251', '15');
INSERT INTO `js_product_to_category` VALUES ('252', '15');
INSERT INTO `js_product_to_category` VALUES ('253', '32');
INSERT INTO `js_product_to_category` VALUES ('253', '46');
INSERT INTO `js_product_to_category` VALUES ('254', '32');
INSERT INTO `js_product_to_category` VALUES ('254', '46');
INSERT INTO `js_product_to_category` VALUES ('255', '32');
INSERT INTO `js_product_to_category` VALUES ('255', '46');
INSERT INTO `js_product_to_category` VALUES ('256', '32');
INSERT INTO `js_product_to_category` VALUES ('256', '46');
INSERT INTO `js_product_to_category` VALUES ('257', '32');
INSERT INTO `js_product_to_category` VALUES ('257', '46');
INSERT INTO `js_product_to_category` VALUES ('258', '32');
INSERT INTO `js_product_to_category` VALUES ('258', '46');
INSERT INTO `js_product_to_category` VALUES ('259', '32');
INSERT INTO `js_product_to_category` VALUES ('259', '46');
INSERT INTO `js_product_to_category` VALUES ('260', '32');
INSERT INTO `js_product_to_category` VALUES ('260', '46');
INSERT INTO `js_product_to_category` VALUES ('261', '32');
INSERT INTO `js_product_to_category` VALUES ('261', '46');
INSERT INTO `js_product_to_category` VALUES ('262', '32');
INSERT INTO `js_product_to_category` VALUES ('262', '46');
INSERT INTO `js_product_to_category` VALUES ('263', '32');
INSERT INTO `js_product_to_category` VALUES ('263', '46');
INSERT INTO `js_product_to_category` VALUES ('264', '33');
INSERT INTO `js_product_to_category` VALUES ('264', '42');
INSERT INTO `js_product_to_category` VALUES ('265', '33');
INSERT INTO `js_product_to_category` VALUES ('265', '42');
INSERT INTO `js_product_to_category` VALUES ('266', '33');
INSERT INTO `js_product_to_category` VALUES ('266', '42');
INSERT INTO `js_product_to_category` VALUES ('267', '33');
INSERT INTO `js_product_to_category` VALUES ('267', '42');
INSERT INTO `js_product_to_category` VALUES ('268', '33');
INSERT INTO `js_product_to_category` VALUES ('268', '42');
INSERT INTO `js_product_to_category` VALUES ('269', '33');
INSERT INTO `js_product_to_category` VALUES ('269', '42');
INSERT INTO `js_product_to_category` VALUES ('270', '33');
INSERT INTO `js_product_to_category` VALUES ('270', '42');
INSERT INTO `js_product_to_category` VALUES ('271', '33');
INSERT INTO `js_product_to_category` VALUES ('271', '42');
INSERT INTO `js_product_to_category` VALUES ('272', '33');
INSERT INTO `js_product_to_category` VALUES ('272', '42');
INSERT INTO `js_product_to_category` VALUES ('273', '33');
INSERT INTO `js_product_to_category` VALUES ('273', '42');
INSERT INTO `js_product_to_category` VALUES ('274', '33');
INSERT INTO `js_product_to_category` VALUES ('274', '42');
INSERT INTO `js_product_to_category` VALUES ('275', '33');
INSERT INTO `js_product_to_category` VALUES ('275', '42');
INSERT INTO `js_product_to_category` VALUES ('276', '33');
INSERT INTO `js_product_to_category` VALUES ('276', '42');
INSERT INTO `js_product_to_category` VALUES ('277', '33');
INSERT INTO `js_product_to_category` VALUES ('277', '42');
INSERT INTO `js_product_to_category` VALUES ('278', '33');
INSERT INTO `js_product_to_category` VALUES ('278', '42');
INSERT INTO `js_product_to_category` VALUES ('279', '33');
INSERT INTO `js_product_to_category` VALUES ('279', '42');
INSERT INTO `js_product_to_category` VALUES ('280', '33');
INSERT INTO `js_product_to_category` VALUES ('280', '42');
INSERT INTO `js_product_to_category` VALUES ('281', '33');
INSERT INTO `js_product_to_category` VALUES ('281', '42');
INSERT INTO `js_product_to_category` VALUES ('282', '33');
INSERT INTO `js_product_to_category` VALUES ('282', '42');
INSERT INTO `js_product_to_category` VALUES ('283', '33');
INSERT INTO `js_product_to_category` VALUES ('283', '42');
INSERT INTO `js_product_to_category` VALUES ('284', '33');
INSERT INTO `js_product_to_category` VALUES ('284', '42');
INSERT INTO `js_product_to_category` VALUES ('285', '33');
INSERT INTO `js_product_to_category` VALUES ('285', '42');
INSERT INTO `js_product_to_category` VALUES ('286', '33');
INSERT INTO `js_product_to_category` VALUES ('286', '42');
INSERT INTO `js_product_to_category` VALUES ('287', '33');
INSERT INTO `js_product_to_category` VALUES ('287', '42');
INSERT INTO `js_product_to_category` VALUES ('288', '33');
INSERT INTO `js_product_to_category` VALUES ('288', '42');
INSERT INTO `js_product_to_category` VALUES ('289', '33');
INSERT INTO `js_product_to_category` VALUES ('289', '42');
INSERT INTO `js_product_to_category` VALUES ('290', '33');
INSERT INTO `js_product_to_category` VALUES ('290', '42');
INSERT INTO `js_product_to_category` VALUES ('291', '33');
INSERT INTO `js_product_to_category` VALUES ('291', '42');
INSERT INTO `js_product_to_category` VALUES ('292', '33');
INSERT INTO `js_product_to_category` VALUES ('292', '42');
INSERT INTO `js_product_to_category` VALUES ('293', '33');
INSERT INTO `js_product_to_category` VALUES ('293', '42');
INSERT INTO `js_product_to_category` VALUES ('294', '33');
INSERT INTO `js_product_to_category` VALUES ('294', '42');
INSERT INTO `js_product_to_category` VALUES ('295', '33');
INSERT INTO `js_product_to_category` VALUES ('295', '42');
INSERT INTO `js_product_to_category` VALUES ('296', '33');
INSERT INTO `js_product_to_category` VALUES ('296', '42');
INSERT INTO `js_product_to_category` VALUES ('297', '33');
INSERT INTO `js_product_to_category` VALUES ('297', '42');
INSERT INTO `js_product_to_category` VALUES ('298', '33');
INSERT INTO `js_product_to_category` VALUES ('298', '42');
INSERT INTO `js_product_to_category` VALUES ('299', '33');
INSERT INTO `js_product_to_category` VALUES ('299', '42');
INSERT INTO `js_product_to_category` VALUES ('300', '33');
INSERT INTO `js_product_to_category` VALUES ('301', '12');
INSERT INTO `js_product_to_category` VALUES ('301', '42');
INSERT INTO `js_product_to_category` VALUES ('302', '12');
INSERT INTO `js_product_to_category` VALUES ('302', '42');
INSERT INTO `js_product_to_category` VALUES ('303', '12');
INSERT INTO `js_product_to_category` VALUES ('303', '42');
INSERT INTO `js_product_to_category` VALUES ('304', '12');
INSERT INTO `js_product_to_category` VALUES ('304', '42');
INSERT INTO `js_product_to_category` VALUES ('305', '12');
INSERT INTO `js_product_to_category` VALUES ('305', '42');
INSERT INTO `js_product_to_category` VALUES ('306', '12');
INSERT INTO `js_product_to_category` VALUES ('306', '42');
INSERT INTO `js_product_to_category` VALUES ('307', '12');
INSERT INTO `js_product_to_category` VALUES ('307', '42');
INSERT INTO `js_product_to_category` VALUES ('308', '12');
INSERT INTO `js_product_to_category` VALUES ('308', '42');
INSERT INTO `js_product_to_category` VALUES ('309', '4');
INSERT INTO `js_product_to_category` VALUES ('309', '39');
INSERT INTO `js_product_to_category` VALUES ('310', '4');
INSERT INTO `js_product_to_category` VALUES ('310', '39');
INSERT INTO `js_product_to_category` VALUES ('311', '4');
INSERT INTO `js_product_to_category` VALUES ('311', '39');
INSERT INTO `js_product_to_category` VALUES ('312', '4');
INSERT INTO `js_product_to_category` VALUES ('312', '39');
INSERT INTO `js_product_to_category` VALUES ('313', '4');
INSERT INTO `js_product_to_category` VALUES ('313', '39');
INSERT INTO `js_product_to_category` VALUES ('314', '4');
INSERT INTO `js_product_to_category` VALUES ('314', '39');
INSERT INTO `js_product_to_category` VALUES ('315', '4');
INSERT INTO `js_product_to_category` VALUES ('315', '39');
INSERT INTO `js_product_to_category` VALUES ('316', '4');
INSERT INTO `js_product_to_category` VALUES ('316', '39');
INSERT INTO `js_product_to_category` VALUES ('317', '4');
INSERT INTO `js_product_to_category` VALUES ('317', '39');
INSERT INTO `js_product_to_category` VALUES ('318', '4');
INSERT INTO `js_product_to_category` VALUES ('318', '39');
INSERT INTO `js_product_to_category` VALUES ('319', '4');
INSERT INTO `js_product_to_category` VALUES ('319', '39');
INSERT INTO `js_product_to_category` VALUES ('320', '4');
INSERT INTO `js_product_to_category` VALUES ('320', '39');
INSERT INTO `js_product_to_category` VALUES ('321', '4');
INSERT INTO `js_product_to_category` VALUES ('321', '39');
INSERT INTO `js_product_to_category` VALUES ('322', '4');
INSERT INTO `js_product_to_category` VALUES ('322', '39');
INSERT INTO `js_product_to_category` VALUES ('323', '4');
INSERT INTO `js_product_to_category` VALUES ('323', '39');
INSERT INTO `js_product_to_category` VALUES ('324', '4');
INSERT INTO `js_product_to_category` VALUES ('324', '39');
INSERT INTO `js_product_to_category` VALUES ('325', '34');
INSERT INTO `js_product_to_category` VALUES ('325', '39');
INSERT INTO `js_product_to_category` VALUES ('326', '35');
INSERT INTO `js_product_to_category` VALUES ('326', '39');
INSERT INTO `js_product_to_category` VALUES ('327', '7');
INSERT INTO `js_product_to_category` VALUES ('327', '39');
INSERT INTO `js_product_to_category` VALUES ('328', '7');
INSERT INTO `js_product_to_category` VALUES ('328', '39');
INSERT INTO `js_product_to_category` VALUES ('329', '7');
INSERT INTO `js_product_to_category` VALUES ('329', '39');
INSERT INTO `js_product_to_category` VALUES ('330', '36');
INSERT INTO `js_product_to_category` VALUES ('330', '39');
INSERT INTO `js_product_to_category` VALUES ('331', '36');
INSERT INTO `js_product_to_category` VALUES ('331', '39');
INSERT INTO `js_product_to_category` VALUES ('332', '36');
INSERT INTO `js_product_to_category` VALUES ('332', '39');
INSERT INTO `js_product_to_category` VALUES ('333', '36');
INSERT INTO `js_product_to_category` VALUES ('333', '39');
INSERT INTO `js_product_to_category` VALUES ('334', '36');
INSERT INTO `js_product_to_category` VALUES ('334', '39');
INSERT INTO `js_product_to_category` VALUES ('335', '36');
INSERT INTO `js_product_to_category` VALUES ('335', '39');
INSERT INTO `js_product_to_category` VALUES ('336', '3');
INSERT INTO `js_product_to_category` VALUES ('336', '39');
INSERT INTO `js_product_to_category` VALUES ('337', '3');
INSERT INTO `js_product_to_category` VALUES ('337', '39');
INSERT INTO `js_product_to_category` VALUES ('338', '3');
INSERT INTO `js_product_to_category` VALUES ('338', '39');
INSERT INTO `js_product_to_category` VALUES ('339', '3');
INSERT INTO `js_product_to_category` VALUES ('339', '39');
INSERT INTO `js_product_to_category` VALUES ('340', '3');
INSERT INTO `js_product_to_category` VALUES ('340', '39');
INSERT INTO `js_product_to_category` VALUES ('341', '37');
INSERT INTO `js_product_to_category` VALUES ('341', '39');
INSERT INTO `js_product_to_category` VALUES ('342', '37');
INSERT INTO `js_product_to_category` VALUES ('342', '39');
INSERT INTO `js_product_to_category` VALUES ('343', '37');
INSERT INTO `js_product_to_category` VALUES ('343', '39');
INSERT INTO `js_product_to_category` VALUES ('344', '5');
INSERT INTO `js_product_to_category` VALUES ('344', '39');
INSERT INTO `js_product_to_category` VALUES ('345', '5');
INSERT INTO `js_product_to_category` VALUES ('345', '39');
INSERT INTO `js_product_to_category` VALUES ('346', '5');
INSERT INTO `js_product_to_category` VALUES ('346', '39');
INSERT INTO `js_product_to_category` VALUES ('347', '5');
INSERT INTO `js_product_to_category` VALUES ('347', '39');
INSERT INTO `js_product_to_category` VALUES ('348', '5');
INSERT INTO `js_product_to_category` VALUES ('348', '39');
INSERT INTO `js_product_to_category` VALUES ('349', '5');
INSERT INTO `js_product_to_category` VALUES ('349', '39');
INSERT INTO `js_product_to_category` VALUES ('350', '5');
INSERT INTO `js_product_to_category` VALUES ('350', '39');
INSERT INTO `js_product_to_category` VALUES ('351', '5');
INSERT INTO `js_product_to_category` VALUES ('351', '39');
INSERT INTO `js_product_to_category` VALUES ('352', '5');
INSERT INTO `js_product_to_category` VALUES ('352', '39');
INSERT INTO `js_product_to_category` VALUES ('353', '5');
INSERT INTO `js_product_to_category` VALUES ('353', '39');
INSERT INTO `js_product_to_category` VALUES ('354', '5');
INSERT INTO `js_product_to_category` VALUES ('354', '39');
INSERT INTO `js_product_to_category` VALUES ('355', '5');
INSERT INTO `js_product_to_category` VALUES ('355', '39');
INSERT INTO `js_product_to_category` VALUES ('356', '38');
INSERT INTO `js_product_to_category` VALUES ('356', '39');
INSERT INTO `js_product_to_category` VALUES ('357', '38');
INSERT INTO `js_product_to_category` VALUES ('357', '39');
INSERT INTO `js_product_to_category` VALUES ('358', '38');
INSERT INTO `js_product_to_category` VALUES ('358', '39');
INSERT INTO `js_product_to_category` VALUES ('359', '38');
INSERT INTO `js_product_to_category` VALUES ('359', '39');
INSERT INTO `js_product_to_category` VALUES ('360', '11');
INSERT INTO `js_product_to_category` VALUES ('360', '39');
INSERT INTO `js_product_to_category` VALUES ('361', '11');
INSERT INTO `js_product_to_category` VALUES ('361', '39');
INSERT INTO `js_product_to_category` VALUES ('362', '11');
INSERT INTO `js_product_to_category` VALUES ('362', '39');
INSERT INTO `js_product_to_category` VALUES ('363', '11');
INSERT INTO `js_product_to_category` VALUES ('363', '39');
INSERT INTO `js_product_to_category` VALUES ('364', '11');
INSERT INTO `js_product_to_category` VALUES ('364', '39');
INSERT INTO `js_product_to_category` VALUES ('365', '11');
INSERT INTO `js_product_to_category` VALUES ('365', '39');
INSERT INTO `js_product_to_category` VALUES ('366', '11');
INSERT INTO `js_product_to_category` VALUES ('366', '39');
INSERT INTO `js_product_to_category` VALUES ('367', '11');
INSERT INTO `js_product_to_category` VALUES ('367', '39');
INSERT INTO `js_product_to_category` VALUES ('368', '11');
INSERT INTO `js_product_to_category` VALUES ('368', '39');
INSERT INTO `js_product_to_category` VALUES ('369', '11');
INSERT INTO `js_product_to_category` VALUES ('369', '39');
INSERT INTO `js_product_to_category` VALUES ('370', '11');
INSERT INTO `js_product_to_category` VALUES ('370', '39');
INSERT INTO `js_product_to_category` VALUES ('371', '11');
INSERT INTO `js_product_to_category` VALUES ('371', '39');
INSERT INTO `js_product_to_category` VALUES ('372', '11');
INSERT INTO `js_product_to_category` VALUES ('372', '39');
INSERT INTO `js_product_to_category` VALUES ('373', '11');
INSERT INTO `js_product_to_category` VALUES ('373', '39');
INSERT INTO `js_product_to_category` VALUES ('374', '11');
INSERT INTO `js_product_to_category` VALUES ('374', '39');
INSERT INTO `js_product_to_category` VALUES ('375', '11');
INSERT INTO `js_product_to_category` VALUES ('375', '39');
INSERT INTO `js_product_to_category` VALUES ('376', '11');
INSERT INTO `js_product_to_category` VALUES ('376', '39');
INSERT INTO `js_product_to_category` VALUES ('377', '11');
INSERT INTO `js_product_to_category` VALUES ('377', '39');
INSERT INTO `js_product_to_category` VALUES ('378', '11');
INSERT INTO `js_product_to_category` VALUES ('378', '39');
INSERT INTO `js_product_to_store` VALUES ('1', '0');
INSERT INTO `js_product_to_store` VALUES ('2', '0');
INSERT INTO `js_product_to_store` VALUES ('3', '0');
INSERT INTO `js_product_to_store` VALUES ('4', '0');
INSERT INTO `js_product_to_store` VALUES ('5', '0');
INSERT INTO `js_product_to_store` VALUES ('6', '0');
INSERT INTO `js_product_to_store` VALUES ('7', '0');
INSERT INTO `js_product_to_store` VALUES ('8', '0');
INSERT INTO `js_product_to_store` VALUES ('9', '0');
INSERT INTO `js_product_to_store` VALUES ('10', '0');
INSERT INTO `js_product_to_store` VALUES ('11', '0');
INSERT INTO `js_product_to_store` VALUES ('12', '0');
INSERT INTO `js_product_to_store` VALUES ('13', '0');
INSERT INTO `js_product_to_store` VALUES ('14', '0');
INSERT INTO `js_product_to_store` VALUES ('15', '0');
INSERT INTO `js_product_to_store` VALUES ('16', '0');
INSERT INTO `js_product_to_store` VALUES ('17', '0');
INSERT INTO `js_product_to_store` VALUES ('18', '0');
INSERT INTO `js_product_to_store` VALUES ('19', '0');
INSERT INTO `js_product_to_store` VALUES ('20', '0');
INSERT INTO `js_product_to_store` VALUES ('21', '0');
INSERT INTO `js_product_to_store` VALUES ('22', '0');
INSERT INTO `js_product_to_store` VALUES ('23', '0');
INSERT INTO `js_product_to_store` VALUES ('24', '0');
INSERT INTO `js_product_to_store` VALUES ('25', '0');
INSERT INTO `js_product_to_store` VALUES ('26', '0');
INSERT INTO `js_product_to_store` VALUES ('27', '0');
INSERT INTO `js_product_to_store` VALUES ('28', '0');
INSERT INTO `js_product_to_store` VALUES ('29', '0');
INSERT INTO `js_product_to_store` VALUES ('30', '0');
INSERT INTO `js_product_to_store` VALUES ('31', '0');
INSERT INTO `js_product_to_store` VALUES ('32', '0');
INSERT INTO `js_product_to_store` VALUES ('33', '0');
INSERT INTO `js_product_to_store` VALUES ('34', '0');
INSERT INTO `js_product_to_store` VALUES ('35', '0');
INSERT INTO `js_product_to_store` VALUES ('36', '0');
INSERT INTO `js_product_to_store` VALUES ('37', '0');
INSERT INTO `js_product_to_store` VALUES ('38', '0');
INSERT INTO `js_product_to_store` VALUES ('39', '0');
INSERT INTO `js_product_to_store` VALUES ('40', '0');
INSERT INTO `js_product_to_store` VALUES ('41', '0');
INSERT INTO `js_product_to_store` VALUES ('42', '0');
INSERT INTO `js_product_to_store` VALUES ('43', '0');
INSERT INTO `js_product_to_store` VALUES ('44', '0');
INSERT INTO `js_product_to_store` VALUES ('45', '0');
INSERT INTO `js_product_to_store` VALUES ('46', '0');
INSERT INTO `js_product_to_store` VALUES ('47', '0');
INSERT INTO `js_product_to_store` VALUES ('48', '0');
INSERT INTO `js_product_to_store` VALUES ('49', '0');
INSERT INTO `js_product_to_store` VALUES ('50', '0');
INSERT INTO `js_product_to_store` VALUES ('51', '0');
INSERT INTO `js_product_to_store` VALUES ('52', '0');
INSERT INTO `js_product_to_store` VALUES ('53', '0');
INSERT INTO `js_product_to_store` VALUES ('54', '0');
INSERT INTO `js_product_to_store` VALUES ('55', '0');
INSERT INTO `js_product_to_store` VALUES ('56', '0');
INSERT INTO `js_product_to_store` VALUES ('57', '0');
INSERT INTO `js_product_to_store` VALUES ('58', '0');
INSERT INTO `js_product_to_store` VALUES ('59', '0');
INSERT INTO `js_product_to_store` VALUES ('60', '0');
INSERT INTO `js_product_to_store` VALUES ('61', '0');
INSERT INTO `js_product_to_store` VALUES ('62', '0');
INSERT INTO `js_product_to_store` VALUES ('63', '0');
INSERT INTO `js_product_to_store` VALUES ('64', '0');
INSERT INTO `js_product_to_store` VALUES ('65', '0');
INSERT INTO `js_product_to_store` VALUES ('66', '0');
INSERT INTO `js_product_to_store` VALUES ('67', '0');
INSERT INTO `js_product_to_store` VALUES ('68', '0');
INSERT INTO `js_product_to_store` VALUES ('69', '0');
INSERT INTO `js_product_to_store` VALUES ('70', '0');
INSERT INTO `js_product_to_store` VALUES ('71', '0');
INSERT INTO `js_product_to_store` VALUES ('72', '0');
INSERT INTO `js_product_to_store` VALUES ('73', '0');
INSERT INTO `js_product_to_store` VALUES ('74', '0');
INSERT INTO `js_product_to_store` VALUES ('75', '0');
INSERT INTO `js_product_to_store` VALUES ('76', '0');
INSERT INTO `js_product_to_store` VALUES ('77', '0');
INSERT INTO `js_product_to_store` VALUES ('78', '0');
INSERT INTO `js_product_to_store` VALUES ('79', '0');
INSERT INTO `js_product_to_store` VALUES ('80', '0');
INSERT INTO `js_product_to_store` VALUES ('81', '0');
INSERT INTO `js_product_to_store` VALUES ('82', '0');
INSERT INTO `js_product_to_store` VALUES ('83', '0');
INSERT INTO `js_product_to_store` VALUES ('84', '0');
INSERT INTO `js_product_to_store` VALUES ('85', '0');
INSERT INTO `js_product_to_store` VALUES ('86', '0');
INSERT INTO `js_product_to_store` VALUES ('87', '0');
INSERT INTO `js_product_to_store` VALUES ('88', '0');
INSERT INTO `js_product_to_store` VALUES ('89', '0');
INSERT INTO `js_product_to_store` VALUES ('90', '0');
INSERT INTO `js_product_to_store` VALUES ('91', '0');
INSERT INTO `js_product_to_store` VALUES ('92', '0');
INSERT INTO `js_product_to_store` VALUES ('93', '0');
INSERT INTO `js_product_to_store` VALUES ('94', '0');
INSERT INTO `js_product_to_store` VALUES ('95', '0');
INSERT INTO `js_product_to_store` VALUES ('96', '0');
INSERT INTO `js_product_to_store` VALUES ('97', '0');
INSERT INTO `js_product_to_store` VALUES ('98', '0');
INSERT INTO `js_product_to_store` VALUES ('99', '0');
INSERT INTO `js_product_to_store` VALUES ('100', '0');
INSERT INTO `js_product_to_store` VALUES ('101', '0');
INSERT INTO `js_product_to_store` VALUES ('102', '0');
INSERT INTO `js_product_to_store` VALUES ('103', '0');
INSERT INTO `js_product_to_store` VALUES ('104', '0');
INSERT INTO `js_product_to_store` VALUES ('105', '0');
INSERT INTO `js_product_to_store` VALUES ('106', '0');
INSERT INTO `js_product_to_store` VALUES ('107', '0');
INSERT INTO `js_product_to_store` VALUES ('108', '0');
INSERT INTO `js_product_to_store` VALUES ('109', '0');
INSERT INTO `js_product_to_store` VALUES ('110', '0');
INSERT INTO `js_product_to_store` VALUES ('111', '0');
INSERT INTO `js_product_to_store` VALUES ('112', '0');
INSERT INTO `js_product_to_store` VALUES ('113', '0');
INSERT INTO `js_product_to_store` VALUES ('114', '0');
INSERT INTO `js_product_to_store` VALUES ('115', '0');
INSERT INTO `js_product_to_store` VALUES ('116', '0');
INSERT INTO `js_product_to_store` VALUES ('117', '0');
INSERT INTO `js_product_to_store` VALUES ('118', '0');
INSERT INTO `js_product_to_store` VALUES ('119', '0');
INSERT INTO `js_product_to_store` VALUES ('120', '0');
INSERT INTO `js_product_to_store` VALUES ('121', '0');
INSERT INTO `js_product_to_store` VALUES ('122', '0');
INSERT INTO `js_product_to_store` VALUES ('123', '0');
INSERT INTO `js_product_to_store` VALUES ('124', '0');
INSERT INTO `js_product_to_store` VALUES ('125', '0');
INSERT INTO `js_product_to_store` VALUES ('126', '0');
INSERT INTO `js_product_to_store` VALUES ('127', '0');
INSERT INTO `js_product_to_store` VALUES ('128', '0');
INSERT INTO `js_product_to_store` VALUES ('129', '0');
INSERT INTO `js_product_to_store` VALUES ('130', '0');
INSERT INTO `js_product_to_store` VALUES ('131', '0');
INSERT INTO `js_product_to_store` VALUES ('132', '0');
INSERT INTO `js_product_to_store` VALUES ('133', '0');
INSERT INTO `js_product_to_store` VALUES ('134', '0');
INSERT INTO `js_product_to_store` VALUES ('135', '0');
INSERT INTO `js_product_to_store` VALUES ('136', '0');
INSERT INTO `js_product_to_store` VALUES ('137', '0');
INSERT INTO `js_product_to_store` VALUES ('138', '0');
INSERT INTO `js_product_to_store` VALUES ('139', '0');
INSERT INTO `js_product_to_store` VALUES ('140', '0');
INSERT INTO `js_product_to_store` VALUES ('141', '0');
INSERT INTO `js_product_to_store` VALUES ('142', '0');
INSERT INTO `js_product_to_store` VALUES ('144', '0');
INSERT INTO `js_product_to_store` VALUES ('146', '0');
INSERT INTO `js_product_to_store` VALUES ('147', '0');
INSERT INTO `js_product_to_store` VALUES ('148', '0');
INSERT INTO `js_product_to_store` VALUES ('149', '0');
INSERT INTO `js_product_to_store` VALUES ('150', '0');
INSERT INTO `js_product_to_store` VALUES ('151', '0');
INSERT INTO `js_product_to_store` VALUES ('152', '0');
INSERT INTO `js_product_to_store` VALUES ('153', '0');
INSERT INTO `js_product_to_store` VALUES ('154', '0');
INSERT INTO `js_product_to_store` VALUES ('155', '0');
INSERT INTO `js_product_to_store` VALUES ('156', '0');
INSERT INTO `js_product_to_store` VALUES ('157', '0');
INSERT INTO `js_product_to_store` VALUES ('158', '0');
INSERT INTO `js_product_to_store` VALUES ('159', '0');
INSERT INTO `js_product_to_store` VALUES ('160', '0');
INSERT INTO `js_product_to_store` VALUES ('161', '0');
INSERT INTO `js_product_to_store` VALUES ('162', '0');
INSERT INTO `js_product_to_store` VALUES ('163', '0');
INSERT INTO `js_product_to_store` VALUES ('164', '0');
INSERT INTO `js_product_to_store` VALUES ('165', '0');
INSERT INTO `js_product_to_store` VALUES ('166', '0');
INSERT INTO `js_product_to_store` VALUES ('167', '0');
INSERT INTO `js_product_to_store` VALUES ('168', '0');
INSERT INTO `js_product_to_store` VALUES ('169', '0');
INSERT INTO `js_product_to_store` VALUES ('170', '0');
INSERT INTO `js_product_to_store` VALUES ('171', '0');
INSERT INTO `js_product_to_store` VALUES ('172', '0');
INSERT INTO `js_product_to_store` VALUES ('173', '0');
INSERT INTO `js_product_to_store` VALUES ('174', '0');
INSERT INTO `js_product_to_store` VALUES ('175', '0');
INSERT INTO `js_product_to_store` VALUES ('176', '0');
INSERT INTO `js_product_to_store` VALUES ('177', '0');
INSERT INTO `js_product_to_store` VALUES ('178', '0');
INSERT INTO `js_product_to_store` VALUES ('179', '0');
INSERT INTO `js_product_to_store` VALUES ('180', '0');
INSERT INTO `js_product_to_store` VALUES ('181', '0');
INSERT INTO `js_product_to_store` VALUES ('182', '0');
INSERT INTO `js_product_to_store` VALUES ('183', '0');
INSERT INTO `js_product_to_store` VALUES ('184', '0');
INSERT INTO `js_product_to_store` VALUES ('185', '0');
INSERT INTO `js_product_to_store` VALUES ('186', '0');
INSERT INTO `js_product_to_store` VALUES ('187', '0');
INSERT INTO `js_product_to_store` VALUES ('188', '0');
INSERT INTO `js_product_to_store` VALUES ('189', '0');
INSERT INTO `js_product_to_store` VALUES ('190', '0');
INSERT INTO `js_product_to_store` VALUES ('191', '0');
INSERT INTO `js_product_to_store` VALUES ('192', '0');
INSERT INTO `js_product_to_store` VALUES ('193', '0');
INSERT INTO `js_product_to_store` VALUES ('194', '0');
INSERT INTO `js_product_to_store` VALUES ('195', '0');
INSERT INTO `js_product_to_store` VALUES ('196', '0');
INSERT INTO `js_product_to_store` VALUES ('197', '0');
INSERT INTO `js_product_to_store` VALUES ('198', '0');
INSERT INTO `js_product_to_store` VALUES ('199', '0');
INSERT INTO `js_product_to_store` VALUES ('200', '0');
INSERT INTO `js_product_to_store` VALUES ('201', '0');
INSERT INTO `js_product_to_store` VALUES ('202', '0');
INSERT INTO `js_product_to_store` VALUES ('203', '0');
INSERT INTO `js_product_to_store` VALUES ('204', '0');
INSERT INTO `js_product_to_store` VALUES ('205', '0');
INSERT INTO `js_product_to_store` VALUES ('206', '0');
INSERT INTO `js_product_to_store` VALUES ('207', '0');
INSERT INTO `js_product_to_store` VALUES ('208', '0');
INSERT INTO `js_product_to_store` VALUES ('209', '0');
INSERT INTO `js_product_to_store` VALUES ('210', '0');
INSERT INTO `js_product_to_store` VALUES ('211', '0');
INSERT INTO `js_product_to_store` VALUES ('212', '0');
INSERT INTO `js_product_to_store` VALUES ('213', '0');
INSERT INTO `js_product_to_store` VALUES ('214', '0');
INSERT INTO `js_product_to_store` VALUES ('215', '0');
INSERT INTO `js_product_to_store` VALUES ('216', '0');
INSERT INTO `js_product_to_store` VALUES ('217', '0');
INSERT INTO `js_product_to_store` VALUES ('218', '0');
INSERT INTO `js_product_to_store` VALUES ('219', '0');
INSERT INTO `js_product_to_store` VALUES ('220', '0');
INSERT INTO `js_product_to_store` VALUES ('221', '0');
INSERT INTO `js_product_to_store` VALUES ('222', '0');
INSERT INTO `js_product_to_store` VALUES ('223', '0');
INSERT INTO `js_product_to_store` VALUES ('224', '0');
INSERT INTO `js_product_to_store` VALUES ('225', '0');
INSERT INTO `js_product_to_store` VALUES ('226', '0');
INSERT INTO `js_product_to_store` VALUES ('227', '0');
INSERT INTO `js_product_to_store` VALUES ('228', '0');
INSERT INTO `js_product_to_store` VALUES ('229', '0');
INSERT INTO `js_product_to_store` VALUES ('230', '0');
INSERT INTO `js_product_to_store` VALUES ('231', '0');
INSERT INTO `js_product_to_store` VALUES ('232', '0');
INSERT INTO `js_product_to_store` VALUES ('233', '0');
INSERT INTO `js_product_to_store` VALUES ('234', '0');
INSERT INTO `js_product_to_store` VALUES ('235', '0');
INSERT INTO `js_product_to_store` VALUES ('236', '0');
INSERT INTO `js_product_to_store` VALUES ('237', '0');
INSERT INTO `js_product_to_store` VALUES ('238', '0');
INSERT INTO `js_product_to_store` VALUES ('239', '0');
INSERT INTO `js_product_to_store` VALUES ('240', '0');
INSERT INTO `js_product_to_store` VALUES ('241', '0');
INSERT INTO `js_product_to_store` VALUES ('242', '0');
INSERT INTO `js_product_to_store` VALUES ('243', '0');
INSERT INTO `js_product_to_store` VALUES ('244', '0');
INSERT INTO `js_product_to_store` VALUES ('245', '0');
INSERT INTO `js_product_to_store` VALUES ('246', '0');
INSERT INTO `js_product_to_store` VALUES ('247', '0');
INSERT INTO `js_product_to_store` VALUES ('248', '0');
INSERT INTO `js_product_to_store` VALUES ('249', '0');
INSERT INTO `js_product_to_store` VALUES ('250', '0');
INSERT INTO `js_product_to_store` VALUES ('251', '0');
INSERT INTO `js_product_to_store` VALUES ('252', '0');
INSERT INTO `js_product_to_store` VALUES ('253', '0');
INSERT INTO `js_product_to_store` VALUES ('254', '0');
INSERT INTO `js_product_to_store` VALUES ('255', '0');
INSERT INTO `js_product_to_store` VALUES ('256', '0');
INSERT INTO `js_product_to_store` VALUES ('257', '0');
INSERT INTO `js_product_to_store` VALUES ('258', '0');
INSERT INTO `js_product_to_store` VALUES ('259', '0');
INSERT INTO `js_product_to_store` VALUES ('260', '0');
INSERT INTO `js_product_to_store` VALUES ('261', '0');
INSERT INTO `js_product_to_store` VALUES ('262', '0');
INSERT INTO `js_product_to_store` VALUES ('263', '0');
INSERT INTO `js_product_to_store` VALUES ('264', '0');
INSERT INTO `js_product_to_store` VALUES ('265', '0');
INSERT INTO `js_product_to_store` VALUES ('266', '0');
INSERT INTO `js_product_to_store` VALUES ('267', '0');
INSERT INTO `js_product_to_store` VALUES ('268', '0');
INSERT INTO `js_product_to_store` VALUES ('269', '0');
INSERT INTO `js_product_to_store` VALUES ('270', '0');
INSERT INTO `js_product_to_store` VALUES ('271', '0');
INSERT INTO `js_product_to_store` VALUES ('272', '0');
INSERT INTO `js_product_to_store` VALUES ('273', '0');
INSERT INTO `js_product_to_store` VALUES ('274', '0');
INSERT INTO `js_product_to_store` VALUES ('275', '0');
INSERT INTO `js_product_to_store` VALUES ('276', '0');
INSERT INTO `js_product_to_store` VALUES ('277', '0');
INSERT INTO `js_product_to_store` VALUES ('278', '0');
INSERT INTO `js_product_to_store` VALUES ('279', '0');
INSERT INTO `js_product_to_store` VALUES ('280', '0');
INSERT INTO `js_product_to_store` VALUES ('281', '0');
INSERT INTO `js_product_to_store` VALUES ('282', '0');
INSERT INTO `js_product_to_store` VALUES ('283', '0');
INSERT INTO `js_product_to_store` VALUES ('284', '0');
INSERT INTO `js_product_to_store` VALUES ('285', '0');
INSERT INTO `js_product_to_store` VALUES ('286', '0');
INSERT INTO `js_product_to_store` VALUES ('287', '0');
INSERT INTO `js_product_to_store` VALUES ('288', '0');
INSERT INTO `js_product_to_store` VALUES ('289', '0');
INSERT INTO `js_product_to_store` VALUES ('290', '0');
INSERT INTO `js_product_to_store` VALUES ('291', '0');
INSERT INTO `js_product_to_store` VALUES ('292', '0');
INSERT INTO `js_product_to_store` VALUES ('293', '0');
INSERT INTO `js_product_to_store` VALUES ('294', '0');
INSERT INTO `js_product_to_store` VALUES ('295', '0');
INSERT INTO `js_product_to_store` VALUES ('296', '0');
INSERT INTO `js_product_to_store` VALUES ('297', '0');
INSERT INTO `js_product_to_store` VALUES ('298', '0');
INSERT INTO `js_product_to_store` VALUES ('299', '0');
INSERT INTO `js_product_to_store` VALUES ('300', '0');
INSERT INTO `js_product_to_store` VALUES ('301', '0');
INSERT INTO `js_product_to_store` VALUES ('302', '0');
INSERT INTO `js_product_to_store` VALUES ('303', '0');
INSERT INTO `js_product_to_store` VALUES ('304', '0');
INSERT INTO `js_product_to_store` VALUES ('305', '0');
INSERT INTO `js_product_to_store` VALUES ('306', '0');
INSERT INTO `js_product_to_store` VALUES ('307', '0');
INSERT INTO `js_product_to_store` VALUES ('308', '0');
INSERT INTO `js_product_to_store` VALUES ('309', '0');
INSERT INTO `js_product_to_store` VALUES ('310', '0');
INSERT INTO `js_product_to_store` VALUES ('311', '0');
INSERT INTO `js_product_to_store` VALUES ('312', '0');
INSERT INTO `js_product_to_store` VALUES ('313', '0');
INSERT INTO `js_product_to_store` VALUES ('314', '0');
INSERT INTO `js_product_to_store` VALUES ('315', '0');
INSERT INTO `js_product_to_store` VALUES ('316', '0');
INSERT INTO `js_product_to_store` VALUES ('317', '0');
INSERT INTO `js_product_to_store` VALUES ('318', '0');
INSERT INTO `js_product_to_store` VALUES ('319', '0');
INSERT INTO `js_product_to_store` VALUES ('320', '0');
INSERT INTO `js_product_to_store` VALUES ('321', '0');
INSERT INTO `js_product_to_store` VALUES ('322', '0');
INSERT INTO `js_product_to_store` VALUES ('323', '0');
INSERT INTO `js_product_to_store` VALUES ('324', '0');
INSERT INTO `js_product_to_store` VALUES ('325', '0');
INSERT INTO `js_product_to_store` VALUES ('326', '0');
INSERT INTO `js_product_to_store` VALUES ('327', '0');
INSERT INTO `js_product_to_store` VALUES ('328', '0');
INSERT INTO `js_product_to_store` VALUES ('329', '0');
INSERT INTO `js_product_to_store` VALUES ('330', '0');
INSERT INTO `js_product_to_store` VALUES ('331', '0');
INSERT INTO `js_product_to_store` VALUES ('332', '0');
INSERT INTO `js_product_to_store` VALUES ('333', '0');
INSERT INTO `js_product_to_store` VALUES ('334', '0');
INSERT INTO `js_product_to_store` VALUES ('335', '0');
INSERT INTO `js_product_to_store` VALUES ('336', '0');
INSERT INTO `js_product_to_store` VALUES ('337', '0');
INSERT INTO `js_product_to_store` VALUES ('338', '0');
INSERT INTO `js_product_to_store` VALUES ('339', '0');
INSERT INTO `js_product_to_store` VALUES ('340', '0');
INSERT INTO `js_product_to_store` VALUES ('341', '0');
INSERT INTO `js_product_to_store` VALUES ('342', '0');
INSERT INTO `js_product_to_store` VALUES ('343', '0');
INSERT INTO `js_product_to_store` VALUES ('344', '0');
INSERT INTO `js_product_to_store` VALUES ('345', '0');
INSERT INTO `js_product_to_store` VALUES ('346', '0');
INSERT INTO `js_product_to_store` VALUES ('347', '0');
INSERT INTO `js_product_to_store` VALUES ('348', '0');
INSERT INTO `js_product_to_store` VALUES ('349', '0');
INSERT INTO `js_product_to_store` VALUES ('350', '0');
INSERT INTO `js_product_to_store` VALUES ('351', '0');
INSERT INTO `js_product_to_store` VALUES ('352', '0');
INSERT INTO `js_product_to_store` VALUES ('353', '0');
INSERT INTO `js_product_to_store` VALUES ('354', '0');
INSERT INTO `js_product_to_store` VALUES ('355', '0');
INSERT INTO `js_product_to_store` VALUES ('356', '0');
INSERT INTO `js_product_to_store` VALUES ('357', '0');
INSERT INTO `js_product_to_store` VALUES ('358', '0');
INSERT INTO `js_product_to_store` VALUES ('359', '0');
INSERT INTO `js_product_to_store` VALUES ('360', '0');
INSERT INTO `js_product_to_store` VALUES ('361', '0');
INSERT INTO `js_product_to_store` VALUES ('362', '0');
INSERT INTO `js_product_to_store` VALUES ('363', '0');
INSERT INTO `js_product_to_store` VALUES ('364', '0');
INSERT INTO `js_product_to_store` VALUES ('365', '0');
INSERT INTO `js_product_to_store` VALUES ('366', '0');
INSERT INTO `js_product_to_store` VALUES ('367', '0');
INSERT INTO `js_product_to_store` VALUES ('368', '0');
INSERT INTO `js_product_to_store` VALUES ('369', '0');
INSERT INTO `js_product_to_store` VALUES ('370', '0');
INSERT INTO `js_product_to_store` VALUES ('371', '0');
INSERT INTO `js_product_to_store` VALUES ('372', '0');
INSERT INTO `js_product_to_store` VALUES ('373', '0');
INSERT INTO `js_product_to_store` VALUES ('374', '0');
INSERT INTO `js_product_to_store` VALUES ('375', '0');
INSERT INTO `js_product_to_store` VALUES ('376', '0');
INSERT INTO `js_product_to_store` VALUES ('377', '0');
INSERT INTO `js_product_to_store` VALUES ('378', '0');
INSERT INTO `js_return_action` VALUES ('1', '1', 'Refunded');
INSERT INTO `js_return_action` VALUES ('2', '1', 'Credit Issued');
INSERT INTO `js_return_action` VALUES ('3', '1', 'Replacement Sent');
INSERT INTO `js_return_reason` VALUES ('1', '1', 'Dead On Arrival');
INSERT INTO `js_return_reason` VALUES ('2', '1', 'Received Wrong Item');
INSERT INTO `js_return_reason` VALUES ('3', '1', 'Order Error');
INSERT INTO `js_return_reason` VALUES ('4', '1', 'Faulty, please supply details');
INSERT INTO `js_return_reason` VALUES ('5', '1', 'Other, please supply details');
INSERT INTO `js_return_status` VALUES ('1', '1', 'Pending');
INSERT INTO `js_return_status` VALUES ('3', '1', 'Complete');
INSERT INTO `js_return_status` VALUES ('2', '1', 'Awaiting Products');
INSERT INTO `js_setting` VALUES ('1', '0', 'shipping', 'shipping_sort_order', '3', '0');
INSERT INTO `js_setting` VALUES ('2', '0', 'sub_total', 'sub_total_sort_order', '1', '0');
INSERT INTO `js_setting` VALUES ('3', '0', 'sub_total', 'sub_total_status', '1', '0');
INSERT INTO `js_setting` VALUES ('4', '0', 'tax', 'tax_status', '1', '0');
INSERT INTO `js_setting` VALUES ('5', '0', 'total', 'total_sort_order', '9', '0');
INSERT INTO `js_setting` VALUES ('6', '0', 'total', 'total_status', '1', '0');
INSERT INTO `js_setting` VALUES ('7', '0', 'tax', 'tax_sort_order', '5', '0');
INSERT INTO `js_setting` VALUES ('8', '0', 'free_checkout', 'free_checkout_sort_order', '1', '0');
INSERT INTO `js_setting` VALUES ('9', '0', 'cod', 'cod_sort_order', '5', '0');
INSERT INTO `js_setting` VALUES ('10', '0', 'cod', 'cod_total', '0.01', '0');
INSERT INTO `js_setting` VALUES ('11', '0', 'cod', 'cod_order_status_id', '1', '0');
INSERT INTO `js_setting` VALUES ('12', '0', 'cod', 'cod_geo_zone_id', '0', '0');
INSERT INTO `js_setting` VALUES ('13', '0', 'cod', 'cod_status', '1', '0');
INSERT INTO `js_setting` VALUES ('14', '0', 'shipping', 'shipping_status', '1', '0');
INSERT INTO `js_setting` VALUES ('15', '0', 'shipping', 'shipping_estimator', '1', '0');
INSERT INTO `js_setting` VALUES ('27', '0', 'coupon', 'coupon_sort_order', '4', '0');
INSERT INTO `js_setting` VALUES ('28', '0', 'coupon', 'coupon_status', '1', '0');
INSERT INTO `js_setting` VALUES ('2310', '0', 'flat', 'flat_sort_order', '1', '0');
INSERT INTO `js_setting` VALUES ('2309', '0', 'flat', 'flat_status', '0', '0');
INSERT INTO `js_setting` VALUES ('2308', '0', 'flat', 'flat_geo_zone_id', '0', '0');
INSERT INTO `js_setting` VALUES ('2307', '0', 'flat', 'flat_tax_class_id', '9', '0');
INSERT INTO `js_setting` VALUES ('455', '0', 'carousel', 'carousel_module', 'a:1:{i:0;a:9:{s:9:\"banner_id\";s:1:\"8\";s:5:\"limit\";s:1:\"5\";s:6:\"scroll\";s:1:\"3\";s:5:\"width\";s:3:\"140\";s:6:\"height\";s:3:\"140\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:2:\"-1\";}}', '1');
INSERT INTO `js_setting` VALUES ('2306', '0', 'flat', 'flat_cost', '5.00', '0');
INSERT INTO `js_setting` VALUES ('42', '0', 'credit', 'credit_sort_order', '7', '0');
INSERT INTO `js_setting` VALUES ('43', '0', 'credit', 'credit_status', '1', '0');
INSERT INTO `js_setting` VALUES ('2051', '0', 'openbaymanager', 'openbay_version', '1963', '0');
INSERT INTO `js_setting` VALUES ('53', '0', 'reward', 'reward_sort_order', '2', '0');
INSERT INTO `js_setting` VALUES ('54', '0', 'reward', 'reward_status', '1', '0');
INSERT INTO `js_setting` VALUES ('56', '0', 'affiliate', 'affiliate_module', 'a:1:{i:0;a:4:{s:9:\"layout_id\";s:2:\"10\";s:8:\"position\";s:12:\"column_right\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}', '1');
INSERT INTO `js_setting` VALUES ('461', '0', 'category', 'category_module', 'a:2:{i:0;a:4:{s:9:\"layout_id\";s:1:\"3\";s:8:\"position\";s:11:\"column_left\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}i:1;a:4:{s:9:\"layout_id\";s:1:\"2\";s:8:\"position\";s:11:\"column_left\";s:6:\"status\";s:1:\"0\";s:10:\"sort_order\";s:1:\"1\";}}', '1');
INSERT INTO `js_setting` VALUES ('454', '0', 'account', 'account_module', 'a:1:{i:0;a:4:{s:9:\"layout_id\";s:1:\"6\";s:8:\"position\";s:11:\"column_left\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}', '1');
INSERT INTO `js_setting` VALUES ('3734', '0', 'config', 'config_google_analytics', '', '0');
INSERT INTO `js_setting` VALUES ('3733', '0', 'config', 'config_error_filename', 'error.txt', '0');
INSERT INTO `js_setting` VALUES ('3732', '0', 'config', 'config_error_log', '1', '0');
INSERT INTO `js_setting` VALUES ('3726', '0', 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/jpeg\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/tiff\r\nimage/svg+xml\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/postscript\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet', '0');
INSERT INTO `js_setting` VALUES ('3731', '0', 'config', 'config_error_display', '0', '0');
INSERT INTO `js_setting` VALUES ('3730', '0', 'config', 'config_compression', '0', '0');
INSERT INTO `js_setting` VALUES ('3727', '0', 'config', 'config_maintenance', '0', '0');
INSERT INTO `js_setting` VALUES ('3728', '0', 'config', 'config_password', '1', '0');
INSERT INTO `js_setting` VALUES ('3729', '0', 'config', 'config_encryption', '5f9c2fc649459a1ba513d126965bb451', '0');
INSERT INTO `js_setting` VALUES ('467', '0', 'featured', 'featured_product', '43,40,42,49,46,47,28', '0');
INSERT INTO `js_setting` VALUES ('94', '0', 'voucher', 'voucher_sort_order', '8', '0');
INSERT INTO `js_setting` VALUES ('95', '0', 'voucher', 'voucher_status', '1', '0');
INSERT INTO `js_setting` VALUES ('468', '0', 'featured', 'featured_module', 'a:2:{i:0;a:7:{s:5:\"limit\";s:1:\"5\";s:11:\"image_width\";s:3:\"132\";s:12:\"image_height\";s:3:\"132\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:11:\"content_top\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"2\";}i:1;a:7:{s:5:\"limit\";s:1:\"5\";s:11:\"image_width\";s:2:\"64\";s:12:\"image_height\";s:2:\"64\";s:9:\"layout_id\";s:1:\"3\";s:8:\"position\";s:11:\"column_left\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"3\";}}', '1');
INSERT INTO `js_setting` VALUES ('103', '0', 'free_checkout', 'free_checkout_status', '1', '0');
INSERT INTO `js_setting` VALUES ('104', '0', 'free_checkout', 'free_checkout_order_status_id', '1', '0');
INSERT INTO `js_setting` VALUES ('443', '0', 'custom_slideshow', 'custom_slideshow_module', 'a:1:{i:0;a:7:{s:9:\"banner_id\";s:1:\"9\";s:5:\"width\";s:3:\"960\";s:6:\"height\";s:3:\"400\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:11:\"content_top\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:0:\"\";}}', '1');
INSERT INTO `js_setting` VALUES ('109', '0', 'banner', 'banner_module', 'a:1:{i:0;a:8:{s:9:\"banner_id\";s:1:\"6\";s:5:\"width\";s:3:\"182\";s:6:\"height\";s:3:\"182\";s:11:\"resize_type\";s:7:\"default\";s:9:\"layout_id\";s:1:\"3\";s:8:\"position\";s:11:\"column_left\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"3\";}}', '1');
INSERT INTO `js_setting` VALUES ('3724', '0', 'config', 'config_seo_url', '0', '0');
INSERT INTO `js_setting` VALUES ('3725', '0', 'config', 'config_file_extension_allowed', 'txt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\nrtf\r\nxls\r\nppt\r\nodt\r\nods', '0');
INSERT INTO `js_setting` VALUES ('3723', '0', 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', '0');
INSERT INTO `js_setting` VALUES ('3722', '0', 'config', 'config_shared', '0', '0');
INSERT INTO `js_setting` VALUES ('3721', '0', 'config', 'config_secure', '1', '0');
INSERT INTO `js_setting` VALUES ('3720', '0', 'config', 'config_fraud_status_id', '7', '0');
INSERT INTO `js_setting` VALUES ('3718', '0', 'config', 'config_fraud_key', '', '0');
INSERT INTO `js_setting` VALUES ('3719', '0', 'config', 'config_fraud_score', '', '0');
INSERT INTO `js_setting` VALUES ('3717', '0', 'config', 'config_fraud_detection', '0', '0');
INSERT INTO `js_setting` VALUES ('3716', '0', 'config', 'config_alert_emails', '', '0');
INSERT INTO `js_setting` VALUES ('3715', '0', 'config', 'config_account_mail', '1', '0');
INSERT INTO `js_setting` VALUES ('3714', '0', 'config', 'config_alert_mail', '1', '0');
INSERT INTO `js_setting` VALUES ('3713', '0', 'config', 'config_smtp_timeout', '5', '0');
INSERT INTO `js_setting` VALUES ('3712', '0', 'config', 'config_smtp_port', '25', '0');
INSERT INTO `js_setting` VALUES ('3711', '0', 'config', 'config_smtp_password', '', '0');
INSERT INTO `js_setting` VALUES ('3710', '0', 'config', 'config_smtp_username', '', '0');
INSERT INTO `js_setting` VALUES ('3709', '0', 'config', 'config_smtp_host', '', '0');
INSERT INTO `js_setting` VALUES ('3706', '0', 'config', 'config_ftp_status', '0', '0');
INSERT INTO `js_setting` VALUES ('3707', '0', 'config', 'config_mail_protocol', 'mail', '0');
INSERT INTO `js_setting` VALUES ('3708', '0', 'config', 'config_mail_parameter', '', '0');
INSERT INTO `js_setting` VALUES ('3705', '0', 'config', 'config_ftp_root', '', '0');
INSERT INTO `js_setting` VALUES ('3704', '0', 'config', 'config_ftp_password', '', '0');
INSERT INTO `js_setting` VALUES ('3703', '0', 'config', 'config_ftp_username', '', '0');
INSERT INTO `js_setting` VALUES ('3702', '0', 'config', 'config_ftp_port', '21', '0');
INSERT INTO `js_setting` VALUES ('3701', '0', 'config', 'config_ftp_host', 'jsistersboutique.com', '0');
INSERT INTO `js_setting` VALUES ('3700', '0', 'config', 'config_image_cart_height', '47', '0');
INSERT INTO `js_setting` VALUES ('3699', '0', 'config', 'config_image_cart_width', '47', '0');
INSERT INTO `js_setting` VALUES ('3698', '0', 'config', 'config_image_wishlist_height', '90', '0');
INSERT INTO `js_setting` VALUES ('3697', '0', 'config', 'config_image_wishlist_width', '90', '0');
INSERT INTO `js_setting` VALUES ('3696', '0', 'config', 'config_image_compare_height', '90', '0');
INSERT INTO `js_setting` VALUES ('3695', '0', 'config', 'config_image_compare_width', '90', '0');
INSERT INTO `js_setting` VALUES ('3694', '0', 'config', 'config_image_related_height', '120', '0');
INSERT INTO `js_setting` VALUES ('3693', '0', 'config', 'config_image_related_width', '162', '0');
INSERT INTO `js_setting` VALUES ('3692', '0', 'config', 'config_image_additional_height', '314', '0');
INSERT INTO `js_setting` VALUES ('3691', '0', 'config', 'config_image_additional_width', '314', '0');
INSERT INTO `js_setting` VALUES ('3690', '0', 'config', 'config_image_product_height', '120', '0');
INSERT INTO `js_setting` VALUES ('3689', '0', 'config', 'config_image_product_width', '162', '0');
INSERT INTO `js_setting` VALUES ('3688', '0', 'config', 'config_image_popup_height', '750', '0');
INSERT INTO `js_setting` VALUES ('3687', '0', 'config', 'config_image_popup_width', '750', '0');
INSERT INTO `js_setting` VALUES ('3686', '0', 'config', 'config_image_thumb_height', '314', '0');
INSERT INTO `js_setting` VALUES ('3685', '0', 'config', 'config_image_thumb_width', '314', '0');
INSERT INTO `js_setting` VALUES ('3684', '0', 'config', 'config_image_category_height', '140', '0');
INSERT INTO `js_setting` VALUES ('3683', '0', 'config', 'config_image_category_width', '765', '0');
INSERT INTO `js_setting` VALUES ('3682', '0', 'config', 'config_icon', 'data/icon-jsistersboutique.png', '0');
INSERT INTO `js_setting` VALUES ('3681', '0', 'config', 'config_logo', 'data/logo-jsistersboutique-small.jpg', '0');
INSERT INTO `js_setting` VALUES ('3679', '0', 'config', 'config_return_id', '0', '0');
INSERT INTO `js_setting` VALUES ('3680', '0', 'config', 'config_return_status_id', '2', '0');
INSERT INTO `js_setting` VALUES ('3678', '0', 'config', 'config_commission', '5', '0');
INSERT INTO `js_setting` VALUES ('3675', '0', 'config', 'config_stock_checkout', '0', '0');
INSERT INTO `js_setting` VALUES ('3676', '0', 'config', 'config_stock_status_id', '6', '0');
INSERT INTO `js_setting` VALUES ('3677', '0', 'config', 'config_affiliate_id', '0', '0');
INSERT INTO `js_setting` VALUES ('3674', '0', 'config', 'config_stock_warning', '1', '0');
INSERT INTO `js_setting` VALUES ('3673', '0', 'config', 'config_stock_display', '0', '0');
INSERT INTO `js_setting` VALUES ('3672', '0', 'config', 'config_complete_status_id', '7', '0');
INSERT INTO `js_setting` VALUES ('3671', '0', 'config', 'config_order_status_id', '7', '0');
INSERT INTO `js_setting` VALUES ('3670', '0', 'config', 'config_invoice_prefix', 'INV-2013-00', '0');
INSERT INTO `js_setting` VALUES ('466', '0', 'featured', 'product', '', '0');
INSERT INTO `js_setting` VALUES ('451', '0', 'custom_banner', 'custom_banner_module', 'a:1:{i:0;a:7:{s:9:\"banner_id\";s:2:\"10\";s:5:\"width\";s:3:\"310\";s:6:\"height\";s:3:\"170\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:11:\"content_top\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"2\";}}', '1');
INSERT INTO `js_setting` VALUES ('452', '0', 'bestseller', 'bestseller_module', 'a:1:{i:0;a:7:{s:5:\"limit\";s:1:\"4\";s:11:\"image_width\";s:3:\"132\";s:12:\"image_height\";s:3:\"132\";s:9:\"layout_id\";s:1:\"2\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:0:\"\";}}', '1');
INSERT INTO `js_setting` VALUES ('465', '0', 'latest', 'latest_module', 'a:3:{i:0;a:7:{s:5:\"limit\";s:1:\"5\";s:11:\"image_width\";s:3:\"132\";s:12:\"image_height\";s:3:\"132\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:0:\"\";}i:1;a:7:{s:5:\"limit\";s:1:\"5\";s:11:\"image_width\";s:2:\"64\";s:12:\"image_height\";s:2:\"64\";s:9:\"layout_id\";s:1:\"2\";s:8:\"position\";s:11:\"column_left\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"3\";}i:2;a:7:{s:5:\"limit\";s:1:\"4\";s:11:\"image_width\";s:3:\"132\";s:12:\"image_height\";s:3:\"132\";s:9:\"layout_id\";s:1:\"3\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:0:\"\";}}', '1');
INSERT INTO `js_setting` VALUES ('462', '0', 'special', 'special_module', 'a:2:{i:0;a:7:{s:5:\"limit\";s:1:\"5\";s:11:\"image_width\";s:2:\"64\";s:12:\"image_height\";s:2:\"64\";s:9:\"layout_id\";s:1:\"3\";s:8:\"position\";s:11:\"column_left\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"2\";}i:1;a:7:{s:5:\"limit\";s:1:\"5\";s:11:\"image_width\";s:2:\"64\";s:12:\"image_height\";s:2:\"64\";s:9:\"layout_id\";s:1:\"2\";s:8:\"position\";s:11:\"column_left\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"3\";}}', '1');
INSERT INTO `js_setting` VALUES ('464', '0', 'welcome', 'welcome_module', 'a:1:{i:1;a:5:{s:11:\"description\";a:1:{i:1;s:593:\"&lt;p&gt;Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsu&lt;/p&gt;\r\n\";}s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:11:\"content_top\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"4\";}}', '1');
INSERT INTO `js_setting` VALUES ('1637', '0', 'price', 'price_data', 'a:2:{s:17:\"filter_categories\";s:1:\"1\";s:15:\"filter_searches\";s:1:\"1\";}', '1');
INSERT INTO `js_setting` VALUES ('1638', '0', 'price', 'price_module', 'a:4:{i:1;a:8:{s:6:\"status\";s:1:\"1\";s:8:\"currency\";s:3:\"USD\";s:6:\"ranges\";s:14:\"50,100,300,500\";s:15:\"flexible_filter\";s:1:\"1\";s:9:\"layout_id\";s:1:\"3\";s:8:\"position\";s:11:\"column_left\";s:10:\"sort_order\";s:1:\"2\";s:9:\"module_id\";s:3:\"[1]\";}i:2;a:8:{s:6:\"status\";s:1:\"1\";s:8:\"currency\";s:3:\"USD\";s:6:\"ranges\";s:14:\"50,100,300,500\";s:15:\"flexible_filter\";s:1:\"1\";s:9:\"layout_id\";s:1:\"2\";s:8:\"position\";s:11:\"column_left\";s:10:\"sort_order\";s:1:\"2\";s:9:\"module_id\";s:3:\"[2]\";}i:3;a:8:{s:6:\"status\";s:1:\"1\";s:8:\"currency\";s:3:\"CAD\";s:6:\"ranges\";s:14:\"50,100,300,500\";s:15:\"flexible_filter\";s:1:\"1\";s:9:\"layout_id\";s:1:\"3\";s:8:\"position\";s:11:\"column_left\";s:10:\"sort_order\";s:1:\"2\";s:9:\"module_id\";s:3:\"[3]\";}i:4;a:8:{s:6:\"status\";s:1:\"1\";s:8:\"currency\";s:3:\"CAD\";s:6:\"ranges\";s:14:\"50,100,300,500\";s:15:\"flexible_filter\";s:1:\"1\";s:9:\"layout_id\";s:1:\"2\";s:8:\"position\";s:11:\"column_left\";s:10:\"sort_order\";s:1:\"2\";s:9:\"module_id\";s:3:\"[4]\";}}', '1');
INSERT INTO `js_setting` VALUES ('3669', '0', 'config', 'config_order_edit', '100', '0');
INSERT INTO `js_setting` VALUES ('3668', '0', 'config', 'config_checkout_id', '0', '0');
INSERT INTO `js_setting` VALUES ('2747', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_status', '1', '0');
INSERT INTO `js_setting` VALUES ('2734', '0', 'ups', 'ups_debug', '1', '0');
INSERT INTO `js_setting` VALUES ('2733', '0', 'ups', 'ups_sort_order', '2', '0');
INSERT INTO `js_setting` VALUES ('2732', '0', 'ups', 'ups_status', '1', '0');
INSERT INTO `js_setting` VALUES ('2731', '0', 'ups', 'ups_geo_zone_id', '0', '0');
INSERT INTO `js_setting` VALUES ('2730', '0', 'ups', 'ups_tax_class_id', '9', '0');
INSERT INTO `js_setting` VALUES ('2729', '0', 'ups', 'ups_height', '5', '0');
INSERT INTO `js_setting` VALUES ('2728', '0', 'ups', 'ups_width', '5', '0');
INSERT INTO `js_setting` VALUES ('2727', '0', 'ups', 'ups_length', '5', '0');
INSERT INTO `js_setting` VALUES ('2726', '0', 'ups', 'ups_length_class_id', '1', '0');
INSERT INTO `js_setting` VALUES ('2725', '0', 'ups', 'ups_weight_class_id', '1', '0');
INSERT INTO `js_setting` VALUES ('2724', '0', 'ups', 'ups_display_weight', '1', '0');
INSERT INTO `js_setting` VALUES ('2723', '0', 'ups', 'ups_insurance', '1', '0');
INSERT INTO `js_setting` VALUES ('2722', '0', 'ups', 'ups_ca_65', '1', '0');
INSERT INTO `js_setting` VALUES ('2721', '0', 'ups', 'ups_ca_54', '1', '0');
INSERT INTO `js_setting` VALUES ('2720', '0', 'ups', 'ups_ca_13', '1', '0');
INSERT INTO `js_setting` VALUES ('2719', '0', 'ups', 'ups_ca_12', '1', '0');
INSERT INTO `js_setting` VALUES ('2718', '0', 'ups', 'ups_ca_11', '1', '0');
INSERT INTO `js_setting` VALUES ('2717', '0', 'ups', 'ups_ca_08', '1', '0');
INSERT INTO `js_setting` VALUES ('2716', '0', 'ups', 'ups_ca_07', '1', '0');
INSERT INTO `js_setting` VALUES ('2715', '0', 'ups', 'ups_ca_02', '1', '0');
INSERT INTO `js_setting` VALUES ('2714', '0', 'ups', 'ups_ca_01', '1', '0');
INSERT INTO `js_setting` VALUES ('2713', '0', 'ups', 'ups_quote_type', 'residential', '0');
INSERT INTO `js_setting` VALUES ('2712', '0', 'ups', 'ups_test', '1', '0');
INSERT INTO `js_setting` VALUES ('2711', '0', 'ups', 'ups_postcode', 'H7X4E3', '0');
INSERT INTO `js_setting` VALUES ('2710', '0', 'ups', 'ups_country', 'CA', '0');
INSERT INTO `js_setting` VALUES ('2709', '0', 'ups', 'ups_state', 'QC', '0');
INSERT INTO `js_setting` VALUES ('2708', '0', 'ups', 'ups_city', 'Laval', '0');
INSERT INTO `js_setting` VALUES ('2707', '0', 'ups', 'ups_origin', 'CA', '0');
INSERT INTO `js_setting` VALUES ('2706', '0', 'ups', 'ups_classification', '03', '0');
INSERT INTO `js_setting` VALUES ('2705', '0', 'ups', 'ups_packaging', '02', '0');
INSERT INTO `js_setting` VALUES ('2704', '0', 'ups', 'ups_pickup', '03', '0');
INSERT INTO `js_setting` VALUES ('2703', '0', 'ups', 'ups_password', 'UPS0nl1n3', '0');
INSERT INTO `js_setting` VALUES ('2702', '0', 'ups', 'ups_username', 'asevan', '0');
INSERT INTO `js_setting` VALUES ('2701', '0', 'ups', 'ups_key', '5CBCD55AEA4165B6 ', '0');
INSERT INTO `js_setting` VALUES ('3667', '0', 'config', 'config_guest_checkout', '1', '0');
INSERT INTO `js_setting` VALUES ('2288', '0', 'pp_standard', 'pp_standard_refunded_status_id', '7', '0');
INSERT INTO `js_setting` VALUES ('2287', '0', 'pp_standard', 'pp_standard_processed_status_id', '7', '0');
INSERT INTO `js_setting` VALUES ('2286', '0', 'pp_standard', 'pp_standard_pending_status_id', '7', '0');
INSERT INTO `js_setting` VALUES ('2285', '0', 'pp_standard', 'pp_standard_failed_status_id', '7', '0');
INSERT INTO `js_setting` VALUES ('2284', '0', 'pp_standard', 'pp_standard_expired_status_id', '7', '0');
INSERT INTO `js_setting` VALUES ('2283', '0', 'pp_standard', 'pp_standard_denied_status_id', '7', '0');
INSERT INTO `js_setting` VALUES ('2282', '0', 'pp_standard', 'pp_standard_completed_status_id', '7', '0');
INSERT INTO `js_setting` VALUES ('2281', '0', 'pp_standard', 'pp_standard_canceled_reversal_status_id', '7', '0');
INSERT INTO `js_setting` VALUES ('2280', '0', 'pp_standard', 'pp_standard_total', '', '0');
INSERT INTO `js_setting` VALUES ('2279', '0', 'pp_standard', 'pp_standard_debug', '0', '0');
INSERT INTO `js_setting` VALUES ('2278', '0', 'pp_standard', 'pp_standard_transaction', '0', '0');
INSERT INTO `js_setting` VALUES ('2277', '0', 'pp_standard', 'pp_standard_test', '0', '0');
INSERT INTO `js_setting` VALUES ('2276', '0', 'pp_standard', 'pp_standard_email', 'dreewind361@126.com', '0');
INSERT INTO `js_setting` VALUES ('2289', '0', 'pp_standard', 'pp_standard_reversed_status_id', '7', '0');
INSERT INTO `js_setting` VALUES ('2290', '0', 'pp_standard', 'pp_standard_voided_status_id', '7', '0');
INSERT INTO `js_setting` VALUES ('2291', '0', 'pp_standard', 'pp_standard_geo_zone_id', '0', '0');
INSERT INTO `js_setting` VALUES ('2292', '0', 'pp_standard', 'pp_standard_status', '1', '0');
INSERT INTO `js_setting` VALUES ('2293', '0', 'pp_standard', 'pp_standard_sort_order', '', '0');
INSERT INTO `js_setting` VALUES ('2746', '0', 'canadapost', 'canadapost_language', 'en', '0');
INSERT INTO `js_setting` VALUES ('2745', '0', 'canadapost', 'canadapost_sort_order', '3', '0');
INSERT INTO `js_setting` VALUES ('2744', '0', 'canadapost', 'canadapost_geo_zone_id', '0', '0');
INSERT INTO `js_setting` VALUES ('2743', '0', 'canadapost', 'canadapost_tax_class_id', '9', '0');
INSERT INTO `js_setting` VALUES ('2742', '0', 'canadapost', 'canadapost_originalPackaging', '0', '0');
INSERT INTO `js_setting` VALUES ('2741', '0', 'canadapost', 'canadapost_turnAround', '24', '0');
INSERT INTO `js_setting` VALUES ('2740', '0', 'canadapost', 'canadapost_handling', '2.00', '0');
INSERT INTO `js_setting` VALUES ('2739', '0', 'canadapost', 'canadapost_origin', 'H7X4E3', '0');
INSERT INTO `js_setting` VALUES ('2737', '0', 'canadapost', 'canadapost_port', '30000', '0');
INSERT INTO `js_setting` VALUES ('2738', '0', 'canadapost', 'canadapost_merchantId', 'CPC_DEMO_XML', '0');
INSERT INTO `js_setting` VALUES ('2736', '0', 'canadapost', 'canadapost_server', 'sellonline.canadapost.ca', '0');
INSERT INTO `js_setting` VALUES ('2735', '0', 'canadapost', 'canadapost_status', '0', '0');
INSERT INTO `js_setting` VALUES ('2748', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_test', '1', '0');
INSERT INTO `js_setting` VALUES ('2749', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_mid', 'faadbb6c647a2653', '0');
INSERT INTO `js_setting` VALUES ('2750', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_key', '73f0c5fa0e7a32ca361cd4', '0');
INSERT INTO `js_setting` VALUES ('2751', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_customer_number', '0008196142', '0');
INSERT INTO `js_setting` VALUES ('2752', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_postcode', 'H7X4E3', '0');
INSERT INTO `js_setting` VALUES ('2753', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_quote_type', 'counter', '0');
INSERT INTO `js_setting` VALUES ('2754', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_contract_id', '', '0');
INSERT INTO `js_setting` VALUES ('2755', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_service', 'DOM.RP,DOM.EP,DOM.XP,DOM.XP.CERT,DOM.PC,DOM.LIB,USA.EP,USA.PW.ENV,USA.PW.PAK,USA.PW.PARCEL,USA.SP.AIR,USA.SP.SURF,USA.TP,USA.XP,INT.XP,INT.IP.AIR,INT.IP.SURF,INT.PW.ENV,INT.PW.PAK,INT.PW.PARCEL,INT.SP.AIR,INT.SP.SURF', '0');
INSERT INTO `js_setting` VALUES ('2756', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_shipping_calc', 'volumetric', '0');
INSERT INTO `js_setting` VALUES ('2757', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_length', '5', '0');
INSERT INTO `js_setting` VALUES ('2758', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_width', '5', '0');
INSERT INTO `js_setting` VALUES ('2759', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_height', '5', '0');
INSERT INTO `js_setting` VALUES ('2760', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_adjust', '', '0');
INSERT INTO `js_setting` VALUES ('2761', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_display_weight', '1', '0');
INSERT INTO `js_setting` VALUES ('2762', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_display_dims', '1', '0');
INSERT INTO `js_setting` VALUES ('2763', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_display_date', '1', '0');
INSERT INTO `js_setting` VALUES ('2764', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_debug', '0', '0');
INSERT INTO `js_setting` VALUES ('2765', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_display_errors', '1', '0');
INSERT INTO `js_setting` VALUES ('2766', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_tax_class_id', '9', '0');
INSERT INTO `js_setting` VALUES ('2767', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_geo_zone_id', '0', '0');
INSERT INTO `js_setting` VALUES ('2768', '0', 'canada_post_ws_rest', 'canada_post_ws_rest_sort_order', '4', '0');
INSERT INTO `js_setting` VALUES ('2810', '0', 'authorizenet_aim', 'authorizenet_aim_geo_zone_id', '0', '0');
INSERT INTO `js_setting` VALUES ('2811', '0', 'authorizenet_aim', 'authorizenet_aim_status', '1', '0');
INSERT INTO `js_setting` VALUES ('2812', '0', 'authorizenet_aim', 'authorizenet_aim_sort_order', '6', '0');
INSERT INTO `js_setting` VALUES ('2808', '0', 'authorizenet_aim', 'authorizenet_aim_total', '', '0');
INSERT INTO `js_setting` VALUES ('2809', '0', 'authorizenet_aim', 'authorizenet_aim_order_status_id', '7', '0');
INSERT INTO `js_setting` VALUES ('2805', '0', 'authorizenet_aim', 'authorizenet_aim_server', 'test', '0');
INSERT INTO `js_setting` VALUES ('2806', '0', 'authorizenet_aim', 'authorizenet_aim_mode', 'test', '0');
INSERT INTO `js_setting` VALUES ('2807', '0', 'authorizenet_aim', 'authorizenet_aim_method', 'capture', '0');
INSERT INTO `js_setting` VALUES ('2804', '0', 'authorizenet_aim', 'authorizenet_aim_hash', 'gateway', '0');
INSERT INTO `js_setting` VALUES ('2803', '0', 'authorizenet_aim', 'authorizenet_aim_key', 'test6666', '0');
INSERT INTO `js_setting` VALUES ('2802', '0', 'authorizenet_aim', 'authorizenet_aim_login', 'sevancotest', '0');
INSERT INTO `js_setting` VALUES ('3666', '0', 'config', 'config_cart_weight', '1', '0');
INSERT INTO `js_setting` VALUES ('3664', '0', 'config', 'config_customer_price', '0', '0');
INSERT INTO `js_setting` VALUES ('3665', '0', 'config', 'config_account_id', '0', '0');
INSERT INTO `js_setting` VALUES ('3138', '0', 'supermenu', 'supermenu_htmlarea', 'a:2:{i:1;a:8:{s:5:\"area1\";s:41:\"&lt;p&gt;Insert custom code 1&lt;/p&gt;\r\n\";s:5:\"area2\";s:41:\"&lt;p&gt;Insert custom code 2&lt;/p&gt;\r\n\";s:5:\"area3\";s:41:\"&lt;p&gt;Insert custom code 3&lt;/p&gt;\r\n\";s:5:\"area4\";s:41:\"&lt;p&gt;Insert custom code 4&lt;/p&gt;\r\n\";s:5:\"area5\";s:41:\"&lt;p&gt;Insert custom code 5&lt;/p&gt;\r\n\";s:5:\"area6\";s:41:\"&lt;p&gt;Insert custom code 6&lt;/p&gt;\r\n\";s:5:\"area7\";s:41:\"&lt;p&gt;Insert custom code 7&lt;/p&gt;\r\n\";s:5:\"area8\";s:41:\"&lt;p&gt;Insert custom code 8&lt;/p&gt;\r\n\";}i:2;a:8:{s:5:\"area1\";s:41:\"&lt;p&gt;Insert custom code 1&lt;/p&gt;\r\n\";s:5:\"area2\";s:41:\"&lt;p&gt;Insert custom code 2&lt;/p&gt;\r\n\";s:5:\"area3\";s:41:\"&lt;p&gt;Insert custom code 3&lt;/p&gt;\r\n\";s:5:\"area4\";s:41:\"&lt;p&gt;Insert custom code 4&lt;/p&gt;\r\n\";s:5:\"area5\";s:41:\"&lt;p&gt;Insert custom code 5&lt;/p&gt;\r\n\";s:5:\"area6\";s:41:\"&lt;p&gt;Insert custom code 6&lt;/p&gt;\r\n\";s:5:\"area7\";s:41:\"&lt;p&gt;Insert custom code 7&lt;/p&gt;\r\n\";s:5:\"area8\";s:41:\"&lt;p&gt;Insert custom code 8&lt;/p&gt;\r\n\";}}', '1');
INSERT INTO `js_setting` VALUES ('3137', '0', 'supermenu', 'supermenu_item', 'a:3:{i:0;a:14:{s:4:\"type\";s:3:\"cat\";s:4:\"view\";s:1:\"1\";s:11:\"category_id\";s:2:\"59\";s:14:\"information_id\";s:1:\"4\";s:10:\"customname\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}s:9:\"customurl\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}s:6:\"addurl\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}s:5:\"image\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}s:7:\"tlcolor\";s:0:\"\";s:7:\"tlstyle\";s:0:\"\";s:5:\"chtml\";s:1:\"0\";s:6:\"cchtml\";s:5:\"area1\";s:6:\"dwidth\";s:0:\"\";s:6:\"iwidth\";s:0:\"\";}i:1;a:14:{s:4:\"type\";s:3:\"cat\";s:4:\"view\";s:1:\"1\";s:11:\"category_id\";s:2:\"65\";s:14:\"information_id\";s:1:\"4\";s:10:\"customname\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}s:9:\"customurl\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}s:6:\"addurl\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}s:5:\"image\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}s:7:\"tlcolor\";s:0:\"\";s:7:\"tlstyle\";s:0:\"\";s:5:\"chtml\";s:1:\"0\";s:6:\"cchtml\";s:5:\"area1\";s:6:\"dwidth\";s:0:\"\";s:6:\"iwidth\";s:0:\"\";}i:2;a:14:{s:4:\"type\";s:3:\"cat\";s:4:\"view\";s:1:\"1\";s:11:\"category_id\";s:2:\"64\";s:14:\"information_id\";s:1:\"4\";s:10:\"customname\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}s:9:\"customurl\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}s:6:\"addurl\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}s:5:\"image\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}s:7:\"tlcolor\";s:0:\"\";s:7:\"tlstyle\";s:0:\"\";s:5:\"chtml\";s:1:\"0\";s:6:\"cchtml\";s:5:\"area1\";s:6:\"dwidth\";s:0:\"\";s:6:\"iwidth\";s:0:\"\";}}', '1');
INSERT INTO `js_setting` VALUES ('3136', '0', 'supermenu', 'supermenu_image_height', '140', '0');
INSERT INTO `js_setting` VALUES ('3134', '0', 'supermenu', 'supermenu_more_title', 'a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}', '1');
INSERT INTO `js_setting` VALUES ('3135', '0', 'supermenu', 'supermenu_image_width', '140', '0');
INSERT INTO `js_setting` VALUES ('3131', '0', 'supermenu', 'supermenu_supermenuisresponsive', '1', '0');
INSERT INTO `js_setting` VALUES ('3133', '0', 'supermenu', 'supermenu_settings', 'a:7:{s:2:\"bg\";s:0:\"\";s:3:\"tlc\";s:0:\"\";s:3:\"dbg\";s:7:\"#FFFFFF\";s:3:\"slc\";s:7:\"#ffffff\";s:4:\"slbg\";s:0:\"\";s:5:\"slbgh\";s:0:\"\";s:4:\"thlc\";s:0:\"\";}', '1');
INSERT INTO `js_setting` VALUES ('3132', '0', 'supermenu', 'supermenu_settings_status', '1', '0');
INSERT INTO `js_setting` VALUES ('3663', '0', 'config', 'config_customer_group_id', '1', '0');
INSERT INTO `js_setting` VALUES ('3662', '0', 'config', 'config_customer_online', '1', '0');
INSERT INTO `js_setting` VALUES ('3661', '0', 'config', 'config_tax_customer', 'shipping', '0');
INSERT INTO `js_setting` VALUES ('3658', '0', 'config', 'config_tax', '0', '0');
INSERT INTO `js_setting` VALUES ('3659', '0', 'config', 'config_vat', '0', '0');
INSERT INTO `js_setting` VALUES ('3660', '0', 'config', 'config_tax_default', '', '0');
INSERT INTO `js_setting` VALUES ('3657', '0', 'config', 'config_voucher_max', '1000', '0');
INSERT INTO `js_setting` VALUES ('3656', '0', 'config', 'config_voucher_min', '1', '0');
INSERT INTO `js_setting` VALUES ('3655', '0', 'config', 'config_download', '1', '0');
INSERT INTO `js_setting` VALUES ('3654', '0', 'config', 'config_review_status', '1', '0');
INSERT INTO `js_setting` VALUES ('3653', '0', 'config', 'config_product_count', '1', '0');
INSERT INTO `js_setting` VALUES ('3652', '0', 'config', 'config_admin_limit', '20', '0');
INSERT INTO `js_setting` VALUES ('3651', '0', 'config', 'config_catalog_limit', '16', '0');
INSERT INTO `js_setting` VALUES ('3650', '0', 'config', 'config_weight_class_id', '1', '0');
INSERT INTO `js_setting` VALUES ('3649', '0', 'config', 'config_length_class_id', '1', '0');
INSERT INTO `js_setting` VALUES ('3648', '0', 'config', 'config_currency_auto', '1', '0');
INSERT INTO `js_setting` VALUES ('3647', '0', 'config', 'config_currency', 'CNY', '0');
INSERT INTO `js_setting` VALUES ('3646', '0', 'config', 'config_admin_language', 'cn', '0');
INSERT INTO `js_setting` VALUES ('3645', '0', 'config', 'config_language', 'cn', '0');
INSERT INTO `js_setting` VALUES ('3644', '0', 'config', 'config_zone_id', '707', '0');
INSERT INTO `js_setting` VALUES ('3643', '0', 'config', 'config_country_id', '44', '0');
INSERT INTO `js_setting` VALUES ('3642', '0', 'config', 'config_layout_id', '4', '0');
INSERT INTO `js_setting` VALUES ('3641', '0', 'config', 'config_template', 'elegantcart', '0');
INSERT INTO `js_setting` VALUES ('3639', '0', 'config', 'config_title', '玺鑫荣', '0');
INSERT INTO `js_setting` VALUES ('3640', '0', 'config', 'config_meta_description', '青岛玺鑫荣贸易有限公司', '0');
INSERT INTO `js_setting` VALUES ('3638', '0', 'config', 'config_fax', '', '0');
INSERT INTO `js_setting` VALUES ('3636', '0', 'config', 'config_email', 'dreewind361@126.com', '0');
INSERT INTO `js_setting` VALUES ('3637', '0', 'config', 'config_telephone', '4000177229', '0');
INSERT INTO `js_setting` VALUES ('3635', '0', 'config', 'config_address', '青岛市红岛区', '0');
INSERT INTO `js_setting` VALUES ('3634', '0', 'config', 'config_owner', '王丽 ', '0');
INSERT INTO `js_setting` VALUES ('3633', '0', 'config', 'config_name', '玺鑫荣', '0');
INSERT INTO `js_stock_status` VALUES ('7', '1', 'In Stock');
INSERT INTO `js_stock_status` VALUES ('8', '1', 'Pre-Order');
INSERT INTO `js_stock_status` VALUES ('5', '1', 'Out Of Stock');
INSERT INTO `js_stock_status` VALUES ('6', '1', '2 - 3 Days');
INSERT INTO `js_tax_class` VALUES ('9', 'Taxable Goods', 'Taxed Stuff', '2009-01-06 23:21:53', '2013-08-14 22:46:54');
INSERT INTO `js_tax_class` VALUES ('10', 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');
INSERT INTO `js_tax_rate` VALUES ('86', '3', 'VAT (17.5%)', '17.5000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29');
INSERT INTO `js_tax_rate` VALUES ('87', '3', 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');
INSERT INTO `js_tax_rate` VALUES ('88', '5', 'QC (9.975%)', '9.9750', 'P', '2013-08-14 22:35:31', '2013-08-14 23:35:48');
INSERT INTO `js_tax_rate` VALUES ('89', '6', 'Fed (5%)', '5.0000', 'P', '2013-08-14 22:37:06', '2013-08-14 23:35:55');
INSERT INTO `js_tax_rate_to_customer_group` VALUES ('86', '1');
INSERT INTO `js_tax_rate_to_customer_group` VALUES ('87', '1');
INSERT INTO `js_tax_rate_to_customer_group` VALUES ('88', '1');
INSERT INTO `js_tax_rate_to_customer_group` VALUES ('89', '1');
INSERT INTO `js_tax_rule` VALUES ('121', '10', '86', 'payment', '1');
INSERT INTO `js_tax_rule` VALUES ('120', '10', '87', 'store', '0');
INSERT INTO `js_tax_rule` VALUES ('132', '9', '89', 'shipping', '1');
INSERT INTO `js_tax_rule` VALUES ('131', '9', '88', 'shipping', '2');
INSERT INTO `js_url_alias` VALUES ('1074', 'product_id=48', 'ipod_classic');
INSERT INTO `js_url_alias` VALUES ('1071', 'category_id=26', '锅类');
INSERT INTO `js_url_alias` VALUES ('1070', 'category_id=24', '毛巾');
INSERT INTO `js_url_alias` VALUES ('730', 'manufacturer_id=8', 'apple');
INSERT INTO `js_url_alias` VALUES ('834', 'information_id=4', 'about_us');
INSERT INTO `js_url_alias` VALUES ('1073', 'product_id=42', 'test');
INSERT INTO `js_url_alias` VALUES ('1069', 'category_id=32', '挂件');
INSERT INTO `js_url_alias` VALUES ('1068', 'category_id=28', '包包');
INSERT INTO `js_url_alias` VALUES ('1067', 'category_id=25', '腰带');
INSERT INTO `js_url_alias` VALUES ('1066', 'category_id=22', '剪纸');
INSERT INTO `js_url_alias` VALUES ('1065', 'category_id=9', '牛角梳');
INSERT INTO `js_url_alias` VALUES ('1064', 'category_id=8', '牛角');
INSERT INTO `js_url_alias` VALUES ('1063', 'category_id=30', '保健品');
INSERT INTO `js_url_alias` VALUES ('1062', 'category_id=29', '按摩器材');
INSERT INTO `js_url_alias` VALUES ('1061', 'category_id=21', '獭兔');
INSERT INTO `js_url_alias` VALUES ('1060', 'category_id=20', '貂皮');
INSERT INTO `js_url_alias` VALUES ('1059', 'category_id=19', '皮衣');
INSERT INTO `js_url_alias` VALUES ('1058', 'category_id=44', '皮草');
INSERT INTO `js_url_alias` VALUES ('1057', 'category_id=17', '衣服');
INSERT INTO `js_url_alias` VALUES ('1056', 'category_id=16', '羊皮棉衣');
INSERT INTO `js_url_alias` VALUES ('1055', 'category_id=14', '内衣');
INSERT INTO `js_url_alias` VALUES ('1054', 'category_id=33', '茶具');
INSERT INTO `js_url_alias` VALUES ('1053', 'category_id=12', '餐具');
INSERT INTO `js_url_alias` VALUES ('1052', 'category_id=41', '紫水晶');
INSERT INTO `js_url_alias` VALUES ('1051', 'category_id=40', '石榴石');
INSERT INTO `js_url_alias` VALUES ('1050', 'category_id=38', '一叶发财');
INSERT INTO `js_url_alias` VALUES ('1049', 'category_id=37', '手链');
INSERT INTO `js_url_alias` VALUES ('1048', 'category_id=36', '水晶手链');
INSERT INTO `js_url_alias` VALUES ('1047', 'category_id=35', '黑曜石');
INSERT INTO `js_url_alias` VALUES ('1046', 'category_id=34', '翡翠项链');
INSERT INTO `js_url_alias` VALUES ('1045', 'category_id=11', '玉镯');
INSERT INTO `js_url_alias` VALUES ('1044', 'category_id=10', '珍珠项链');
INSERT INTO `js_url_alias` VALUES ('1043', 'category_id=7', '翡翠吊坠');
INSERT INTO `js_url_alias` VALUES ('1042', 'category_id=6', '观音');
INSERT INTO `js_url_alias` VALUES ('1041', 'category_id=5', '水晶吊坠');
INSERT INTO `js_url_alias` VALUES ('1040', 'category_id=4', '玉佛');
INSERT INTO `js_url_alias` VALUES ('1039', 'category_id=3', '玛瑙把玩');
INSERT INTO `js_url_alias` VALUES ('1038', 'category_id=47', '家庭用品');
INSERT INTO `js_url_alias` VALUES ('1037', 'category_id=46', '饰品');
INSERT INTO `js_url_alias` VALUES ('1036', 'category_id=45', '保健用品');
INSERT INTO `js_url_alias` VALUES ('1035', 'category_id=43', '服装');
INSERT INTO `js_url_alias` VALUES ('1034', 'category_id=42', '瓷器');
INSERT INTO `js_url_alias` VALUES ('1033', 'category_id=39', '玉器');
INSERT INTO `js_url_alias` VALUES ('1032', 'category_id=31', '茶叶');
INSERT INTO `js_url_alias` VALUES ('1031', 'category_id=18', '床上用品');
INSERT INTO `js_url_alias` VALUES ('1030', 'category_id=15', '化妆品');
INSERT INTO `js_url_alias` VALUES ('1029', 'category_id=13', '礼盒');
INSERT INTO `js_url_alias` VALUES ('1028', 'category_id=2', '酒');
INSERT INTO `js_url_alias` VALUES ('1027', 'category_id=1', '车上用品');
INSERT INTO `js_url_alias` VALUES ('1072', 'category_id=27', '茶道');
INSERT INTO `js_user` VALUES ('1', '1', 'admin', '3d7a2f047fcb38176c82208cbe884c3804061ea3', '5ac55dfdb', 'System', 'Administrator', 'info@jsisters.ca', '', '127.0.0.1', '1', '2013-08-08 04:22:50');
INSERT INTO `js_user` VALUES ('2', '11', 'jessica', '7da40a8e02cadb55b6194d001250c1c7acfcfbc6', '6c3c0a6b8', 'Jessica', 'Sevan', 'jessica@sevanco.com', '', '', '1', '2013-09-02 11:20:52');
INSERT INTO `js_user` VALUES ('3', '11', 'jennifer', 'abced50ee72ad16d2270e667798356c85bef74ca', '751498573', 'Jennifer', 'Sevan', 'jennifer@sevanco.com', '', '', '1', '2013-09-02 14:22:55');
INSERT INTO `js_user` VALUES ('4', '11', 'julia', 'ede397d43ca390f4a152cf049b6ec4457f9e39a2', '52fb538e8', 'Julia', 'Sevan', 'julia@sevanco.com', '', '', '1', '2013-09-02 14:23:48');
INSERT INTO `js_user` VALUES ('5', '11', 'maral', '41fad542edf508ac8a7bbfbae7d261d5eb9f077a', '3c861a132', 'Maral', 'Kirdi', 'maral@sevanco.com', '', '', '1', '2013-09-02 14:24:20');
INSERT INTO `js_user_group` VALUES ('1', 'Top Administrator', 'a:2:{s:6:\"access\";a:156:{i:0;s:14:\"amazon/listing\";i:1;s:14:\"amazon/product\";i:2;s:16:\"amazonus/listing\";i:3;s:16:\"amazonus/product\";i:4;s:17:\"catalog/attribute\";i:5;s:23:\"catalog/attribute_group\";i:6;s:16:\"catalog/category\";i:7;s:16:\"catalog/download\";i:8;s:14:\"catalog/filter\";i:9;s:19:\"catalog/information\";i:10;s:20:\"catalog/manufacturer\";i:11;s:14:\"catalog/option\";i:12;s:15:\"catalog/product\";i:13;s:15:\"catalog/profile\";i:14;s:14:\"catalog/review\";i:15;s:18:\"common/filemanager\";i:16;s:13:\"design/banner\";i:17;s:19:\"design/custom_field\";i:18;s:13:\"design/layout\";i:19;s:12:\"ebay/profile\";i:20;s:13:\"ebay/template\";i:21;s:14:\"extension/feed\";i:22;s:17:\"extension/manager\";i:23;s:16:\"extension/module\";i:24;s:17:\"extension/openbay\";i:25;s:17:\"extension/payment\";i:26;s:18:\"extension/shipping\";i:27;s:15:\"extension/total\";i:28;s:16:\"feed/google_base\";i:29;s:19:\"feed/google_sitemap\";i:30;s:20:\"localisation/country\";i:31;s:21:\"localisation/currency\";i:32;s:21:\"localisation/geo_zone\";i:33;s:21:\"localisation/language\";i:34;s:25:\"localisation/length_class\";i:35;s:25:\"localisation/order_status\";i:36;s:26:\"localisation/return_action\";i:37;s:26:\"localisation/return_reason\";i:38;s:26:\"localisation/return_status\";i:39;s:25:\"localisation/stock_status\";i:40;s:22:\"localisation/tax_class\";i:41;s:21:\"localisation/tax_rate\";i:42;s:25:\"localisation/weight_class\";i:43;s:17:\"localisation/zone\";i:44;s:14:\"module/account\";i:45;s:16:\"module/affiliate\";i:46;s:29:\"module/amazon_checkout_layout\";i:47;s:13:\"module/banner\";i:48;s:17:\"module/bestseller\";i:49;s:15:\"module/carousel\";i:50;s:15:\"module/category\";i:51;s:20:\"module/custom_banner\";i:52;s:23:\"module/custom_slideshow\";i:53;s:18:\"module/ebaydisplay\";i:54;s:15:\"module/featured\";i:55;s:13:\"module/filter\";i:56;s:18:\"module/google_talk\";i:57;s:18:\"module/information\";i:58;s:13:\"module/latest\";i:59;s:16:\"module/pp_layout\";i:60;s:12:\"module/price\";i:61;s:16:\"module/slideshow\";i:62;s:14:\"module/special\";i:63;s:12:\"module/store\";i:64;s:13:\"module/styler\";i:65;s:16:\"module/supermenu\";i:66;s:14:\"module/welcome\";i:67;s:14:\"openbay/amazon\";i:68;s:16:\"openbay/amazonus\";i:69;s:15:\"openbay/openbay\";i:70;s:12:\"openbay/play\";i:71;s:23:\"payment/amazon_checkout\";i:72;s:24:\"payment/authorizenet_aim\";i:73;s:21:\"payment/bank_transfer\";i:74;s:14:\"payment/cheque\";i:75;s:11:\"payment/cod\";i:76;s:21:\"payment/free_checkout\";i:77;s:22:\"payment/klarna_account\";i:78;s:22:\"payment/klarna_invoice\";i:79;s:14:\"payment/liqpay\";i:80;s:20:\"payment/moneybookers\";i:81;s:14:\"payment/nochex\";i:82;s:15:\"payment/paymate\";i:83;s:16:\"payment/paypoint\";i:84;s:13:\"payment/payza\";i:85;s:26:\"payment/perpetual_payments\";i:86;s:18:\"payment/pp_express\";i:87;s:25:\"payment/pp_payflow_iframe\";i:88;s:14:\"payment/pp_pro\";i:89;s:21:\"payment/pp_pro_iframe\";i:90;s:17:\"payment/pp_pro_pf\";i:91;s:17:\"payment/pp_pro_uk\";i:92;s:19:\"payment/pp_standard\";i:93;s:15:\"payment/sagepay\";i:94;s:22:\"payment/sagepay_direct\";i:95;s:18:\"payment/sagepay_us\";i:96;s:19:\"payment/twocheckout\";i:97;s:28:\"payment/web_payment_software\";i:98;s:16:\"payment/worldpay\";i:99;s:10:\"play/order\";i:100;s:12:\"play/product\";i:101;s:27:\"report/affiliate_commission\";i:102;s:22:\"report/customer_credit\";i:103;s:22:\"report/customer_online\";i:104;s:21:\"report/customer_order\";i:105;s:22:\"report/customer_reward\";i:106;s:24:\"report/product_purchased\";i:107;s:21:\"report/product_viewed\";i:108;s:18:\"report/sale_coupon\";i:109;s:17:\"report/sale_order\";i:110;s:18:\"report/sale_return\";i:111;s:20:\"report/sale_shipping\";i:112;s:15:\"report/sale_tax\";i:113;s:14:\"sale/affiliate\";i:114;s:12:\"sale/contact\";i:115;s:11:\"sale/coupon\";i:116;s:13:\"sale/customer\";i:117;s:20:\"sale/customer_ban_ip\";i:118;s:19:\"sale/customer_group\";i:119;s:10:\"sale/order\";i:120;s:14:\"sale/recurring\";i:121;s:11:\"sale/return\";i:122;s:12:\"sale/voucher\";i:123;s:18:\"sale/voucher_theme\";i:124;s:15:\"setting/setting\";i:125;s:13:\"setting/store\";i:126;s:16:\"shipping/auspost\";i:127;s:28:\"shipping/canada_post_ws_rest\";i:128;s:19:\"shipping/canadapost\";i:129;s:17:\"shipping/citylink\";i:130;s:14:\"shipping/fedex\";i:131;s:13:\"shipping/flat\";i:132;s:13:\"shipping/free\";i:133;s:13:\"shipping/item\";i:134;s:23:\"shipping/parcelforce_48\";i:135;s:15:\"shipping/pickup\";i:136;s:19:\"shipping/royal_mail\";i:137;s:12:\"shipping/ups\";i:138;s:13:\"shipping/usps\";i:139;s:15:\"shipping/weight\";i:140;s:11:\"tool/backup\";i:141;s:14:\"tool/error_log\";i:142;s:11:\"tool/export\";i:143;s:12:\"total/coupon\";i:144;s:12:\"total/credit\";i:145;s:14:\"total/handling\";i:146;s:16:\"total/klarna_fee\";i:147;s:19:\"total/low_order_fee\";i:148;s:12:\"total/reward\";i:149;s:14:\"total/shipping\";i:150;s:15:\"total/sub_total\";i:151;s:9:\"total/tax\";i:152;s:11:\"total/total\";i:153;s:13:\"total/voucher\";i:154;s:9:\"user/user\";i:155;s:20:\"user/user_permission\";}s:6:\"modify\";a:156:{i:0;s:14:\"amazon/listing\";i:1;s:14:\"amazon/product\";i:2;s:16:\"amazonus/listing\";i:3;s:16:\"amazonus/product\";i:4;s:17:\"catalog/attribute\";i:5;s:23:\"catalog/attribute_group\";i:6;s:16:\"catalog/category\";i:7;s:16:\"catalog/download\";i:8;s:14:\"catalog/filter\";i:9;s:19:\"catalog/information\";i:10;s:20:\"catalog/manufacturer\";i:11;s:14:\"catalog/option\";i:12;s:15:\"catalog/product\";i:13;s:15:\"catalog/profile\";i:14;s:14:\"catalog/review\";i:15;s:18:\"common/filemanager\";i:16;s:13:\"design/banner\";i:17;s:19:\"design/custom_field\";i:18;s:13:\"design/layout\";i:19;s:12:\"ebay/profile\";i:20;s:13:\"ebay/template\";i:21;s:14:\"extension/feed\";i:22;s:17:\"extension/manager\";i:23;s:16:\"extension/module\";i:24;s:17:\"extension/openbay\";i:25;s:17:\"extension/payment\";i:26;s:18:\"extension/shipping\";i:27;s:15:\"extension/total\";i:28;s:16:\"feed/google_base\";i:29;s:19:\"feed/google_sitemap\";i:30;s:20:\"localisation/country\";i:31;s:21:\"localisation/currency\";i:32;s:21:\"localisation/geo_zone\";i:33;s:21:\"localisation/language\";i:34;s:25:\"localisation/length_class\";i:35;s:25:\"localisation/order_status\";i:36;s:26:\"localisation/return_action\";i:37;s:26:\"localisation/return_reason\";i:38;s:26:\"localisation/return_status\";i:39;s:25:\"localisation/stock_status\";i:40;s:22:\"localisation/tax_class\";i:41;s:21:\"localisation/tax_rate\";i:42;s:25:\"localisation/weight_class\";i:43;s:17:\"localisation/zone\";i:44;s:14:\"module/account\";i:45;s:16:\"module/affiliate\";i:46;s:29:\"module/amazon_checkout_layout\";i:47;s:13:\"module/banner\";i:48;s:17:\"module/bestseller\";i:49;s:15:\"module/carousel\";i:50;s:15:\"module/category\";i:51;s:20:\"module/custom_banner\";i:52;s:23:\"module/custom_slideshow\";i:53;s:18:\"module/ebaydisplay\";i:54;s:15:\"module/featured\";i:55;s:13:\"module/filter\";i:56;s:18:\"module/google_talk\";i:57;s:18:\"module/information\";i:58;s:13:\"module/latest\";i:59;s:16:\"module/pp_layout\";i:60;s:12:\"module/price\";i:61;s:16:\"module/slideshow\";i:62;s:14:\"module/special\";i:63;s:12:\"module/store\";i:64;s:13:\"module/styler\";i:65;s:16:\"module/supermenu\";i:66;s:14:\"module/welcome\";i:67;s:14:\"openbay/amazon\";i:68;s:16:\"openbay/amazonus\";i:69;s:15:\"openbay/openbay\";i:70;s:12:\"openbay/play\";i:71;s:23:\"payment/amazon_checkout\";i:72;s:24:\"payment/authorizenet_aim\";i:73;s:21:\"payment/bank_transfer\";i:74;s:14:\"payment/cheque\";i:75;s:11:\"payment/cod\";i:76;s:21:\"payment/free_checkout\";i:77;s:22:\"payment/klarna_account\";i:78;s:22:\"payment/klarna_invoice\";i:79;s:14:\"payment/liqpay\";i:80;s:20:\"payment/moneybookers\";i:81;s:14:\"payment/nochex\";i:82;s:15:\"payment/paymate\";i:83;s:16:\"payment/paypoint\";i:84;s:13:\"payment/payza\";i:85;s:26:\"payment/perpetual_payments\";i:86;s:18:\"payment/pp_express\";i:87;s:25:\"payment/pp_payflow_iframe\";i:88;s:14:\"payment/pp_pro\";i:89;s:21:\"payment/pp_pro_iframe\";i:90;s:17:\"payment/pp_pro_pf\";i:91;s:17:\"payment/pp_pro_uk\";i:92;s:19:\"payment/pp_standard\";i:93;s:15:\"payment/sagepay\";i:94;s:22:\"payment/sagepay_direct\";i:95;s:18:\"payment/sagepay_us\";i:96;s:19:\"payment/twocheckout\";i:97;s:28:\"payment/web_payment_software\";i:98;s:16:\"payment/worldpay\";i:99;s:10:\"play/order\";i:100;s:12:\"play/product\";i:101;s:27:\"report/affiliate_commission\";i:102;s:22:\"report/customer_credit\";i:103;s:22:\"report/customer_online\";i:104;s:21:\"report/customer_order\";i:105;s:22:\"report/customer_reward\";i:106;s:24:\"report/product_purchased\";i:107;s:21:\"report/product_viewed\";i:108;s:18:\"report/sale_coupon\";i:109;s:17:\"report/sale_order\";i:110;s:18:\"report/sale_return\";i:111;s:20:\"report/sale_shipping\";i:112;s:15:\"report/sale_tax\";i:113;s:14:\"sale/affiliate\";i:114;s:12:\"sale/contact\";i:115;s:11:\"sale/coupon\";i:116;s:13:\"sale/customer\";i:117;s:20:\"sale/customer_ban_ip\";i:118;s:19:\"sale/customer_group\";i:119;s:10:\"sale/order\";i:120;s:14:\"sale/recurring\";i:121;s:11:\"sale/return\";i:122;s:12:\"sale/voucher\";i:123;s:18:\"sale/voucher_theme\";i:124;s:15:\"setting/setting\";i:125;s:13:\"setting/store\";i:126;s:16:\"shipping/auspost\";i:127;s:28:\"shipping/canada_post_ws_rest\";i:128;s:19:\"shipping/canadapost\";i:129;s:17:\"shipping/citylink\";i:130;s:14:\"shipping/fedex\";i:131;s:13:\"shipping/flat\";i:132;s:13:\"shipping/free\";i:133;s:13:\"shipping/item\";i:134;s:23:\"shipping/parcelforce_48\";i:135;s:15:\"shipping/pickup\";i:136;s:19:\"shipping/royal_mail\";i:137;s:12:\"shipping/ups\";i:138;s:13:\"shipping/usps\";i:139;s:15:\"shipping/weight\";i:140;s:11:\"tool/backup\";i:141;s:14:\"tool/error_log\";i:142;s:11:\"tool/export\";i:143;s:12:\"total/coupon\";i:144;s:12:\"total/credit\";i:145;s:14:\"total/handling\";i:146;s:16:\"total/klarna_fee\";i:147;s:19:\"total/low_order_fee\";i:148;s:12:\"total/reward\";i:149;s:14:\"total/shipping\";i:150;s:15:\"total/sub_total\";i:151;s:9:\"total/tax\";i:152;s:11:\"total/total\";i:153;s:13:\"total/voucher\";i:154;s:9:\"user/user\";i:155;s:20:\"user/user_permission\";}}');
INSERT INTO `js_user_group` VALUES ('10', 'Demonstration', '');
INSERT INTO `js_user_group` VALUES ('11', 'Sisters', 'a:2:{s:6:\"access\";a:154:{i:0;s:14:\"amazon/listing\";i:1;s:14:\"amazon/product\";i:2;s:16:\"amazonus/listing\";i:3;s:16:\"amazonus/product\";i:4;s:17:\"catalog/attribute\";i:5;s:23:\"catalog/attribute_group\";i:6;s:16:\"catalog/category\";i:7;s:16:\"catalog/download\";i:8;s:14:\"catalog/filter\";i:9;s:19:\"catalog/information\";i:10;s:20:\"catalog/manufacturer\";i:11;s:14:\"catalog/option\";i:12;s:15:\"catalog/product\";i:13;s:15:\"catalog/profile\";i:14;s:14:\"catalog/review\";i:15;s:18:\"common/filemanager\";i:16;s:13:\"design/banner\";i:17;s:19:\"design/custom_field\";i:18;s:13:\"design/layout\";i:19;s:12:\"ebay/profile\";i:20;s:13:\"ebay/template\";i:21;s:14:\"extension/feed\";i:22;s:17:\"extension/manager\";i:23;s:16:\"extension/module\";i:24;s:17:\"extension/openbay\";i:25;s:17:\"extension/payment\";i:26;s:18:\"extension/shipping\";i:27;s:15:\"extension/total\";i:28;s:16:\"feed/google_base\";i:29;s:19:\"feed/google_sitemap\";i:30;s:20:\"localisation/country\";i:31;s:21:\"localisation/currency\";i:32;s:21:\"localisation/geo_zone\";i:33;s:21:\"localisation/language\";i:34;s:25:\"localisation/length_class\";i:35;s:25:\"localisation/order_status\";i:36;s:26:\"localisation/return_action\";i:37;s:26:\"localisation/return_reason\";i:38;s:26:\"localisation/return_status\";i:39;s:25:\"localisation/stock_status\";i:40;s:22:\"localisation/tax_class\";i:41;s:21:\"localisation/tax_rate\";i:42;s:25:\"localisation/weight_class\";i:43;s:17:\"localisation/zone\";i:44;s:14:\"module/account\";i:45;s:16:\"module/affiliate\";i:46;s:29:\"module/amazon_checkout_layout\";i:47;s:13:\"module/banner\";i:48;s:17:\"module/bestseller\";i:49;s:15:\"module/carousel\";i:50;s:15:\"module/category\";i:51;s:20:\"module/custom_banner\";i:52;s:23:\"module/custom_slideshow\";i:53;s:18:\"module/ebaydisplay\";i:54;s:15:\"module/featured\";i:55;s:13:\"module/filter\";i:56;s:18:\"module/google_talk\";i:57;s:18:\"module/information\";i:58;s:13:\"module/latest\";i:59;s:16:\"module/pp_layout\";i:60;s:12:\"module/price\";i:61;s:16:\"module/slideshow\";i:62;s:14:\"module/special\";i:63;s:12:\"module/store\";i:64;s:13:\"module/styler\";i:65;s:14:\"module/welcome\";i:66;s:14:\"openbay/amazon\";i:67;s:16:\"openbay/amazonus\";i:68;s:15:\"openbay/openbay\";i:69;s:12:\"openbay/play\";i:70;s:23:\"payment/amazon_checkout\";i:71;s:24:\"payment/authorizenet_aim\";i:72;s:21:\"payment/bank_transfer\";i:73;s:14:\"payment/cheque\";i:74;s:11:\"payment/cod\";i:75;s:21:\"payment/free_checkout\";i:76;s:22:\"payment/klarna_account\";i:77;s:22:\"payment/klarna_invoice\";i:78;s:14:\"payment/liqpay\";i:79;s:20:\"payment/moneybookers\";i:80;s:14:\"payment/nochex\";i:81;s:15:\"payment/paymate\";i:82;s:16:\"payment/paypoint\";i:83;s:13:\"payment/payza\";i:84;s:26:\"payment/perpetual_payments\";i:85;s:18:\"payment/pp_express\";i:86;s:25:\"payment/pp_payflow_iframe\";i:87;s:14:\"payment/pp_pro\";i:88;s:21:\"payment/pp_pro_iframe\";i:89;s:17:\"payment/pp_pro_pf\";i:90;s:17:\"payment/pp_pro_uk\";i:91;s:19:\"payment/pp_standard\";i:92;s:15:\"payment/sagepay\";i:93;s:22:\"payment/sagepay_direct\";i:94;s:18:\"payment/sagepay_us\";i:95;s:19:\"payment/twocheckout\";i:96;s:28:\"payment/web_payment_software\";i:97;s:16:\"payment/worldpay\";i:98;s:10:\"play/order\";i:99;s:12:\"play/product\";i:100;s:27:\"report/affiliate_commission\";i:101;s:22:\"report/customer_credit\";i:102;s:22:\"report/customer_online\";i:103;s:21:\"report/customer_order\";i:104;s:22:\"report/customer_reward\";i:105;s:24:\"report/product_purchased\";i:106;s:21:\"report/product_viewed\";i:107;s:18:\"report/sale_coupon\";i:108;s:17:\"report/sale_order\";i:109;s:18:\"report/sale_return\";i:110;s:20:\"report/sale_shipping\";i:111;s:15:\"report/sale_tax\";i:112;s:14:\"sale/affiliate\";i:113;s:12:\"sale/contact\";i:114;s:11:\"sale/coupon\";i:115;s:13:\"sale/customer\";i:116;s:20:\"sale/customer_ban_ip\";i:117;s:19:\"sale/customer_group\";i:118;s:10:\"sale/order\";i:119;s:14:\"sale/recurring\";i:120;s:11:\"sale/return\";i:121;s:12:\"sale/voucher\";i:122;s:18:\"sale/voucher_theme\";i:123;s:15:\"setting/setting\";i:124;s:13:\"setting/store\";i:125;s:16:\"shipping/auspost\";i:126;s:28:\"shipping/canada_post_ws_rest\";i:127;s:19:\"shipping/canadapost\";i:128;s:17:\"shipping/citylink\";i:129;s:14:\"shipping/fedex\";i:130;s:13:\"shipping/flat\";i:131;s:13:\"shipping/free\";i:132;s:13:\"shipping/item\";i:133;s:23:\"shipping/parcelforce_48\";i:134;s:15:\"shipping/pickup\";i:135;s:19:\"shipping/royal_mail\";i:136;s:12:\"shipping/ups\";i:137;s:13:\"shipping/usps\";i:138;s:15:\"shipping/weight\";i:139;s:11:\"tool/backup\";i:140;s:14:\"tool/error_log\";i:141;s:12:\"total/coupon\";i:142;s:12:\"total/credit\";i:143;s:14:\"total/handling\";i:144;s:16:\"total/klarna_fee\";i:145;s:19:\"total/low_order_fee\";i:146;s:12:\"total/reward\";i:147;s:14:\"total/shipping\";i:148;s:15:\"total/sub_total\";i:149;s:9:\"total/tax\";i:150;s:11:\"total/total\";i:151;s:13:\"total/voucher\";i:152;s:9:\"user/user\";i:153;s:20:\"user/user_permission\";}s:6:\"modify\";a:154:{i:0;s:14:\"amazon/listing\";i:1;s:14:\"amazon/product\";i:2;s:16:\"amazonus/listing\";i:3;s:16:\"amazonus/product\";i:4;s:17:\"catalog/attribute\";i:5;s:23:\"catalog/attribute_group\";i:6;s:16:\"catalog/category\";i:7;s:16:\"catalog/download\";i:8;s:14:\"catalog/filter\";i:9;s:19:\"catalog/information\";i:10;s:20:\"catalog/manufacturer\";i:11;s:14:\"catalog/option\";i:12;s:15:\"catalog/product\";i:13;s:15:\"catalog/profile\";i:14;s:14:\"catalog/review\";i:15;s:18:\"common/filemanager\";i:16;s:13:\"design/banner\";i:17;s:19:\"design/custom_field\";i:18;s:13:\"design/layout\";i:19;s:12:\"ebay/profile\";i:20;s:13:\"ebay/template\";i:21;s:14:\"extension/feed\";i:22;s:17:\"extension/manager\";i:23;s:16:\"extension/module\";i:24;s:17:\"extension/openbay\";i:25;s:17:\"extension/payment\";i:26;s:18:\"extension/shipping\";i:27;s:15:\"extension/total\";i:28;s:16:\"feed/google_base\";i:29;s:19:\"feed/google_sitemap\";i:30;s:20:\"localisation/country\";i:31;s:21:\"localisation/currency\";i:32;s:21:\"localisation/geo_zone\";i:33;s:21:\"localisation/language\";i:34;s:25:\"localisation/length_class\";i:35;s:25:\"localisation/order_status\";i:36;s:26:\"localisation/return_action\";i:37;s:26:\"localisation/return_reason\";i:38;s:26:\"localisation/return_status\";i:39;s:25:\"localisation/stock_status\";i:40;s:22:\"localisation/tax_class\";i:41;s:21:\"localisation/tax_rate\";i:42;s:25:\"localisation/weight_class\";i:43;s:17:\"localisation/zone\";i:44;s:14:\"module/account\";i:45;s:16:\"module/affiliate\";i:46;s:29:\"module/amazon_checkout_layout\";i:47;s:13:\"module/banner\";i:48;s:17:\"module/bestseller\";i:49;s:15:\"module/carousel\";i:50;s:15:\"module/category\";i:51;s:20:\"module/custom_banner\";i:52;s:23:\"module/custom_slideshow\";i:53;s:18:\"module/ebaydisplay\";i:54;s:15:\"module/featured\";i:55;s:13:\"module/filter\";i:56;s:18:\"module/google_talk\";i:57;s:18:\"module/information\";i:58;s:13:\"module/latest\";i:59;s:16:\"module/pp_layout\";i:60;s:12:\"module/price\";i:61;s:16:\"module/slideshow\";i:62;s:14:\"module/special\";i:63;s:12:\"module/store\";i:64;s:13:\"module/styler\";i:65;s:14:\"module/welcome\";i:66;s:14:\"openbay/amazon\";i:67;s:16:\"openbay/amazonus\";i:68;s:15:\"openbay/openbay\";i:69;s:12:\"openbay/play\";i:70;s:23:\"payment/amazon_checkout\";i:71;s:24:\"payment/authorizenet_aim\";i:72;s:21:\"payment/bank_transfer\";i:73;s:14:\"payment/cheque\";i:74;s:11:\"payment/cod\";i:75;s:21:\"payment/free_checkout\";i:76;s:22:\"payment/klarna_account\";i:77;s:22:\"payment/klarna_invoice\";i:78;s:14:\"payment/liqpay\";i:79;s:20:\"payment/moneybookers\";i:80;s:14:\"payment/nochex\";i:81;s:15:\"payment/paymate\";i:82;s:16:\"payment/paypoint\";i:83;s:13:\"payment/payza\";i:84;s:26:\"payment/perpetual_payments\";i:85;s:18:\"payment/pp_express\";i:86;s:25:\"payment/pp_payflow_iframe\";i:87;s:14:\"payment/pp_pro\";i:88;s:21:\"payment/pp_pro_iframe\";i:89;s:17:\"payment/pp_pro_pf\";i:90;s:17:\"payment/pp_pro_uk\";i:91;s:19:\"payment/pp_standard\";i:92;s:15:\"payment/sagepay\";i:93;s:22:\"payment/sagepay_direct\";i:94;s:18:\"payment/sagepay_us\";i:95;s:19:\"payment/twocheckout\";i:96;s:28:\"payment/web_payment_software\";i:97;s:16:\"payment/worldpay\";i:98;s:10:\"play/order\";i:99;s:12:\"play/product\";i:100;s:27:\"report/affiliate_commission\";i:101;s:22:\"report/customer_credit\";i:102;s:22:\"report/customer_online\";i:103;s:21:\"report/customer_order\";i:104;s:22:\"report/customer_reward\";i:105;s:24:\"report/product_purchased\";i:106;s:21:\"report/product_viewed\";i:107;s:18:\"report/sale_coupon\";i:108;s:17:\"report/sale_order\";i:109;s:18:\"report/sale_return\";i:110;s:20:\"report/sale_shipping\";i:111;s:15:\"report/sale_tax\";i:112;s:14:\"sale/affiliate\";i:113;s:12:\"sale/contact\";i:114;s:11:\"sale/coupon\";i:115;s:13:\"sale/customer\";i:116;s:20:\"sale/customer_ban_ip\";i:117;s:19:\"sale/customer_group\";i:118;s:10:\"sale/order\";i:119;s:14:\"sale/recurring\";i:120;s:11:\"sale/return\";i:121;s:12:\"sale/voucher\";i:122;s:18:\"sale/voucher_theme\";i:123;s:15:\"setting/setting\";i:124;s:13:\"setting/store\";i:125;s:16:\"shipping/auspost\";i:126;s:28:\"shipping/canada_post_ws_rest\";i:127;s:19:\"shipping/canadapost\";i:128;s:17:\"shipping/citylink\";i:129;s:14:\"shipping/fedex\";i:130;s:13:\"shipping/flat\";i:131;s:13:\"shipping/free\";i:132;s:13:\"shipping/item\";i:133;s:23:\"shipping/parcelforce_48\";i:134;s:15:\"shipping/pickup\";i:135;s:19:\"shipping/royal_mail\";i:136;s:12:\"shipping/ups\";i:137;s:13:\"shipping/usps\";i:138;s:15:\"shipping/weight\";i:139;s:11:\"tool/backup\";i:140;s:14:\"tool/error_log\";i:141;s:12:\"total/coupon\";i:142;s:12:\"total/credit\";i:143;s:14:\"total/handling\";i:144;s:16:\"total/klarna_fee\";i:145;s:19:\"total/low_order_fee\";i:146;s:12:\"total/reward\";i:147;s:14:\"total/shipping\";i:148;s:15:\"total/sub_total\";i:149;s:9:\"total/tax\";i:150;s:11:\"total/total\";i:151;s:13:\"total/voucher\";i:152;s:9:\"user/user\";i:153;s:20:\"user/user_permission\";}}');
INSERT INTO `js_voucher_theme` VALUES ('8', 'data/demo/canon_eos_5d_2.jpg');
INSERT INTO `js_voucher_theme` VALUES ('7', 'data/demo/gift-voucher-birthday.jpg');
INSERT INTO `js_voucher_theme` VALUES ('6', 'data/demo/apple_logo.jpg');
INSERT INTO `js_voucher_theme_description` VALUES ('6', '1', 'Christmas');
INSERT INTO `js_voucher_theme_description` VALUES ('7', '1', 'Birthday');
INSERT INTO `js_voucher_theme_description` VALUES ('8', '1', 'General');
INSERT INTO `js_weight_class` VALUES ('1', '1.00000000');
INSERT INTO `js_weight_class` VALUES ('2', '1000.00000000');
INSERT INTO `js_weight_class` VALUES ('5', '2.20460000');
INSERT INTO `js_weight_class` VALUES ('6', '35.27400000');
INSERT INTO `js_weight_class_description` VALUES ('1', '1', 'Kilogram', 'kg');
INSERT INTO `js_weight_class_description` VALUES ('2', '1', 'Gram', 'g');
INSERT INTO `js_weight_class_description` VALUES ('5', '1', 'Pound ', 'lb');
INSERT INTO `js_weight_class_description` VALUES ('6', '1', 'Ounce', 'oz');
INSERT INTO `js_zone` VALUES ('1', '1', 'Badakhshan', 'BDS', '1');
INSERT INTO `js_zone` VALUES ('2', '1', 'Badghis', 'BDG', '1');
INSERT INTO `js_zone` VALUES ('3', '1', 'Baghlan', 'BGL', '1');
INSERT INTO `js_zone` VALUES ('4', '1', 'Balkh', 'BAL', '1');
INSERT INTO `js_zone` VALUES ('5', '1', 'Bamian', 'BAM', '1');
INSERT INTO `js_zone` VALUES ('6', '1', 'Farah', 'FRA', '1');
INSERT INTO `js_zone` VALUES ('7', '1', 'Faryab', 'FYB', '1');
INSERT INTO `js_zone` VALUES ('8', '1', 'Ghazni', 'GHA', '1');
INSERT INTO `js_zone` VALUES ('9', '1', 'Ghowr', 'GHO', '1');
INSERT INTO `js_zone` VALUES ('10', '1', 'Helmand', 'HEL', '1');
INSERT INTO `js_zone` VALUES ('11', '1', 'Herat', 'HER', '1');
INSERT INTO `js_zone` VALUES ('12', '1', 'Jowzjan', 'JOW', '1');
INSERT INTO `js_zone` VALUES ('13', '1', 'Kabul', 'KAB', '1');
INSERT INTO `js_zone` VALUES ('14', '1', 'Kandahar', 'KAN', '1');
INSERT INTO `js_zone` VALUES ('15', '1', 'Kapisa', 'KAP', '1');
INSERT INTO `js_zone` VALUES ('16', '1', 'Khost', 'KHO', '1');
INSERT INTO `js_zone` VALUES ('17', '1', 'Konar', 'KNR', '1');
INSERT INTO `js_zone` VALUES ('18', '1', 'Kondoz', 'KDZ', '1');
INSERT INTO `js_zone` VALUES ('19', '1', 'Laghman', 'LAG', '1');
INSERT INTO `js_zone` VALUES ('20', '1', 'Lowgar', 'LOW', '1');
INSERT INTO `js_zone` VALUES ('21', '1', 'Nangrahar', 'NAN', '1');
INSERT INTO `js_zone` VALUES ('22', '1', 'Nimruz', 'NIM', '1');
INSERT INTO `js_zone` VALUES ('23', '1', 'Nurestan', 'NUR', '1');
INSERT INTO `js_zone` VALUES ('24', '1', 'Oruzgan', 'ORU', '1');
INSERT INTO `js_zone` VALUES ('25', '1', 'Paktia', 'PIA', '1');
INSERT INTO `js_zone` VALUES ('26', '1', 'Paktika', 'PKA', '1');
INSERT INTO `js_zone` VALUES ('27', '1', 'Parwan', 'PAR', '1');
INSERT INTO `js_zone` VALUES ('28', '1', 'Samangan', 'SAM', '1');
INSERT INTO `js_zone` VALUES ('29', '1', 'Sar-e Pol', 'SAR', '1');
INSERT INTO `js_zone` VALUES ('30', '1', 'Takhar', 'TAK', '1');
INSERT INTO `js_zone` VALUES ('31', '1', 'Wardak', 'WAR', '1');
INSERT INTO `js_zone` VALUES ('32', '1', 'Zabol', 'ZAB', '1');
INSERT INTO `js_zone` VALUES ('33', '2', 'Berat', 'BR', '1');
INSERT INTO `js_zone` VALUES ('34', '2', 'Bulqize', 'BU', '1');
INSERT INTO `js_zone` VALUES ('35', '2', 'Delvine', 'DL', '1');
INSERT INTO `js_zone` VALUES ('36', '2', 'Devoll', 'DV', '1');
INSERT INTO `js_zone` VALUES ('37', '2', 'Diber', 'DI', '1');
INSERT INTO `js_zone` VALUES ('38', '2', 'Durres', 'DR', '1');
INSERT INTO `js_zone` VALUES ('39', '2', 'Elbasan', 'EL', '1');
INSERT INTO `js_zone` VALUES ('40', '2', 'Kolonje', 'ER', '1');
INSERT INTO `js_zone` VALUES ('41', '2', 'Fier', 'FR', '1');
INSERT INTO `js_zone` VALUES ('42', '2', 'Gjirokaster', 'GJ', '1');
INSERT INTO `js_zone` VALUES ('43', '2', 'Gramsh', 'GR', '1');
INSERT INTO `js_zone` VALUES ('44', '2', 'Has', 'HA', '1');
INSERT INTO `js_zone` VALUES ('45', '2', 'Kavaje', 'KA', '1');
INSERT INTO `js_zone` VALUES ('46', '2', 'Kurbin', 'KB', '1');
INSERT INTO `js_zone` VALUES ('47', '2', 'Kucove', 'KC', '1');
INSERT INTO `js_zone` VALUES ('48', '2', 'Korce', 'KO', '1');
INSERT INTO `js_zone` VALUES ('49', '2', 'Kruje', 'KR', '1');
INSERT INTO `js_zone` VALUES ('50', '2', 'Kukes', 'KU', '1');
INSERT INTO `js_zone` VALUES ('51', '2', 'Librazhd', 'LB', '1');
INSERT INTO `js_zone` VALUES ('52', '2', 'Lezhe', 'LE', '1');
INSERT INTO `js_zone` VALUES ('53', '2', 'Lushnje', 'LU', '1');
INSERT INTO `js_zone` VALUES ('54', '2', 'Malesi e Madhe', 'MM', '1');
INSERT INTO `js_zone` VALUES ('55', '2', 'Mallakaster', 'MK', '1');
INSERT INTO `js_zone` VALUES ('56', '2', 'Mat', 'MT', '1');
INSERT INTO `js_zone` VALUES ('57', '2', 'Mirdite', 'MR', '1');
INSERT INTO `js_zone` VALUES ('58', '2', 'Peqin', 'PQ', '1');
INSERT INTO `js_zone` VALUES ('59', '2', 'Permet', 'PR', '1');
INSERT INTO `js_zone` VALUES ('60', '2', 'Pogradec', 'PG', '1');
INSERT INTO `js_zone` VALUES ('61', '2', 'Puke', 'PU', '1');
INSERT INTO `js_zone` VALUES ('62', '2', 'Shkoder', 'SH', '1');
INSERT INTO `js_zone` VALUES ('63', '2', 'Skrapar', 'SK', '1');
INSERT INTO `js_zone` VALUES ('64', '2', 'Sarande', 'SR', '1');
INSERT INTO `js_zone` VALUES ('65', '2', 'Tepelene', 'TE', '1');
INSERT INTO `js_zone` VALUES ('66', '2', 'Tropoje', 'TP', '1');
INSERT INTO `js_zone` VALUES ('67', '2', 'Tirane', 'TR', '1');
INSERT INTO `js_zone` VALUES ('68', '2', 'Vlore', 'VL', '1');
INSERT INTO `js_zone` VALUES ('69', '3', 'Adrar', 'ADR', '1');
INSERT INTO `js_zone` VALUES ('70', '3', 'Ain Defla', 'ADE', '1');
INSERT INTO `js_zone` VALUES ('71', '3', 'Ain Temouchent', 'ATE', '1');
INSERT INTO `js_zone` VALUES ('72', '3', 'Alger', 'ALG', '1');
INSERT INTO `js_zone` VALUES ('73', '3', 'Annaba', 'ANN', '1');
INSERT INTO `js_zone` VALUES ('74', '3', 'Batna', 'BAT', '1');
INSERT INTO `js_zone` VALUES ('75', '3', 'Bechar', 'BEC', '1');
INSERT INTO `js_zone` VALUES ('76', '3', 'Bejaia', 'BEJ', '1');
INSERT INTO `js_zone` VALUES ('77', '3', 'Biskra', 'BIS', '1');
INSERT INTO `js_zone` VALUES ('78', '3', 'Blida', 'BLI', '1');
INSERT INTO `js_zone` VALUES ('79', '3', 'Bordj Bou Arreridj', 'BBA', '1');
INSERT INTO `js_zone` VALUES ('80', '3', 'Bouira', 'BOA', '1');
INSERT INTO `js_zone` VALUES ('81', '3', 'Boumerdes', 'BMD', '1');
INSERT INTO `js_zone` VALUES ('82', '3', 'Chlef', 'CHL', '1');
INSERT INTO `js_zone` VALUES ('83', '3', 'Constantine', 'CON', '1');
INSERT INTO `js_zone` VALUES ('84', '3', 'Djelfa', 'DJE', '1');
INSERT INTO `js_zone` VALUES ('85', '3', 'El Bayadh', 'EBA', '1');
INSERT INTO `js_zone` VALUES ('86', '3', 'El Oued', 'EOU', '1');
INSERT INTO `js_zone` VALUES ('87', '3', 'El Tarf', 'ETA', '1');
INSERT INTO `js_zone` VALUES ('88', '3', 'Ghardaia', 'GHA', '1');
INSERT INTO `js_zone` VALUES ('89', '3', 'Guelma', 'GUE', '1');
INSERT INTO `js_zone` VALUES ('90', '3', 'Illizi', 'ILL', '1');
INSERT INTO `js_zone` VALUES ('91', '3', 'Jijel', 'JIJ', '1');
INSERT INTO `js_zone` VALUES ('92', '3', 'Khenchela', 'KHE', '1');
INSERT INTO `js_zone` VALUES ('93', '3', 'Laghouat', 'LAG', '1');
INSERT INTO `js_zone` VALUES ('94', '3', 'Muaskar', 'MUA', '1');
INSERT INTO `js_zone` VALUES ('95', '3', 'Medea', 'MED', '1');
INSERT INTO `js_zone` VALUES ('96', '3', 'Mila', 'MIL', '1');
INSERT INTO `js_zone` VALUES ('97', '3', 'Mostaganem', 'MOS', '1');
INSERT INTO `js_zone` VALUES ('98', '3', 'M\'Sila', 'MSI', '1');
INSERT INTO `js_zone` VALUES ('99', '3', 'Naama', 'NAA', '1');
INSERT INTO `js_zone` VALUES ('100', '3', 'Oran', 'ORA', '1');
INSERT INTO `js_zone` VALUES ('101', '3', 'Ouargla', 'OUA', '1');
INSERT INTO `js_zone` VALUES ('102', '3', 'Oum el-Bouaghi', 'OEB', '1');
INSERT INTO `js_zone` VALUES ('103', '3', 'Relizane', 'REL', '1');
INSERT INTO `js_zone` VALUES ('104', '3', 'Saida', 'SAI', '1');
INSERT INTO `js_zone` VALUES ('105', '3', 'Setif', 'SET', '1');
INSERT INTO `js_zone` VALUES ('106', '3', 'Sidi Bel Abbes', 'SBA', '1');
INSERT INTO `js_zone` VALUES ('107', '3', 'Skikda', 'SKI', '1');
INSERT INTO `js_zone` VALUES ('108', '3', 'Souk Ahras', 'SAH', '1');
INSERT INTO `js_zone` VALUES ('109', '3', 'Tamanghasset', 'TAM', '1');
INSERT INTO `js_zone` VALUES ('110', '3', 'Tebessa', 'TEB', '1');
INSERT INTO `js_zone` VALUES ('111', '3', 'Tiaret', 'TIA', '1');
INSERT INTO `js_zone` VALUES ('112', '3', 'Tindouf', 'TIN', '1');
INSERT INTO `js_zone` VALUES ('113', '3', 'Tipaza', 'TIP', '1');
INSERT INTO `js_zone` VALUES ('114', '3', 'Tissemsilt', 'TIS', '1');
INSERT INTO `js_zone` VALUES ('115', '3', 'Tizi Ouzou', 'TOU', '1');
INSERT INTO `js_zone` VALUES ('116', '3', 'Tlemcen', 'TLE', '1');
INSERT INTO `js_zone` VALUES ('117', '4', 'Eastern', 'E', '1');
INSERT INTO `js_zone` VALUES ('118', '4', 'Manu\'a', 'M', '1');
INSERT INTO `js_zone` VALUES ('119', '4', 'Rose Island', 'R', '1');
INSERT INTO `js_zone` VALUES ('120', '4', 'Swains Island', 'S', '1');
INSERT INTO `js_zone` VALUES ('121', '4', 'Western', 'W', '1');
INSERT INTO `js_zone` VALUES ('122', '5', 'Andorra la Vella', 'ALV', '1');
INSERT INTO `js_zone` VALUES ('123', '5', 'Canillo', 'CAN', '1');
INSERT INTO `js_zone` VALUES ('124', '5', 'Encamp', 'ENC', '1');
INSERT INTO `js_zone` VALUES ('125', '5', 'Escaldes-Engordany', 'ESE', '1');
INSERT INTO `js_zone` VALUES ('126', '5', 'La Massana', 'LMA', '1');
INSERT INTO `js_zone` VALUES ('127', '5', 'Ordino', 'ORD', '1');
INSERT INTO `js_zone` VALUES ('128', '5', 'Sant Julia de Loria', 'SJL', '1');
INSERT INTO `js_zone` VALUES ('129', '6', 'Bengo', 'BGO', '1');
INSERT INTO `js_zone` VALUES ('130', '6', 'Benguela', 'BGU', '1');
INSERT INTO `js_zone` VALUES ('131', '6', 'Bie', 'BIE', '1');
INSERT INTO `js_zone` VALUES ('132', '6', 'Cabinda', 'CAB', '1');
INSERT INTO `js_zone` VALUES ('133', '6', 'Cuando-Cubango', 'CCU', '1');
INSERT INTO `js_zone` VALUES ('134', '6', 'Cuanza Norte', 'CNO', '1');
INSERT INTO `js_zone` VALUES ('135', '6', 'Cuanza Sul', 'CUS', '1');
INSERT INTO `js_zone` VALUES ('136', '6', 'Cunene', 'CNN', '1');
INSERT INTO `js_zone` VALUES ('137', '6', 'Huambo', 'HUA', '1');
INSERT INTO `js_zone` VALUES ('138', '6', 'Huila', 'HUI', '1');
INSERT INTO `js_zone` VALUES ('139', '6', 'Luanda', 'LUA', '1');
INSERT INTO `js_zone` VALUES ('140', '6', 'Lunda Norte', 'LNO', '1');
INSERT INTO `js_zone` VALUES ('141', '6', 'Lunda Sul', 'LSU', '1');
INSERT INTO `js_zone` VALUES ('142', '6', 'Malange', 'MAL', '1');
INSERT INTO `js_zone` VALUES ('143', '6', 'Moxico', 'MOX', '1');
INSERT INTO `js_zone` VALUES ('144', '6', 'Namibe', 'NAM', '1');
INSERT INTO `js_zone` VALUES ('145', '6', 'Uige', 'UIG', '1');
INSERT INTO `js_zone` VALUES ('146', '6', 'Zaire', 'ZAI', '1');
INSERT INTO `js_zone` VALUES ('147', '9', 'Saint George', 'ASG', '1');
INSERT INTO `js_zone` VALUES ('148', '9', 'Saint John', 'ASJ', '1');
INSERT INTO `js_zone` VALUES ('149', '9', 'Saint Mary', 'ASM', '1');
INSERT INTO `js_zone` VALUES ('150', '9', 'Saint Paul', 'ASL', '1');
INSERT INTO `js_zone` VALUES ('151', '9', 'Saint Peter', 'ASR', '1');
INSERT INTO `js_zone` VALUES ('152', '9', 'Saint Philip', 'ASH', '1');
INSERT INTO `js_zone` VALUES ('153', '9', 'Barbuda', 'BAR', '1');
INSERT INTO `js_zone` VALUES ('154', '9', 'Redonda', 'RED', '1');
INSERT INTO `js_zone` VALUES ('155', '10', 'Antartida e Islas del Atlantico', 'AN', '1');
INSERT INTO `js_zone` VALUES ('156', '10', 'Buenos Aires', 'BA', '1');
INSERT INTO `js_zone` VALUES ('157', '10', 'Catamarca', 'CA', '1');
INSERT INTO `js_zone` VALUES ('158', '10', 'Chaco', 'CH', '1');
INSERT INTO `js_zone` VALUES ('159', '10', 'Chubut', 'CU', '1');
INSERT INTO `js_zone` VALUES ('160', '10', 'Cordoba', 'CO', '1');
INSERT INTO `js_zone` VALUES ('161', '10', 'Corrientes', 'CR', '1');
INSERT INTO `js_zone` VALUES ('162', '10', 'Distrito Federal', 'DF', '1');
INSERT INTO `js_zone` VALUES ('163', '10', 'Entre Rios', 'ER', '1');
INSERT INTO `js_zone` VALUES ('164', '10', 'Formosa', 'FO', '1');
INSERT INTO `js_zone` VALUES ('165', '10', 'Jujuy', 'JU', '1');
INSERT INTO `js_zone` VALUES ('166', '10', 'La Pampa', 'LP', '1');
INSERT INTO `js_zone` VALUES ('167', '10', 'La Rioja', 'LR', '1');
INSERT INTO `js_zone` VALUES ('168', '10', 'Mendoza', 'ME', '1');
INSERT INTO `js_zone` VALUES ('169', '10', 'Misiones', 'MI', '1');
INSERT INTO `js_zone` VALUES ('170', '10', 'Neuquen', 'NE', '1');
INSERT INTO `js_zone` VALUES ('171', '10', 'Rio Negro', 'RN', '1');
INSERT INTO `js_zone` VALUES ('172', '10', 'Salta', 'SA', '1');
INSERT INTO `js_zone` VALUES ('173', '10', 'San Juan', 'SJ', '1');
INSERT INTO `js_zone` VALUES ('174', '10', 'San Luis', 'SL', '1');
INSERT INTO `js_zone` VALUES ('175', '10', 'Santa Cruz', 'SC', '1');
INSERT INTO `js_zone` VALUES ('176', '10', 'Santa Fe', 'SF', '1');
INSERT INTO `js_zone` VALUES ('177', '10', 'Santiago del Estero', 'SD', '1');
INSERT INTO `js_zone` VALUES ('178', '10', 'Tierra del Fuego', 'TF', '1');
INSERT INTO `js_zone` VALUES ('179', '10', 'Tucuman', 'TU', '1');
INSERT INTO `js_zone` VALUES ('180', '11', 'Aragatsotn', 'AGT', '1');
INSERT INTO `js_zone` VALUES ('181', '11', 'Ararat', 'ARR', '1');
INSERT INTO `js_zone` VALUES ('182', '11', 'Armavir', 'ARM', '1');
INSERT INTO `js_zone` VALUES ('183', '11', 'Geghark\'unik\'', 'GEG', '1');
INSERT INTO `js_zone` VALUES ('184', '11', 'Kotayk\'', 'KOT', '1');
INSERT INTO `js_zone` VALUES ('185', '11', 'Lorri', 'LOR', '1');
INSERT INTO `js_zone` VALUES ('186', '11', 'Shirak', 'SHI', '1');
INSERT INTO `js_zone` VALUES ('187', '11', 'Syunik\'', 'SYU', '1');
INSERT INTO `js_zone` VALUES ('188', '11', 'Tavush', 'TAV', '1');
INSERT INTO `js_zone` VALUES ('189', '11', 'Vayots\' Dzor', 'VAY', '1');
INSERT INTO `js_zone` VALUES ('190', '11', 'Yerevan', 'YER', '1');
INSERT INTO `js_zone` VALUES ('191', '13', 'Australian Capital Territory', 'ACT', '1');
INSERT INTO `js_zone` VALUES ('192', '13', 'New South Wales', 'NSW', '1');
INSERT INTO `js_zone` VALUES ('193', '13', 'Northern Territory', 'NT', '1');
INSERT INTO `js_zone` VALUES ('194', '13', 'Queensland', 'QLD', '1');
INSERT INTO `js_zone` VALUES ('195', '13', 'South Australia', 'SA', '1');
INSERT INTO `js_zone` VALUES ('196', '13', 'Tasmania', 'TAS', '1');
INSERT INTO `js_zone` VALUES ('197', '13', 'Victoria', 'VIC', '1');
INSERT INTO `js_zone` VALUES ('198', '13', 'Western Australia', 'WA', '1');
INSERT INTO `js_zone` VALUES ('199', '14', 'Burgenland', 'BUR', '1');
INSERT INTO `js_zone` VALUES ('200', '14', 'Kärnten', 'KAR', '1');
INSERT INTO `js_zone` VALUES ('201', '14', 'Nieder&ouml;sterreich', 'NOS', '1');
INSERT INTO `js_zone` VALUES ('202', '14', 'Ober&ouml;sterreich', 'OOS', '1');
INSERT INTO `js_zone` VALUES ('203', '14', 'Salzburg', 'SAL', '1');
INSERT INTO `js_zone` VALUES ('204', '14', 'Steiermark', 'STE', '1');
INSERT INTO `js_zone` VALUES ('205', '14', 'Tirol', 'TIR', '1');
INSERT INTO `js_zone` VALUES ('206', '14', 'Vorarlberg', 'VOR', '1');
INSERT INTO `js_zone` VALUES ('207', '14', 'Wien', 'WIE', '1');
INSERT INTO `js_zone` VALUES ('208', '15', 'Ali Bayramli', 'AB', '1');
INSERT INTO `js_zone` VALUES ('209', '15', 'Abseron', 'ABS', '1');
INSERT INTO `js_zone` VALUES ('210', '15', 'AgcabAdi', 'AGC', '1');
INSERT INTO `js_zone` VALUES ('211', '15', 'Agdam', 'AGM', '1');
INSERT INTO `js_zone` VALUES ('212', '15', 'Agdas', 'AGS', '1');
INSERT INTO `js_zone` VALUES ('213', '15', 'Agstafa', 'AGA', '1');
INSERT INTO `js_zone` VALUES ('214', '15', 'Agsu', 'AGU', '1');
INSERT INTO `js_zone` VALUES ('215', '15', 'Astara', 'AST', '1');
INSERT INTO `js_zone` VALUES ('216', '15', 'Baki', 'BA', '1');
INSERT INTO `js_zone` VALUES ('217', '15', 'BabAk', 'BAB', '1');
INSERT INTO `js_zone` VALUES ('218', '15', 'BalakAn', 'BAL', '1');
INSERT INTO `js_zone` VALUES ('219', '15', 'BArdA', 'BAR', '1');
INSERT INTO `js_zone` VALUES ('220', '15', 'Beylaqan', 'BEY', '1');
INSERT INTO `js_zone` VALUES ('221', '15', 'Bilasuvar', 'BIL', '1');
INSERT INTO `js_zone` VALUES ('222', '15', 'Cabrayil', 'CAB', '1');
INSERT INTO `js_zone` VALUES ('223', '15', 'Calilabab', 'CAL', '1');
INSERT INTO `js_zone` VALUES ('224', '15', 'Culfa', 'CUL', '1');
INSERT INTO `js_zone` VALUES ('225', '15', 'Daskasan', 'DAS', '1');
INSERT INTO `js_zone` VALUES ('226', '15', 'Davaci', 'DAV', '1');
INSERT INTO `js_zone` VALUES ('227', '15', 'Fuzuli', 'FUZ', '1');
INSERT INTO `js_zone` VALUES ('228', '15', 'Ganca', 'GA', '1');
INSERT INTO `js_zone` VALUES ('229', '15', 'Gadabay', 'GAD', '1');
INSERT INTO `js_zone` VALUES ('230', '15', 'Goranboy', 'GOR', '1');
INSERT INTO `js_zone` VALUES ('231', '15', 'Goycay', 'GOY', '1');
INSERT INTO `js_zone` VALUES ('232', '15', 'Haciqabul', 'HAC', '1');
INSERT INTO `js_zone` VALUES ('233', '15', 'Imisli', 'IMI', '1');
INSERT INTO `js_zone` VALUES ('234', '15', 'Ismayilli', 'ISM', '1');
INSERT INTO `js_zone` VALUES ('235', '15', 'Kalbacar', 'KAL', '1');
INSERT INTO `js_zone` VALUES ('236', '15', 'Kurdamir', 'KUR', '1');
INSERT INTO `js_zone` VALUES ('237', '15', 'Lankaran', 'LA', '1');
INSERT INTO `js_zone` VALUES ('238', '15', 'Lacin', 'LAC', '1');
INSERT INTO `js_zone` VALUES ('239', '15', 'Lankaran', 'LAN', '1');
INSERT INTO `js_zone` VALUES ('240', '15', 'Lerik', 'LER', '1');
INSERT INTO `js_zone` VALUES ('241', '15', 'Masalli', 'MAS', '1');
INSERT INTO `js_zone` VALUES ('242', '15', 'Mingacevir', 'MI', '1');
INSERT INTO `js_zone` VALUES ('243', '15', 'Naftalan', 'NA', '1');
INSERT INTO `js_zone` VALUES ('244', '15', 'Neftcala', 'NEF', '1');
INSERT INTO `js_zone` VALUES ('245', '15', 'Oguz', 'OGU', '1');
INSERT INTO `js_zone` VALUES ('246', '15', 'Ordubad', 'ORD', '1');
INSERT INTO `js_zone` VALUES ('247', '15', 'Qabala', 'QAB', '1');
INSERT INTO `js_zone` VALUES ('248', '15', 'Qax', 'QAX', '1');
INSERT INTO `js_zone` VALUES ('249', '15', 'Qazax', 'QAZ', '1');
INSERT INTO `js_zone` VALUES ('250', '15', 'Qobustan', 'QOB', '1');
INSERT INTO `js_zone` VALUES ('251', '15', 'Quba', 'QBA', '1');
INSERT INTO `js_zone` VALUES ('252', '15', 'Qubadli', 'QBI', '1');
INSERT INTO `js_zone` VALUES ('253', '15', 'Qusar', 'QUS', '1');
INSERT INTO `js_zone` VALUES ('254', '15', 'Saki', 'SA', '1');
INSERT INTO `js_zone` VALUES ('255', '15', 'Saatli', 'SAT', '1');
INSERT INTO `js_zone` VALUES ('256', '15', 'Sabirabad', 'SAB', '1');
INSERT INTO `js_zone` VALUES ('257', '15', 'Sadarak', 'SAD', '1');
INSERT INTO `js_zone` VALUES ('258', '15', 'Sahbuz', 'SAH', '1');
INSERT INTO `js_zone` VALUES ('259', '15', 'Saki', 'SAK', '1');
INSERT INTO `js_zone` VALUES ('260', '15', 'Salyan', 'SAL', '1');
INSERT INTO `js_zone` VALUES ('261', '15', 'Sumqayit', 'SM', '1');
INSERT INTO `js_zone` VALUES ('262', '15', 'Samaxi', 'SMI', '1');
INSERT INTO `js_zone` VALUES ('263', '15', 'Samkir', 'SKR', '1');
INSERT INTO `js_zone` VALUES ('264', '15', 'Samux', 'SMX', '1');
INSERT INTO `js_zone` VALUES ('265', '15', 'Sarur', 'SAR', '1');
INSERT INTO `js_zone` VALUES ('266', '15', 'Siyazan', 'SIY', '1');
INSERT INTO `js_zone` VALUES ('267', '15', 'Susa', 'SS', '1');
INSERT INTO `js_zone` VALUES ('268', '15', 'Susa', 'SUS', '1');
INSERT INTO `js_zone` VALUES ('269', '15', 'Tartar', 'TAR', '1');
INSERT INTO `js_zone` VALUES ('270', '15', 'Tovuz', 'TOV', '1');
INSERT INTO `js_zone` VALUES ('271', '15', 'Ucar', 'UCA', '1');
INSERT INTO `js_zone` VALUES ('272', '15', 'Xankandi', 'XA', '1');
INSERT INTO `js_zone` VALUES ('273', '15', 'Xacmaz', 'XAC', '1');
INSERT INTO `js_zone` VALUES ('274', '15', 'Xanlar', 'XAN', '1');
INSERT INTO `js_zone` VALUES ('275', '15', 'Xizi', 'XIZ', '1');
INSERT INTO `js_zone` VALUES ('276', '15', 'Xocali', 'XCI', '1');
INSERT INTO `js_zone` VALUES ('277', '15', 'Xocavand', 'XVD', '1');
INSERT INTO `js_zone` VALUES ('278', '15', 'Yardimli', 'YAR', '1');
INSERT INTO `js_zone` VALUES ('279', '15', 'Yevlax', 'YEV', '1');
INSERT INTO `js_zone` VALUES ('280', '15', 'Zangilan', 'ZAN', '1');
INSERT INTO `js_zone` VALUES ('281', '15', 'Zaqatala', 'ZAQ', '1');
INSERT INTO `js_zone` VALUES ('282', '15', 'Zardab', 'ZAR', '1');
INSERT INTO `js_zone` VALUES ('283', '15', 'Naxcivan', 'NX', '1');
INSERT INTO `js_zone` VALUES ('284', '16', 'Acklins', 'ACK', '1');
INSERT INTO `js_zone` VALUES ('285', '16', 'Berry Islands', 'BER', '1');
INSERT INTO `js_zone` VALUES ('286', '16', 'Bimini', 'BIM', '1');
INSERT INTO `js_zone` VALUES ('287', '16', 'Black Point', 'BLK', '1');
INSERT INTO `js_zone` VALUES ('288', '16', 'Cat Island', 'CAT', '1');
INSERT INTO `js_zone` VALUES ('289', '16', 'Central Abaco', 'CAB', '1');
INSERT INTO `js_zone` VALUES ('290', '16', 'Central Andros', 'CAN', '1');
INSERT INTO `js_zone` VALUES ('291', '16', 'Central Eleuthera', 'CEL', '1');
INSERT INTO `js_zone` VALUES ('292', '16', 'City of Freeport', 'FRE', '1');
INSERT INTO `js_zone` VALUES ('293', '16', 'Crooked Island', 'CRO', '1');
INSERT INTO `js_zone` VALUES ('294', '16', 'East Grand Bahama', 'EGB', '1');
INSERT INTO `js_zone` VALUES ('295', '16', 'Exuma', 'EXU', '1');
INSERT INTO `js_zone` VALUES ('296', '16', 'Grand Cay', 'GRD', '1');
INSERT INTO `js_zone` VALUES ('297', '16', 'Harbour Island', 'HAR', '1');
INSERT INTO `js_zone` VALUES ('298', '16', 'Hope Town', 'HOP', '1');
INSERT INTO `js_zone` VALUES ('299', '16', 'Inagua', 'INA', '1');
INSERT INTO `js_zone` VALUES ('300', '16', 'Long Island', 'LNG', '1');
INSERT INTO `js_zone` VALUES ('301', '16', 'Mangrove Cay', 'MAN', '1');
INSERT INTO `js_zone` VALUES ('302', '16', 'Mayaguana', 'MAY', '1');
INSERT INTO `js_zone` VALUES ('303', '16', 'Moore\'s Island', 'MOO', '1');
INSERT INTO `js_zone` VALUES ('304', '16', 'North Abaco', 'NAB', '1');
INSERT INTO `js_zone` VALUES ('305', '16', 'North Andros', 'NAN', '1');
INSERT INTO `js_zone` VALUES ('306', '16', 'North Eleuthera', 'NEL', '1');
INSERT INTO `js_zone` VALUES ('307', '16', 'Ragged Island', 'RAG', '1');
INSERT INTO `js_zone` VALUES ('308', '16', 'Rum Cay', 'RUM', '1');
INSERT INTO `js_zone` VALUES ('309', '16', 'San Salvador', 'SAL', '1');
INSERT INTO `js_zone` VALUES ('310', '16', 'South Abaco', 'SAB', '1');
INSERT INTO `js_zone` VALUES ('311', '16', 'South Andros', 'SAN', '1');
INSERT INTO `js_zone` VALUES ('312', '16', 'South Eleuthera', 'SEL', '1');
INSERT INTO `js_zone` VALUES ('313', '16', 'Spanish Wells', 'SWE', '1');
INSERT INTO `js_zone` VALUES ('314', '16', 'West Grand Bahama', 'WGB', '1');
INSERT INTO `js_zone` VALUES ('315', '17', 'Capital', 'CAP', '1');
INSERT INTO `js_zone` VALUES ('316', '17', 'Central', 'CEN', '1');
INSERT INTO `js_zone` VALUES ('317', '17', 'Muharraq', 'MUH', '1');
INSERT INTO `js_zone` VALUES ('318', '17', 'Northern', 'NOR', '1');
INSERT INTO `js_zone` VALUES ('319', '17', 'Southern', 'SOU', '1');
INSERT INTO `js_zone` VALUES ('320', '18', 'Barisal', 'BAR', '1');
INSERT INTO `js_zone` VALUES ('321', '18', 'Chittagong', 'CHI', '1');
INSERT INTO `js_zone` VALUES ('322', '18', 'Dhaka', 'DHA', '1');
INSERT INTO `js_zone` VALUES ('323', '18', 'Khulna', 'KHU', '1');
INSERT INTO `js_zone` VALUES ('324', '18', 'Rajshahi', 'RAJ', '1');
INSERT INTO `js_zone` VALUES ('325', '18', 'Sylhet', 'SYL', '1');
INSERT INTO `js_zone` VALUES ('326', '19', 'Christ Church', 'CC', '1');
INSERT INTO `js_zone` VALUES ('327', '19', 'Saint Andrew', 'AND', '1');
INSERT INTO `js_zone` VALUES ('328', '19', 'Saint George', 'GEO', '1');
INSERT INTO `js_zone` VALUES ('329', '19', 'Saint James', 'JAM', '1');
INSERT INTO `js_zone` VALUES ('330', '19', 'Saint John', 'JOH', '1');
INSERT INTO `js_zone` VALUES ('331', '19', 'Saint Joseph', 'JOS', '1');
INSERT INTO `js_zone` VALUES ('332', '19', 'Saint Lucy', 'LUC', '1');
INSERT INTO `js_zone` VALUES ('333', '19', 'Saint Michael', 'MIC', '1');
INSERT INTO `js_zone` VALUES ('334', '19', 'Saint Peter', 'PET', '1');
INSERT INTO `js_zone` VALUES ('335', '19', 'Saint Philip', 'PHI', '1');
INSERT INTO `js_zone` VALUES ('336', '19', 'Saint Thomas', 'THO', '1');
INSERT INTO `js_zone` VALUES ('337', '20', 'Brestskaya (Brest)', 'BR', '1');
INSERT INTO `js_zone` VALUES ('338', '20', 'Homyel\'skaya (Homyel\')', 'HO', '1');
INSERT INTO `js_zone` VALUES ('339', '20', 'Horad Minsk', 'HM', '1');
INSERT INTO `js_zone` VALUES ('340', '20', 'Hrodzyenskaya (Hrodna)', 'HR', '1');
INSERT INTO `js_zone` VALUES ('341', '20', 'Mahilyowskaya (Mahilyow)', 'MA', '1');
INSERT INTO `js_zone` VALUES ('342', '20', 'Minskaya', 'MI', '1');
INSERT INTO `js_zone` VALUES ('343', '20', 'Vitsyebskaya (Vitsyebsk)', 'VI', '1');
INSERT INTO `js_zone` VALUES ('344', '21', 'Antwerpen', 'VAN', '1');
INSERT INTO `js_zone` VALUES ('345', '21', 'Brabant Wallon', 'WBR', '1');
INSERT INTO `js_zone` VALUES ('346', '21', 'Hainaut', 'WHT', '1');
INSERT INTO `js_zone` VALUES ('347', '21', 'Liège', 'WLG', '1');
INSERT INTO `js_zone` VALUES ('348', '21', 'Limburg', 'VLI', '1');
INSERT INTO `js_zone` VALUES ('349', '21', 'Luxembourg', 'WLX', '1');
INSERT INTO `js_zone` VALUES ('350', '21', 'Namur', 'WNA', '1');
INSERT INTO `js_zone` VALUES ('351', '21', 'Oost-Vlaanderen', 'VOV', '1');
INSERT INTO `js_zone` VALUES ('352', '21', 'Vlaams Brabant', 'VBR', '1');
INSERT INTO `js_zone` VALUES ('353', '21', 'West-Vlaanderen', 'VWV', '1');
INSERT INTO `js_zone` VALUES ('354', '22', 'Belize', 'BZ', '1');
INSERT INTO `js_zone` VALUES ('355', '22', 'Cayo', 'CY', '1');
INSERT INTO `js_zone` VALUES ('356', '22', 'Corozal', 'CR', '1');
INSERT INTO `js_zone` VALUES ('357', '22', 'Orange Walk', 'OW', '1');
INSERT INTO `js_zone` VALUES ('358', '22', 'Stann Creek', 'SC', '1');
INSERT INTO `js_zone` VALUES ('359', '22', 'Toledo', 'TO', '1');
INSERT INTO `js_zone` VALUES ('360', '23', 'Alibori', 'AL', '1');
INSERT INTO `js_zone` VALUES ('361', '23', 'Atakora', 'AK', '1');
INSERT INTO `js_zone` VALUES ('362', '23', 'Atlantique', 'AQ', '1');
INSERT INTO `js_zone` VALUES ('363', '23', 'Borgou', 'BO', '1');
INSERT INTO `js_zone` VALUES ('364', '23', 'Collines', 'CO', '1');
INSERT INTO `js_zone` VALUES ('365', '23', 'Donga', 'DO', '1');
INSERT INTO `js_zone` VALUES ('366', '23', 'Kouffo', 'KO', '1');
INSERT INTO `js_zone` VALUES ('367', '23', 'Littoral', 'LI', '1');
INSERT INTO `js_zone` VALUES ('368', '23', 'Mono', 'MO', '1');
INSERT INTO `js_zone` VALUES ('369', '23', 'Oueme', 'OU', '1');
INSERT INTO `js_zone` VALUES ('370', '23', 'Plateau', 'PL', '1');
INSERT INTO `js_zone` VALUES ('371', '23', 'Zou', 'ZO', '1');
INSERT INTO `js_zone` VALUES ('372', '24', 'Devonshire', 'DS', '1');
INSERT INTO `js_zone` VALUES ('373', '24', 'Hamilton City', 'HC', '1');
INSERT INTO `js_zone` VALUES ('374', '24', 'Hamilton', 'HA', '1');
INSERT INTO `js_zone` VALUES ('375', '24', 'Paget', 'PG', '1');
INSERT INTO `js_zone` VALUES ('376', '24', 'Pembroke', 'PB', '1');
INSERT INTO `js_zone` VALUES ('377', '24', 'Saint George City', 'GC', '1');
INSERT INTO `js_zone` VALUES ('378', '24', 'Saint George\'s', 'SG', '1');
INSERT INTO `js_zone` VALUES ('379', '24', 'Sandys', 'SA', '1');
INSERT INTO `js_zone` VALUES ('380', '24', 'Smith\'s', 'SM', '1');
INSERT INTO `js_zone` VALUES ('381', '24', 'Southampton', 'SH', '1');
INSERT INTO `js_zone` VALUES ('382', '24', 'Warwick', 'WA', '1');
INSERT INTO `js_zone` VALUES ('383', '25', 'Bumthang', 'BUM', '1');
INSERT INTO `js_zone` VALUES ('384', '25', 'Chukha', 'CHU', '1');
INSERT INTO `js_zone` VALUES ('385', '25', 'Dagana', 'DAG', '1');
INSERT INTO `js_zone` VALUES ('386', '25', 'Gasa', 'GAS', '1');
INSERT INTO `js_zone` VALUES ('387', '25', 'Haa', 'HAA', '1');
INSERT INTO `js_zone` VALUES ('388', '25', 'Lhuntse', 'LHU', '1');
INSERT INTO `js_zone` VALUES ('389', '25', 'Mongar', 'MON', '1');
INSERT INTO `js_zone` VALUES ('390', '25', 'Paro', 'PAR', '1');
INSERT INTO `js_zone` VALUES ('391', '25', 'Pemagatshel', 'PEM', '1');
INSERT INTO `js_zone` VALUES ('392', '25', 'Punakha', 'PUN', '1');
INSERT INTO `js_zone` VALUES ('393', '25', 'Samdrup Jongkhar', 'SJO', '1');
INSERT INTO `js_zone` VALUES ('394', '25', 'Samtse', 'SAT', '1');
INSERT INTO `js_zone` VALUES ('395', '25', 'Sarpang', 'SAR', '1');
INSERT INTO `js_zone` VALUES ('396', '25', 'Thimphu', 'THI', '1');
INSERT INTO `js_zone` VALUES ('397', '25', 'Trashigang', 'TRG', '1');
INSERT INTO `js_zone` VALUES ('398', '25', 'Trashiyangste', 'TRY', '1');
INSERT INTO `js_zone` VALUES ('399', '25', 'Trongsa', 'TRO', '1');
INSERT INTO `js_zone` VALUES ('400', '25', 'Tsirang', 'TSI', '1');
INSERT INTO `js_zone` VALUES ('401', '25', 'Wangdue Phodrang', 'WPH', '1');
INSERT INTO `js_zone` VALUES ('402', '25', 'Zhemgang', 'ZHE', '1');
INSERT INTO `js_zone` VALUES ('403', '26', 'Beni', 'BEN', '1');
INSERT INTO `js_zone` VALUES ('404', '26', 'Chuquisaca', 'CHU', '1');
INSERT INTO `js_zone` VALUES ('405', '26', 'Cochabamba', 'COC', '1');
INSERT INTO `js_zone` VALUES ('406', '26', 'La Paz', 'LPZ', '1');
INSERT INTO `js_zone` VALUES ('407', '26', 'Oruro', 'ORU', '1');
INSERT INTO `js_zone` VALUES ('408', '26', 'Pando', 'PAN', '1');
INSERT INTO `js_zone` VALUES ('409', '26', 'Potosi', 'POT', '1');
INSERT INTO `js_zone` VALUES ('410', '26', 'Santa Cruz', 'SCZ', '1');
INSERT INTO `js_zone` VALUES ('411', '26', 'Tarija', 'TAR', '1');
INSERT INTO `js_zone` VALUES ('412', '27', 'Brcko district', 'BRO', '1');
INSERT INTO `js_zone` VALUES ('413', '27', 'Unsko-Sanski Kanton', 'FUS', '1');
INSERT INTO `js_zone` VALUES ('414', '27', 'Posavski Kanton', 'FPO', '1');
INSERT INTO `js_zone` VALUES ('415', '27', 'Tuzlanski Kanton', 'FTU', '1');
INSERT INTO `js_zone` VALUES ('416', '27', 'Zenicko-Dobojski Kanton', 'FZE', '1');
INSERT INTO `js_zone` VALUES ('417', '27', 'Bosanskopodrinjski Kanton', 'FBP', '1');
INSERT INTO `js_zone` VALUES ('418', '27', 'Srednjebosanski Kanton', 'FSB', '1');
INSERT INTO `js_zone` VALUES ('419', '27', 'Hercegovacko-neretvanski Kanton', 'FHN', '1');
INSERT INTO `js_zone` VALUES ('420', '27', 'Zapadnohercegovacka Zupanija', 'FZH', '1');
INSERT INTO `js_zone` VALUES ('421', '27', 'Kanton Sarajevo', 'FSA', '1');
INSERT INTO `js_zone` VALUES ('422', '27', 'Zapadnobosanska', 'FZA', '1');
INSERT INTO `js_zone` VALUES ('423', '27', 'Banja Luka', 'SBL', '1');
INSERT INTO `js_zone` VALUES ('424', '27', 'Doboj', 'SDO', '1');
INSERT INTO `js_zone` VALUES ('425', '27', 'Bijeljina', 'SBI', '1');
INSERT INTO `js_zone` VALUES ('426', '27', 'Vlasenica', 'SVL', '1');
INSERT INTO `js_zone` VALUES ('427', '27', 'Sarajevo-Romanija or Sokolac', 'SSR', '1');
INSERT INTO `js_zone` VALUES ('428', '27', 'Foca', 'SFO', '1');
INSERT INTO `js_zone` VALUES ('429', '27', 'Trebinje', 'STR', '1');
INSERT INTO `js_zone` VALUES ('430', '28', 'Central', 'CE', '1');
INSERT INTO `js_zone` VALUES ('431', '28', 'Ghanzi', 'GH', '1');
INSERT INTO `js_zone` VALUES ('432', '28', 'Kgalagadi', 'KD', '1');
INSERT INTO `js_zone` VALUES ('433', '28', 'Kgatleng', 'KT', '1');
INSERT INTO `js_zone` VALUES ('434', '28', 'Kweneng', 'KW', '1');
INSERT INTO `js_zone` VALUES ('435', '28', 'Ngamiland', 'NG', '1');
INSERT INTO `js_zone` VALUES ('436', '28', 'North East', 'NE', '1');
INSERT INTO `js_zone` VALUES ('437', '28', 'North West', 'NW', '1');
INSERT INTO `js_zone` VALUES ('438', '28', 'South East', 'SE', '1');
INSERT INTO `js_zone` VALUES ('439', '28', 'Southern', 'SO', '1');
INSERT INTO `js_zone` VALUES ('440', '30', 'Acre', 'AC', '1');
INSERT INTO `js_zone` VALUES ('441', '30', 'Alagoas', 'AL', '1');
INSERT INTO `js_zone` VALUES ('442', '30', 'Amapá', 'AP', '1');
INSERT INTO `js_zone` VALUES ('443', '30', 'Amazonas', 'AM', '1');
INSERT INTO `js_zone` VALUES ('444', '30', 'Bahia', 'BA', '1');
INSERT INTO `js_zone` VALUES ('445', '30', 'Ceará', 'CE', '1');
INSERT INTO `js_zone` VALUES ('446', '30', 'Distrito Federal', 'DF', '1');
INSERT INTO `js_zone` VALUES ('447', '30', 'Espírito Santo', 'ES', '1');
INSERT INTO `js_zone` VALUES ('448', '30', 'Goiás', 'GO', '1');
INSERT INTO `js_zone` VALUES ('449', '30', 'Maranhão', 'MA', '1');
INSERT INTO `js_zone` VALUES ('450', '30', 'Mato Grosso', 'MT', '1');
INSERT INTO `js_zone` VALUES ('451', '30', 'Mato Grosso do Sul', 'MS', '1');
INSERT INTO `js_zone` VALUES ('452', '30', 'Minas Gerais', 'MG', '1');
INSERT INTO `js_zone` VALUES ('453', '30', 'Pará', 'PA', '1');
INSERT INTO `js_zone` VALUES ('454', '30', 'Paraíba', 'PB', '1');
INSERT INTO `js_zone` VALUES ('455', '30', 'Paraná', 'PR', '1');
INSERT INTO `js_zone` VALUES ('456', '30', 'Pernambuco', 'PE', '1');
INSERT INTO `js_zone` VALUES ('457', '30', 'Piauí', 'PI', '1');
INSERT INTO `js_zone` VALUES ('458', '30', 'Rio de Janeiro', 'RJ', '1');
INSERT INTO `js_zone` VALUES ('459', '30', 'Rio Grande do Norte', 'RN', '1');
INSERT INTO `js_zone` VALUES ('460', '30', 'Rio Grande do Sul', 'RS', '1');
INSERT INTO `js_zone` VALUES ('461', '30', 'Rondônia', 'RO', '1');
INSERT INTO `js_zone` VALUES ('462', '30', 'Roraima', 'RR', '1');
INSERT INTO `js_zone` VALUES ('463', '30', 'Santa Catarina', 'SC', '1');
INSERT INTO `js_zone` VALUES ('464', '30', 'São Paulo', 'SP', '1');
INSERT INTO `js_zone` VALUES ('465', '30', 'Sergipe', 'SE', '1');
INSERT INTO `js_zone` VALUES ('466', '30', 'Tocantins', 'TO', '1');
INSERT INTO `js_zone` VALUES ('467', '31', 'Peros Banhos', 'PB', '1');
INSERT INTO `js_zone` VALUES ('468', '31', 'Salomon Islands', 'SI', '1');
INSERT INTO `js_zone` VALUES ('469', '31', 'Nelsons Island', 'NI', '1');
INSERT INTO `js_zone` VALUES ('470', '31', 'Three Brothers', 'TB', '1');
INSERT INTO `js_zone` VALUES ('471', '31', 'Eagle Islands', 'EA', '1');
INSERT INTO `js_zone` VALUES ('472', '31', 'Danger Island', 'DI', '1');
INSERT INTO `js_zone` VALUES ('473', '31', 'Egmont Islands', 'EG', '1');
INSERT INTO `js_zone` VALUES ('474', '31', 'Diego Garcia', 'DG', '1');
INSERT INTO `js_zone` VALUES ('475', '32', 'Belait', 'BEL', '1');
INSERT INTO `js_zone` VALUES ('476', '32', 'Brunei and Muara', 'BRM', '1');
INSERT INTO `js_zone` VALUES ('477', '32', 'Temburong', 'TEM', '1');
INSERT INTO `js_zone` VALUES ('478', '32', 'Tutong', 'TUT', '1');
INSERT INTO `js_zone` VALUES ('479', '33', 'Blagoevgrad', '', '1');
INSERT INTO `js_zone` VALUES ('480', '33', 'Burgas', '', '1');
INSERT INTO `js_zone` VALUES ('481', '33', 'Dobrich', '', '1');
INSERT INTO `js_zone` VALUES ('482', '33', 'Gabrovo', '', '1');
INSERT INTO `js_zone` VALUES ('483', '33', 'Haskovo', '', '1');
INSERT INTO `js_zone` VALUES ('484', '33', 'Kardjali', '', '1');
INSERT INTO `js_zone` VALUES ('485', '33', 'Kyustendil', '', '1');
INSERT INTO `js_zone` VALUES ('486', '33', 'Lovech', '', '1');
INSERT INTO `js_zone` VALUES ('487', '33', 'Montana', '', '1');
INSERT INTO `js_zone` VALUES ('488', '33', 'Pazardjik', '', '1');
INSERT INTO `js_zone` VALUES ('489', '33', 'Pernik', '', '1');
INSERT INTO `js_zone` VALUES ('490', '33', 'Pleven', '', '1');
INSERT INTO `js_zone` VALUES ('491', '33', 'Plovdiv', '', '1');
INSERT INTO `js_zone` VALUES ('492', '33', 'Razgrad', '', '1');
INSERT INTO `js_zone` VALUES ('493', '33', 'Shumen', '', '1');
INSERT INTO `js_zone` VALUES ('494', '33', 'Silistra', '', '1');
INSERT INTO `js_zone` VALUES ('495', '33', 'Sliven', '', '1');
INSERT INTO `js_zone` VALUES ('496', '33', 'Smolyan', '', '1');
INSERT INTO `js_zone` VALUES ('497', '33', 'Sofia', '', '1');
INSERT INTO `js_zone` VALUES ('498', '33', 'Sofia - town', '', '1');
INSERT INTO `js_zone` VALUES ('499', '33', 'Stara Zagora', '', '1');
INSERT INTO `js_zone` VALUES ('500', '33', 'Targovishte', '', '1');
INSERT INTO `js_zone` VALUES ('501', '33', 'Varna', '', '1');
INSERT INTO `js_zone` VALUES ('502', '33', 'Veliko Tarnovo', '', '1');
INSERT INTO `js_zone` VALUES ('503', '33', 'Vidin', '', '1');
INSERT INTO `js_zone` VALUES ('504', '33', 'Vratza', '', '1');
INSERT INTO `js_zone` VALUES ('505', '33', 'Yambol', '', '1');
INSERT INTO `js_zone` VALUES ('506', '34', 'Bale', 'BAL', '1');
INSERT INTO `js_zone` VALUES ('507', '34', 'Bam', 'BAM', '1');
INSERT INTO `js_zone` VALUES ('508', '34', 'Banwa', 'BAN', '1');
INSERT INTO `js_zone` VALUES ('509', '34', 'Bazega', 'BAZ', '1');
INSERT INTO `js_zone` VALUES ('510', '34', 'Bougouriba', 'BOR', '1');
INSERT INTO `js_zone` VALUES ('511', '34', 'Boulgou', 'BLG', '1');
INSERT INTO `js_zone` VALUES ('512', '34', 'Boulkiemde', 'BOK', '1');
INSERT INTO `js_zone` VALUES ('513', '34', 'Comoe', 'COM', '1');
INSERT INTO `js_zone` VALUES ('514', '34', 'Ganzourgou', 'GAN', '1');
INSERT INTO `js_zone` VALUES ('515', '34', 'Gnagna', 'GNA', '1');
INSERT INTO `js_zone` VALUES ('516', '34', 'Gourma', 'GOU', '1');
INSERT INTO `js_zone` VALUES ('517', '34', 'Houet', 'HOU', '1');
INSERT INTO `js_zone` VALUES ('518', '34', 'Ioba', 'IOA', '1');
INSERT INTO `js_zone` VALUES ('519', '34', 'Kadiogo', 'KAD', '1');
INSERT INTO `js_zone` VALUES ('520', '34', 'Kenedougou', 'KEN', '1');
INSERT INTO `js_zone` VALUES ('521', '34', 'Komondjari', 'KOD', '1');
INSERT INTO `js_zone` VALUES ('522', '34', 'Kompienga', 'KOP', '1');
INSERT INTO `js_zone` VALUES ('523', '34', 'Kossi', 'KOS', '1');
INSERT INTO `js_zone` VALUES ('524', '34', 'Koulpelogo', 'KOL', '1');
INSERT INTO `js_zone` VALUES ('525', '34', 'Kouritenga', 'KOT', '1');
INSERT INTO `js_zone` VALUES ('526', '34', 'Kourweogo', 'KOW', '1');
INSERT INTO `js_zone` VALUES ('527', '34', 'Leraba', 'LER', '1');
INSERT INTO `js_zone` VALUES ('528', '34', 'Loroum', 'LOR', '1');
INSERT INTO `js_zone` VALUES ('529', '34', 'Mouhoun', 'MOU', '1');
INSERT INTO `js_zone` VALUES ('530', '34', 'Nahouri', 'NAH', '1');
INSERT INTO `js_zone` VALUES ('531', '34', 'Namentenga', 'NAM', '1');
INSERT INTO `js_zone` VALUES ('532', '34', 'Nayala', 'NAY', '1');
INSERT INTO `js_zone` VALUES ('533', '34', 'Noumbiel', 'NOU', '1');
INSERT INTO `js_zone` VALUES ('534', '34', 'Oubritenga', 'OUB', '1');
INSERT INTO `js_zone` VALUES ('535', '34', 'Oudalan', 'OUD', '1');
INSERT INTO `js_zone` VALUES ('536', '34', 'Passore', 'PAS', '1');
INSERT INTO `js_zone` VALUES ('537', '34', 'Poni', 'PON', '1');
INSERT INTO `js_zone` VALUES ('538', '34', 'Sanguie', 'SAG', '1');
INSERT INTO `js_zone` VALUES ('539', '34', 'Sanmatenga', 'SAM', '1');
INSERT INTO `js_zone` VALUES ('540', '34', 'Seno', 'SEN', '1');
INSERT INTO `js_zone` VALUES ('541', '34', 'Sissili', 'SIS', '1');
INSERT INTO `js_zone` VALUES ('542', '34', 'Soum', 'SOM', '1');
INSERT INTO `js_zone` VALUES ('543', '34', 'Sourou', 'SOR', '1');
INSERT INTO `js_zone` VALUES ('544', '34', 'Tapoa', 'TAP', '1');
INSERT INTO `js_zone` VALUES ('545', '34', 'Tuy', 'TUY', '1');
INSERT INTO `js_zone` VALUES ('546', '34', 'Yagha', 'YAG', '1');
INSERT INTO `js_zone` VALUES ('547', '34', 'Yatenga', 'YAT', '1');
INSERT INTO `js_zone` VALUES ('548', '34', 'Ziro', 'ZIR', '1');
INSERT INTO `js_zone` VALUES ('549', '34', 'Zondoma', 'ZOD', '1');
INSERT INTO `js_zone` VALUES ('550', '34', 'Zoundweogo', 'ZOW', '1');
INSERT INTO `js_zone` VALUES ('551', '35', 'Bubanza', 'BB', '1');
INSERT INTO `js_zone` VALUES ('552', '35', 'Bujumbura', 'BJ', '1');
INSERT INTO `js_zone` VALUES ('553', '35', 'Bururi', 'BR', '1');
INSERT INTO `js_zone` VALUES ('554', '35', 'Cankuzo', 'CA', '1');
INSERT INTO `js_zone` VALUES ('555', '35', 'Cibitoke', 'CI', '1');
INSERT INTO `js_zone` VALUES ('556', '35', 'Gitega', 'GI', '1');
INSERT INTO `js_zone` VALUES ('557', '35', 'Karuzi', 'KR', '1');
INSERT INTO `js_zone` VALUES ('558', '35', 'Kayanza', 'KY', '1');
INSERT INTO `js_zone` VALUES ('559', '35', 'Kirundo', 'KI', '1');
INSERT INTO `js_zone` VALUES ('560', '35', 'Makamba', 'MA', '1');
INSERT INTO `js_zone` VALUES ('561', '35', 'Muramvya', 'MU', '1');
INSERT INTO `js_zone` VALUES ('562', '35', 'Muyinga', 'MY', '1');
INSERT INTO `js_zone` VALUES ('563', '35', 'Mwaro', 'MW', '1');
INSERT INTO `js_zone` VALUES ('564', '35', 'Ngozi', 'NG', '1');
INSERT INTO `js_zone` VALUES ('565', '35', 'Rutana', 'RT', '1');
INSERT INTO `js_zone` VALUES ('566', '35', 'Ruyigi', 'RY', '1');
INSERT INTO `js_zone` VALUES ('567', '36', 'Phnom Penh', 'PP', '1');
INSERT INTO `js_zone` VALUES ('568', '36', 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', '1');
INSERT INTO `js_zone` VALUES ('569', '36', 'Pailin', 'PA', '1');
INSERT INTO `js_zone` VALUES ('570', '36', 'Keb', 'KB', '1');
INSERT INTO `js_zone` VALUES ('571', '36', 'Banteay Meanchey', 'BM', '1');
INSERT INTO `js_zone` VALUES ('572', '36', 'Battambang', 'BA', '1');
INSERT INTO `js_zone` VALUES ('573', '36', 'Kampong Cham', 'KM', '1');
INSERT INTO `js_zone` VALUES ('574', '36', 'Kampong Chhnang', 'KN', '1');
INSERT INTO `js_zone` VALUES ('575', '36', 'Kampong Speu', 'KU', '1');
INSERT INTO `js_zone` VALUES ('576', '36', 'Kampong Som', 'KO', '1');
INSERT INTO `js_zone` VALUES ('577', '36', 'Kampong Thom', 'KT', '1');
INSERT INTO `js_zone` VALUES ('578', '36', 'Kampot', 'KP', '1');
INSERT INTO `js_zone` VALUES ('579', '36', 'Kandal', 'KL', '1');
INSERT INTO `js_zone` VALUES ('580', '36', 'Kaoh Kong', 'KK', '1');
INSERT INTO `js_zone` VALUES ('581', '36', 'Kratie', 'KR', '1');
INSERT INTO `js_zone` VALUES ('582', '36', 'Mondul Kiri', 'MK', '1');
INSERT INTO `js_zone` VALUES ('583', '36', 'Oddar Meancheay', 'OM', '1');
INSERT INTO `js_zone` VALUES ('584', '36', 'Pursat', 'PU', '1');
INSERT INTO `js_zone` VALUES ('585', '36', 'Preah Vihear', 'PR', '1');
INSERT INTO `js_zone` VALUES ('586', '36', 'Prey Veng', 'PG', '1');
INSERT INTO `js_zone` VALUES ('587', '36', 'Ratanak Kiri', 'RK', '1');
INSERT INTO `js_zone` VALUES ('588', '36', 'Siemreap', 'SI', '1');
INSERT INTO `js_zone` VALUES ('589', '36', 'Stung Treng', 'ST', '1');
INSERT INTO `js_zone` VALUES ('590', '36', 'Svay Rieng', 'SR', '1');
INSERT INTO `js_zone` VALUES ('591', '36', 'Takeo', 'TK', '1');
INSERT INTO `js_zone` VALUES ('592', '37', 'Adamawa (Adamaoua)', 'ADA', '1');
INSERT INTO `js_zone` VALUES ('593', '37', 'Centre', 'CEN', '1');
INSERT INTO `js_zone` VALUES ('594', '37', 'East (Est)', 'EST', '1');
INSERT INTO `js_zone` VALUES ('595', '37', 'Extreme North (Extreme-Nord)', 'EXN', '1');
INSERT INTO `js_zone` VALUES ('596', '37', 'Littoral', 'LIT', '1');
INSERT INTO `js_zone` VALUES ('597', '37', 'North (Nord)', 'NOR', '1');
INSERT INTO `js_zone` VALUES ('598', '37', 'Northwest (Nord-Ouest)', 'NOT', '1');
INSERT INTO `js_zone` VALUES ('599', '37', 'West (Ouest)', 'OUE', '1');
INSERT INTO `js_zone` VALUES ('600', '37', 'South (Sud)', 'SUD', '1');
INSERT INTO `js_zone` VALUES ('601', '37', 'Southwest (Sud-Ouest).', 'SOU', '1');
INSERT INTO `js_zone` VALUES ('602', '38', 'Alberta', 'AB', '1');
INSERT INTO `js_zone` VALUES ('603', '38', 'British Columbia', 'BC', '1');
INSERT INTO `js_zone` VALUES ('604', '38', 'Manitoba', 'MB', '1');
INSERT INTO `js_zone` VALUES ('605', '38', 'New Brunswick', 'NB', '1');
INSERT INTO `js_zone` VALUES ('606', '38', 'Newfoundland and Labrador', 'NL', '1');
INSERT INTO `js_zone` VALUES ('607', '38', 'Northwest Territories', 'NT', '1');
INSERT INTO `js_zone` VALUES ('608', '38', 'Nova Scotia', 'NS', '1');
INSERT INTO `js_zone` VALUES ('609', '38', 'Nunavut', 'NU', '1');
INSERT INTO `js_zone` VALUES ('610', '38', 'Ontario', 'ON', '1');
INSERT INTO `js_zone` VALUES ('611', '38', 'Prince Edward Island', 'PE', '1');
INSERT INTO `js_zone` VALUES ('612', '38', 'Qu&eacute;bec', 'QC', '1');
INSERT INTO `js_zone` VALUES ('613', '38', 'Saskatchewan', 'SK', '1');
INSERT INTO `js_zone` VALUES ('614', '38', 'Yukon Territory', 'YT', '1');
INSERT INTO `js_zone` VALUES ('615', '39', 'Boa Vista', 'BV', '1');
INSERT INTO `js_zone` VALUES ('616', '39', 'Brava', 'BR', '1');
INSERT INTO `js_zone` VALUES ('617', '39', 'Calheta de Sao Miguel', 'CS', '1');
INSERT INTO `js_zone` VALUES ('618', '39', 'Maio', 'MA', '1');
INSERT INTO `js_zone` VALUES ('619', '39', 'Mosteiros', 'MO', '1');
INSERT INTO `js_zone` VALUES ('620', '39', 'Paul', 'PA', '1');
INSERT INTO `js_zone` VALUES ('621', '39', 'Porto Novo', 'PN', '1');
INSERT INTO `js_zone` VALUES ('622', '39', 'Praia', 'PR', '1');
INSERT INTO `js_zone` VALUES ('623', '39', 'Ribeira Grande', 'RG', '1');
INSERT INTO `js_zone` VALUES ('624', '39', 'Sal', 'SL', '1');
INSERT INTO `js_zone` VALUES ('625', '39', 'Santa Catarina', 'CA', '1');
INSERT INTO `js_zone` VALUES ('626', '39', 'Santa Cruz', 'CR', '1');
INSERT INTO `js_zone` VALUES ('627', '39', 'Sao Domingos', 'SD', '1');
INSERT INTO `js_zone` VALUES ('628', '39', 'Sao Filipe', 'SF', '1');
INSERT INTO `js_zone` VALUES ('629', '39', 'Sao Nicolau', 'SN', '1');
INSERT INTO `js_zone` VALUES ('630', '39', 'Sao Vicente', 'SV', '1');
INSERT INTO `js_zone` VALUES ('631', '39', 'Tarrafal', 'TA', '1');
INSERT INTO `js_zone` VALUES ('632', '40', 'Creek', 'CR', '1');
INSERT INTO `js_zone` VALUES ('633', '40', 'Eastern', 'EA', '1');
INSERT INTO `js_zone` VALUES ('634', '40', 'Midland', 'ML', '1');
INSERT INTO `js_zone` VALUES ('635', '40', 'South Town', 'ST', '1');
INSERT INTO `js_zone` VALUES ('636', '40', 'Spot Bay', 'SP', '1');
INSERT INTO `js_zone` VALUES ('637', '40', 'Stake Bay', 'SK', '1');
INSERT INTO `js_zone` VALUES ('638', '40', 'West End', 'WD', '1');
INSERT INTO `js_zone` VALUES ('639', '40', 'Western', 'WN', '1');
INSERT INTO `js_zone` VALUES ('640', '41', 'Bamingui-Bangoran', 'BBA', '1');
INSERT INTO `js_zone` VALUES ('641', '41', 'Basse-Kotto', 'BKO', '1');
INSERT INTO `js_zone` VALUES ('642', '41', 'Haute-Kotto', 'HKO', '1');
INSERT INTO `js_zone` VALUES ('643', '41', 'Haut-Mbomou', 'HMB', '1');
INSERT INTO `js_zone` VALUES ('644', '41', 'Kemo', 'KEM', '1');
INSERT INTO `js_zone` VALUES ('645', '41', 'Lobaye', 'LOB', '1');
INSERT INTO `js_zone` VALUES ('646', '41', 'Mambere-KadeÔ', 'MKD', '1');
INSERT INTO `js_zone` VALUES ('647', '41', 'Mbomou', 'MBO', '1');
INSERT INTO `js_zone` VALUES ('648', '41', 'Nana-Mambere', 'NMM', '1');
INSERT INTO `js_zone` VALUES ('649', '41', 'Ombella-M\'Poko', 'OMP', '1');
INSERT INTO `js_zone` VALUES ('650', '41', 'Ouaka', 'OUK', '1');
INSERT INTO `js_zone` VALUES ('651', '41', 'Ouham', 'OUH', '1');
INSERT INTO `js_zone` VALUES ('652', '41', 'Ouham-Pende', 'OPE', '1');
INSERT INTO `js_zone` VALUES ('653', '41', 'Vakaga', 'VAK', '1');
INSERT INTO `js_zone` VALUES ('654', '41', 'Nana-Grebizi', 'NGR', '1');
INSERT INTO `js_zone` VALUES ('655', '41', 'Sangha-Mbaere', 'SMB', '1');
INSERT INTO `js_zone` VALUES ('656', '41', 'Bangui', 'BAN', '1');
INSERT INTO `js_zone` VALUES ('657', '42', 'Batha', 'BA', '1');
INSERT INTO `js_zone` VALUES ('658', '42', 'Biltine', 'BI', '1');
INSERT INTO `js_zone` VALUES ('659', '42', 'Borkou-Ennedi-Tibesti', 'BE', '1');
INSERT INTO `js_zone` VALUES ('660', '42', 'Chari-Baguirmi', 'CB', '1');
INSERT INTO `js_zone` VALUES ('661', '42', 'Guera', 'GU', '1');
INSERT INTO `js_zone` VALUES ('662', '42', 'Kanem', 'KA', '1');
INSERT INTO `js_zone` VALUES ('663', '42', 'Lac', 'LA', '1');
INSERT INTO `js_zone` VALUES ('664', '42', 'Logone Occidental', 'LC', '1');
INSERT INTO `js_zone` VALUES ('665', '42', 'Logone Oriental', 'LR', '1');
INSERT INTO `js_zone` VALUES ('666', '42', 'Mayo-Kebbi', 'MK', '1');
INSERT INTO `js_zone` VALUES ('667', '42', 'Moyen-Chari', 'MC', '1');
INSERT INTO `js_zone` VALUES ('668', '42', 'Ouaddai', 'OU', '1');
INSERT INTO `js_zone` VALUES ('669', '42', 'Salamat', 'SA', '1');
INSERT INTO `js_zone` VALUES ('670', '42', 'Tandjile', 'TA', '1');
INSERT INTO `js_zone` VALUES ('671', '43', 'Aisen del General Carlos Ibanez', 'AI', '1');
INSERT INTO `js_zone` VALUES ('672', '43', 'Antofagasta', 'AN', '1');
INSERT INTO `js_zone` VALUES ('673', '43', 'Araucania', 'AR', '1');
INSERT INTO `js_zone` VALUES ('674', '43', 'Atacama', 'AT', '1');
INSERT INTO `js_zone` VALUES ('675', '43', 'Bio-Bio', 'BI', '1');
INSERT INTO `js_zone` VALUES ('676', '43', 'Coquimbo', 'CO', '1');
INSERT INTO `js_zone` VALUES ('677', '43', 'Libertador General Bernardo O\'Hi', 'LI', '1');
INSERT INTO `js_zone` VALUES ('678', '43', 'Los Lagos', 'LL', '1');
INSERT INTO `js_zone` VALUES ('679', '43', 'Magallanes y de la Antartica Chi', 'MA', '1');
INSERT INTO `js_zone` VALUES ('680', '43', 'Maule', 'ML', '1');
INSERT INTO `js_zone` VALUES ('681', '43', 'Region Metropolitana', 'RM', '1');
INSERT INTO `js_zone` VALUES ('682', '43', 'Tarapaca', 'TA', '1');
INSERT INTO `js_zone` VALUES ('683', '43', 'Valparaiso', 'VS', '1');
INSERT INTO `js_zone` VALUES ('684', '44', 'Anhui', 'AN', '1');
INSERT INTO `js_zone` VALUES ('685', '44', 'Beijing', 'BE', '1');
INSERT INTO `js_zone` VALUES ('686', '44', 'Chongqing', 'CH', '1');
INSERT INTO `js_zone` VALUES ('687', '44', 'Fujian', 'FU', '1');
INSERT INTO `js_zone` VALUES ('688', '44', 'Gansu', 'GA', '1');
INSERT INTO `js_zone` VALUES ('689', '44', 'Guangdong', 'GU', '1');
INSERT INTO `js_zone` VALUES ('690', '44', 'Guangxi', 'GX', '1');
INSERT INTO `js_zone` VALUES ('691', '44', 'Guizhou', 'GZ', '1');
INSERT INTO `js_zone` VALUES ('692', '44', 'Hainan', 'HA', '1');
INSERT INTO `js_zone` VALUES ('693', '44', 'Hebei', 'HB', '1');
INSERT INTO `js_zone` VALUES ('694', '44', 'Heilongjiang', 'HL', '1');
INSERT INTO `js_zone` VALUES ('695', '44', 'Henan', 'HE', '1');
INSERT INTO `js_zone` VALUES ('696', '44', 'Hong Kong', 'HK', '1');
INSERT INTO `js_zone` VALUES ('697', '44', 'Hubei', 'HU', '1');
INSERT INTO `js_zone` VALUES ('698', '44', 'Hunan', 'HN', '1');
INSERT INTO `js_zone` VALUES ('699', '44', 'Inner Mongolia', 'IM', '1');
INSERT INTO `js_zone` VALUES ('700', '44', 'Jiangsu', 'JI', '1');
INSERT INTO `js_zone` VALUES ('701', '44', 'Jiangxi', 'JX', '1');
INSERT INTO `js_zone` VALUES ('702', '44', 'Jilin', 'JL', '1');
INSERT INTO `js_zone` VALUES ('703', '44', 'Liaoning', 'LI', '1');
INSERT INTO `js_zone` VALUES ('704', '44', 'Macau', 'MA', '1');
INSERT INTO `js_zone` VALUES ('705', '44', 'Ningxia', 'NI', '1');
INSERT INTO `js_zone` VALUES ('706', '44', 'Shaanxi', 'SH', '1');
INSERT INTO `js_zone` VALUES ('707', '44', 'Shandong', 'SA', '1');
INSERT INTO `js_zone` VALUES ('708', '44', 'Shanghai', 'SG', '1');
INSERT INTO `js_zone` VALUES ('709', '44', 'Shanxi', 'SX', '1');
INSERT INTO `js_zone` VALUES ('710', '44', 'Sichuan', 'SI', '1');
INSERT INTO `js_zone` VALUES ('711', '44', 'Tianjin', 'TI', '1');
INSERT INTO `js_zone` VALUES ('712', '44', 'Xinjiang', 'XI', '1');
INSERT INTO `js_zone` VALUES ('713', '44', 'Yunnan', 'YU', '1');
INSERT INTO `js_zone` VALUES ('714', '44', 'Zhejiang', 'ZH', '1');
INSERT INTO `js_zone` VALUES ('715', '46', 'Direction Island', 'D', '1');
INSERT INTO `js_zone` VALUES ('716', '46', 'Home Island', 'H', '1');
INSERT INTO `js_zone` VALUES ('717', '46', 'Horsburgh Island', 'O', '1');
INSERT INTO `js_zone` VALUES ('718', '46', 'South Island', 'S', '1');
INSERT INTO `js_zone` VALUES ('719', '46', 'West Island', 'W', '1');
INSERT INTO `js_zone` VALUES ('720', '47', 'Amazonas', 'AMZ', '1');
INSERT INTO `js_zone` VALUES ('721', '47', 'Antioquia', 'ANT', '1');
INSERT INTO `js_zone` VALUES ('722', '47', 'Arauca', 'ARA', '1');
INSERT INTO `js_zone` VALUES ('723', '47', 'Atlantico', 'ATL', '1');
INSERT INTO `js_zone` VALUES ('724', '47', 'Bogota D.C.', 'BDC', '1');
INSERT INTO `js_zone` VALUES ('725', '47', 'Bolivar', 'BOL', '1');
INSERT INTO `js_zone` VALUES ('726', '47', 'Boyaca', 'BOY', '1');
INSERT INTO `js_zone` VALUES ('727', '47', 'Caldas', 'CAL', '1');
INSERT INTO `js_zone` VALUES ('728', '47', 'Caqueta', 'CAQ', '1');
INSERT INTO `js_zone` VALUES ('729', '47', 'Casanare', 'CAS', '1');
INSERT INTO `js_zone` VALUES ('730', '47', 'Cauca', 'CAU', '1');
INSERT INTO `js_zone` VALUES ('731', '47', 'Cesar', 'CES', '1');
INSERT INTO `js_zone` VALUES ('732', '47', 'Choco', 'CHO', '1');
INSERT INTO `js_zone` VALUES ('733', '47', 'Cordoba', 'COR', '1');
INSERT INTO `js_zone` VALUES ('734', '47', 'Cundinamarca', 'CAM', '1');
INSERT INTO `js_zone` VALUES ('735', '47', 'Guainia', 'GNA', '1');
INSERT INTO `js_zone` VALUES ('736', '47', 'Guajira', 'GJR', '1');
INSERT INTO `js_zone` VALUES ('737', '47', 'Guaviare', 'GVR', '1');
INSERT INTO `js_zone` VALUES ('738', '47', 'Huila', 'HUI', '1');
INSERT INTO `js_zone` VALUES ('739', '47', 'Magdalena', 'MAG', '1');
INSERT INTO `js_zone` VALUES ('740', '47', 'Meta', 'MET', '1');
INSERT INTO `js_zone` VALUES ('741', '47', 'Narino', 'NAR', '1');
INSERT INTO `js_zone` VALUES ('742', '47', 'Norte de Santander', 'NDS', '1');
INSERT INTO `js_zone` VALUES ('743', '47', 'Putumayo', 'PUT', '1');
INSERT INTO `js_zone` VALUES ('744', '47', 'Quindio', 'QUI', '1');
INSERT INTO `js_zone` VALUES ('745', '47', 'Risaralda', 'RIS', '1');
INSERT INTO `js_zone` VALUES ('746', '47', 'San Andres y Providencia', 'SAP', '1');
INSERT INTO `js_zone` VALUES ('747', '47', 'Santander', 'SAN', '1');
INSERT INTO `js_zone` VALUES ('748', '47', 'Sucre', 'SUC', '1');
INSERT INTO `js_zone` VALUES ('749', '47', 'Tolima', 'TOL', '1');
INSERT INTO `js_zone` VALUES ('750', '47', 'Valle del Cauca', 'VDC', '1');
INSERT INTO `js_zone` VALUES ('751', '47', 'Vaupes', 'VAU', '1');
INSERT INTO `js_zone` VALUES ('752', '47', 'Vichada', 'VIC', '1');
INSERT INTO `js_zone` VALUES ('753', '48', 'Grande Comore', 'G', '1');
INSERT INTO `js_zone` VALUES ('754', '48', 'Anjouan', 'A', '1');
INSERT INTO `js_zone` VALUES ('755', '48', 'Moheli', 'M', '1');
INSERT INTO `js_zone` VALUES ('756', '49', 'Bouenza', 'BO', '1');
INSERT INTO `js_zone` VALUES ('757', '49', 'Brazzaville', 'BR', '1');
INSERT INTO `js_zone` VALUES ('758', '49', 'Cuvette', 'CU', '1');
INSERT INTO `js_zone` VALUES ('759', '49', 'Cuvette-Ouest', 'CO', '1');
INSERT INTO `js_zone` VALUES ('760', '49', 'Kouilou', 'KO', '1');
INSERT INTO `js_zone` VALUES ('761', '49', 'Lekoumou', 'LE', '1');
INSERT INTO `js_zone` VALUES ('762', '49', 'Likouala', 'LI', '1');
INSERT INTO `js_zone` VALUES ('763', '49', 'Niari', 'NI', '1');
INSERT INTO `js_zone` VALUES ('764', '49', 'Plateaux', 'PL', '1');
INSERT INTO `js_zone` VALUES ('765', '49', 'Pool', 'PO', '1');
INSERT INTO `js_zone` VALUES ('766', '49', 'Sangha', 'SA', '1');
INSERT INTO `js_zone` VALUES ('767', '50', 'Pukapuka', 'PU', '1');
INSERT INTO `js_zone` VALUES ('768', '50', 'Rakahanga', 'RK', '1');
INSERT INTO `js_zone` VALUES ('769', '50', 'Manihiki', 'MK', '1');
INSERT INTO `js_zone` VALUES ('770', '50', 'Penrhyn', 'PE', '1');
INSERT INTO `js_zone` VALUES ('771', '50', 'Nassau Island', 'NI', '1');
INSERT INTO `js_zone` VALUES ('772', '50', 'Surwarrow', 'SU', '1');
INSERT INTO `js_zone` VALUES ('773', '50', 'Palmerston', 'PA', '1');
INSERT INTO `js_zone` VALUES ('774', '50', 'Aitutaki', 'AI', '1');
INSERT INTO `js_zone` VALUES ('775', '50', 'Manuae', 'MA', '1');
INSERT INTO `js_zone` VALUES ('776', '50', 'Takutea', 'TA', '1');
INSERT INTO `js_zone` VALUES ('777', '50', 'Mitiaro', 'MT', '1');
INSERT INTO `js_zone` VALUES ('778', '50', 'Atiu', 'AT', '1');
INSERT INTO `js_zone` VALUES ('779', '50', 'Mauke', 'MU', '1');
INSERT INTO `js_zone` VALUES ('780', '50', 'Rarotonga', 'RR', '1');
INSERT INTO `js_zone` VALUES ('781', '50', 'Mangaia', 'MG', '1');
INSERT INTO `js_zone` VALUES ('782', '51', 'Alajuela', 'AL', '1');
INSERT INTO `js_zone` VALUES ('783', '51', 'Cartago', 'CA', '1');
INSERT INTO `js_zone` VALUES ('784', '51', 'Guanacaste', 'GU', '1');
INSERT INTO `js_zone` VALUES ('785', '51', 'Heredia', 'HE', '1');
INSERT INTO `js_zone` VALUES ('786', '51', 'Limon', 'LI', '1');
INSERT INTO `js_zone` VALUES ('787', '51', 'Puntarenas', 'PU', '1');
INSERT INTO `js_zone` VALUES ('788', '51', 'San Jose', 'SJ', '1');
INSERT INTO `js_zone` VALUES ('789', '52', 'Abengourou', 'ABE', '1');
INSERT INTO `js_zone` VALUES ('790', '52', 'Abidjan', 'ABI', '1');
INSERT INTO `js_zone` VALUES ('791', '52', 'Aboisso', 'ABO', '1');
INSERT INTO `js_zone` VALUES ('792', '52', 'Adiake', 'ADI', '1');
INSERT INTO `js_zone` VALUES ('793', '52', 'Adzope', 'ADZ', '1');
INSERT INTO `js_zone` VALUES ('794', '52', 'Agboville', 'AGB', '1');
INSERT INTO `js_zone` VALUES ('795', '52', 'Agnibilekrou', 'AGN', '1');
INSERT INTO `js_zone` VALUES ('796', '52', 'Alepe', 'ALE', '1');
INSERT INTO `js_zone` VALUES ('797', '52', 'Bocanda', 'BOC', '1');
INSERT INTO `js_zone` VALUES ('798', '52', 'Bangolo', 'BAN', '1');
INSERT INTO `js_zone` VALUES ('799', '52', 'Beoumi', 'BEO', '1');
INSERT INTO `js_zone` VALUES ('800', '52', 'Biankouma', 'BIA', '1');
INSERT INTO `js_zone` VALUES ('801', '52', 'Bondoukou', 'BDK', '1');
INSERT INTO `js_zone` VALUES ('802', '52', 'Bongouanou', 'BGN', '1');
INSERT INTO `js_zone` VALUES ('803', '52', 'Bouafle', 'BFL', '1');
INSERT INTO `js_zone` VALUES ('804', '52', 'Bouake', 'BKE', '1');
INSERT INTO `js_zone` VALUES ('805', '52', 'Bouna', 'BNA', '1');
INSERT INTO `js_zone` VALUES ('806', '52', 'Boundiali', 'BDL', '1');
INSERT INTO `js_zone` VALUES ('807', '52', 'Dabakala', 'DKL', '1');
INSERT INTO `js_zone` VALUES ('808', '52', 'Dabou', 'DBU', '1');
INSERT INTO `js_zone` VALUES ('809', '52', 'Daloa', 'DAL', '1');
INSERT INTO `js_zone` VALUES ('810', '52', 'Danane', 'DAN', '1');
INSERT INTO `js_zone` VALUES ('811', '52', 'Daoukro', 'DAO', '1');
INSERT INTO `js_zone` VALUES ('812', '52', 'Dimbokro', 'DIM', '1');
INSERT INTO `js_zone` VALUES ('813', '52', 'Divo', 'DIV', '1');
INSERT INTO `js_zone` VALUES ('814', '52', 'Duekoue', 'DUE', '1');
INSERT INTO `js_zone` VALUES ('815', '52', 'Ferkessedougou', 'FER', '1');
INSERT INTO `js_zone` VALUES ('816', '52', 'Gagnoa', 'GAG', '1');
INSERT INTO `js_zone` VALUES ('817', '52', 'Grand-Bassam', 'GBA', '1');
INSERT INTO `js_zone` VALUES ('818', '52', 'Grand-Lahou', 'GLA', '1');
INSERT INTO `js_zone` VALUES ('819', '52', 'Guiglo', 'GUI', '1');
INSERT INTO `js_zone` VALUES ('820', '52', 'Issia', 'ISS', '1');
INSERT INTO `js_zone` VALUES ('821', '52', 'Jacqueville', 'JAC', '1');
INSERT INTO `js_zone` VALUES ('822', '52', 'Katiola', 'KAT', '1');
INSERT INTO `js_zone` VALUES ('823', '52', 'Korhogo', 'KOR', '1');
INSERT INTO `js_zone` VALUES ('824', '52', 'Lakota', 'LAK', '1');
INSERT INTO `js_zone` VALUES ('825', '52', 'Man', 'MAN', '1');
INSERT INTO `js_zone` VALUES ('826', '52', 'Mankono', 'MKN', '1');
INSERT INTO `js_zone` VALUES ('827', '52', 'Mbahiakro', 'MBA', '1');
INSERT INTO `js_zone` VALUES ('828', '52', 'Odienne', 'ODI', '1');
INSERT INTO `js_zone` VALUES ('829', '52', 'Oume', 'OUM', '1');
INSERT INTO `js_zone` VALUES ('830', '52', 'Sakassou', 'SAK', '1');
INSERT INTO `js_zone` VALUES ('831', '52', 'San-Pedro', 'SPE', '1');
INSERT INTO `js_zone` VALUES ('832', '52', 'Sassandra', 'SAS', '1');
INSERT INTO `js_zone` VALUES ('833', '52', 'Seguela', 'SEG', '1');
INSERT INTO `js_zone` VALUES ('834', '52', 'Sinfra', 'SIN', '1');
INSERT INTO `js_zone` VALUES ('835', '52', 'Soubre', 'SOU', '1');
INSERT INTO `js_zone` VALUES ('836', '52', 'Tabou', 'TAB', '1');
INSERT INTO `js_zone` VALUES ('837', '52', 'Tanda', 'TAN', '1');
INSERT INTO `js_zone` VALUES ('838', '52', 'Tiebissou', 'TIE', '1');
INSERT INTO `js_zone` VALUES ('839', '52', 'Tingrela', 'TIN', '1');
INSERT INTO `js_zone` VALUES ('840', '52', 'Tiassale', 'TIA', '1');
INSERT INTO `js_zone` VALUES ('841', '52', 'Touba', 'TBA', '1');
INSERT INTO `js_zone` VALUES ('842', '52', 'Toulepleu', 'TLP', '1');
INSERT INTO `js_zone` VALUES ('843', '52', 'Toumodi', 'TMD', '1');
INSERT INTO `js_zone` VALUES ('844', '52', 'Vavoua', 'VAV', '1');
INSERT INTO `js_zone` VALUES ('845', '52', 'Yamoussoukro', 'YAM', '1');
INSERT INTO `js_zone` VALUES ('846', '52', 'Zuenoula', 'ZUE', '1');
INSERT INTO `js_zone` VALUES ('847', '53', 'Bjelovar-Bilogora', 'BB', '1');
INSERT INTO `js_zone` VALUES ('848', '53', 'City of Zagreb', 'CZ', '1');
INSERT INTO `js_zone` VALUES ('849', '53', 'Dubrovnik-Neretva', 'DN', '1');
INSERT INTO `js_zone` VALUES ('850', '53', 'Istra', 'IS', '1');
INSERT INTO `js_zone` VALUES ('851', '53', 'Karlovac', 'KA', '1');
INSERT INTO `js_zone` VALUES ('852', '53', 'Koprivnica-Krizevci', 'KK', '1');
INSERT INTO `js_zone` VALUES ('853', '53', 'Krapina-Zagorje', 'KZ', '1');
INSERT INTO `js_zone` VALUES ('854', '53', 'Lika-Senj', 'LS', '1');
INSERT INTO `js_zone` VALUES ('855', '53', 'Medimurje', 'ME', '1');
INSERT INTO `js_zone` VALUES ('856', '53', 'Osijek-Baranja', 'OB', '1');
INSERT INTO `js_zone` VALUES ('857', '53', 'Pozega-Slavonia', 'PS', '1');
INSERT INTO `js_zone` VALUES ('858', '53', 'Primorje-Gorski Kotar', 'PG', '1');
INSERT INTO `js_zone` VALUES ('859', '53', 'Sibenik', 'SI', '1');
INSERT INTO `js_zone` VALUES ('860', '53', 'Sisak-Moslavina', 'SM', '1');
INSERT INTO `js_zone` VALUES ('861', '53', 'Slavonski Brod-Posavina', 'SB', '1');
INSERT INTO `js_zone` VALUES ('862', '53', 'Split-Dalmatia', 'SD', '1');
INSERT INTO `js_zone` VALUES ('863', '53', 'Varazdin', 'VA', '1');
INSERT INTO `js_zone` VALUES ('864', '53', 'Virovitica-Podravina', 'VP', '1');
INSERT INTO `js_zone` VALUES ('865', '53', 'Vukovar-Srijem', 'VS', '1');
INSERT INTO `js_zone` VALUES ('866', '53', 'Zadar-Knin', 'ZK', '1');
INSERT INTO `js_zone` VALUES ('867', '53', 'Zagreb', 'ZA', '1');
INSERT INTO `js_zone` VALUES ('868', '54', 'Camaguey', 'CA', '1');
INSERT INTO `js_zone` VALUES ('869', '54', 'Ciego de Avila', 'CD', '1');
INSERT INTO `js_zone` VALUES ('870', '54', 'Cienfuegos', 'CI', '1');
INSERT INTO `js_zone` VALUES ('871', '54', 'Ciudad de La Habana', 'CH', '1');
INSERT INTO `js_zone` VALUES ('872', '54', 'Granma', 'GR', '1');
INSERT INTO `js_zone` VALUES ('873', '54', 'Guantanamo', 'GU', '1');
INSERT INTO `js_zone` VALUES ('874', '54', 'Holguin', 'HO', '1');
INSERT INTO `js_zone` VALUES ('875', '54', 'Isla de la Juventud', 'IJ', '1');
INSERT INTO `js_zone` VALUES ('876', '54', 'La Habana', 'LH', '1');
INSERT INTO `js_zone` VALUES ('877', '54', 'Las Tunas', 'LT', '1');
INSERT INTO `js_zone` VALUES ('878', '54', 'Matanzas', 'MA', '1');
INSERT INTO `js_zone` VALUES ('879', '54', 'Pinar del Rio', 'PR', '1');
INSERT INTO `js_zone` VALUES ('880', '54', 'Sancti Spiritus', 'SS', '1');
INSERT INTO `js_zone` VALUES ('881', '54', 'Santiago de Cuba', 'SC', '1');
INSERT INTO `js_zone` VALUES ('882', '54', 'Villa Clara', 'VC', '1');
INSERT INTO `js_zone` VALUES ('883', '55', 'Famagusta', 'F', '1');
INSERT INTO `js_zone` VALUES ('884', '55', 'Kyrenia', 'K', '1');
INSERT INTO `js_zone` VALUES ('885', '55', 'Larnaca', 'A', '1');
INSERT INTO `js_zone` VALUES ('886', '55', 'Limassol', 'I', '1');
INSERT INTO `js_zone` VALUES ('887', '55', 'Nicosia', 'N', '1');
INSERT INTO `js_zone` VALUES ('888', '55', 'Paphos', 'P', '1');
INSERT INTO `js_zone` VALUES ('889', '56', 'Ústecký', 'U', '1');
INSERT INTO `js_zone` VALUES ('890', '56', 'Jihočeský', 'C', '1');
INSERT INTO `js_zone` VALUES ('891', '56', 'Jihomoravský', 'B', '1');
INSERT INTO `js_zone` VALUES ('892', '56', 'Karlovarský', 'K', '1');
INSERT INTO `js_zone` VALUES ('893', '56', 'Královehradecký', 'H', '1');
INSERT INTO `js_zone` VALUES ('894', '56', 'Liberecký', 'L', '1');
INSERT INTO `js_zone` VALUES ('895', '56', 'Moravskoslezský', 'T', '1');
INSERT INTO `js_zone` VALUES ('896', '56', 'Olomoucký', 'M', '1');
INSERT INTO `js_zone` VALUES ('897', '56', 'Pardubický', 'E', '1');
INSERT INTO `js_zone` VALUES ('898', '56', 'Plzeňský', 'P', '1');
INSERT INTO `js_zone` VALUES ('899', '56', 'Praha', 'A', '1');
INSERT INTO `js_zone` VALUES ('900', '56', 'Středočeský', 'S', '1');
INSERT INTO `js_zone` VALUES ('901', '56', 'Vysočina', 'J', '1');
INSERT INTO `js_zone` VALUES ('902', '56', 'Zlínský', 'Z', '1');
INSERT INTO `js_zone` VALUES ('903', '57', 'Arhus', 'AR', '1');
INSERT INTO `js_zone` VALUES ('904', '57', 'Bornholm', 'BH', '1');
INSERT INTO `js_zone` VALUES ('905', '57', 'Copenhagen', 'CO', '1');
INSERT INTO `js_zone` VALUES ('906', '57', 'Faroe Islands', 'FO', '1');
INSERT INTO `js_zone` VALUES ('907', '57', 'Frederiksborg', 'FR', '1');
INSERT INTO `js_zone` VALUES ('908', '57', 'Fyn', 'FY', '1');
INSERT INTO `js_zone` VALUES ('909', '57', 'Kobenhavn', 'KO', '1');
INSERT INTO `js_zone` VALUES ('910', '57', 'Nordjylland', 'NO', '1');
INSERT INTO `js_zone` VALUES ('911', '57', 'Ribe', 'RI', '1');
INSERT INTO `js_zone` VALUES ('912', '57', 'Ringkobing', 'RK', '1');
INSERT INTO `js_zone` VALUES ('913', '57', 'Roskilde', 'RO', '1');
INSERT INTO `js_zone` VALUES ('914', '57', 'Sonderjylland', 'SO', '1');
INSERT INTO `js_zone` VALUES ('915', '57', 'Storstrom', 'ST', '1');
INSERT INTO `js_zone` VALUES ('916', '57', 'Vejle', 'VK', '1');
INSERT INTO `js_zone` VALUES ('917', '57', 'Vestj&aelig;lland', 'VJ', '1');
INSERT INTO `js_zone` VALUES ('918', '57', 'Viborg', 'VB', '1');
INSERT INTO `js_zone` VALUES ('919', '58', '\'Ali Sabih', 'S', '1');
INSERT INTO `js_zone` VALUES ('920', '58', 'Dikhil', 'K', '1');
INSERT INTO `js_zone` VALUES ('921', '58', 'Djibouti', 'J', '1');
INSERT INTO `js_zone` VALUES ('922', '58', 'Obock', 'O', '1');
INSERT INTO `js_zone` VALUES ('923', '58', 'Tadjoura', 'T', '1');
INSERT INTO `js_zone` VALUES ('924', '59', 'Saint Andrew Parish', 'AND', '1');
INSERT INTO `js_zone` VALUES ('925', '59', 'Saint David Parish', 'DAV', '1');
INSERT INTO `js_zone` VALUES ('926', '59', 'Saint George Parish', 'GEO', '1');
INSERT INTO `js_zone` VALUES ('927', '59', 'Saint John Parish', 'JOH', '1');
INSERT INTO `js_zone` VALUES ('928', '59', 'Saint Joseph Parish', 'JOS', '1');
INSERT INTO `js_zone` VALUES ('929', '59', 'Saint Luke Parish', 'LUK', '1');
INSERT INTO `js_zone` VALUES ('930', '59', 'Saint Mark Parish', 'MAR', '1');
INSERT INTO `js_zone` VALUES ('931', '59', 'Saint Patrick Parish', 'PAT', '1');
INSERT INTO `js_zone` VALUES ('932', '59', 'Saint Paul Parish', 'PAU', '1');
INSERT INTO `js_zone` VALUES ('933', '59', 'Saint Peter Parish', 'PET', '1');
INSERT INTO `js_zone` VALUES ('934', '60', 'Distrito Nacional', 'DN', '1');
INSERT INTO `js_zone` VALUES ('935', '60', 'Azua', 'AZ', '1');
INSERT INTO `js_zone` VALUES ('936', '60', 'Baoruco', 'BC', '1');
INSERT INTO `js_zone` VALUES ('937', '60', 'Barahona', 'BH', '1');
INSERT INTO `js_zone` VALUES ('938', '60', 'Dajabon', 'DJ', '1');
INSERT INTO `js_zone` VALUES ('939', '60', 'Duarte', 'DU', '1');
INSERT INTO `js_zone` VALUES ('940', '60', 'Elias Pina', 'EL', '1');
INSERT INTO `js_zone` VALUES ('941', '60', 'El Seybo', 'SY', '1');
INSERT INTO `js_zone` VALUES ('942', '60', 'Espaillat', 'ET', '1');
INSERT INTO `js_zone` VALUES ('943', '60', 'Hato Mayor', 'HM', '1');
INSERT INTO `js_zone` VALUES ('944', '60', 'Independencia', 'IN', '1');
INSERT INTO `js_zone` VALUES ('945', '60', 'La Altagracia', 'AL', '1');
INSERT INTO `js_zone` VALUES ('946', '60', 'La Romana', 'RO', '1');
INSERT INTO `js_zone` VALUES ('947', '60', 'La Vega', 'VE', '1');
INSERT INTO `js_zone` VALUES ('948', '60', 'Maria Trinidad Sanchez', 'MT', '1');
INSERT INTO `js_zone` VALUES ('949', '60', 'Monsenor Nouel', 'MN', '1');
INSERT INTO `js_zone` VALUES ('950', '60', 'Monte Cristi', 'MC', '1');
INSERT INTO `js_zone` VALUES ('951', '60', 'Monte Plata', 'MP', '1');
INSERT INTO `js_zone` VALUES ('952', '60', 'Pedernales', 'PD', '1');
INSERT INTO `js_zone` VALUES ('953', '60', 'Peravia (Bani)', 'PR', '1');
INSERT INTO `js_zone` VALUES ('954', '60', 'Puerto Plata', 'PP', '1');
INSERT INTO `js_zone` VALUES ('955', '60', 'Salcedo', 'SL', '1');
INSERT INTO `js_zone` VALUES ('956', '60', 'Samana', 'SM', '1');
INSERT INTO `js_zone` VALUES ('957', '60', 'Sanchez Ramirez', 'SH', '1');
INSERT INTO `js_zone` VALUES ('958', '60', 'San Cristobal', 'SC', '1');
INSERT INTO `js_zone` VALUES ('959', '60', 'San Jose de Ocoa', 'JO', '1');
INSERT INTO `js_zone` VALUES ('960', '60', 'San Juan', 'SJ', '1');
INSERT INTO `js_zone` VALUES ('961', '60', 'San Pedro de Macoris', 'PM', '1');
INSERT INTO `js_zone` VALUES ('962', '60', 'Santiago', 'SA', '1');
INSERT INTO `js_zone` VALUES ('963', '60', 'Santiago Rodriguez', 'ST', '1');
INSERT INTO `js_zone` VALUES ('964', '60', 'Santo Domingo', 'SD', '1');
INSERT INTO `js_zone` VALUES ('965', '60', 'Valverde', 'VA', '1');
INSERT INTO `js_zone` VALUES ('966', '61', 'Aileu', 'AL', '1');
INSERT INTO `js_zone` VALUES ('967', '61', 'Ainaro', 'AN', '1');
INSERT INTO `js_zone` VALUES ('968', '61', 'Baucau', 'BA', '1');
INSERT INTO `js_zone` VALUES ('969', '61', 'Bobonaro', 'BO', '1');
INSERT INTO `js_zone` VALUES ('970', '61', 'Cova Lima', 'CO', '1');
INSERT INTO `js_zone` VALUES ('971', '61', 'Dili', 'DI', '1');
INSERT INTO `js_zone` VALUES ('972', '61', 'Ermera', 'ER', '1');
INSERT INTO `js_zone` VALUES ('973', '61', 'Lautem', 'LA', '1');
INSERT INTO `js_zone` VALUES ('974', '61', 'Liquica', 'LI', '1');
INSERT INTO `js_zone` VALUES ('975', '61', 'Manatuto', 'MT', '1');
INSERT INTO `js_zone` VALUES ('976', '61', 'Manufahi', 'MF', '1');
INSERT INTO `js_zone` VALUES ('977', '61', 'Oecussi', 'OE', '1');
INSERT INTO `js_zone` VALUES ('978', '61', 'Viqueque', 'VI', '1');
INSERT INTO `js_zone` VALUES ('979', '62', 'Azuay', 'AZU', '1');
INSERT INTO `js_zone` VALUES ('980', '62', 'Bolivar', 'BOL', '1');
INSERT INTO `js_zone` VALUES ('981', '62', 'Ca&ntilde;ar', 'CAN', '1');
INSERT INTO `js_zone` VALUES ('982', '62', 'Carchi', 'CAR', '1');
INSERT INTO `js_zone` VALUES ('983', '62', 'Chimborazo', 'CHI', '1');
INSERT INTO `js_zone` VALUES ('984', '62', 'Cotopaxi', 'COT', '1');
INSERT INTO `js_zone` VALUES ('985', '62', 'El Oro', 'EOR', '1');
INSERT INTO `js_zone` VALUES ('986', '62', 'Esmeraldas', 'ESM', '1');
INSERT INTO `js_zone` VALUES ('987', '62', 'Gal&aacute;pagos', 'GPS', '1');
INSERT INTO `js_zone` VALUES ('988', '62', 'Guayas', 'GUA', '1');
INSERT INTO `js_zone` VALUES ('989', '62', 'Imbabura', 'IMB', '1');
INSERT INTO `js_zone` VALUES ('990', '62', 'Loja', 'LOJ', '1');
INSERT INTO `js_zone` VALUES ('991', '62', 'Los Rios', 'LRO', '1');
INSERT INTO `js_zone` VALUES ('992', '62', 'Manab&iacute;', 'MAN', '1');
INSERT INTO `js_zone` VALUES ('993', '62', 'Morona Santiago', 'MSA', '1');
INSERT INTO `js_zone` VALUES ('994', '62', 'Napo', 'NAP', '1');
INSERT INTO `js_zone` VALUES ('995', '62', 'Orellana', 'ORE', '1');
INSERT INTO `js_zone` VALUES ('996', '62', 'Pastaza', 'PAS', '1');
INSERT INTO `js_zone` VALUES ('997', '62', 'Pichincha', 'PIC', '1');
INSERT INTO `js_zone` VALUES ('998', '62', 'Sucumb&iacute;os', 'SUC', '1');
INSERT INTO `js_zone` VALUES ('999', '62', 'Tungurahua', 'TUN', '1');
INSERT INTO `js_zone` VALUES ('1000', '62', 'Zamora Chinchipe', 'ZCH', '1');
INSERT INTO `js_zone` VALUES ('1001', '63', 'Ad Daqahliyah', 'DHY', '1');
INSERT INTO `js_zone` VALUES ('1002', '63', 'Al Bahr al Ahmar', 'BAM', '1');
INSERT INTO `js_zone` VALUES ('1003', '63', 'Al Buhayrah', 'BHY', '1');
INSERT INTO `js_zone` VALUES ('1004', '63', 'Al Fayyum', 'FYM', '1');
INSERT INTO `js_zone` VALUES ('1005', '63', 'Al Gharbiyah', 'GBY', '1');
INSERT INTO `js_zone` VALUES ('1006', '63', 'Al Iskandariyah', 'IDR', '1');
INSERT INTO `js_zone` VALUES ('1007', '63', 'Al Isma\'iliyah', 'IML', '1');
INSERT INTO `js_zone` VALUES ('1008', '63', 'Al Jizah', 'JZH', '1');
INSERT INTO `js_zone` VALUES ('1009', '63', 'Al Minufiyah', 'MFY', '1');
INSERT INTO `js_zone` VALUES ('1010', '63', 'Al Minya', 'MNY', '1');
INSERT INTO `js_zone` VALUES ('1011', '63', 'Al Qahirah', 'QHR', '1');
INSERT INTO `js_zone` VALUES ('1012', '63', 'Al Qalyubiyah', 'QLY', '1');
INSERT INTO `js_zone` VALUES ('1013', '63', 'Al Wadi al Jadid', 'WJD', '1');
INSERT INTO `js_zone` VALUES ('1014', '63', 'Ash Sharqiyah', 'SHQ', '1');
INSERT INTO `js_zone` VALUES ('1015', '63', 'As Suways', 'SWY', '1');
INSERT INTO `js_zone` VALUES ('1016', '63', 'Aswan', 'ASW', '1');
INSERT INTO `js_zone` VALUES ('1017', '63', 'Asyut', 'ASY', '1');
INSERT INTO `js_zone` VALUES ('1018', '63', 'Bani Suwayf', 'BSW', '1');
INSERT INTO `js_zone` VALUES ('1019', '63', 'Bur Sa\'id', 'BSD', '1');
INSERT INTO `js_zone` VALUES ('1020', '63', 'Dumyat', 'DMY', '1');
INSERT INTO `js_zone` VALUES ('1021', '63', 'Janub Sina\'', 'JNS', '1');
INSERT INTO `js_zone` VALUES ('1022', '63', 'Kafr ash Shaykh', 'KSH', '1');
INSERT INTO `js_zone` VALUES ('1023', '63', 'Matruh', 'MAT', '1');
INSERT INTO `js_zone` VALUES ('1024', '63', 'Qina', 'QIN', '1');
INSERT INTO `js_zone` VALUES ('1025', '63', 'Shamal Sina\'', 'SHS', '1');
INSERT INTO `js_zone` VALUES ('1026', '63', 'Suhaj', 'SUH', '1');
INSERT INTO `js_zone` VALUES ('1027', '64', 'Ahuachapan', 'AH', '1');
INSERT INTO `js_zone` VALUES ('1028', '64', 'Cabanas', 'CA', '1');
INSERT INTO `js_zone` VALUES ('1029', '64', 'Chalatenango', 'CH', '1');
INSERT INTO `js_zone` VALUES ('1030', '64', 'Cuscatlan', 'CU', '1');
INSERT INTO `js_zone` VALUES ('1031', '64', 'La Libertad', 'LB', '1');
INSERT INTO `js_zone` VALUES ('1032', '64', 'La Paz', 'PZ', '1');
INSERT INTO `js_zone` VALUES ('1033', '64', 'La Union', 'UN', '1');
INSERT INTO `js_zone` VALUES ('1034', '64', 'Morazan', 'MO', '1');
INSERT INTO `js_zone` VALUES ('1035', '64', 'San Miguel', 'SM', '1');
INSERT INTO `js_zone` VALUES ('1036', '64', 'San Salvador', 'SS', '1');
INSERT INTO `js_zone` VALUES ('1037', '64', 'San Vicente', 'SV', '1');
INSERT INTO `js_zone` VALUES ('1038', '64', 'Santa Ana', 'SA', '1');
INSERT INTO `js_zone` VALUES ('1039', '64', 'Sonsonate', 'SO', '1');
INSERT INTO `js_zone` VALUES ('1040', '64', 'Usulutan', 'US', '1');
INSERT INTO `js_zone` VALUES ('1041', '65', 'Provincia Annobon', 'AN', '1');
INSERT INTO `js_zone` VALUES ('1042', '65', 'Provincia Bioko Norte', 'BN', '1');
INSERT INTO `js_zone` VALUES ('1043', '65', 'Provincia Bioko Sur', 'BS', '1');
INSERT INTO `js_zone` VALUES ('1044', '65', 'Provincia Centro Sur', 'CS', '1');
INSERT INTO `js_zone` VALUES ('1045', '65', 'Provincia Kie-Ntem', 'KN', '1');
INSERT INTO `js_zone` VALUES ('1046', '65', 'Provincia Litoral', 'LI', '1');
INSERT INTO `js_zone` VALUES ('1047', '65', 'Provincia Wele-Nzas', 'WN', '1');
INSERT INTO `js_zone` VALUES ('1048', '66', 'Central (Maekel)', 'MA', '1');
INSERT INTO `js_zone` VALUES ('1049', '66', 'Anseba (Keren)', 'KE', '1');
INSERT INTO `js_zone` VALUES ('1050', '66', 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', '1');
INSERT INTO `js_zone` VALUES ('1051', '66', 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', '1');
INSERT INTO `js_zone` VALUES ('1052', '66', 'Southern (Debub)', 'DE', '1');
INSERT INTO `js_zone` VALUES ('1053', '66', 'Gash-Barka (Barentu)', 'BR', '1');
INSERT INTO `js_zone` VALUES ('1054', '67', 'Harjumaa (Tallinn)', 'HA', '1');
INSERT INTO `js_zone` VALUES ('1055', '67', 'Hiiumaa (Kardla)', 'HI', '1');
INSERT INTO `js_zone` VALUES ('1056', '67', 'Ida-Virumaa (Johvi)', 'IV', '1');
INSERT INTO `js_zone` VALUES ('1057', '67', 'Jarvamaa (Paide)', 'JA', '1');
INSERT INTO `js_zone` VALUES ('1058', '67', 'Jogevamaa (Jogeva)', 'JO', '1');
INSERT INTO `js_zone` VALUES ('1059', '67', 'Laane-Virumaa (Rakvere)', 'LV', '1');
INSERT INTO `js_zone` VALUES ('1060', '67', 'Laanemaa (Haapsalu)', 'LA', '1');
INSERT INTO `js_zone` VALUES ('1061', '67', 'Parnumaa (Parnu)', 'PA', '1');
INSERT INTO `js_zone` VALUES ('1062', '67', 'Polvamaa (Polva)', 'PO', '1');
INSERT INTO `js_zone` VALUES ('1063', '67', 'Raplamaa (Rapla)', 'RA', '1');
INSERT INTO `js_zone` VALUES ('1064', '67', 'Saaremaa (Kuessaare)', 'SA', '1');
INSERT INTO `js_zone` VALUES ('1065', '67', 'Tartumaa (Tartu)', 'TA', '1');
INSERT INTO `js_zone` VALUES ('1066', '67', 'Valgamaa (Valga)', 'VA', '1');
INSERT INTO `js_zone` VALUES ('1067', '67', 'Viljandimaa (Viljandi)', 'VI', '1');
INSERT INTO `js_zone` VALUES ('1068', '67', 'Vorumaa (Voru)', 'VO', '1');
INSERT INTO `js_zone` VALUES ('1069', '68', 'Afar', 'AF', '1');
INSERT INTO `js_zone` VALUES ('1070', '68', 'Amhara', 'AH', '1');
INSERT INTO `js_zone` VALUES ('1071', '68', 'Benishangul-Gumaz', 'BG', '1');
INSERT INTO `js_zone` VALUES ('1072', '68', 'Gambela', 'GB', '1');
INSERT INTO `js_zone` VALUES ('1073', '68', 'Hariai', 'HR', '1');
INSERT INTO `js_zone` VALUES ('1074', '68', 'Oromia', 'OR', '1');
INSERT INTO `js_zone` VALUES ('1075', '68', 'Somali', 'SM', '1');
INSERT INTO `js_zone` VALUES ('1076', '68', 'Southern Nations - Nationalities and Peoples Region', 'SN', '1');
INSERT INTO `js_zone` VALUES ('1077', '68', 'Tigray', 'TG', '1');
INSERT INTO `js_zone` VALUES ('1078', '68', 'Addis Ababa', 'AA', '1');
INSERT INTO `js_zone` VALUES ('1079', '68', 'Dire Dawa', 'DD', '1');
INSERT INTO `js_zone` VALUES ('1080', '71', 'Central Division', 'C', '1');
INSERT INTO `js_zone` VALUES ('1081', '71', 'Northern Division', 'N', '1');
INSERT INTO `js_zone` VALUES ('1082', '71', 'Eastern Division', 'E', '1');
INSERT INTO `js_zone` VALUES ('1083', '71', 'Western Division', 'W', '1');
INSERT INTO `js_zone` VALUES ('1084', '71', 'Rotuma', 'R', '1');
INSERT INTO `js_zone` VALUES ('1085', '72', 'Ahvenanmaan Laani', 'AL', '1');
INSERT INTO `js_zone` VALUES ('1086', '72', 'Etela-Suomen Laani', 'ES', '1');
INSERT INTO `js_zone` VALUES ('1087', '72', 'Ita-Suomen Laani', 'IS', '1');
INSERT INTO `js_zone` VALUES ('1088', '72', 'Lansi-Suomen Laani', 'LS', '1');
INSERT INTO `js_zone` VALUES ('1089', '72', 'Lapin Lanani', 'LA', '1');
INSERT INTO `js_zone` VALUES ('1090', '72', 'Oulun Laani', 'OU', '1');
INSERT INTO `js_zone` VALUES ('1114', '74', 'Ain', '01', '1');
INSERT INTO `js_zone` VALUES ('1115', '74', 'Aisne', '02', '1');
INSERT INTO `js_zone` VALUES ('1116', '74', 'Allier', '03', '1');
INSERT INTO `js_zone` VALUES ('1117', '74', 'Alpes de Haute Provence', '04', '1');
INSERT INTO `js_zone` VALUES ('1118', '74', 'Hautes-Alpes', '05', '1');
INSERT INTO `js_zone` VALUES ('1119', '74', 'Alpes Maritimes', '06', '1');
INSERT INTO `js_zone` VALUES ('1120', '74', 'Ard&egrave;che', '07', '1');
INSERT INTO `js_zone` VALUES ('1121', '74', 'Ardennes', '08', '1');
INSERT INTO `js_zone` VALUES ('1122', '74', 'Ari&egrave;ge', '09', '1');
INSERT INTO `js_zone` VALUES ('1123', '74', 'Aube', '10', '1');
INSERT INTO `js_zone` VALUES ('1124', '74', 'Aude', '11', '1');
INSERT INTO `js_zone` VALUES ('1125', '74', 'Aveyron', '12', '1');
INSERT INTO `js_zone` VALUES ('1126', '74', 'Bouches du Rh&ocirc;ne', '13', '1');
INSERT INTO `js_zone` VALUES ('1127', '74', 'Calvados', '14', '1');
INSERT INTO `js_zone` VALUES ('1128', '74', 'Cantal', '15', '1');
INSERT INTO `js_zone` VALUES ('1129', '74', 'Charente', '16', '1');
INSERT INTO `js_zone` VALUES ('1130', '74', 'Charente Maritime', '17', '1');
INSERT INTO `js_zone` VALUES ('1131', '74', 'Cher', '18', '1');
INSERT INTO `js_zone` VALUES ('1132', '74', 'Corr&egrave;ze', '19', '1');
INSERT INTO `js_zone` VALUES ('1133', '74', 'Corse du Sud', '2A', '1');
INSERT INTO `js_zone` VALUES ('1134', '74', 'Haute Corse', '2B', '1');
INSERT INTO `js_zone` VALUES ('1135', '74', 'C&ocirc;te d&#039;or', '21', '1');
INSERT INTO `js_zone` VALUES ('1136', '74', 'C&ocirc;tes d&#039;Armor', '22', '1');
INSERT INTO `js_zone` VALUES ('1137', '74', 'Creuse', '23', '1');
INSERT INTO `js_zone` VALUES ('1138', '74', 'Dordogne', '24', '1');
INSERT INTO `js_zone` VALUES ('1139', '74', 'Doubs', '25', '1');
INSERT INTO `js_zone` VALUES ('1140', '74', 'Dr&ocirc;me', '26', '1');
INSERT INTO `js_zone` VALUES ('1141', '74', 'Eure', '27', '1');
INSERT INTO `js_zone` VALUES ('1142', '74', 'Eure et Loir', '28', '1');
INSERT INTO `js_zone` VALUES ('1143', '74', 'Finist&egrave;re', '29', '1');
INSERT INTO `js_zone` VALUES ('1144', '74', 'Gard', '30', '1');
INSERT INTO `js_zone` VALUES ('1145', '74', 'Haute Garonne', '31', '1');
INSERT INTO `js_zone` VALUES ('1146', '74', 'Gers', '32', '1');
INSERT INTO `js_zone` VALUES ('1147', '74', 'Gironde', '33', '1');
INSERT INTO `js_zone` VALUES ('1148', '74', 'H&eacute;rault', '34', '1');
INSERT INTO `js_zone` VALUES ('1149', '74', 'Ille et Vilaine', '35', '1');
INSERT INTO `js_zone` VALUES ('1150', '74', 'Indre', '36', '1');
INSERT INTO `js_zone` VALUES ('1151', '74', 'Indre et Loire', '37', '1');
INSERT INTO `js_zone` VALUES ('1152', '74', 'Is&eacute;re', '38', '1');
INSERT INTO `js_zone` VALUES ('1153', '74', 'Jura', '39', '1');
INSERT INTO `js_zone` VALUES ('1154', '74', 'Landes', '40', '1');
INSERT INTO `js_zone` VALUES ('1155', '74', 'Loir et Cher', '41', '1');
INSERT INTO `js_zone` VALUES ('1156', '74', 'Loire', '42', '1');
INSERT INTO `js_zone` VALUES ('1157', '74', 'Haute Loire', '43', '1');
INSERT INTO `js_zone` VALUES ('1158', '74', 'Loire Atlantique', '44', '1');
INSERT INTO `js_zone` VALUES ('1159', '74', 'Loiret', '45', '1');
INSERT INTO `js_zone` VALUES ('1160', '74', 'Lot', '46', '1');
INSERT INTO `js_zone` VALUES ('1161', '74', 'Lot et Garonne', '47', '1');
INSERT INTO `js_zone` VALUES ('1162', '74', 'Loz&egrave;re', '48', '1');
INSERT INTO `js_zone` VALUES ('1163', '74', 'Maine et Loire', '49', '1');
INSERT INTO `js_zone` VALUES ('1164', '74', 'Manche', '50', '1');
INSERT INTO `js_zone` VALUES ('1165', '74', 'Marne', '51', '1');
INSERT INTO `js_zone` VALUES ('1166', '74', 'Haute Marne', '52', '1');
INSERT INTO `js_zone` VALUES ('1167', '74', 'Mayenne', '53', '1');
INSERT INTO `js_zone` VALUES ('1168', '74', 'Meurthe et Moselle', '54', '1');
INSERT INTO `js_zone` VALUES ('1169', '74', 'Meuse', '55', '1');
INSERT INTO `js_zone` VALUES ('1170', '74', 'Morbihan', '56', '1');
INSERT INTO `js_zone` VALUES ('1171', '74', 'Moselle', '57', '1');
INSERT INTO `js_zone` VALUES ('1172', '74', 'Ni&egrave;vre', '58', '1');
INSERT INTO `js_zone` VALUES ('1173', '74', 'Nord', '59', '1');
INSERT INTO `js_zone` VALUES ('1174', '74', 'Oise', '60', '1');
INSERT INTO `js_zone` VALUES ('1175', '74', 'Orne', '61', '1');
INSERT INTO `js_zone` VALUES ('1176', '74', 'Pas de Calais', '62', '1');
INSERT INTO `js_zone` VALUES ('1177', '74', 'Puy de D&ocirc;me', '63', '1');
INSERT INTO `js_zone` VALUES ('1178', '74', 'Pyr&eacute;n&eacute;es Atlantiques', '64', '1');
INSERT INTO `js_zone` VALUES ('1179', '74', 'Hautes Pyr&eacute;n&eacute;es', '65', '1');
INSERT INTO `js_zone` VALUES ('1180', '74', 'Pyr&eacute;n&eacute;es Orientales', '66', '1');
INSERT INTO `js_zone` VALUES ('1181', '74', 'Bas Rhin', '67', '1');
INSERT INTO `js_zone` VALUES ('1182', '74', 'Haut Rhin', '68', '1');
INSERT INTO `js_zone` VALUES ('1183', '74', 'Rh&ocirc;ne', '69', '1');
INSERT INTO `js_zone` VALUES ('1184', '74', 'Haute Sa&ocirc;ne', '70', '1');
INSERT INTO `js_zone` VALUES ('1185', '74', 'Sa&ocirc;ne et Loire', '71', '1');
INSERT INTO `js_zone` VALUES ('1186', '74', 'Sarthe', '72', '1');
INSERT INTO `js_zone` VALUES ('1187', '74', 'Savoie', '73', '1');
INSERT INTO `js_zone` VALUES ('1188', '74', 'Haute Savoie', '74', '1');
INSERT INTO `js_zone` VALUES ('1189', '74', 'Paris', '75', '1');
INSERT INTO `js_zone` VALUES ('1190', '74', 'Seine Maritime', '76', '1');
INSERT INTO `js_zone` VALUES ('1191', '74', 'Seine et Marne', '77', '1');
INSERT INTO `js_zone` VALUES ('1192', '74', 'Yvelines', '78', '1');
INSERT INTO `js_zone` VALUES ('1193', '74', 'Deux S&egrave;vres', '79', '1');
INSERT INTO `js_zone` VALUES ('1194', '74', 'Somme', '80', '1');
INSERT INTO `js_zone` VALUES ('1195', '74', 'Tarn', '81', '1');
INSERT INTO `js_zone` VALUES ('1196', '74', 'Tarn et Garonne', '82', '1');
INSERT INTO `js_zone` VALUES ('1197', '74', 'Var', '83', '1');
INSERT INTO `js_zone` VALUES ('1198', '74', 'Vaucluse', '84', '1');
INSERT INTO `js_zone` VALUES ('1199', '74', 'Vend&eacute;e', '85', '1');
INSERT INTO `js_zone` VALUES ('1200', '74', 'Vienne', '86', '1');
INSERT INTO `js_zone` VALUES ('1201', '74', 'Haute Vienne', '87', '1');
INSERT INTO `js_zone` VALUES ('1202', '74', 'Vosges', '88', '1');
INSERT INTO `js_zone` VALUES ('1203', '74', 'Yonne', '89', '1');
INSERT INTO `js_zone` VALUES ('1204', '74', 'Territoire de Belfort', '90', '1');
INSERT INTO `js_zone` VALUES ('1205', '74', 'Essonne', '91', '1');
INSERT INTO `js_zone` VALUES ('1206', '74', 'Hauts de Seine', '92', '1');
INSERT INTO `js_zone` VALUES ('1207', '74', 'Seine St-Denis', '93', '1');
INSERT INTO `js_zone` VALUES ('1208', '74', 'Val de Marne', '94', '1');
INSERT INTO `js_zone` VALUES ('1209', '74', 'Val d\'Oise', '95', '1');
INSERT INTO `js_zone` VALUES ('1210', '76', 'Archipel des Marquises', 'M', '1');
INSERT INTO `js_zone` VALUES ('1211', '76', 'Archipel des Tuamotu', 'T', '1');
INSERT INTO `js_zone` VALUES ('1212', '76', 'Archipel des Tubuai', 'I', '1');
INSERT INTO `js_zone` VALUES ('1213', '76', 'Iles du Vent', 'V', '1');
INSERT INTO `js_zone` VALUES ('1214', '76', 'Iles Sous-le-Vent', 'S', '1');
INSERT INTO `js_zone` VALUES ('1215', '77', 'Iles Crozet', 'C', '1');
INSERT INTO `js_zone` VALUES ('1216', '77', 'Iles Kerguelen', 'K', '1');
INSERT INTO `js_zone` VALUES ('1217', '77', 'Ile Amsterdam', 'A', '1');
INSERT INTO `js_zone` VALUES ('1218', '77', 'Ile Saint-Paul', 'P', '1');
INSERT INTO `js_zone` VALUES ('1219', '77', 'Adelie Land', 'D', '1');
INSERT INTO `js_zone` VALUES ('1220', '78', 'Estuaire', 'ES', '1');
INSERT INTO `js_zone` VALUES ('1221', '78', 'Haut-Ogooue', 'HO', '1');
INSERT INTO `js_zone` VALUES ('1222', '78', 'Moyen-Ogooue', 'MO', '1');
INSERT INTO `js_zone` VALUES ('1223', '78', 'Ngounie', 'NG', '1');
INSERT INTO `js_zone` VALUES ('1224', '78', 'Nyanga', 'NY', '1');
INSERT INTO `js_zone` VALUES ('1225', '78', 'Ogooue-Ivindo', 'OI', '1');
INSERT INTO `js_zone` VALUES ('1226', '78', 'Ogooue-Lolo', 'OL', '1');
INSERT INTO `js_zone` VALUES ('1227', '78', 'Ogooue-Maritime', 'OM', '1');
INSERT INTO `js_zone` VALUES ('1228', '78', 'Woleu-Ntem', 'WN', '1');
INSERT INTO `js_zone` VALUES ('1229', '79', 'Banjul', 'BJ', '1');
INSERT INTO `js_zone` VALUES ('1230', '79', 'Basse', 'BS', '1');
INSERT INTO `js_zone` VALUES ('1231', '79', 'Brikama', 'BR', '1');
INSERT INTO `js_zone` VALUES ('1232', '79', 'Janjangbure', 'JA', '1');
INSERT INTO `js_zone` VALUES ('1233', '79', 'Kanifeng', 'KA', '1');
INSERT INTO `js_zone` VALUES ('1234', '79', 'Kerewan', 'KE', '1');
INSERT INTO `js_zone` VALUES ('1235', '79', 'Kuntaur', 'KU', '1');
INSERT INTO `js_zone` VALUES ('1236', '79', 'Mansakonko', 'MA', '1');
INSERT INTO `js_zone` VALUES ('1237', '79', 'Lower River', 'LR', '1');
INSERT INTO `js_zone` VALUES ('1238', '79', 'Central River', 'CR', '1');
INSERT INTO `js_zone` VALUES ('1239', '79', 'North Bank', 'NB', '1');
INSERT INTO `js_zone` VALUES ('1240', '79', 'Upper River', 'UR', '1');
INSERT INTO `js_zone` VALUES ('1241', '79', 'Western', 'WE', '1');
INSERT INTO `js_zone` VALUES ('1242', '80', 'Abkhazia', 'AB', '1');
INSERT INTO `js_zone` VALUES ('1243', '80', 'Ajaria', 'AJ', '1');
INSERT INTO `js_zone` VALUES ('1244', '80', 'Tbilisi', 'TB', '1');
INSERT INTO `js_zone` VALUES ('1245', '80', 'Guria', 'GU', '1');
INSERT INTO `js_zone` VALUES ('1246', '80', 'Imereti', 'IM', '1');
INSERT INTO `js_zone` VALUES ('1247', '80', 'Kakheti', 'KA', '1');
INSERT INTO `js_zone` VALUES ('1248', '80', 'Kvemo Kartli', 'KK', '1');
INSERT INTO `js_zone` VALUES ('1249', '80', 'Mtskheta-Mtianeti', 'MM', '1');
INSERT INTO `js_zone` VALUES ('1250', '80', 'Racha Lechkhumi and Kvemo Svanet', 'RL', '1');
INSERT INTO `js_zone` VALUES ('1251', '80', 'Samegrelo-Zemo Svaneti', 'SZ', '1');
INSERT INTO `js_zone` VALUES ('1252', '80', 'Samtskhe-Javakheti', 'SJ', '1');
INSERT INTO `js_zone` VALUES ('1253', '80', 'Shida Kartli', 'SK', '1');
INSERT INTO `js_zone` VALUES ('1254', '81', 'Baden-W&uuml;rttemberg', 'BAW', '1');
INSERT INTO `js_zone` VALUES ('1255', '81', 'Bayern', 'BAY', '1');
INSERT INTO `js_zone` VALUES ('1256', '81', 'Berlin', 'BER', '1');
INSERT INTO `js_zone` VALUES ('1257', '81', 'Brandenburg', 'BRG', '1');
INSERT INTO `js_zone` VALUES ('1258', '81', 'Bremen', 'BRE', '1');
INSERT INTO `js_zone` VALUES ('1259', '81', 'Hamburg', 'HAM', '1');
INSERT INTO `js_zone` VALUES ('1260', '81', 'Hessen', 'HES', '1');
INSERT INTO `js_zone` VALUES ('1261', '81', 'Mecklenburg-Vorpommern', 'MEC', '1');
INSERT INTO `js_zone` VALUES ('1262', '81', 'Niedersachsen', 'NDS', '1');
INSERT INTO `js_zone` VALUES ('1263', '81', 'Nordrhein-Westfalen', 'NRW', '1');
INSERT INTO `js_zone` VALUES ('1264', '81', 'Rheinland-Pfalz', 'RHE', '1');
INSERT INTO `js_zone` VALUES ('1265', '81', 'Saarland', 'SAR', '1');
INSERT INTO `js_zone` VALUES ('1266', '81', 'Sachsen', 'SAS', '1');
INSERT INTO `js_zone` VALUES ('1267', '81', 'Sachsen-Anhalt', 'SAC', '1');
INSERT INTO `js_zone` VALUES ('1268', '81', 'Schleswig-Holstein', 'SCN', '1');
INSERT INTO `js_zone` VALUES ('1269', '81', 'Th&uuml;ringen', 'THE', '1');
INSERT INTO `js_zone` VALUES ('1270', '82', 'Ashanti Region', 'AS', '1');
INSERT INTO `js_zone` VALUES ('1271', '82', 'Brong-Ahafo Region', 'BA', '1');
INSERT INTO `js_zone` VALUES ('1272', '82', 'Central Region', 'CE', '1');
INSERT INTO `js_zone` VALUES ('1273', '82', 'Eastern Region', 'EA', '1');
INSERT INTO `js_zone` VALUES ('1274', '82', 'Greater Accra Region', 'GA', '1');
INSERT INTO `js_zone` VALUES ('1275', '82', 'Northern Region', 'NO', '1');
INSERT INTO `js_zone` VALUES ('1276', '82', 'Upper East Region', 'UE', '1');
INSERT INTO `js_zone` VALUES ('1277', '82', 'Upper West Region', 'UW', '1');
INSERT INTO `js_zone` VALUES ('1278', '82', 'Volta Region', 'VO', '1');
INSERT INTO `js_zone` VALUES ('1279', '82', 'Western Region', 'WE', '1');
INSERT INTO `js_zone` VALUES ('1280', '84', 'Attica', 'AT', '1');
INSERT INTO `js_zone` VALUES ('1281', '84', 'Central Greece', 'CN', '1');
INSERT INTO `js_zone` VALUES ('1282', '84', 'Central Macedonia', 'CM', '1');
INSERT INTO `js_zone` VALUES ('1283', '84', 'Crete', 'CR', '1');
INSERT INTO `js_zone` VALUES ('1284', '84', 'East Macedonia and Thrace', 'EM', '1');
INSERT INTO `js_zone` VALUES ('1285', '84', 'Epirus', 'EP', '1');
INSERT INTO `js_zone` VALUES ('1286', '84', 'Ionian Islands', 'II', '1');
INSERT INTO `js_zone` VALUES ('1287', '84', 'North Aegean', 'NA', '1');
INSERT INTO `js_zone` VALUES ('1288', '84', 'Peloponnesos', 'PP', '1');
INSERT INTO `js_zone` VALUES ('1289', '84', 'South Aegean', 'SA', '1');
INSERT INTO `js_zone` VALUES ('1290', '84', 'Thessaly', 'TH', '1');
INSERT INTO `js_zone` VALUES ('1291', '84', 'West Greece', 'WG', '1');
INSERT INTO `js_zone` VALUES ('1292', '84', 'West Macedonia', 'WM', '1');
INSERT INTO `js_zone` VALUES ('1293', '85', 'Avannaa', 'A', '1');
INSERT INTO `js_zone` VALUES ('1294', '85', 'Tunu', 'T', '1');
INSERT INTO `js_zone` VALUES ('1295', '85', 'Kitaa', 'K', '1');
INSERT INTO `js_zone` VALUES ('1296', '86', 'Saint Andrew', 'A', '1');
INSERT INTO `js_zone` VALUES ('1297', '86', 'Saint David', 'D', '1');
INSERT INTO `js_zone` VALUES ('1298', '86', 'Saint George', 'G', '1');
INSERT INTO `js_zone` VALUES ('1299', '86', 'Saint John', 'J', '1');
INSERT INTO `js_zone` VALUES ('1300', '86', 'Saint Mark', 'M', '1');
INSERT INTO `js_zone` VALUES ('1301', '86', 'Saint Patrick', 'P', '1');
INSERT INTO `js_zone` VALUES ('1302', '86', 'Carriacou', 'C', '1');
INSERT INTO `js_zone` VALUES ('1303', '86', 'Petit Martinique', 'Q', '1');
INSERT INTO `js_zone` VALUES ('1304', '89', 'Alta Verapaz', 'AV', '1');
INSERT INTO `js_zone` VALUES ('1305', '89', 'Baja Verapaz', 'BV', '1');
INSERT INTO `js_zone` VALUES ('1306', '89', 'Chimaltenango', 'CM', '1');
INSERT INTO `js_zone` VALUES ('1307', '89', 'Chiquimula', 'CQ', '1');
INSERT INTO `js_zone` VALUES ('1308', '89', 'El Peten', 'PE', '1');
INSERT INTO `js_zone` VALUES ('1309', '89', 'El Progreso', 'PR', '1');
INSERT INTO `js_zone` VALUES ('1310', '89', 'El Quiche', 'QC', '1');
INSERT INTO `js_zone` VALUES ('1311', '89', 'Escuintla', 'ES', '1');
INSERT INTO `js_zone` VALUES ('1312', '89', 'Guatemala', 'GU', '1');
INSERT INTO `js_zone` VALUES ('1313', '89', 'Huehuetenango', 'HU', '1');
INSERT INTO `js_zone` VALUES ('1314', '89', 'Izabal', 'IZ', '1');
INSERT INTO `js_zone` VALUES ('1315', '89', 'Jalapa', 'JA', '1');
INSERT INTO `js_zone` VALUES ('1316', '89', 'Jutiapa', 'JU', '1');
INSERT INTO `js_zone` VALUES ('1317', '89', 'Quetzaltenango', 'QZ', '1');
INSERT INTO `js_zone` VALUES ('1318', '89', 'Retalhuleu', 'RE', '1');
INSERT INTO `js_zone` VALUES ('1319', '89', 'Sacatepequez', 'ST', '1');
INSERT INTO `js_zone` VALUES ('1320', '89', 'San Marcos', 'SM', '1');
INSERT INTO `js_zone` VALUES ('1321', '89', 'Santa Rosa', 'SR', '1');
INSERT INTO `js_zone` VALUES ('1322', '89', 'Solola', 'SO', '1');
INSERT INTO `js_zone` VALUES ('1323', '89', 'Suchitepequez', 'SU', '1');
INSERT INTO `js_zone` VALUES ('1324', '89', 'Totonicapan', 'TO', '1');
INSERT INTO `js_zone` VALUES ('1325', '89', 'Zacapa', 'ZA', '1');
INSERT INTO `js_zone` VALUES ('1326', '90', 'Conakry', 'CNK', '1');
INSERT INTO `js_zone` VALUES ('1327', '90', 'Beyla', 'BYL', '1');
INSERT INTO `js_zone` VALUES ('1328', '90', 'Boffa', 'BFA', '1');
INSERT INTO `js_zone` VALUES ('1329', '90', 'Boke', 'BOK', '1');
INSERT INTO `js_zone` VALUES ('1330', '90', 'Coyah', 'COY', '1');
INSERT INTO `js_zone` VALUES ('1331', '90', 'Dabola', 'DBL', '1');
INSERT INTO `js_zone` VALUES ('1332', '90', 'Dalaba', 'DLB', '1');
INSERT INTO `js_zone` VALUES ('1333', '90', 'Dinguiraye', 'DGR', '1');
INSERT INTO `js_zone` VALUES ('1334', '90', 'Dubreka', 'DBR', '1');
INSERT INTO `js_zone` VALUES ('1335', '90', 'Faranah', 'FRN', '1');
INSERT INTO `js_zone` VALUES ('1336', '90', 'Forecariah', 'FRC', '1');
INSERT INTO `js_zone` VALUES ('1337', '90', 'Fria', 'FRI', '1');
INSERT INTO `js_zone` VALUES ('1338', '90', 'Gaoual', 'GAO', '1');
INSERT INTO `js_zone` VALUES ('1339', '90', 'Gueckedou', 'GCD', '1');
INSERT INTO `js_zone` VALUES ('1340', '90', 'Kankan', 'KNK', '1');
INSERT INTO `js_zone` VALUES ('1341', '90', 'Kerouane', 'KRN', '1');
INSERT INTO `js_zone` VALUES ('1342', '90', 'Kindia', 'KND', '1');
INSERT INTO `js_zone` VALUES ('1343', '90', 'Kissidougou', 'KSD', '1');
INSERT INTO `js_zone` VALUES ('1344', '90', 'Koubia', 'KBA', '1');
INSERT INTO `js_zone` VALUES ('1345', '90', 'Koundara', 'KDA', '1');
INSERT INTO `js_zone` VALUES ('1346', '90', 'Kouroussa', 'KRA', '1');
INSERT INTO `js_zone` VALUES ('1347', '90', 'Labe', 'LAB', '1');
INSERT INTO `js_zone` VALUES ('1348', '90', 'Lelouma', 'LLM', '1');
INSERT INTO `js_zone` VALUES ('1349', '90', 'Lola', 'LOL', '1');
INSERT INTO `js_zone` VALUES ('1350', '90', 'Macenta', 'MCT', '1');
INSERT INTO `js_zone` VALUES ('1351', '90', 'Mali', 'MAL', '1');
INSERT INTO `js_zone` VALUES ('1352', '90', 'Mamou', 'MAM', '1');
INSERT INTO `js_zone` VALUES ('1353', '90', 'Mandiana', 'MAN', '1');
INSERT INTO `js_zone` VALUES ('1354', '90', 'Nzerekore', 'NZR', '1');
INSERT INTO `js_zone` VALUES ('1355', '90', 'Pita', 'PIT', '1');
INSERT INTO `js_zone` VALUES ('1356', '90', 'Siguiri', 'SIG', '1');
INSERT INTO `js_zone` VALUES ('1357', '90', 'Telimele', 'TLM', '1');
INSERT INTO `js_zone` VALUES ('1358', '90', 'Tougue', 'TOG', '1');
INSERT INTO `js_zone` VALUES ('1359', '90', 'Yomou', 'YOM', '1');
INSERT INTO `js_zone` VALUES ('1360', '91', 'Bafata Region', 'BF', '1');
INSERT INTO `js_zone` VALUES ('1361', '91', 'Biombo Region', 'BB', '1');
INSERT INTO `js_zone` VALUES ('1362', '91', 'Bissau Region', 'BS', '1');
INSERT INTO `js_zone` VALUES ('1363', '91', 'Bolama Region', 'BL', '1');
INSERT INTO `js_zone` VALUES ('1364', '91', 'Cacheu Region', 'CA', '1');
INSERT INTO `js_zone` VALUES ('1365', '91', 'Gabu Region', 'GA', '1');
INSERT INTO `js_zone` VALUES ('1366', '91', 'Oio Region', 'OI', '1');
INSERT INTO `js_zone` VALUES ('1367', '91', 'Quinara Region', 'QU', '1');
INSERT INTO `js_zone` VALUES ('1368', '91', 'Tombali Region', 'TO', '1');
INSERT INTO `js_zone` VALUES ('1369', '92', 'Barima-Waini', 'BW', '1');
INSERT INTO `js_zone` VALUES ('1370', '92', 'Cuyuni-Mazaruni', 'CM', '1');
INSERT INTO `js_zone` VALUES ('1371', '92', 'Demerara-Mahaica', 'DM', '1');
INSERT INTO `js_zone` VALUES ('1372', '92', 'East Berbice-Corentyne', 'EC', '1');
INSERT INTO `js_zone` VALUES ('1373', '92', 'Essequibo Islands-West Demerara', 'EW', '1');
INSERT INTO `js_zone` VALUES ('1374', '92', 'Mahaica-Berbice', 'MB', '1');
INSERT INTO `js_zone` VALUES ('1375', '92', 'Pomeroon-Supenaam', 'PM', '1');
INSERT INTO `js_zone` VALUES ('1376', '92', 'Potaro-Siparuni', 'PI', '1');
INSERT INTO `js_zone` VALUES ('1377', '92', 'Upper Demerara-Berbice', 'UD', '1');
INSERT INTO `js_zone` VALUES ('1378', '92', 'Upper Takutu-Upper Essequibo', 'UT', '1');
INSERT INTO `js_zone` VALUES ('1379', '93', 'Artibonite', 'AR', '1');
INSERT INTO `js_zone` VALUES ('1380', '93', 'Centre', 'CE', '1');
INSERT INTO `js_zone` VALUES ('1381', '93', 'Grand\'Anse', 'GA', '1');
INSERT INTO `js_zone` VALUES ('1382', '93', 'Nord', 'ND', '1');
INSERT INTO `js_zone` VALUES ('1383', '93', 'Nord-Est', 'NE', '1');
INSERT INTO `js_zone` VALUES ('1384', '93', 'Nord-Ouest', 'NO', '1');
INSERT INTO `js_zone` VALUES ('1385', '93', 'Ouest', 'OU', '1');
INSERT INTO `js_zone` VALUES ('1386', '93', 'Sud', 'SD', '1');
INSERT INTO `js_zone` VALUES ('1387', '93', 'Sud-Est', 'SE', '1');
INSERT INTO `js_zone` VALUES ('1388', '94', 'Flat Island', 'F', '1');
INSERT INTO `js_zone` VALUES ('1389', '94', 'McDonald Island', 'M', '1');
INSERT INTO `js_zone` VALUES ('1390', '94', 'Shag Island', 'S', '1');
INSERT INTO `js_zone` VALUES ('1391', '94', 'Heard Island', 'H', '1');
INSERT INTO `js_zone` VALUES ('1392', '95', 'Atlantida', 'AT', '1');
INSERT INTO `js_zone` VALUES ('1393', '95', 'Choluteca', 'CH', '1');
INSERT INTO `js_zone` VALUES ('1394', '95', 'Colon', 'CL', '1');
INSERT INTO `js_zone` VALUES ('1395', '95', 'Comayagua', 'CM', '1');
INSERT INTO `js_zone` VALUES ('1396', '95', 'Copan', 'CP', '1');
INSERT INTO `js_zone` VALUES ('1397', '95', 'Cortes', 'CR', '1');
INSERT INTO `js_zone` VALUES ('1398', '95', 'El Paraiso', 'PA', '1');
INSERT INTO `js_zone` VALUES ('1399', '95', 'Francisco Morazan', 'FM', '1');
INSERT INTO `js_zone` VALUES ('1400', '95', 'Gracias a Dios', 'GD', '1');
INSERT INTO `js_zone` VALUES ('1401', '95', 'Intibuca', 'IN', '1');
INSERT INTO `js_zone` VALUES ('1402', '95', 'Islas de la Bahia (Bay Islands)', 'IB', '1');
INSERT INTO `js_zone` VALUES ('1403', '95', 'La Paz', 'PZ', '1');
INSERT INTO `js_zone` VALUES ('1404', '95', 'Lempira', 'LE', '1');
INSERT INTO `js_zone` VALUES ('1405', '95', 'Ocotepeque', 'OC', '1');
INSERT INTO `js_zone` VALUES ('1406', '95', 'Olancho', 'OL', '1');
INSERT INTO `js_zone` VALUES ('1407', '95', 'Santa Barbara', 'SB', '1');
INSERT INTO `js_zone` VALUES ('1408', '95', 'Valle', 'VA', '1');
INSERT INTO `js_zone` VALUES ('1409', '95', 'Yoro', 'YO', '1');
INSERT INTO `js_zone` VALUES ('1410', '96', 'Central and Western Hong Kong Island', 'HCW', '1');
INSERT INTO `js_zone` VALUES ('1411', '96', 'Eastern Hong Kong Island', 'HEA', '1');
INSERT INTO `js_zone` VALUES ('1412', '96', 'Southern Hong Kong Island', 'HSO', '1');
INSERT INTO `js_zone` VALUES ('1413', '96', 'Wan Chai Hong Kong Island', 'HWC', '1');
INSERT INTO `js_zone` VALUES ('1414', '96', 'Kowloon City Kowloon', 'KKC', '1');
INSERT INTO `js_zone` VALUES ('1415', '96', 'Kwun Tong Kowloon', 'KKT', '1');
INSERT INTO `js_zone` VALUES ('1416', '96', 'Sham Shui Po Kowloon', 'KSS', '1');
INSERT INTO `js_zone` VALUES ('1417', '96', 'Wong Tai Sin Kowloon', 'KWT', '1');
INSERT INTO `js_zone` VALUES ('1418', '96', 'Yau Tsim Mong Kowloon', 'KYT', '1');
INSERT INTO `js_zone` VALUES ('1419', '96', 'Islands New Territories', 'NIS', '1');
INSERT INTO `js_zone` VALUES ('1420', '96', 'Kwai Tsing New Territories', 'NKT', '1');
INSERT INTO `js_zone` VALUES ('1421', '96', 'North New Territories', 'NNO', '1');
INSERT INTO `js_zone` VALUES ('1422', '96', 'Sai Kung New Territories', 'NSK', '1');
INSERT INTO `js_zone` VALUES ('1423', '96', 'Sha Tin New Territories', 'NST', '1');
INSERT INTO `js_zone` VALUES ('1424', '96', 'Tai Po New Territories', 'NTP', '1');
INSERT INTO `js_zone` VALUES ('1425', '96', 'Tsuen Wan New Territories', 'NTW', '1');
INSERT INTO `js_zone` VALUES ('1426', '96', 'Tuen Mun New Territories', 'NTM', '1');
INSERT INTO `js_zone` VALUES ('1427', '96', 'Yuen Long New Territories', 'NYL', '1');
INSERT INTO `js_zone` VALUES ('1428', '97', 'Bacs-Kiskun', 'BK', '1');
INSERT INTO `js_zone` VALUES ('1429', '97', 'Baranya', 'BA', '1');
INSERT INTO `js_zone` VALUES ('1430', '97', 'Bekes', 'BE', '1');
INSERT INTO `js_zone` VALUES ('1431', '97', 'Bekescsaba', 'BS', '1');
INSERT INTO `js_zone` VALUES ('1432', '97', 'Borsod-Abauj-Zemplen', 'BZ', '1');
INSERT INTO `js_zone` VALUES ('1433', '97', 'Budapest', 'BU', '1');
INSERT INTO `js_zone` VALUES ('1434', '97', 'Csongrad', 'CS', '1');
INSERT INTO `js_zone` VALUES ('1435', '97', 'Debrecen', 'DE', '1');
INSERT INTO `js_zone` VALUES ('1436', '97', 'Dunaujvaros', 'DU', '1');
INSERT INTO `js_zone` VALUES ('1437', '97', 'Eger', 'EG', '1');
INSERT INTO `js_zone` VALUES ('1438', '97', 'Fejer', 'FE', '1');
INSERT INTO `js_zone` VALUES ('1439', '97', 'Gyor', 'GY', '1');
INSERT INTO `js_zone` VALUES ('1440', '97', 'Gyor-Moson-Sopron', 'GM', '1');
INSERT INTO `js_zone` VALUES ('1441', '97', 'Hajdu-Bihar', 'HB', '1');
INSERT INTO `js_zone` VALUES ('1442', '97', 'Heves', 'HE', '1');
INSERT INTO `js_zone` VALUES ('1443', '97', 'Hodmezovasarhely', 'HO', '1');
INSERT INTO `js_zone` VALUES ('1444', '97', 'Jasz-Nagykun-Szolnok', 'JN', '1');
INSERT INTO `js_zone` VALUES ('1445', '97', 'Kaposvar', 'KA', '1');
INSERT INTO `js_zone` VALUES ('1446', '97', 'Kecskemet', 'KE', '1');
INSERT INTO `js_zone` VALUES ('1447', '97', 'Komarom-Esztergom', 'KO', '1');
INSERT INTO `js_zone` VALUES ('1448', '97', 'Miskolc', 'MI', '1');
INSERT INTO `js_zone` VALUES ('1449', '97', 'Nagykanizsa', 'NA', '1');
INSERT INTO `js_zone` VALUES ('1450', '97', 'Nograd', 'NO', '1');
INSERT INTO `js_zone` VALUES ('1451', '97', 'Nyiregyhaza', 'NY', '1');
INSERT INTO `js_zone` VALUES ('1452', '97', 'Pecs', 'PE', '1');
INSERT INTO `js_zone` VALUES ('1453', '97', 'Pest', 'PS', '1');
INSERT INTO `js_zone` VALUES ('1454', '97', 'Somogy', 'SO', '1');
INSERT INTO `js_zone` VALUES ('1455', '97', 'Sopron', 'SP', '1');
INSERT INTO `js_zone` VALUES ('1456', '97', 'Szabolcs-Szatmar-Bereg', 'SS', '1');
INSERT INTO `js_zone` VALUES ('1457', '97', 'Szeged', 'SZ', '1');
INSERT INTO `js_zone` VALUES ('1458', '97', 'Szekesfehervar', 'SE', '1');
INSERT INTO `js_zone` VALUES ('1459', '97', 'Szolnok', 'SL', '1');
INSERT INTO `js_zone` VALUES ('1460', '97', 'Szombathely', 'SM', '1');
INSERT INTO `js_zone` VALUES ('1461', '97', 'Tatabanya', 'TA', '1');
INSERT INTO `js_zone` VALUES ('1462', '97', 'Tolna', 'TO', '1');
INSERT INTO `js_zone` VALUES ('1463', '97', 'Vas', 'VA', '1');
INSERT INTO `js_zone` VALUES ('1464', '97', 'Veszprem', 'VE', '1');
INSERT INTO `js_zone` VALUES ('1465', '97', 'Zala', 'ZA', '1');
INSERT INTO `js_zone` VALUES ('1466', '97', 'Zalaegerszeg', 'ZZ', '1');
INSERT INTO `js_zone` VALUES ('1467', '98', 'Austurland', 'AL', '1');
INSERT INTO `js_zone` VALUES ('1468', '98', 'Hofuoborgarsvaeoi', 'HF', '1');
INSERT INTO `js_zone` VALUES ('1469', '98', 'Norourland eystra', 'NE', '1');
INSERT INTO `js_zone` VALUES ('1470', '98', 'Norourland vestra', 'NV', '1');
INSERT INTO `js_zone` VALUES ('1471', '98', 'Suourland', 'SL', '1');
INSERT INTO `js_zone` VALUES ('1472', '98', 'Suournes', 'SN', '1');
INSERT INTO `js_zone` VALUES ('1473', '98', 'Vestfiroir', 'VF', '1');
INSERT INTO `js_zone` VALUES ('1474', '98', 'Vesturland', 'VL', '1');
INSERT INTO `js_zone` VALUES ('1475', '99', 'Andaman and Nicobar Islands', 'AN', '1');
INSERT INTO `js_zone` VALUES ('1476', '99', 'Andhra Pradesh', 'AP', '1');
INSERT INTO `js_zone` VALUES ('1477', '99', 'Arunachal Pradesh', 'AR', '1');
INSERT INTO `js_zone` VALUES ('1478', '99', 'Assam', 'AS', '1');
INSERT INTO `js_zone` VALUES ('1479', '99', 'Bihar', 'BI', '1');
INSERT INTO `js_zone` VALUES ('1480', '99', 'Chandigarh', 'CH', '1');
INSERT INTO `js_zone` VALUES ('1481', '99', 'Dadra and Nagar Haveli', 'DA', '1');
INSERT INTO `js_zone` VALUES ('1482', '99', 'Daman and Diu', 'DM', '1');
INSERT INTO `js_zone` VALUES ('1483', '99', 'Delhi', 'DE', '1');
INSERT INTO `js_zone` VALUES ('1484', '99', 'Goa', 'GO', '1');
INSERT INTO `js_zone` VALUES ('1485', '99', 'Gujarat', 'GU', '1');
INSERT INTO `js_zone` VALUES ('1486', '99', 'Haryana', 'HA', '1');
INSERT INTO `js_zone` VALUES ('1487', '99', 'Himachal Pradesh', 'HP', '1');
INSERT INTO `js_zone` VALUES ('1488', '99', 'Jammu and Kashmir', 'JA', '1');
INSERT INTO `js_zone` VALUES ('1489', '99', 'Karnataka', 'KA', '1');
INSERT INTO `js_zone` VALUES ('1490', '99', 'Kerala', 'KE', '1');
INSERT INTO `js_zone` VALUES ('1491', '99', 'Lakshadweep Islands', 'LI', '1');
INSERT INTO `js_zone` VALUES ('1492', '99', 'Madhya Pradesh', 'MP', '1');
INSERT INTO `js_zone` VALUES ('1493', '99', 'Maharashtra', 'MA', '1');
INSERT INTO `js_zone` VALUES ('1494', '99', 'Manipur', 'MN', '1');
INSERT INTO `js_zone` VALUES ('1495', '99', 'Meghalaya', 'ME', '1');
INSERT INTO `js_zone` VALUES ('1496', '99', 'Mizoram', 'MI', '1');
INSERT INTO `js_zone` VALUES ('1497', '99', 'Nagaland', 'NA', '1');
INSERT INTO `js_zone` VALUES ('1498', '99', 'Orissa', 'OR', '1');
INSERT INTO `js_zone` VALUES ('1499', '99', 'Pondicherry', 'PO', '1');
INSERT INTO `js_zone` VALUES ('1500', '99', 'Punjab', 'PU', '1');
INSERT INTO `js_zone` VALUES ('1501', '99', 'Rajasthan', 'RA', '1');
INSERT INTO `js_zone` VALUES ('1502', '99', 'Sikkim', 'SI', '1');
INSERT INTO `js_zone` VALUES ('1503', '99', 'Tamil Nadu', 'TN', '1');
INSERT INTO `js_zone` VALUES ('1504', '99', 'Tripura', 'TR', '1');
INSERT INTO `js_zone` VALUES ('1505', '99', 'Uttar Pradesh', 'UP', '1');
INSERT INTO `js_zone` VALUES ('1506', '99', 'West Bengal', 'WB', '1');
INSERT INTO `js_zone` VALUES ('1507', '100', 'Aceh', 'AC', '1');
INSERT INTO `js_zone` VALUES ('1508', '100', 'Bali', 'BA', '1');
INSERT INTO `js_zone` VALUES ('1509', '100', 'Banten', 'BT', '1');
INSERT INTO `js_zone` VALUES ('1510', '100', 'Bengkulu', 'BE', '1');
INSERT INTO `js_zone` VALUES ('1511', '100', 'BoDeTaBek', 'BD', '1');
INSERT INTO `js_zone` VALUES ('1512', '100', 'Gorontalo', 'GO', '1');
INSERT INTO `js_zone` VALUES ('1513', '100', 'Jakarta Raya', 'JK', '1');
INSERT INTO `js_zone` VALUES ('1514', '100', 'Jambi', 'JA', '1');
INSERT INTO `js_zone` VALUES ('1515', '100', 'Jawa Barat', 'JB', '1');
INSERT INTO `js_zone` VALUES ('1516', '100', 'Jawa Tengah', 'JT', '1');
INSERT INTO `js_zone` VALUES ('1517', '100', 'Jawa Timur', 'JI', '1');
INSERT INTO `js_zone` VALUES ('1518', '100', 'Kalimantan Barat', 'KB', '1');
INSERT INTO `js_zone` VALUES ('1519', '100', 'Kalimantan Selatan', 'KS', '1');
INSERT INTO `js_zone` VALUES ('1520', '100', 'Kalimantan Tengah', 'KT', '1');
INSERT INTO `js_zone` VALUES ('1521', '100', 'Kalimantan Timur', 'KI', '1');
INSERT INTO `js_zone` VALUES ('1522', '100', 'Kepulauan Bangka Belitung', 'BB', '1');
INSERT INTO `js_zone` VALUES ('1523', '100', 'Lampung', 'LA', '1');
INSERT INTO `js_zone` VALUES ('1524', '100', 'Maluku', 'MA', '1');
INSERT INTO `js_zone` VALUES ('1525', '100', 'Maluku Utara', 'MU', '1');
INSERT INTO `js_zone` VALUES ('1526', '100', 'Nusa Tenggara Barat', 'NB', '1');
INSERT INTO `js_zone` VALUES ('1527', '100', 'Nusa Tenggara Timur', 'NT', '1');
INSERT INTO `js_zone` VALUES ('1528', '100', 'Papua', 'PA', '1');
INSERT INTO `js_zone` VALUES ('1529', '100', 'Riau', 'RI', '1');
INSERT INTO `js_zone` VALUES ('1530', '100', 'Sulawesi Selatan', 'SN', '1');
INSERT INTO `js_zone` VALUES ('1531', '100', 'Sulawesi Tengah', 'ST', '1');
INSERT INTO `js_zone` VALUES ('1532', '100', 'Sulawesi Tenggara', 'SG', '1');
INSERT INTO `js_zone` VALUES ('1533', '100', 'Sulawesi Utara', 'SA', '1');
INSERT INTO `js_zone` VALUES ('1534', '100', 'Sumatera Barat', 'SB', '1');
INSERT INTO `js_zone` VALUES ('1535', '100', 'Sumatera Selatan', 'SS', '1');
INSERT INTO `js_zone` VALUES ('1536', '100', 'Sumatera Utara', 'SU', '1');
INSERT INTO `js_zone` VALUES ('1537', '100', 'Yogyakarta', 'YO', '1');
INSERT INTO `js_zone` VALUES ('1538', '101', 'Tehran', 'TEH', '1');
INSERT INTO `js_zone` VALUES ('1539', '101', 'Qom', 'QOM', '1');
INSERT INTO `js_zone` VALUES ('1540', '101', 'Markazi', 'MKZ', '1');
INSERT INTO `js_zone` VALUES ('1541', '101', 'Qazvin', 'QAZ', '1');
INSERT INTO `js_zone` VALUES ('1542', '101', 'Gilan', 'GIL', '1');
INSERT INTO `js_zone` VALUES ('1543', '101', 'Ardabil', 'ARD', '1');
INSERT INTO `js_zone` VALUES ('1544', '101', 'Zanjan', 'ZAN', '1');
INSERT INTO `js_zone` VALUES ('1545', '101', 'East Azarbaijan', 'EAZ', '1');
INSERT INTO `js_zone` VALUES ('1546', '101', 'West Azarbaijan', 'WEZ', '1');
INSERT INTO `js_zone` VALUES ('1547', '101', 'Kurdistan', 'KRD', '1');
INSERT INTO `js_zone` VALUES ('1548', '101', 'Hamadan', 'HMD', '1');
INSERT INTO `js_zone` VALUES ('1549', '101', 'Kermanshah', 'KRM', '1');
INSERT INTO `js_zone` VALUES ('1550', '101', 'Ilam', 'ILM', '1');
INSERT INTO `js_zone` VALUES ('1551', '101', 'Lorestan', 'LRS', '1');
INSERT INTO `js_zone` VALUES ('1552', '101', 'Khuzestan', 'KZT', '1');
INSERT INTO `js_zone` VALUES ('1553', '101', 'Chahar Mahaal and Bakhtiari', 'CMB', '1');
INSERT INTO `js_zone` VALUES ('1554', '101', 'Kohkiluyeh and Buyer Ahmad', 'KBA', '1');
INSERT INTO `js_zone` VALUES ('1555', '101', 'Bushehr', 'BSH', '1');
INSERT INTO `js_zone` VALUES ('1556', '101', 'Fars', 'FAR', '1');
INSERT INTO `js_zone` VALUES ('1557', '101', 'Hormozgan', 'HRM', '1');
INSERT INTO `js_zone` VALUES ('1558', '101', 'Sistan and Baluchistan', 'SBL', '1');
INSERT INTO `js_zone` VALUES ('1559', '101', 'Kerman', 'KRB', '1');
INSERT INTO `js_zone` VALUES ('1560', '101', 'Yazd', 'YZD', '1');
INSERT INTO `js_zone` VALUES ('1561', '101', 'Esfahan', 'EFH', '1');
INSERT INTO `js_zone` VALUES ('1562', '101', 'Semnan', 'SMN', '1');
INSERT INTO `js_zone` VALUES ('1563', '101', 'Mazandaran', 'MZD', '1');
INSERT INTO `js_zone` VALUES ('1564', '101', 'Golestan', 'GLS', '1');
INSERT INTO `js_zone` VALUES ('1565', '101', 'North Khorasan', 'NKH', '1');
INSERT INTO `js_zone` VALUES ('1566', '101', 'Razavi Khorasan', 'RKH', '1');
INSERT INTO `js_zone` VALUES ('1567', '101', 'South Khorasan', 'SKH', '1');
INSERT INTO `js_zone` VALUES ('1568', '102', 'Baghdad', 'BD', '1');
INSERT INTO `js_zone` VALUES ('1569', '102', 'Salah ad Din', 'SD', '1');
INSERT INTO `js_zone` VALUES ('1570', '102', 'Diyala', 'DY', '1');
INSERT INTO `js_zone` VALUES ('1571', '102', 'Wasit', 'WS', '1');
INSERT INTO `js_zone` VALUES ('1572', '102', 'Maysan', 'MY', '1');
INSERT INTO `js_zone` VALUES ('1573', '102', 'Al Basrah', 'BA', '1');
INSERT INTO `js_zone` VALUES ('1574', '102', 'Dhi Qar', 'DQ', '1');
INSERT INTO `js_zone` VALUES ('1575', '102', 'Al Muthanna', 'MU', '1');
INSERT INTO `js_zone` VALUES ('1576', '102', 'Al Qadisyah', 'QA', '1');
INSERT INTO `js_zone` VALUES ('1577', '102', 'Babil', 'BB', '1');
INSERT INTO `js_zone` VALUES ('1578', '102', 'Al Karbala', 'KB', '1');
INSERT INTO `js_zone` VALUES ('1579', '102', 'An Najaf', 'NJ', '1');
INSERT INTO `js_zone` VALUES ('1580', '102', 'Al Anbar', 'AB', '1');
INSERT INTO `js_zone` VALUES ('1581', '102', 'Ninawa', 'NN', '1');
INSERT INTO `js_zone` VALUES ('1582', '102', 'Dahuk', 'DH', '1');
INSERT INTO `js_zone` VALUES ('1583', '102', 'Arbil', 'AL', '1');
INSERT INTO `js_zone` VALUES ('1584', '102', 'At Ta\'mim', 'TM', '1');
INSERT INTO `js_zone` VALUES ('1585', '102', 'As Sulaymaniyah', 'SL', '1');
INSERT INTO `js_zone` VALUES ('1586', '103', 'Carlow', 'CA', '1');
INSERT INTO `js_zone` VALUES ('1587', '103', 'Cavan', 'CV', '1');
INSERT INTO `js_zone` VALUES ('1588', '103', 'Clare', 'CL', '1');
INSERT INTO `js_zone` VALUES ('1589', '103', 'Cork', 'CO', '1');
INSERT INTO `js_zone` VALUES ('1590', '103', 'Donegal', 'DO', '1');
INSERT INTO `js_zone` VALUES ('1591', '103', 'Dublin', 'DU', '1');
INSERT INTO `js_zone` VALUES ('1592', '103', 'Galway', 'GA', '1');
INSERT INTO `js_zone` VALUES ('1593', '103', 'Kerry', 'KE', '1');
INSERT INTO `js_zone` VALUES ('1594', '103', 'Kildare', 'KI', '1');
INSERT INTO `js_zone` VALUES ('1595', '103', 'Kilkenny', 'KL', '1');
INSERT INTO `js_zone` VALUES ('1596', '103', 'Laois', 'LA', '1');
INSERT INTO `js_zone` VALUES ('1597', '103', 'Leitrim', 'LE', '1');
INSERT INTO `js_zone` VALUES ('1598', '103', 'Limerick', 'LI', '1');
INSERT INTO `js_zone` VALUES ('1599', '103', 'Longford', 'LO', '1');
INSERT INTO `js_zone` VALUES ('1600', '103', 'Louth', 'LU', '1');
INSERT INTO `js_zone` VALUES ('1601', '103', 'Mayo', 'MA', '1');
INSERT INTO `js_zone` VALUES ('1602', '103', 'Meath', 'ME', '1');
INSERT INTO `js_zone` VALUES ('1603', '103', 'Monaghan', 'MO', '1');
INSERT INTO `js_zone` VALUES ('1604', '103', 'Offaly', 'OF', '1');
INSERT INTO `js_zone` VALUES ('1605', '103', 'Roscommon', 'RO', '1');
INSERT INTO `js_zone` VALUES ('1606', '103', 'Sligo', 'SL', '1');
INSERT INTO `js_zone` VALUES ('1607', '103', 'Tipperary', 'TI', '1');
INSERT INTO `js_zone` VALUES ('1608', '103', 'Waterford', 'WA', '1');
INSERT INTO `js_zone` VALUES ('1609', '103', 'Westmeath', 'WE', '1');
INSERT INTO `js_zone` VALUES ('1610', '103', 'Wexford', 'WX', '1');
INSERT INTO `js_zone` VALUES ('1611', '103', 'Wicklow', 'WI', '1');
INSERT INTO `js_zone` VALUES ('1612', '104', 'Be\'er Sheva', 'BS', '1');
INSERT INTO `js_zone` VALUES ('1613', '104', 'Bika\'at Hayarden', 'BH', '1');
INSERT INTO `js_zone` VALUES ('1614', '104', 'Eilat and Arava', 'EA', '1');
INSERT INTO `js_zone` VALUES ('1615', '104', 'Galil', 'GA', '1');
INSERT INTO `js_zone` VALUES ('1616', '104', 'Haifa', 'HA', '1');
INSERT INTO `js_zone` VALUES ('1617', '104', 'Jehuda Mountains', 'JM', '1');
INSERT INTO `js_zone` VALUES ('1618', '104', 'Jerusalem', 'JE', '1');
INSERT INTO `js_zone` VALUES ('1619', '104', 'Negev', 'NE', '1');
INSERT INTO `js_zone` VALUES ('1620', '104', 'Semaria', 'SE', '1');
INSERT INTO `js_zone` VALUES ('1621', '104', 'Sharon', 'SH', '1');
INSERT INTO `js_zone` VALUES ('1622', '104', 'Tel Aviv (Gosh Dan)', 'TA', '1');
INSERT INTO `js_zone` VALUES ('3860', '105', 'Caltanissetta', 'CL', '1');
INSERT INTO `js_zone` VALUES ('3842', '105', 'Agrigento', 'AG', '1');
INSERT INTO `js_zone` VALUES ('3843', '105', 'Alessandria', 'AL', '1');
INSERT INTO `js_zone` VALUES ('3844', '105', 'Ancona', 'AN', '1');
INSERT INTO `js_zone` VALUES ('3845', '105', 'Aosta', 'AO', '1');
INSERT INTO `js_zone` VALUES ('3846', '105', 'Arezzo', 'AR', '1');
INSERT INTO `js_zone` VALUES ('3847', '105', 'Ascoli Piceno', 'AP', '1');
INSERT INTO `js_zone` VALUES ('3848', '105', 'Asti', 'AT', '1');
INSERT INTO `js_zone` VALUES ('3849', '105', 'Avellino', 'AV', '1');
INSERT INTO `js_zone` VALUES ('3850', '105', 'Bari', 'BA', '1');
INSERT INTO `js_zone` VALUES ('3851', '105', 'Belluno', 'BL', '1');
INSERT INTO `js_zone` VALUES ('3852', '105', 'Benevento', 'BN', '1');
INSERT INTO `js_zone` VALUES ('3853', '105', 'Bergamo', 'BG', '1');
INSERT INTO `js_zone` VALUES ('3854', '105', 'Biella', 'BI', '1');
INSERT INTO `js_zone` VALUES ('3855', '105', 'Bologna', 'BO', '1');
INSERT INTO `js_zone` VALUES ('3856', '105', 'Bolzano', 'BZ', '1');
INSERT INTO `js_zone` VALUES ('3857', '105', 'Brescia', 'BS', '1');
INSERT INTO `js_zone` VALUES ('3858', '105', 'Brindisi', 'BR', '1');
INSERT INTO `js_zone` VALUES ('3859', '105', 'Cagliari', 'CA', '1');
INSERT INTO `js_zone` VALUES ('1643', '106', 'Clarendon Parish', 'CLA', '1');
INSERT INTO `js_zone` VALUES ('1644', '106', 'Hanover Parish', 'HAN', '1');
INSERT INTO `js_zone` VALUES ('1645', '106', 'Kingston Parish', 'KIN', '1');
INSERT INTO `js_zone` VALUES ('1646', '106', 'Manchester Parish', 'MAN', '1');
INSERT INTO `js_zone` VALUES ('1647', '106', 'Portland Parish', 'POR', '1');
INSERT INTO `js_zone` VALUES ('1648', '106', 'Saint Andrew Parish', 'AND', '1');
INSERT INTO `js_zone` VALUES ('1649', '106', 'Saint Ann Parish', 'ANN', '1');
INSERT INTO `js_zone` VALUES ('1650', '106', 'Saint Catherine Parish', 'CAT', '1');
INSERT INTO `js_zone` VALUES ('1651', '106', 'Saint Elizabeth Parish', 'ELI', '1');
INSERT INTO `js_zone` VALUES ('1652', '106', 'Saint James Parish', 'JAM', '1');
INSERT INTO `js_zone` VALUES ('1653', '106', 'Saint Mary Parish', 'MAR', '1');
INSERT INTO `js_zone` VALUES ('1654', '106', 'Saint Thomas Parish', 'THO', '1');
INSERT INTO `js_zone` VALUES ('1655', '106', 'Trelawny Parish', 'TRL', '1');
INSERT INTO `js_zone` VALUES ('1656', '106', 'Westmoreland Parish', 'WML', '1');
INSERT INTO `js_zone` VALUES ('1657', '107', 'Aichi', 'AI', '1');
INSERT INTO `js_zone` VALUES ('1658', '107', 'Akita', 'AK', '1');
INSERT INTO `js_zone` VALUES ('1659', '107', 'Aomori', 'AO', '1');
INSERT INTO `js_zone` VALUES ('1660', '107', 'Chiba', 'CH', '1');
INSERT INTO `js_zone` VALUES ('1661', '107', 'Ehime', 'EH', '1');
INSERT INTO `js_zone` VALUES ('1662', '107', 'Fukui', 'FK', '1');
INSERT INTO `js_zone` VALUES ('1663', '107', 'Fukuoka', 'FU', '1');
INSERT INTO `js_zone` VALUES ('1664', '107', 'Fukushima', 'FS', '1');
INSERT INTO `js_zone` VALUES ('1665', '107', 'Gifu', 'GI', '1');
INSERT INTO `js_zone` VALUES ('1666', '107', 'Gumma', 'GU', '1');
INSERT INTO `js_zone` VALUES ('1667', '107', 'Hiroshima', 'HI', '1');
INSERT INTO `js_zone` VALUES ('1668', '107', 'Hokkaido', 'HO', '1');
INSERT INTO `js_zone` VALUES ('1669', '107', 'Hyogo', 'HY', '1');
INSERT INTO `js_zone` VALUES ('1670', '107', 'Ibaraki', 'IB', '1');
INSERT INTO `js_zone` VALUES ('1671', '107', 'Ishikawa', 'IS', '1');
INSERT INTO `js_zone` VALUES ('1672', '107', 'Iwate', 'IW', '1');
INSERT INTO `js_zone` VALUES ('1673', '107', 'Kagawa', 'KA', '1');
INSERT INTO `js_zone` VALUES ('1674', '107', 'Kagoshima', 'KG', '1');
INSERT INTO `js_zone` VALUES ('1675', '107', 'Kanagawa', 'KN', '1');
INSERT INTO `js_zone` VALUES ('1676', '107', 'Kochi', 'KO', '1');
INSERT INTO `js_zone` VALUES ('1677', '107', 'Kumamoto', 'KU', '1');
INSERT INTO `js_zone` VALUES ('1678', '107', 'Kyoto', 'KY', '1');
INSERT INTO `js_zone` VALUES ('1679', '107', 'Mie', 'MI', '1');
INSERT INTO `js_zone` VALUES ('1680', '107', 'Miyagi', 'MY', '1');
INSERT INTO `js_zone` VALUES ('1681', '107', 'Miyazaki', 'MZ', '1');
INSERT INTO `js_zone` VALUES ('1682', '107', 'Nagano', 'NA', '1');
INSERT INTO `js_zone` VALUES ('1683', '107', 'Nagasaki', 'NG', '1');
INSERT INTO `js_zone` VALUES ('1684', '107', 'Nara', 'NR', '1');
INSERT INTO `js_zone` VALUES ('1685', '107', 'Niigata', 'NI', '1');
INSERT INTO `js_zone` VALUES ('1686', '107', 'Oita', 'OI', '1');
INSERT INTO `js_zone` VALUES ('1687', '107', 'Okayama', 'OK', '1');
INSERT INTO `js_zone` VALUES ('1688', '107', 'Okinawa', 'ON', '1');
INSERT INTO `js_zone` VALUES ('1689', '107', 'Osaka', 'OS', '1');
INSERT INTO `js_zone` VALUES ('1690', '107', 'Saga', 'SA', '1');
INSERT INTO `js_zone` VALUES ('1691', '107', 'Saitama', 'SI', '1');
INSERT INTO `js_zone` VALUES ('1692', '107', 'Shiga', 'SH', '1');
INSERT INTO `js_zone` VALUES ('1693', '107', 'Shimane', 'SM', '1');
INSERT INTO `js_zone` VALUES ('1694', '107', 'Shizuoka', 'SZ', '1');
INSERT INTO `js_zone` VALUES ('1695', '107', 'Tochigi', 'TO', '1');
INSERT INTO `js_zone` VALUES ('1696', '107', 'Tokushima', 'TS', '1');
INSERT INTO `js_zone` VALUES ('1697', '107', 'Tokyo', 'TK', '1');
INSERT INTO `js_zone` VALUES ('1698', '107', 'Tottori', 'TT', '1');
INSERT INTO `js_zone` VALUES ('1699', '107', 'Toyama', 'TY', '1');
INSERT INTO `js_zone` VALUES ('1700', '107', 'Wakayama', 'WA', '1');
INSERT INTO `js_zone` VALUES ('1701', '107', 'Yamagata', 'YA', '1');
INSERT INTO `js_zone` VALUES ('1702', '107', 'Yamaguchi', 'YM', '1');
INSERT INTO `js_zone` VALUES ('1703', '107', 'Yamanashi', 'YN', '1');
INSERT INTO `js_zone` VALUES ('1704', '108', '\'Amman', 'AM', '1');
INSERT INTO `js_zone` VALUES ('1705', '108', 'Ajlun', 'AJ', '1');
INSERT INTO `js_zone` VALUES ('1706', '108', 'Al \'Aqabah', 'AA', '1');
INSERT INTO `js_zone` VALUES ('1707', '108', 'Al Balqa\'', 'AB', '1');
INSERT INTO `js_zone` VALUES ('1708', '108', 'Al Karak', 'AK', '1');
INSERT INTO `js_zone` VALUES ('1709', '108', 'Al Mafraq', 'AL', '1');
INSERT INTO `js_zone` VALUES ('1710', '108', 'At Tafilah', 'AT', '1');
INSERT INTO `js_zone` VALUES ('1711', '108', 'Az Zarqa\'', 'AZ', '1');
INSERT INTO `js_zone` VALUES ('1712', '108', 'Irbid', 'IR', '1');
INSERT INTO `js_zone` VALUES ('1713', '108', 'Jarash', 'JA', '1');
INSERT INTO `js_zone` VALUES ('1714', '108', 'Ma\'an', 'MA', '1');
INSERT INTO `js_zone` VALUES ('1715', '108', 'Madaba', 'MD', '1');
INSERT INTO `js_zone` VALUES ('1716', '109', 'Almaty', 'AL', '1');
INSERT INTO `js_zone` VALUES ('1717', '109', 'Almaty City', 'AC', '1');
INSERT INTO `js_zone` VALUES ('1718', '109', 'Aqmola', 'AM', '1');
INSERT INTO `js_zone` VALUES ('1719', '109', 'Aqtobe', 'AQ', '1');
INSERT INTO `js_zone` VALUES ('1720', '109', 'Astana City', 'AS', '1');
INSERT INTO `js_zone` VALUES ('1721', '109', 'Atyrau', 'AT', '1');
INSERT INTO `js_zone` VALUES ('1722', '109', 'Batys Qazaqstan', 'BA', '1');
INSERT INTO `js_zone` VALUES ('1723', '109', 'Bayqongyr City', 'BY', '1');
INSERT INTO `js_zone` VALUES ('1724', '109', 'Mangghystau', 'MA', '1');
INSERT INTO `js_zone` VALUES ('1725', '109', 'Ongtustik Qazaqstan', 'ON', '1');
INSERT INTO `js_zone` VALUES ('1726', '109', 'Pavlodar', 'PA', '1');
INSERT INTO `js_zone` VALUES ('1727', '109', 'Qaraghandy', 'QA', '1');
INSERT INTO `js_zone` VALUES ('1728', '109', 'Qostanay', 'QO', '1');
INSERT INTO `js_zone` VALUES ('1729', '109', 'Qyzylorda', 'QY', '1');
INSERT INTO `js_zone` VALUES ('1730', '109', 'Shyghys Qazaqstan', 'SH', '1');
INSERT INTO `js_zone` VALUES ('1731', '109', 'Soltustik Qazaqstan', 'SO', '1');
INSERT INTO `js_zone` VALUES ('1732', '109', 'Zhambyl', 'ZH', '1');
INSERT INTO `js_zone` VALUES ('1733', '110', 'Central', 'CE', '1');
INSERT INTO `js_zone` VALUES ('1734', '110', 'Coast', 'CO', '1');
INSERT INTO `js_zone` VALUES ('1735', '110', 'Eastern', 'EA', '1');
INSERT INTO `js_zone` VALUES ('1736', '110', 'Nairobi Area', 'NA', '1');
INSERT INTO `js_zone` VALUES ('1737', '110', 'North Eastern', 'NE', '1');
INSERT INTO `js_zone` VALUES ('1738', '110', 'Nyanza', 'NY', '1');
INSERT INTO `js_zone` VALUES ('1739', '110', 'Rift Valley', 'RV', '1');
INSERT INTO `js_zone` VALUES ('1740', '110', 'Western', 'WE', '1');
INSERT INTO `js_zone` VALUES ('1741', '111', 'Abaiang', 'AG', '1');
INSERT INTO `js_zone` VALUES ('1742', '111', 'Abemama', 'AM', '1');
INSERT INTO `js_zone` VALUES ('1743', '111', 'Aranuka', 'AK', '1');
INSERT INTO `js_zone` VALUES ('1744', '111', 'Arorae', 'AO', '1');
INSERT INTO `js_zone` VALUES ('1745', '111', 'Banaba', 'BA', '1');
INSERT INTO `js_zone` VALUES ('1746', '111', 'Beru', 'BE', '1');
INSERT INTO `js_zone` VALUES ('1747', '111', 'Butaritari', 'bT', '1');
INSERT INTO `js_zone` VALUES ('1748', '111', 'Kanton', 'KA', '1');
INSERT INTO `js_zone` VALUES ('1749', '111', 'Kiritimati', 'KR', '1');
INSERT INTO `js_zone` VALUES ('1750', '111', 'Kuria', 'KU', '1');
INSERT INTO `js_zone` VALUES ('1751', '111', 'Maiana', 'MI', '1');
INSERT INTO `js_zone` VALUES ('1752', '111', 'Makin', 'MN', '1');
INSERT INTO `js_zone` VALUES ('1753', '111', 'Marakei', 'ME', '1');
INSERT INTO `js_zone` VALUES ('1754', '111', 'Nikunau', 'NI', '1');
INSERT INTO `js_zone` VALUES ('1755', '111', 'Nonouti', 'NO', '1');
INSERT INTO `js_zone` VALUES ('1756', '111', 'Onotoa', 'ON', '1');
INSERT INTO `js_zone` VALUES ('1757', '111', 'Tabiteuea', 'TT', '1');
INSERT INTO `js_zone` VALUES ('1758', '111', 'Tabuaeran', 'TR', '1');
INSERT INTO `js_zone` VALUES ('1759', '111', 'Tamana', 'TM', '1');
INSERT INTO `js_zone` VALUES ('1760', '111', 'Tarawa', 'TW', '1');
INSERT INTO `js_zone` VALUES ('1761', '111', 'Teraina', 'TE', '1');
INSERT INTO `js_zone` VALUES ('1762', '112', 'Chagang-do', 'CHA', '1');
INSERT INTO `js_zone` VALUES ('1763', '112', 'Hamgyong-bukto', 'HAB', '1');
INSERT INTO `js_zone` VALUES ('1764', '112', 'Hamgyong-namdo', 'HAN', '1');
INSERT INTO `js_zone` VALUES ('1765', '112', 'Hwanghae-bukto', 'HWB', '1');
INSERT INTO `js_zone` VALUES ('1766', '112', 'Hwanghae-namdo', 'HWN', '1');
INSERT INTO `js_zone` VALUES ('1767', '112', 'Kangwon-do', 'KAN', '1');
INSERT INTO `js_zone` VALUES ('1768', '112', 'P\'yongan-bukto', 'PYB', '1');
INSERT INTO `js_zone` VALUES ('1769', '112', 'P\'yongan-namdo', 'PYN', '1');
INSERT INTO `js_zone` VALUES ('1770', '112', 'Ryanggang-do (Yanggang-do)', 'YAN', '1');
INSERT INTO `js_zone` VALUES ('1771', '112', 'Rason Directly Governed City', 'NAJ', '1');
INSERT INTO `js_zone` VALUES ('1772', '112', 'P\'yongyang Special City', 'PYO', '1');
INSERT INTO `js_zone` VALUES ('1773', '113', 'Ch\'ungch\'ong-bukto', 'CO', '1');
INSERT INTO `js_zone` VALUES ('1774', '113', 'Ch\'ungch\'ong-namdo', 'CH', '1');
INSERT INTO `js_zone` VALUES ('1775', '113', 'Cheju-do', 'CD', '1');
INSERT INTO `js_zone` VALUES ('1776', '113', 'Cholla-bukto', 'CB', '1');
INSERT INTO `js_zone` VALUES ('1777', '113', 'Cholla-namdo', 'CN', '1');
INSERT INTO `js_zone` VALUES ('1778', '113', 'Inch\'on-gwangyoksi', 'IG', '1');
INSERT INTO `js_zone` VALUES ('1779', '113', 'Kangwon-do', 'KA', '1');
INSERT INTO `js_zone` VALUES ('1780', '113', 'Kwangju-gwangyoksi', 'KG', '1');
INSERT INTO `js_zone` VALUES ('1781', '113', 'Kyonggi-do', 'KD', '1');
INSERT INTO `js_zone` VALUES ('1782', '113', 'Kyongsang-bukto', 'KB', '1');
INSERT INTO `js_zone` VALUES ('1783', '113', 'Kyongsang-namdo', 'KN', '1');
INSERT INTO `js_zone` VALUES ('1784', '113', 'Pusan-gwangyoksi', 'PG', '1');
INSERT INTO `js_zone` VALUES ('1785', '113', 'Soul-t\'ukpyolsi', 'SO', '1');
INSERT INTO `js_zone` VALUES ('1786', '113', 'Taegu-gwangyoksi', 'TA', '1');
INSERT INTO `js_zone` VALUES ('1787', '113', 'Taejon-gwangyoksi', 'TG', '1');
INSERT INTO `js_zone` VALUES ('1788', '114', 'Al \'Asimah', 'AL', '1');
INSERT INTO `js_zone` VALUES ('1789', '114', 'Al Ahmadi', 'AA', '1');
INSERT INTO `js_zone` VALUES ('1790', '114', 'Al Farwaniyah', 'AF', '1');
INSERT INTO `js_zone` VALUES ('1791', '114', 'Al Jahra\'', 'AJ', '1');
INSERT INTO `js_zone` VALUES ('1792', '114', 'Hawalli', 'HA', '1');
INSERT INTO `js_zone` VALUES ('1793', '115', 'Bishkek', 'GB', '1');
INSERT INTO `js_zone` VALUES ('1794', '115', 'Batken', 'B', '1');
INSERT INTO `js_zone` VALUES ('1795', '115', 'Chu', 'C', '1');
INSERT INTO `js_zone` VALUES ('1796', '115', 'Jalal-Abad', 'J', '1');
INSERT INTO `js_zone` VALUES ('1797', '115', 'Naryn', 'N', '1');
INSERT INTO `js_zone` VALUES ('1798', '115', 'Osh', 'O', '1');
INSERT INTO `js_zone` VALUES ('1799', '115', 'Talas', 'T', '1');
INSERT INTO `js_zone` VALUES ('1800', '115', 'Ysyk-Kol', 'Y', '1');
INSERT INTO `js_zone` VALUES ('1801', '116', 'Vientiane', 'VT', '1');
INSERT INTO `js_zone` VALUES ('1802', '116', 'Attapu', 'AT', '1');
INSERT INTO `js_zone` VALUES ('1803', '116', 'Bokeo', 'BK', '1');
INSERT INTO `js_zone` VALUES ('1804', '116', 'Bolikhamxai', 'BL', '1');
INSERT INTO `js_zone` VALUES ('1805', '116', 'Champasak', 'CH', '1');
INSERT INTO `js_zone` VALUES ('1806', '116', 'Houaphan', 'HO', '1');
INSERT INTO `js_zone` VALUES ('1807', '116', 'Khammouan', 'KH', '1');
INSERT INTO `js_zone` VALUES ('1808', '116', 'Louang Namtha', 'LM', '1');
INSERT INTO `js_zone` VALUES ('1809', '116', 'Louangphabang', 'LP', '1');
INSERT INTO `js_zone` VALUES ('1810', '116', 'Oudomxai', 'OU', '1');
INSERT INTO `js_zone` VALUES ('1811', '116', 'Phongsali', 'PH', '1');
INSERT INTO `js_zone` VALUES ('1812', '116', 'Salavan', 'SL', '1');
INSERT INTO `js_zone` VALUES ('1813', '116', 'Savannakhet', 'SV', '1');
INSERT INTO `js_zone` VALUES ('1814', '116', 'Vientiane', 'VI', '1');
INSERT INTO `js_zone` VALUES ('1815', '116', 'Xaignabouli', 'XA', '1');
INSERT INTO `js_zone` VALUES ('1816', '116', 'Xekong', 'XE', '1');
INSERT INTO `js_zone` VALUES ('1817', '116', 'Xiangkhoang', 'XI', '1');
INSERT INTO `js_zone` VALUES ('1818', '116', 'Xaisomboun', 'XN', '1');
INSERT INTO `js_zone` VALUES ('1819', '117', 'Aizkraukles Rajons', 'AIZ', '1');
INSERT INTO `js_zone` VALUES ('1820', '117', 'Aluksnes Rajons', 'ALU', '1');
INSERT INTO `js_zone` VALUES ('1821', '117', 'Balvu Rajons', 'BAL', '1');
INSERT INTO `js_zone` VALUES ('1822', '117', 'Bauskas Rajons', 'BAU', '1');
INSERT INTO `js_zone` VALUES ('1823', '117', 'Cesu Rajons', 'CES', '1');
INSERT INTO `js_zone` VALUES ('1824', '117', 'Daugavpils Rajons', 'DGR', '1');
INSERT INTO `js_zone` VALUES ('1825', '117', 'Dobeles Rajons', 'DOB', '1');
INSERT INTO `js_zone` VALUES ('1826', '117', 'Gulbenes Rajons', 'GUL', '1');
INSERT INTO `js_zone` VALUES ('1827', '117', 'Jekabpils Rajons', 'JEK', '1');
INSERT INTO `js_zone` VALUES ('1828', '117', 'Jelgavas Rajons', 'JGR', '1');
INSERT INTO `js_zone` VALUES ('1829', '117', 'Kraslavas Rajons', 'KRA', '1');
INSERT INTO `js_zone` VALUES ('1830', '117', 'Kuldigas Rajons', 'KUL', '1');
INSERT INTO `js_zone` VALUES ('1831', '117', 'Liepajas Rajons', 'LPR', '1');
INSERT INTO `js_zone` VALUES ('1832', '117', 'Limbazu Rajons', 'LIM', '1');
INSERT INTO `js_zone` VALUES ('1833', '117', 'Ludzas Rajons', 'LUD', '1');
INSERT INTO `js_zone` VALUES ('1834', '117', 'Madonas Rajons', 'MAD', '1');
INSERT INTO `js_zone` VALUES ('1835', '117', 'Ogres Rajons', 'OGR', '1');
INSERT INTO `js_zone` VALUES ('1836', '117', 'Preilu Rajons', 'PRE', '1');
INSERT INTO `js_zone` VALUES ('1837', '117', 'Rezeknes Rajons', 'RZR', '1');
INSERT INTO `js_zone` VALUES ('1838', '117', 'Rigas Rajons', 'RGR', '1');
INSERT INTO `js_zone` VALUES ('1839', '117', 'Saldus Rajons', 'SAL', '1');
INSERT INTO `js_zone` VALUES ('1840', '117', 'Talsu Rajons', 'TAL', '1');
INSERT INTO `js_zone` VALUES ('1841', '117', 'Tukuma Rajons', 'TUK', '1');
INSERT INTO `js_zone` VALUES ('1842', '117', 'Valkas Rajons', 'VLK', '1');
INSERT INTO `js_zone` VALUES ('1843', '117', 'Valmieras Rajons', 'VLM', '1');
INSERT INTO `js_zone` VALUES ('1844', '117', 'Ventspils Rajons', 'VSR', '1');
INSERT INTO `js_zone` VALUES ('1845', '117', 'Daugavpils', 'DGV', '1');
INSERT INTO `js_zone` VALUES ('1846', '117', 'Jelgava', 'JGV', '1');
INSERT INTO `js_zone` VALUES ('1847', '117', 'Jurmala', 'JUR', '1');
INSERT INTO `js_zone` VALUES ('1848', '117', 'Liepaja', 'LPK', '1');
INSERT INTO `js_zone` VALUES ('1849', '117', 'Rezekne', 'RZK', '1');
INSERT INTO `js_zone` VALUES ('1850', '117', 'Riga', 'RGA', '1');
INSERT INTO `js_zone` VALUES ('1851', '117', 'Ventspils', 'VSL', '1');
INSERT INTO `js_zone` VALUES ('1852', '119', 'Berea', 'BE', '1');
INSERT INTO `js_zone` VALUES ('1853', '119', 'Butha-Buthe', 'BB', '1');
INSERT INTO `js_zone` VALUES ('1854', '119', 'Leribe', 'LE', '1');
INSERT INTO `js_zone` VALUES ('1855', '119', 'Mafeteng', 'MF', '1');
INSERT INTO `js_zone` VALUES ('1856', '119', 'Maseru', 'MS', '1');
INSERT INTO `js_zone` VALUES ('1857', '119', 'Mohale\'s Hoek', 'MH', '1');
INSERT INTO `js_zone` VALUES ('1858', '119', 'Mokhotlong', 'MK', '1');
INSERT INTO `js_zone` VALUES ('1859', '119', 'Qacha\'s Nek', 'QN', '1');
INSERT INTO `js_zone` VALUES ('1860', '119', 'Quthing', 'QT', '1');
INSERT INTO `js_zone` VALUES ('1861', '119', 'Thaba-Tseka', 'TT', '1');
INSERT INTO `js_zone` VALUES ('1862', '120', 'Bomi', 'BI', '1');
INSERT INTO `js_zone` VALUES ('1863', '120', 'Bong', 'BG', '1');
INSERT INTO `js_zone` VALUES ('1864', '120', 'Grand Bassa', 'GB', '1');
INSERT INTO `js_zone` VALUES ('1865', '120', 'Grand Cape Mount', 'CM', '1');
INSERT INTO `js_zone` VALUES ('1866', '120', 'Grand Gedeh', 'GG', '1');
INSERT INTO `js_zone` VALUES ('1867', '120', 'Grand Kru', 'GK', '1');
INSERT INTO `js_zone` VALUES ('1868', '120', 'Lofa', 'LO', '1');
INSERT INTO `js_zone` VALUES ('1869', '120', 'Margibi', 'MG', '1');
INSERT INTO `js_zone` VALUES ('1870', '120', 'Maryland', 'ML', '1');
INSERT INTO `js_zone` VALUES ('1871', '120', 'Montserrado', 'MS', '1');
INSERT INTO `js_zone` VALUES ('1872', '120', 'Nimba', 'NB', '1');
INSERT INTO `js_zone` VALUES ('1873', '120', 'River Cess', 'RC', '1');
INSERT INTO `js_zone` VALUES ('1874', '120', 'Sinoe', 'SN', '1');
INSERT INTO `js_zone` VALUES ('1875', '121', 'Ajdabiya', 'AJ', '1');
INSERT INTO `js_zone` VALUES ('1876', '121', 'Al \'Aziziyah', 'AZ', '1');
INSERT INTO `js_zone` VALUES ('1877', '121', 'Al Fatih', 'FA', '1');
INSERT INTO `js_zone` VALUES ('1878', '121', 'Al Jabal al Akhdar', 'JA', '1');
INSERT INTO `js_zone` VALUES ('1879', '121', 'Al Jufrah', 'JU', '1');
INSERT INTO `js_zone` VALUES ('1880', '121', 'Al Khums', 'KH', '1');
INSERT INTO `js_zone` VALUES ('1881', '121', 'Al Kufrah', 'KU', '1');
INSERT INTO `js_zone` VALUES ('1882', '121', 'An Nuqat al Khams', 'NK', '1');
INSERT INTO `js_zone` VALUES ('1883', '121', 'Ash Shati\'', 'AS', '1');
INSERT INTO `js_zone` VALUES ('1884', '121', 'Awbari', 'AW', '1');
INSERT INTO `js_zone` VALUES ('1885', '121', 'Az Zawiyah', 'ZA', '1');
INSERT INTO `js_zone` VALUES ('1886', '121', 'Banghazi', 'BA', '1');
INSERT INTO `js_zone` VALUES ('1887', '121', 'Darnah', 'DA', '1');
INSERT INTO `js_zone` VALUES ('1888', '121', 'Ghadamis', 'GD', '1');
INSERT INTO `js_zone` VALUES ('1889', '121', 'Gharyan', 'GY', '1');
INSERT INTO `js_zone` VALUES ('1890', '121', 'Misratah', 'MI', '1');
INSERT INTO `js_zone` VALUES ('1891', '121', 'Murzuq', 'MZ', '1');
INSERT INTO `js_zone` VALUES ('1892', '121', 'Sabha', 'SB', '1');
INSERT INTO `js_zone` VALUES ('1893', '121', 'Sawfajjin', 'SW', '1');
INSERT INTO `js_zone` VALUES ('1894', '121', 'Surt', 'SU', '1');
INSERT INTO `js_zone` VALUES ('1895', '121', 'Tarabulus (Tripoli)', 'TL', '1');
INSERT INTO `js_zone` VALUES ('1896', '121', 'Tarhunah', 'TH', '1');
INSERT INTO `js_zone` VALUES ('1897', '121', 'Tubruq', 'TU', '1');
INSERT INTO `js_zone` VALUES ('1898', '121', 'Yafran', 'YA', '1');
INSERT INTO `js_zone` VALUES ('1899', '121', 'Zlitan', 'ZL', '1');
INSERT INTO `js_zone` VALUES ('1900', '122', 'Vaduz', 'V', '1');
INSERT INTO `js_zone` VALUES ('1901', '122', 'Schaan', 'A', '1');
INSERT INTO `js_zone` VALUES ('1902', '122', 'Balzers', 'B', '1');
INSERT INTO `js_zone` VALUES ('1903', '122', 'Triesen', 'N', '1');
INSERT INTO `js_zone` VALUES ('1904', '122', 'Eschen', 'E', '1');
INSERT INTO `js_zone` VALUES ('1905', '122', 'Mauren', 'M', '1');
INSERT INTO `js_zone` VALUES ('1906', '122', 'Triesenberg', 'T', '1');
INSERT INTO `js_zone` VALUES ('1907', '122', 'Ruggell', 'R', '1');
INSERT INTO `js_zone` VALUES ('1908', '122', 'Gamprin', 'G', '1');
INSERT INTO `js_zone` VALUES ('1909', '122', 'Schellenberg', 'L', '1');
INSERT INTO `js_zone` VALUES ('1910', '122', 'Planken', 'P', '1');
INSERT INTO `js_zone` VALUES ('1911', '123', 'Alytus', 'AL', '1');
INSERT INTO `js_zone` VALUES ('1912', '123', 'Kaunas', 'KA', '1');
INSERT INTO `js_zone` VALUES ('1913', '123', 'Klaipeda', 'KL', '1');
INSERT INTO `js_zone` VALUES ('1914', '123', 'Marijampole', 'MA', '1');
INSERT INTO `js_zone` VALUES ('1915', '123', 'Panevezys', 'PA', '1');
INSERT INTO `js_zone` VALUES ('1916', '123', 'Siauliai', 'SI', '1');
INSERT INTO `js_zone` VALUES ('1917', '123', 'Taurage', 'TA', '1');
INSERT INTO `js_zone` VALUES ('1918', '123', 'Telsiai', 'TE', '1');
INSERT INTO `js_zone` VALUES ('1919', '123', 'Utena', 'UT', '1');
INSERT INTO `js_zone` VALUES ('1920', '123', 'Vilnius', 'VI', '1');
INSERT INTO `js_zone` VALUES ('1921', '124', 'Diekirch', 'DD', '1');
INSERT INTO `js_zone` VALUES ('1922', '124', 'Clervaux', 'DC', '1');
INSERT INTO `js_zone` VALUES ('1923', '124', 'Redange', 'DR', '1');
INSERT INTO `js_zone` VALUES ('1924', '124', 'Vianden', 'DV', '1');
INSERT INTO `js_zone` VALUES ('1925', '124', 'Wiltz', 'DW', '1');
INSERT INTO `js_zone` VALUES ('1926', '124', 'Grevenmacher', 'GG', '1');
INSERT INTO `js_zone` VALUES ('1927', '124', 'Echternach', 'GE', '1');
INSERT INTO `js_zone` VALUES ('1928', '124', 'Remich', 'GR', '1');
INSERT INTO `js_zone` VALUES ('1929', '124', 'Luxembourg', 'LL', '1');
INSERT INTO `js_zone` VALUES ('1930', '124', 'Capellen', 'LC', '1');
INSERT INTO `js_zone` VALUES ('1931', '124', 'Esch-sur-Alzette', 'LE', '1');
INSERT INTO `js_zone` VALUES ('1932', '124', 'Mersch', 'LM', '1');
INSERT INTO `js_zone` VALUES ('1933', '125', 'Our Lady Fatima Parish', 'OLF', '1');
INSERT INTO `js_zone` VALUES ('1934', '125', 'St. Anthony Parish', 'ANT', '1');
INSERT INTO `js_zone` VALUES ('1935', '125', 'St. Lazarus Parish', 'LAZ', '1');
INSERT INTO `js_zone` VALUES ('1936', '125', 'Cathedral Parish', 'CAT', '1');
INSERT INTO `js_zone` VALUES ('1937', '125', 'St. Lawrence Parish', 'LAW', '1');
INSERT INTO `js_zone` VALUES ('1938', '127', 'Antananarivo', 'AN', '1');
INSERT INTO `js_zone` VALUES ('1939', '127', 'Antsiranana', 'AS', '1');
INSERT INTO `js_zone` VALUES ('1940', '127', 'Fianarantsoa', 'FN', '1');
INSERT INTO `js_zone` VALUES ('1941', '127', 'Mahajanga', 'MJ', '1');
INSERT INTO `js_zone` VALUES ('1942', '127', 'Toamasina', 'TM', '1');
INSERT INTO `js_zone` VALUES ('1943', '127', 'Toliara', 'TL', '1');
INSERT INTO `js_zone` VALUES ('1944', '128', 'Balaka', 'BLK', '1');
INSERT INTO `js_zone` VALUES ('1945', '128', 'Blantyre', 'BLT', '1');
INSERT INTO `js_zone` VALUES ('1946', '128', 'Chikwawa', 'CKW', '1');
INSERT INTO `js_zone` VALUES ('1947', '128', 'Chiradzulu', 'CRD', '1');
INSERT INTO `js_zone` VALUES ('1948', '128', 'Chitipa', 'CTP', '1');
INSERT INTO `js_zone` VALUES ('1949', '128', 'Dedza', 'DDZ', '1');
INSERT INTO `js_zone` VALUES ('1950', '128', 'Dowa', 'DWA', '1');
INSERT INTO `js_zone` VALUES ('1951', '128', 'Karonga', 'KRG', '1');
INSERT INTO `js_zone` VALUES ('1952', '128', 'Kasungu', 'KSG', '1');
INSERT INTO `js_zone` VALUES ('1953', '128', 'Likoma', 'LKM', '1');
INSERT INTO `js_zone` VALUES ('1954', '128', 'Lilongwe', 'LLG', '1');
INSERT INTO `js_zone` VALUES ('1955', '128', 'Machinga', 'MCG', '1');
INSERT INTO `js_zone` VALUES ('1956', '128', 'Mangochi', 'MGC', '1');
INSERT INTO `js_zone` VALUES ('1957', '128', 'Mchinji', 'MCH', '1');
INSERT INTO `js_zone` VALUES ('1958', '128', 'Mulanje', 'MLJ', '1');
INSERT INTO `js_zone` VALUES ('1959', '128', 'Mwanza', 'MWZ', '1');
INSERT INTO `js_zone` VALUES ('1960', '128', 'Mzimba', 'MZM', '1');
INSERT INTO `js_zone` VALUES ('1961', '128', 'Ntcheu', 'NTU', '1');
INSERT INTO `js_zone` VALUES ('1962', '128', 'Nkhata Bay', 'NKB', '1');
INSERT INTO `js_zone` VALUES ('1963', '128', 'Nkhotakota', 'NKH', '1');
INSERT INTO `js_zone` VALUES ('1964', '128', 'Nsanje', 'NSJ', '1');
INSERT INTO `js_zone` VALUES ('1965', '128', 'Ntchisi', 'NTI', '1');
INSERT INTO `js_zone` VALUES ('1966', '128', 'Phalombe', 'PHL', '1');
INSERT INTO `js_zone` VALUES ('1967', '128', 'Rumphi', 'RMP', '1');
INSERT INTO `js_zone` VALUES ('1968', '128', 'Salima', 'SLM', '1');
INSERT INTO `js_zone` VALUES ('1969', '128', 'Thyolo', 'THY', '1');
INSERT INTO `js_zone` VALUES ('1970', '128', 'Zomba', 'ZBA', '1');
INSERT INTO `js_zone` VALUES ('1971', '129', 'Johor', 'JO', '1');
INSERT INTO `js_zone` VALUES ('1972', '129', 'Kedah', 'KE', '1');
INSERT INTO `js_zone` VALUES ('1973', '129', 'Kelantan', 'KL', '1');
INSERT INTO `js_zone` VALUES ('1974', '129', 'Labuan', 'LA', '1');
INSERT INTO `js_zone` VALUES ('1975', '129', 'Melaka', 'ME', '1');
INSERT INTO `js_zone` VALUES ('1976', '129', 'Negeri Sembilan', 'NS', '1');
INSERT INTO `js_zone` VALUES ('1977', '129', 'Pahang', 'PA', '1');
INSERT INTO `js_zone` VALUES ('1978', '129', 'Perak', 'PE', '1');
INSERT INTO `js_zone` VALUES ('1979', '129', 'Perlis', 'PR', '1');
INSERT INTO `js_zone` VALUES ('1980', '129', 'Pulau Pinang', 'PP', '1');
INSERT INTO `js_zone` VALUES ('1981', '129', 'Sabah', 'SA', '1');
INSERT INTO `js_zone` VALUES ('1982', '129', 'Sarawak', 'SR', '1');
INSERT INTO `js_zone` VALUES ('1983', '129', 'Selangor', 'SE', '1');
INSERT INTO `js_zone` VALUES ('1984', '129', 'Terengganu', 'TE', '1');
INSERT INTO `js_zone` VALUES ('1985', '129', 'Wilayah Persekutuan', 'WP', '1');
INSERT INTO `js_zone` VALUES ('1986', '130', 'Thiladhunmathi Uthuru', 'THU', '1');
INSERT INTO `js_zone` VALUES ('1987', '130', 'Thiladhunmathi Dhekunu', 'THD', '1');
INSERT INTO `js_zone` VALUES ('1988', '130', 'Miladhunmadulu Uthuru', 'MLU', '1');
INSERT INTO `js_zone` VALUES ('1989', '130', 'Miladhunmadulu Dhekunu', 'MLD', '1');
INSERT INTO `js_zone` VALUES ('1990', '130', 'Maalhosmadulu Uthuru', 'MAU', '1');
INSERT INTO `js_zone` VALUES ('1991', '130', 'Maalhosmadulu Dhekunu', 'MAD', '1');
INSERT INTO `js_zone` VALUES ('1992', '130', 'Faadhippolhu', 'FAA', '1');
INSERT INTO `js_zone` VALUES ('1993', '130', 'Male Atoll', 'MAA', '1');
INSERT INTO `js_zone` VALUES ('1994', '130', 'Ari Atoll Uthuru', 'AAU', '1');
INSERT INTO `js_zone` VALUES ('1995', '130', 'Ari Atoll Dheknu', 'AAD', '1');
INSERT INTO `js_zone` VALUES ('1996', '130', 'Felidhe Atoll', 'FEA', '1');
INSERT INTO `js_zone` VALUES ('1997', '130', 'Mulaku Atoll', 'MUA', '1');
INSERT INTO `js_zone` VALUES ('1998', '130', 'Nilandhe Atoll Uthuru', 'NAU', '1');
INSERT INTO `js_zone` VALUES ('1999', '130', 'Nilandhe Atoll Dhekunu', 'NAD', '1');
INSERT INTO `js_zone` VALUES ('2000', '130', 'Kolhumadulu', 'KLH', '1');
INSERT INTO `js_zone` VALUES ('2001', '130', 'Hadhdhunmathi', 'HDH', '1');
INSERT INTO `js_zone` VALUES ('2002', '130', 'Huvadhu Atoll Uthuru', 'HAU', '1');
INSERT INTO `js_zone` VALUES ('2003', '130', 'Huvadhu Atoll Dhekunu', 'HAD', '1');
INSERT INTO `js_zone` VALUES ('2004', '130', 'Fua Mulaku', 'FMU', '1');
INSERT INTO `js_zone` VALUES ('2005', '130', 'Addu', 'ADD', '1');
INSERT INTO `js_zone` VALUES ('2006', '131', 'Gao', 'GA', '1');
INSERT INTO `js_zone` VALUES ('2007', '131', 'Kayes', 'KY', '1');
INSERT INTO `js_zone` VALUES ('2008', '131', 'Kidal', 'KD', '1');
INSERT INTO `js_zone` VALUES ('2009', '131', 'Koulikoro', 'KL', '1');
INSERT INTO `js_zone` VALUES ('2010', '131', 'Mopti', 'MP', '1');
INSERT INTO `js_zone` VALUES ('2011', '131', 'Segou', 'SG', '1');
INSERT INTO `js_zone` VALUES ('2012', '131', 'Sikasso', 'SK', '1');
INSERT INTO `js_zone` VALUES ('2013', '131', 'Tombouctou', 'TB', '1');
INSERT INTO `js_zone` VALUES ('2014', '131', 'Bamako Capital District', 'CD', '1');
INSERT INTO `js_zone` VALUES ('2015', '132', 'Attard', 'ATT', '1');
INSERT INTO `js_zone` VALUES ('2016', '132', 'Balzan', 'BAL', '1');
INSERT INTO `js_zone` VALUES ('2017', '132', 'Birgu', 'BGU', '1');
INSERT INTO `js_zone` VALUES ('2018', '132', 'Birkirkara', 'BKK', '1');
INSERT INTO `js_zone` VALUES ('2019', '132', 'Birzebbuga', 'BRZ', '1');
INSERT INTO `js_zone` VALUES ('2020', '132', 'Bormla', 'BOR', '1');
INSERT INTO `js_zone` VALUES ('2021', '132', 'Dingli', 'DIN', '1');
INSERT INTO `js_zone` VALUES ('2022', '132', 'Fgura', 'FGU', '1');
INSERT INTO `js_zone` VALUES ('2023', '132', 'Floriana', 'FLO', '1');
INSERT INTO `js_zone` VALUES ('2024', '132', 'Gudja', 'GDJ', '1');
INSERT INTO `js_zone` VALUES ('2025', '132', 'Gzira', 'GZR', '1');
INSERT INTO `js_zone` VALUES ('2026', '132', 'Gargur', 'GRG', '1');
INSERT INTO `js_zone` VALUES ('2027', '132', 'Gaxaq', 'GXQ', '1');
INSERT INTO `js_zone` VALUES ('2028', '132', 'Hamrun', 'HMR', '1');
INSERT INTO `js_zone` VALUES ('2029', '132', 'Iklin', 'IKL', '1');
INSERT INTO `js_zone` VALUES ('2030', '132', 'Isla', 'ISL', '1');
INSERT INTO `js_zone` VALUES ('2031', '132', 'Kalkara', 'KLK', '1');
INSERT INTO `js_zone` VALUES ('2032', '132', 'Kirkop', 'KRK', '1');
INSERT INTO `js_zone` VALUES ('2033', '132', 'Lija', 'LIJ', '1');
INSERT INTO `js_zone` VALUES ('2034', '132', 'Luqa', 'LUQ', '1');
INSERT INTO `js_zone` VALUES ('2035', '132', 'Marsa', 'MRS', '1');
INSERT INTO `js_zone` VALUES ('2036', '132', 'Marsaskala', 'MKL', '1');
INSERT INTO `js_zone` VALUES ('2037', '132', 'Marsaxlokk', 'MXL', '1');
INSERT INTO `js_zone` VALUES ('2038', '132', 'Mdina', 'MDN', '1');
INSERT INTO `js_zone` VALUES ('2039', '132', 'Melliea', 'MEL', '1');
INSERT INTO `js_zone` VALUES ('2040', '132', 'Mgarr', 'MGR', '1');
INSERT INTO `js_zone` VALUES ('2041', '132', 'Mosta', 'MST', '1');
INSERT INTO `js_zone` VALUES ('2042', '132', 'Mqabba', 'MQA', '1');
INSERT INTO `js_zone` VALUES ('2043', '132', 'Msida', 'MSI', '1');
INSERT INTO `js_zone` VALUES ('2044', '132', 'Mtarfa', 'MTF', '1');
INSERT INTO `js_zone` VALUES ('2045', '132', 'Naxxar', 'NAX', '1');
INSERT INTO `js_zone` VALUES ('2046', '132', 'Paola', 'PAO', '1');
INSERT INTO `js_zone` VALUES ('2047', '132', 'Pembroke', 'PEM', '1');
INSERT INTO `js_zone` VALUES ('2048', '132', 'Pieta', 'PIE', '1');
INSERT INTO `js_zone` VALUES ('2049', '132', 'Qormi', 'QOR', '1');
INSERT INTO `js_zone` VALUES ('2050', '132', 'Qrendi', 'QRE', '1');
INSERT INTO `js_zone` VALUES ('2051', '132', 'Rabat', 'RAB', '1');
INSERT INTO `js_zone` VALUES ('2052', '132', 'Safi', 'SAF', '1');
INSERT INTO `js_zone` VALUES ('2053', '132', 'San Giljan', 'SGI', '1');
INSERT INTO `js_zone` VALUES ('2054', '132', 'Santa Lucija', 'SLU', '1');
INSERT INTO `js_zone` VALUES ('2055', '132', 'San Pawl il-Bahar', 'SPB', '1');
INSERT INTO `js_zone` VALUES ('2056', '132', 'San Gwann', 'SGW', '1');
INSERT INTO `js_zone` VALUES ('2057', '132', 'Santa Venera', 'SVE', '1');
INSERT INTO `js_zone` VALUES ('2058', '132', 'Siggiewi', 'SIG', '1');
INSERT INTO `js_zone` VALUES ('2059', '132', 'Sliema', 'SLM', '1');
INSERT INTO `js_zone` VALUES ('2060', '132', 'Swieqi', 'SWQ', '1');
INSERT INTO `js_zone` VALUES ('2061', '132', 'Ta Xbiex', 'TXB', '1');
INSERT INTO `js_zone` VALUES ('2062', '132', 'Tarxien', 'TRX', '1');
INSERT INTO `js_zone` VALUES ('2063', '132', 'Valletta', 'VLT', '1');
INSERT INTO `js_zone` VALUES ('2064', '132', 'Xgajra', 'XGJ', '1');
INSERT INTO `js_zone` VALUES ('2065', '132', 'Zabbar', 'ZBR', '1');
INSERT INTO `js_zone` VALUES ('2066', '132', 'Zebbug', 'ZBG', '1');
INSERT INTO `js_zone` VALUES ('2067', '132', 'Zejtun', 'ZJT', '1');
INSERT INTO `js_zone` VALUES ('2068', '132', 'Zurrieq', 'ZRQ', '1');
INSERT INTO `js_zone` VALUES ('2069', '132', 'Fontana', 'FNT', '1');
INSERT INTO `js_zone` VALUES ('2070', '132', 'Ghajnsielem', 'GHJ', '1');
INSERT INTO `js_zone` VALUES ('2071', '132', 'Gharb', 'GHR', '1');
INSERT INTO `js_zone` VALUES ('2072', '132', 'Ghasri', 'GHS', '1');
INSERT INTO `js_zone` VALUES ('2073', '132', 'Kercem', 'KRC', '1');
INSERT INTO `js_zone` VALUES ('2074', '132', 'Munxar', 'MUN', '1');
INSERT INTO `js_zone` VALUES ('2075', '132', 'Nadur', 'NAD', '1');
INSERT INTO `js_zone` VALUES ('2076', '132', 'Qala', 'QAL', '1');
INSERT INTO `js_zone` VALUES ('2077', '132', 'Victoria', 'VIC', '1');
INSERT INTO `js_zone` VALUES ('2078', '132', 'San Lawrenz', 'SLA', '1');
INSERT INTO `js_zone` VALUES ('2079', '132', 'Sannat', 'SNT', '1');
INSERT INTO `js_zone` VALUES ('2080', '132', 'Xagra', 'ZAG', '1');
INSERT INTO `js_zone` VALUES ('2081', '132', 'Xewkija', 'XEW', '1');
INSERT INTO `js_zone` VALUES ('2082', '132', 'Zebbug', 'ZEB', '1');
INSERT INTO `js_zone` VALUES ('2083', '133', 'Ailinginae', 'ALG', '1');
INSERT INTO `js_zone` VALUES ('2084', '133', 'Ailinglaplap', 'ALL', '1');
INSERT INTO `js_zone` VALUES ('2085', '133', 'Ailuk', 'ALK', '1');
INSERT INTO `js_zone` VALUES ('2086', '133', 'Arno', 'ARN', '1');
INSERT INTO `js_zone` VALUES ('2087', '133', 'Aur', 'AUR', '1');
INSERT INTO `js_zone` VALUES ('2088', '133', 'Bikar', 'BKR', '1');
INSERT INTO `js_zone` VALUES ('2089', '133', 'Bikini', 'BKN', '1');
INSERT INTO `js_zone` VALUES ('2090', '133', 'Bokak', 'BKK', '1');
INSERT INTO `js_zone` VALUES ('2091', '133', 'Ebon', 'EBN', '1');
INSERT INTO `js_zone` VALUES ('2092', '133', 'Enewetak', 'ENT', '1');
INSERT INTO `js_zone` VALUES ('2093', '133', 'Erikub', 'EKB', '1');
INSERT INTO `js_zone` VALUES ('2094', '133', 'Jabat', 'JBT', '1');
INSERT INTO `js_zone` VALUES ('2095', '133', 'Jaluit', 'JLT', '1');
INSERT INTO `js_zone` VALUES ('2096', '133', 'Jemo', 'JEM', '1');
INSERT INTO `js_zone` VALUES ('2097', '133', 'Kili', 'KIL', '1');
INSERT INTO `js_zone` VALUES ('2098', '133', 'Kwajalein', 'KWJ', '1');
INSERT INTO `js_zone` VALUES ('2099', '133', 'Lae', 'LAE', '1');
INSERT INTO `js_zone` VALUES ('2100', '133', 'Lib', 'LIB', '1');
INSERT INTO `js_zone` VALUES ('2101', '133', 'Likiep', 'LKP', '1');
INSERT INTO `js_zone` VALUES ('2102', '133', 'Majuro', 'MJR', '1');
INSERT INTO `js_zone` VALUES ('2103', '133', 'Maloelap', 'MLP', '1');
INSERT INTO `js_zone` VALUES ('2104', '133', 'Mejit', 'MJT', '1');
INSERT INTO `js_zone` VALUES ('2105', '133', 'Mili', 'MIL', '1');
INSERT INTO `js_zone` VALUES ('2106', '133', 'Namorik', 'NMK', '1');
INSERT INTO `js_zone` VALUES ('2107', '133', 'Namu', 'NAM', '1');
INSERT INTO `js_zone` VALUES ('2108', '133', 'Rongelap', 'RGL', '1');
INSERT INTO `js_zone` VALUES ('2109', '133', 'Rongrik', 'RGK', '1');
INSERT INTO `js_zone` VALUES ('2110', '133', 'Toke', 'TOK', '1');
INSERT INTO `js_zone` VALUES ('2111', '133', 'Ujae', 'UJA', '1');
INSERT INTO `js_zone` VALUES ('2112', '133', 'Ujelang', 'UJL', '1');
INSERT INTO `js_zone` VALUES ('2113', '133', 'Utirik', 'UTK', '1');
INSERT INTO `js_zone` VALUES ('2114', '133', 'Wotho', 'WTH', '1');
INSERT INTO `js_zone` VALUES ('2115', '133', 'Wotje', 'WTJ', '1');
INSERT INTO `js_zone` VALUES ('2116', '135', 'Adrar', 'AD', '1');
INSERT INTO `js_zone` VALUES ('2117', '135', 'Assaba', 'AS', '1');
INSERT INTO `js_zone` VALUES ('2118', '135', 'Brakna', 'BR', '1');
INSERT INTO `js_zone` VALUES ('2119', '135', 'Dakhlet Nouadhibou', 'DN', '1');
INSERT INTO `js_zone` VALUES ('2120', '135', 'Gorgol', 'GO', '1');
INSERT INTO `js_zone` VALUES ('2121', '135', 'Guidimaka', 'GM', '1');
INSERT INTO `js_zone` VALUES ('2122', '135', 'Hodh Ech Chargui', 'HC', '1');
INSERT INTO `js_zone` VALUES ('2123', '135', 'Hodh El Gharbi', 'HG', '1');
INSERT INTO `js_zone` VALUES ('2124', '135', 'Inchiri', 'IN', '1');
INSERT INTO `js_zone` VALUES ('2125', '135', 'Tagant', 'TA', '1');
INSERT INTO `js_zone` VALUES ('2126', '135', 'Tiris Zemmour', 'TZ', '1');
INSERT INTO `js_zone` VALUES ('2127', '135', 'Trarza', 'TR', '1');
INSERT INTO `js_zone` VALUES ('2128', '135', 'Nouakchott', 'NO', '1');
INSERT INTO `js_zone` VALUES ('2129', '136', 'Beau Bassin-Rose Hill', 'BR', '1');
INSERT INTO `js_zone` VALUES ('2130', '136', 'Curepipe', 'CU', '1');
INSERT INTO `js_zone` VALUES ('2131', '136', 'Port Louis', 'PU', '1');
INSERT INTO `js_zone` VALUES ('2132', '136', 'Quatre Bornes', 'QB', '1');
INSERT INTO `js_zone` VALUES ('2133', '136', 'Vacoas-Phoenix', 'VP', '1');
INSERT INTO `js_zone` VALUES ('2134', '136', 'Agalega Islands', 'AG', '1');
INSERT INTO `js_zone` VALUES ('2135', '136', 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', '1');
INSERT INTO `js_zone` VALUES ('2136', '136', 'Rodrigues', 'RO', '1');
INSERT INTO `js_zone` VALUES ('2137', '136', 'Black River', 'BL', '1');
INSERT INTO `js_zone` VALUES ('2138', '136', 'Flacq', 'FL', '1');
INSERT INTO `js_zone` VALUES ('2139', '136', 'Grand Port', 'GP', '1');
INSERT INTO `js_zone` VALUES ('2140', '136', 'Moka', 'MO', '1');
INSERT INTO `js_zone` VALUES ('2141', '136', 'Pamplemousses', 'PA', '1');
INSERT INTO `js_zone` VALUES ('2142', '136', 'Plaines Wilhems', 'PW', '1');
INSERT INTO `js_zone` VALUES ('2143', '136', 'Port Louis', 'PL', '1');
INSERT INTO `js_zone` VALUES ('2144', '136', 'Riviere du Rempart', 'RR', '1');
INSERT INTO `js_zone` VALUES ('2145', '136', 'Savanne', 'SA', '1');
INSERT INTO `js_zone` VALUES ('2146', '138', 'Baja California Norte', 'BN', '1');
INSERT INTO `js_zone` VALUES ('2147', '138', 'Baja California Sur', 'BS', '1');
INSERT INTO `js_zone` VALUES ('2148', '138', 'Campeche', 'CA', '1');
INSERT INTO `js_zone` VALUES ('2149', '138', 'Chiapas', 'CI', '1');
INSERT INTO `js_zone` VALUES ('2150', '138', 'Chihuahua', 'CH', '1');
INSERT INTO `js_zone` VALUES ('2151', '138', 'Coahuila de Zaragoza', 'CZ', '1');
INSERT INTO `js_zone` VALUES ('2152', '138', 'Colima', 'CL', '1');
INSERT INTO `js_zone` VALUES ('2153', '138', 'Distrito Federal', 'DF', '1');
INSERT INTO `js_zone` VALUES ('2154', '138', 'Durango', 'DU', '1');
INSERT INTO `js_zone` VALUES ('2155', '138', 'Guanajuato', 'GA', '1');
INSERT INTO `js_zone` VALUES ('2156', '138', 'Guerrero', 'GE', '1');
INSERT INTO `js_zone` VALUES ('2157', '138', 'Hidalgo', 'HI', '1');
INSERT INTO `js_zone` VALUES ('2158', '138', 'Jalisco', 'JA', '1');
INSERT INTO `js_zone` VALUES ('2159', '138', 'Mexico', 'ME', '1');
INSERT INTO `js_zone` VALUES ('2160', '138', 'Michoacan de Ocampo', 'MI', '1');
INSERT INTO `js_zone` VALUES ('2161', '138', 'Morelos', 'MO', '1');
INSERT INTO `js_zone` VALUES ('2162', '138', 'Nayarit', 'NA', '1');
INSERT INTO `js_zone` VALUES ('2163', '138', 'Nuevo Leon', 'NL', '1');
INSERT INTO `js_zone` VALUES ('2164', '138', 'Oaxaca', 'OA', '1');
INSERT INTO `js_zone` VALUES ('2165', '138', 'Puebla', 'PU', '1');
INSERT INTO `js_zone` VALUES ('2166', '138', 'Queretaro de Arteaga', 'QA', '1');
INSERT INTO `js_zone` VALUES ('2167', '138', 'Quintana Roo', 'QR', '1');
INSERT INTO `js_zone` VALUES ('2168', '138', 'San Luis Potosi', 'SA', '1');
INSERT INTO `js_zone` VALUES ('2169', '138', 'Sinaloa', 'SI', '1');
INSERT INTO `js_zone` VALUES ('2170', '138', 'Sonora', 'SO', '1');
INSERT INTO `js_zone` VALUES ('2171', '138', 'Tabasco', 'TB', '1');
INSERT INTO `js_zone` VALUES ('2172', '138', 'Tamaulipas', 'TM', '1');
INSERT INTO `js_zone` VALUES ('2173', '138', 'Tlaxcala', 'TL', '1');
INSERT INTO `js_zone` VALUES ('2174', '138', 'Veracruz-Llave', 'VE', '1');
INSERT INTO `js_zone` VALUES ('2175', '138', 'Yucatan', 'YU', '1');
INSERT INTO `js_zone` VALUES ('2176', '138', 'Zacatecas', 'ZA', '1');
INSERT INTO `js_zone` VALUES ('2177', '139', 'Chuuk', 'C', '1');
INSERT INTO `js_zone` VALUES ('2178', '139', 'Kosrae', 'K', '1');
INSERT INTO `js_zone` VALUES ('2179', '139', 'Pohnpei', 'P', '1');
INSERT INTO `js_zone` VALUES ('2180', '139', 'Yap', 'Y', '1');
INSERT INTO `js_zone` VALUES ('2181', '140', 'Gagauzia', 'GA', '1');
INSERT INTO `js_zone` VALUES ('2182', '140', 'Chisinau', 'CU', '1');
INSERT INTO `js_zone` VALUES ('2183', '140', 'Balti', 'BA', '1');
INSERT INTO `js_zone` VALUES ('2184', '140', 'Cahul', 'CA', '1');
INSERT INTO `js_zone` VALUES ('2185', '140', 'Edinet', 'ED', '1');
INSERT INTO `js_zone` VALUES ('2186', '140', 'Lapusna', 'LA', '1');
INSERT INTO `js_zone` VALUES ('2187', '140', 'Orhei', 'OR', '1');
INSERT INTO `js_zone` VALUES ('2188', '140', 'Soroca', 'SO', '1');
INSERT INTO `js_zone` VALUES ('2189', '140', 'Tighina', 'TI', '1');
INSERT INTO `js_zone` VALUES ('2190', '140', 'Ungheni', 'UN', '1');
INSERT INTO `js_zone` VALUES ('2191', '140', 'St‚nga Nistrului', 'SN', '1');
INSERT INTO `js_zone` VALUES ('2192', '141', 'Fontvieille', 'FV', '1');
INSERT INTO `js_zone` VALUES ('2193', '141', 'La Condamine', 'LC', '1');
INSERT INTO `js_zone` VALUES ('2194', '141', 'Monaco-Ville', 'MV', '1');
INSERT INTO `js_zone` VALUES ('2195', '141', 'Monte-Carlo', 'MC', '1');
INSERT INTO `js_zone` VALUES ('2196', '142', 'Ulanbaatar', '1', '1');
INSERT INTO `js_zone` VALUES ('2197', '142', 'Orhon', '035', '1');
INSERT INTO `js_zone` VALUES ('2198', '142', 'Darhan uul', '037', '1');
INSERT INTO `js_zone` VALUES ('2199', '142', 'Hentiy', '039', '1');
INSERT INTO `js_zone` VALUES ('2200', '142', 'Hovsgol', '041', '1');
INSERT INTO `js_zone` VALUES ('2201', '142', 'Hovd', '043', '1');
INSERT INTO `js_zone` VALUES ('2202', '142', 'Uvs', '046', '1');
INSERT INTO `js_zone` VALUES ('2203', '142', 'Tov', '047', '1');
INSERT INTO `js_zone` VALUES ('2204', '142', 'Selenge', '049', '1');
INSERT INTO `js_zone` VALUES ('2205', '142', 'Suhbaatar', '051', '1');
INSERT INTO `js_zone` VALUES ('2206', '142', 'Omnogovi', '053', '1');
INSERT INTO `js_zone` VALUES ('2207', '142', 'Ovorhangay', '055', '1');
INSERT INTO `js_zone` VALUES ('2208', '142', 'Dzavhan', '057', '1');
INSERT INTO `js_zone` VALUES ('2209', '142', 'DundgovL', '059', '1');
INSERT INTO `js_zone` VALUES ('2210', '142', 'Dornod', '061', '1');
INSERT INTO `js_zone` VALUES ('2211', '142', 'Dornogov', '063', '1');
INSERT INTO `js_zone` VALUES ('2212', '142', 'Govi-Sumber', '064', '1');
INSERT INTO `js_zone` VALUES ('2213', '142', 'Govi-Altay', '065', '1');
INSERT INTO `js_zone` VALUES ('2214', '142', 'Bulgan', '067', '1');
INSERT INTO `js_zone` VALUES ('2215', '142', 'Bayanhongor', '069', '1');
INSERT INTO `js_zone` VALUES ('2216', '142', 'Bayan-Olgiy', '071', '1');
INSERT INTO `js_zone` VALUES ('2217', '142', 'Arhangay', '073', '1');
INSERT INTO `js_zone` VALUES ('2218', '143', 'Saint Anthony', 'A', '1');
INSERT INTO `js_zone` VALUES ('2219', '143', 'Saint Georges', 'G', '1');
INSERT INTO `js_zone` VALUES ('2220', '143', 'Saint Peter', 'P', '1');
INSERT INTO `js_zone` VALUES ('2221', '144', 'Agadir', 'AGD', '1');
INSERT INTO `js_zone` VALUES ('2222', '144', 'Al Hoceima', 'HOC', '1');
INSERT INTO `js_zone` VALUES ('2223', '144', 'Azilal', 'AZI', '1');
INSERT INTO `js_zone` VALUES ('2224', '144', 'Beni Mellal', 'BME', '1');
INSERT INTO `js_zone` VALUES ('2225', '144', 'Ben Slimane', 'BSL', '1');
INSERT INTO `js_zone` VALUES ('2226', '144', 'Boulemane', 'BLM', '1');
INSERT INTO `js_zone` VALUES ('2227', '144', 'Casablanca', 'CBL', '1');
INSERT INTO `js_zone` VALUES ('2228', '144', 'Chaouen', 'CHA', '1');
INSERT INTO `js_zone` VALUES ('2229', '144', 'El Jadida', 'EJA', '1');
INSERT INTO `js_zone` VALUES ('2230', '144', 'El Kelaa des Sraghna', 'EKS', '1');
INSERT INTO `js_zone` VALUES ('2231', '144', 'Er Rachidia', 'ERA', '1');
INSERT INTO `js_zone` VALUES ('2232', '144', 'Essaouira', 'ESS', '1');
INSERT INTO `js_zone` VALUES ('2233', '144', 'Fes', 'FES', '1');
INSERT INTO `js_zone` VALUES ('2234', '144', 'Figuig', 'FIG', '1');
INSERT INTO `js_zone` VALUES ('2235', '144', 'Guelmim', 'GLM', '1');
INSERT INTO `js_zone` VALUES ('2236', '144', 'Ifrane', 'IFR', '1');
INSERT INTO `js_zone` VALUES ('2237', '144', 'Kenitra', 'KEN', '1');
INSERT INTO `js_zone` VALUES ('2238', '144', 'Khemisset', 'KHM', '1');
INSERT INTO `js_zone` VALUES ('2239', '144', 'Khenifra', 'KHN', '1');
INSERT INTO `js_zone` VALUES ('2240', '144', 'Khouribga', 'KHO', '1');
INSERT INTO `js_zone` VALUES ('2241', '144', 'Laayoune', 'LYN', '1');
INSERT INTO `js_zone` VALUES ('2242', '144', 'Larache', 'LAR', '1');
INSERT INTO `js_zone` VALUES ('2243', '144', 'Marrakech', 'MRK', '1');
INSERT INTO `js_zone` VALUES ('2244', '144', 'Meknes', 'MKN', '1');
INSERT INTO `js_zone` VALUES ('2245', '144', 'Nador', 'NAD', '1');
INSERT INTO `js_zone` VALUES ('2246', '144', 'Ouarzazate', 'ORZ', '1');
INSERT INTO `js_zone` VALUES ('2247', '144', 'Oujda', 'OUJ', '1');
INSERT INTO `js_zone` VALUES ('2248', '144', 'Rabat-Sale', 'RSA', '1');
INSERT INTO `js_zone` VALUES ('2249', '144', 'Safi', 'SAF', '1');
INSERT INTO `js_zone` VALUES ('2250', '144', 'Settat', 'SET', '1');
INSERT INTO `js_zone` VALUES ('2251', '144', 'Sidi Kacem', 'SKA', '1');
INSERT INTO `js_zone` VALUES ('2252', '144', 'Tangier', 'TGR', '1');
INSERT INTO `js_zone` VALUES ('2253', '144', 'Tan-Tan', 'TAN', '1');
INSERT INTO `js_zone` VALUES ('2254', '144', 'Taounate', 'TAO', '1');
INSERT INTO `js_zone` VALUES ('2255', '144', 'Taroudannt', 'TRD', '1');
INSERT INTO `js_zone` VALUES ('2256', '144', 'Tata', 'TAT', '1');
INSERT INTO `js_zone` VALUES ('2257', '144', 'Taza', 'TAZ', '1');
INSERT INTO `js_zone` VALUES ('2258', '144', 'Tetouan', 'TET', '1');
INSERT INTO `js_zone` VALUES ('2259', '144', 'Tiznit', 'TIZ', '1');
INSERT INTO `js_zone` VALUES ('2260', '144', 'Ad Dakhla', 'ADK', '1');
INSERT INTO `js_zone` VALUES ('2261', '144', 'Boujdour', 'BJD', '1');
INSERT INTO `js_zone` VALUES ('2262', '144', 'Es Smara', 'ESM', '1');
INSERT INTO `js_zone` VALUES ('2263', '145', 'Cabo Delgado', 'CD', '1');
INSERT INTO `js_zone` VALUES ('2264', '145', 'Gaza', 'GZ', '1');
INSERT INTO `js_zone` VALUES ('2265', '145', 'Inhambane', 'IN', '1');
INSERT INTO `js_zone` VALUES ('2266', '145', 'Manica', 'MN', '1');
INSERT INTO `js_zone` VALUES ('2267', '145', 'Maputo (city)', 'MC', '1');
INSERT INTO `js_zone` VALUES ('2268', '145', 'Maputo', 'MP', '1');
INSERT INTO `js_zone` VALUES ('2269', '145', 'Nampula', 'NA', '1');
INSERT INTO `js_zone` VALUES ('2270', '145', 'Niassa', 'NI', '1');
INSERT INTO `js_zone` VALUES ('2271', '145', 'Sofala', 'SO', '1');
INSERT INTO `js_zone` VALUES ('2272', '145', 'Tete', 'TE', '1');
INSERT INTO `js_zone` VALUES ('2273', '145', 'Zambezia', 'ZA', '1');
INSERT INTO `js_zone` VALUES ('2274', '146', 'Ayeyarwady', 'AY', '1');
INSERT INTO `js_zone` VALUES ('2275', '146', 'Bago', 'BG', '1');
INSERT INTO `js_zone` VALUES ('2276', '146', 'Magway', 'MG', '1');
INSERT INTO `js_zone` VALUES ('2277', '146', 'Mandalay', 'MD', '1');
INSERT INTO `js_zone` VALUES ('2278', '146', 'Sagaing', 'SG', '1');
INSERT INTO `js_zone` VALUES ('2279', '146', 'Tanintharyi', 'TN', '1');
INSERT INTO `js_zone` VALUES ('2280', '146', 'Yangon', 'YG', '1');
INSERT INTO `js_zone` VALUES ('2281', '146', 'Chin State', 'CH', '1');
INSERT INTO `js_zone` VALUES ('2282', '146', 'Kachin State', 'KC', '1');
INSERT INTO `js_zone` VALUES ('2283', '146', 'Kayah State', 'KH', '1');
INSERT INTO `js_zone` VALUES ('2284', '146', 'Kayin State', 'KN', '1');
INSERT INTO `js_zone` VALUES ('2285', '146', 'Mon State', 'MN', '1');
INSERT INTO `js_zone` VALUES ('2286', '146', 'Rakhine State', 'RK', '1');
INSERT INTO `js_zone` VALUES ('2287', '146', 'Shan State', 'SH', '1');
INSERT INTO `js_zone` VALUES ('2288', '147', 'Caprivi', 'CA', '1');
INSERT INTO `js_zone` VALUES ('2289', '147', 'Erongo', 'ER', '1');
INSERT INTO `js_zone` VALUES ('2290', '147', 'Hardap', 'HA', '1');
INSERT INTO `js_zone` VALUES ('2291', '147', 'Karas', 'KR', '1');
INSERT INTO `js_zone` VALUES ('2292', '147', 'Kavango', 'KV', '1');
INSERT INTO `js_zone` VALUES ('2293', '147', 'Khomas', 'KH', '1');
INSERT INTO `js_zone` VALUES ('2294', '147', 'Kunene', 'KU', '1');
INSERT INTO `js_zone` VALUES ('2295', '147', 'Ohangwena', 'OW', '1');
INSERT INTO `js_zone` VALUES ('2296', '147', 'Omaheke', 'OK', '1');
INSERT INTO `js_zone` VALUES ('2297', '147', 'Omusati', 'OT', '1');
INSERT INTO `js_zone` VALUES ('2298', '147', 'Oshana', 'ON', '1');
INSERT INTO `js_zone` VALUES ('2299', '147', 'Oshikoto', 'OO', '1');
INSERT INTO `js_zone` VALUES ('2300', '147', 'Otjozondjupa', 'OJ', '1');
INSERT INTO `js_zone` VALUES ('2301', '148', 'Aiwo', 'AO', '1');
INSERT INTO `js_zone` VALUES ('2302', '148', 'Anabar', 'AA', '1');
INSERT INTO `js_zone` VALUES ('2303', '148', 'Anetan', 'AT', '1');
INSERT INTO `js_zone` VALUES ('2304', '148', 'Anibare', 'AI', '1');
INSERT INTO `js_zone` VALUES ('2305', '148', 'Baiti', 'BA', '1');
INSERT INTO `js_zone` VALUES ('2306', '148', 'Boe', 'BO', '1');
INSERT INTO `js_zone` VALUES ('2307', '148', 'Buada', 'BU', '1');
INSERT INTO `js_zone` VALUES ('2308', '148', 'Denigomodu', 'DE', '1');
INSERT INTO `js_zone` VALUES ('2309', '148', 'Ewa', 'EW', '1');
INSERT INTO `js_zone` VALUES ('2310', '148', 'Ijuw', 'IJ', '1');
INSERT INTO `js_zone` VALUES ('2311', '148', 'Meneng', 'ME', '1');
INSERT INTO `js_zone` VALUES ('2312', '148', 'Nibok', 'NI', '1');
INSERT INTO `js_zone` VALUES ('2313', '148', 'Uaboe', 'UA', '1');
INSERT INTO `js_zone` VALUES ('2314', '148', 'Yaren', 'YA', '1');
INSERT INTO `js_zone` VALUES ('2315', '149', 'Bagmati', 'BA', '1');
INSERT INTO `js_zone` VALUES ('2316', '149', 'Bheri', 'BH', '1');
INSERT INTO `js_zone` VALUES ('2317', '149', 'Dhawalagiri', 'DH', '1');
INSERT INTO `js_zone` VALUES ('2318', '149', 'Gandaki', 'GA', '1');
INSERT INTO `js_zone` VALUES ('2319', '149', 'Janakpur', 'JA', '1');
INSERT INTO `js_zone` VALUES ('2320', '149', 'Karnali', 'KA', '1');
INSERT INTO `js_zone` VALUES ('2321', '149', 'Kosi', 'KO', '1');
INSERT INTO `js_zone` VALUES ('2322', '149', 'Lumbini', 'LU', '1');
INSERT INTO `js_zone` VALUES ('2323', '149', 'Mahakali', 'MA', '1');
INSERT INTO `js_zone` VALUES ('2324', '149', 'Mechi', 'ME', '1');
INSERT INTO `js_zone` VALUES ('2325', '149', 'Narayani', 'NA', '1');
INSERT INTO `js_zone` VALUES ('2326', '149', 'Rapti', 'RA', '1');
INSERT INTO `js_zone` VALUES ('2327', '149', 'Sagarmatha', 'SA', '1');
INSERT INTO `js_zone` VALUES ('2328', '149', 'Seti', 'SE', '1');
INSERT INTO `js_zone` VALUES ('2329', '150', 'Drenthe', 'DR', '1');
INSERT INTO `js_zone` VALUES ('2330', '150', 'Flevoland', 'FL', '1');
INSERT INTO `js_zone` VALUES ('2331', '150', 'Friesland', 'FR', '1');
INSERT INTO `js_zone` VALUES ('2332', '150', 'Gelderland', 'GE', '1');
INSERT INTO `js_zone` VALUES ('2333', '150', 'Groningen', 'GR', '1');
INSERT INTO `js_zone` VALUES ('2334', '150', 'Limburg', 'LI', '1');
INSERT INTO `js_zone` VALUES ('2335', '150', 'Noord Brabant', 'NB', '1');
INSERT INTO `js_zone` VALUES ('2336', '150', 'Noord Holland', 'NH', '1');
INSERT INTO `js_zone` VALUES ('2337', '150', 'Overijssel', 'OV', '1');
INSERT INTO `js_zone` VALUES ('2338', '150', 'Utrecht', 'UT', '1');
INSERT INTO `js_zone` VALUES ('2339', '150', 'Zeeland', 'ZE', '1');
INSERT INTO `js_zone` VALUES ('2340', '150', 'Zuid Holland', 'ZH', '1');
INSERT INTO `js_zone` VALUES ('2341', '152', 'Iles Loyaute', 'L', '1');
INSERT INTO `js_zone` VALUES ('2342', '152', 'Nord', 'N', '1');
INSERT INTO `js_zone` VALUES ('2343', '152', 'Sud', 'S', '1');
INSERT INTO `js_zone` VALUES ('2344', '153', 'Auckland', 'AUK', '1');
INSERT INTO `js_zone` VALUES ('2345', '153', 'Bay of Plenty', 'BOP', '1');
INSERT INTO `js_zone` VALUES ('2346', '153', 'Canterbury', 'CAN', '1');
INSERT INTO `js_zone` VALUES ('2347', '153', 'Coromandel', 'COR', '1');
INSERT INTO `js_zone` VALUES ('2348', '153', 'Gisborne', 'GIS', '1');
INSERT INTO `js_zone` VALUES ('2349', '153', 'Fiordland', 'FIO', '1');
INSERT INTO `js_zone` VALUES ('2350', '153', 'Hawke\'s Bay', 'HKB', '1');
INSERT INTO `js_zone` VALUES ('2351', '153', 'Marlborough', 'MBH', '1');
INSERT INTO `js_zone` VALUES ('2352', '153', 'Manawatu-Wanganui', 'MWT', '1');
INSERT INTO `js_zone` VALUES ('2353', '153', 'Mt Cook-Mackenzie', 'MCM', '1');
INSERT INTO `js_zone` VALUES ('2354', '153', 'Nelson', 'NSN', '1');
INSERT INTO `js_zone` VALUES ('2355', '153', 'Northland', 'NTL', '1');
INSERT INTO `js_zone` VALUES ('2356', '153', 'Otago', 'OTA', '1');
INSERT INTO `js_zone` VALUES ('2357', '153', 'Southland', 'STL', '1');
INSERT INTO `js_zone` VALUES ('2358', '153', 'Taranaki', 'TKI', '1');
INSERT INTO `js_zone` VALUES ('2359', '153', 'Wellington', 'WGN', '1');
INSERT INTO `js_zone` VALUES ('2360', '153', 'Waikato', 'WKO', '1');
INSERT INTO `js_zone` VALUES ('2361', '153', 'Wairarapa', 'WAI', '1');
INSERT INTO `js_zone` VALUES ('2362', '153', 'West Coast', 'WTC', '1');
INSERT INTO `js_zone` VALUES ('2363', '154', 'Atlantico Norte', 'AN', '1');
INSERT INTO `js_zone` VALUES ('2364', '154', 'Atlantico Sur', 'AS', '1');
INSERT INTO `js_zone` VALUES ('2365', '154', 'Boaco', 'BO', '1');
INSERT INTO `js_zone` VALUES ('2366', '154', 'Carazo', 'CA', '1');
INSERT INTO `js_zone` VALUES ('2367', '154', 'Chinandega', 'CI', '1');
INSERT INTO `js_zone` VALUES ('2368', '154', 'Chontales', 'CO', '1');
INSERT INTO `js_zone` VALUES ('2369', '154', 'Esteli', 'ES', '1');
INSERT INTO `js_zone` VALUES ('2370', '154', 'Granada', 'GR', '1');
INSERT INTO `js_zone` VALUES ('2371', '154', 'Jinotega', 'JI', '1');
INSERT INTO `js_zone` VALUES ('2372', '154', 'Leon', 'LE', '1');
INSERT INTO `js_zone` VALUES ('2373', '154', 'Madriz', 'MD', '1');
INSERT INTO `js_zone` VALUES ('2374', '154', 'Managua', 'MN', '1');
INSERT INTO `js_zone` VALUES ('2375', '154', 'Masaya', 'MS', '1');
INSERT INTO `js_zone` VALUES ('2376', '154', 'Matagalpa', 'MT', '1');
INSERT INTO `js_zone` VALUES ('2377', '154', 'Nuevo Segovia', 'NS', '1');
INSERT INTO `js_zone` VALUES ('2378', '154', 'Rio San Juan', 'RS', '1');
INSERT INTO `js_zone` VALUES ('2379', '154', 'Rivas', 'RI', '1');
INSERT INTO `js_zone` VALUES ('2380', '155', 'Agadez', 'AG', '1');
INSERT INTO `js_zone` VALUES ('2381', '155', 'Diffa', 'DF', '1');
INSERT INTO `js_zone` VALUES ('2382', '155', 'Dosso', 'DS', '1');
INSERT INTO `js_zone` VALUES ('2383', '155', 'Maradi', 'MA', '1');
INSERT INTO `js_zone` VALUES ('2384', '155', 'Niamey', 'NM', '1');
INSERT INTO `js_zone` VALUES ('2385', '155', 'Tahoua', 'TH', '1');
INSERT INTO `js_zone` VALUES ('2386', '155', 'Tillaberi', 'TL', '1');
INSERT INTO `js_zone` VALUES ('2387', '155', 'Zinder', 'ZD', '1');
INSERT INTO `js_zone` VALUES ('2388', '156', 'Abia', 'AB', '1');
INSERT INTO `js_zone` VALUES ('2389', '156', 'Abuja Federal Capital Territory', 'CT', '1');
INSERT INTO `js_zone` VALUES ('2390', '156', 'Adamawa', 'AD', '1');
INSERT INTO `js_zone` VALUES ('2391', '156', 'Akwa Ibom', 'AK', '1');
INSERT INTO `js_zone` VALUES ('2392', '156', 'Anambra', 'AN', '1');
INSERT INTO `js_zone` VALUES ('2393', '156', 'Bauchi', 'BC', '1');
INSERT INTO `js_zone` VALUES ('2394', '156', 'Bayelsa', 'BY', '1');
INSERT INTO `js_zone` VALUES ('2395', '156', 'Benue', 'BN', '1');
INSERT INTO `js_zone` VALUES ('2396', '156', 'Borno', 'BO', '1');
INSERT INTO `js_zone` VALUES ('2397', '156', 'Cross River', 'CR', '1');
INSERT INTO `js_zone` VALUES ('2398', '156', 'Delta', 'DE', '1');
INSERT INTO `js_zone` VALUES ('2399', '156', 'Ebonyi', 'EB', '1');
INSERT INTO `js_zone` VALUES ('2400', '156', 'Edo', 'ED', '1');
INSERT INTO `js_zone` VALUES ('2401', '156', 'Ekiti', 'EK', '1');
INSERT INTO `js_zone` VALUES ('2402', '156', 'Enugu', 'EN', '1');
INSERT INTO `js_zone` VALUES ('2403', '156', 'Gombe', 'GO', '1');
INSERT INTO `js_zone` VALUES ('2404', '156', 'Imo', 'IM', '1');
INSERT INTO `js_zone` VALUES ('2405', '156', 'Jigawa', 'JI', '1');
INSERT INTO `js_zone` VALUES ('2406', '156', 'Kaduna', 'KD', '1');
INSERT INTO `js_zone` VALUES ('2407', '156', 'Kano', 'KN', '1');
INSERT INTO `js_zone` VALUES ('2408', '156', 'Katsina', 'KT', '1');
INSERT INTO `js_zone` VALUES ('2409', '156', 'Kebbi', 'KE', '1');
INSERT INTO `js_zone` VALUES ('2410', '156', 'Kogi', 'KO', '1');
INSERT INTO `js_zone` VALUES ('2411', '156', 'Kwara', 'KW', '1');
INSERT INTO `js_zone` VALUES ('2412', '156', 'Lagos', 'LA', '1');
INSERT INTO `js_zone` VALUES ('2413', '156', 'Nassarawa', 'NA', '1');
INSERT INTO `js_zone` VALUES ('2414', '156', 'Niger', 'NI', '1');
INSERT INTO `js_zone` VALUES ('2415', '156', 'Ogun', 'OG', '1');
INSERT INTO `js_zone` VALUES ('2416', '156', 'Ondo', 'ONG', '1');
INSERT INTO `js_zone` VALUES ('2417', '156', 'Osun', 'OS', '1');
INSERT INTO `js_zone` VALUES ('2418', '156', 'Oyo', 'OY', '1');
INSERT INTO `js_zone` VALUES ('2419', '156', 'Plateau', 'PL', '1');
INSERT INTO `js_zone` VALUES ('2420', '156', 'Rivers', 'RI', '1');
INSERT INTO `js_zone` VALUES ('2421', '156', 'Sokoto', 'SO', '1');
INSERT INTO `js_zone` VALUES ('2422', '156', 'Taraba', 'TA', '1');
INSERT INTO `js_zone` VALUES ('2423', '156', 'Yobe', 'YO', '1');
INSERT INTO `js_zone` VALUES ('2424', '156', 'Zamfara', 'ZA', '1');
INSERT INTO `js_zone` VALUES ('2425', '159', 'Northern Islands', 'N', '1');
INSERT INTO `js_zone` VALUES ('2426', '159', 'Rota', 'R', '1');
INSERT INTO `js_zone` VALUES ('2427', '159', 'Saipan', 'S', '1');
INSERT INTO `js_zone` VALUES ('2428', '159', 'Tinian', 'T', '1');
INSERT INTO `js_zone` VALUES ('2429', '160', 'Akershus', 'AK', '1');
INSERT INTO `js_zone` VALUES ('2430', '160', 'Aust-Agder', 'AA', '1');
INSERT INTO `js_zone` VALUES ('2431', '160', 'Buskerud', 'BU', '1');
INSERT INTO `js_zone` VALUES ('2432', '160', 'Finnmark', 'FM', '1');
INSERT INTO `js_zone` VALUES ('2433', '160', 'Hedmark', 'HM', '1');
INSERT INTO `js_zone` VALUES ('2434', '160', 'Hordaland', 'HL', '1');
INSERT INTO `js_zone` VALUES ('2435', '160', 'More og Romdal', 'MR', '1');
INSERT INTO `js_zone` VALUES ('2436', '160', 'Nord-Trondelag', 'NT', '1');
INSERT INTO `js_zone` VALUES ('2437', '160', 'Nordland', 'NL', '1');
INSERT INTO `js_zone` VALUES ('2438', '160', 'Ostfold', 'OF', '1');
INSERT INTO `js_zone` VALUES ('2439', '160', 'Oppland', 'OP', '1');
INSERT INTO `js_zone` VALUES ('2440', '160', 'Oslo', 'OL', '1');
INSERT INTO `js_zone` VALUES ('2441', '160', 'Rogaland', 'RL', '1');
INSERT INTO `js_zone` VALUES ('2442', '160', 'Sor-Trondelag', 'ST', '1');
INSERT INTO `js_zone` VALUES ('2443', '160', 'Sogn og Fjordane', 'SJ', '1');
INSERT INTO `js_zone` VALUES ('2444', '160', 'Svalbard', 'SV', '1');
INSERT INTO `js_zone` VALUES ('2445', '160', 'Telemark', 'TM', '1');
INSERT INTO `js_zone` VALUES ('2446', '160', 'Troms', 'TR', '1');
INSERT INTO `js_zone` VALUES ('2447', '160', 'Vest-Agder', 'VA', '1');
INSERT INTO `js_zone` VALUES ('2448', '160', 'Vestfold', 'VF', '1');
INSERT INTO `js_zone` VALUES ('2449', '161', 'Ad Dakhiliyah', 'DA', '1');
INSERT INTO `js_zone` VALUES ('2450', '161', 'Al Batinah', 'BA', '1');
INSERT INTO `js_zone` VALUES ('2451', '161', 'Al Wusta', 'WU', '1');
INSERT INTO `js_zone` VALUES ('2452', '161', 'Ash Sharqiyah', 'SH', '1');
INSERT INTO `js_zone` VALUES ('2453', '161', 'Az Zahirah', 'ZA', '1');
INSERT INTO `js_zone` VALUES ('2454', '161', 'Masqat', 'MA', '1');
INSERT INTO `js_zone` VALUES ('2455', '161', 'Musandam', 'MU', '1');
INSERT INTO `js_zone` VALUES ('2456', '161', 'Zufar', 'ZU', '1');
INSERT INTO `js_zone` VALUES ('2457', '162', 'Balochistan', 'B', '1');
INSERT INTO `js_zone` VALUES ('2458', '162', 'Federally Administered Tribal Areas', 'T', '1');
INSERT INTO `js_zone` VALUES ('2459', '162', 'Islamabad Capital Territory', 'I', '1');
INSERT INTO `js_zone` VALUES ('2460', '162', 'North-West Frontier', 'N', '1');
INSERT INTO `js_zone` VALUES ('2461', '162', 'Punjab', 'P', '1');
INSERT INTO `js_zone` VALUES ('2462', '162', 'Sindh', 'S', '1');
INSERT INTO `js_zone` VALUES ('2463', '163', 'Aimeliik', 'AM', '1');
INSERT INTO `js_zone` VALUES ('2464', '163', 'Airai', 'AR', '1');
INSERT INTO `js_zone` VALUES ('2465', '163', 'Angaur', 'AN', '1');
INSERT INTO `js_zone` VALUES ('2466', '163', 'Hatohobei', 'HA', '1');
INSERT INTO `js_zone` VALUES ('2467', '163', 'Kayangel', 'KA', '1');
INSERT INTO `js_zone` VALUES ('2468', '163', 'Koror', 'KO', '1');
INSERT INTO `js_zone` VALUES ('2469', '163', 'Melekeok', 'ME', '1');
INSERT INTO `js_zone` VALUES ('2470', '163', 'Ngaraard', 'NA', '1');
INSERT INTO `js_zone` VALUES ('2471', '163', 'Ngarchelong', 'NG', '1');
INSERT INTO `js_zone` VALUES ('2472', '163', 'Ngardmau', 'ND', '1');
INSERT INTO `js_zone` VALUES ('2473', '163', 'Ngatpang', 'NT', '1');
INSERT INTO `js_zone` VALUES ('2474', '163', 'Ngchesar', 'NC', '1');
INSERT INTO `js_zone` VALUES ('2475', '163', 'Ngeremlengui', 'NR', '1');
INSERT INTO `js_zone` VALUES ('2476', '163', 'Ngiwal', 'NW', '1');
INSERT INTO `js_zone` VALUES ('2477', '163', 'Peleliu', 'PE', '1');
INSERT INTO `js_zone` VALUES ('2478', '163', 'Sonsorol', 'SO', '1');
INSERT INTO `js_zone` VALUES ('2479', '164', 'Bocas del Toro', 'BT', '1');
INSERT INTO `js_zone` VALUES ('2480', '164', 'Chiriqui', 'CH', '1');
INSERT INTO `js_zone` VALUES ('2481', '164', 'Cocle', 'CC', '1');
INSERT INTO `js_zone` VALUES ('2482', '164', 'Colon', 'CL', '1');
INSERT INTO `js_zone` VALUES ('2483', '164', 'Darien', 'DA', '1');
INSERT INTO `js_zone` VALUES ('2484', '164', 'Herrera', 'HE', '1');
INSERT INTO `js_zone` VALUES ('2485', '164', 'Los Santos', 'LS', '1');
INSERT INTO `js_zone` VALUES ('2486', '164', 'Panama', 'PA', '1');
INSERT INTO `js_zone` VALUES ('2487', '164', 'San Blas', 'SB', '1');
INSERT INTO `js_zone` VALUES ('2488', '164', 'Veraguas', 'VG', '1');
INSERT INTO `js_zone` VALUES ('2489', '165', 'Bougainville', 'BV', '1');
INSERT INTO `js_zone` VALUES ('2490', '165', 'Central', 'CE', '1');
INSERT INTO `js_zone` VALUES ('2491', '165', 'Chimbu', 'CH', '1');
INSERT INTO `js_zone` VALUES ('2492', '165', 'Eastern Highlands', 'EH', '1');
INSERT INTO `js_zone` VALUES ('2493', '165', 'East New Britain', 'EB', '1');
INSERT INTO `js_zone` VALUES ('2494', '165', 'East Sepik', 'ES', '1');
INSERT INTO `js_zone` VALUES ('2495', '165', 'Enga', 'EN', '1');
INSERT INTO `js_zone` VALUES ('2496', '165', 'Gulf', 'GU', '1');
INSERT INTO `js_zone` VALUES ('2497', '165', 'Madang', 'MD', '1');
INSERT INTO `js_zone` VALUES ('2498', '165', 'Manus', 'MN', '1');
INSERT INTO `js_zone` VALUES ('2499', '165', 'Milne Bay', 'MB', '1');
INSERT INTO `js_zone` VALUES ('2500', '165', 'Morobe', 'MR', '1');
INSERT INTO `js_zone` VALUES ('2501', '165', 'National Capital', 'NC', '1');
INSERT INTO `js_zone` VALUES ('2502', '165', 'New Ireland', 'NI', '1');
INSERT INTO `js_zone` VALUES ('2503', '165', 'Northern', 'NO', '1');
INSERT INTO `js_zone` VALUES ('2504', '165', 'Sandaun', 'SA', '1');
INSERT INTO `js_zone` VALUES ('2505', '165', 'Southern Highlands', 'SH', '1');
INSERT INTO `js_zone` VALUES ('2506', '165', 'Western', 'WE', '1');
INSERT INTO `js_zone` VALUES ('2507', '165', 'Western Highlands', 'WH', '1');
INSERT INTO `js_zone` VALUES ('2508', '165', 'West New Britain', 'WB', '1');
INSERT INTO `js_zone` VALUES ('2509', '166', 'Alto Paraguay', 'AG', '1');
INSERT INTO `js_zone` VALUES ('2510', '166', 'Alto Parana', 'AN', '1');
INSERT INTO `js_zone` VALUES ('2511', '166', 'Amambay', 'AM', '1');
INSERT INTO `js_zone` VALUES ('2512', '166', 'Asuncion', 'AS', '1');
INSERT INTO `js_zone` VALUES ('2513', '166', 'Boqueron', 'BO', '1');
INSERT INTO `js_zone` VALUES ('2514', '166', 'Caaguazu', 'CG', '1');
INSERT INTO `js_zone` VALUES ('2515', '166', 'Caazapa', 'CZ', '1');
INSERT INTO `js_zone` VALUES ('2516', '166', 'Canindeyu', 'CN', '1');
INSERT INTO `js_zone` VALUES ('2517', '166', 'Central', 'CE', '1');
INSERT INTO `js_zone` VALUES ('2518', '166', 'Concepcion', 'CC', '1');
INSERT INTO `js_zone` VALUES ('2519', '166', 'Cordillera', 'CD', '1');
INSERT INTO `js_zone` VALUES ('2520', '166', 'Guaira', 'GU', '1');
INSERT INTO `js_zone` VALUES ('2521', '166', 'Itapua', 'IT', '1');
INSERT INTO `js_zone` VALUES ('2522', '166', 'Misiones', 'MI', '1');
INSERT INTO `js_zone` VALUES ('2523', '166', 'Neembucu', 'NE', '1');
INSERT INTO `js_zone` VALUES ('2524', '166', 'Paraguari', 'PA', '1');
INSERT INTO `js_zone` VALUES ('2525', '166', 'Presidente Hayes', 'PH', '1');
INSERT INTO `js_zone` VALUES ('2526', '166', 'San Pedro', 'SP', '1');
INSERT INTO `js_zone` VALUES ('2527', '167', 'Amazonas', 'AM', '1');
INSERT INTO `js_zone` VALUES ('2528', '167', 'Ancash', 'AN', '1');
INSERT INTO `js_zone` VALUES ('2529', '167', 'Apurimac', 'AP', '1');
INSERT INTO `js_zone` VALUES ('2530', '167', 'Arequipa', 'AR', '1');
INSERT INTO `js_zone` VALUES ('2531', '167', 'Ayacucho', 'AY', '1');
INSERT INTO `js_zone` VALUES ('2532', '167', 'Cajamarca', 'CJ', '1');
INSERT INTO `js_zone` VALUES ('2533', '167', 'Callao', 'CL', '1');
INSERT INTO `js_zone` VALUES ('2534', '167', 'Cusco', 'CU', '1');
INSERT INTO `js_zone` VALUES ('2535', '167', 'Huancavelica', 'HV', '1');
INSERT INTO `js_zone` VALUES ('2536', '167', 'Huanuco', 'HO', '1');
INSERT INTO `js_zone` VALUES ('2537', '167', 'Ica', 'IC', '1');
INSERT INTO `js_zone` VALUES ('2538', '167', 'Junin', 'JU', '1');
INSERT INTO `js_zone` VALUES ('2539', '167', 'La Libertad', 'LD', '1');
INSERT INTO `js_zone` VALUES ('2540', '167', 'Lambayeque', 'LY', '1');
INSERT INTO `js_zone` VALUES ('2541', '167', 'Lima', 'LI', '1');
INSERT INTO `js_zone` VALUES ('2542', '167', 'Loreto', 'LO', '1');
INSERT INTO `js_zone` VALUES ('2543', '167', 'Madre de Dios', 'MD', '1');
INSERT INTO `js_zone` VALUES ('2544', '167', 'Moquegua', 'MO', '1');
INSERT INTO `js_zone` VALUES ('2545', '167', 'Pasco', 'PA', '1');
INSERT INTO `js_zone` VALUES ('2546', '167', 'Piura', 'PI', '1');
INSERT INTO `js_zone` VALUES ('2547', '167', 'Puno', 'PU', '1');
INSERT INTO `js_zone` VALUES ('2548', '167', 'San Martin', 'SM', '1');
INSERT INTO `js_zone` VALUES ('2549', '167', 'Tacna', 'TA', '1');
INSERT INTO `js_zone` VALUES ('2550', '167', 'Tumbes', 'TU', '1');
INSERT INTO `js_zone` VALUES ('2551', '167', 'Ucayali', 'UC', '1');
INSERT INTO `js_zone` VALUES ('2552', '168', 'Abra', 'ABR', '1');
INSERT INTO `js_zone` VALUES ('2553', '168', 'Agusan del Norte', 'ANO', '1');
INSERT INTO `js_zone` VALUES ('2554', '168', 'Agusan del Sur', 'ASU', '1');
INSERT INTO `js_zone` VALUES ('2555', '168', 'Aklan', 'AKL', '1');
INSERT INTO `js_zone` VALUES ('2556', '168', 'Albay', 'ALB', '1');
INSERT INTO `js_zone` VALUES ('2557', '168', 'Antique', 'ANT', '1');
INSERT INTO `js_zone` VALUES ('2558', '168', 'Apayao', 'APY', '1');
INSERT INTO `js_zone` VALUES ('2559', '168', 'Aurora', 'AUR', '1');
INSERT INTO `js_zone` VALUES ('2560', '168', 'Basilan', 'BAS', '1');
INSERT INTO `js_zone` VALUES ('2561', '168', 'Bataan', 'BTA', '1');
INSERT INTO `js_zone` VALUES ('2562', '168', 'Batanes', 'BTE', '1');
INSERT INTO `js_zone` VALUES ('2563', '168', 'Batangas', 'BTG', '1');
INSERT INTO `js_zone` VALUES ('2564', '168', 'Biliran', 'BLR', '1');
INSERT INTO `js_zone` VALUES ('2565', '168', 'Benguet', 'BEN', '1');
INSERT INTO `js_zone` VALUES ('2566', '168', 'Bohol', 'BOL', '1');
INSERT INTO `js_zone` VALUES ('2567', '168', 'Bukidnon', 'BUK', '1');
INSERT INTO `js_zone` VALUES ('2568', '168', 'Bulacan', 'BUL', '1');
INSERT INTO `js_zone` VALUES ('2569', '168', 'Cagayan', 'CAG', '1');
INSERT INTO `js_zone` VALUES ('2570', '168', 'Camarines Norte', 'CNO', '1');
INSERT INTO `js_zone` VALUES ('2571', '168', 'Camarines Sur', 'CSU', '1');
INSERT INTO `js_zone` VALUES ('2572', '168', 'Camiguin', 'CAM', '1');
INSERT INTO `js_zone` VALUES ('2573', '168', 'Capiz', 'CAP', '1');
INSERT INTO `js_zone` VALUES ('2574', '168', 'Catanduanes', 'CAT', '1');
INSERT INTO `js_zone` VALUES ('2575', '168', 'Cavite', 'CAV', '1');
INSERT INTO `js_zone` VALUES ('2576', '168', 'Cebu', 'CEB', '1');
INSERT INTO `js_zone` VALUES ('2577', '168', 'Compostela', 'CMP', '1');
INSERT INTO `js_zone` VALUES ('2578', '168', 'Davao del Norte', 'DNO', '1');
INSERT INTO `js_zone` VALUES ('2579', '168', 'Davao del Sur', 'DSU', '1');
INSERT INTO `js_zone` VALUES ('2580', '168', 'Davao Oriental', 'DOR', '1');
INSERT INTO `js_zone` VALUES ('2581', '168', 'Eastern Samar', 'ESA', '1');
INSERT INTO `js_zone` VALUES ('2582', '168', 'Guimaras', 'GUI', '1');
INSERT INTO `js_zone` VALUES ('2583', '168', 'Ifugao', 'IFU', '1');
INSERT INTO `js_zone` VALUES ('2584', '168', 'Ilocos Norte', 'INO', '1');
INSERT INTO `js_zone` VALUES ('2585', '168', 'Ilocos Sur', 'ISU', '1');
INSERT INTO `js_zone` VALUES ('2586', '168', 'Iloilo', 'ILO', '1');
INSERT INTO `js_zone` VALUES ('2587', '168', 'Isabela', 'ISA', '1');
INSERT INTO `js_zone` VALUES ('2588', '168', 'Kalinga', 'KAL', '1');
INSERT INTO `js_zone` VALUES ('2589', '168', 'Laguna', 'LAG', '1');
INSERT INTO `js_zone` VALUES ('2590', '168', 'Lanao del Norte', 'LNO', '1');
INSERT INTO `js_zone` VALUES ('2591', '168', 'Lanao del Sur', 'LSU', '1');
INSERT INTO `js_zone` VALUES ('2592', '168', 'La Union', 'UNI', '1');
INSERT INTO `js_zone` VALUES ('2593', '168', 'Leyte', 'LEY', '1');
INSERT INTO `js_zone` VALUES ('2594', '168', 'Maguindanao', 'MAG', '1');
INSERT INTO `js_zone` VALUES ('2595', '168', 'Marinduque', 'MRN', '1');
INSERT INTO `js_zone` VALUES ('2596', '168', 'Masbate', 'MSB', '1');
INSERT INTO `js_zone` VALUES ('2597', '168', 'Mindoro Occidental', 'MIC', '1');
INSERT INTO `js_zone` VALUES ('2598', '168', 'Mindoro Oriental', 'MIR', '1');
INSERT INTO `js_zone` VALUES ('2599', '168', 'Misamis Occidental', 'MSC', '1');
INSERT INTO `js_zone` VALUES ('2600', '168', 'Misamis Oriental', 'MOR', '1');
INSERT INTO `js_zone` VALUES ('2601', '168', 'Mountain', 'MOP', '1');
INSERT INTO `js_zone` VALUES ('2602', '168', 'Negros Occidental', 'NOC', '1');
INSERT INTO `js_zone` VALUES ('2603', '168', 'Negros Oriental', 'NOR', '1');
INSERT INTO `js_zone` VALUES ('2604', '168', 'North Cotabato', 'NCT', '1');
INSERT INTO `js_zone` VALUES ('2605', '168', 'Northern Samar', 'NSM', '1');
INSERT INTO `js_zone` VALUES ('2606', '168', 'Nueva Ecija', 'NEC', '1');
INSERT INTO `js_zone` VALUES ('2607', '168', 'Nueva Vizcaya', 'NVZ', '1');
INSERT INTO `js_zone` VALUES ('2608', '168', 'Palawan', 'PLW', '1');
INSERT INTO `js_zone` VALUES ('2609', '168', 'Pampanga', 'PMP', '1');
INSERT INTO `js_zone` VALUES ('2610', '168', 'Pangasinan', 'PNG', '1');
INSERT INTO `js_zone` VALUES ('2611', '168', 'Quezon', 'QZN', '1');
INSERT INTO `js_zone` VALUES ('2612', '168', 'Quirino', 'QRN', '1');
INSERT INTO `js_zone` VALUES ('2613', '168', 'Rizal', 'RIZ', '1');
INSERT INTO `js_zone` VALUES ('2614', '168', 'Romblon', 'ROM', '1');
INSERT INTO `js_zone` VALUES ('2615', '168', 'Samar', 'SMR', '1');
INSERT INTO `js_zone` VALUES ('2616', '168', 'Sarangani', 'SRG', '1');
INSERT INTO `js_zone` VALUES ('2617', '168', 'Siquijor', 'SQJ', '1');
INSERT INTO `js_zone` VALUES ('2618', '168', 'Sorsogon', 'SRS', '1');
INSERT INTO `js_zone` VALUES ('2619', '168', 'South Cotabato', 'SCO', '1');
INSERT INTO `js_zone` VALUES ('2620', '168', 'Southern Leyte', 'SLE', '1');
INSERT INTO `js_zone` VALUES ('2621', '168', 'Sultan Kudarat', 'SKU', '1');
INSERT INTO `js_zone` VALUES ('2622', '168', 'Sulu', 'SLU', '1');
INSERT INTO `js_zone` VALUES ('2623', '168', 'Surigao del Norte', 'SNO', '1');
INSERT INTO `js_zone` VALUES ('2624', '168', 'Surigao del Sur', 'SSU', '1');
INSERT INTO `js_zone` VALUES ('2625', '168', 'Tarlac', 'TAR', '1');
INSERT INTO `js_zone` VALUES ('2626', '168', 'Tawi-Tawi', 'TAW', '1');
INSERT INTO `js_zone` VALUES ('2627', '168', 'Zambales', 'ZBL', '1');
INSERT INTO `js_zone` VALUES ('2628', '168', 'Zamboanga del Norte', 'ZNO', '1');
INSERT INTO `js_zone` VALUES ('2629', '168', 'Zamboanga del Sur', 'ZSU', '1');
INSERT INTO `js_zone` VALUES ('2630', '168', 'Zamboanga Sibugay', 'ZSI', '1');
INSERT INTO `js_zone` VALUES ('2631', '170', 'Dolnoslaskie', 'DO', '1');
INSERT INTO `js_zone` VALUES ('2632', '170', 'Kujawsko-Pomorskie', 'KP', '1');
INSERT INTO `js_zone` VALUES ('2633', '170', 'Lodzkie', 'LO', '1');
INSERT INTO `js_zone` VALUES ('2634', '170', 'Lubelskie', 'LL', '1');
INSERT INTO `js_zone` VALUES ('2635', '170', 'Lubuskie', 'LU', '1');
INSERT INTO `js_zone` VALUES ('2636', '170', 'Malopolskie', 'ML', '1');
INSERT INTO `js_zone` VALUES ('2637', '170', 'Mazowieckie', 'MZ', '1');
INSERT INTO `js_zone` VALUES ('2638', '170', 'Opolskie', 'OP', '1');
INSERT INTO `js_zone` VALUES ('2639', '170', 'Podkarpackie', 'PP', '1');
INSERT INTO `js_zone` VALUES ('2640', '170', 'Podlaskie', 'PL', '1');
INSERT INTO `js_zone` VALUES ('2641', '170', 'Pomorskie', 'PM', '1');
INSERT INTO `js_zone` VALUES ('2642', '170', 'Slaskie', 'SL', '1');
INSERT INTO `js_zone` VALUES ('2643', '170', 'Swietokrzyskie', 'SW', '1');
INSERT INTO `js_zone` VALUES ('2644', '170', 'Warminsko-Mazurskie', 'WM', '1');
INSERT INTO `js_zone` VALUES ('2645', '170', 'Wielkopolskie', 'WP', '1');
INSERT INTO `js_zone` VALUES ('2646', '170', 'Zachodniopomorskie', 'ZA', '1');
INSERT INTO `js_zone` VALUES ('2647', '198', 'Saint Pierre', 'P', '1');
INSERT INTO `js_zone` VALUES ('2648', '198', 'Miquelon', 'M', '1');
INSERT INTO `js_zone` VALUES ('2649', '171', 'A&ccedil;ores', 'AC', '1');
INSERT INTO `js_zone` VALUES ('2650', '171', 'Aveiro', 'AV', '1');
INSERT INTO `js_zone` VALUES ('2651', '171', 'Beja', 'BE', '1');
INSERT INTO `js_zone` VALUES ('2652', '171', 'Braga', 'BR', '1');
INSERT INTO `js_zone` VALUES ('2653', '171', 'Bragan&ccedil;a', 'BA', '1');
INSERT INTO `js_zone` VALUES ('2654', '171', 'Castelo Branco', 'CB', '1');
INSERT INTO `js_zone` VALUES ('2655', '171', 'Coimbra', 'CO', '1');
INSERT INTO `js_zone` VALUES ('2656', '171', '&Eacute;vora', 'EV', '1');
INSERT INTO `js_zone` VALUES ('2657', '171', 'Faro', 'FA', '1');
INSERT INTO `js_zone` VALUES ('2658', '171', 'Guarda', 'GU', '1');
INSERT INTO `js_zone` VALUES ('2659', '171', 'Leiria', 'LE', '1');
INSERT INTO `js_zone` VALUES ('2660', '171', 'Lisboa', 'LI', '1');
INSERT INTO `js_zone` VALUES ('2661', '171', 'Madeira', 'ME', '1');
INSERT INTO `js_zone` VALUES ('2662', '171', 'Portalegre', 'PO', '1');
INSERT INTO `js_zone` VALUES ('2663', '171', 'Porto', 'PR', '1');
INSERT INTO `js_zone` VALUES ('2664', '171', 'Santar&eacute;m', 'SA', '1');
INSERT INTO `js_zone` VALUES ('2665', '171', 'Set&uacute;bal', 'SE', '1');
INSERT INTO `js_zone` VALUES ('2666', '171', 'Viana do Castelo', 'VC', '1');
INSERT INTO `js_zone` VALUES ('2667', '171', 'Vila Real', 'VR', '1');
INSERT INTO `js_zone` VALUES ('2668', '171', 'Viseu', 'VI', '1');
INSERT INTO `js_zone` VALUES ('2669', '173', 'Ad Dawhah', 'DW', '1');
INSERT INTO `js_zone` VALUES ('2670', '173', 'Al Ghuwayriyah', 'GW', '1');
INSERT INTO `js_zone` VALUES ('2671', '173', 'Al Jumayliyah', 'JM', '1');
INSERT INTO `js_zone` VALUES ('2672', '173', 'Al Khawr', 'KR', '1');
INSERT INTO `js_zone` VALUES ('2673', '173', 'Al Wakrah', 'WK', '1');
INSERT INTO `js_zone` VALUES ('2674', '173', 'Ar Rayyan', 'RN', '1');
INSERT INTO `js_zone` VALUES ('2675', '173', 'Jarayan al Batinah', 'JB', '1');
INSERT INTO `js_zone` VALUES ('2676', '173', 'Madinat ash Shamal', 'MS', '1');
INSERT INTO `js_zone` VALUES ('2677', '173', 'Umm Sa\'id', 'UD', '1');
INSERT INTO `js_zone` VALUES ('2678', '173', 'Umm Salal', 'UL', '1');
INSERT INTO `js_zone` VALUES ('2679', '175', 'Alba', 'AB', '1');
INSERT INTO `js_zone` VALUES ('2680', '175', 'Arad', 'AR', '1');
INSERT INTO `js_zone` VALUES ('2681', '175', 'Arges', 'AG', '1');
INSERT INTO `js_zone` VALUES ('2682', '175', 'Bacau', 'BC', '1');
INSERT INTO `js_zone` VALUES ('2683', '175', 'Bihor', 'BH', '1');
INSERT INTO `js_zone` VALUES ('2684', '175', 'Bistrita-Nasaud', 'BN', '1');
INSERT INTO `js_zone` VALUES ('2685', '175', 'Botosani', 'BT', '1');
INSERT INTO `js_zone` VALUES ('2686', '175', 'Brasov', 'BV', '1');
INSERT INTO `js_zone` VALUES ('2687', '175', 'Braila', 'BR', '1');
INSERT INTO `js_zone` VALUES ('2688', '175', 'Bucuresti', 'B', '1');
INSERT INTO `js_zone` VALUES ('2689', '175', 'Buzau', 'BZ', '1');
INSERT INTO `js_zone` VALUES ('2690', '175', 'Caras-Severin', 'CS', '1');
INSERT INTO `js_zone` VALUES ('2691', '175', 'Calarasi', 'CL', '1');
INSERT INTO `js_zone` VALUES ('2692', '175', 'Cluj', 'CJ', '1');
INSERT INTO `js_zone` VALUES ('2693', '175', 'Constanta', 'CT', '1');
INSERT INTO `js_zone` VALUES ('2694', '175', 'Covasna', 'CV', '1');
INSERT INTO `js_zone` VALUES ('2695', '175', 'Dimbovita', 'DB', '1');
INSERT INTO `js_zone` VALUES ('2696', '175', 'Dolj', 'DJ', '1');
INSERT INTO `js_zone` VALUES ('2697', '175', 'Galati', 'GL', '1');
INSERT INTO `js_zone` VALUES ('2698', '175', 'Giurgiu', 'GR', '1');
INSERT INTO `js_zone` VALUES ('2699', '175', 'Gorj', 'GJ', '1');
INSERT INTO `js_zone` VALUES ('2700', '175', 'Harghita', 'HR', '1');
INSERT INTO `js_zone` VALUES ('2701', '175', 'Hunedoara', 'HD', '1');
INSERT INTO `js_zone` VALUES ('2702', '175', 'Ialomita', 'IL', '1');
INSERT INTO `js_zone` VALUES ('2703', '175', 'Iasi', 'IS', '1');
INSERT INTO `js_zone` VALUES ('2704', '175', 'Ilfov', 'IF', '1');
INSERT INTO `js_zone` VALUES ('2705', '175', 'Maramures', 'MM', '1');
INSERT INTO `js_zone` VALUES ('2706', '175', 'Mehedinti', 'MH', '1');
INSERT INTO `js_zone` VALUES ('2707', '175', 'Mures', 'MS', '1');
INSERT INTO `js_zone` VALUES ('2708', '175', 'Neamt', 'NT', '1');
INSERT INTO `js_zone` VALUES ('2709', '175', 'Olt', 'OT', '1');
INSERT INTO `js_zone` VALUES ('2710', '175', 'Prahova', 'PH', '1');
INSERT INTO `js_zone` VALUES ('2711', '175', 'Satu-Mare', 'SM', '1');
INSERT INTO `js_zone` VALUES ('2712', '175', 'Salaj', 'SJ', '1');
INSERT INTO `js_zone` VALUES ('2713', '175', 'Sibiu', 'SB', '1');
INSERT INTO `js_zone` VALUES ('2714', '175', 'Suceava', 'SV', '1');
INSERT INTO `js_zone` VALUES ('2715', '175', 'Teleorman', 'TR', '1');
INSERT INTO `js_zone` VALUES ('2716', '175', 'Timis', 'TM', '1');
INSERT INTO `js_zone` VALUES ('2717', '175', 'Tulcea', 'TL', '1');
INSERT INTO `js_zone` VALUES ('2718', '175', 'Vaslui', 'VS', '1');
INSERT INTO `js_zone` VALUES ('2719', '175', 'Valcea', 'VL', '1');
INSERT INTO `js_zone` VALUES ('2720', '175', 'Vrancea', 'VN', '1');
INSERT INTO `js_zone` VALUES ('2721', '176', 'Abakan', 'AB', '1');
INSERT INTO `js_zone` VALUES ('2722', '176', 'Aginskoye', 'AG', '1');
INSERT INTO `js_zone` VALUES ('2723', '176', 'Anadyr', 'AN', '1');
INSERT INTO `js_zone` VALUES ('2724', '176', 'Arkahangelsk', 'AR', '1');
INSERT INTO `js_zone` VALUES ('2725', '176', 'Astrakhan', 'AS', '1');
INSERT INTO `js_zone` VALUES ('2726', '176', 'Barnaul', 'BA', '1');
INSERT INTO `js_zone` VALUES ('2727', '176', 'Belgorod', 'BE', '1');
INSERT INTO `js_zone` VALUES ('2728', '176', 'Birobidzhan', 'BI', '1');
INSERT INTO `js_zone` VALUES ('2729', '176', 'Blagoveshchensk', 'BL', '1');
INSERT INTO `js_zone` VALUES ('2730', '176', 'Bryansk', 'BR', '1');
INSERT INTO `js_zone` VALUES ('2731', '176', 'Cheboksary', 'CH', '1');
INSERT INTO `js_zone` VALUES ('2732', '176', 'Chelyabinsk', 'CL', '1');
INSERT INTO `js_zone` VALUES ('2733', '176', 'Cherkessk', 'CR', '1');
INSERT INTO `js_zone` VALUES ('2734', '176', 'Chita', 'CI', '1');
INSERT INTO `js_zone` VALUES ('2735', '176', 'Dudinka', 'DU', '1');
INSERT INTO `js_zone` VALUES ('2736', '176', 'Elista', 'EL', '1');
INSERT INTO `js_zone` VALUES ('2737', '176', 'Gomo-Altaysk', 'GO', '1');
INSERT INTO `js_zone` VALUES ('2738', '176', 'Gorno-Altaysk', 'GA', '1');
INSERT INTO `js_zone` VALUES ('2739', '176', 'Groznyy', 'GR', '1');
INSERT INTO `js_zone` VALUES ('2740', '176', 'Irkutsk', 'IR', '1');
INSERT INTO `js_zone` VALUES ('2741', '176', 'Ivanovo', 'IV', '1');
INSERT INTO `js_zone` VALUES ('2742', '176', 'Izhevsk', 'IZ', '1');
INSERT INTO `js_zone` VALUES ('2743', '176', 'Kalinigrad', 'KA', '1');
INSERT INTO `js_zone` VALUES ('2744', '176', 'Kaluga', 'KL', '1');
INSERT INTO `js_zone` VALUES ('2745', '176', 'Kasnodar', 'KS', '1');
INSERT INTO `js_zone` VALUES ('2746', '176', 'Kazan', 'KZ', '1');
INSERT INTO `js_zone` VALUES ('2747', '176', 'Kemerovo', 'KE', '1');
INSERT INTO `js_zone` VALUES ('2748', '176', 'Khabarovsk', 'KH', '1');
INSERT INTO `js_zone` VALUES ('2749', '176', 'Khanty-Mansiysk', 'KM', '1');
INSERT INTO `js_zone` VALUES ('2750', '176', 'Kostroma', 'KO', '1');
INSERT INTO `js_zone` VALUES ('2751', '176', 'Krasnodar', 'KR', '1');
INSERT INTO `js_zone` VALUES ('2752', '176', 'Krasnoyarsk', 'KN', '1');
INSERT INTO `js_zone` VALUES ('2753', '176', 'Kudymkar', 'KU', '1');
INSERT INTO `js_zone` VALUES ('2754', '176', 'Kurgan', 'KG', '1');
INSERT INTO `js_zone` VALUES ('2755', '176', 'Kursk', 'KK', '1');
INSERT INTO `js_zone` VALUES ('2756', '176', 'Kyzyl', 'KY', '1');
INSERT INTO `js_zone` VALUES ('2757', '176', 'Lipetsk', 'LI', '1');
INSERT INTO `js_zone` VALUES ('2758', '176', 'Magadan', 'MA', '1');
INSERT INTO `js_zone` VALUES ('2759', '176', 'Makhachkala', 'MK', '1');
INSERT INTO `js_zone` VALUES ('2760', '176', 'Maykop', 'MY', '1');
INSERT INTO `js_zone` VALUES ('2761', '176', 'Moscow', 'MO', '1');
INSERT INTO `js_zone` VALUES ('2762', '176', 'Murmansk', 'MU', '1');
INSERT INTO `js_zone` VALUES ('2763', '176', 'Nalchik', 'NA', '1');
INSERT INTO `js_zone` VALUES ('2764', '176', 'Naryan Mar', 'NR', '1');
INSERT INTO `js_zone` VALUES ('2765', '176', 'Nazran', 'NZ', '1');
INSERT INTO `js_zone` VALUES ('2766', '176', 'Nizhniy Novgorod', 'NI', '1');
INSERT INTO `js_zone` VALUES ('2767', '176', 'Novgorod', 'NO', '1');
INSERT INTO `js_zone` VALUES ('2768', '176', 'Novosibirsk', 'NV', '1');
INSERT INTO `js_zone` VALUES ('2769', '176', 'Omsk', 'OM', '1');
INSERT INTO `js_zone` VALUES ('2770', '176', 'Orel', 'OR', '1');
INSERT INTO `js_zone` VALUES ('2771', '176', 'Orenburg', 'OE', '1');
INSERT INTO `js_zone` VALUES ('2772', '176', 'Palana', 'PA', '1');
INSERT INTO `js_zone` VALUES ('2773', '176', 'Penza', 'PE', '1');
INSERT INTO `js_zone` VALUES ('2774', '176', 'Perm', 'PR', '1');
INSERT INTO `js_zone` VALUES ('2775', '176', 'Petropavlovsk-Kamchatskiy', 'PK', '1');
INSERT INTO `js_zone` VALUES ('2776', '176', 'Petrozavodsk', 'PT', '1');
INSERT INTO `js_zone` VALUES ('2777', '176', 'Pskov', 'PS', '1');
INSERT INTO `js_zone` VALUES ('2778', '176', 'Rostov-na-Donu', 'RO', '1');
INSERT INTO `js_zone` VALUES ('2779', '176', 'Ryazan', 'RY', '1');
INSERT INTO `js_zone` VALUES ('2780', '176', 'Salekhard', 'SL', '1');
INSERT INTO `js_zone` VALUES ('2781', '176', 'Samara', 'SA', '1');
INSERT INTO `js_zone` VALUES ('2782', '176', 'Saransk', 'SR', '1');
INSERT INTO `js_zone` VALUES ('2783', '176', 'Saratov', 'SV', '1');
INSERT INTO `js_zone` VALUES ('2784', '176', 'Smolensk', 'SM', '1');
INSERT INTO `js_zone` VALUES ('2785', '176', 'St. Petersburg', 'SP', '1');
INSERT INTO `js_zone` VALUES ('2786', '176', 'Stavropol', 'ST', '1');
INSERT INTO `js_zone` VALUES ('2787', '176', 'Syktyvkar', 'SY', '1');
INSERT INTO `js_zone` VALUES ('2788', '176', 'Tambov', 'TA', '1');
INSERT INTO `js_zone` VALUES ('2789', '176', 'Tomsk', 'TO', '1');
INSERT INTO `js_zone` VALUES ('2790', '176', 'Tula', 'TU', '1');
INSERT INTO `js_zone` VALUES ('2791', '176', 'Tura', 'TR', '1');
INSERT INTO `js_zone` VALUES ('2792', '176', 'Tver', 'TV', '1');
INSERT INTO `js_zone` VALUES ('2793', '176', 'Tyumen', 'TY', '1');
INSERT INTO `js_zone` VALUES ('2794', '176', 'Ufa', 'UF', '1');
INSERT INTO `js_zone` VALUES ('2795', '176', 'Ul\'yanovsk', 'UL', '1');
INSERT INTO `js_zone` VALUES ('2796', '176', 'Ulan-Ude', 'UU', '1');
INSERT INTO `js_zone` VALUES ('2797', '176', 'Ust\'-Ordynskiy', 'US', '1');
INSERT INTO `js_zone` VALUES ('2798', '176', 'Vladikavkaz', 'VL', '1');
INSERT INTO `js_zone` VALUES ('2799', '176', 'Vladimir', 'VA', '1');
INSERT INTO `js_zone` VALUES ('2800', '176', 'Vladivostok', 'VV', '1');
INSERT INTO `js_zone` VALUES ('2801', '176', 'Volgograd', 'VG', '1');
INSERT INTO `js_zone` VALUES ('2802', '176', 'Vologda', 'VD', '1');
INSERT INTO `js_zone` VALUES ('2803', '176', 'Voronezh', 'VO', '1');
INSERT INTO `js_zone` VALUES ('2804', '176', 'Vyatka', 'VY', '1');
INSERT INTO `js_zone` VALUES ('2805', '176', 'Yakutsk', 'YA', '1');
INSERT INTO `js_zone` VALUES ('2806', '176', 'Yaroslavl', 'YR', '1');
INSERT INTO `js_zone` VALUES ('2807', '176', 'Yekaterinburg', 'YE', '1');
INSERT INTO `js_zone` VALUES ('2808', '176', 'Yoshkar-Ola', 'YO', '1');
INSERT INTO `js_zone` VALUES ('2809', '177', 'Butare', 'BU', '1');
INSERT INTO `js_zone` VALUES ('2810', '177', 'Byumba', 'BY', '1');
INSERT INTO `js_zone` VALUES ('2811', '177', 'Cyangugu', 'CY', '1');
INSERT INTO `js_zone` VALUES ('2812', '177', 'Gikongoro', 'GK', '1');
INSERT INTO `js_zone` VALUES ('2813', '177', 'Gisenyi', 'GS', '1');
INSERT INTO `js_zone` VALUES ('2814', '177', 'Gitarama', 'GT', '1');
INSERT INTO `js_zone` VALUES ('2815', '177', 'Kibungo', 'KG', '1');
INSERT INTO `js_zone` VALUES ('2816', '177', 'Kibuye', 'KY', '1');
INSERT INTO `js_zone` VALUES ('2817', '177', 'Kigali Rurale', 'KR', '1');
INSERT INTO `js_zone` VALUES ('2818', '177', 'Kigali-ville', 'KV', '1');
INSERT INTO `js_zone` VALUES ('2819', '177', 'Ruhengeri', 'RU', '1');
INSERT INTO `js_zone` VALUES ('2820', '177', 'Umutara', 'UM', '1');
INSERT INTO `js_zone` VALUES ('2821', '178', 'Christ Church Nichola Town', 'CCN', '1');
INSERT INTO `js_zone` VALUES ('2822', '178', 'Saint Anne Sandy Point', 'SAS', '1');
INSERT INTO `js_zone` VALUES ('2823', '178', 'Saint George Basseterre', 'SGB', '1');
INSERT INTO `js_zone` VALUES ('2824', '178', 'Saint George Gingerland', 'SGG', '1');
INSERT INTO `js_zone` VALUES ('2825', '178', 'Saint James Windward', 'SJW', '1');
INSERT INTO `js_zone` VALUES ('2826', '178', 'Saint John Capesterre', 'SJC', '1');
INSERT INTO `js_zone` VALUES ('2827', '178', 'Saint John Figtree', 'SJF', '1');
INSERT INTO `js_zone` VALUES ('2828', '178', 'Saint Mary Cayon', 'SMC', '1');
INSERT INTO `js_zone` VALUES ('2829', '178', 'Saint Paul Capesterre', 'CAP', '1');
INSERT INTO `js_zone` VALUES ('2830', '178', 'Saint Paul Charlestown', 'CHA', '1');
INSERT INTO `js_zone` VALUES ('2831', '178', 'Saint Peter Basseterre', 'SPB', '1');
INSERT INTO `js_zone` VALUES ('2832', '178', 'Saint Thomas Lowland', 'STL', '1');
INSERT INTO `js_zone` VALUES ('2833', '178', 'Saint Thomas Middle Island', 'STM', '1');
INSERT INTO `js_zone` VALUES ('2834', '178', 'Trinity Palmetto Point', 'TPP', '1');
INSERT INTO `js_zone` VALUES ('2835', '179', 'Anse-la-Raye', 'AR', '1');
INSERT INTO `js_zone` VALUES ('2836', '179', 'Castries', 'CA', '1');
INSERT INTO `js_zone` VALUES ('2837', '179', 'Choiseul', 'CH', '1');
INSERT INTO `js_zone` VALUES ('2838', '179', 'Dauphin', 'DA', '1');
INSERT INTO `js_zone` VALUES ('2839', '179', 'Dennery', 'DE', '1');
INSERT INTO `js_zone` VALUES ('2840', '179', 'Gros-Islet', 'GI', '1');
INSERT INTO `js_zone` VALUES ('2841', '179', 'Laborie', 'LA', '1');
INSERT INTO `js_zone` VALUES ('2842', '179', 'Micoud', 'MI', '1');
INSERT INTO `js_zone` VALUES ('2843', '179', 'Praslin', 'PR', '1');
INSERT INTO `js_zone` VALUES ('2844', '179', 'Soufriere', 'SO', '1');
INSERT INTO `js_zone` VALUES ('2845', '179', 'Vieux-Fort', 'VF', '1');
INSERT INTO `js_zone` VALUES ('2846', '180', 'Charlotte', 'C', '1');
INSERT INTO `js_zone` VALUES ('2847', '180', 'Grenadines', 'R', '1');
INSERT INTO `js_zone` VALUES ('2848', '180', 'Saint Andrew', 'A', '1');
INSERT INTO `js_zone` VALUES ('2849', '180', 'Saint David', 'D', '1');
INSERT INTO `js_zone` VALUES ('2850', '180', 'Saint George', 'G', '1');
INSERT INTO `js_zone` VALUES ('2851', '180', 'Saint Patrick', 'P', '1');
INSERT INTO `js_zone` VALUES ('2852', '181', 'A\'ana', 'AN', '1');
INSERT INTO `js_zone` VALUES ('2853', '181', 'Aiga-i-le-Tai', 'AI', '1');
INSERT INTO `js_zone` VALUES ('2854', '181', 'Atua', 'AT', '1');
INSERT INTO `js_zone` VALUES ('2855', '181', 'Fa\'asaleleaga', 'FA', '1');
INSERT INTO `js_zone` VALUES ('2856', '181', 'Gaga\'emauga', 'GE', '1');
INSERT INTO `js_zone` VALUES ('2857', '181', 'Gagaifomauga', 'GF', '1');
INSERT INTO `js_zone` VALUES ('2858', '181', 'Palauli', 'PA', '1');
INSERT INTO `js_zone` VALUES ('2859', '181', 'Satupa\'itea', 'SA', '1');
INSERT INTO `js_zone` VALUES ('2860', '181', 'Tuamasaga', 'TU', '1');
INSERT INTO `js_zone` VALUES ('2861', '181', 'Va\'a-o-Fonoti', 'VF', '1');
INSERT INTO `js_zone` VALUES ('2862', '181', 'Vaisigano', 'VS', '1');
INSERT INTO `js_zone` VALUES ('2863', '182', 'Acquaviva', 'AC', '1');
INSERT INTO `js_zone` VALUES ('2864', '182', 'Borgo Maggiore', 'BM', '1');
INSERT INTO `js_zone` VALUES ('2865', '182', 'Chiesanuova', 'CH', '1');
INSERT INTO `js_zone` VALUES ('2866', '182', 'Domagnano', 'DO', '1');
INSERT INTO `js_zone` VALUES ('2867', '182', 'Faetano', 'FA', '1');
INSERT INTO `js_zone` VALUES ('2868', '182', 'Fiorentino', 'FI', '1');
INSERT INTO `js_zone` VALUES ('2869', '182', 'Montegiardino', 'MO', '1');
INSERT INTO `js_zone` VALUES ('2870', '182', 'Citta di San Marino', 'SM', '1');
INSERT INTO `js_zone` VALUES ('2871', '182', 'Serravalle', 'SE', '1');
INSERT INTO `js_zone` VALUES ('2872', '183', 'Sao Tome', 'S', '1');
INSERT INTO `js_zone` VALUES ('2873', '183', 'Principe', 'P', '1');
INSERT INTO `js_zone` VALUES ('2874', '184', 'Al Bahah', 'BH', '1');
INSERT INTO `js_zone` VALUES ('2875', '184', 'Al Hudud ash Shamaliyah', 'HS', '1');
INSERT INTO `js_zone` VALUES ('2876', '184', 'Al Jawf', 'JF', '1');
INSERT INTO `js_zone` VALUES ('2877', '184', 'Al Madinah', 'MD', '1');
INSERT INTO `js_zone` VALUES ('2878', '184', 'Al Qasim', 'QS', '1');
INSERT INTO `js_zone` VALUES ('2879', '184', 'Ar Riyad', 'RD', '1');
INSERT INTO `js_zone` VALUES ('2880', '184', 'Ash Sharqiyah (Eastern)', 'AQ', '1');
INSERT INTO `js_zone` VALUES ('2881', '184', '\'Asir', 'AS', '1');
INSERT INTO `js_zone` VALUES ('2882', '184', 'Ha\'il', 'HL', '1');
INSERT INTO `js_zone` VALUES ('2883', '184', 'Jizan', 'JZ', '1');
INSERT INTO `js_zone` VALUES ('2884', '184', 'Makkah', 'ML', '1');
INSERT INTO `js_zone` VALUES ('2885', '184', 'Najran', 'NR', '1');
INSERT INTO `js_zone` VALUES ('2886', '184', 'Tabuk', 'TB', '1');
INSERT INTO `js_zone` VALUES ('2887', '185', 'Dakar', 'DA', '1');
INSERT INTO `js_zone` VALUES ('2888', '185', 'Diourbel', 'DI', '1');
INSERT INTO `js_zone` VALUES ('2889', '185', 'Fatick', 'FA', '1');
INSERT INTO `js_zone` VALUES ('2890', '185', 'Kaolack', 'KA', '1');
INSERT INTO `js_zone` VALUES ('2891', '185', 'Kolda', 'KO', '1');
INSERT INTO `js_zone` VALUES ('2892', '185', 'Louga', 'LO', '1');
INSERT INTO `js_zone` VALUES ('2893', '185', 'Matam', 'MA', '1');
INSERT INTO `js_zone` VALUES ('2894', '185', 'Saint-Louis', 'SL', '1');
INSERT INTO `js_zone` VALUES ('2895', '185', 'Tambacounda', 'TA', '1');
INSERT INTO `js_zone` VALUES ('2896', '185', 'Thies', 'TH', '1');
INSERT INTO `js_zone` VALUES ('2897', '185', 'Ziguinchor', 'ZI', '1');
INSERT INTO `js_zone` VALUES ('2898', '186', 'Anse aux Pins', 'AP', '1');
INSERT INTO `js_zone` VALUES ('2899', '186', 'Anse Boileau', 'AB', '1');
INSERT INTO `js_zone` VALUES ('2900', '186', 'Anse Etoile', 'AE', '1');
INSERT INTO `js_zone` VALUES ('2901', '186', 'Anse Louis', 'AL', '1');
INSERT INTO `js_zone` VALUES ('2902', '186', 'Anse Royale', 'AR', '1');
INSERT INTO `js_zone` VALUES ('2903', '186', 'Baie Lazare', 'BL', '1');
INSERT INTO `js_zone` VALUES ('2904', '186', 'Baie Sainte Anne', 'BS', '1');
INSERT INTO `js_zone` VALUES ('2905', '186', 'Beau Vallon', 'BV', '1');
INSERT INTO `js_zone` VALUES ('2906', '186', 'Bel Air', 'BA', '1');
INSERT INTO `js_zone` VALUES ('2907', '186', 'Bel Ombre', 'BO', '1');
INSERT INTO `js_zone` VALUES ('2908', '186', 'Cascade', 'CA', '1');
INSERT INTO `js_zone` VALUES ('2909', '186', 'Glacis', 'GL', '1');
INSERT INTO `js_zone` VALUES ('2910', '186', 'Grand\' Anse (on Mahe)', 'GM', '1');
INSERT INTO `js_zone` VALUES ('2911', '186', 'Grand\' Anse (on Praslin)', 'GP', '1');
INSERT INTO `js_zone` VALUES ('2912', '186', 'La Digue', 'DG', '1');
INSERT INTO `js_zone` VALUES ('2913', '186', 'La Riviere Anglaise', 'RA', '1');
INSERT INTO `js_zone` VALUES ('2914', '186', 'Mont Buxton', 'MB', '1');
INSERT INTO `js_zone` VALUES ('2915', '186', 'Mont Fleuri', 'MF', '1');
INSERT INTO `js_zone` VALUES ('2916', '186', 'Plaisance', 'PL', '1');
INSERT INTO `js_zone` VALUES ('2917', '186', 'Pointe La Rue', 'PR', '1');
INSERT INTO `js_zone` VALUES ('2918', '186', 'Port Glaud', 'PG', '1');
INSERT INTO `js_zone` VALUES ('2919', '186', 'Saint Louis', 'SL', '1');
INSERT INTO `js_zone` VALUES ('2920', '186', 'Takamaka', 'TA', '1');
INSERT INTO `js_zone` VALUES ('2921', '187', 'Eastern', 'E', '1');
INSERT INTO `js_zone` VALUES ('2922', '187', 'Northern', 'N', '1');
INSERT INTO `js_zone` VALUES ('2923', '187', 'Southern', 'S', '1');
INSERT INTO `js_zone` VALUES ('2924', '187', 'Western', 'W', '1');
INSERT INTO `js_zone` VALUES ('2925', '189', 'Banskobystrický', 'BA', '1');
INSERT INTO `js_zone` VALUES ('2926', '189', 'Bratislavský', 'BR', '1');
INSERT INTO `js_zone` VALUES ('2927', '189', 'Košický', 'KO', '1');
INSERT INTO `js_zone` VALUES ('2928', '189', 'Nitriansky', 'NI', '1');
INSERT INTO `js_zone` VALUES ('2929', '189', 'Prešovský', 'PR', '1');
INSERT INTO `js_zone` VALUES ('2930', '189', 'Trenčiansky', 'TC', '1');
INSERT INTO `js_zone` VALUES ('2931', '189', 'Trnavský', 'TV', '1');
INSERT INTO `js_zone` VALUES ('2932', '189', 'Žilinský', 'ZI', '1');
INSERT INTO `js_zone` VALUES ('2933', '191', 'Central', 'CE', '1');
INSERT INTO `js_zone` VALUES ('2934', '191', 'Choiseul', 'CH', '1');
INSERT INTO `js_zone` VALUES ('2935', '191', 'Guadalcanal', 'GC', '1');
INSERT INTO `js_zone` VALUES ('2936', '191', 'Honiara', 'HO', '1');
INSERT INTO `js_zone` VALUES ('2937', '191', 'Isabel', 'IS', '1');
INSERT INTO `js_zone` VALUES ('2938', '191', 'Makira', 'MK', '1');
INSERT INTO `js_zone` VALUES ('2939', '191', 'Malaita', 'ML', '1');
INSERT INTO `js_zone` VALUES ('2940', '191', 'Rennell and Bellona', 'RB', '1');
INSERT INTO `js_zone` VALUES ('2941', '191', 'Temotu', 'TM', '1');
INSERT INTO `js_zone` VALUES ('2942', '191', 'Western', 'WE', '1');
INSERT INTO `js_zone` VALUES ('2943', '192', 'Awdal', 'AW', '1');
INSERT INTO `js_zone` VALUES ('2944', '192', 'Bakool', 'BK', '1');
INSERT INTO `js_zone` VALUES ('2945', '192', 'Banaadir', 'BN', '1');
INSERT INTO `js_zone` VALUES ('2946', '192', 'Bari', 'BR', '1');
INSERT INTO `js_zone` VALUES ('2947', '192', 'Bay', 'BY', '1');
INSERT INTO `js_zone` VALUES ('2948', '192', 'Galguduud', 'GA', '1');
INSERT INTO `js_zone` VALUES ('2949', '192', 'Gedo', 'GE', '1');
INSERT INTO `js_zone` VALUES ('2950', '192', 'Hiiraan', 'HI', '1');
INSERT INTO `js_zone` VALUES ('2951', '192', 'Jubbada Dhexe', 'JD', '1');
INSERT INTO `js_zone` VALUES ('2952', '192', 'Jubbada Hoose', 'JH', '1');
INSERT INTO `js_zone` VALUES ('2953', '192', 'Mudug', 'MU', '1');
INSERT INTO `js_zone` VALUES ('2954', '192', 'Nugaal', 'NU', '1');
INSERT INTO `js_zone` VALUES ('2955', '192', 'Sanaag', 'SA', '1');
INSERT INTO `js_zone` VALUES ('2956', '192', 'Shabeellaha Dhexe', 'SD', '1');
INSERT INTO `js_zone` VALUES ('2957', '192', 'Shabeellaha Hoose', 'SH', '1');
INSERT INTO `js_zone` VALUES ('2958', '192', 'Sool', 'SL', '1');
INSERT INTO `js_zone` VALUES ('2959', '192', 'Togdheer', 'TO', '1');
INSERT INTO `js_zone` VALUES ('2960', '192', 'Woqooyi Galbeed', 'WG', '1');
INSERT INTO `js_zone` VALUES ('2961', '193', 'Eastern Cape', 'EC', '1');
INSERT INTO `js_zone` VALUES ('2962', '193', 'Free State', 'FS', '1');
INSERT INTO `js_zone` VALUES ('2963', '193', 'Gauteng', 'GT', '1');
INSERT INTO `js_zone` VALUES ('2964', '193', 'KwaZulu-Natal', 'KN', '1');
INSERT INTO `js_zone` VALUES ('2965', '193', 'Limpopo', 'LP', '1');
INSERT INTO `js_zone` VALUES ('2966', '193', 'Mpumalanga', 'MP', '1');
INSERT INTO `js_zone` VALUES ('2967', '193', 'North West', 'NW', '1');
INSERT INTO `js_zone` VALUES ('2968', '193', 'Northern Cape', 'NC', '1');
INSERT INTO `js_zone` VALUES ('2969', '193', 'Western Cape', 'WC', '1');
INSERT INTO `js_zone` VALUES ('2970', '195', 'La Coru&ntilde;a', 'CA', '1');
INSERT INTO `js_zone` VALUES ('2971', '195', '&Aacute;lava', 'AL', '1');
INSERT INTO `js_zone` VALUES ('2972', '195', 'Albacete', 'AB', '1');
INSERT INTO `js_zone` VALUES ('2973', '195', 'Alicante', 'AC', '1');
INSERT INTO `js_zone` VALUES ('2974', '195', 'Almeria', 'AM', '1');
INSERT INTO `js_zone` VALUES ('2975', '195', 'Asturias', 'AS', '1');
INSERT INTO `js_zone` VALUES ('2976', '195', '&Aacute;vila', 'AV', '1');
INSERT INTO `js_zone` VALUES ('2977', '195', 'Badajoz', 'BJ', '1');
INSERT INTO `js_zone` VALUES ('2978', '195', 'Baleares', 'IB', '1');
INSERT INTO `js_zone` VALUES ('2979', '195', 'Barcelona', 'BA', '1');
INSERT INTO `js_zone` VALUES ('2980', '195', 'Burgos', 'BU', '1');
INSERT INTO `js_zone` VALUES ('2981', '195', 'C&aacute;ceres', 'CC', '1');
INSERT INTO `js_zone` VALUES ('2982', '195', 'C&aacute;diz', 'CZ', '1');
INSERT INTO `js_zone` VALUES ('2983', '195', 'Cantabria', 'CT', '1');
INSERT INTO `js_zone` VALUES ('2984', '195', 'Castell&oacute;n', 'CL', '1');
INSERT INTO `js_zone` VALUES ('2985', '195', 'Ceuta', 'CE', '1');
INSERT INTO `js_zone` VALUES ('2986', '195', 'Ciudad Real', 'CR', '1');
INSERT INTO `js_zone` VALUES ('2987', '195', 'C&oacute;rdoba', 'CD', '1');
INSERT INTO `js_zone` VALUES ('2988', '195', 'Cuenca', 'CU', '1');
INSERT INTO `js_zone` VALUES ('2989', '195', 'Girona', 'GI', '1');
INSERT INTO `js_zone` VALUES ('2990', '195', 'Granada', 'GD', '1');
INSERT INTO `js_zone` VALUES ('2991', '195', 'Guadalajara', 'GJ', '1');
INSERT INTO `js_zone` VALUES ('2992', '195', 'Guip&uacute;zcoa', 'GP', '1');
INSERT INTO `js_zone` VALUES ('2993', '195', 'Huelva', 'HL', '1');
INSERT INTO `js_zone` VALUES ('2994', '195', 'Huesca', 'HS', '1');
INSERT INTO `js_zone` VALUES ('2995', '195', 'Ja&eacute;n', 'JN', '1');
INSERT INTO `js_zone` VALUES ('2996', '195', 'La Rioja', 'RJ', '1');
INSERT INTO `js_zone` VALUES ('2997', '195', 'Las Palmas', 'PM', '1');
INSERT INTO `js_zone` VALUES ('2998', '195', 'Leon', 'LE', '1');
INSERT INTO `js_zone` VALUES ('2999', '195', 'Lleida', 'LL', '1');
INSERT INTO `js_zone` VALUES ('3000', '195', 'Lugo', 'LG', '1');
INSERT INTO `js_zone` VALUES ('3001', '195', 'Madrid', 'MD', '1');
INSERT INTO `js_zone` VALUES ('3002', '195', 'Malaga', 'MA', '1');
INSERT INTO `js_zone` VALUES ('3003', '195', 'Melilla', 'ML', '1');
INSERT INTO `js_zone` VALUES ('3004', '195', 'Murcia', 'MU', '1');
INSERT INTO `js_zone` VALUES ('3005', '195', 'Navarra', 'NV', '1');
INSERT INTO `js_zone` VALUES ('3006', '195', 'Ourense', 'OU', '1');
INSERT INTO `js_zone` VALUES ('3007', '195', 'Palencia', 'PL', '1');
INSERT INTO `js_zone` VALUES ('3008', '195', 'Pontevedra', 'PO', '1');
INSERT INTO `js_zone` VALUES ('3009', '195', 'Salamanca', 'SL', '1');
INSERT INTO `js_zone` VALUES ('3010', '195', 'Santa Cruz de Tenerife', 'SC', '1');
INSERT INTO `js_zone` VALUES ('3011', '195', 'Segovia', 'SG', '1');
INSERT INTO `js_zone` VALUES ('3012', '195', 'Sevilla', 'SV', '1');
INSERT INTO `js_zone` VALUES ('3013', '195', 'Soria', 'SO', '1');
INSERT INTO `js_zone` VALUES ('3014', '195', 'Tarragona', 'TA', '1');
INSERT INTO `js_zone` VALUES ('3015', '195', 'Teruel', 'TE', '1');
INSERT INTO `js_zone` VALUES ('3016', '195', 'Toledo', 'TO', '1');
INSERT INTO `js_zone` VALUES ('3017', '195', 'Valencia', 'VC', '1');
INSERT INTO `js_zone` VALUES ('3018', '195', 'Valladolid', 'VD', '1');
INSERT INTO `js_zone` VALUES ('3019', '195', 'Vizcaya', 'VZ', '1');
INSERT INTO `js_zone` VALUES ('3020', '195', 'Zamora', 'ZM', '1');
INSERT INTO `js_zone` VALUES ('3021', '195', 'Zaragoza', 'ZR', '1');
INSERT INTO `js_zone` VALUES ('3022', '196', 'Central', 'CE', '1');
INSERT INTO `js_zone` VALUES ('3023', '196', 'Eastern', 'EA', '1');
INSERT INTO `js_zone` VALUES ('3024', '196', 'North Central', 'NC', '1');
INSERT INTO `js_zone` VALUES ('3025', '196', 'Northern', 'NO', '1');
INSERT INTO `js_zone` VALUES ('3026', '196', 'North Western', 'NW', '1');
INSERT INTO `js_zone` VALUES ('3027', '196', 'Sabaragamuwa', 'SA', '1');
INSERT INTO `js_zone` VALUES ('3028', '196', 'Southern', 'SO', '1');
INSERT INTO `js_zone` VALUES ('3029', '196', 'Uva', 'UV', '1');
INSERT INTO `js_zone` VALUES ('3030', '196', 'Western', 'WE', '1');
INSERT INTO `js_zone` VALUES ('3031', '197', 'Ascension', 'A', '1');
INSERT INTO `js_zone` VALUES ('3032', '197', 'Saint Helena', 'S', '1');
INSERT INTO `js_zone` VALUES ('3033', '197', 'Tristan da Cunha', 'T', '1');
INSERT INTO `js_zone` VALUES ('3034', '199', 'A\'ali an Nil', 'ANL', '1');
INSERT INTO `js_zone` VALUES ('3035', '199', 'Al Bahr al Ahmar', 'BAM', '1');
INSERT INTO `js_zone` VALUES ('3036', '199', 'Al Buhayrat', 'BRT', '1');
INSERT INTO `js_zone` VALUES ('3037', '199', 'Al Jazirah', 'JZR', '1');
INSERT INTO `js_zone` VALUES ('3038', '199', 'Al Khartum', 'KRT', '1');
INSERT INTO `js_zone` VALUES ('3039', '199', 'Al Qadarif', 'QDR', '1');
INSERT INTO `js_zone` VALUES ('3040', '199', 'Al Wahdah', 'WDH', '1');
INSERT INTO `js_zone` VALUES ('3041', '199', 'An Nil al Abyad', 'ANB', '1');
INSERT INTO `js_zone` VALUES ('3042', '199', 'An Nil al Azraq', 'ANZ', '1');
INSERT INTO `js_zone` VALUES ('3043', '199', 'Ash Shamaliyah', 'ASH', '1');
INSERT INTO `js_zone` VALUES ('3044', '199', 'Bahr al Jabal', 'BJA', '1');
INSERT INTO `js_zone` VALUES ('3045', '199', 'Gharb al Istiwa\'iyah', 'GIS', '1');
INSERT INTO `js_zone` VALUES ('3046', '199', 'Gharb Bahr al Ghazal', 'GBG', '1');
INSERT INTO `js_zone` VALUES ('3047', '199', 'Gharb Darfur', 'GDA', '1');
INSERT INTO `js_zone` VALUES ('3048', '199', 'Gharb Kurdufan', 'GKU', '1');
INSERT INTO `js_zone` VALUES ('3049', '199', 'Janub Darfur', 'JDA', '1');
INSERT INTO `js_zone` VALUES ('3050', '199', 'Janub Kurdufan', 'JKU', '1');
INSERT INTO `js_zone` VALUES ('3051', '199', 'Junqali', 'JQL', '1');
INSERT INTO `js_zone` VALUES ('3052', '199', 'Kassala', 'KSL', '1');
INSERT INTO `js_zone` VALUES ('3053', '199', 'Nahr an Nil', 'NNL', '1');
INSERT INTO `js_zone` VALUES ('3054', '199', 'Shamal Bahr al Ghazal', 'SBG', '1');
INSERT INTO `js_zone` VALUES ('3055', '199', 'Shamal Darfur', 'SDA', '1');
INSERT INTO `js_zone` VALUES ('3056', '199', 'Shamal Kurdufan', 'SKU', '1');
INSERT INTO `js_zone` VALUES ('3057', '199', 'Sharq al Istiwa\'iyah', 'SIS', '1');
INSERT INTO `js_zone` VALUES ('3058', '199', 'Sinnar', 'SNR', '1');
INSERT INTO `js_zone` VALUES ('3059', '199', 'Warab', 'WRB', '1');
INSERT INTO `js_zone` VALUES ('3060', '200', 'Brokopondo', 'BR', '1');
INSERT INTO `js_zone` VALUES ('3061', '200', 'Commewijne', 'CM', '1');
INSERT INTO `js_zone` VALUES ('3062', '200', 'Coronie', 'CR', '1');
INSERT INTO `js_zone` VALUES ('3063', '200', 'Marowijne', 'MA', '1');
INSERT INTO `js_zone` VALUES ('3064', '200', 'Nickerie', 'NI', '1');
INSERT INTO `js_zone` VALUES ('3065', '200', 'Para', 'PA', '1');
INSERT INTO `js_zone` VALUES ('3066', '200', 'Paramaribo', 'PM', '1');
INSERT INTO `js_zone` VALUES ('3067', '200', 'Saramacca', 'SA', '1');
INSERT INTO `js_zone` VALUES ('3068', '200', 'Sipaliwini', 'SI', '1');
INSERT INTO `js_zone` VALUES ('3069', '200', 'Wanica', 'WA', '1');
INSERT INTO `js_zone` VALUES ('3070', '202', 'Hhohho', 'H', '1');
INSERT INTO `js_zone` VALUES ('3071', '202', 'Lubombo', 'L', '1');
INSERT INTO `js_zone` VALUES ('3072', '202', 'Manzini', 'M', '1');
INSERT INTO `js_zone` VALUES ('3073', '202', 'Shishelweni', 'S', '1');
INSERT INTO `js_zone` VALUES ('3074', '203', 'Blekinge', 'K', '1');
INSERT INTO `js_zone` VALUES ('3075', '203', 'Dalarna', 'W', '1');
INSERT INTO `js_zone` VALUES ('3076', '203', 'G&auml;vleborg', 'X', '1');
INSERT INTO `js_zone` VALUES ('3077', '203', 'Gotland', 'I', '1');
INSERT INTO `js_zone` VALUES ('3078', '203', 'Halland', 'N', '1');
INSERT INTO `js_zone` VALUES ('3079', '203', 'J&auml;mtland', 'Z', '1');
INSERT INTO `js_zone` VALUES ('3080', '203', 'J&ouml;nk&ouml;ping', 'F', '1');
INSERT INTO `js_zone` VALUES ('3081', '203', 'Kalmar', 'H', '1');
INSERT INTO `js_zone` VALUES ('3082', '203', 'Kronoberg', 'G', '1');
INSERT INTO `js_zone` VALUES ('3083', '203', 'Norrbotten', 'BD', '1');
INSERT INTO `js_zone` VALUES ('3084', '203', '&Ouml;rebro', 'T', '1');
INSERT INTO `js_zone` VALUES ('3085', '203', '&Ouml;sterg&ouml;tland', 'E', '1');
INSERT INTO `js_zone` VALUES ('3086', '203', 'Sk&aring;ne', 'M', '1');
INSERT INTO `js_zone` VALUES ('3087', '203', 'S&ouml;dermanland', 'D', '1');
INSERT INTO `js_zone` VALUES ('3088', '203', 'Stockholm', 'AB', '1');
INSERT INTO `js_zone` VALUES ('3089', '203', 'Uppsala', 'C', '1');
INSERT INTO `js_zone` VALUES ('3090', '203', 'V&auml;rmland', 'S', '1');
INSERT INTO `js_zone` VALUES ('3091', '203', 'V&auml;sterbotten', 'AC', '1');
INSERT INTO `js_zone` VALUES ('3092', '203', 'V&auml;sternorrland', 'Y', '1');
INSERT INTO `js_zone` VALUES ('3093', '203', 'V&auml;stmanland', 'U', '1');
INSERT INTO `js_zone` VALUES ('3094', '203', 'V&auml;stra G&ouml;taland', 'O', '1');
INSERT INTO `js_zone` VALUES ('3095', '204', 'Aargau', 'AG', '1');
INSERT INTO `js_zone` VALUES ('3096', '204', 'Appenzell Ausserrhoden', 'AR', '1');
INSERT INTO `js_zone` VALUES ('3097', '204', 'Appenzell Innerrhoden', 'AI', '1');
INSERT INTO `js_zone` VALUES ('3098', '204', 'Basel-Stadt', 'BS', '1');
INSERT INTO `js_zone` VALUES ('3099', '204', 'Basel-Landschaft', 'BL', '1');
INSERT INTO `js_zone` VALUES ('3100', '204', 'Bern', 'BE', '1');
INSERT INTO `js_zone` VALUES ('3101', '204', 'Fribourg', 'FR', '1');
INSERT INTO `js_zone` VALUES ('3102', '204', 'Gen&egrave;ve', 'GE', '1');
INSERT INTO `js_zone` VALUES ('3103', '204', 'Glarus', 'GL', '1');
INSERT INTO `js_zone` VALUES ('3104', '204', 'Graub&uuml;nden', 'GR', '1');
INSERT INTO `js_zone` VALUES ('3105', '204', 'Jura', 'JU', '1');
INSERT INTO `js_zone` VALUES ('3106', '204', 'Luzern', 'LU', '1');
INSERT INTO `js_zone` VALUES ('3107', '204', 'Neuch&acirc;tel', 'NE', '1');
INSERT INTO `js_zone` VALUES ('3108', '204', 'Nidwald', 'NW', '1');
INSERT INTO `js_zone` VALUES ('3109', '204', 'Obwald', 'OW', '1');
INSERT INTO `js_zone` VALUES ('3110', '204', 'St. Gallen', 'SG', '1');
INSERT INTO `js_zone` VALUES ('3111', '204', 'Schaffhausen', 'SH', '1');
INSERT INTO `js_zone` VALUES ('3112', '204', 'Schwyz', 'SZ', '1');
INSERT INTO `js_zone` VALUES ('3113', '204', 'Solothurn', 'SO', '1');
INSERT INTO `js_zone` VALUES ('3114', '204', 'Thurgau', 'TG', '1');
INSERT INTO `js_zone` VALUES ('3115', '204', 'Ticino', 'TI', '1');
INSERT INTO `js_zone` VALUES ('3116', '204', 'Uri', 'UR', '1');
INSERT INTO `js_zone` VALUES ('3117', '204', 'Valais', 'VS', '1');
INSERT INTO `js_zone` VALUES ('3118', '204', 'Vaud', 'VD', '1');
INSERT INTO `js_zone` VALUES ('3119', '204', 'Zug', 'ZG', '1');
INSERT INTO `js_zone` VALUES ('3120', '204', 'Z&uuml;rich', 'ZH', '1');
INSERT INTO `js_zone` VALUES ('3121', '205', 'Al Hasakah', 'HA', '1');
INSERT INTO `js_zone` VALUES ('3122', '205', 'Al Ladhiqiyah', 'LA', '1');
INSERT INTO `js_zone` VALUES ('3123', '205', 'Al Qunaytirah', 'QU', '1');
INSERT INTO `js_zone` VALUES ('3124', '205', 'Ar Raqqah', 'RQ', '1');
INSERT INTO `js_zone` VALUES ('3125', '205', 'As Suwayda', 'SU', '1');
INSERT INTO `js_zone` VALUES ('3126', '205', 'Dara', 'DA', '1');
INSERT INTO `js_zone` VALUES ('3127', '205', 'Dayr az Zawr', 'DZ', '1');
INSERT INTO `js_zone` VALUES ('3128', '205', 'Dimashq', 'DI', '1');
INSERT INTO `js_zone` VALUES ('3129', '205', 'Halab', 'HL', '1');
INSERT INTO `js_zone` VALUES ('3130', '205', 'Hamah', 'HM', '1');
INSERT INTO `js_zone` VALUES ('3131', '205', 'Hims', 'HI', '1');
INSERT INTO `js_zone` VALUES ('3132', '205', 'Idlib', 'ID', '1');
INSERT INTO `js_zone` VALUES ('3133', '205', 'Rif Dimashq', 'RD', '1');
INSERT INTO `js_zone` VALUES ('3134', '205', 'Tartus', 'TA', '1');
INSERT INTO `js_zone` VALUES ('3135', '206', 'Chang-hua', 'CH', '1');
INSERT INTO `js_zone` VALUES ('3136', '206', 'Chia-i', 'CI', '1');
INSERT INTO `js_zone` VALUES ('3137', '206', 'Hsin-chu', 'HS', '1');
INSERT INTO `js_zone` VALUES ('3138', '206', 'Hua-lien', 'HL', '1');
INSERT INTO `js_zone` VALUES ('3139', '206', 'I-lan', 'IL', '1');
INSERT INTO `js_zone` VALUES ('3140', '206', 'Kao-hsiung county', 'KH', '1');
INSERT INTO `js_zone` VALUES ('3141', '206', 'Kin-men', 'KM', '1');
INSERT INTO `js_zone` VALUES ('3142', '206', 'Lien-chiang', 'LC', '1');
INSERT INTO `js_zone` VALUES ('3143', '206', 'Miao-li', 'ML', '1');
INSERT INTO `js_zone` VALUES ('3144', '206', 'Nan-t\'ou', 'NT', '1');
INSERT INTO `js_zone` VALUES ('3145', '206', 'P\'eng-hu', 'PH', '1');
INSERT INTO `js_zone` VALUES ('3146', '206', 'P\'ing-tung', 'PT', '1');
INSERT INTO `js_zone` VALUES ('3147', '206', 'T\'ai-chung', 'TG', '1');
INSERT INTO `js_zone` VALUES ('3148', '206', 'T\'ai-nan', 'TA', '1');
INSERT INTO `js_zone` VALUES ('3149', '206', 'T\'ai-pei county', 'TP', '1');
INSERT INTO `js_zone` VALUES ('3150', '206', 'T\'ai-tung', 'TT', '1');
INSERT INTO `js_zone` VALUES ('3151', '206', 'T\'ao-yuan', 'TY', '1');
INSERT INTO `js_zone` VALUES ('3152', '206', 'Yun-lin', 'YL', '1');
INSERT INTO `js_zone` VALUES ('3153', '206', 'Chia-i city', 'CC', '1');
INSERT INTO `js_zone` VALUES ('3154', '206', 'Chi-lung', 'CL', '1');
INSERT INTO `js_zone` VALUES ('3155', '206', 'Hsin-chu', 'HC', '1');
INSERT INTO `js_zone` VALUES ('3156', '206', 'T\'ai-chung', 'TH', '1');
INSERT INTO `js_zone` VALUES ('3157', '206', 'T\'ai-nan', 'TN', '1');
INSERT INTO `js_zone` VALUES ('3158', '206', 'Kao-hsiung city', 'KC', '1');
INSERT INTO `js_zone` VALUES ('3159', '206', 'T\'ai-pei city', 'TC', '1');
INSERT INTO `js_zone` VALUES ('3160', '207', 'Gorno-Badakhstan', 'GB', '1');
INSERT INTO `js_zone` VALUES ('3161', '207', 'Khatlon', 'KT', '1');
INSERT INTO `js_zone` VALUES ('3162', '207', 'Sughd', 'SU', '1');
INSERT INTO `js_zone` VALUES ('3163', '208', 'Arusha', 'AR', '1');
INSERT INTO `js_zone` VALUES ('3164', '208', 'Dar es Salaam', 'DS', '1');
INSERT INTO `js_zone` VALUES ('3165', '208', 'Dodoma', 'DO', '1');
INSERT INTO `js_zone` VALUES ('3166', '208', 'Iringa', 'IR', '1');
INSERT INTO `js_zone` VALUES ('3167', '208', 'Kagera', 'KA', '1');
INSERT INTO `js_zone` VALUES ('3168', '208', 'Kigoma', 'KI', '1');
INSERT INTO `js_zone` VALUES ('3169', '208', 'Kilimanjaro', 'KJ', '1');
INSERT INTO `js_zone` VALUES ('3170', '208', 'Lindi', 'LN', '1');
INSERT INTO `js_zone` VALUES ('3171', '208', 'Manyara', 'MY', '1');
INSERT INTO `js_zone` VALUES ('3172', '208', 'Mara', 'MR', '1');
INSERT INTO `js_zone` VALUES ('3173', '208', 'Mbeya', 'MB', '1');
INSERT INTO `js_zone` VALUES ('3174', '208', 'Morogoro', 'MO', '1');
INSERT INTO `js_zone` VALUES ('3175', '208', 'Mtwara', 'MT', '1');
INSERT INTO `js_zone` VALUES ('3176', '208', 'Mwanza', 'MW', '1');
INSERT INTO `js_zone` VALUES ('3177', '208', 'Pemba North', 'PN', '1');
INSERT INTO `js_zone` VALUES ('3178', '208', 'Pemba South', 'PS', '1');
INSERT INTO `js_zone` VALUES ('3179', '208', 'Pwani', 'PW', '1');
INSERT INTO `js_zone` VALUES ('3180', '208', 'Rukwa', 'RK', '1');
INSERT INTO `js_zone` VALUES ('3181', '208', 'Ruvuma', 'RV', '1');
INSERT INTO `js_zone` VALUES ('3182', '208', 'Shinyanga', 'SH', '1');
INSERT INTO `js_zone` VALUES ('3183', '208', 'Singida', 'SI', '1');
INSERT INTO `js_zone` VALUES ('3184', '208', 'Tabora', 'TB', '1');
INSERT INTO `js_zone` VALUES ('3185', '208', 'Tanga', 'TN', '1');
INSERT INTO `js_zone` VALUES ('3186', '208', 'Zanzibar Central/South', 'ZC', '1');
INSERT INTO `js_zone` VALUES ('3187', '208', 'Zanzibar North', 'ZN', '1');
INSERT INTO `js_zone` VALUES ('3188', '208', 'Zanzibar Urban/West', 'ZU', '1');
INSERT INTO `js_zone` VALUES ('3189', '209', 'Amnat Charoen', 'Amnat Charoen', '1');
INSERT INTO `js_zone` VALUES ('3190', '209', 'Ang Thong', 'Ang Thong', '1');
INSERT INTO `js_zone` VALUES ('3191', '209', 'Ayutthaya', 'Ayutthaya', '1');
INSERT INTO `js_zone` VALUES ('3192', '209', 'Bangkok', 'Bangkok', '1');
INSERT INTO `js_zone` VALUES ('3193', '209', 'Buriram', 'Buriram', '1');
INSERT INTO `js_zone` VALUES ('3194', '209', 'Chachoengsao', 'Chachoengsao', '1');
INSERT INTO `js_zone` VALUES ('3195', '209', 'Chai Nat', 'Chai Nat', '1');
INSERT INTO `js_zone` VALUES ('3196', '209', 'Chaiyaphum', 'Chaiyaphum', '1');
INSERT INTO `js_zone` VALUES ('3197', '209', 'Chanthaburi', 'Chanthaburi', '1');
INSERT INTO `js_zone` VALUES ('3198', '209', 'Chiang Mai', 'Chiang Mai', '1');
INSERT INTO `js_zone` VALUES ('3199', '209', 'Chiang Rai', 'Chiang Rai', '1');
INSERT INTO `js_zone` VALUES ('3200', '209', 'Chon Buri', 'Chon Buri', '1');
INSERT INTO `js_zone` VALUES ('3201', '209', 'Chumphon', 'Chumphon', '1');
INSERT INTO `js_zone` VALUES ('3202', '209', 'Kalasin', 'Kalasin', '1');
INSERT INTO `js_zone` VALUES ('3203', '209', 'Kamphaeng Phet', 'Kamphaeng Phet', '1');
INSERT INTO `js_zone` VALUES ('3204', '209', 'Kanchanaburi', 'Kanchanaburi', '1');
INSERT INTO `js_zone` VALUES ('3205', '209', 'Khon Kaen', 'Khon Kaen', '1');
INSERT INTO `js_zone` VALUES ('3206', '209', 'Krabi', 'Krabi', '1');
INSERT INTO `js_zone` VALUES ('3207', '209', 'Lampang', 'Lampang', '1');
INSERT INTO `js_zone` VALUES ('3208', '209', 'Lamphun', 'Lamphun', '1');
INSERT INTO `js_zone` VALUES ('3209', '209', 'Loei', 'Loei', '1');
INSERT INTO `js_zone` VALUES ('3210', '209', 'Lop Buri', 'Lop Buri', '1');
INSERT INTO `js_zone` VALUES ('3211', '209', 'Mae Hong Son', 'Mae Hong Son', '1');
INSERT INTO `js_zone` VALUES ('3212', '209', 'Maha Sarakham', 'Maha Sarakham', '1');
INSERT INTO `js_zone` VALUES ('3213', '209', 'Mukdahan', 'Mukdahan', '1');
INSERT INTO `js_zone` VALUES ('3214', '209', 'Nakhon Nayok', 'Nakhon Nayok', '1');
INSERT INTO `js_zone` VALUES ('3215', '209', 'Nakhon Pathom', 'Nakhon Pathom', '1');
INSERT INTO `js_zone` VALUES ('3216', '209', 'Nakhon Phanom', 'Nakhon Phanom', '1');
INSERT INTO `js_zone` VALUES ('3217', '209', 'Nakhon Ratchasima', 'Nakhon Ratchasima', '1');
INSERT INTO `js_zone` VALUES ('3218', '209', 'Nakhon Sawan', 'Nakhon Sawan', '1');
INSERT INTO `js_zone` VALUES ('3219', '209', 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', '1');
INSERT INTO `js_zone` VALUES ('3220', '209', 'Nan', 'Nan', '1');
INSERT INTO `js_zone` VALUES ('3221', '209', 'Narathiwat', 'Narathiwat', '1');
INSERT INTO `js_zone` VALUES ('3222', '209', 'Nong Bua Lamphu', 'Nong Bua Lamphu', '1');
INSERT INTO `js_zone` VALUES ('3223', '209', 'Nong Khai', 'Nong Khai', '1');
INSERT INTO `js_zone` VALUES ('3224', '209', 'Nonthaburi', 'Nonthaburi', '1');
INSERT INTO `js_zone` VALUES ('3225', '209', 'Pathum Thani', 'Pathum Thani', '1');
INSERT INTO `js_zone` VALUES ('3226', '209', 'Pattani', 'Pattani', '1');
INSERT INTO `js_zone` VALUES ('3227', '209', 'Phangnga', 'Phangnga', '1');
INSERT INTO `js_zone` VALUES ('3228', '209', 'Phatthalung', 'Phatthalung', '1');
INSERT INTO `js_zone` VALUES ('3229', '209', 'Phayao', 'Phayao', '1');
INSERT INTO `js_zone` VALUES ('3230', '209', 'Phetchabun', 'Phetchabun', '1');
INSERT INTO `js_zone` VALUES ('3231', '209', 'Phetchaburi', 'Phetchaburi', '1');
INSERT INTO `js_zone` VALUES ('3232', '209', 'Phichit', 'Phichit', '1');
INSERT INTO `js_zone` VALUES ('3233', '209', 'Phitsanulok', 'Phitsanulok', '1');
INSERT INTO `js_zone` VALUES ('3234', '209', 'Phrae', 'Phrae', '1');
INSERT INTO `js_zone` VALUES ('3235', '209', 'Phuket', 'Phuket', '1');
INSERT INTO `js_zone` VALUES ('3236', '209', 'Prachin Buri', 'Prachin Buri', '1');
INSERT INTO `js_zone` VALUES ('3237', '209', 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', '1');
INSERT INTO `js_zone` VALUES ('3238', '209', 'Ranong', 'Ranong', '1');
INSERT INTO `js_zone` VALUES ('3239', '209', 'Ratchaburi', 'Ratchaburi', '1');
INSERT INTO `js_zone` VALUES ('3240', '209', 'Rayong', 'Rayong', '1');
INSERT INTO `js_zone` VALUES ('3241', '209', 'Roi Et', 'Roi Et', '1');
INSERT INTO `js_zone` VALUES ('3242', '209', 'Sa Kaeo', 'Sa Kaeo', '1');
INSERT INTO `js_zone` VALUES ('3243', '209', 'Sakon Nakhon', 'Sakon Nakhon', '1');
INSERT INTO `js_zone` VALUES ('3244', '209', 'Samut Prakan', 'Samut Prakan', '1');
INSERT INTO `js_zone` VALUES ('3245', '209', 'Samut Sakhon', 'Samut Sakhon', '1');
INSERT INTO `js_zone` VALUES ('3246', '209', 'Samut Songkhram', 'Samut Songkhram', '1');
INSERT INTO `js_zone` VALUES ('3247', '209', 'Sara Buri', 'Sara Buri', '1');
INSERT INTO `js_zone` VALUES ('3248', '209', 'Satun', 'Satun', '1');
INSERT INTO `js_zone` VALUES ('3249', '209', 'Sing Buri', 'Sing Buri', '1');
INSERT INTO `js_zone` VALUES ('3250', '209', 'Sisaket', 'Sisaket', '1');
INSERT INTO `js_zone` VALUES ('3251', '209', 'Songkhla', 'Songkhla', '1');
INSERT INTO `js_zone` VALUES ('3252', '209', 'Sukhothai', 'Sukhothai', '1');
INSERT INTO `js_zone` VALUES ('3253', '209', 'Suphan Buri', 'Suphan Buri', '1');
INSERT INTO `js_zone` VALUES ('3254', '209', 'Surat Thani', 'Surat Thani', '1');
INSERT INTO `js_zone` VALUES ('3255', '209', 'Surin', 'Surin', '1');
INSERT INTO `js_zone` VALUES ('3256', '209', 'Tak', 'Tak', '1');
INSERT INTO `js_zone` VALUES ('3257', '209', 'Trang', 'Trang', '1');
INSERT INTO `js_zone` VALUES ('3258', '209', 'Trat', 'Trat', '1');
INSERT INTO `js_zone` VALUES ('3259', '209', 'Ubon Ratchathani', 'Ubon Ratchathani', '1');
INSERT INTO `js_zone` VALUES ('3260', '209', 'Udon Thani', 'Udon Thani', '1');
INSERT INTO `js_zone` VALUES ('3261', '209', 'Uthai Thani', 'Uthai Thani', '1');
INSERT INTO `js_zone` VALUES ('3262', '209', 'Uttaradit', 'Uttaradit', '1');
INSERT INTO `js_zone` VALUES ('3263', '209', 'Yala', 'Yala', '1');
INSERT INTO `js_zone` VALUES ('3264', '209', 'Yasothon', 'Yasothon', '1');
INSERT INTO `js_zone` VALUES ('3265', '210', 'Kara', 'K', '1');
INSERT INTO `js_zone` VALUES ('3266', '210', 'Plateaux', 'P', '1');
INSERT INTO `js_zone` VALUES ('3267', '210', 'Savanes', 'S', '1');
INSERT INTO `js_zone` VALUES ('3268', '210', 'Centrale', 'C', '1');
INSERT INTO `js_zone` VALUES ('3269', '210', 'Maritime', 'M', '1');
INSERT INTO `js_zone` VALUES ('3270', '211', 'Atafu', 'A', '1');
INSERT INTO `js_zone` VALUES ('3271', '211', 'Fakaofo', 'F', '1');
INSERT INTO `js_zone` VALUES ('3272', '211', 'Nukunonu', 'N', '1');
INSERT INTO `js_zone` VALUES ('3273', '212', 'Ha\'apai', 'H', '1');
INSERT INTO `js_zone` VALUES ('3274', '212', 'Tongatapu', 'T', '1');
INSERT INTO `js_zone` VALUES ('3275', '212', 'Vava\'u', 'V', '1');
INSERT INTO `js_zone` VALUES ('3276', '213', 'Couva/Tabaquite/Talparo', 'CT', '1');
INSERT INTO `js_zone` VALUES ('3277', '213', 'Diego Martin', 'DM', '1');
INSERT INTO `js_zone` VALUES ('3278', '213', 'Mayaro/Rio Claro', 'MR', '1');
INSERT INTO `js_zone` VALUES ('3279', '213', 'Penal/Debe', 'PD', '1');
INSERT INTO `js_zone` VALUES ('3280', '213', 'Princes Town', 'PT', '1');
INSERT INTO `js_zone` VALUES ('3281', '213', 'Sangre Grande', 'SG', '1');
INSERT INTO `js_zone` VALUES ('3282', '213', 'San Juan/Laventille', 'SL', '1');
INSERT INTO `js_zone` VALUES ('3283', '213', 'Siparia', 'SI', '1');
INSERT INTO `js_zone` VALUES ('3284', '213', 'Tunapuna/Piarco', 'TP', '1');
INSERT INTO `js_zone` VALUES ('3285', '213', 'Port of Spain', 'PS', '1');
INSERT INTO `js_zone` VALUES ('3286', '213', 'San Fernando', 'SF', '1');
INSERT INTO `js_zone` VALUES ('3287', '213', 'Arima', 'AR', '1');
INSERT INTO `js_zone` VALUES ('3288', '213', 'Point Fortin', 'PF', '1');
INSERT INTO `js_zone` VALUES ('3289', '213', 'Chaguanas', 'CH', '1');
INSERT INTO `js_zone` VALUES ('3290', '213', 'Tobago', 'TO', '1');
INSERT INTO `js_zone` VALUES ('3291', '214', 'Ariana', 'AR', '1');
INSERT INTO `js_zone` VALUES ('3292', '214', 'Beja', 'BJ', '1');
INSERT INTO `js_zone` VALUES ('3293', '214', 'Ben Arous', 'BA', '1');
INSERT INTO `js_zone` VALUES ('3294', '214', 'Bizerte', 'BI', '1');
INSERT INTO `js_zone` VALUES ('3295', '214', 'Gabes', 'GB', '1');
INSERT INTO `js_zone` VALUES ('3296', '214', 'Gafsa', 'GF', '1');
INSERT INTO `js_zone` VALUES ('3297', '214', 'Jendouba', 'JE', '1');
INSERT INTO `js_zone` VALUES ('3298', '214', 'Kairouan', 'KR', '1');
INSERT INTO `js_zone` VALUES ('3299', '214', 'Kasserine', 'KS', '1');
INSERT INTO `js_zone` VALUES ('3300', '214', 'Kebili', 'KB', '1');
INSERT INTO `js_zone` VALUES ('3301', '214', 'Kef', 'KF', '1');
INSERT INTO `js_zone` VALUES ('3302', '214', 'Mahdia', 'MH', '1');
INSERT INTO `js_zone` VALUES ('3303', '214', 'Manouba', 'MN', '1');
INSERT INTO `js_zone` VALUES ('3304', '214', 'Medenine', 'ME', '1');
INSERT INTO `js_zone` VALUES ('3305', '214', 'Monastir', 'MO', '1');
INSERT INTO `js_zone` VALUES ('3306', '214', 'Nabeul', 'NA', '1');
INSERT INTO `js_zone` VALUES ('3307', '214', 'Sfax', 'SF', '1');
INSERT INTO `js_zone` VALUES ('3308', '214', 'Sidi', 'SD', '1');
INSERT INTO `js_zone` VALUES ('3309', '214', 'Siliana', 'SL', '1');
INSERT INTO `js_zone` VALUES ('3310', '214', 'Sousse', 'SO', '1');
INSERT INTO `js_zone` VALUES ('3311', '214', 'Tataouine', 'TA', '1');
INSERT INTO `js_zone` VALUES ('3312', '214', 'Tozeur', 'TO', '1');
INSERT INTO `js_zone` VALUES ('3313', '214', 'Tunis', 'TU', '1');
INSERT INTO `js_zone` VALUES ('3314', '214', 'Zaghouan', 'ZA', '1');
INSERT INTO `js_zone` VALUES ('3315', '215', 'Adana', 'ADA', '1');
INSERT INTO `js_zone` VALUES ('3316', '215', 'Adıyaman', 'ADI', '1');
INSERT INTO `js_zone` VALUES ('3317', '215', 'Afyonkarahisar', 'AFY', '1');
INSERT INTO `js_zone` VALUES ('3318', '215', 'Ağrı', 'AGR', '1');
INSERT INTO `js_zone` VALUES ('3319', '215', 'Aksaray', 'AKS', '1');
INSERT INTO `js_zone` VALUES ('3320', '215', 'Amasya', 'AMA', '1');
INSERT INTO `js_zone` VALUES ('3321', '215', 'Ankara', 'ANK', '1');
INSERT INTO `js_zone` VALUES ('3322', '215', 'Antalya', 'ANT', '1');
INSERT INTO `js_zone` VALUES ('3323', '215', 'Ardahan', 'ARD', '1');
INSERT INTO `js_zone` VALUES ('3324', '215', 'Artvin', 'ART', '1');
INSERT INTO `js_zone` VALUES ('3325', '215', 'Aydın', 'AYI', '1');
INSERT INTO `js_zone` VALUES ('3326', '215', 'Balıkesir', 'BAL', '1');
INSERT INTO `js_zone` VALUES ('3327', '215', 'Bartın', 'BAR', '1');
INSERT INTO `js_zone` VALUES ('3328', '215', 'Batman', 'BAT', '1');
INSERT INTO `js_zone` VALUES ('3329', '215', 'Bayburt', 'BAY', '1');
INSERT INTO `js_zone` VALUES ('3330', '215', 'Bilecik', 'BIL', '1');
INSERT INTO `js_zone` VALUES ('3331', '215', 'Bingöl', 'BIN', '1');
INSERT INTO `js_zone` VALUES ('3332', '215', 'Bitlis', 'BIT', '1');
INSERT INTO `js_zone` VALUES ('3333', '215', 'Bolu', 'BOL', '1');
INSERT INTO `js_zone` VALUES ('3334', '215', 'Burdur', 'BRD', '1');
INSERT INTO `js_zone` VALUES ('3335', '215', 'Bursa', 'BRS', '1');
INSERT INTO `js_zone` VALUES ('3336', '215', 'Çanakkale', 'CKL', '1');
INSERT INTO `js_zone` VALUES ('3337', '215', 'Çankırı', 'CKR', '1');
INSERT INTO `js_zone` VALUES ('3338', '215', 'Çorum', 'COR', '1');
INSERT INTO `js_zone` VALUES ('3339', '215', 'Denizli', 'DEN', '1');
INSERT INTO `js_zone` VALUES ('3340', '215', 'Diyarbakir', 'DIY', '1');
INSERT INTO `js_zone` VALUES ('3341', '215', 'Düzce', 'DUZ', '1');
INSERT INTO `js_zone` VALUES ('3342', '215', 'Edirne', 'EDI', '1');
INSERT INTO `js_zone` VALUES ('3343', '215', 'Elazığ', 'ELA', '1');
INSERT INTO `js_zone` VALUES ('3344', '215', 'Erzincan', 'EZC', '1');
INSERT INTO `js_zone` VALUES ('3345', '215', 'Erzurum', 'EZR', '1');
INSERT INTO `js_zone` VALUES ('3346', '215', 'Eskişehir', 'ESK', '1');
INSERT INTO `js_zone` VALUES ('3347', '215', 'Gaziantep', 'GAZ', '1');
INSERT INTO `js_zone` VALUES ('3348', '215', 'Giresun', 'GIR', '1');
INSERT INTO `js_zone` VALUES ('3349', '215', 'Gümüşhane', 'GMS', '1');
INSERT INTO `js_zone` VALUES ('3350', '215', 'Hakkari', 'HKR', '1');
INSERT INTO `js_zone` VALUES ('3351', '215', 'Hatay', 'HTY', '1');
INSERT INTO `js_zone` VALUES ('3352', '215', 'Iğdır', 'IGD', '1');
INSERT INTO `js_zone` VALUES ('3353', '215', 'Isparta', 'ISP', '1');
INSERT INTO `js_zone` VALUES ('3354', '215', 'İstanbul', 'IST', '1');
INSERT INTO `js_zone` VALUES ('3355', '215', 'İzmir', 'IZM', '1');
INSERT INTO `js_zone` VALUES ('3356', '215', 'Kahramanmaraş', 'KAH', '1');
INSERT INTO `js_zone` VALUES ('3357', '215', 'Karabük', 'KRB', '1');
INSERT INTO `js_zone` VALUES ('3358', '215', 'Karaman', 'KRM', '1');
INSERT INTO `js_zone` VALUES ('3359', '215', 'Kars', 'KRS', '1');
INSERT INTO `js_zone` VALUES ('3360', '215', 'Kastamonu', 'KAS', '1');
INSERT INTO `js_zone` VALUES ('3361', '215', 'Kayseri', 'KAY', '1');
INSERT INTO `js_zone` VALUES ('3362', '215', 'Kilis', 'KLS', '1');
INSERT INTO `js_zone` VALUES ('3363', '215', 'Kırıkkale', 'KRK', '1');
INSERT INTO `js_zone` VALUES ('3364', '215', 'Kırklareli', 'KLR', '1');
INSERT INTO `js_zone` VALUES ('3365', '215', 'Kırşehir', 'KRH', '1');
INSERT INTO `js_zone` VALUES ('3366', '215', 'Kocaeli', 'KOC', '1');
INSERT INTO `js_zone` VALUES ('3367', '215', 'Konya', 'KON', '1');
INSERT INTO `js_zone` VALUES ('3368', '215', 'Kütahya', 'KUT', '1');
INSERT INTO `js_zone` VALUES ('3369', '215', 'Malatya', 'MAL', '1');
INSERT INTO `js_zone` VALUES ('3370', '215', 'Manisa', 'MAN', '1');
INSERT INTO `js_zone` VALUES ('3371', '215', 'Mardin', 'MAR', '1');
INSERT INTO `js_zone` VALUES ('3372', '215', 'Mersin', 'MER', '1');
INSERT INTO `js_zone` VALUES ('3373', '215', 'Muğla', 'MUG', '1');
INSERT INTO `js_zone` VALUES ('3374', '215', 'Muş', 'MUS', '1');
INSERT INTO `js_zone` VALUES ('3375', '215', 'Nevşehir', 'NEV', '1');
INSERT INTO `js_zone` VALUES ('3376', '215', 'Niğde', 'NIG', '1');
INSERT INTO `js_zone` VALUES ('3377', '215', 'Ordu', 'ORD', '1');
INSERT INTO `js_zone` VALUES ('3378', '215', 'Osmaniye', 'OSM', '1');
INSERT INTO `js_zone` VALUES ('3379', '215', 'Rize', 'RIZ', '1');
INSERT INTO `js_zone` VALUES ('3380', '215', 'Sakarya', 'SAK', '1');
INSERT INTO `js_zone` VALUES ('3381', '215', 'Samsun', 'SAM', '1');
INSERT INTO `js_zone` VALUES ('3382', '215', 'Şanlıurfa', 'SAN', '1');
INSERT INTO `js_zone` VALUES ('3383', '215', 'Siirt', 'SII', '1');
INSERT INTO `js_zone` VALUES ('3384', '215', 'Sinop', 'SIN', '1');
INSERT INTO `js_zone` VALUES ('3385', '215', 'Şırnak', 'SIR', '1');
INSERT INTO `js_zone` VALUES ('3386', '215', 'Sivas', 'SIV', '1');
INSERT INTO `js_zone` VALUES ('3387', '215', 'Tekirdağ', 'TEL', '1');
INSERT INTO `js_zone` VALUES ('3388', '215', 'Tokat', 'TOK', '1');
INSERT INTO `js_zone` VALUES ('3389', '215', 'Trabzon', 'TRA', '1');
INSERT INTO `js_zone` VALUES ('3390', '215', 'Tunceli', 'TUN', '1');
INSERT INTO `js_zone` VALUES ('3391', '215', 'Uşak', 'USK', '1');
INSERT INTO `js_zone` VALUES ('3392', '215', 'Van', 'VAN', '1');
INSERT INTO `js_zone` VALUES ('3393', '215', 'Yalova', 'YAL', '1');
INSERT INTO `js_zone` VALUES ('3394', '215', 'Yozgat', 'YOZ', '1');
INSERT INTO `js_zone` VALUES ('3395', '215', 'Zonguldak', 'ZON', '1');
INSERT INTO `js_zone` VALUES ('3396', '216', 'Ahal Welayaty', 'A', '1');
INSERT INTO `js_zone` VALUES ('3397', '216', 'Balkan Welayaty', 'B', '1');
INSERT INTO `js_zone` VALUES ('3398', '216', 'Dashhowuz Welayaty', 'D', '1');
INSERT INTO `js_zone` VALUES ('3399', '216', 'Lebap Welayaty', 'L', '1');
INSERT INTO `js_zone` VALUES ('3400', '216', 'Mary Welayaty', 'M', '1');
INSERT INTO `js_zone` VALUES ('3401', '217', 'Ambergris Cays', 'AC', '1');
INSERT INTO `js_zone` VALUES ('3402', '217', 'Dellis Cay', 'DC', '1');
INSERT INTO `js_zone` VALUES ('3403', '217', 'French Cay', 'FC', '1');
INSERT INTO `js_zone` VALUES ('3404', '217', 'Little Water Cay', 'LW', '1');
INSERT INTO `js_zone` VALUES ('3405', '217', 'Parrot Cay', 'RC', '1');
INSERT INTO `js_zone` VALUES ('3406', '217', 'Pine Cay', 'PN', '1');
INSERT INTO `js_zone` VALUES ('3407', '217', 'Salt Cay', 'SL', '1');
INSERT INTO `js_zone` VALUES ('3408', '217', 'Grand Turk', 'GT', '1');
INSERT INTO `js_zone` VALUES ('3409', '217', 'South Caicos', 'SC', '1');
INSERT INTO `js_zone` VALUES ('3410', '217', 'East Caicos', 'EC', '1');
INSERT INTO `js_zone` VALUES ('3411', '217', 'Middle Caicos', 'MC', '1');
INSERT INTO `js_zone` VALUES ('3412', '217', 'North Caicos', 'NC', '1');
INSERT INTO `js_zone` VALUES ('3413', '217', 'Providenciales', 'PR', '1');
INSERT INTO `js_zone` VALUES ('3414', '217', 'West Caicos', 'WC', '1');
INSERT INTO `js_zone` VALUES ('3415', '218', 'Nanumanga', 'NMG', '1');
INSERT INTO `js_zone` VALUES ('3416', '218', 'Niulakita', 'NLK', '1');
INSERT INTO `js_zone` VALUES ('3417', '218', 'Niutao', 'NTO', '1');
INSERT INTO `js_zone` VALUES ('3418', '218', 'Funafuti', 'FUN', '1');
INSERT INTO `js_zone` VALUES ('3419', '218', 'Nanumea', 'NME', '1');
INSERT INTO `js_zone` VALUES ('3420', '218', 'Nui', 'NUI', '1');
INSERT INTO `js_zone` VALUES ('3421', '218', 'Nukufetau', 'NFT', '1');
INSERT INTO `js_zone` VALUES ('3422', '218', 'Nukulaelae', 'NLL', '1');
INSERT INTO `js_zone` VALUES ('3423', '218', 'Vaitupu', 'VAI', '1');
INSERT INTO `js_zone` VALUES ('3424', '219', 'Kalangala', 'KAL', '1');
INSERT INTO `js_zone` VALUES ('3425', '219', 'Kampala', 'KMP', '1');
INSERT INTO `js_zone` VALUES ('3426', '219', 'Kayunga', 'KAY', '1');
INSERT INTO `js_zone` VALUES ('3427', '219', 'Kiboga', 'KIB', '1');
INSERT INTO `js_zone` VALUES ('3428', '219', 'Luwero', 'LUW', '1');
INSERT INTO `js_zone` VALUES ('3429', '219', 'Masaka', 'MAS', '1');
INSERT INTO `js_zone` VALUES ('3430', '219', 'Mpigi', 'MPI', '1');
INSERT INTO `js_zone` VALUES ('3431', '219', 'Mubende', 'MUB', '1');
INSERT INTO `js_zone` VALUES ('3432', '219', 'Mukono', 'MUK', '1');
INSERT INTO `js_zone` VALUES ('3433', '219', 'Nakasongola', 'NKS', '1');
INSERT INTO `js_zone` VALUES ('3434', '219', 'Rakai', 'RAK', '1');
INSERT INTO `js_zone` VALUES ('3435', '219', 'Sembabule', 'SEM', '1');
INSERT INTO `js_zone` VALUES ('3436', '219', 'Wakiso', 'WAK', '1');
INSERT INTO `js_zone` VALUES ('3437', '219', 'Bugiri', 'BUG', '1');
INSERT INTO `js_zone` VALUES ('3438', '219', 'Busia', 'BUS', '1');
INSERT INTO `js_zone` VALUES ('3439', '219', 'Iganga', 'IGA', '1');
INSERT INTO `js_zone` VALUES ('3440', '219', 'Jinja', 'JIN', '1');
INSERT INTO `js_zone` VALUES ('3441', '219', 'Kaberamaido', 'KAB', '1');
INSERT INTO `js_zone` VALUES ('3442', '219', 'Kamuli', 'KML', '1');
INSERT INTO `js_zone` VALUES ('3443', '219', 'Kapchorwa', 'KPC', '1');
INSERT INTO `js_zone` VALUES ('3444', '219', 'Katakwi', 'KTK', '1');
INSERT INTO `js_zone` VALUES ('3445', '219', 'Kumi', 'KUM', '1');
INSERT INTO `js_zone` VALUES ('3446', '219', 'Mayuge', 'MAY', '1');
INSERT INTO `js_zone` VALUES ('3447', '219', 'Mbale', 'MBA', '1');
INSERT INTO `js_zone` VALUES ('3448', '219', 'Pallisa', 'PAL', '1');
INSERT INTO `js_zone` VALUES ('3449', '219', 'Sironko', 'SIR', '1');
INSERT INTO `js_zone` VALUES ('3450', '219', 'Soroti', 'SOR', '1');
INSERT INTO `js_zone` VALUES ('3451', '219', 'Tororo', 'TOR', '1');
INSERT INTO `js_zone` VALUES ('3452', '219', 'Adjumani', 'ADJ', '1');
INSERT INTO `js_zone` VALUES ('3453', '219', 'Apac', 'APC', '1');
INSERT INTO `js_zone` VALUES ('3454', '219', 'Arua', 'ARU', '1');
INSERT INTO `js_zone` VALUES ('3455', '219', 'Gulu', 'GUL', '1');
INSERT INTO `js_zone` VALUES ('3456', '219', 'Kitgum', 'KIT', '1');
INSERT INTO `js_zone` VALUES ('3457', '219', 'Kotido', 'KOT', '1');
INSERT INTO `js_zone` VALUES ('3458', '219', 'Lira', 'LIR', '1');
INSERT INTO `js_zone` VALUES ('3459', '219', 'Moroto', 'MRT', '1');
INSERT INTO `js_zone` VALUES ('3460', '219', 'Moyo', 'MOY', '1');
INSERT INTO `js_zone` VALUES ('3461', '219', 'Nakapiripirit', 'NAK', '1');
INSERT INTO `js_zone` VALUES ('3462', '219', 'Nebbi', 'NEB', '1');
INSERT INTO `js_zone` VALUES ('3463', '219', 'Pader', 'PAD', '1');
INSERT INTO `js_zone` VALUES ('3464', '219', 'Yumbe', 'YUM', '1');
INSERT INTO `js_zone` VALUES ('3465', '219', 'Bundibugyo', 'BUN', '1');
INSERT INTO `js_zone` VALUES ('3466', '219', 'Bushenyi', 'BSH', '1');
INSERT INTO `js_zone` VALUES ('3467', '219', 'Hoima', 'HOI', '1');
INSERT INTO `js_zone` VALUES ('3468', '219', 'Kabale', 'KBL', '1');
INSERT INTO `js_zone` VALUES ('3469', '219', 'Kabarole', 'KAR', '1');
INSERT INTO `js_zone` VALUES ('3470', '219', 'Kamwenge', 'KAM', '1');
INSERT INTO `js_zone` VALUES ('3471', '219', 'Kanungu', 'KAN', '1');
INSERT INTO `js_zone` VALUES ('3472', '219', 'Kasese', 'KAS', '1');
INSERT INTO `js_zone` VALUES ('3473', '219', 'Kibaale', 'KBA', '1');
INSERT INTO `js_zone` VALUES ('3474', '219', 'Kisoro', 'KIS', '1');
INSERT INTO `js_zone` VALUES ('3475', '219', 'Kyenjojo', 'KYE', '1');
INSERT INTO `js_zone` VALUES ('3476', '219', 'Masindi', 'MSN', '1');
INSERT INTO `js_zone` VALUES ('3477', '219', 'Mbarara', 'MBR', '1');
INSERT INTO `js_zone` VALUES ('3478', '219', 'Ntungamo', 'NTU', '1');
INSERT INTO `js_zone` VALUES ('3479', '219', 'Rukungiri', 'RUK', '1');
INSERT INTO `js_zone` VALUES ('3480', '220', 'Cherkasy', 'CK', '1');
INSERT INTO `js_zone` VALUES ('3481', '220', 'Chernihiv', 'CH', '1');
INSERT INTO `js_zone` VALUES ('3482', '220', 'Chernivtsi', 'CV', '1');
INSERT INTO `js_zone` VALUES ('3483', '220', 'Crimea', 'CR', '1');
INSERT INTO `js_zone` VALUES ('3484', '220', 'Dnipropetrovs\'k', 'DN', '1');
INSERT INTO `js_zone` VALUES ('3485', '220', 'Donets\'k', 'DO', '1');
INSERT INTO `js_zone` VALUES ('3486', '220', 'Ivano-Frankivs\'k', 'IV', '1');
INSERT INTO `js_zone` VALUES ('3487', '220', 'Kharkiv Kherson', 'KL', '1');
INSERT INTO `js_zone` VALUES ('3488', '220', 'Khmel\'nyts\'kyy', 'KM', '1');
INSERT INTO `js_zone` VALUES ('3489', '220', 'Kirovohrad', 'KR', '1');
INSERT INTO `js_zone` VALUES ('3490', '220', 'Kiev', 'KV', '1');
INSERT INTO `js_zone` VALUES ('3491', '220', 'Kyyiv', 'KY', '1');
INSERT INTO `js_zone` VALUES ('3492', '220', 'Luhans\'k', 'LU', '1');
INSERT INTO `js_zone` VALUES ('3493', '220', 'L\'viv', 'LV', '1');
INSERT INTO `js_zone` VALUES ('3494', '220', 'Mykolayiv', 'MY', '1');
INSERT INTO `js_zone` VALUES ('3495', '220', 'Odesa', 'OD', '1');
INSERT INTO `js_zone` VALUES ('3496', '220', 'Poltava', 'PO', '1');
INSERT INTO `js_zone` VALUES ('3497', '220', 'Rivne', 'RI', '1');
INSERT INTO `js_zone` VALUES ('3498', '220', 'Sevastopol', 'SE', '1');
INSERT INTO `js_zone` VALUES ('3499', '220', 'Sumy', 'SU', '1');
INSERT INTO `js_zone` VALUES ('3500', '220', 'Ternopil\'', 'TE', '1');
INSERT INTO `js_zone` VALUES ('3501', '220', 'Vinnytsya', 'VI', '1');
INSERT INTO `js_zone` VALUES ('3502', '220', 'Volyn\'', 'VO', '1');
INSERT INTO `js_zone` VALUES ('3503', '220', 'Zakarpattya', 'ZK', '1');
INSERT INTO `js_zone` VALUES ('3504', '220', 'Zaporizhzhya', 'ZA', '1');
INSERT INTO `js_zone` VALUES ('3505', '220', 'Zhytomyr', 'ZH', '1');
INSERT INTO `js_zone` VALUES ('3506', '221', 'Abu Zaby', 'AZ', '1');
INSERT INTO `js_zone` VALUES ('3507', '221', '\'Ajman', 'AJ', '1');
INSERT INTO `js_zone` VALUES ('3508', '221', 'Al Fujayrah', 'FU', '1');
INSERT INTO `js_zone` VALUES ('3509', '221', 'Ash Shariqah', 'SH', '1');
INSERT INTO `js_zone` VALUES ('3510', '221', 'Dubayy', 'DU', '1');
INSERT INTO `js_zone` VALUES ('3511', '221', 'R\'as al Khaymah', 'RK', '1');
INSERT INTO `js_zone` VALUES ('3512', '221', 'Umm al Qaywayn', 'UQ', '1');
INSERT INTO `js_zone` VALUES ('3513', '222', 'Aberdeen', 'ABN', '1');
INSERT INTO `js_zone` VALUES ('3514', '222', 'Aberdeenshire', 'ABNS', '1');
INSERT INTO `js_zone` VALUES ('3515', '222', 'Anglesey', 'ANG', '1');
INSERT INTO `js_zone` VALUES ('3516', '222', 'Angus', 'AGS', '1');
INSERT INTO `js_zone` VALUES ('3517', '222', 'Argyll and Bute', 'ARY', '1');
INSERT INTO `js_zone` VALUES ('3518', '222', 'Bedfordshire', 'BEDS', '1');
INSERT INTO `js_zone` VALUES ('3519', '222', 'Berkshire', 'BERKS', '1');
INSERT INTO `js_zone` VALUES ('3520', '222', 'Blaenau Gwent', 'BLA', '1');
INSERT INTO `js_zone` VALUES ('3521', '222', 'Bridgend', 'BRI', '1');
INSERT INTO `js_zone` VALUES ('3522', '222', 'Bristol', 'BSTL', '1');
INSERT INTO `js_zone` VALUES ('3523', '222', 'Buckinghamshire', 'BUCKS', '1');
INSERT INTO `js_zone` VALUES ('3524', '222', 'Caerphilly', 'CAE', '1');
INSERT INTO `js_zone` VALUES ('3525', '222', 'Cambridgeshire', 'CAMBS', '1');
INSERT INTO `js_zone` VALUES ('3526', '222', 'Cardiff', 'CDF', '1');
INSERT INTO `js_zone` VALUES ('3527', '222', 'Carmarthenshire', 'CARM', '1');
INSERT INTO `js_zone` VALUES ('3528', '222', 'Ceredigion', 'CDGN', '1');
INSERT INTO `js_zone` VALUES ('3529', '222', 'Cheshire', 'CHES', '1');
INSERT INTO `js_zone` VALUES ('3530', '222', 'Clackmannanshire', 'CLACK', '1');
INSERT INTO `js_zone` VALUES ('3531', '222', 'Conwy', 'CON', '1');
INSERT INTO `js_zone` VALUES ('3532', '222', 'Cornwall', 'CORN', '1');
INSERT INTO `js_zone` VALUES ('3533', '222', 'Denbighshire', 'DNBG', '1');
INSERT INTO `js_zone` VALUES ('3534', '222', 'Derbyshire', 'DERBY', '1');
INSERT INTO `js_zone` VALUES ('3535', '222', 'Devon', 'DVN', '1');
INSERT INTO `js_zone` VALUES ('3536', '222', 'Dorset', 'DOR', '1');
INSERT INTO `js_zone` VALUES ('3537', '222', 'Dumfries and Galloway', 'DGL', '1');
INSERT INTO `js_zone` VALUES ('3538', '222', 'Dundee', 'DUND', '1');
INSERT INTO `js_zone` VALUES ('3539', '222', 'Durham', 'DHM', '1');
INSERT INTO `js_zone` VALUES ('3540', '222', 'East Ayrshire', 'ARYE', '1');
INSERT INTO `js_zone` VALUES ('3541', '222', 'East Dunbartonshire', 'DUNBE', '1');
INSERT INTO `js_zone` VALUES ('3542', '222', 'East Lothian', 'LOTE', '1');
INSERT INTO `js_zone` VALUES ('3543', '222', 'East Renfrewshire', 'RENE', '1');
INSERT INTO `js_zone` VALUES ('3544', '222', 'East Riding of Yorkshire', 'ERYS', '1');
INSERT INTO `js_zone` VALUES ('3545', '222', 'East Sussex', 'SXE', '1');
INSERT INTO `js_zone` VALUES ('3546', '222', 'Edinburgh', 'EDIN', '1');
INSERT INTO `js_zone` VALUES ('3547', '222', 'Essex', 'ESX', '1');
INSERT INTO `js_zone` VALUES ('3548', '222', 'Falkirk', 'FALK', '1');
INSERT INTO `js_zone` VALUES ('3549', '222', 'Fife', 'FFE', '1');
INSERT INTO `js_zone` VALUES ('3550', '222', 'Flintshire', 'FLINT', '1');
INSERT INTO `js_zone` VALUES ('3551', '222', 'Glasgow', 'GLAS', '1');
INSERT INTO `js_zone` VALUES ('3552', '222', 'Gloucestershire', 'GLOS', '1');
INSERT INTO `js_zone` VALUES ('3553', '222', 'Greater London', 'LDN', '1');
INSERT INTO `js_zone` VALUES ('3554', '222', 'Greater Manchester', 'MCH', '1');
INSERT INTO `js_zone` VALUES ('3555', '222', 'Gwynedd', 'GDD', '1');
INSERT INTO `js_zone` VALUES ('3556', '222', 'Hampshire', 'HANTS', '1');
INSERT INTO `js_zone` VALUES ('3557', '222', 'Herefordshire', 'HWR', '1');
INSERT INTO `js_zone` VALUES ('3558', '222', 'Hertfordshire', 'HERTS', '1');
INSERT INTO `js_zone` VALUES ('3559', '222', 'Highlands', 'HLD', '1');
INSERT INTO `js_zone` VALUES ('3560', '222', 'Inverclyde', 'IVER', '1');
INSERT INTO `js_zone` VALUES ('3561', '222', 'Isle of Wight', 'IOW', '1');
INSERT INTO `js_zone` VALUES ('3562', '222', 'Kent', 'KNT', '1');
INSERT INTO `js_zone` VALUES ('3563', '222', 'Lancashire', 'LANCS', '1');
INSERT INTO `js_zone` VALUES ('3564', '222', 'Leicestershire', 'LEICS', '1');
INSERT INTO `js_zone` VALUES ('3565', '222', 'Lincolnshire', 'LINCS', '1');
INSERT INTO `js_zone` VALUES ('3566', '222', 'Merseyside', 'MSY', '1');
INSERT INTO `js_zone` VALUES ('3567', '222', 'Merthyr Tydfil', 'MERT', '1');
INSERT INTO `js_zone` VALUES ('3568', '222', 'Midlothian', 'MLOT', '1');
INSERT INTO `js_zone` VALUES ('3569', '222', 'Monmouthshire', 'MMOUTH', '1');
INSERT INTO `js_zone` VALUES ('3570', '222', 'Moray', 'MORAY', '1');
INSERT INTO `js_zone` VALUES ('3571', '222', 'Neath Port Talbot', 'NPRTAL', '1');
INSERT INTO `js_zone` VALUES ('3572', '222', 'Newport', 'NEWPT', '1');
INSERT INTO `js_zone` VALUES ('3573', '222', 'Norfolk', 'NOR', '1');
INSERT INTO `js_zone` VALUES ('3574', '222', 'North Ayrshire', 'ARYN', '1');
INSERT INTO `js_zone` VALUES ('3575', '222', 'North Lanarkshire', 'LANN', '1');
INSERT INTO `js_zone` VALUES ('3576', '222', 'North Yorkshire', 'YSN', '1');
INSERT INTO `js_zone` VALUES ('3577', '222', 'Northamptonshire', 'NHM', '1');
INSERT INTO `js_zone` VALUES ('3578', '222', 'Northumberland', 'NLD', '1');
INSERT INTO `js_zone` VALUES ('3579', '222', 'Nottinghamshire', 'NOT', '1');
INSERT INTO `js_zone` VALUES ('3580', '222', 'Orkney Islands', 'ORK', '1');
INSERT INTO `js_zone` VALUES ('3581', '222', 'Oxfordshire', 'OFE', '1');
INSERT INTO `js_zone` VALUES ('3582', '222', 'Pembrokeshire', 'PEM', '1');
INSERT INTO `js_zone` VALUES ('3583', '222', 'Perth and Kinross', 'PERTH', '1');
INSERT INTO `js_zone` VALUES ('3584', '222', 'Powys', 'PWS', '1');
INSERT INTO `js_zone` VALUES ('3585', '222', 'Renfrewshire', 'REN', '1');
INSERT INTO `js_zone` VALUES ('3586', '222', 'Rhondda Cynon Taff', 'RHON', '1');
INSERT INTO `js_zone` VALUES ('3587', '222', 'Rutland', 'RUT', '1');
INSERT INTO `js_zone` VALUES ('3588', '222', 'Scottish Borders', 'BOR', '1');
INSERT INTO `js_zone` VALUES ('3589', '222', 'Shetland Islands', 'SHET', '1');
INSERT INTO `js_zone` VALUES ('3590', '222', 'Shropshire', 'SPE', '1');
INSERT INTO `js_zone` VALUES ('3591', '222', 'Somerset', 'SOM', '1');
INSERT INTO `js_zone` VALUES ('3592', '222', 'South Ayrshire', 'ARYS', '1');
INSERT INTO `js_zone` VALUES ('3593', '222', 'South Lanarkshire', 'LANS', '1');
INSERT INTO `js_zone` VALUES ('3594', '222', 'South Yorkshire', 'YSS', '1');
INSERT INTO `js_zone` VALUES ('3595', '222', 'Staffordshire', 'SFD', '1');
INSERT INTO `js_zone` VALUES ('3596', '222', 'Stirling', 'STIR', '1');
INSERT INTO `js_zone` VALUES ('3597', '222', 'Suffolk', 'SFK', '1');
INSERT INTO `js_zone` VALUES ('3598', '222', 'Surrey', 'SRY', '1');
INSERT INTO `js_zone` VALUES ('3599', '222', 'Swansea', 'SWAN', '1');
INSERT INTO `js_zone` VALUES ('3600', '222', 'Torfaen', 'TORF', '1');
INSERT INTO `js_zone` VALUES ('3601', '222', 'Tyne and Wear', 'TWR', '1');
INSERT INTO `js_zone` VALUES ('3602', '222', 'Vale of Glamorgan', 'VGLAM', '1');
INSERT INTO `js_zone` VALUES ('3603', '222', 'Warwickshire', 'WARKS', '1');
INSERT INTO `js_zone` VALUES ('3604', '222', 'West Dunbartonshire', 'WDUN', '1');
INSERT INTO `js_zone` VALUES ('3605', '222', 'West Lothian', 'WLOT', '1');
INSERT INTO `js_zone` VALUES ('3606', '222', 'West Midlands', 'WMD', '1');
INSERT INTO `js_zone` VALUES ('3607', '222', 'West Sussex', 'SXW', '1');
INSERT INTO `js_zone` VALUES ('3608', '222', 'West Yorkshire', 'YSW', '1');
INSERT INTO `js_zone` VALUES ('3609', '222', 'Western Isles', 'WIL', '1');
INSERT INTO `js_zone` VALUES ('3610', '222', 'Wiltshire', 'WLT', '1');
INSERT INTO `js_zone` VALUES ('3611', '222', 'Worcestershire', 'WORCS', '1');
INSERT INTO `js_zone` VALUES ('3612', '222', 'Wrexham', 'WRX', '1');
INSERT INTO `js_zone` VALUES ('3613', '223', 'Alabama', 'AL', '1');
INSERT INTO `js_zone` VALUES ('3614', '223', 'Alaska', 'AK', '1');
INSERT INTO `js_zone` VALUES ('3615', '223', 'American Samoa', 'AS', '1');
INSERT INTO `js_zone` VALUES ('3616', '223', 'Arizona', 'AZ', '1');
INSERT INTO `js_zone` VALUES ('3617', '223', 'Arkansas', 'AR', '1');
INSERT INTO `js_zone` VALUES ('3618', '223', 'Armed Forces Africa', 'AF', '1');
INSERT INTO `js_zone` VALUES ('3619', '223', 'Armed Forces Americas', 'AA', '1');
INSERT INTO `js_zone` VALUES ('3620', '223', 'Armed Forces Canada', 'AC', '1');
INSERT INTO `js_zone` VALUES ('3621', '223', 'Armed Forces Europe', 'AE', '1');
INSERT INTO `js_zone` VALUES ('3622', '223', 'Armed Forces Middle East', 'AM', '1');
INSERT INTO `js_zone` VALUES ('3623', '223', 'Armed Forces Pacific', 'AP', '1');
INSERT INTO `js_zone` VALUES ('3624', '223', 'California', 'CA', '1');
INSERT INTO `js_zone` VALUES ('3625', '223', 'Colorado', 'CO', '1');
INSERT INTO `js_zone` VALUES ('3626', '223', 'Connecticut', 'CT', '1');
INSERT INTO `js_zone` VALUES ('3627', '223', 'Delaware', 'DE', '1');
INSERT INTO `js_zone` VALUES ('3628', '223', 'District of Columbia', 'DC', '1');
INSERT INTO `js_zone` VALUES ('3629', '223', 'Federated States Of Micronesia', 'FM', '1');
INSERT INTO `js_zone` VALUES ('3630', '223', 'Florida', 'FL', '1');
INSERT INTO `js_zone` VALUES ('3631', '223', 'Georgia', 'GA', '1');
INSERT INTO `js_zone` VALUES ('3632', '223', 'Guam', 'GU', '1');
INSERT INTO `js_zone` VALUES ('3633', '223', 'Hawaii', 'HI', '1');
INSERT INTO `js_zone` VALUES ('3634', '223', 'Idaho', 'ID', '1');
INSERT INTO `js_zone` VALUES ('3635', '223', 'Illinois', 'IL', '1');
INSERT INTO `js_zone` VALUES ('3636', '223', 'Indiana', 'IN', '1');
INSERT INTO `js_zone` VALUES ('3637', '223', 'Iowa', 'IA', '1');
INSERT INTO `js_zone` VALUES ('3638', '223', 'Kansas', 'KS', '1');
INSERT INTO `js_zone` VALUES ('3639', '223', 'Kentucky', 'KY', '1');
INSERT INTO `js_zone` VALUES ('3640', '223', 'Louisiana', 'LA', '1');
INSERT INTO `js_zone` VALUES ('3641', '223', 'Maine', 'ME', '1');
INSERT INTO `js_zone` VALUES ('3642', '223', 'Marshall Islands', 'MH', '1');
INSERT INTO `js_zone` VALUES ('3643', '223', 'Maryland', 'MD', '1');
INSERT INTO `js_zone` VALUES ('3644', '223', 'Massachusetts', 'MA', '1');
INSERT INTO `js_zone` VALUES ('3645', '223', 'Michigan', 'MI', '1');
INSERT INTO `js_zone` VALUES ('3646', '223', 'Minnesota', 'MN', '1');
INSERT INTO `js_zone` VALUES ('3647', '223', 'Mississippi', 'MS', '1');
INSERT INTO `js_zone` VALUES ('3648', '223', 'Missouri', 'MO', '1');
INSERT INTO `js_zone` VALUES ('3649', '223', 'Montana', 'MT', '1');
INSERT INTO `js_zone` VALUES ('3650', '223', 'Nebraska', 'NE', '1');
INSERT INTO `js_zone` VALUES ('3651', '223', 'Nevada', 'NV', '1');
INSERT INTO `js_zone` VALUES ('3652', '223', 'New Hampshire', 'NH', '1');
INSERT INTO `js_zone` VALUES ('3653', '223', 'New Jersey', 'NJ', '1');
INSERT INTO `js_zone` VALUES ('3654', '223', 'New Mexico', 'NM', '1');
INSERT INTO `js_zone` VALUES ('3655', '223', 'New York', 'NY', '1');
INSERT INTO `js_zone` VALUES ('3656', '223', 'North Carolina', 'NC', '1');
INSERT INTO `js_zone` VALUES ('3657', '223', 'North Dakota', 'ND', '1');
INSERT INTO `js_zone` VALUES ('3658', '223', 'Northern Mariana Islands', 'MP', '1');
INSERT INTO `js_zone` VALUES ('3659', '223', 'Ohio', 'OH', '1');
INSERT INTO `js_zone` VALUES ('3660', '223', 'Oklahoma', 'OK', '1');
INSERT INTO `js_zone` VALUES ('3661', '223', 'Oregon', 'OR', '1');
INSERT INTO `js_zone` VALUES ('3662', '223', 'Palau', 'PW', '1');
INSERT INTO `js_zone` VALUES ('3663', '223', 'Pennsylvania', 'PA', '1');
INSERT INTO `js_zone` VALUES ('3664', '223', 'Puerto Rico', 'PR', '1');
INSERT INTO `js_zone` VALUES ('3665', '223', 'Rhode Island', 'RI', '1');
INSERT INTO `js_zone` VALUES ('3666', '223', 'South Carolina', 'SC', '1');
INSERT INTO `js_zone` VALUES ('3667', '223', 'South Dakota', 'SD', '1');
INSERT INTO `js_zone` VALUES ('3668', '223', 'Tennessee', 'TN', '1');
INSERT INTO `js_zone` VALUES ('3669', '223', 'Texas', 'TX', '1');
INSERT INTO `js_zone` VALUES ('3670', '223', 'Utah', 'UT', '1');
INSERT INTO `js_zone` VALUES ('3671', '223', 'Vermont', 'VT', '1');
INSERT INTO `js_zone` VALUES ('3672', '223', 'Virgin Islands', 'VI', '1');
INSERT INTO `js_zone` VALUES ('3673', '223', 'Virginia', 'VA', '1');
INSERT INTO `js_zone` VALUES ('3674', '223', 'Washington', 'WA', '1');
INSERT INTO `js_zone` VALUES ('3675', '223', 'West Virginia', 'WV', '1');
INSERT INTO `js_zone` VALUES ('3676', '223', 'Wisconsin', 'WI', '1');
INSERT INTO `js_zone` VALUES ('3677', '223', 'Wyoming', 'WY', '1');
INSERT INTO `js_zone` VALUES ('3678', '224', 'Baker Island', 'BI', '1');
INSERT INTO `js_zone` VALUES ('3679', '224', 'Howland Island', 'HI', '1');
INSERT INTO `js_zone` VALUES ('3680', '224', 'Jarvis Island', 'JI', '1');
INSERT INTO `js_zone` VALUES ('3681', '224', 'Johnston Atoll', 'JA', '1');
INSERT INTO `js_zone` VALUES ('3682', '224', 'Kingman Reef', 'KR', '1');
INSERT INTO `js_zone` VALUES ('3683', '224', 'Midway Atoll', 'MA', '1');
INSERT INTO `js_zone` VALUES ('3684', '224', 'Navassa Island', 'NI', '1');
INSERT INTO `js_zone` VALUES ('3685', '224', 'Palmyra Atoll', 'PA', '1');
INSERT INTO `js_zone` VALUES ('3686', '224', 'Wake Island', 'WI', '1');
INSERT INTO `js_zone` VALUES ('3687', '225', 'Artigas', 'AR', '1');
INSERT INTO `js_zone` VALUES ('3688', '225', 'Canelones', 'CA', '1');
INSERT INTO `js_zone` VALUES ('3689', '225', 'Cerro Largo', 'CL', '1');
INSERT INTO `js_zone` VALUES ('3690', '225', 'Colonia', 'CO', '1');
INSERT INTO `js_zone` VALUES ('3691', '225', 'Durazno', 'DU', '1');
INSERT INTO `js_zone` VALUES ('3692', '225', 'Flores', 'FS', '1');
INSERT INTO `js_zone` VALUES ('3693', '225', 'Florida', 'FA', '1');
INSERT INTO `js_zone` VALUES ('3694', '225', 'Lavalleja', 'LA', '1');
INSERT INTO `js_zone` VALUES ('3695', '225', 'Maldonado', 'MA', '1');
INSERT INTO `js_zone` VALUES ('3696', '225', 'Montevideo', 'MO', '1');
INSERT INTO `js_zone` VALUES ('3697', '225', 'Paysandu', 'PA', '1');
INSERT INTO `js_zone` VALUES ('3698', '225', 'Rio Negro', 'RN', '1');
INSERT INTO `js_zone` VALUES ('3699', '225', 'Rivera', 'RV', '1');
INSERT INTO `js_zone` VALUES ('3700', '225', 'Rocha', 'RO', '1');
INSERT INTO `js_zone` VALUES ('3701', '225', 'Salto', 'SL', '1');
INSERT INTO `js_zone` VALUES ('3702', '225', 'San Jose', 'SJ', '1');
INSERT INTO `js_zone` VALUES ('3703', '225', 'Soriano', 'SO', '1');
INSERT INTO `js_zone` VALUES ('3704', '225', 'Tacuarembo', 'TA', '1');
INSERT INTO `js_zone` VALUES ('3705', '225', 'Treinta y Tres', 'TT', '1');
INSERT INTO `js_zone` VALUES ('3706', '226', 'Andijon', 'AN', '1');
INSERT INTO `js_zone` VALUES ('3707', '226', 'Buxoro', 'BU', '1');
INSERT INTO `js_zone` VALUES ('3708', '226', 'Farg\'ona', 'FA', '1');
INSERT INTO `js_zone` VALUES ('3709', '226', 'Jizzax', 'JI', '1');
INSERT INTO `js_zone` VALUES ('3710', '226', 'Namangan', 'NG', '1');
INSERT INTO `js_zone` VALUES ('3711', '226', 'Navoiy', 'NW', '1');
INSERT INTO `js_zone` VALUES ('3712', '226', 'Qashqadaryo', 'QA', '1');
INSERT INTO `js_zone` VALUES ('3713', '226', 'Qoraqalpog\'iston Republikasi', 'QR', '1');
INSERT INTO `js_zone` VALUES ('3714', '226', 'Samarqand', 'SA', '1');
INSERT INTO `js_zone` VALUES ('3715', '226', 'Sirdaryo', 'SI', '1');
INSERT INTO `js_zone` VALUES ('3716', '226', 'Surxondaryo', 'SU', '1');
INSERT INTO `js_zone` VALUES ('3717', '226', 'Toshkent City', 'TK', '1');
INSERT INTO `js_zone` VALUES ('3718', '226', 'Toshkent Region', 'TO', '1');
INSERT INTO `js_zone` VALUES ('3719', '226', 'Xorazm', 'XO', '1');
INSERT INTO `js_zone` VALUES ('3720', '227', 'Malampa', 'MA', '1');
INSERT INTO `js_zone` VALUES ('3721', '227', 'Penama', 'PE', '1');
INSERT INTO `js_zone` VALUES ('3722', '227', 'Sanma', 'SA', '1');
INSERT INTO `js_zone` VALUES ('3723', '227', 'Shefa', 'SH', '1');
INSERT INTO `js_zone` VALUES ('3724', '227', 'Tafea', 'TA', '1');
INSERT INTO `js_zone` VALUES ('3725', '227', 'Torba', 'TO', '1');
INSERT INTO `js_zone` VALUES ('3726', '229', 'Amazonas', 'AM', '1');
INSERT INTO `js_zone` VALUES ('3727', '229', 'Anzoategui', 'AN', '1');
INSERT INTO `js_zone` VALUES ('3728', '229', 'Apure', 'AP', '1');
INSERT INTO `js_zone` VALUES ('3729', '229', 'Aragua', 'AR', '1');
INSERT INTO `js_zone` VALUES ('3730', '229', 'Barinas', 'BA', '1');
INSERT INTO `js_zone` VALUES ('3731', '229', 'Bolivar', 'BO', '1');
INSERT INTO `js_zone` VALUES ('3732', '229', 'Carabobo', 'CA', '1');
INSERT INTO `js_zone` VALUES ('3733', '229', 'Cojedes', 'CO', '1');
INSERT INTO `js_zone` VALUES ('3734', '229', 'Delta Amacuro', 'DA', '1');
INSERT INTO `js_zone` VALUES ('3735', '229', 'Dependencias Federales', 'DF', '1');
INSERT INTO `js_zone` VALUES ('3736', '229', 'Distrito Federal', 'DI', '1');
INSERT INTO `js_zone` VALUES ('3737', '229', 'Falcon', 'FA', '1');
INSERT INTO `js_zone` VALUES ('3738', '229', 'Guarico', 'GU', '1');
INSERT INTO `js_zone` VALUES ('3739', '229', 'Lara', 'LA', '1');
INSERT INTO `js_zone` VALUES ('3740', '229', 'Merida', 'ME', '1');
INSERT INTO `js_zone` VALUES ('3741', '229', 'Miranda', 'MI', '1');
INSERT INTO `js_zone` VALUES ('3742', '229', 'Monagas', 'MO', '1');
INSERT INTO `js_zone` VALUES ('3743', '229', 'Nueva Esparta', 'NE', '1');
INSERT INTO `js_zone` VALUES ('3744', '229', 'Portuguesa', 'PO', '1');
INSERT INTO `js_zone` VALUES ('3745', '229', 'Sucre', 'SU', '1');
INSERT INTO `js_zone` VALUES ('3746', '229', 'Tachira', 'TA', '1');
INSERT INTO `js_zone` VALUES ('3747', '229', 'Trujillo', 'TR', '1');
INSERT INTO `js_zone` VALUES ('3748', '229', 'Vargas', 'VA', '1');
INSERT INTO `js_zone` VALUES ('3749', '229', 'Yaracuy', 'YA', '1');
INSERT INTO `js_zone` VALUES ('3750', '229', 'Zulia', 'ZU', '1');
INSERT INTO `js_zone` VALUES ('3751', '230', 'An Giang', 'AG', '1');
INSERT INTO `js_zone` VALUES ('3752', '230', 'Bac Giang', 'BG', '1');
INSERT INTO `js_zone` VALUES ('3753', '230', 'Bac Kan', 'BK', '1');
INSERT INTO `js_zone` VALUES ('3754', '230', 'Bac Lieu', 'BL', '1');
INSERT INTO `js_zone` VALUES ('3755', '230', 'Bac Ninh', 'BC', '1');
INSERT INTO `js_zone` VALUES ('3756', '230', 'Ba Ria-Vung Tau', 'BR', '1');
INSERT INTO `js_zone` VALUES ('3757', '230', 'Ben Tre', 'BN', '1');
INSERT INTO `js_zone` VALUES ('3758', '230', 'Binh Dinh', 'BH', '1');
INSERT INTO `js_zone` VALUES ('3759', '230', 'Binh Duong', 'BU', '1');
INSERT INTO `js_zone` VALUES ('3760', '230', 'Binh Phuoc', 'BP', '1');
INSERT INTO `js_zone` VALUES ('3761', '230', 'Binh Thuan', 'BT', '1');
INSERT INTO `js_zone` VALUES ('3762', '230', 'Ca Mau', 'CM', '1');
INSERT INTO `js_zone` VALUES ('3763', '230', 'Can Tho', 'CT', '1');
INSERT INTO `js_zone` VALUES ('3764', '230', 'Cao Bang', 'CB', '1');
INSERT INTO `js_zone` VALUES ('3765', '230', 'Dak Lak', 'DL', '1');
INSERT INTO `js_zone` VALUES ('3766', '230', 'Dak Nong', 'DG', '1');
INSERT INTO `js_zone` VALUES ('3767', '230', 'Da Nang', 'DN', '1');
INSERT INTO `js_zone` VALUES ('3768', '230', 'Dien Bien', 'DB', '1');
INSERT INTO `js_zone` VALUES ('3769', '230', 'Dong Nai', 'DI', '1');
INSERT INTO `js_zone` VALUES ('3770', '230', 'Dong Thap', 'DT', '1');
INSERT INTO `js_zone` VALUES ('3771', '230', 'Gia Lai', 'GL', '1');
INSERT INTO `js_zone` VALUES ('3772', '230', 'Ha Giang', 'HG', '1');
INSERT INTO `js_zone` VALUES ('3773', '230', 'Hai Duong', 'HD', '1');
INSERT INTO `js_zone` VALUES ('3774', '230', 'Hai Phong', 'HP', '1');
INSERT INTO `js_zone` VALUES ('3775', '230', 'Ha Nam', 'HM', '1');
INSERT INTO `js_zone` VALUES ('3776', '230', 'Ha Noi', 'HI', '1');
INSERT INTO `js_zone` VALUES ('3777', '230', 'Ha Tay', 'HT', '1');
INSERT INTO `js_zone` VALUES ('3778', '230', 'Ha Tinh', 'HH', '1');
INSERT INTO `js_zone` VALUES ('3779', '230', 'Hoa Binh', 'HB', '1');
INSERT INTO `js_zone` VALUES ('3780', '230', 'Ho Chi Minh City', 'HC', '1');
INSERT INTO `js_zone` VALUES ('3781', '230', 'Hau Giang', 'HU', '1');
INSERT INTO `js_zone` VALUES ('3782', '230', 'Hung Yen', 'HY', '1');
INSERT INTO `js_zone` VALUES ('3783', '232', 'Saint Croix', 'C', '1');
INSERT INTO `js_zone` VALUES ('3784', '232', 'Saint John', 'J', '1');
INSERT INTO `js_zone` VALUES ('3785', '232', 'Saint Thomas', 'T', '1');
INSERT INTO `js_zone` VALUES ('3786', '233', 'Alo', 'A', '1');
INSERT INTO `js_zone` VALUES ('3787', '233', 'Sigave', 'S', '1');
INSERT INTO `js_zone` VALUES ('3788', '233', 'Wallis', 'W', '1');
INSERT INTO `js_zone` VALUES ('3789', '235', 'Abyan', 'AB', '1');
INSERT INTO `js_zone` VALUES ('3790', '235', 'Adan', 'AD', '1');
INSERT INTO `js_zone` VALUES ('3791', '235', 'Amran', 'AM', '1');
INSERT INTO `js_zone` VALUES ('3792', '235', 'Al Bayda', 'BA', '1');
INSERT INTO `js_zone` VALUES ('3793', '235', 'Ad Dali', 'DA', '1');
INSERT INTO `js_zone` VALUES ('3794', '235', 'Dhamar', 'DH', '1');
INSERT INTO `js_zone` VALUES ('3795', '235', 'Hadramawt', 'HD', '1');
INSERT INTO `js_zone` VALUES ('3796', '235', 'Hajjah', 'HJ', '1');
INSERT INTO `js_zone` VALUES ('3797', '235', 'Al Hudaydah', 'HU', '1');
INSERT INTO `js_zone` VALUES ('3798', '235', 'Ibb', 'IB', '1');
INSERT INTO `js_zone` VALUES ('3799', '235', 'Al Jawf', 'JA', '1');
INSERT INTO `js_zone` VALUES ('3800', '235', 'Lahij', 'LA', '1');
INSERT INTO `js_zone` VALUES ('3801', '235', 'Ma\'rib', 'MA', '1');
INSERT INTO `js_zone` VALUES ('3802', '235', 'Al Mahrah', 'MR', '1');
INSERT INTO `js_zone` VALUES ('3803', '235', 'Al Mahwit', 'MW', '1');
INSERT INTO `js_zone` VALUES ('3804', '235', 'Sa\'dah', 'SD', '1');
INSERT INTO `js_zone` VALUES ('3805', '235', 'San\'a', 'SN', '1');
INSERT INTO `js_zone` VALUES ('3806', '235', 'Shabwah', 'SH', '1');
INSERT INTO `js_zone` VALUES ('3807', '235', 'Ta\'izz', 'TA', '1');
INSERT INTO `js_zone` VALUES ('3812', '237', 'Bas-Congo', 'BC', '1');
INSERT INTO `js_zone` VALUES ('3813', '237', 'Bandundu', 'BN', '1');
INSERT INTO `js_zone` VALUES ('3814', '237', 'Equateur', 'EQ', '1');
INSERT INTO `js_zone` VALUES ('3815', '237', 'Katanga', 'KA', '1');
INSERT INTO `js_zone` VALUES ('3816', '237', 'Kasai-Oriental', 'KE', '1');
INSERT INTO `js_zone` VALUES ('3817', '237', 'Kinshasa', 'KN', '1');
INSERT INTO `js_zone` VALUES ('3818', '237', 'Kasai-Occidental', 'KW', '1');
INSERT INTO `js_zone` VALUES ('3819', '237', 'Maniema', 'MA', '1');
INSERT INTO `js_zone` VALUES ('3820', '237', 'Nord-Kivu', 'NK', '1');
INSERT INTO `js_zone` VALUES ('3821', '237', 'Orientale', 'OR', '1');
INSERT INTO `js_zone` VALUES ('3822', '237', 'Sud-Kivu', 'SK', '1');
INSERT INTO `js_zone` VALUES ('3823', '238', 'Central', 'CE', '1');
INSERT INTO `js_zone` VALUES ('3824', '238', 'Copperbelt', 'CB', '1');
INSERT INTO `js_zone` VALUES ('3825', '238', 'Eastern', 'EA', '1');
INSERT INTO `js_zone` VALUES ('3826', '238', 'Luapula', 'LP', '1');
INSERT INTO `js_zone` VALUES ('3827', '238', 'Lusaka', 'LK', '1');
INSERT INTO `js_zone` VALUES ('3828', '238', 'Northern', 'NO', '1');
INSERT INTO `js_zone` VALUES ('3829', '238', 'North-Western', 'NW', '1');
INSERT INTO `js_zone` VALUES ('3830', '238', 'Southern', 'SO', '1');
INSERT INTO `js_zone` VALUES ('3831', '238', 'Western', 'WE', '1');
INSERT INTO `js_zone` VALUES ('3832', '239', 'Bulawayo', 'BU', '1');
INSERT INTO `js_zone` VALUES ('3833', '239', 'Harare', 'HA', '1');
INSERT INTO `js_zone` VALUES ('3834', '239', 'Manicaland', 'ML', '1');
INSERT INTO `js_zone` VALUES ('3835', '239', 'Mashonaland Central', 'MC', '1');
INSERT INTO `js_zone` VALUES ('3836', '239', 'Mashonaland East', 'ME', '1');
INSERT INTO `js_zone` VALUES ('3837', '239', 'Mashonaland West', 'MW', '1');
INSERT INTO `js_zone` VALUES ('3838', '239', 'Masvingo', 'MV', '1');
INSERT INTO `js_zone` VALUES ('3839', '239', 'Matabeleland North', 'MN', '1');
INSERT INTO `js_zone` VALUES ('3840', '239', 'Matabeleland South', 'MS', '1');
INSERT INTO `js_zone` VALUES ('3841', '239', 'Midlands', 'MD', '1');
INSERT INTO `js_zone` VALUES ('3861', '105', 'Campobasso', 'CB', '1');
INSERT INTO `js_zone` VALUES ('3862', '105', 'Carbonia-Iglesias', 'CI', '1');
INSERT INTO `js_zone` VALUES ('3863', '105', 'Caserta', 'CE', '1');
INSERT INTO `js_zone` VALUES ('3864', '105', 'Catania', 'CT', '1');
INSERT INTO `js_zone` VALUES ('3865', '105', 'Catanzaro', 'CZ', '1');
INSERT INTO `js_zone` VALUES ('3866', '105', 'Chieti', 'CH', '1');
INSERT INTO `js_zone` VALUES ('3867', '105', 'Como', 'CO', '1');
INSERT INTO `js_zone` VALUES ('3868', '105', 'Cosenza', 'CS', '1');
INSERT INTO `js_zone` VALUES ('3869', '105', 'Cremona', 'CR', '1');
INSERT INTO `js_zone` VALUES ('3870', '105', 'Crotone', 'KR', '1');
INSERT INTO `js_zone` VALUES ('3871', '105', 'Cuneo', 'CN', '1');
INSERT INTO `js_zone` VALUES ('3872', '105', 'Enna', 'EN', '1');
INSERT INTO `js_zone` VALUES ('3873', '105', 'Ferrara', 'FE', '1');
INSERT INTO `js_zone` VALUES ('3874', '105', 'Firenze', 'FI', '1');
INSERT INTO `js_zone` VALUES ('3875', '105', 'Foggia', 'FG', '1');
INSERT INTO `js_zone` VALUES ('3876', '105', 'Forli-Cesena', 'FC', '1');
INSERT INTO `js_zone` VALUES ('3877', '105', 'Frosinone', 'FR', '1');
INSERT INTO `js_zone` VALUES ('3878', '105', 'Genova', 'GE', '1');
INSERT INTO `js_zone` VALUES ('3879', '105', 'Gorizia', 'GO', '1');
INSERT INTO `js_zone` VALUES ('3880', '105', 'Grosseto', 'GR', '1');
INSERT INTO `js_zone` VALUES ('3881', '105', 'Imperia', 'IM', '1');
INSERT INTO `js_zone` VALUES ('3882', '105', 'Isernia', 'IS', '1');
INSERT INTO `js_zone` VALUES ('3883', '105', 'L&#39;Aquila', 'AQ', '1');
INSERT INTO `js_zone` VALUES ('3884', '105', 'La Spezia', 'SP', '1');
INSERT INTO `js_zone` VALUES ('3885', '105', 'Latina', 'LT', '1');
INSERT INTO `js_zone` VALUES ('3886', '105', 'Lecce', 'LE', '1');
INSERT INTO `js_zone` VALUES ('3887', '105', 'Lecco', 'LC', '1');
INSERT INTO `js_zone` VALUES ('3888', '105', 'Livorno', 'LI', '1');
INSERT INTO `js_zone` VALUES ('3889', '105', 'Lodi', 'LO', '1');
INSERT INTO `js_zone` VALUES ('3890', '105', 'Lucca', 'LU', '1');
INSERT INTO `js_zone` VALUES ('3891', '105', 'Macerata', 'MC', '1');
INSERT INTO `js_zone` VALUES ('3892', '105', 'Mantova', 'MN', '1');
INSERT INTO `js_zone` VALUES ('3893', '105', 'Massa-Carrara', 'MS', '1');
INSERT INTO `js_zone` VALUES ('3894', '105', 'Matera', 'MT', '1');
INSERT INTO `js_zone` VALUES ('3895', '105', 'Medio Campidano', 'VS', '1');
INSERT INTO `js_zone` VALUES ('3896', '105', 'Messina', 'ME', '1');
INSERT INTO `js_zone` VALUES ('3897', '105', 'Milano', 'MI', '1');
INSERT INTO `js_zone` VALUES ('3898', '105', 'Modena', 'MO', '1');
INSERT INTO `js_zone` VALUES ('3899', '105', 'Napoli', 'NA', '1');
INSERT INTO `js_zone` VALUES ('3900', '105', 'Novara', 'NO', '1');
INSERT INTO `js_zone` VALUES ('3901', '105', 'Nuoro', 'NU', '1');
INSERT INTO `js_zone` VALUES ('3902', '105', 'Ogliastra', 'OG', '1');
INSERT INTO `js_zone` VALUES ('3903', '105', 'Olbia-Tempio', 'OT', '1');
INSERT INTO `js_zone` VALUES ('3904', '105', 'Oristano', 'OR', '1');
INSERT INTO `js_zone` VALUES ('3905', '105', 'Padova', 'PD', '1');
INSERT INTO `js_zone` VALUES ('3906', '105', 'Palermo', 'PA', '1');
INSERT INTO `js_zone` VALUES ('3907', '105', 'Parma', 'PR', '1');
INSERT INTO `js_zone` VALUES ('3908', '105', 'Pavia', 'PV', '1');
INSERT INTO `js_zone` VALUES ('3909', '105', 'Perugia', 'PG', '1');
INSERT INTO `js_zone` VALUES ('3910', '105', 'Pesaro e Urbino', 'PU', '1');
INSERT INTO `js_zone` VALUES ('3911', '105', 'Pescara', 'PE', '1');
INSERT INTO `js_zone` VALUES ('3912', '105', 'Piacenza', 'PC', '1');
INSERT INTO `js_zone` VALUES ('3913', '105', 'Pisa', 'PI', '1');
INSERT INTO `js_zone` VALUES ('3914', '105', 'Pistoia', 'PT', '1');
INSERT INTO `js_zone` VALUES ('3915', '105', 'Pordenone', 'PN', '1');
INSERT INTO `js_zone` VALUES ('3916', '105', 'Potenza', 'PZ', '1');
INSERT INTO `js_zone` VALUES ('3917', '105', 'Prato', 'PO', '1');
INSERT INTO `js_zone` VALUES ('3918', '105', 'Ragusa', 'RG', '1');
INSERT INTO `js_zone` VALUES ('3919', '105', 'Ravenna', 'RA', '1');
INSERT INTO `js_zone` VALUES ('3920', '105', 'Reggio Calabria', 'RC', '1');
INSERT INTO `js_zone` VALUES ('3921', '105', 'Reggio Emilia', 'RE', '1');
INSERT INTO `js_zone` VALUES ('3922', '105', 'Rieti', 'RI', '1');
INSERT INTO `js_zone` VALUES ('3923', '105', 'Rimini', 'RN', '1');
INSERT INTO `js_zone` VALUES ('3924', '105', 'Roma', 'RM', '1');
INSERT INTO `js_zone` VALUES ('3925', '105', 'Rovigo', 'RO', '1');
INSERT INTO `js_zone` VALUES ('3926', '105', 'Salerno', 'SA', '1');
INSERT INTO `js_zone` VALUES ('3927', '105', 'Sassari', 'SS', '1');
INSERT INTO `js_zone` VALUES ('3928', '105', 'Savona', 'SV', '1');
INSERT INTO `js_zone` VALUES ('3929', '105', 'Siena', 'SI', '1');
INSERT INTO `js_zone` VALUES ('3930', '105', 'Siracusa', 'SR', '1');
INSERT INTO `js_zone` VALUES ('3931', '105', 'Sondrio', 'SO', '1');
INSERT INTO `js_zone` VALUES ('3932', '105', 'Taranto', 'TA', '1');
INSERT INTO `js_zone` VALUES ('3933', '105', 'Teramo', 'TE', '1');
INSERT INTO `js_zone` VALUES ('3934', '105', 'Terni', 'TR', '1');
INSERT INTO `js_zone` VALUES ('3935', '105', 'Torino', 'TO', '1');
INSERT INTO `js_zone` VALUES ('3936', '105', 'Trapani', 'TP', '1');
INSERT INTO `js_zone` VALUES ('3937', '105', 'Trento', 'TN', '1');
INSERT INTO `js_zone` VALUES ('3938', '105', 'Treviso', 'TV', '1');
INSERT INTO `js_zone` VALUES ('3939', '105', 'Trieste', 'TS', '1');
INSERT INTO `js_zone` VALUES ('3940', '105', 'Udine', 'UD', '1');
INSERT INTO `js_zone` VALUES ('3941', '105', 'Varese', 'VA', '1');
INSERT INTO `js_zone` VALUES ('3942', '105', 'Venezia', 'VE', '1');
INSERT INTO `js_zone` VALUES ('3943', '105', 'Verbano-Cusio-Ossola', 'VB', '1');
INSERT INTO `js_zone` VALUES ('3944', '105', 'Vercelli', 'VC', '1');
INSERT INTO `js_zone` VALUES ('3945', '105', 'Verona', 'VR', '1');
INSERT INTO `js_zone` VALUES ('3946', '105', 'Vibo Valentia', 'VV', '1');
INSERT INTO `js_zone` VALUES ('3947', '105', 'Vicenza', 'VI', '1');
INSERT INTO `js_zone` VALUES ('3948', '105', 'Viterbo', 'VT', '1');
INSERT INTO `js_zone` VALUES ('3949', '222', 'County Antrim', 'ANT', '1');
INSERT INTO `js_zone` VALUES ('3950', '222', 'County Armagh', 'ARM', '1');
INSERT INTO `js_zone` VALUES ('3951', '222', 'County Down', 'DOW', '1');
INSERT INTO `js_zone` VALUES ('3952', '222', 'County Fermanagh', 'FER', '1');
INSERT INTO `js_zone` VALUES ('3953', '222', 'County Londonderry', 'LDY', '1');
INSERT INTO `js_zone` VALUES ('3954', '222', 'County Tyrone', 'TYR', '1');
INSERT INTO `js_zone` VALUES ('3955', '222', 'Cumbria', 'CMA', '1');
INSERT INTO `js_zone` VALUES ('3956', '190', 'Pomurska', '1', '1');
INSERT INTO `js_zone` VALUES ('3957', '190', 'Podravska', '2', '1');
INSERT INTO `js_zone` VALUES ('3958', '190', 'Koroška', '3', '1');
INSERT INTO `js_zone` VALUES ('3959', '190', 'Savinjska', '4', '1');
INSERT INTO `js_zone` VALUES ('3960', '190', 'Zasavska', '5', '1');
INSERT INTO `js_zone` VALUES ('3961', '190', 'Spodnjeposavska', '6', '1');
INSERT INTO `js_zone` VALUES ('3962', '190', 'Jugovzhodna Slovenija', '7', '1');
INSERT INTO `js_zone` VALUES ('3963', '190', 'Osrednjeslovenska', '8', '1');
INSERT INTO `js_zone` VALUES ('3964', '190', 'Gorenjska', '9', '1');
INSERT INTO `js_zone` VALUES ('3965', '190', 'Notranjsko-kraška', '10', '1');
INSERT INTO `js_zone` VALUES ('3966', '190', 'Goriška', '11', '1');
INSERT INTO `js_zone` VALUES ('3967', '190', 'Obalno-kraška', '12', '1');
INSERT INTO `js_zone` VALUES ('3968', '33', 'Ruse', '', '1');
INSERT INTO `js_zone` VALUES ('3969', '101', 'Alborz', 'ALB', '1');
INSERT INTO `js_zone` VALUES ('3970', '21', 'Brussels-Capital Region', 'BRU', '1');
INSERT INTO `js_zone` VALUES ('3971', '138', 'Aguascalientes', 'AG', '1');
INSERT INTO `js_zone` VALUES ('3972', '222', 'Isle of Man', 'IOM', '1');
INSERT INTO `js_zone` VALUES ('3973', '242', 'Andrijevica', '01', '1');
INSERT INTO `js_zone` VALUES ('3974', '242', 'Bar', '02', '1');
INSERT INTO `js_zone` VALUES ('3975', '242', 'Berane', '03', '1');
INSERT INTO `js_zone` VALUES ('3976', '242', 'Bijelo Polje', '04', '1');
INSERT INTO `js_zone` VALUES ('3977', '242', 'Budva', '05', '1');
INSERT INTO `js_zone` VALUES ('3978', '242', 'Cetinje', '06', '1');
INSERT INTO `js_zone` VALUES ('3979', '242', 'Danilovgrad', '07', '1');
INSERT INTO `js_zone` VALUES ('3980', '242', 'Herceg-Novi', '08', '1');
INSERT INTO `js_zone` VALUES ('3981', '242', 'Kolašin', '09', '1');
INSERT INTO `js_zone` VALUES ('3982', '242', 'Kotor', '10', '1');
INSERT INTO `js_zone` VALUES ('3983', '242', 'Mojkovac', '11', '1');
INSERT INTO `js_zone` VALUES ('3984', '242', 'Nikšić', '12', '1');
INSERT INTO `js_zone` VALUES ('3985', '242', 'Plav', '13', '1');
INSERT INTO `js_zone` VALUES ('3986', '242', 'Pljevlja', '14', '1');
INSERT INTO `js_zone` VALUES ('3987', '242', 'Plužine', '15', '1');
INSERT INTO `js_zone` VALUES ('3988', '242', 'Podgorica', '16', '1');
INSERT INTO `js_zone` VALUES ('3989', '242', 'Rožaje', '17', '1');
INSERT INTO `js_zone` VALUES ('3990', '242', 'Šavnik', '18', '1');
INSERT INTO `js_zone` VALUES ('3991', '242', 'Tivat', '19', '1');
INSERT INTO `js_zone` VALUES ('3992', '242', 'Ulcinj', '20', '1');
INSERT INTO `js_zone` VALUES ('3993', '242', 'Žabljak', '21', '1');
INSERT INTO `js_zone` VALUES ('3994', '243', 'Belgrade', '00', '1');
INSERT INTO `js_zone` VALUES ('3995', '243', 'North Bačka', '01', '1');
INSERT INTO `js_zone` VALUES ('3996', '243', 'Central Banat', '02', '1');
INSERT INTO `js_zone` VALUES ('3997', '243', 'North Banat', '03', '1');
INSERT INTO `js_zone` VALUES ('3998', '243', 'South Banat', '04', '1');
INSERT INTO `js_zone` VALUES ('3999', '243', 'West Bačka', '05', '1');
INSERT INTO `js_zone` VALUES ('4000', '243', 'South Bačka', '06', '1');
INSERT INTO `js_zone` VALUES ('4001', '243', 'Srem', '07', '1');
INSERT INTO `js_zone` VALUES ('4002', '243', 'Mačva', '08', '1');
INSERT INTO `js_zone` VALUES ('4003', '243', 'Kolubara', '09', '1');
INSERT INTO `js_zone` VALUES ('4004', '243', 'Podunavlje', '10', '1');
INSERT INTO `js_zone` VALUES ('4005', '243', 'Braničevo', '11', '1');
INSERT INTO `js_zone` VALUES ('4006', '243', 'Šumadija', '12', '1');
INSERT INTO `js_zone` VALUES ('4007', '243', 'Pomoravlje', '13', '1');
INSERT INTO `js_zone` VALUES ('4008', '243', 'Bor', '14', '1');
INSERT INTO `js_zone` VALUES ('4009', '243', 'Zaječar', '15', '1');
INSERT INTO `js_zone` VALUES ('4010', '243', 'Zlatibor', '16', '1');
INSERT INTO `js_zone` VALUES ('4011', '243', 'Moravica', '17', '1');
INSERT INTO `js_zone` VALUES ('4012', '243', 'Raška', '18', '1');
INSERT INTO `js_zone` VALUES ('4013', '243', 'Rasina', '19', '1');
INSERT INTO `js_zone` VALUES ('4014', '243', 'Nišava', '20', '1');
INSERT INTO `js_zone` VALUES ('4015', '243', 'Toplica', '21', '1');
INSERT INTO `js_zone` VALUES ('4016', '243', 'Pirot', '22', '1');
INSERT INTO `js_zone` VALUES ('4017', '243', 'Jablanica', '23', '1');
INSERT INTO `js_zone` VALUES ('4018', '243', 'Pčinja', '24', '1');
INSERT INTO `js_zone` VALUES ('4019', '243', 'Kosovo', 'KM', '1');
INSERT INTO `js_zone` VALUES ('4020', '245', 'Bonaire', 'BO', '1');
INSERT INTO `js_zone` VALUES ('4021', '245', 'Saba', 'SA', '1');
INSERT INTO `js_zone` VALUES ('4022', '245', 'Sint Eustatius', 'SE', '1');
INSERT INTO `js_zone` VALUES ('4023', '248', 'Central Equatoria', 'EC', '1');
INSERT INTO `js_zone` VALUES ('4024', '248', 'Eastern Equatoria', 'EE', '1');
INSERT INTO `js_zone` VALUES ('4025', '248', 'Jonglei', 'JG', '1');
INSERT INTO `js_zone` VALUES ('4026', '248', 'Lakes', 'LK', '1');
INSERT INTO `js_zone` VALUES ('4027', '248', 'Northern Bahr el-Ghazal', 'BN', '1');
INSERT INTO `js_zone` VALUES ('4028', '248', 'Unity', 'UY', '1');
INSERT INTO `js_zone` VALUES ('4029', '248', 'Upper Nile', 'NU', '1');
INSERT INTO `js_zone` VALUES ('4030', '248', 'Warrap', 'WR', '1');
INSERT INTO `js_zone` VALUES ('4031', '248', 'Western Bahr el-Ghazal', 'BW', '1');
INSERT INTO `js_zone` VALUES ('4032', '248', 'Western Equatoria', 'EW', '1');
INSERT INTO `js_zone_to_geo_zone` VALUES ('57', '222', '0', '3', '2010-02-26 22:33:24', '0000-00-00 00:00:00');
INSERT INTO `js_zone_to_geo_zone` VALUES ('65', '222', '0', '4', '2010-12-15 15:18:13', '0000-00-00 00:00:00');
INSERT INTO `js_zone_to_geo_zone` VALUES ('69', '38', '612', '5', '2013-08-14 22:38:37', '0000-00-00 00:00:00');
INSERT INTO `js_zone_to_geo_zone` VALUES ('70', '38', '0', '6', '2013-08-14 22:48:09', '0000-00-00 00:00:00');
