-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 22, 2015 at 10:02 PM
-- Server version: 5.5.24
-- PHP Version: 5.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `BOILERPLATE_wordpress`
--

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_commentmeta`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_comments`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_itsec_lockouts`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_itsec_lockouts` (
  `lockout_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lockout_type` varchar(20) NOT NULL,
  `lockout_start` datetime NOT NULL,
  `lockout_start_gmt` datetime NOT NULL,
  `lockout_expire` datetime NOT NULL,
  `lockout_expire_gmt` datetime NOT NULL,
  `lockout_host` varchar(20) DEFAULT NULL,
  `lockout_user` bigint(20) unsigned DEFAULT NULL,
  `lockout_active` int(1) NOT NULL DEFAULT '1',
  `lockout_username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`lockout_id`),
  KEY `lockout_expire_gmt` (`lockout_expire_gmt`),
  KEY `lockout_host` (`lockout_host`),
  KEY `lockout_user` (`lockout_user`),
  KEY `lockout_active` (`lockout_active`),
  KEY `lockout_username` (`lockout_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_itsec_log`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_itsec_log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` varchar(20) NOT NULL DEFAULT '',
  `log_function` varchar(255) NOT NULL DEFAULT '',
  `log_priority` int(2) NOT NULL DEFAULT '1',
  `log_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_host` varchar(20) DEFAULT NULL,
  `log_username` varchar(20) DEFAULT NULL,
  `log_user` bigint(20) unsigned DEFAULT NULL,
  `log_url` varchar(255) DEFAULT NULL,
  `log_referrer` varchar(255) DEFAULT NULL,
  `log_data` longtext NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_type` (`log_type`),
  KEY `log_date_gmt` (`log_date_gmt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_itsec_temp`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_itsec_temp` (
  `temp_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `temp_type` varchar(20) NOT NULL,
  `temp_date` datetime NOT NULL,
  `temp_date_gmt` datetime NOT NULL,
  `temp_host` varchar(20) DEFAULT NULL,
  `temp_user` bigint(20) unsigned DEFAULT NULL,
  `temp_username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`temp_id`),
  KEY `temp_date_gmt` (`temp_date_gmt`),
  KEY `temp_host` (`temp_host`),
  KEY `temp_user` (`temp_user`),
  KEY `temp_username` (`temp_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_links`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_options`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14439 ;

--
-- Dumping data for table `uo6g6en_options`
--

INSERT INTO `uo6g6en_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://wordpress.loc/core/', 'yes'),
(2, 'blogname', 'Site Title', 'yes'),
(3, 'blogdescription', 'Just another WordPress site', 'yes'),
(4, 'users_can_register', '0', 'yes'),
(5, 'admin_email', 'reg@criography.com', 'yes'),
(6, 'start_of_week', '1', 'yes'),
(7, 'use_balanceTags', '', 'yes'),
(8, 'use_smilies', '', 'yes'),
(9, 'require_name_email', '1', 'yes'),
(10, 'comments_notify', '1', 'yes'),
(11, 'posts_per_rss', '10', 'yes'),
(12, 'rss_use_excerpt', '0', 'yes'),
(13, 'mailserver_url', 'mail.example.com', 'yes'),
(14, 'mailserver_login', 'login@example.com', 'yes'),
(15, 'mailserver_pass', 'password', 'yes'),
(16, 'mailserver_port', '110', 'yes'),
(17, 'default_category', '1', 'yes'),
(18, 'default_comment_status', 'closed', 'yes'),
(19, 'default_ping_status', 'open', 'yes'),
(20, 'default_pingback_flag', '', 'yes'),
(22, 'posts_per_page', '2', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i A', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(29, 'comment_moderation', '1', 'yes'),
(30, 'moderation_notify', '1', 'yes'),
(31, 'permalink_structure', '/%category%/%postname%/', 'yes'),
(32, 'gzipcompression', '0', 'yes'),
(33, 'hack_file', '0', 'yes'),
(34, 'blog_charset', 'UTF-8', 'yes'),
(35, 'moderation_keys', '', 'no'),
(36, 'active_plugins', 'a:27:{i:0;s:53:"admin-management-xtended/admin-management-xtended.php";i:1;s:34:"advanced-custom-fields-pro/acf.php";i:2;s:19:"akismet/akismet.php";i:3;s:41:"better-wp-security/better-wp-security.php";i:4;s:51:"codepress-admin-columns/codepress-admin-columns.php";i:5;s:74:"debug-bar-actions-and-filters-addon/debug-bar-action-and-filters-addon.php";i:6;s:43:"debug-bar-constants/debug-bar-constants.php";i:7;s:45:"debug-bar-post-types/debug-bar-post-types.php";i:8;s:47:"debug-bar-query-tracer/galahad-query-tracer.php";i:9;s:23:"debug-bar/debug-bar.php";i:10;s:33:"duplicate-post/duplicate-post.php";i:11;s:41:"imagemagick-engine/imagemagick-engine.php";i:12;s:19:"mail-add-sender.php";i:13;s:47:"monkeyman-rewrite-analyzer/rewrite-analyzer.php";i:14;s:21:"raw-html/raw_html.php";i:15;s:49:"restricted-site-access/restricted_site_access.php";i:16;s:33:"rich-text-tags/rich-text-tags.php";i:17;s:41:"simple-image-sizes/simple_image_sizes.php";i:18;s:41:"spidersock-helpers/spidersock-helpers.php";i:19;s:37:"tinymce-advanced/tinymce-advanced.php";i:20;s:33:"w3-total-cache/w3-total-cache.php";i:21;s:24:"wordpress-seo/wp-seo.php";i:22;s:47:"wp-migrate-db-pro-cli/wp-migrate-db-pro-cli.php";i:23;s:63:"wp-migrate-db-pro-media-files/wp-migrate-db-pro-media-files.php";i:24;s:39:"wp-migrate-db-pro/wp-migrate-db-pro.php";i:25;s:31:"wp-typography/wp-typography.php";i:26;s:41:"wpmail-proper-html/wpmail-proper-html.php";}', 'yes'),
(37, 'home', 'http://wordpress.loc/', 'yes'),
(38, 'category_base', '', 'yes'),
(39, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(40, 'advanced_edit', '0', 'yes'),
(41, 'comment_max_links', '2', 'yes'),
(42, 'gmt_offset', '', 'yes'),
(43, 'default_email_category', '1', 'yes'),
(44, 'recently_edited', '', 'no'),
(45, 'template', 'theme-name', 'yes'),
(46, 'stylesheet', 'theme-name', 'yes'),
(47, 'comment_whitelist', '1', 'yes'),
(48, 'blacklist_keys', '', 'no'),
(49, 'comment_registration', '1', 'yes'),
(50, 'html_type', 'text/html', 'yes'),
(51, 'use_trackback', '0', 'yes'),
(52, 'default_role', 'subscriber', 'yes'),
(53, 'db_version', '31535', 'yes'),
(54, 'uploads_use_yearmonth_folders', '1', 'yes'),
(55, 'upload_path', '', 'yes'),
(56, 'blog_public', '0', 'yes'),
(57, 'default_link_category', '2', 'yes'),
(58, 'show_on_front', 'page', 'yes'),
(59, 'tag_base', '', 'yes'),
(60, 'show_avatars', '1', 'yes'),
(61, 'avatar_rating', 'G', 'yes'),
(62, 'upload_url_path', '', 'yes'),
(63, 'thumbnail_size_w', '150', 'yes'),
(64, 'thumbnail_size_h', '150', 'yes'),
(65, 'thumbnail_crop', '1', 'yes'),
(66, 'medium_size_w', '300', 'yes'),
(67, 'medium_size_h', '300', 'yes'),
(68, 'avatar_default', 'mystery', 'yes'),
(71, 'large_size_w', '1200', 'yes'),
(72, 'large_size_h', '900', 'yes'),
(73, 'image_default_link_type', '', 'yes'),
(74, 'image_default_size', '', 'yes'),
(75, 'image_default_align', '', 'yes'),
(76, 'close_comments_for_old_posts', '', 'yes'),
(77, 'close_comments_days_old', '14', 'yes'),
(78, 'thread_comments', '', 'yes'),
(79, 'thread_comments_depth', '5', 'yes'),
(80, 'page_comments', '', 'yes'),
(81, 'comments_per_page', '50', 'yes'),
(82, 'default_comments_page', 'newest', 'yes'),
(83, 'comment_order', 'asc', 'yes'),
(84, 'sticky_posts', 'a:0:{}', 'yes'),
(85, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(86, 'widget_text', 'a:0:{}', 'yes'),
(87, 'widget_rss', 'a:0:{}', 'yes'),
(88, 'uninstall_plugins', 'a:6:{s:41:"better-wp-security/better-wp-security.php";a:2:{i:0;s:10:"ITSEC_Core";i:1;s:12:"on_uninstall";}s:39:"custom-upload-dir/custom_upload_dir.php";s:18:"cud_delete_options";s:25:"relevanssi/relevanssi.php";s:20:"relevanssi_uninstall";s:49:"restricted-site-access/restricted_site_access.php";s:32:"restricted_site_access_uninstall";s:25:"adminimize/adminimize.php";s:24:"_mw_adminimize_deinstall";s:31:"post-snippets/post-snippets.php";a:2:{i:0;s:12:"PostSnippets";i:1;s:9:"uninstall";}}', 'no'),
(89, 'timezone_string', 'Europe/London', 'yes'),
(91, 'embed_size_w', '', 'yes'),
(92, 'embed_size_h', '600', 'yes'),
(93, 'page_for_posts', '0', 'yes'),
(94, 'page_on_front', '301', 'yes'),
(95, 'default_post_format', '0', 'yes'),
(96, 'initial_db_version', '21707', 'yes'),
(97, 'uo6g6en_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:65:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:20:"manage_admin_columns";b:1;s:10:"copy_posts";b:1;s:15:"wpseo_bulk_edit";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:36:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:10:"copy_posts";b:1;s:15:"wpseo_bulk_edit";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:11:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;s:15:"wpseo_bulk_edit";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(98, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(100, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(101, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'sidebars_widgets', 'a:3:{s:19:"wp_inactive_widgets";a:0:{}s:18:"orphaned_widgets_1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes'),
(104, 'cron', 'a:8:{i:1432330968;a:2:{s:22:"w3_objectcache_cleanup";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:22:"w3_objectcache_cleanup";s:4:"args";a:0:{}s:8:"interval";i:3600;}}s:18:"w3_dbcache_cleanup";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:18:"w3_dbcache_cleanup";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1432334568;a:2:{s:20:"itsec_purge_lockouts";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:17:"w3_minify_cleanup";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:17:"w3_minify_cleanup";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1432344824;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1432367880;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1432388022;a:1:{s:16:"itsec_purge_logs";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1432408612;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1432409869;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(113, 'dashboard_widget_options', 'a:4:{s:25:"dashboard_recent_comments";a:1:{s:5:"items";i:5;}s:24:"dashboard_incoming_links";a:5:{s:4:"home";s:20:"http://wordpress.loc";s:4:"link";s:96:"http://blogsearch.google.com/blogsearch?scoring=d&partner=wordpress&q=link:http://wordpress.loc/";s:3:"url";s:129:"http://blogsearch.google.com/blogsearch_feeds?scoring=d&ie=utf-8&num=10&output=rss&partner=wordpress&q=link:http://wordpress.loc/";s:5:"items";i:10;s:9:"show_date";b:0;}s:17:"dashboard_primary";a:7:{s:4:"link";s:26:"http://wordpress.org/news/";s:3:"url";s:31:"http://wordpress.org/news/feed/";s:5:"title";s:14:"WordPress Blog";s:5:"items";i:2;s:12:"show_summary";i:1;s:11:"show_author";i:0;s:9:"show_date";i:1;}s:19:"dashboard_secondary";a:7:{s:4:"link";s:28:"http://planet.wordpress.org/";s:3:"url";s:33:"http://planet.wordpress.org/feed/";s:5:"title";s:20:"Other WordPress News";s:5:"items";i:5;s:12:"show_summary";i:0;s:11:"show_author";i:0;s:9:"show_date";i:0;}}', 'yes'),
(147, 'recently_activated', 'a:0:{}', 'yes'),
(148, 'ame_show_orderoptions', '1', 'yes'),
(149, 'ame_toggle_showinvisposts', '1', 'yes'),
(150, 'ame_version', '2.3.9.4', 'yes'),
(151, 'ame_imgset', 'set1', 'yes'),
(152, 'backwpup', 'a:19:{s:13:"last_activate";s:6:"2.1.17";s:12:"mailsndemail";s:18:"reg@criography.com";s:11:"mailsndname";s:19:"BackWPup Site Title";s:10:"mailmethod";s:4:"mail";s:12:"mailsendmail";b:0;s:8:"mailhost";s:0:"";s:12:"mailhostport";i:25;s:10:"mailsecure";s:0:"";s:8:"mailuser";s:0:"";s:8:"mailpass";s:0:"";s:12:"showadminbar";b:0;s:12:"jobstepretry";i:3;s:14:"jobscriptretry";i:5;s:7:"maxlogs";i:0;s:6:"gzlogs";b:0;s:6:"phpzip";b:0;s:7:"dirlogs";s:55:"F:/__REPO/wordpress/src/wp-content/backwpup-7327a-logs/";s:12:"httpauthuser";s:0:"";s:16:"httpauthpassword";s:0:"";}', 'yes'),
(155, 'custom_upload_dir', 'a:7:{s:17:"custom_upload_dir";s:0:"";s:11:"all_parents";b:1;s:17:"flatten_hierarchy";b:0;s:15:"only_leaf_nodes";b:0;s:15:"only_base_nodes";b:0;s:8:"test_ids";s:3:"299";s:8:"template";s:42:"/%year%/%monthnum%/%post_type%/%category%/";}', 'yes'),
(156, 'relevanssi_title_boost', '5', 'yes'),
(157, 'relevanssi_comment_boost', '0.75', 'yes'),
(158, 'relevanssi_admin_search', 'off', 'yes'),
(159, 'relevanssi_highlight', 'strong', 'yes'),
(160, 'relevanssi_txt_col', '#ff0000', 'yes'),
(161, 'relevanssi_bg_col', '#ffaf75', 'yes'),
(162, 'relevanssi_css', 'text-decoration: underline; text-color: #ff0000', 'yes'),
(163, 'relevanssi_class', 'relevanssi-query-term', 'yes'),
(164, 'relevanssi_excerpts', 'on', 'yes'),
(165, 'relevanssi_excerpt_length', '450', 'yes'),
(166, 'relevanssi_excerpt_type', 'chars', 'yes'),
(167, 'relevanssi_excerpt_allowable_tags', '', 'yes'),
(168, 'relevanssi_log_queries', 'off', 'yes'),
(169, 'relevanssi_cat', '0', 'yes'),
(170, 'relevanssi_excat', '0', 'yes'),
(171, 'relevanssi_index_fields', '', 'yes'),
(172, 'relevanssi_exclude_posts', '', 'yes'),
(174, 'relevanssi_hilite_title', 'off', 'yes'),
(175, 'relevanssi_highlight_docs', 'off', 'yes'),
(176, 'relevanssi_highlight_comments', 'off', 'yes'),
(177, 'relevanssi_index_comments', 'none', 'yes'),
(178, 'relevanssi_include_cats', '', 'yes'),
(179, 'relevanssi_show_matches', 'off', 'yes'),
(180, 'relevanssi_show_matches_txt', '(Search hits: %body% in body, %title% in title, %tags% in tags, %comments% in comments. Score: %score%)', 'yes'),
(181, 'relevanssi_fuzzy', 'sometimes', 'yes'),
(183, 'relevanssi_expand_shortcodes', 'on', 'yes'),
(185, 'relevanssi_index_author', 'off', 'yes'),
(186, 'relevanssi_implicit_operator', 'OR', 'yes'),
(187, 'relevanssi_omit_from_logs', '', 'yes'),
(188, 'relevanssi_synonyms', '', 'yes'),
(189, 'relevanssi_index_excerpt', 'off', 'yes'),
(190, 'relevanssi_index_limit', '500', 'yes'),
(191, 'relevanssi_disable_or_fallback', 'off', 'yes'),
(192, 'relevanssi_respect_exclude', 'on', 'yes'),
(195, 'relevanssi_min_word_length', '3', 'yes'),
(196, 'relevanssi_wpml_only_current', 'off', 'yes'),
(197, 'relevanssi_word_boundaries', 'on', 'yes'),
(198, 'relevanssi_default_orderby', 'relevance', 'yes'),
(199, 'relevanssi_db_version', '5', 'yes'),
(200, 'relevanssi_post_type_weights', 'a:2:{s:8:"post_tag";s:4:"0.75";s:8:"category";s:4:"0.75";}', 'yes'),
(201, 'relevanssi_throttle', 'on', 'yes'),
(202, 'relevanssi_throttle_limit', '500', 'yes'),
(203, 'relevanssi_index_post_types', 'a:2:{i:0;s:4:"post";i:1;s:4:"page";}', 'yes'),
(205, 'wpseo', 'a:24:{s:14:"blocking_files";a:0:{}s:26:"ignore_blog_public_warning";b:1;s:31:"ignore_meta_description_warning";b:0;s:20:"ignore_page_comments";b:0;s:16:"ignore_permalink";b:0;s:11:"ignore_tour";b:1;s:15:"ms_defaults_set";b:0;s:23:"theme_description_found";s:0:"";s:21:"theme_has_description";b:0;s:19:"tracking_popup_done";b:1;s:7:"version";s:5:"2.1.1";s:10:"seen_about";b:1;s:11:"alexaverify";s:0:"";s:12:"company_logo";s:0:"";s:12:"company_name";s:0:"";s:17:"company_or_person";s:0:"";s:20:"disableadvanced_meta";b:0;s:12:"googleverify";s:0:"";s:8:"msverify";s:0:"";s:11:"person_name";s:0:"";s:12:"website_name";s:0:"";s:22:"alternate_website_name";s:0:"";s:12:"yandexverify";s:0:"";s:14:"yoast_tracking";b:0;}', 'yes'),
(206, 'wpseo_titles', 'a:70:{s:10:"title_test";i:0;s:17:"forcerewritetitle";b:0;s:9:"separator";s:8:"sc-mdash";s:5:"noodp";b:0;s:6:"noydir";b:0;s:15:"usemetakeywords";b:0;s:16:"title-home-wpseo";s:42:"%%sitename%% %%page%% %%sep%% %%sitedesc%%";s:18:"title-author-wpseo";s:41:"%%name%%, Author at %%sitename%% %%page%%";s:19:"title-archive-wpseo";s:38:"%%date%% %%page%% %%sep%% %%sitename%%";s:18:"title-search-wpseo";s:63:"You searched for %%searchphrase%% %%page%% %%sep%% %%sitename%%";s:15:"title-404-wpseo";s:35:"Page Not Found %%sep%% %%sitename%%";s:19:"metadesc-home-wpseo";s:0:"";s:21:"metadesc-author-wpseo";s:0:"";s:22:"metadesc-archive-wpseo";s:0:"";s:18:"metakey-home-wpseo";s:0:"";s:20:"metakey-author-wpseo";s:0:"";s:22:"noindex-subpages-wpseo";b:1;s:20:"noindex-author-wpseo";b:0;s:21:"noindex-archive-wpseo";b:1;s:14:"disable-author";b:1;s:12:"disable-date";b:0;s:10:"title-post";s:39:"%%title%% %%page%% %%sep%% %%sitename%%";s:13:"metadesc-post";s:0:"";s:12:"metakey-post";s:0:"";s:12:"noindex-post";b:1;s:13:"showdate-post";b:0;s:16:"hideeditbox-post";b:0;s:10:"title-page";s:39:"%%title%% %%page%% %%sep%% %%sitename%%";s:13:"metadesc-page";s:0:"";s:12:"metakey-page";s:0:"";s:12:"noindex-page";b:0;s:13:"showdate-page";b:0;s:16:"hideeditbox-page";b:0;s:16:"title-attachment";s:39:"%%title%% %%page%% %%sep%% %%sitename%%";s:19:"metadesc-attachment";s:0:"";s:18:"metakey-attachment";s:0:"";s:18:"noindex-attachment";b:0;s:19:"showdate-attachment";b:0;s:22:"hideeditbox-attachment";b:0;s:18:"title-tax-category";s:53:"%%term_title%% Archives %%page%% %%sep%% %%sitename%%";s:21:"metadesc-tax-category";s:0:"";s:20:"metakey-tax-category";s:0:"";s:24:"hideeditbox-tax-category";b:0;s:20:"noindex-tax-category";b:0;s:18:"title-tax-post_tag";s:53:"%%term_title%% Archives %%page%% %%sep%% %%sitename%%";s:21:"metadesc-tax-post_tag";s:0:"";s:20:"metakey-tax-post_tag";s:0:"";s:24:"hideeditbox-tax-post_tag";b:0;s:20:"noindex-tax-post_tag";b:0;s:21:"title-tax-post_format";s:53:"%%term_title%% Archives %%page%% %%sep%% %%sitename%%";s:24:"metadesc-tax-post_format";s:0:"";s:23:"metakey-tax-post_format";s:0:"";s:27:"hideeditbox-tax-post_format";b:0;s:23:"noindex-tax-post_format";b:0;s:16:"title-styleguide";s:39:"%%title%% %%page%% %%sep%% %%sitename%%";s:19:"metadesc-styleguide";s:0:"";s:18:"metakey-styleguide";s:0:"";s:18:"noindex-styleguide";b:0;s:19:"showdate-styleguide";b:0;s:22:"hideeditbox-styleguide";b:0;s:26:"title-ptarchive-styleguide";s:51:"%%pt_plural%% Archive %%page%% %%sep%% %%sitename%%";s:29:"metadesc-ptarchive-styleguide";s:0:"";s:28:"metakey-ptarchive-styleguide";s:0:"";s:28:"bctitle-ptarchive-styleguide";s:0:"";s:28:"noindex-ptarchive-styleguide";b:0;s:22:"title-tax-pattern-type";s:53:"%%term_title%% Archives %%page%% %%sep%% %%sitename%%";s:25:"metadesc-tax-pattern-type";s:0:"";s:24:"metakey-tax-pattern-type";s:0:"";s:28:"hideeditbox-tax-pattern-type";b:0;s:24:"noindex-tax-pattern-type";b:0;}', 'yes'),
(207, 'wpseo_xml', 'a:13:{s:22:"disable_author_sitemap";b:1;s:16:"enablexmlsitemap";b:1;s:16:"entries-per-page";i:1000;s:14:"xml_ping_yahoo";b:0;s:12:"xml_ping_ask";b:0;s:30:"post_types-post-not_in_sitemap";b:0;s:30:"post_types-page-not_in_sitemap";b:0;s:36:"post_types-attachment-not_in_sitemap";b:1;s:34:"taxonomies-category-not_in_sitemap";b:0;s:34:"taxonomies-post_tag-not_in_sitemap";b:0;s:37:"taxonomies-post_format-not_in_sitemap";b:1;s:38:"taxonomies-pattern-type-not_in_sitemap";b:1;s:36:"post_types-styleguide-not_in_sitemap";b:1;}', 'yes'),
(208, 'wpseo_social', 'a:15:{s:9:"fb_admins";a:0:{}s:6:"fbapps";a:0:{}s:12:"fbconnectkey";s:32:"b4eed68eaf97fa4fcdf3eaf929b494ce";s:13:"facebook_site";s:0:"";s:16:"og_default_image";s:0:"";s:18:"og_frontpage_title";s:0:"";s:17:"og_frontpage_desc";s:0:"";s:18:"og_frontpage_image";s:0:"";s:9:"opengraph";b:1;s:10:"googleplus";b:1;s:14:"plus-publisher";s:0:"";s:7:"twitter";b:1;s:12:"twitter_site";s:0:"";s:17:"twitter_card_type";s:7:"summary";s:10:"fbadminapp";i:0;}', 'yes'),
(209, 'wpseo_rss', 'a:1:{s:8:"rssafter";s:53:"The post %%POSTLINK%% appeared first on %%BLOGLINK%%.";}', 'yes'),
(211, 'acf_version', '5.2.5', 'yes'),
(213, 'typoIgnoreTags', 'code head kbd object option pre samp script style textarea title var math', 'yes'),
(214, 'typoIgnoreClasses', 'vcard noTypo', 'yes'),
(215, 'typoIgnoreIDs', '', 'yes'),
(216, 'typoEnableHyphenation', '', 'yes'),
(217, 'typoHyphenateLanguages', 'en-US', 'yes'),
(218, 'typoHyphenateHeadings', '', 'yes'),
(219, 'typoHyphenateTitleCase', '', 'yes'),
(220, 'typoHyphenateCaps', '', 'yes'),
(221, 'typoHyphenateMinLength', '5', 'yes'),
(222, 'typoHyphenateMinBefore', '3', 'yes'),
(223, 'typoHyphenateMinAfter', '2', 'yes'),
(224, 'typoHyphenateExceptions', 'KING-desk', 'yes'),
(225, 'typoSmartCharacters', '1', 'yes'),
(226, 'typoSmartQuotes', '1', 'yes'),
(227, 'typoSmartQuotesPrimary', 'doubleCurled', 'yes'),
(228, 'typoSmartQuotesSecondary', 'singleCurled', 'yes'),
(229, 'typoSmartDashes', '1', 'yes'),
(230, 'typoSmartEllipses', '1', 'yes'),
(231, 'typoSmartDiacritics', '1', 'yes'),
(232, 'typoDiacriticLanguages', 'en-US', 'yes'),
(233, 'typoDiacriticCustomReplacements', '"cooperate"=>"coöperate", "Cooperate"=>"Coöperate", "cooperation"=>"coöperation", "Cooperation"=>"Coöperation", "cooperative"=>"coöperative", "Cooperative"=>"Coöperative", "coordinate"=>"coördinate", "Coordinate"=>"Coördinate", "coordinated"=>"coördinated", "Coordinated"=>"Coördinated", "coordinating"=>"coördinating", "Coordinating"=>"Coördinating", "coordination"=>"coördination", "Coordination"=>"Coördination", "coordinator"=>"coördinator", "Coordinator"=>"Coördinator", "coordinators"=>"coördinators", "Coordinators"=>"Coördinators", "continuum"=>"continuüm", "Continuum"=>"Continuüm", "debacle"=>"débâcle", "Debacle"=>"Débâcle", "elite"=>"élite", "Elite"=>"Élite",', 'yes'),
(234, 'typoSmartMarks', '1', 'yes'),
(235, 'typoSmartMath', '', 'yes'),
(236, 'typoSmartFractions', '', 'yes'),
(237, 'typoSmartOrdinals', '1', 'yes'),
(238, 'typoSingleCharacterWordSpacing', '1', 'yes'),
(239, 'typoDashSpacing', '1', 'yes'),
(240, 'typoFractionSpacing', '1', 'yes'),
(241, 'typoSpaceCollapse', '', 'yes'),
(242, 'typoUnitSpacing', '', 'yes'),
(243, 'typoUnits', 'hectare fortnight', 'yes'),
(244, 'typoPreventWidows', '1', 'yes'),
(245, 'typoWidowMinLength', '5', 'yes'),
(246, 'typoWidowMaxPull', '5', 'yes'),
(247, 'typoWrapHyphens', '', 'yes'),
(248, 'typoWrapEmails', '', 'yes'),
(249, 'typoWrapURLs', '', 'yes'),
(250, 'typoWrapMinAfter', '3', 'yes'),
(251, 'typoRemoveIE6', '', 'yes'),
(252, 'typoStyleAmps', '', 'yes'),
(253, 'typoStyleCaps', '', 'yes'),
(254, 'typoStyleNumbers', '', 'yes'),
(255, 'typoStyleInitialQuotes', '', 'yes'),
(256, 'typoInitialQuoteTags', 'p h1 h2 h3 h4 h5 h6 blockquote li dd dt', 'yes'),
(257, 'typoStyleCSSInclude', '', 'yes'),
(258, 'typoStyleCSS', '', 'yes'),
(259, 'typoRestoreDefaults', '0', 'yes'),
(260, 'tadv_version', '4000', 'yes'),
(286, 'acf_repeater_ac', 'QJF7-L4IX-UCNP-RF2W', 'yes'),
(287, 'acf_gallery_ac', 'GF72-8ME6-JS15-3PZC', 'yes'),
(289, 'custom_image_sizes', '', 'yes'),
(297, 'wordfence_version', '5.2.5', 'yes'),
(298, 'wordfenceActivated', '0', 'yes'),
(299, 'wf_plugin_act_error', '', 'yes'),
(355, 'theme_mods_twentyeleven', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1352561452;s:4:"data";a:6:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}s:9:"sidebar-4";a:0:{}s:9:"sidebar-5";a:0:{}}}}', 'yes'),
(356, 'current_theme', '{{PROJECT NAME}} Theme', 'yes'),
(357, 'theme_mods_skeleton', 'a:3:{i:0;b:0;s:18:"nav_menu_locations";a:0:{}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1383308438;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:18:"orphaned_widgets_1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(358, 'theme_switched', '', 'yes'),
(431, 'post_snippets_options', 'a:18:{i:0;a:7:{s:5:"title";s:12:"Company Name";s:4:"vars";s:0:"";s:9:"shortcode";b:0;s:3:"php";b:0;s:11:"wptexturize";b:0;s:7:"snippet";s:12:"Company Name";s:11:"description";s:44:"Used in many locations, e.g. in Logo Tooltip";}i:1;a:7:{s:5:"title";s:14:"Company Slogan";s:4:"vars";s:0:"";s:9:"shortcode";b:0;s:3:"php";b:0;s:11:"wptexturize";b:0;s:7:"snippet";s:14:"Company Slogan";s:11:"description";s:47:"Visible in few places, e.g. in the Logo Tooltip";}i:2;a:7:{s:5:"title";s:8:"Previous";s:4:"vars";s:0:"";s:9:"shortcode";b:0;s:3:"php";b:0;s:11:"wptexturize";b:0;s:7:"snippet";s:8:"Previous";s:11:"description";s:0:"";}i:3;a:7:{s:5:"title";s:4:"Next";s:4:"vars";s:0:"";s:9:"shortcode";b:0;s:3:"php";b:0;s:11:"wptexturize";b:0;s:7:"snippet";s:4:"Next";s:11:"description";s:0:"";}i:4;a:7:{s:5:"title";s:13:"Older Article";s:4:"vars";s:0:"";s:9:"shortcode";b:0;s:3:"php";b:0;s:11:"wptexturize";b:0;s:7:"snippet";s:13:"Older Article";s:11:"description";s:24:"Visible at Article Pages";}i:5;a:7:{s:5:"title";s:14:"Older Articles";s:4:"vars";s:0:"";s:9:"shortcode";b:0;s:3:"php";b:0;s:11:"wptexturize";b:0;s:7:"snippet";s:14:"Older Articles";s:11:"description";s:62:"Visible at Article Listing pages (Search, Tags, Archives, etc)";}i:6;a:7:{s:5:"title";s:13:"Newer Article";s:4:"vars";s:0:"";s:9:"shortcode";b:0;s:3:"php";b:0;s:11:"wptexturize";b:0;s:7:"snippet";s:13:"Newer Article";s:11:"description";s:24:"Visible at Article Pages";}i:7;a:7:{s:5:"title";s:14:"Newer Articles";s:4:"vars";s:0:"";s:9:"shortcode";b:0;s:3:"php";b:0;s:11:"wptexturize";b:0;s:7:"snippet";s:14:"Newer Articles";s:11:"description";s:62:"Visible at Article Listing pages (Search, Tags, Archives, etc)";}i:8;a:7:{s:5:"title";s:19:"Find out more about";s:4:"vars";s:5:"title";s:9:"shortcode";b:0;s:3:"php";b:0;s:11:"wptexturize";b:0;s:7:"snippet";s:27:"Find out more about {title}";s:11:"description";s:0:"";}i:9;a:7:{s:5:"title";s:24:"Check out older articles";s:4:"vars";s:0:"";s:9:"shortcode";b:0;s:3:"php";b:0;s:11:"wptexturize";b:0;s:7:"snippet";s:0:"";s:11:"description";s:97:"Tooltip for _Older Articles_ link, visible at Article Listing pages (Search, Tags, Archives, etc)";}i:10;a:7:{s:5:"title";s:24:"Check out newer articles";s:4:"vars";s:0:"";s:9:"shortcode";b:0;s:3:"php";b:0;s:11:"wptexturize";b:0;s:7:"snippet";s:0:"";s:11:"description";s:97:"Tooltip for _Newer Articles_ link, visible at Article Listing pages (Search, Tags, Archives, etc)";}i:11;a:7:{s:5:"title";s:6:"Search";s:4:"vars";s:0:"";s:9:"shortcode";b:0;s:3:"php";b:0;s:11:"wptexturize";b:0;s:7:"snippet";s:6:"Search";s:11:"description";s:0:"";}i:12;a:7:{s:5:"title";s:10:"Written by";s:4:"vars";s:6:"author";s:9:"shortcode";b:0;s:3:"php";b:0;s:11:"wptexturize";b:0;s:7:"snippet";s:19:"Written by {author}";s:11:"description";s:28:"Metadata label for each post";}i:13;a:7:{s:5:"title";s:25:"Discover more articles by";s:4:"vars";s:6:"author";s:9:"shortcode";b:0;s:3:"php";b:0;s:11:"wptexturize";b:0;s:7:"snippet";s:34:"Discover more articles by {author}";s:11:"description";s:40:"Tooltip for metadata label for each post";}i:14;a:7:{s:5:"title";s:9:"posted on";s:4:"vars";s:0:"";s:9:"shortcode";b:0;s:3:"php";b:0;s:11:"wptexturize";b:0;s:7:"snippet";s:2:"on";s:11:"description";s:28:"Metadata label for each post";}i:15;a:7:{s:5:"title";s:9:"Tagged as";s:4:"vars";s:0:"";s:9:"shortcode";b:0;s:3:"php";b:0;s:11:"wptexturize";b:0;s:7:"snippet";s:9:"Tagged as";s:11:"description";s:23:"Tag label for each post";}i:16;a:7:{s:5:"title";s:23:"Proceed to full article";s:4:"vars";s:0:"";s:9:"shortcode";b:0;s:3:"php";b:0;s:11:"wptexturize";b:0;s:7:"snippet";s:23:"Proceed to full article";s:11:"description";s:0:"";}i:17;a:7:{s:5:"title";s:9:"Copyright";s:4:"vars";s:4:"year";s:9:"shortcode";b:0;s:3:"php";b:0;s:11:"wptexturize";b:0;s:7:"snippet";s:48:"©{year} Full Company Name. All rights reserved.";s:11:"description";s:0:"";}}', 'yes'),
(463, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(1146, 'rsa_options', 'a:7:{s:8:"approach";i:4;s:7:"message";s:34:"Access to this site is restricted.";s:13:"redirect_path";i:0;s:9:"head_code";i:307;s:12:"redirect_url";s:0:"";s:4:"page";i:5;s:7:"allowed";a:0:{}}', 'yes'),
(2864, 'wpseo_taxonomy_meta', 'a:0:{}', 'yes'),
(2888, 'category_children', 'a:3:{i:6;a:2:{i:0;i:9;i:1;i:10;}i:8;a:1:{i:0;i:11;}i:10;a:1:{i:0;i:12;}}', 'yes');
INSERT INTO `uo6g6en_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(2947, 'cpac_options', 'a:1:{s:7:"columns";a:10:{s:3:"acf";a:25:{s:11:"product-tag";a:3:{s:5:"state";s:2:"on";s:5:"label";s:43:"<div class="product product-tag">Tags</div>";s:5:"width";s:1:"0";}s:16:"product-category";a:3:{s:5:"state";s:2:"on";s:5:"label";s:54:"<div class="product product-category">Categories</div>";s:5:"width";s:1:"0";}s:14:"ame_page_order";a:3:{s:5:"state";s:2:"on";s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:5:"width";s:1:"0";}s:5:"title";a:3:{s:5:"state";s:2:"on";s:5:"label";s:5:"Title";s:5:"width";s:1:"0";}s:4:"date";a:3:{s:5:"state";s:2:"on";s:5:"label";s:4:"Date";s:5:"width";s:1:"0";}s:15:"ame_tag_actions";a:3:{s:5:"state";s:2:"on";s:5:"label";s:96:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Tags</abbr>";s:5:"width";s:1:"0";}s:16:"ame_post_actions";a:3:{s:5:"state";s:2:"on";s:5:"label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:5:"width";s:1:"0";}s:21:"column-featured_image";a:3:{s:5:"state";s:0:"";s:5:"label";s:14:"Featured Image";s:5:"width";s:0:"";}s:14:"column-excerpt";a:3:{s:5:"state";s:0:"";s:5:"label";s:7:"Excerpt";s:5:"width";s:0:"";}s:12:"column-order";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Page Order";s:5:"width";s:0:"";}s:19:"column-post_formats";a:3:{s:5:"state";s:0:"";s:5:"label";s:11:"Post Format";s:5:"width";s:0:"";}s:13:"column-postid";a:3:{s:5:"state";s:0:"";s:5:"label";s:2:"ID";s:5:"width";s:0:"";}s:16:"column-page-slug";a:3:{s:5:"state";s:0:"";s:5:"label";s:4:"Slug";s:5:"width";s:0:"";}s:17:"column-attachment";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Attachment";s:5:"width";s:0:"";}s:23:"column-attachment-count";a:3:{s:5:"state";s:0:"";s:5:"label";s:18:"No. of Attachments";s:5:"width";s:0:"";}s:12:"column-roles";a:3:{s:5:"state";s:0:"";s:5:"label";s:5:"Roles";s:5:"width";s:0:"";}s:13:"column-status";a:3:{s:5:"state";s:0:"";s:5:"label";s:6:"Status";s:5:"width";s:0:"";}s:21:"column-comment-status";a:3:{s:5:"state";s:0:"";s:5:"label";s:14:"Comment status";s:5:"width";s:0:"";}s:18:"column-ping-status";a:3:{s:5:"state";s:0:"";s:5:"label";s:11:"Ping status";s:5:"width";s:0:"";}s:14:"column-actions";a:3:{s:5:"state";s:0:"";s:5:"label";s:7:"Actions";s:5:"width";s:0:"";}s:15:"column-modified";a:3:{s:5:"state";s:0:"";s:5:"label";s:13:"Last modified";s:5:"width";s:0:"";}s:20:"column-comment-count";a:3:{s:5:"state";s:0:"";s:5:"label";s:13:"Comment count";s:5:"width";s:0:"";}s:18:"column-author-name";a:4:{s:5:"state";s:0:"";s:5:"label";s:17:"Display Author As";s:5:"width";s:0:"";s:10:"display_as";s:12:"display_name";}s:21:"column-before-moretag";a:3:{s:5:"state";s:0:"";s:5:"label";s:15:"Before More Tag";s:5:"width";s:0:"";}s:13:"column-meta-1";a:7:{s:5:"state";s:0:"";s:5:"label";s:12:"Custom Field";s:5:"width";s:0:"";s:5:"field";s:8:"allorany";s:10:"field_type";s:0:"";s:6:"before";s:0:"";s:5:"after";s:0:"";}}s:4:"news";a:31:{s:11:"product-tag";a:3:{s:5:"state";s:2:"on";s:5:"label";s:43:"<div class="product product-tag">Tags</div>";s:5:"width";s:1:"0";}s:16:"product-category";a:3:{s:5:"state";s:2:"on";s:5:"label";s:54:"<div class="product product-category">Categories</div>";s:5:"width";s:1:"0";}s:14:"ame_page_order";a:3:{s:5:"state";s:2:"on";s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:5:"width";s:1:"0";}s:5:"title";a:3:{s:5:"state";s:2:"on";s:5:"label";s:5:"Title";s:5:"width";s:1:"0";}s:8:"comments";a:3:{s:5:"state";s:2:"on";s:5:"label";s:115:"<span class="vers"><img alt="Comments" src="http://wordpress.loc/wp-admin/images/comment-grey-bubble.png" /></span>";s:5:"width";s:1:"0";}s:4:"date";a:3:{s:5:"state";s:2:"on";s:5:"label";s:4:"Date";s:5:"width";s:1:"0";}s:15:"ame_cat_actions";a:3:{s:5:"state";s:2:"on";s:5:"label";s:102:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Categories</abbr>";s:5:"width";s:1:"0";}s:15:"ame_tag_actions";a:3:{s:5:"state";s:2:"on";s:5:"label";s:96:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Tags</abbr>";s:5:"width";s:1:"0";}s:16:"ame_post_actions";a:3:{s:5:"state";s:2:"on";s:5:"label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:5:"width";s:1:"0";}s:11:"wpseo-score";a:3:{s:5:"state";s:2:"on";s:5:"label";s:3:"SEO";s:5:"width";s:1:"0";}s:11:"wpseo-title";a:3:{s:5:"state";s:0:"";s:5:"label";s:9:"SEO Title";s:5:"width";s:1:"0";}s:14:"wpseo-metadesc";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Meta Desc.";s:5:"width";s:1:"0";}s:13:"wpseo-focuskw";a:3:{s:5:"state";s:0:"";s:5:"label";s:8:"Focus KW";s:5:"width";s:1:"0";}s:21:"column-featured_image";a:3:{s:5:"state";s:0:"";s:5:"label";s:14:"Featured Image";s:5:"width";s:0:"";}s:14:"column-excerpt";a:3:{s:5:"state";s:0:"";s:5:"label";s:7:"Excerpt";s:5:"width";s:0:"";}s:12:"column-order";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Page Order";s:5:"width";s:0:"";}s:19:"column-post_formats";a:3:{s:5:"state";s:0:"";s:5:"label";s:11:"Post Format";s:5:"width";s:0:"";}s:13:"column-postid";a:3:{s:5:"state";s:2:"on";s:5:"label";s:2:"ID";s:5:"width";s:0:"";}s:16:"column-page-slug";a:3:{s:5:"state";s:0:"";s:5:"label";s:4:"Slug";s:5:"width";s:0:"";}s:17:"column-attachment";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Attachment";s:5:"width";s:0:"";}s:23:"column-attachment-count";a:3:{s:5:"state";s:0:"";s:5:"label";s:18:"No. of Attachments";s:5:"width";s:0:"";}s:12:"column-roles";a:3:{s:5:"state";s:0:"";s:5:"label";s:5:"Roles";s:5:"width";s:0:"";}s:13:"column-status";a:3:{s:5:"state";s:0:"";s:5:"label";s:6:"Status";s:5:"width";s:0:"";}s:21:"column-comment-status";a:3:{s:5:"state";s:0:"";s:5:"label";s:14:"Comment status";s:5:"width";s:0:"";}s:18:"column-ping-status";a:3:{s:5:"state";s:0:"";s:5:"label";s:11:"Ping status";s:5:"width";s:0:"";}s:14:"column-actions";a:3:{s:5:"state";s:0:"";s:5:"label";s:7:"Actions";s:5:"width";s:0:"";}s:15:"column-modified";a:3:{s:5:"state";s:0:"";s:5:"label";s:13:"Last modified";s:5:"width";s:0:"";}s:20:"column-comment-count";a:3:{s:5:"state";s:0:"";s:5:"label";s:13:"Comment count";s:5:"width";s:0:"";}s:18:"column-author-name";a:4:{s:5:"state";s:0:"";s:5:"label";s:17:"Display Author As";s:5:"width";s:0:"";s:10:"display_as";s:12:"display_name";}s:21:"column-before-moretag";a:3:{s:5:"state";s:0:"";s:5:"label";s:15:"Before More Tag";s:5:"width";s:0:"";}s:17:"column-word-count";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Word count";s:5:"width";s:0:"";}}s:9:"homeslide";a:25:{s:11:"product-tag";a:3:{s:5:"state";s:2:"on";s:5:"label";s:43:"<div class="product product-tag">Tags</div>";s:5:"width";s:1:"0";}s:16:"product-category";a:3:{s:5:"state";s:2:"on";s:5:"label";s:54:"<div class="product product-category">Categories</div>";s:5:"width";s:1:"0";}s:14:"ame_page_order";a:3:{s:5:"state";s:2:"on";s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:5:"width";s:1:"0";}s:12:"column-order";a:3:{s:5:"state";s:2:"on";s:5:"label";s:7:"ReOrder";s:5:"width";s:1:"5";}s:5:"title";a:3:{s:5:"state";s:2:"on";s:5:"label";s:5:"Title";s:5:"width";s:1:"0";}s:4:"date";a:3:{s:5:"state";s:2:"on";s:5:"label";s:4:"Date";s:5:"width";s:1:"0";}s:15:"ame_tag_actions";a:3:{s:5:"state";s:2:"on";s:5:"label";s:96:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Tags</abbr>";s:5:"width";s:1:"0";}s:16:"ame_post_actions";a:3:{s:5:"state";s:2:"on";s:5:"label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:5:"width";s:1:"0";}s:21:"column-featured_image";a:3:{s:5:"state";s:0:"";s:5:"label";s:14:"Featured Image";s:5:"width";s:0:"";}s:14:"column-excerpt";a:3:{s:5:"state";s:0:"";s:5:"label";s:7:"Excerpt";s:5:"width";s:0:"";}s:19:"column-post_formats";a:3:{s:5:"state";s:0:"";s:5:"label";s:11:"Post Format";s:5:"width";s:0:"";}s:13:"column-postid";a:3:{s:5:"state";s:2:"on";s:5:"label";s:2:"ID";s:5:"width";s:0:"";}s:16:"column-page-slug";a:3:{s:5:"state";s:0:"";s:5:"label";s:4:"Slug";s:5:"width";s:0:"";}s:17:"column-attachment";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Attachment";s:5:"width";s:0:"";}s:23:"column-attachment-count";a:3:{s:5:"state";s:0:"";s:5:"label";s:18:"No. of Attachments";s:5:"width";s:0:"";}s:12:"column-roles";a:3:{s:5:"state";s:0:"";s:5:"label";s:5:"Roles";s:5:"width";s:0:"";}s:13:"column-status";a:3:{s:5:"state";s:0:"";s:5:"label";s:6:"Status";s:5:"width";s:0:"";}s:21:"column-comment-status";a:3:{s:5:"state";s:0:"";s:5:"label";s:14:"Comment status";s:5:"width";s:0:"";}s:18:"column-ping-status";a:3:{s:5:"state";s:0:"";s:5:"label";s:11:"Ping status";s:5:"width";s:0:"";}s:14:"column-actions";a:3:{s:5:"state";s:0:"";s:5:"label";s:7:"Actions";s:5:"width";s:0:"";}s:15:"column-modified";a:3:{s:5:"state";s:0:"";s:5:"label";s:13:"Last modified";s:5:"width";s:0:"";}s:20:"column-comment-count";a:3:{s:5:"state";s:0:"";s:5:"label";s:13:"Comment count";s:5:"width";s:0:"";}s:18:"column-author-name";a:4:{s:5:"state";s:0:"";s:5:"label";s:17:"Display Author As";s:5:"width";s:0:"";s:10:"display_as";s:12:"display_name";}s:21:"column-before-moretag";a:3:{s:5:"state";s:0:"";s:5:"label";s:15:"Before More Tag";s:5:"width";s:0:"";}s:13:"column-meta-1";a:7:{s:5:"state";s:0:"";s:5:"label";s:12:"Custom Field";s:5:"width";s:0:"";s:5:"field";s:16:"destination_link";s:10:"field_type";s:0:"";s:6:"before";s:0:"";s:5:"after";s:0:"";}}s:8:"products";a:32:{s:5:"title";a:3:{s:5:"state";s:2:"on";s:5:"label";s:5:"Title";s:5:"width";s:1:"0";}s:4:"date";a:3:{s:5:"state";s:2:"on";s:5:"label";s:4:"Date";s:5:"width";s:1:"0";}s:16:"ame_post_actions";a:3:{s:5:"state";s:2:"on";s:5:"label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:5:"width";s:1:"0";}s:11:"wpseo-score";a:3:{s:5:"state";s:2:"on";s:5:"label";s:3:"SEO";s:5:"width";s:1:"0";}s:16:"product-category";a:3:{s:5:"state";s:2:"on";s:5:"label";s:55:"<div class="products product-category">Categories</div>";s:5:"width";s:1:"0";}s:11:"product-tag";a:3:{s:5:"state";s:2:"on";s:5:"label";s:44:"<div class="products product-tag">Tags</div>";s:5:"width";s:1:"0";}s:14:"ame_page_order";a:3:{s:5:"state";s:2:"on";s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:5:"width";s:1:"0";}s:8:"comments";a:3:{s:5:"state";s:0:"";s:5:"label";s:115:"<span class="vers"><img alt="Comments" src="http://wordpress.loc/wp-admin/images/comment-grey-bubble.png" /></span>";s:5:"width";s:1:"0";}s:11:"wpseo-title";a:3:{s:5:"state";s:0:"";s:5:"label";s:9:"SEO Title";s:5:"width";s:1:"0";}s:14:"wpseo-metadesc";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Meta Desc.";s:5:"width";s:1:"0";}s:13:"wpseo-focuskw";a:3:{s:5:"state";s:0:"";s:5:"label";s:8:"Focus KW";s:5:"width";s:1:"0";}s:21:"column-featured_image";a:3:{s:5:"state";s:0:"";s:5:"label";s:14:"Featured Image";s:5:"width";s:0:"";}s:14:"column-excerpt";a:3:{s:5:"state";s:0:"";s:5:"label";s:7:"Excerpt";s:5:"width";s:0:"";}s:12:"column-order";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Page Order";s:5:"width";s:0:"";}s:15:"ame_tag_actions";a:3:{s:5:"state";s:0:"";s:5:"label";s:96:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Tags</abbr>";s:5:"width";s:1:"0";}s:19:"column-post_formats";a:3:{s:5:"state";s:0:"";s:5:"label";s:11:"Post Format";s:5:"width";s:0:"";}s:13:"column-postid";a:3:{s:5:"state";s:0:"";s:5:"label";s:2:"ID";s:5:"width";s:0:"";}s:16:"column-page-slug";a:3:{s:5:"state";s:0:"";s:5:"label";s:4:"Slug";s:5:"width";s:0:"";}s:17:"column-attachment";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Attachment";s:5:"width";s:0:"";}s:23:"column-attachment-count";a:3:{s:5:"state";s:0:"";s:5:"label";s:18:"No. of Attachments";s:5:"width";s:0:"";}s:12:"column-roles";a:3:{s:5:"state";s:0:"";s:5:"label";s:5:"Roles";s:5:"width";s:0:"";}s:13:"column-status";a:3:{s:5:"state";s:0:"";s:5:"label";s:6:"Status";s:5:"width";s:0:"";}s:21:"column-comment-status";a:3:{s:5:"state";s:0:"";s:5:"label";s:14:"Comment status";s:5:"width";s:0:"";}s:18:"column-ping-status";a:3:{s:5:"state";s:0:"";s:5:"label";s:11:"Ping status";s:5:"width";s:0:"";}s:14:"column-actions";a:3:{s:5:"state";s:0:"";s:5:"label";s:7:"Actions";s:5:"width";s:0:"";}s:15:"column-modified";a:3:{s:5:"state";s:0:"";s:5:"label";s:13:"Last modified";s:5:"width";s:0:"";}s:20:"column-comment-count";a:3:{s:5:"state";s:0:"";s:5:"label";s:13:"Comment count";s:5:"width";s:0:"";}s:18:"column-author-name";a:4:{s:5:"state";s:0:"";s:5:"label";s:17:"Display Author As";s:5:"width";s:0:"";s:10:"display_as";s:12:"display_name";}s:21:"column-before-moretag";a:3:{s:5:"state";s:0:"";s:5:"label";s:15:"Before More Tag";s:5:"width";s:0:"";}s:17:"column-word-count";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Word count";s:5:"width";s:0:"";}s:32:"column-taxonomy-product-category";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Categories";s:5:"width";s:0:"";}s:27:"column-taxonomy-product-tag";a:3:{s:5:"state";s:0:"";s:5:"label";s:4:"Tags";s:5:"width";s:0:"";}}s:4:"post";a:33:{s:11:"product-tag";a:3:{s:5:"state";s:2:"on";s:5:"label";s:43:"<div class="product product-tag">Tags</div>";s:5:"width";s:1:"0";}s:16:"product-category";a:3:{s:5:"state";s:2:"on";s:5:"label";s:54:"<div class="product product-category">Categories</div>";s:5:"width";s:1:"0";}s:14:"ame_page_order";a:3:{s:5:"state";s:2:"on";s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:5:"width";s:1:"0";}s:5:"title";a:3:{s:5:"state";s:2:"on";s:5:"label";s:5:"Title";s:5:"width";s:1:"0";}s:6:"author";a:3:{s:5:"state";s:2:"on";s:5:"label";s:6:"Author";s:5:"width";s:1:"0";}s:8:"comments";a:3:{s:5:"state";s:2:"on";s:5:"label";s:115:"<span class="vers"><img alt="Comments" src="http://wordpress.loc/wp-admin/images/comment-grey-bubble.png" /></span>";s:5:"width";s:1:"0";}s:4:"date";a:3:{s:5:"state";s:2:"on";s:5:"label";s:4:"Date";s:5:"width";s:1:"0";}s:15:"ame_cat_actions";a:3:{s:5:"state";s:2:"on";s:5:"label";s:102:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Categories</abbr>";s:5:"width";s:1:"0";}s:15:"ame_tag_actions";a:3:{s:5:"state";s:2:"on";s:5:"label";s:96:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Tags</abbr>";s:5:"width";s:1:"0";}s:16:"ame_post_actions";a:3:{s:5:"state";s:2:"on";s:5:"label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:5:"width";s:1:"0";}s:11:"wpseo-score";a:3:{s:5:"state";s:2:"on";s:5:"label";s:3:"SEO";s:5:"width";s:1:"0";}s:11:"wpseo-title";a:3:{s:5:"state";s:2:"on";s:5:"label";s:9:"SEO Title";s:5:"width";s:1:"0";}s:14:"wpseo-metadesc";a:3:{s:5:"state";s:2:"on";s:5:"label";s:10:"Meta Desc.";s:5:"width";s:1:"0";}s:13:"wpseo-focuskw";a:3:{s:5:"state";s:2:"on";s:5:"label";s:8:"Focus KW";s:5:"width";s:1:"0";}s:21:"column-featured_image";a:3:{s:5:"state";s:0:"";s:5:"label";s:14:"Featured Image";s:5:"width";s:0:"";}s:14:"column-excerpt";a:3:{s:5:"state";s:0:"";s:5:"label";s:7:"Excerpt";s:5:"width";s:0:"";}s:12:"column-order";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Page Order";s:5:"width";s:0:"";}s:19:"column-post_formats";a:3:{s:5:"state";s:0:"";s:5:"label";s:11:"Post Format";s:5:"width";s:0:"";}s:13:"column-postid";a:3:{s:5:"state";s:0:"";s:5:"label";s:2:"ID";s:5:"width";s:0:"";}s:16:"column-page-slug";a:3:{s:5:"state";s:0:"";s:5:"label";s:4:"Slug";s:5:"width";s:0:"";}s:17:"column-attachment";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Attachment";s:5:"width";s:0:"";}s:23:"column-attachment-count";a:3:{s:5:"state";s:0:"";s:5:"label";s:18:"No. of Attachments";s:5:"width";s:0:"";}s:12:"column-roles";a:3:{s:5:"state";s:0:"";s:5:"label";s:5:"Roles";s:5:"width";s:0:"";}s:13:"column-status";a:3:{s:5:"state";s:0:"";s:5:"label";s:6:"Status";s:5:"width";s:0:"";}s:21:"column-comment-status";a:3:{s:5:"state";s:0:"";s:5:"label";s:14:"Comment status";s:5:"width";s:0:"";}s:18:"column-ping-status";a:3:{s:5:"state";s:0:"";s:5:"label";s:11:"Ping status";s:5:"width";s:0:"";}s:14:"column-actions";a:3:{s:5:"state";s:0:"";s:5:"label";s:7:"Actions";s:5:"width";s:0:"";}s:15:"column-modified";a:3:{s:5:"state";s:0:"";s:5:"label";s:13:"Last modified";s:5:"width";s:0:"";}s:20:"column-comment-count";a:3:{s:5:"state";s:0:"";s:5:"label";s:13:"Comment count";s:5:"width";s:0:"";}s:18:"column-author-name";a:4:{s:5:"state";s:0:"";s:5:"label";s:17:"Display Author As";s:5:"width";s:0:"";s:10:"display_as";s:12:"display_name";}s:21:"column-before-moretag";a:3:{s:5:"state";s:0:"";s:5:"label";s:15:"Before More Tag";s:5:"width";s:0:"";}s:17:"column-word-count";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Word count";s:5:"width";s:0:"";}s:13:"column-sticky";a:3:{s:5:"state";s:0:"";s:5:"label";s:6:"Sticky";s:5:"width";s:0:"";}}s:4:"page";a:31:{s:11:"product-tag";a:3:{s:5:"state";s:2:"on";s:5:"label";s:43:"<div class="product product-tag">Tags</div>";s:5:"width";s:1:"0";}s:16:"product-category";a:3:{s:5:"state";s:2:"on";s:5:"label";s:54:"<div class="product product-category">Categories</div>";s:5:"width";s:1:"0";}s:14:"ame_page_order";a:3:{s:5:"state";s:2:"on";s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:5:"width";s:1:"0";}s:5:"title";a:3:{s:5:"state";s:2:"on";s:5:"label";s:5:"Title";s:5:"width";s:1:"0";}s:6:"author";a:3:{s:5:"state";s:2:"on";s:5:"label";s:6:"Author";s:5:"width";s:1:"0";}s:8:"comments";a:3:{s:5:"state";s:0:"";s:5:"label";s:115:"<span class="vers"><img alt="Comments" src="http://wordpress.loc/wp-admin/images/comment-grey-bubble.png" /></span>";s:5:"width";s:1:"0";}s:4:"date";a:3:{s:5:"state";s:2:"on";s:5:"label";s:4:"Date";s:5:"width";s:1:"0";}s:16:"ame_page_actions";a:3:{s:5:"state";s:2:"on";s:5:"label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:5:"width";s:1:"0";}s:11:"wpseo-score";a:3:{s:5:"state";s:2:"on";s:5:"label";s:3:"SEO";s:5:"width";s:1:"0";}s:11:"wpseo-title";a:3:{s:5:"state";s:0:"";s:5:"label";s:9:"SEO Title";s:5:"width";s:1:"0";}s:14:"wpseo-metadesc";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Meta Desc.";s:5:"width";s:1:"0";}s:13:"wpseo-focuskw";a:3:{s:5:"state";s:0:"";s:5:"label";s:8:"Focus KW";s:5:"width";s:1:"0";}s:21:"column-featured_image";a:3:{s:5:"state";s:0:"";s:5:"label";s:14:"Featured Image";s:5:"width";s:0:"";}s:14:"column-excerpt";a:3:{s:5:"state";s:0:"";s:5:"label";s:7:"Excerpt";s:5:"width";s:0:"";}s:12:"column-order";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Page Order";s:5:"width";s:0:"";}s:19:"column-post_formats";a:3:{s:5:"state";s:0:"";s:5:"label";s:11:"Post Format";s:5:"width";s:0:"";}s:13:"column-postid";a:3:{s:5:"state";s:2:"on";s:5:"label";s:2:"ID";s:5:"width";s:0:"";}s:16:"column-page-slug";a:3:{s:5:"state";s:0:"";s:5:"label";s:4:"Slug";s:5:"width";s:0:"";}s:17:"column-attachment";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Attachment";s:5:"width";s:0:"";}s:23:"column-attachment-count";a:3:{s:5:"state";s:0:"";s:5:"label";s:18:"No. of Attachments";s:5:"width";s:0:"";}s:12:"column-roles";a:3:{s:5:"state";s:0:"";s:5:"label";s:5:"Roles";s:5:"width";s:0:"";}s:13:"column-status";a:3:{s:5:"state";s:0:"";s:5:"label";s:6:"Status";s:5:"width";s:0:"";}s:21:"column-comment-status";a:3:{s:5:"state";s:0:"";s:5:"label";s:14:"Comment status";s:5:"width";s:0:"";}s:18:"column-ping-status";a:3:{s:5:"state";s:0:"";s:5:"label";s:11:"Ping status";s:5:"width";s:0:"";}s:14:"column-actions";a:3:{s:5:"state";s:0:"";s:5:"label";s:7:"Actions";s:5:"width";s:0:"";}s:15:"column-modified";a:3:{s:5:"state";s:0:"";s:5:"label";s:13:"Last modified";s:5:"width";s:0:"";}s:20:"column-comment-count";a:3:{s:5:"state";s:0:"";s:5:"label";s:13:"Comment count";s:5:"width";s:0:"";}s:18:"column-author-name";a:4:{s:5:"state";s:0:"";s:5:"label";s:17:"Display Author As";s:5:"width";s:0:"";s:10:"display_as";s:12:"display_name";}s:21:"column-before-moretag";a:3:{s:5:"state";s:0:"";s:5:"label";s:15:"Before More Tag";s:5:"width";s:0:"";}s:17:"column-word-count";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Word count";s:5:"width";s:0:"";}s:20:"column-page-template";a:3:{s:5:"state";s:0:"";s:5:"label";s:13:"Page Template";s:5:"width";s:0:"";}}s:8:"wp-users";a:20:{s:30:"column-user_postcount-products";a:3:{s:5:"state";s:0:"";s:5:"label";s:15:"No. of Products";s:5:"width";s:0:"";}s:8:"username";a:3:{s:5:"state";s:2:"on";s:5:"label";s:8:"Username";s:5:"width";s:1:"0";}s:4:"name";a:3:{s:5:"state";s:2:"on";s:5:"label";s:4:"Name";s:5:"width";s:1:"0";}s:5:"email";a:3:{s:5:"state";s:2:"on";s:5:"label";s:6:"E-mail";s:5:"width";s:1:"0";}s:4:"role";a:3:{s:5:"state";s:2:"on";s:5:"label";s:4:"Role";s:5:"width";s:1:"0";}s:5:"posts";a:3:{s:5:"state";s:2:"on";s:5:"label";s:5:"Posts";s:5:"width";s:1:"0";}s:14:"column-user_id";a:3:{s:5:"state";s:0:"";s:5:"label";s:7:"User ID";s:5:"width";s:0:"";}s:15:"column-nickname";a:3:{s:5:"state";s:0:"";s:5:"label";s:8:"Nickname";s:5:"width";s:0:"";}s:17:"column-first_name";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"First name";s:5:"width";s:0:"";}s:16:"column-last_name";a:3:{s:5:"state";s:0:"";s:5:"label";s:9:"Last name";s:5:"width";s:0:"";}s:15:"column-user_url";a:3:{s:5:"state";s:0:"";s:5:"label";s:3:"Url";s:5:"width";s:0:"";}s:22:"column-user_registered";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Registered";s:5:"width";s:0:"";}s:23:"column-user_description";a:3:{s:5:"state";s:0:"";s:5:"label";s:11:"Description";s:5:"width";s:0:"";}s:14:"column-actions";a:3:{s:5:"state";s:0:"";s:5:"label";s:7:"Actions";s:5:"width";s:0:"";}s:25:"column-user_postcount-acf";a:3:{s:5:"state";s:0:"";s:5:"label";s:20:"No. of Field Groups";s:5:"width";s:0:"";}s:26:"column-user_postcount-news";a:3:{s:5:"state";s:0:"";s:5:"label";s:11:"No. of News";s:5:"width";s:0:"";}s:31:"column-user_postcount-homeslide";a:3:{s:5:"state";s:0:"";s:5:"label";s:18:"No. of Home Slides";s:5:"width";s:0:"";}s:26:"column-user_postcount-post";a:3:{s:5:"state";s:0:"";s:5:"label";s:12:"No. of Posts";s:5:"width";s:0:"";}s:26:"column-user_postcount-page";a:3:{s:5:"state";s:0:"";s:5:"label";s:12:"No. of Pages";s:5:"width";s:0:"";}s:13:"column-meta-1";a:7:{s:5:"state";s:0:"";s:5:"label";s:12:"Custom Field";s:5:"width";s:0:"";s:5:"field";s:11:"admin_color";s:10:"field_type";s:0:"";s:6:"before";s:0:"";s:5:"after";s:0:"";}}s:8:"wp-media";a:20:{s:4:"icon";a:3:{s:5:"state";s:2:"on";s:5:"label";s:0:"";s:5:"width";s:1:"0";}s:5:"title";a:3:{s:5:"state";s:2:"on";s:5:"label";s:4:"File";s:5:"width";s:1:"0";}s:6:"author";a:3:{s:5:"state";s:2:"on";s:5:"label";s:6:"Author";s:5:"width";s:1:"0";}s:6:"parent";a:3:{s:5:"state";s:2:"on";s:5:"label";s:11:"Attached to";s:5:"width";s:1:"0";}s:8:"comments";a:3:{s:5:"state";s:2:"on";s:5:"label";s:115:"<span class="vers"><img alt="Comments" src="http://wordpress.loc/wp-admin/images/comment-grey-bubble.png" /></span>";s:5:"width";s:1:"0";}s:4:"date";a:3:{s:5:"state";s:2:"on";s:5:"label";s:4:"Date";s:5:"width";s:1:"0";}s:14:"ame_media_desc";a:3:{s:5:"state";s:2:"on";s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Description</abbr>";s:5:"width";s:1:"0";}s:15:"ame_media_order";a:3:{s:5:"state";s:2:"on";s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Media Order</abbr>";s:5:"width";s:1:"0";}s:14:"column-mediaid";a:3:{s:5:"state";s:0:"";s:5:"label";s:2:"ID";s:5:"width";s:0:"";}s:16:"column-mime_type";a:3:{s:5:"state";s:0:"";s:5:"label";s:9:"Mime type";s:5:"width";s:0:"";}s:16:"column-file_name";a:3:{s:5:"state";s:0:"";s:5:"label";s:9:"File name";s:5:"width";s:0:"";}s:17:"column-dimensions";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Dimensions";s:5:"width";s:0:"";}s:13:"column-height";a:3:{s:5:"state";s:0:"";s:5:"label";s:6:"Height";s:5:"width";s:0:"";}s:12:"column-width";a:3:{s:5:"state";s:0:"";s:5:"label";s:5:"Width";s:5:"width";s:0:"";}s:14:"column-caption";a:3:{s:5:"state";s:0:"";s:5:"label";s:7:"Caption";s:5:"width";s:0:"";}s:18:"column-description";a:3:{s:5:"state";s:0:"";s:5:"label";s:11:"Description";s:5:"width";s:0:"";}s:21:"column-alternate_text";a:3:{s:5:"state";s:0:"";s:5:"label";s:3:"Alt";s:5:"width";s:0:"";}s:17:"column-file_paths";a:3:{s:5:"state";s:0:"";s:5:"label";s:12:"Upload paths";s:5:"width";s:0:"";}s:14:"column-actions";a:3:{s:5:"state";s:0:"";s:5:"label";s:7:"Actions";s:5:"width";s:0:"";}s:15:"column-filesize";a:3:{s:5:"state";s:0:"";s:5:"label";s:9:"File size";s:5:"width";s:0:"";}}s:8:"wp-links";a:15:{s:4:"name";a:3:{s:5:"state";s:2:"on";s:5:"label";s:4:"Name";s:5:"width";s:1:"0";}s:3:"url";a:3:{s:5:"state";s:2:"on";s:5:"label";s:3:"URL";s:5:"width";s:1:"0";}s:10:"categories";a:3:{s:5:"state";s:2:"on";s:5:"label";s:10:"Categories";s:5:"width";s:1:"0";}s:3:"rel";a:3:{s:5:"state";s:2:"on";s:5:"label";s:12:"Relationship";s:5:"width";s:1:"0";}s:7:"visible";a:3:{s:5:"state";s:2:"on";s:5:"label";s:7:"Visible";s:5:"width";s:1:"0";}s:6:"rating";a:3:{s:5:"state";s:2:"on";s:5:"label";s:6:"Rating";s:5:"width";s:1:"0";}s:14:"column-link_id";a:3:{s:5:"state";s:0:"";s:5:"label";s:2:"ID";s:5:"width";s:0:"";}s:18:"column-description";a:3:{s:5:"state";s:0:"";s:5:"label";s:11:"Description";s:5:"width";s:0:"";}s:12:"column-image";a:3:{s:5:"state";s:0:"";s:5:"label";s:5:"Image";s:5:"width";s:0:"";}s:13:"column-target";a:3:{s:5:"state";s:0:"";s:5:"label";s:6:"Target";s:5:"width";s:0:"";}s:12:"column-owner";a:3:{s:5:"state";s:0:"";s:5:"label";s:5:"Owner";s:5:"width";s:0:"";}s:12:"column-notes";a:3:{s:5:"state";s:0:"";s:5:"label";s:5:"Notes";s:5:"width";s:0:"";}s:10:"column-rss";a:3:{s:5:"state";s:0:"";s:5:"label";s:3:"Rss";s:5:"width";s:0:"";}s:13:"column-length";a:3:{s:5:"state";s:0:"";s:5:"label";s:6:"Length";s:5:"width";s:0:"";}s:14:"column-actions";a:3:{s:5:"state";s:0:"";s:5:"label";s:7:"Actions";s:5:"width";s:0:"";}}s:11:"wp-comments";a:17:{s:6:"author";a:3:{s:5:"state";s:2:"on";s:5:"label";s:6:"Author";s:5:"width";s:1:"0";}s:7:"comment";a:3:{s:5:"state";s:2:"on";s:5:"label";s:7:"Comment";s:5:"width";s:1:"0";}s:8:"response";a:3:{s:5:"state";s:2:"on";s:5:"label";s:14:"In Response To";s:5:"width";s:1:"0";}s:17:"column-comment_id";a:3:{s:5:"state";s:0:"";s:5:"label";s:2:"ID";s:5:"width";s:0:"";}s:20:"column-author_author";a:3:{s:5:"state";s:0:"";s:5:"label";s:11:"Author Name";s:5:"width";s:0:"";}s:20:"column-author_avatar";a:3:{s:5:"state";s:0:"";s:5:"label";s:6:"Avatar";s:5:"width";s:0:"";}s:17:"column-author_url";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Author url";s:5:"width";s:0:"";}s:16:"column-author_ip";a:3:{s:5:"state";s:0:"";s:5:"label";s:9:"Author IP";s:5:"width";s:0:"";}s:19:"column-author_email";a:3:{s:5:"state";s:0:"";s:5:"label";s:12:"Author email";s:5:"width";s:0:"";}s:15:"column-reply_to";a:3:{s:5:"state";s:0:"";s:5:"label";s:11:"In Reply To";s:5:"width";s:0:"";}s:15:"column-approved";a:3:{s:5:"state";s:0:"";s:5:"label";s:8:"Approved";s:5:"width";s:0:"";}s:11:"column-date";a:3:{s:5:"state";s:0:"";s:5:"label";s:4:"Date";s:5:"width";s:0:"";}s:15:"column-date_gmt";a:3:{s:5:"state";s:0:"";s:5:"label";s:8:"Date GMT";s:5:"width";s:0:"";}s:12:"column-agent";a:3:{s:5:"state";s:0:"";s:5:"label";s:5:"Agent";s:5:"width";s:0:"";}s:14:"column-excerpt";a:3:{s:5:"state";s:0:"";s:5:"label";s:7:"Excerpt";s:5:"width";s:0:"";}s:14:"column-actions";a:3:{s:5:"state";s:0:"";s:5:"label";s:7:"Actions";s:5:"width";s:0:"";}s:17:"column-word-count";a:3:{s:5:"state";s:0:"";s:5:"label";s:10:"Word count";s:5:"width";s:0:"";}}}}', 'yes');
INSERT INTO `uo6g6en_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(2950, 'cpac_options_default', 'a:10:{s:3:"acf";a:7:{s:11:"product-tag";a:3:{s:5:"label";s:44:"<div class=''products product-tag''>Tags</div>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:44:"<div class=''products product-tag''>Tags</div>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:16:"product-category";a:3:{s:5:"label";s:55:"<div class=''products product-category''>Categories</div>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:55:"<div class=''products product-category''>Categories</div>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:5:"title";a:3:{s:5:"label";s:5:"Title";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:5:"Title";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:4:"date";a:3:{s:5:"label";s:4:"Date";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:4:"Date";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:15:"ame_tag_actions";a:3:{s:5:"label";s:96:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Tags</abbr>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:96:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Tags</abbr>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:16:"ame_post_actions";a:3:{s:5:"label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:14:"ame_page_order";a:3:{s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}}s:4:"news";a:13:{s:11:"product-tag";a:3:{s:5:"label";s:44:"<div class=''products product-tag''>Tags</div>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:44:"<div class=''products product-tag''>Tags</div>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:16:"product-category";a:3:{s:5:"label";s:55:"<div class=''products product-category''>Categories</div>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:55:"<div class=''products product-category''>Categories</div>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:5:"title";a:3:{s:5:"label";s:5:"Title";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:5:"Title";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:8:"comments";a:3:{s:5:"label";s:115:"<span class="vers"><img alt="Comments" src="http://wordpress.loc/wp-admin/images/comment-grey-bubble.png" /></span>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:8:"Comments";s:12:"hide_options";b:1;s:5:"class";s:18:"cpac-box-wp-native";}}s:4:"date";a:3:{s:5:"label";s:4:"Date";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:4:"Date";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:15:"ame_cat_actions";a:3:{s:5:"label";s:102:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Categories</abbr>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:102:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Categories</abbr>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:15:"ame_tag_actions";a:3:{s:5:"label";s:96:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Tags</abbr>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:96:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Tags</abbr>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:16:"ame_post_actions";a:3:{s:5:"label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:14:"ame_page_order";a:3:{s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:11:"wpseo-score";a:3:{s:5:"label";s:3:"SEO";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:3:"SEO";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:11:"wpseo-title";a:3:{s:5:"label";s:9:"SEO Title";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:9:"SEO Title";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:14:"wpseo-metadesc";a:3:{s:5:"label";s:10:"Meta Desc.";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:10:"Meta Desc.";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:13:"wpseo-focuskw";a:3:{s:5:"label";s:8:"Focus KW";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:8:"Focus KW";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}}s:9:"homeslide";a:7:{s:11:"product-tag";a:3:{s:5:"label";s:44:"<div class=''products product-tag''>Tags</div>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:44:"<div class=''products product-tag''>Tags</div>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:16:"product-category";a:3:{s:5:"label";s:55:"<div class=''products product-category''>Categories</div>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:55:"<div class=''products product-category''>Categories</div>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:5:"title";a:3:{s:5:"label";s:5:"Title";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:5:"Title";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:4:"date";a:3:{s:5:"label";s:4:"Date";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:4:"Date";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:15:"ame_tag_actions";a:3:{s:5:"label";s:96:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Tags</abbr>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:96:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Tags</abbr>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:16:"ame_post_actions";a:3:{s:5:"label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:14:"ame_page_order";a:3:{s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}}s:8:"products";a:12:{s:11:"product-tag";a:3:{s:5:"label";s:44:"<div class=''products product-tag''>Tags</div>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:44:"<div class=''products product-tag''>Tags</div>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:16:"product-category";a:3:{s:5:"label";s:55:"<div class=''products product-category''>Categories</div>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:55:"<div class=''products product-category''>Categories</div>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:5:"title";a:3:{s:5:"label";s:5:"Title";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:5:"Title";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:8:"comments";a:3:{s:5:"label";s:115:"<span class="vers"><img alt="Comments" src="http://wordpress.loc/wp-admin/images/comment-grey-bubble.png" /></span>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:8:"Comments";s:12:"hide_options";b:1;s:5:"class";s:18:"cpac-box-wp-native";}}s:4:"date";a:3:{s:5:"label";s:4:"Date";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:4:"Date";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:15:"ame_tag_actions";a:3:{s:5:"label";s:96:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Tags</abbr>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:96:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Tags</abbr>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:16:"ame_post_actions";a:3:{s:5:"label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:14:"ame_page_order";a:3:{s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:11:"wpseo-score";a:3:{s:5:"label";s:3:"SEO";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:3:"SEO";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:11:"wpseo-title";a:3:{s:5:"label";s:9:"SEO Title";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:9:"SEO Title";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:14:"wpseo-metadesc";a:3:{s:5:"label";s:10:"Meta Desc.";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:10:"Meta Desc.";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:13:"wpseo-focuskw";a:3:{s:5:"label";s:8:"Focus KW";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:8:"Focus KW";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}}s:4:"post";a:14:{s:5:"title";a:3:{s:5:"label";s:5:"Title";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:5:"Title";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:6:"author";a:3:{s:5:"label";s:6:"Author";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:6:"Author";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:11:"product-tag";a:3:{s:5:"label";s:44:"<div class=''products product-tag''>Tags</div>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:44:"<div class=''products product-tag''>Tags</div>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:16:"product-category";a:3:{s:5:"label";s:55:"<div class=''products product-category''>Categories</div>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:55:"<div class=''products product-category''>Categories</div>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:8:"comments";a:3:{s:5:"label";s:115:"<span class="vers"><img alt="Comments" src="http://wordpress.loc/wp-admin/images/comment-grey-bubble.png" /></span>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:8:"Comments";s:12:"hide_options";b:1;s:5:"class";s:18:"cpac-box-wp-native";}}s:4:"date";a:3:{s:5:"label";s:4:"Date";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:4:"Date";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:15:"ame_cat_actions";a:3:{s:5:"label";s:102:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Categories</abbr>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:102:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Categories</abbr>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:15:"ame_tag_actions";a:3:{s:5:"label";s:96:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Tags</abbr>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:96:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Tags</abbr>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:16:"ame_post_actions";a:3:{s:5:"label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:14:"ame_page_order";a:3:{s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:11:"wpseo-score";a:3:{s:5:"label";s:3:"SEO";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:3:"SEO";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:11:"wpseo-title";a:3:{s:5:"label";s:9:"SEO Title";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:9:"SEO Title";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:14:"wpseo-metadesc";a:3:{s:5:"label";s:10:"Meta Desc.";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:10:"Meta Desc.";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:13:"wpseo-focuskw";a:3:{s:5:"label";s:8:"Focus KW";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:8:"Focus KW";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}}s:4:"page";a:12:{s:5:"title";a:3:{s:5:"label";s:5:"Title";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:5:"Title";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:6:"author";a:3:{s:5:"label";s:6:"Author";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:6:"Author";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:11:"product-tag";a:3:{s:5:"label";s:44:"<div class=''products product-tag''>Tags</div>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:44:"<div class=''products product-tag''>Tags</div>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:16:"product-category";a:3:{s:5:"label";s:55:"<div class=''products product-category''>Categories</div>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:55:"<div class=''products product-category''>Categories</div>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:8:"comments";a:3:{s:5:"label";s:115:"<span class="vers"><img alt="Comments" src="http://wordpress.loc/wp-admin/images/comment-grey-bubble.png" /></span>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:8:"Comments";s:12:"hide_options";b:1;s:5:"class";s:18:"cpac-box-wp-native";}}s:4:"date";a:3:{s:5:"label";s:4:"Date";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:4:"Date";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:16:"ame_page_actions";a:3:{s:5:"label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:14:"ame_page_order";a:3:{s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:11:"wpseo-score";a:3:{s:5:"label";s:3:"SEO";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:3:"SEO";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:11:"wpseo-title";a:3:{s:5:"label";s:9:"SEO Title";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:9:"SEO Title";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:14:"wpseo-metadesc";a:3:{s:5:"label";s:10:"Meta Desc.";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:10:"Meta Desc.";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:13:"wpseo-focuskw";a:3:{s:5:"label";s:8:"Focus KW";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:8:"Focus KW";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}}s:8:"wp-users";a:5:{s:8:"username";a:3:{s:5:"label";s:8:"Username";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:8:"Username";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:4:"name";a:3:{s:5:"label";s:4:"Name";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:4:"Name";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:5:"email";a:3:{s:5:"label";s:6:"E-mail";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:6:"E-mail";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:4:"role";a:3:{s:5:"label";s:4:"Role";s:5:"state";s:2:"on";s:7:"options";a:4:{s:10:"type_label";s:4:"Role";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";s:9:"sortorder";s:2:"on";}}s:5:"posts";a:3:{s:5:"label";s:5:"Posts";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:5:"Posts";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}}s:8:"wp-media";a:8:{s:4:"icon";a:3:{s:5:"label";s:0:"";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:4:"Icon";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:5:"title";a:3:{s:5:"label";s:4:"File";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:4:"File";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:6:"author";a:3:{s:5:"label";s:6:"Author";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:6:"Author";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:6:"parent";a:3:{s:5:"label";s:11:"Attached to";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:11:"Attached to";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:8:"comments";a:3:{s:5:"label";s:115:"<span class="vers"><img alt="Comments" src="http://wordpress.loc/wp-admin/images/comment-grey-bubble.png" /></span>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:8:"Comments";s:12:"hide_options";b:1;s:5:"class";s:18:"cpac-box-wp-native";}}s:4:"date";a:3:{s:5:"label";s:4:"Date";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:4:"Date";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:14:"ame_media_desc";a:3:{s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Description</abbr>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Description</abbr>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:15:"ame_media_order";a:3:{s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Media Order</abbr>";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Media Order</abbr>";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}}s:8:"wp-links";a:6:{s:4:"name";a:3:{s:5:"label";s:4:"Name";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:4:"Name";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:3:"url";a:3:{s:5:"label";s:3:"URL";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:3:"URL";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:10:"categories";a:3:{s:5:"label";s:10:"Categories";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:10:"Categories";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:3:"rel";a:3:{s:5:"label";s:12:"Relationship";s:5:"state";s:2:"on";s:7:"options";a:4:{s:10:"type_label";s:12:"Relationship";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";s:9:"sortorder";s:2:"on";}}s:7:"visible";a:3:{s:5:"label";s:7:"Visible";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:7:"Visible";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:6:"rating";a:3:{s:5:"label";s:6:"Rating";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:6:"Rating";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}}s:11:"wp-comments";a:3:{s:6:"author";a:3:{s:5:"label";s:6:"Author";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:6:"Author";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}s:7:"comment";a:3:{s:5:"label";s:7:"Comment";s:5:"state";s:2:"on";s:7:"options";a:4:{s:10:"type_label";s:7:"Comment";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";s:9:"sortorder";s:2:"on";}}s:8:"response";a:3:{s:5:"label";s:14:"In Response To";s:5:"state";s:2:"on";s:7:"options";a:3:{s:10:"type_label";s:14:"In Response To";s:12:"hide_options";b:0;s:5:"class";s:18:"cpac-box-wp-native";}}}}', 'yes');
INSERT INTO `uo6g6en_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(2966, 'mw_adminimize', 'a:89:{s:29:"mw_adminimize_admin_bar_nodes";a:44:{s:12:"user-actions";O:8:"stdClass":6:{s:2:"id";s:12:"user-actions";s:5:"title";b:0;s:6:"parent";s:10:"my-account";s:4:"href";b:0;s:5:"group";b:1;s:4:"meta";a:0:{}}s:9:"user-info";O:8:"stdClass":6:{s:2:"id";s:9:"user-info";s:5:"title";s:275:"<img alt='''' src=''http://0.gravatar.com/avatar/870ab5fa992ebe322c59646477dc23d8?s=64&amp;d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D64&amp;r=G'' class=''avatar avatar-64 photo'' height=''64'' width=''64'' /><span class=''display-name''>Marek</span>";s:6:"parent";s:12:"user-actions";s:4:"href";s:41:"http://wordpress.loc/wp-admin/profile.php";s:5:"group";b:0;s:4:"meta";a:1:{s:8:"tabindex";i:-1;}}s:12:"edit-profile";O:8:"stdClass":6:{s:2:"id";s:12:"edit-profile";s:5:"title";s:15:"Edit My Profile";s:6:"parent";s:12:"user-actions";s:4:"href";s:41:"http://wordpress.loc/wp-admin/profile.php";s:5:"group";b:0;s:4:"meta";a:0:{}}s:6:"logout";O:8:"stdClass":6:{s:2:"id";s:6:"logout";s:5:"title";s:7:"Log Out";s:6:"parent";s:12:"user-actions";s:4:"href";s:71:"http://wordpress.loc/wp-login.php?action=logout&amp;_wpnonce=921ea9cb76";s:5:"group";b:0;s:4:"meta";a:0:{}}s:10:"my-account";O:8:"stdClass":6:{s:2:"id";s:10:"my-account";s:5:"title";s:255:"How are you, Marek?<img alt='''' src=''http://0.gravatar.com/avatar/870ab5fa992ebe322c59646477dc23d8?s=16&amp;d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D16&amp;r=G'' class=''avatar avatar-16 photo'' height=''16'' width=''16'' />";s:6:"parent";s:13:"top-secondary";s:4:"href";s:41:"http://wordpress.loc/wp-admin/profile.php";s:5:"group";b:0;s:4:"meta";a:2:{s:5:"class";s:11:"with-avatar";s:5:"title";s:10:"My Account";}}s:7:"wp-logo";O:8:"stdClass":6:{s:2:"id";s:7:"wp-logo";s:5:"title";s:29:"<span class="ab-icon"></span>";s:6:"parent";b:0;s:4:"href";s:39:"http://wordpress.loc/wp-admin/about.php";s:5:"group";b:0;s:4:"meta";a:1:{s:5:"title";s:15:"About WordPress";}}s:5:"about";O:8:"stdClass":6:{s:2:"id";s:5:"about";s:5:"title";s:15:"About WordPress";s:6:"parent";s:7:"wp-logo";s:4:"href";s:39:"http://wordpress.loc/wp-admin/about.php";s:5:"group";b:0;s:4:"meta";a:0:{}}s:5:"wporg";O:8:"stdClass":6:{s:2:"id";s:5:"wporg";s:5:"title";s:13:"WordPress.org";s:6:"parent";s:16:"wp-logo-external";s:4:"href";s:21:"http://wordpress.org/";s:5:"group";b:0;s:4:"meta";a:0:{}}s:13:"documentation";O:8:"stdClass":6:{s:2:"id";s:13:"documentation";s:5:"title";s:13:"Documentation";s:6:"parent";s:16:"wp-logo-external";s:4:"href";s:27:"http://codex.wordpress.org/";s:5:"group";b:0;s:4:"meta";a:0:{}}s:14:"support-forums";O:8:"stdClass":6:{s:2:"id";s:14:"support-forums";s:5:"title";s:14:"Support Forums";s:6:"parent";s:16:"wp-logo-external";s:4:"href";s:29:"http://wordpress.org/support/";s:5:"group";b:0;s:4:"meta";a:0:{}}s:8:"feedback";O:8:"stdClass":6:{s:2:"id";s:8:"feedback";s:5:"title";s:8:"Feedback";s:6:"parent";s:16:"wp-logo-external";s:4:"href";s:56:"http://wordpress.org/support/forum/requests-and-feedback";s:5:"group";b:0;s:4:"meta";a:0:{}}s:9:"site-name";O:8:"stdClass":6:{s:2:"id";s:9:"site-name";s:5:"title";s:10:"Site Title";s:6:"parent";b:0;s:4:"href";s:21:"http://wordpress.loc/";s:5:"group";b:0;s:4:"meta";a:0:{}}s:9:"view-site";O:8:"stdClass":6:{s:2:"id";s:9:"view-site";s:5:"title";s:10:"Visit Site";s:6:"parent";s:9:"site-name";s:4:"href";s:21:"http://wordpress.loc/";s:5:"group";b:0;s:4:"meta";a:0:{}}s:8:"comments";O:8:"stdClass":6:{s:2:"id";s:8:"comments";s:5:"title";s:116:"<span class="ab-icon"></span><span id="ab-awaiting-mod" class="ab-label awaiting-mod pending-count count-0">0</span>";s:6:"parent";b:0;s:4:"href";s:47:"http://wordpress.loc/wp-admin/edit-comments.php";s:5:"group";b:0;s:4:"meta";a:1:{s:5:"title";s:30:"0 comments awaiting moderation";}}s:11:"new-content";O:8:"stdClass":6:{s:2:"id";s:11:"new-content";s:5:"title";s:62:"<span class="ab-icon"></span><span class="ab-label">New</span>";s:6:"parent";b:0;s:4:"href";s:42:"http://wordpress.loc/wp-admin/post-new.php";s:5:"group";b:0;s:4:"meta";a:1:{s:5:"title";s:7:"Add New";}}s:8:"new-post";O:8:"stdClass":6:{s:2:"id";s:8:"new-post";s:5:"title";s:4:"Post";s:6:"parent";s:11:"new-content";s:4:"href";s:42:"http://wordpress.loc/wp-admin/post-new.php";s:5:"group";b:0;s:4:"meta";a:0:{}}s:9:"new-media";O:8:"stdClass":6:{s:2:"id";s:9:"new-media";s:5:"title";s:5:"Media";s:6:"parent";s:11:"new-content";s:4:"href";s:43:"http://wordpress.loc/wp-admin/media-new.php";s:5:"group";b:0;s:4:"meta";a:0:{}}s:8:"new-link";O:8:"stdClass":6:{s:2:"id";s:8:"new-link";s:5:"title";s:4:"Link";s:6:"parent";s:11:"new-content";s:4:"href";s:42:"http://wordpress.loc/wp-admin/link-add.php";s:5:"group";b:0;s:4:"meta";a:0:{}}s:8:"new-page";O:8:"stdClass":6:{s:2:"id";s:8:"new-page";s:5:"title";s:4:"Page";s:6:"parent";s:11:"new-content";s:4:"href";s:57:"http://wordpress.loc/wp-admin/post-new.php?post_type=page";s:5:"group";b:0;s:4:"meta";a:0:{}}s:15:"new-newsletters";O:8:"stdClass":6:{s:2:"id";s:15:"new-newsletters";s:5:"title";s:11:"Newsletters";s:6:"parent";s:11:"new-content";s:4:"href";s:64:"http://wordpress.loc/wp-admin/post-new.php?post_type=newsletters";s:5:"group";b:0;s:4:"meta";a:0:{}}s:8:"new-user";O:8:"stdClass":6:{s:2:"id";s:8:"new-user";s:5:"title";s:4:"User";s:6:"parent";s:11:"new-content";s:4:"href";s:42:"http://wordpress.loc/wp-admin/user-new.php";s:5:"group";b:0;s:4:"meta";a:0:{}}s:10:"wpseo-menu";O:8:"stdClass":6:{s:2:"id";s:10:"wpseo-menu";s:5:"title";s:3:"SEO";s:6:"parent";b:0;s:4:"href";s:60:"http://wordpress.loc/wp-admin/admin.php?page=wpseo_dashboard";s:5:"group";b:0;s:4:"meta";a:0:{}}s:16:"wpseo-kwresearch";O:8:"stdClass":7:{s:2:"id";s:16:"wpseo-kwresearch";s:5:"title";s:16:"Keyword Research";s:6:"parent";s:10:"wpseo-menu";s:4:"href";b:0;s:5:"group";b:0;s:4:"meta";a:0:{}s:1:"0";s:1:"#";}s:21:"wpseo-adwordsexternal";O:8:"stdClass":6:{s:2:"id";s:21:"wpseo-adwordsexternal";s:5:"title";s:16:"AdWords External";s:6:"parent";s:16:"wpseo-kwresearch";s:4:"href";s:53:"https://adwords.google.com/select/KeywordToolExternal";s:5:"group";b:0;s:4:"meta";a:1:{s:6:"target";s:6:"_blank";}}s:20:"wpseo-googleinsights";O:8:"stdClass":6:{s:2:"id";s:20:"wpseo-googleinsights";s:5:"title";s:15:"Google Insights";s:6:"parent";s:16:"wpseo-kwresearch";s:4:"href";s:48:"http://www.google.com/insights/search/#q=&cmpt=q";s:5:"group";b:0;s:4:"meta";a:1:{s:6:"target";s:6:"_blank";}}s:17:"wpseo-wordtracker";O:8:"stdClass":6:{s:2:"id";s:17:"wpseo-wordtracker";s:5:"title";s:8:"SEO Book";s:6:"parent";s:16:"wpseo-kwresearch";s:4:"href";s:56:"http://tools.seobook.com/keyword-tools/seobook/?keyword=";s:5:"group";b:0;s:4:"meta";a:1:{s:6:"target";s:6:"_blank";}}s:14:"wpseo-settings";O:8:"stdClass":6:{s:2:"id";s:14:"wpseo-settings";s:5:"title";s:12:"SEO Settings";s:6:"parent";s:10:"wpseo-menu";s:4:"href";s:57:"http://wordpress.loc/wp-admin/admin.php?page=wpseo_titles";s:5:"group";b:0;s:4:"meta";a:0:{}}s:12:"wpseo-titles";O:8:"stdClass":6:{s:2:"id";s:12:"wpseo-titles";s:5:"title";s:14:"Titles & Metas";s:6:"parent";s:14:"wpseo-settings";s:4:"href";s:57:"http://wordpress.loc/wp-admin/admin.php?page=wpseo_titles";s:5:"group";b:0;s:4:"meta";a:0:{}}s:12:"wpseo-social";O:8:"stdClass":6:{s:2:"id";s:12:"wpseo-social";s:5:"title";s:6:"Social";s:6:"parent";s:14:"wpseo-settings";s:4:"href";s:57:"http://wordpress.loc/wp-admin/admin.php?page=wpseo_social";s:5:"group";b:0;s:4:"meta";a:0:{}}s:9:"wpseo-xml";O:8:"stdClass":6:{s:2:"id";s:9:"wpseo-xml";s:5:"title";s:12:"XML Sitemaps";s:6:"parent";s:14:"wpseo-settings";s:4:"href";s:54:"http://wordpress.loc/wp-admin/admin.php?page=wpseo_xml";s:5:"group";b:0;s:4:"meta";a:0:{}}s:16:"wpseo-permalinks";O:8:"stdClass":6:{s:2:"id";s:16:"wpseo-permalinks";s:5:"title";s:10:"Permalinks";s:6:"parent";s:14:"wpseo-settings";s:4:"href";s:61:"http://wordpress.loc/wp-admin/admin.php?page=wpseo_permalinks";s:5:"group";b:0;s:4:"meta";a:0:{}}s:20:"wpseo-internal-links";O:8:"stdClass":6:{s:2:"id";s:20:"wpseo-internal-links";s:5:"title";s:14:"Internal Links";s:6:"parent";s:14:"wpseo-settings";s:4:"href";s:65:"http://wordpress.loc/wp-admin/admin.php?page=wpseo_internal-links";s:5:"group";b:0;s:4:"meta";a:0:{}}s:9:"wpseo-rss";O:8:"stdClass":6:{s:2:"id";s:9:"wpseo-rss";s:5:"title";s:3:"RSS";s:6:"parent";s:14:"wpseo-settings";s:4:"href";s:54:"http://wordpress.loc/wp-admin/admin.php?page=wpseo_rss";s:5:"group";b:0;s:4:"meta";a:0:{}}s:4:"w3tc";O:8:"stdClass":6:{s:2:"id";s:4:"w3tc";s:5:"title";s:11:"Performance";s:6:"parent";b:0;s:4:"href";s:59:"http://wordpress.loc/wp-admin/admin.php?page=w3tc_dashboard";s:5:"group";b:0;s:4:"meta";a:0:{}}s:17:"w3tc-empty-caches";O:8:"stdClass":6:{s:2:"id";s:17:"w3tc-empty-caches";s:5:"title";s:16:"Empty All Caches";s:6:"parent";s:4:"w3tc";s:4:"href";s:102:"http://wordpress.loc/wp-admin/admin.php?page=w3tc_dashboard&amp;w3tc_flush_all&amp;_wpnonce=683cb255c8";s:5:"group";b:0;s:4:"meta";a:0:{}}s:12:"w3tc-modules";O:8:"stdClass":6:{s:2:"id";s:12:"w3tc-modules";s:5:"title";s:13:"Empty Modules";s:6:"parent";s:4:"w3tc";s:4:"href";b:0;s:5:"group";b:0;s:4:"meta";a:0:{}}s:18:"w3tc-flush-pgcache";O:8:"stdClass":6:{s:2:"id";s:18:"w3tc-flush-pgcache";s:5:"title";s:16:"Empty Page Cache";s:6:"parent";s:12:"w3tc-modules";s:4:"href";s:106:"http://wordpress.loc/wp-admin/admin.php?page=w3tc_dashboard&amp;w3tc_flush_pgcache&amp;_wpnonce=683cb255c8";s:5:"group";b:0;s:4:"meta";a:0:{}}s:17:"w3tc-flush-minify";O:8:"stdClass":6:{s:2:"id";s:17:"w3tc-flush-minify";s:5:"title";s:18:"Empty Minify Cache";s:6:"parent";s:12:"w3tc-modules";s:4:"href";s:105:"http://wordpress.loc/wp-admin/admin.php?page=w3tc_dashboard&amp;w3tc_flush_minify&amp;_wpnonce=683cb255c8";s:5:"group";b:0;s:4:"meta";a:0:{}}s:18:"w3tc-flush-dbcache";O:8:"stdClass":6:{s:2:"id";s:18:"w3tc-flush-dbcache";s:5:"title";s:20:"Empty Database Cache";s:6:"parent";s:12:"w3tc-modules";s:4:"href";s:106:"http://wordpress.loc/wp-admin/admin.php?page=w3tc_dashboard&amp;w3tc_flush_dbcache&amp;_wpnonce=683cb255c8";s:5:"group";b:0;s:4:"meta";a:0:{}}s:22:"w3tc-flush-objectcache";O:8:"stdClass":6:{s:2:"id";s:22:"w3tc-flush-objectcache";s:5:"title";s:18:"Empty Object Cache";s:6:"parent";s:12:"w3tc-modules";s:4:"href";s:110:"http://wordpress.loc/wp-admin/admin.php?page=w3tc_dashboard&amp;w3tc_flush_objectcache&amp;_wpnonce=683cb255c8";s:5:"group";b:0;s:4:"meta";a:0:{}}s:8:"w3tc-faq";O:8:"stdClass":6:{s:2:"id";s:8:"w3tc-faq";s:5:"title";s:3:"FAQ";s:6:"parent";s:4:"w3tc";s:4:"href";s:53:"http://wordpress.loc/wp-admin/admin.php?page=w3tc_faq";s:5:"group";b:0;s:4:"meta";a:0:{}}s:12:"w3tc-support";O:8:"stdClass":6:{s:2:"id";s:12:"w3tc-support";s:5:"title";s:58:"<span style="color: red; background: none;">Support</span>";s:6:"parent";s:4:"w3tc";s:4:"href";s:57:"http://wordpress.loc/wp-admin/admin.php?page=w3tc_support";s:5:"group";b:0;s:4:"meta";a:0:{}}s:13:"top-secondary";O:8:"stdClass":6:{s:2:"id";s:13:"top-secondary";s:5:"title";b:0;s:6:"parent";b:0;s:4:"href";b:0;s:5:"group";b:1;s:4:"meta";a:1:{s:5:"class";s:16:"ab-top-secondary";}}s:16:"wp-logo-external";O:8:"stdClass":6:{s:2:"id";s:16:"wp-logo-external";s:5:"title";b:0;s:6:"parent";s:7:"wp-logo";s:4:"href";b:0;s:5:"group";b:1;s:4:"meta";a:1:{s:5:"class";s:16:"ab-sub-secondary";}}}s:52:"mw_adminimize_disabled_admin_bar_administrator_items";a:0:{}s:45:"mw_adminimize_disabled_admin_bar_editor_items";a:0:{}s:45:"mw_adminimize_disabled_admin_bar_author_items";a:0:{}s:50:"mw_adminimize_disabled_admin_bar_contributor_items";a:0:{}s:49:"mw_adminimize_disabled_admin_bar_subscriber_items";a:21:{i:0;s:10:"wpseo-menu";i:1;s:16:"wpseo-kwresearch";i:2;s:21:"wpseo-adwordsexternal";i:3;s:20:"wpseo-googleinsights";i:4;s:17:"wpseo-wordtracker";i:5;s:14:"wpseo-settings";i:6;s:12:"wpseo-titles";i:7;s:12:"wpseo-social";i:8;s:9:"wpseo-xml";i:9;s:16:"wpseo-permalinks";i:10;s:20:"wpseo-internal-links";i:11;s:9:"wpseo-rss";i:12;s:4:"w3tc";i:13;s:17:"w3tc-empty-caches";i:14;s:12:"w3tc-modules";i:15;s:18:"w3tc-flush-pgcache";i:16;s:17:"w3tc-flush-minify";i:17;s:18:"w3tc-flush-dbcache";i:18;s:22:"w3tc-flush-objectcache";i:19;s:8:"w3tc-faq";i:20;s:12:"w3tc-support";}s:24:"_mw_adminimize_user_info";s:1:"0";s:23:"_mw_adminimize_dashmenu";i:0;s:21:"_mw_adminimize_footer";s:1:"0";s:21:"_mw_adminimize_header";i:0;s:34:"_mw_adminimize_exclude_super_admin";i:0;s:24:"_mw_adminimize_tb_window";i:0;s:23:"_mw_adminimize_cat_full";s:1:"0";s:26:"_mw_adminimize_db_redirect";i:0;s:26:"_mw_adminimize_ui_redirect";i:0;s:21:"_mw_adminimize_advice";s:1:"0";s:25:"_mw_adminimize_advice_txt";s:0:"";s:24:"_mw_adminimize_timestamp";s:1:"0";s:34:"_mw_adminimize_control_flashloader";i:0;s:30:"_mw_adminimize_db_redirect_txt";s:0:"";s:47:"mw_adminimize_disabled_menu_administrator_items";a:1:{i:0;s:16:"link-manager.php";}s:50:"mw_adminimize_disabled_submenu_administrator_items";a:0:{}s:40:"mw_adminimize_disabled_menu_editor_items";a:8:{i:0;s:16:"link-manager.php";i:1;s:11:"plugins.php";i:2;s:9:"tools.php";i:3;s:22:"edit.php?post_type=acf";i:4;s:8:"backwpup";i:5;s:18:"better-wp-security";i:6;s:9:"Wordfence";i:7;s:15:"wpseo_dashboard";}s:43:"mw_adminimize_disabled_submenu_editor_items";a:2:{i:0;s:10:"themes.php";i:1;s:11:"widgets.php";}s:40:"mw_adminimize_disabled_menu_author_items";a:8:{i:0;s:16:"link-manager.php";i:1;s:11:"plugins.php";i:2;s:9:"tools.php";i:3;s:22:"edit.php?post_type=acf";i:4;s:8:"backwpup";i:5;s:18:"better-wp-security";i:6;s:9:"Wordfence";i:7;s:15:"wpseo_dashboard";}s:43:"mw_adminimize_disabled_submenu_author_items";a:2:{i:0;s:10:"themes.php";i:1;s:11:"widgets.php";}s:45:"mw_adminimize_disabled_menu_contributor_items";a:8:{i:0;s:16:"link-manager.php";i:1;s:11:"plugins.php";i:2;s:9:"tools.php";i:3;s:22:"edit.php?post_type=acf";i:4;s:8:"backwpup";i:5;s:18:"better-wp-security";i:6;s:9:"Wordfence";i:7;s:15:"wpseo_dashboard";}s:48:"mw_adminimize_disabled_submenu_contributor_items";a:2:{i:0;s:10:"themes.php";i:1;s:11:"widgets.php";}s:44:"mw_adminimize_disabled_menu_subscriber_items";a:8:{i:0;s:16:"link-manager.php";i:1;s:11:"plugins.php";i:2;s:9:"tools.php";i:3;s:22:"edit.php?post_type=acf";i:4;s:8:"backwpup";i:5;s:18:"better-wp-security";i:6;s:9:"Wordfence";i:7;s:15:"wpseo_dashboard";}s:47:"mw_adminimize_disabled_submenu_subscriber_items";a:2:{i:0;s:10:"themes.php";i:1;s:11:"widgets.php";}s:56:"mw_adminimize_disabled_global_option_administrator_items";a:0:{}s:57:"mw_adminimize_disabled_metaboxes_post_administrator_items";a:0:{}s:57:"mw_adminimize_disabled_metaboxes_page_administrator_items";a:0:{}s:64:"mw_adminimize_disabled_metaboxes_newsletters_administrator_items";a:0:{}s:54:"mw_adminimize_disabled_link_option_administrator_items";a:0:{}s:58:"mw_adminimize_disabled_nav_menu_option_administrator_items";a:0:{}s:56:"mw_adminimize_disabled_widget_option_administrator_items";a:0:{}s:59:"mw_adminimize_disabled_dashboard_option_administrator_items";a:0:{}s:49:"mw_adminimize_disabled_global_option_editor_items";a:0:{}s:50:"mw_adminimize_disabled_metaboxes_post_editor_items";a:0:{}s:50:"mw_adminimize_disabled_metaboxes_page_editor_items";a:0:{}s:57:"mw_adminimize_disabled_metaboxes_newsletters_editor_items";a:0:{}s:47:"mw_adminimize_disabled_link_option_editor_items";a:0:{}s:51:"mw_adminimize_disabled_nav_menu_option_editor_items";a:0:{}s:49:"mw_adminimize_disabled_widget_option_editor_items";a:0:{}s:52:"mw_adminimize_disabled_dashboard_option_editor_items";a:0:{}s:49:"mw_adminimize_disabled_global_option_author_items";a:0:{}s:50:"mw_adminimize_disabled_metaboxes_post_author_items";a:0:{}s:50:"mw_adminimize_disabled_metaboxes_page_author_items";a:0:{}s:57:"mw_adminimize_disabled_metaboxes_newsletters_author_items";a:0:{}s:47:"mw_adminimize_disabled_link_option_author_items";a:0:{}s:51:"mw_adminimize_disabled_nav_menu_option_author_items";a:0:{}s:49:"mw_adminimize_disabled_widget_option_author_items";a:0:{}s:52:"mw_adminimize_disabled_dashboard_option_author_items";a:0:{}s:54:"mw_adminimize_disabled_global_option_contributor_items";a:0:{}s:55:"mw_adminimize_disabled_metaboxes_post_contributor_items";a:0:{}s:55:"mw_adminimize_disabled_metaboxes_page_contributor_items";a:0:{}s:62:"mw_adminimize_disabled_metaboxes_newsletters_contributor_items";a:0:{}s:52:"mw_adminimize_disabled_link_option_contributor_items";a:0:{}s:56:"mw_adminimize_disabled_nav_menu_option_contributor_items";a:0:{}s:54:"mw_adminimize_disabled_widget_option_contributor_items";a:0:{}s:57:"mw_adminimize_disabled_dashboard_option_contributor_items";a:0:{}s:53:"mw_adminimize_disabled_global_option_subscriber_items";a:0:{}s:54:"mw_adminimize_disabled_metaboxes_post_subscriber_items";a:0:{}s:54:"mw_adminimize_disabled_metaboxes_page_subscriber_items";a:0:{}s:61:"mw_adminimize_disabled_metaboxes_newsletters_subscriber_items";a:0:{}s:51:"mw_adminimize_disabled_link_option_subscriber_items";a:0:{}s:55:"mw_adminimize_disabled_nav_menu_option_subscriber_items";a:0:{}s:53:"mw_adminimize_disabled_widget_option_subscriber_items";a:0:{}s:56:"mw_adminimize_disabled_dashboard_option_subscriber_items";a:0:{}s:25:"_mw_adminimize_own_values";s:0:"";s:26:"_mw_adminimize_own_options";s:0:"";s:30:"_mw_adminimize_own_post_values";s:0:"";s:31:"_mw_adminimize_own_post_options";s:0:"";s:30:"_mw_adminimize_own_page_values";s:0:"";s:31:"_mw_adminimize_own_page_options";s:0:"";s:37:"_mw_adminimize_own_values_newsletters";s:0:"";s:38:"_mw_adminimize_own_options_newsletters";s:0:"";s:30:"_mw_adminimize_own_link_values";s:0:"";s:31:"_mw_adminimize_own_link_options";s:0:"";s:34:"_mw_adminimize_own_nav_menu_values";s:0:"";s:35:"_mw_adminimize_own_nav_menu_options";s:0:"";s:32:"_mw_adminimize_own_widget_values";s:0:"";s:33:"_mw_adminimize_own_widget_options";s:0:"";s:35:"_mw_adminimize_own_dashboard_values";s:1:"0";s:36:"_mw_adminimize_own_dashboard_options";s:1:"0";s:31:"mw_adminimize_dashboard_widgets";a:4:{s:19:"dashboard_right_now";a:4:{s:2:"id";s:19:"dashboard_right_now";s:5:"title";s:11:"At a Glance";s:7:"context";s:6:"normal";s:8:"priority";s:4:"core";}s:18:"dashboard_activity";a:4:{s:2:"id";s:18:"dashboard_activity";s:5:"title";s:8:"Activity";s:7:"context";s:6:"normal";s:8:"priority";s:4:"core";}s:21:"dashboard_quick_press";a:4:{s:2:"id";s:21:"dashboard_quick_press";s:5:"title";s:0:"";s:7:"context";s:4:"side";s:8:"priority";s:4:"core";}s:17:"dashboard_primary";a:4:{s:2:"id";s:17:"dashboard_primary";s:5:"title";s:14:"WordPress News";s:7:"context";s:4:"side";s:8:"priority";s:4:"core";}}s:26:"mw_adminimize_default_menu";a:19:{i:2;a:7:{i:0;s:9:"Dashboard";i:1;s:4:"read";i:2;s:9:"index.php";i:3;s:0:"";i:4;s:57:"menu-top menu-top-first menu-icon-dashboard menu-top-last";i:5;s:14:"menu-dashboard";i:6;s:4:"none";}i:4;a:5:{i:0;s:0:"";i:1;s:4:"read";i:2;s:10:"separator1";i:3;s:0:"";i:4;s:17:"wp-menu-separator";}i:5;a:7:{i:0;s:5:"Posts";i:1;s:10:"edit_posts";i:2;s:8:"edit.php";i:3;s:0:"";i:4;s:52:"open-if-no-js menu-top menu-icon-post menu-top-first";i:5;s:10:"menu-posts";i:6;s:4:"none";}i:6;a:7:{i:0;s:11:"Newsletters";i:1;s:10:"edit_posts";i:2;s:30:"edit.php?post_type=newsletters";i:3;s:0:"";i:4;s:23:"menu-top menu-icon-post";i:5;s:22:"menu-posts-newsletters";i:6;s:4:"none";}i:10;a:7:{i:0;s:5:"Pages";i:1;s:10:"edit_pages";i:2;s:23:"edit.php?post_type=page";i:3;s:0:"";i:4;s:23:"menu-top menu-icon-page";i:5;s:10:"menu-pages";i:6;s:4:"none";}i:15;a:5:{i:0;s:0:"";i:1;s:4:"read";i:2;s:27:"separator-custom-post-types";i:3;s:0:"";i:4;s:17:"wp-menu-separator";}i:19;a:7:{i:0;s:5:"Media";i:1;s:12:"upload_files";i:2;s:10:"upload.php";i:3;s:0:"";i:4;s:24:"menu-top menu-icon-media";i:5;s:10:"menu-media";i:6;s:4:"none";}i:25;a:7:{i:0;s:87:"Comments <span class=''awaiting-mod count-0''><span class=''pending-count''>0</span></span>";i:1;s:10:"edit_posts";i:2;s:17:"edit-comments.php";i:3;s:0:"";i:4;s:41:"menu-top menu-icon-comments menu-top-last";i:5;s:13:"menu-comments";i:6;s:4:"none";}i:59;a:5:{i:0;s:0:"";i:1;s:4:"read";i:2;s:10:"separator2";i:3;s:0:"";i:4;s:17:"wp-menu-separator";}i:60;a:7:{i:0;s:10:"Appearance";i:1;s:13:"switch_themes";i:2;s:10:"themes.php";i:3;s:0:"";i:4;s:44:"menu-top menu-icon-appearance menu-top-first";i:5;s:15:"menu-appearance";i:6;s:3:"div";}i:65;a:7:{i:0;s:87:"Plugins <span class=''update-plugins count-0''><span class=''plugin-count''>0</span></span>";i:1;s:16:"activate_plugins";i:2;s:11:"plugins.php";i:3;s:0:"";i:4;s:26:"menu-top menu-icon-plugins";i:5;s:12:"menu-plugins";i:6;s:4:"none";}i:70;a:7:{i:0;s:5:"Users";i:1;s:10:"list_users";i:2;s:9:"users.php";i:3;s:0:"";i:4;s:24:"menu-top menu-icon-users";i:5;s:10:"menu-users";i:6;s:4:"none";}i:75;a:7:{i:0;s:5:"Tools";i:1;s:10:"edit_posts";i:2;s:9:"tools.php";i:3;s:0:"";i:4;s:24:"menu-top menu-icon-tools";i:5;s:10:"menu-tools";i:6;s:4:"none";}i:80;a:7:{i:0;s:8:"Settings";i:1;s:14:"manage_options";i:2;s:19:"options-general.php";i:3;s:0:"";i:4;s:27:"menu-top menu-icon-settings";i:5;s:13:"menu-settings";i:6;s:4:"none";}i:81;a:7:{i:0;s:13:"Custom Fields";i:1;s:14:"manage_options";i:2;s:22:"edit.php?post_type=acf";i:3;s:13:"Custom Fields";i:4;s:73:"menu-top menu-icon-generic toplevel_page_edit?post_type=acf menu-top-last";i:5;s:32:"toplevel_page_edit?post_type=acf";i:6;s:4:"none";}i:99;a:5:{i:0;s:0:"";i:1;s:4:"read";i:2;s:14:"separator-last";i:3;s:0:"";i:4;s:17:"wp-menu-separator";}s:8:"99.31337";a:7:{i:0;s:3:"SEO";i:1;s:14:"manage_options";i:2;s:15:"wpseo_dashboard";i:3;s:37:"Yoast WordPress SEO: General Settings";i:4;s:53:"menu-top toplevel_page_wpseo_dashboard menu-top-first";i:5;s:29:"toplevel_page_wpseo_dashboard";i:6;s:75:"http://wordpress.loc/wp-content/plugins/wordpress-seo/images/yoast-icon.png";}i:100;a:7:{i:0;s:8:"Security";i:1;s:14:"manage_options";i:2;s:18:"better-wp-security";i:3;s:30:"Better WP Security - Dashboard";i:4;s:41:"menu-top toplevel_page_better-wp-security";i:5;s:32:"toplevel_page_better-wp-security";i:6;s:82:"http://wordpress.loc/wp-content/plugins/better-wp-security/images/shield-small.png";}i:101;a:7:{i:0;s:11:"Performance";i:1;s:14:"manage_options";i:2;s:14:"w3tc_dashboard";i:3;s:11:"Performance";i:4;s:51:"menu-top toplevel_page_w3tc_dashboard menu-top-last";i:5;s:28:"toplevel_page_w3tc_dashboard";i:6;s:3:"div";}}s:29:"mw_adminimize_default_submenu";a:15:{s:9:"index.php";a:4:{i:0;a:3:{i:0;s:4:"Home";i:1;s:4:"read";i:2;s:9:"index.php";}i:10;a:3:{i:0;s:96:"Updates <span class=''update-plugins count-0'' title=''''><span class=''update-count''>0</span></span>";i:1;s:11:"update_core";i:2;s:15:"update-core.php";}i:11;a:4:{i:0;s:13:"Akismet Stats";i:1;s:14:"manage_options";i:2;s:21:"akismet-stats-display";i:3;s:13:"Akismet Stats";}i:12;a:4:{i:0;s:13:"User searches";i:1;s:10:"edit_pages";i:2;s:25:"relevanssi/relevanssi.php";i:3;s:13:"User searches";}}s:8:"edit.php";a:4:{i:5;a:3:{i:0;s:9:"All Posts";i:1;s:10:"edit_posts";i:2;s:8:"edit.php";}i:10;a:3:{i:0;s:7:"Add New";i:1;s:10:"edit_posts";i:2;s:12:"post-new.php";}i:15;a:3:{i:0;s:10:"Categories";i:1;s:17:"manage_categories";i:2;s:31:"edit-tags.php?taxonomy=category";}i:16;a:3:{i:0;s:4:"Tags";i:1;s:17:"manage_categories";i:2;s:31:"edit-tags.php?taxonomy=post_tag";}}s:10:"upload.php";a:2:{i:5;a:3:{i:0;s:7:"Library";i:1;s:12:"upload_files";i:2;s:10:"upload.php";}i:10;a:3:{i:0;s:7:"Add New";i:1;s:12:"upload_files";i:2;s:13:"media-new.php";}}s:16:"link-manager.php";a:3:{i:5;a:3:{i:0;s:9:"All Links";i:1;s:12:"manage_links";i:2;s:16:"link-manager.php";}i:10;a:3:{i:0;s:7:"Add New";i:1;s:12:"manage_links";i:2;s:12:"link-add.php";}i:15;a:3:{i:0;s:15:"Link Categories";i:1;s:17:"manage_categories";i:2;s:36:"edit-tags.php?taxonomy=link_category";}}s:23:"edit.php?post_type=page";a:2:{i:5;a:3:{i:0;s:9:"All Pages";i:1;s:10:"edit_pages";i:2;s:23:"edit.php?post_type=page";}i:10;a:3:{i:0;s:7:"Add New";i:1;s:10:"edit_pages";i:2;s:27:"post-new.php?post_type=page";}}s:30:"edit.php?post_type=newsletters";a:3:{i:5;a:3:{i:0;s:11:"Newsletters";i:1;s:10:"edit_posts";i:2;s:30:"edit.php?post_type=newsletters";}i:10;a:3:{i:0;s:7:"Add New";i:1;s:10:"edit_posts";i:2;s:34:"post-new.php?post_type=newsletters";}i:15;a:3:{i:0;s:4:"Tags";i:1;s:17:"manage_categories";i:2;s:57:"edit-tags.php?taxonomy=post_tag&amp;post_type=newsletters";}}s:10:"themes.php";a:3:{i:5;a:3:{i:0;s:6:"Themes";i:1;s:13:"switch_themes";i:2;s:10:"themes.php";}i:6;a:4:{i:0;s:9:"Customise";i:1;s:18:"edit_theme_options";i:2;s:13:"customize.php";i:3;s:20:"hide-if-no-customize";}i:10;a:3:{i:0;s:5:"Menus";i:1;s:18:"edit_theme_options";i:2;s:13:"nav-menus.php";}}s:11:"plugins.php";a:3:{i:5;a:3:{i:0;s:17:"Installed Plugins";i:1;s:16:"activate_plugins";i:2;s:11:"plugins.php";}i:10;a:3:{i:0;s:7:"Add New";i:1;s:15:"install_plugins";i:2;s:18:"plugin-install.php";}i:16;a:4:{i:0;s:7:"Akismet";i:1;s:14:"manage_options";i:2;s:18:"akismet-key-config";i:3;s:7:"Akismet";}}s:9:"users.php";a:3:{i:5;a:3:{i:0;s:9:"All Users";i:1;s:10:"list_users";i:2;s:9:"users.php";}i:10;a:3:{i:0;s:7:"Add New";i:1;s:12:"create_users";i:2;s:12:"user-new.php";}i:15;a:3:{i:0;s:12:"Your Profile";i:1;s:4:"read";i:2;s:11:"profile.php";}}s:9:"tools.php";a:6:{i:5;a:3:{i:0;s:15:"Available Tools";i:1;s:10:"edit_posts";i:2;s:9:"tools.php";}i:10;a:3:{i:0;s:6:"Import";i:1;s:6:"import";i:2;s:10:"import.php";}i:15;a:3:{i:0;s:6:"Export";i:1;s:6:"export";i:2;s:10:"export.php";}i:16;a:4:{i:0;s:17:"Delete Transients";i:1;s:14:"manage_options";i:2;s:9:"delxtrans";i:3;s:17:"Delete Transients";}i:17;a:4:{i:0;s:11:"Redirection";i:1;s:13:"administrator";i:2;s:15:"redirection.php";i:3;s:11:"Redirection";}i:18;a:4:{i:0;s:14:"Migrate DB Pro";i:1;s:6:"export";i:2;s:17:"wp-migrate-db-pro";i:3;s:14:"Migrate DB Pro";}}s:19:"options-general.php";a:15:{i:10;a:3:{i:0;s:7:"General";i:1;s:14:"manage_options";i:2;s:19:"options-general.php";}i:15;a:3:{i:0;s:7:"Writing";i:1;s:14:"manage_options";i:2;s:19:"options-writing.php";}i:20;a:3:{i:0;s:7:"Reading";i:1;s:14:"manage_options";i:2;s:19:"options-reading.php";}i:25;a:3:{i:0;s:10:"Discussion";i:1;s:14:"manage_options";i:2;s:22:"options-discussion.php";}i:30;a:3:{i:0;s:5:"Media";i:1;s:14:"manage_options";i:2;s:17:"options-media.php";}i:40;a:3:{i:0;s:10:"Permalinks";i:1;s:14:"manage_options";i:2;s:21:"options-permalink.php";}i:41;a:4:{i:0;s:10:"Adminimize";i:1;s:14:"manage_options";i:2;s:25:"adminimize/adminimize.php";i:3;s:18:"Adminimize Options";}i:42;a:4:{i:0;s:10:"Relevanssi";i:1;s:14:"manage_options";i:2;s:25:"relevanssi/relevanssi.php";i:3;s:10:"Relevanssi";}i:43;a:4:{i:0;s:16:"TinyMCE Advanced";i:1;s:14:"manage_options";i:2;s:16:"tinymce-advanced";i:3;s:16:"TinyMCE Advanced";}i:44;a:4:{i:0;s:13:"wp-Typography";i:1;i:9;i:2;s:13:"wp-typography";i:3;s:13:"wp-Typography";}i:45;a:4:{i:0;s:17:"Custom Upload Dir";i:1;s:14:"manage_options";i:2;s:39:"custom-upload-dir/custom_upload_dir.php";i:3;s:26:"Custom Upload Dir Settings";}i:46;a:4:{i:0;s:13:"Post Snippets";i:1;s:14:"manage_options";i:2;s:31:"post-snippets/post-snippets.php";i:3;s:21:"Post Snippets Options";}i:47;a:4:{i:0;s:18:"ImageMagick Engine";i:1;s:14:"manage_options";i:2;s:18:"imagemagick-engine";i:3;s:18:"ImageMagick Engine";}i:48;a:4:{i:0;s:13:"Admin Columns";i:1;s:20:"manage_admin_columns";i:2;s:23:"codepress-admin-columns";i:3;s:22:"Admin Columns Settings";}i:49;a:4:{i:0;s:7:"Upgrade";i:1;s:14:"manage_options";i:2;s:12:"cpac-upgrade";i:3;s:7:"Upgrade";}}s:15:"wpseo_dashboard";a:8:{i:0;a:7:{i:0;s:9:"Dashboard";i:1;s:14:"manage_options";i:2;s:15:"wpseo_dashboard";i:3;s:37:"Yoast WordPress SEO: General Settings";i:4;s:38:"menu-top toplevel_page_wpseo_dashboard";i:5;s:29:"toplevel_page_wpseo_dashboard";i:6;s:75:"http://wordpress.loc/wp-content/plugins/wordpress-seo/images/yoast-icon.png";}i:1;a:4:{i:0;s:18:"Titles &amp; Metas";i:1;s:14:"manage_options";i:2;s:12:"wpseo_titles";i:3;s:39:"Yoast WordPress SEO: Titles &amp; Metas";}i:2;a:4:{i:0;s:6:"Social";i:1;s:14:"manage_options";i:2;s:12:"wpseo_social";i:3;s:27:"Yoast WordPress SEO: Social";}i:3;a:4:{i:0;s:12:"XML Sitemaps";i:1;s:14:"manage_options";i:2;s:9:"wpseo_xml";i:3;s:33:"Yoast WordPress SEO: XML Sitemaps";}i:4;a:4:{i:0;s:10:"Permalinks";i:1;s:14:"manage_options";i:2;s:16:"wpseo_permalinks";i:3;s:31:"Yoast WordPress SEO: Permalinks";}i:5;a:4:{i:0;s:14:"Internal Links";i:1;s:14:"manage_options";i:2;s:20:"wpseo_internal-links";i:3;s:35:"Yoast WordPress SEO: Internal Links";}i:6;a:4:{i:0;s:3:"RSS";i:1;s:14:"manage_options";i:2;s:9:"wpseo_rss";i:3;s:24:"Yoast WordPress SEO: RSS";}i:7;a:4:{i:0;s:15:"Import & Export";i:1;s:14:"manage_options";i:2;s:12:"wpseo_import";i:3;s:36:"Yoast WordPress SEO: Import & Export";}}s:18:"better-wp-security";a:13:{i:0;a:7:{i:0;s:9:"Dashboard";i:1;s:14:"manage_options";i:2;s:18:"better-wp-security";i:3;s:30:"Better WP Security - Dashboard";i:4;s:41:"menu-top toplevel_page_better-wp-security";i:5;s:32:"toplevel_page_better-wp-security";i:6;s:82:"http://wordpress.loc/wp-content/plugins/better-wp-security/images/shield-small.png";}i:1;a:4:{i:0;s:10:"Admin User";i:1;s:14:"manage_options";i:2;s:28:"better-wp-security-adminuser";i:3;s:38:"Better WP Security - Change Admin User";}i:2;a:4:{i:0;s:9:"Away Mode";i:1;s:14:"manage_options";i:2;s:27:"better-wp-security-awaymode";i:3;s:30:"Better WP Security - Away Mode";}i:3;a:4:{i:0;s:9:"Ban Users";i:1;s:14:"manage_options";i:2;s:27:"better-wp-security-banusers";i:3;s:30:"Better WP Security - Ban Users";}i:4;a:4:{i:0;s:17:"Content Directory";i:1;s:14:"manage_options";i:2;s:35:"better-wp-security-contentdirectory";i:3;s:45:"Better WP Security - Change Content Directory";}i:5;a:4:{i:0;s:15:"Database Backup";i:1;s:14:"manage_options";i:2;s:33:"better-wp-security-databasebackup";i:3;s:46:"Better WP Security - Backup WordPress Database";}i:6;a:4:{i:0;s:15:"Database Prefix";i:1;s:14:"manage_options";i:2;s:33:"better-wp-security-databaseprefix";i:3;s:43:"Better WP Security - Change Database Prefix";}i:7;a:4:{i:0;s:12:"Hide Backend";i:1;s:14:"manage_options";i:2;s:30:"better-wp-security-hidebackend";i:3;s:33:"Better WP Security - Hide Backend";}i:8;a:4:{i:0;s:19:"Intrusion Detection";i:1;s:14:"manage_options";i:2;s:37:"better-wp-security-intrusiondetection";i:3;s:40:"Better WP Security - Intrusion Detection";}i:9;a:4:{i:0;s:12:"Login Limits";i:1;s:14:"manage_options";i:2;s:30:"better-wp-security-loginlimits";i:3;s:41:"Better WP Security - Limit Login Attempts";}i:10;a:4:{i:0;s:3:"SSL";i:1;s:14:"manage_options";i:2;s:22:"better-wp-security-ssl";i:3;s:51:"Better WP Security - Secure Communications With SSL";}i:11;a:4:{i:0;s:13:"System Tweaks";i:1;s:14:"manage_options";i:2;s:31:"better-wp-security-systemtweaks";i:3;s:44:"Better WP Security - WordPress System Tweaks";}i:12;a:4:{i:0;s:9:"View Logs";i:1;s:14:"manage_options";i:2;s:23:"better-wp-security-logs";i:3;s:30:"Better WP Security - View Logs";}}s:14:"w3tc_dashboard";a:16:{i:0;a:4:{i:0;s:9:"Dashboard";i:1;s:14:"manage_options";i:2;s:14:"w3tc_dashboard";i:3;s:26:"Dashboard | W3 Total Cache";}i:1;a:4:{i:0;s:16:"General Settings";i:1;s:14:"manage_options";i:2;s:12:"w3tc_general";i:3;s:33:"General Settings | W3 Total Cache";}i:2;a:4:{i:0;s:10:"Page Cache";i:1;s:14:"manage_options";i:2;s:12:"w3tc_pgcache";i:3;s:27:"Page Cache | W3 Total Cache";}i:3;a:4:{i:0;s:6:"Minify";i:1;s:14:"manage_options";i:2;s:11:"w3tc_minify";i:3;s:23:"Minify | W3 Total Cache";}i:4;a:4:{i:0;s:14:"Database Cache";i:1;s:14:"manage_options";i:2;s:12:"w3tc_dbcache";i:3;s:31:"Database Cache | W3 Total Cache";}i:5;a:4:{i:0;s:12:"Object Cache";i:1;s:14:"manage_options";i:2;s:16:"w3tc_objectcache";i:3;s:29:"Object Cache | W3 Total Cache";}i:6;a:4:{i:0;s:13:"Browser Cache";i:1;s:14:"manage_options";i:2;s:17:"w3tc_browsercache";i:3;s:30:"Browser Cache | W3 Total Cache";}i:7;a:4:{i:0;s:17:"User Agent Groups";i:1;s:14:"manage_options";i:2;s:11:"w3tc_mobile";i:3;s:34:"User Agent Groups | W3 Total Cache";}i:8;a:4:{i:0;s:15:"Referrer Groups";i:1;s:14:"manage_options";i:2;s:13:"w3tc_referrer";i:3;s:32:"Referrer Groups | W3 Total Cache";}i:9;a:4:{i:0;s:55:"<acronym title="Content Delivery Network">CDN</acronym>";i:1;s:14:"manage_options";i:2;s:8:"w3tc_cdn";i:3;s:41:"Content Delivery Network | W3 Total Cache";}i:10;a:4:{i:0;s:10:"Monitoring";i:1;s:14:"manage_options";i:2;s:15:"w3tc_monitoring";i:3;s:27:"Monitoring | W3 Total Cache";}i:11;a:4:{i:0;s:10:"Extensions";i:1;s:14:"manage_options";i:2;s:15:"w3tc_extensions";i:3;s:27:"Extensions | W3 Total Cache";}i:12;a:4:{i:0;s:3:"FAQ";i:1;s:14:"manage_options";i:2;s:8:"w3tc_faq";i:3;s:20:"FAQ | W3 Total Cache";}i:13;a:4:{i:0;s:40:"<span style="color: red;">Support</span>";i:1;s:14:"manage_options";i:2;s:12:"w3tc_support";i:3;s:24:"Support | W3 Total Cache";}i:14;a:4:{i:0;s:7:"Install";i:1;s:14:"manage_options";i:2;s:12:"w3tc_install";i:3;s:24:"Install | W3 Total Cache";}i:15;a:4:{i:0;s:5:"About";i:1;s:14:"manage_options";i:2;s:10:"w3tc_about";i:3;s:22:"About | W3 Total Cache";}}s:22:"edit.php?post_type=acf";a:4:{i:0;a:7:{i:0;s:13:"Custom Fields";i:1;s:14:"manage_options";i:2;s:22:"edit.php?post_type=acf";i:3;s:13:"Custom Fields";i:4;s:59:"menu-top menu-icon-generic toplevel_page_edit?post_type=acf";i:5;s:32:"toplevel_page_edit?post_type=acf";i:6;s:4:"none";}i:1;a:4:{i:0;s:6:"Export";i:1;s:14:"manage_options";i:2;s:10:"acf-export";i:3;s:6:"Export";}i:2;a:4:{i:0;s:7:"Add-ons";i:1;s:14:"manage_options";i:2;s:10:"acf-addons";i:3;s:7:"Add-ons";}i:3;a:4:{i:0;s:7:"Upgrade";i:1;s:14:"manage_options";i:2;s:11:"acf-upgrade";i:3;s:7:"Upgrade";}}}}', 'yes'),
(3184, 'link_manager_enabled', '0', 'yes'),
(3185, 'db_upgraded', '', 'yes'),
(3492, 'acf_next_field_id', '22', 'yes'),
(7254, 'relevanssi_index_taxonomies_list', 'a:2:{i:0;s:8:"post_tag";i:1;s:0:"";}', 'yes'),
(7325, 'wpseo_permalinks', 'a:13:{s:15:"cleanpermalinks";b:0;s:24:"cleanpermalink-extravars";s:0:"";s:29:"cleanpermalink-googlecampaign";b:0;s:31:"cleanpermalink-googlesitesearch";b:0;s:15:"cleanreplytocom";b:1;s:10:"cleanslugs";b:1;s:14:"hide-feedlinks";b:0;s:12:"hide-rsdlink";b:0;s:14:"hide-shortlink";b:0;s:16:"hide-wlwmanifest";b:0;s:18:"redirectattachment";b:1;s:17:"stripcategorybase";b:0;s:13:"trailingslash";b:0;}', 'yes'),
(7330, 'cpac_options_acf', 'a:7:{s:11:"product-tag";a:5:{s:5:"state";s:2:"on";s:5:"label";s:43:"<div class="product product-tag">Tags</div>";s:5:"width";s:1:"0";s:4:"type";s:11:"product-tag";s:5:"clone";s:0:"";}s:16:"product-category";a:5:{s:5:"state";s:2:"on";s:5:"label";s:54:"<div class="product product-category">Categories</div>";s:5:"width";s:1:"0";s:4:"type";s:16:"product-category";s:5:"clone";s:0:"";}s:14:"ame_page_order";a:5:{s:5:"state";s:2:"on";s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:5:"width";s:1:"0";s:4:"type";s:14:"ame_page_order";s:5:"clone";s:0:"";}s:5:"title";a:5:{s:5:"state";s:2:"on";s:5:"label";s:5:"Title";s:5:"width";s:1:"0";s:4:"type";s:5:"title";s:5:"clone";s:0:"";}s:4:"date";a:5:{s:5:"state";s:2:"on";s:5:"label";s:4:"Date";s:5:"width";s:1:"0";s:4:"type";s:4:"date";s:5:"clone";s:0:"";}s:15:"ame_tag_actions";a:5:{s:5:"state";s:2:"on";s:5:"label";s:96:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Tags</abbr>";s:5:"width";s:1:"0";s:4:"type";s:15:"ame_tag_actions";s:5:"clone";s:0:"";}s:16:"ame_post_actions";a:5:{s:5:"state";s:2:"on";s:5:"label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:5:"width";s:1:"0";s:4:"type";s:16:"ame_post_actions";s:5:"clone";s:0:"";}}', 'yes'),
(7331, 'cpac_options_news', 'a:11:{s:11:"product-tag";a:5:{s:5:"state";s:2:"on";s:5:"label";s:43:"<div class="product product-tag">Tags</div>";s:5:"width";s:1:"0";s:4:"type";s:11:"product-tag";s:5:"clone";s:0:"";}s:16:"product-category";a:5:{s:5:"state";s:2:"on";s:5:"label";s:54:"<div class="product product-category">Categories</div>";s:5:"width";s:1:"0";s:4:"type";s:16:"product-category";s:5:"clone";s:0:"";}s:14:"ame_page_order";a:5:{s:5:"state";s:2:"on";s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:5:"width";s:1:"0";s:4:"type";s:14:"ame_page_order";s:5:"clone";s:0:"";}s:5:"title";a:5:{s:5:"state";s:2:"on";s:5:"label";s:5:"Title";s:5:"width";s:1:"0";s:4:"type";s:5:"title";s:5:"clone";s:0:"";}s:8:"comments";a:5:{s:5:"state";s:2:"on";s:5:"label";s:115:"<span class="vers"><img alt="Comments" src="http://wordpress.loc/wp-admin/images/comment-grey-bubble.png" /></span>";s:5:"width";s:1:"0";s:4:"type";s:8:"comments";s:5:"clone";s:0:"";}s:4:"date";a:5:{s:5:"state";s:2:"on";s:5:"label";s:4:"Date";s:5:"width";s:1:"0";s:4:"type";s:4:"date";s:5:"clone";s:0:"";}s:15:"ame_cat_actions";a:5:{s:5:"state";s:2:"on";s:5:"label";s:102:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Categories</abbr>";s:5:"width";s:1:"0";s:4:"type";s:15:"ame_cat_actions";s:5:"clone";s:0:"";}s:15:"ame_tag_actions";a:5:{s:5:"state";s:2:"on";s:5:"label";s:96:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Tags</abbr>";s:5:"width";s:1:"0";s:4:"type";s:15:"ame_tag_actions";s:5:"clone";s:0:"";}s:16:"ame_post_actions";a:5:{s:5:"state";s:2:"on";s:5:"label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:5:"width";s:1:"0";s:4:"type";s:16:"ame_post_actions";s:5:"clone";s:0:"";}s:11:"wpseo-score";a:5:{s:5:"state";s:2:"on";s:5:"label";s:3:"SEO";s:5:"width";s:1:"0";s:4:"type";s:11:"wpseo-score";s:5:"clone";s:0:"";}s:13:"column-postid";a:5:{s:5:"state";s:2:"on";s:5:"label";s:2:"ID";s:5:"width";s:0:"";s:4:"type";s:13:"column-postid";s:5:"clone";s:0:"";}}', 'yes'),
(7332, 'cpac_options_homeslide', 'a:9:{s:11:"product-tag";a:5:{s:5:"state";s:2:"on";s:5:"label";s:43:"<div class="product product-tag">Tags</div>";s:5:"width";s:1:"0";s:4:"type";s:11:"product-tag";s:5:"clone";s:0:"";}s:16:"product-category";a:5:{s:5:"state";s:2:"on";s:5:"label";s:54:"<div class="product product-category">Categories</div>";s:5:"width";s:1:"0";s:4:"type";s:16:"product-category";s:5:"clone";s:0:"";}s:14:"ame_page_order";a:5:{s:5:"state";s:2:"on";s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:5:"width";s:1:"0";s:4:"type";s:14:"ame_page_order";s:5:"clone";s:0:"";}s:12:"column-order";a:5:{s:5:"state";s:2:"on";s:5:"label";s:7:"ReOrder";s:5:"width";s:1:"5";s:4:"type";s:12:"column-order";s:5:"clone";s:0:"";}s:5:"title";a:5:{s:5:"state";s:2:"on";s:5:"label";s:5:"Title";s:5:"width";s:1:"0";s:4:"type";s:5:"title";s:5:"clone";s:0:"";}s:4:"date";a:5:{s:5:"state";s:2:"on";s:5:"label";s:4:"Date";s:5:"width";s:1:"0";s:4:"type";s:4:"date";s:5:"clone";s:0:"";}s:15:"ame_tag_actions";a:5:{s:5:"state";s:2:"on";s:5:"label";s:96:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Tags</abbr>";s:5:"width";s:1:"0";s:4:"type";s:15:"ame_tag_actions";s:5:"clone";s:0:"";}s:16:"ame_post_actions";a:5:{s:5:"state";s:2:"on";s:5:"label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:5:"width";s:1:"0";s:4:"type";s:16:"ame_post_actions";s:5:"clone";s:0:"";}s:13:"column-postid";a:5:{s:5:"state";s:2:"on";s:5:"label";s:2:"ID";s:5:"width";s:0:"";s:4:"type";s:13:"column-postid";s:5:"clone";s:0:"";}}', 'yes'),
(7333, 'cpac_options_products', 'a:7:{s:5:"title";a:5:{s:5:"state";s:2:"on";s:5:"label";s:5:"Title";s:5:"width";s:1:"0";s:4:"type";s:5:"title";s:5:"clone";s:0:"";}s:4:"date";a:5:{s:5:"state";s:2:"on";s:5:"label";s:4:"Date";s:5:"width";s:1:"0";s:4:"type";s:4:"date";s:5:"clone";s:0:"";}s:16:"ame_post_actions";a:5:{s:5:"state";s:2:"on";s:5:"label";s:349:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http://wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:5:"width";s:1:"0";s:4:"type";s:16:"ame_post_actions";s:5:"clone";s:0:"";}s:11:"wpseo-score";a:5:{s:5:"state";s:2:"on";s:5:"label";s:3:"SEO";s:5:"width";s:1:"0";s:4:"type";s:11:"wpseo-score";s:5:"clone";s:0:"";}s:16:"product-category";a:5:{s:5:"state";s:2:"on";s:5:"label";s:55:"<div class="products product-category">Categories</div>";s:5:"width";s:1:"0";s:4:"type";s:16:"product-category";s:5:"clone";s:0:"";}s:11:"product-tag";a:5:{s:5:"state";s:2:"on";s:5:"label";s:44:"<div class="products product-tag">Tags</div>";s:5:"width";s:1:"0";s:4:"type";s:11:"product-tag";s:5:"clone";s:0:"";}s:14:"ame_page_order";a:5:{s:5:"state";s:2:"on";s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Post Order:</abbr>";s:5:"width";s:1:"0";s:4:"type";s:14:"ame_page_order";s:5:"clone";s:0:"";}}', 'yes'),
(7334, 'cpac_options_post', 'a:7:{s:13:"column-postid";a:4:{s:4:"type";s:13:"column-postid";s:5:"clone";s:0:"";s:5:"label";s:2:"ID";s:5:"width";s:1:"3";}s:5:"title";a:4:{s:4:"type";s:5:"title";s:5:"clone";s:0:"";s:5:"label";s:5:"Title";s:5:"width";s:1:"0";}s:6:"author";a:4:{s:4:"type";s:6:"author";s:5:"clone";s:0:"";s:5:"label";s:6:"Author";s:5:"width";s:1:"0";}s:4:"date";a:4:{s:4:"type";s:4:"date";s:5:"clone";s:0:"";s:5:"label";s:4:"Date";s:5:"width";s:1:"0";}s:15:"ame_cat_actions";a:4:{s:4:"type";s:15:"ame_cat_actions";s:5:"clone";s:0:"";s:5:"label";s:102:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.9">Categories</abbr>";s:5:"width";s:1:"0";}s:15:"ame_tag_actions";a:4:{s:4:"type";s:15:"ame_tag_actions";s:5:"clone";s:0:"";s:5:"label";s:96:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.9">Tags</abbr>";s:5:"width";s:1:"0";}s:16:"ame_post_actions";a:4:{s:4:"type";s:16:"ame_post_actions";s:5:"clone";s:0:"";s:5:"label";s:344:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.9">Actions</abbr> <a href="javascript:void(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="[cpac_site_url]/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:5:"width";s:1:"0";}}', 'yes'),
(7335, 'cpac_options_page', 'a:5:{s:13:"column-postid";a:5:{s:11:"column-name";s:13:"column-postid";s:4:"type";s:13:"column-postid";s:5:"clone";s:0:"";s:5:"label";s:2:"ID";s:5:"width";s:1:"5";}s:5:"title";a:5:{s:11:"column-name";s:5:"title";s:4:"type";s:5:"title";s:5:"clone";s:0:"";s:5:"label";s:5:"Title";s:5:"width";s:1:"0";}s:4:"date";a:5:{s:11:"column-name";s:4:"date";s:4:"type";s:4:"date";s:5:"clone";s:0:"";s:5:"label";s:4:"Date";s:5:"width";s:1:"0";}s:16:"ame_page_actions";a:5:{s:11:"column-name";s:16:"ame_page_actions";s:4:"type";s:16:"ame_page_actions";s:5:"clone";s:0:"";s:5:"label";s:348:"<abbr style="cursorhelp;" title="Enhanced by Admin Management Xtended Plugin 2.3.9.2">Actions</abbr> <a href="javascriptvoid(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http//wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:5:"width";s:1:"0";}s:14:"ame_page_order";a:5:{s:11:"column-name";s:14:"ame_page_order";s:4:"type";s:14:"ame_page_order";s:5:"clone";s:0:"";s:5:"label";s:103:"<abbr style="cursorhelp;" title="Enhanced by Admin Management Xtended Plugin 2.3.9.2">Post Order</abbr>";s:5:"width";s:0:"";}}', 'yes'),
(7336, 'cpac_options_wp-users', 'a:5:{s:8:"username";a:5:{s:5:"state";s:2:"on";s:5:"label";s:8:"Username";s:5:"width";s:1:"0";s:4:"type";s:8:"username";s:5:"clone";s:0:"";}s:4:"name";a:5:{s:5:"state";s:2:"on";s:5:"label";s:4:"Name";s:5:"width";s:1:"0";s:4:"type";s:4:"name";s:5:"clone";s:0:"";}s:5:"email";a:5:{s:5:"state";s:2:"on";s:5:"label";s:6:"E-mail";s:5:"width";s:1:"0";s:4:"type";s:5:"email";s:5:"clone";s:0:"";}s:4:"role";a:5:{s:5:"state";s:2:"on";s:5:"label";s:4:"Role";s:5:"width";s:1:"0";s:4:"type";s:4:"role";s:5:"clone";s:0:"";}s:5:"posts";a:5:{s:5:"state";s:2:"on";s:5:"label";s:5:"Posts";s:5:"width";s:1:"0";s:4:"type";s:5:"posts";s:5:"clone";s:0:"";}}', 'yes'),
(7337, 'cpac_options_wp-media', 'a:8:{s:4:"icon";a:5:{s:5:"state";s:2:"on";s:5:"label";s:0:"";s:5:"width";s:1:"0";s:4:"type";s:4:"icon";s:5:"clone";s:0:"";}s:5:"title";a:5:{s:5:"state";s:2:"on";s:5:"label";s:4:"File";s:5:"width";s:1:"0";s:4:"type";s:5:"title";s:5:"clone";s:0:"";}s:6:"author";a:5:{s:5:"state";s:2:"on";s:5:"label";s:6:"Author";s:5:"width";s:1:"0";s:4:"type";s:6:"author";s:5:"clone";s:0:"";}s:6:"parent";a:5:{s:5:"state";s:2:"on";s:5:"label";s:11:"Attached to";s:5:"width";s:1:"0";s:4:"type";s:6:"parent";s:5:"clone";s:0:"";}s:8:"comments";a:5:{s:5:"state";s:2:"on";s:5:"label";s:115:"<span class="vers"><img alt="Comments" src="http://wordpress.loc/wp-admin/images/comment-grey-bubble.png" /></span>";s:5:"width";s:1:"0";s:4:"type";s:8:"comments";s:5:"clone";s:0:"";}s:4:"date";a:5:{s:5:"state";s:2:"on";s:5:"label";s:4:"Date";s:5:"width";s:1:"0";s:4:"type";s:4:"date";s:5:"clone";s:0:"";}s:14:"ame_media_desc";a:5:{s:5:"state";s:2:"on";s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Description</abbr>";s:5:"width";s:1:"0";s:4:"type";s:14:"ame_media_desc";s:5:"clone";s:0:"";}s:15:"ame_media_order";a:5:{s:5:"state";s:2:"on";s:5:"label";s:103:"<abbr style="cursor:help;" title="Enhanced by Admin Management Xtended Plugin 2.3.6">Media Order</abbr>";s:5:"width";s:1:"0";s:4:"type";s:15:"ame_media_order";s:5:"clone";s:0:"";}}', 'yes'),
(7338, 'cpac_options_wp-links', 'a:6:{s:4:"name";a:5:{s:5:"state";s:2:"on";s:5:"label";s:4:"Name";s:5:"width";s:1:"0";s:4:"type";s:4:"name";s:5:"clone";s:0:"";}s:3:"url";a:5:{s:5:"state";s:2:"on";s:5:"label";s:3:"URL";s:5:"width";s:1:"0";s:4:"type";s:3:"url";s:5:"clone";s:0:"";}s:10:"categories";a:5:{s:5:"state";s:2:"on";s:5:"label";s:10:"Categories";s:5:"width";s:1:"0";s:4:"type";s:10:"categories";s:5:"clone";s:0:"";}s:3:"rel";a:5:{s:5:"state";s:2:"on";s:5:"label";s:12:"Relationship";s:5:"width";s:1:"0";s:4:"type";s:3:"rel";s:5:"clone";s:0:"";}s:7:"visible";a:5:{s:5:"state";s:2:"on";s:5:"label";s:7:"Visible";s:5:"width";s:1:"0";s:4:"type";s:7:"visible";s:5:"clone";s:0:"";}s:6:"rating";a:5:{s:5:"state";s:2:"on";s:5:"label";s:6:"Rating";s:5:"width";s:1:"0";s:4:"type";s:6:"rating";s:5:"clone";s:0:"";}}', 'yes'),
(7339, 'cpac_options_wp-comments', 'a:3:{s:6:"author";a:5:{s:5:"state";s:2:"on";s:5:"label";s:6:"Author";s:5:"width";s:1:"0";s:4:"type";s:6:"author";s:5:"clone";s:0:"";}s:7:"comment";a:5:{s:5:"state";s:2:"on";s:5:"label";s:7:"Comment";s:5:"width";s:1:"0";s:4:"type";s:7:"comment";s:5:"clone";s:0:"";}s:8:"response";a:5:{s:5:"state";s:2:"on";s:5:"label";s:14:"In Response To";s:5:"width";s:1:"0";s:4:"type";s:8:"response";s:5:"clone";s:0:"";}}', 'yes'),
(7340, 'cpac_version', '2.4.3', 'yes'),
(7355, 'product-category_children', 'a:1:{i:24;a:1:{i:0;i:25;}}', 'yes'),
(7362, 'relevanssi_show_matches_text', '', 'yes'),
(7363, 'relevanssi_log_queries_with_ip', 'off', 'yes'),
(7364, 'relevanssi_index', '', 'yes'),
(7365, 'relevanssi_indexed', 'done', 'yes'),
(7366, 'theme_mods_theme-name', 'a:1:{i:0;b:0;}', 'yes'),
(7367, 'redirection_options', 'a:8:{s:12:"monitor_post";s:1:"2";s:11:"auto_target";s:0:"";s:7:"support";b:0;s:16:"log_redirections";b:1;s:8:"log_404s";b:1;s:17:"monitor_new_posts";b:0;s:6:"expire";i:0;s:5:"token";s:32:"5dd559fff9c4cd9d363e8164a022286d";}', 'yes'),
(7368, 'redirection_version', '2.3.1', 'yes'),
(7371, 'wpmdb_settings', 'a:9:{s:11:"max_request";i:26214400;s:3:"key";s:32:"0a3z0VzkiDQTsceOmKZTNJzNDWvkbEo1";s:10:"allow_pull";b:1;s:10:"allow_push";b:0;s:8:"profiles";a:1:{i:0;a:18:{s:13:"save_computer";s:1:"1";s:9:"gzip_file";s:1:"0";s:13:"replace_guids";s:1:"0";s:12:"exclude_spam";s:1:"1";s:19:"keep_active_plugins";s:1:"0";s:13:"create_backup";s:1:"0";s:18:"exclude_post_types";s:1:"0";s:6:"action";s:8:"savefile";s:15:"connection_info";s:0:"";s:11:"replace_old";a:2:{i:1;s:15:"//wordpress.loc";i:2;s:39:"/_DEV/__REPO/boilerplates/wordpress/dev";}s:11:"replace_new";a:2:{i:1;s:15:"//wordpress.loc";i:2;s:39:"/_DEV/__REPO/boilerplates/wordpress/dev";}s:20:"table_migrate_option";s:24:"migrate_only_with_prefix";s:18:"exclude_transients";s:1:"1";s:13:"backup_option";s:23:"backup_only_with_prefix";s:22:"save_migration_profile";s:1:"1";s:29:"save_migration_profile_option";s:1:"0";s:18:"create_new_profile";s:0:"";s:4:"name";s:12:"[export] dev";}}s:7:"licence";s:36:"7099b914-42cd-4be7-bc04-2215926b87a9";s:13:"licence_email";s:23:"andy@aardvarklondon.com";s:10:"verify_ssl";b:0;s:17:"blacklist_plugins";a:0:{}}', 'yes'),
(7417, 'cpac_options_post_default', 'a:13:{i:0;s:2:"cb";i:1;s:5:"title";i:2;s:6:"author";i:3;s:8:"comments";i:4;s:4:"date";i:5;s:15:"ame_cat_actions";i:6;s:15:"ame_tag_actions";i:7;s:16:"ame_post_actions";i:8;s:14:"ame_page_order";i:9;s:11:"wpseo-score";i:10;s:11:"wpseo-title";i:11;s:14:"wpseo-metadesc";i:12;s:13:"wpseo-focuskw";}', 'yes'),
(7418, 'cpac_options_page_default', 'a:11:{i:0;s:2:"cb";i:1;s:5:"title";i:2;s:6:"author";i:3;s:8:"comments";i:4;s:4:"date";i:5;s:16:"ame_page_actions";i:6;s:14:"ame_page_order";i:7;s:11:"wpseo-score";i:8;s:11:"wpseo-title";i:9;s:14:"wpseo-metadesc";i:10;s:13:"wpseo-focuskw";}', 'yes'),
(7420, 'itsec_data', 'a:5:{s:5:"build";i:4036;s:20:"activation_timestamp";i:1396359222;s:17:"already_supported";b:1;s:15:"setup_completed";b:1;s:18:"tooltips_dismissed";b:1;}', 'yes');
INSERT INTO `uo6g6en_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(7421, 'itsec_global', 'a:24:{s:11:"write_files";b:1;s:18:"notification_email";a:1:{i:0;s:27:"designers@aardvarkmedia.com";}s:12:"digest_email";b:1;s:12:"backup_email";a:1:{i:0;s:27:"designers@aardvarkmedia.com";}s:15:"lockout_message";s:5:"error";s:20:"user_lockout_message";s:56:"You have been locked out due to too many login attempts.";s:25:"community_lockout_message";s:77:"Your IP address has been flagged as a threat by the iThemes Security network.";s:9:"blacklist";b:1;s:15:"blacklist_count";i:3;s:16:"blacklist_period";i:7;s:14:"lockout_period";i:15;s:18:"lockout_white_list";a:0:{}s:19:"email_notifications";b:1;s:8:"log_type";i:0;s:12:"log_rotation";i:30;s:12:"log_location";s:88:"F:\\__www\\wordpress-loc\\www\\core/F:\\__www\\wordpress-loc/www/uploads/ithemes-security/logs";s:14:"hide_admin_bar";b:1;s:11:"did_upgrade";b:1;s:14:"allow_tracking";b:0;s:10:"nginx_file";s:42:"F:\\__www\\wordpress-loc\\www\\core/nginx.conf";s:24:"infinitewp_compatibility";b:0;s:8:"log_info";s:19:"site-title-WmAPvrFk";s:9:"lock_file";b:0;s:14:"proxy_override";b:0;}', 'yes'),
(7422, 'itsec_initials', 'a:3:{s:5:"login";b:0;s:5:"admin";b:0;s:11:"file_editor";b:1;}', 'yes'),
(7423, 'itsec_four_oh_four', 'a:5:{s:12:"check_period";i:5;s:15:"error_threshold";i:20;s:10:"white_list";a:9:{i:0;s:12:"/favicon.ico";i:1;s:11:"/robots.txt";i:2;s:21:"/apple-touch-icon.png";i:3;s:33:"/apple-touch-icon-precomposed.png";i:4;s:17:"/wp-content/cache";i:5;s:18:"/browserconfig.xml";i:6;s:16:"/crossdomain.xml";i:7;s:11:"/labels.rdf";i:8;s:27:"/trafficbasedsspsitemap.xml";}s:5:"types";a:5:{i:0;s:4:".jpg";i:1;s:5:".jpeg";i:2;s:4:".png";i:3;s:4:".gif";i:4;s:4:".css";}s:7:"enabled";b:0;}', 'yes'),
(7424, 'itsec_away_mode', 'a:4:{s:7:"enabled";b:1;s:4:"type";i:1;s:5:"start";i:1432342800;s:3:"end";i:1432449000;}', 'yes'),
(7425, 'itsec_ban_users', 'a:4:{s:7:"default";b:1;s:9:"host_list";a:0:{}s:10:"agent_list";a:1:{i:0;s:0:"";}s:7:"enabled";b:0;}', 'yes'),
(7427, 'itsec_brute_force', 'a:5:{s:17:"max_attempts_host";i:4;s:17:"max_attempts_user";i:4;s:12:"check_period";i:43200;s:7:"enabled";b:0;s:14:"auto_ban_admin";b:0;}', 'yes'),
(7428, 'itsec_backup', 'a:9:{s:6:"method";i:2;s:8:"location";s:91:"F:\\__www\\wordpress-loc\\www\\core/F:\\__www\\wordpress-loc/www/uploads/ithemes-security/backups";s:6:"retain";i:0;s:3:"zip";b:1;s:7:"exclude";a:3:{i:0;s:14:"itsec_lockouts";i:1;s:9:"itsec_log";i:2;s:10:"itsec_temp";}s:8:"interval";i:1;s:7:"enabled";b:0;s:9:"all_sites";b:0;s:8:"last_run";i:0;}', 'yes'),
(7429, 'itsec_file_change', 'a:9:{s:6:"method";b:1;s:9:"file_list";a:1:{i:0;s:0:"";}s:5:"types";a:6:{i:0;s:4:".jpg";i:1;s:5:".jpeg";i:2;s:4:".png";i:3;s:4:".log";i:4;s:3:".mo";i:5;s:3:".po";}s:5:"email";b:1;s:12:"notify_admin";b:1;s:7:"enabled";b:0;s:5:"split";b:0;s:10:"last_chunk";b:0;s:8:"last_run";d:1432245821;}', 'yes'),
(7430, 'itsec_hide_backend', 'a:7:{s:7:"enabled";b:1;s:4:"slug";s:6:"manage";s:12:"theme_compat";b:1;s:17:"theme_compat_slug";s:9:"not_found";s:16:"post_logout_slug";s:0:"";s:12:"show-tooltip";b:0;s:8:"register";s:15:"wp-register.php";}', 'yes'),
(7431, 'itsec_ssl', 'a:3:{s:8:"frontend";i:0;s:5:"login";b:0;s:5:"admin";b:0;}', 'yes'),
(7432, 'itsec_strong_passwords', 'a:2:{s:7:"enabled";b:1;s:4:"roll";s:13:"administrator";}', 'yes'),
(7433, 'itsec_tweaks', 'a:22:{s:13:"protect_files";b:1;s:18:"directory_browsing";b:1;s:15:"request_methods";b:1;s:24:"suspicious_query_strings";b:1;s:22:"non_english_characters";b:1;s:16:"long_url_strings";b:1;s:11:"uploads_php";b:1;s:13:"generator_tag";b:1;s:18:"wlwmanifest_header";b:1;s:14:"edituri_header";b:1;s:12:"comment_spam";b:1;s:14:"random_version";b:1;s:11:"file_editor";b:1;s:14:"disable_xmlrpc";i:2;s:12:"login_errors";b:1;s:27:"disable_unused_author_pages";b:1;s:17:"write_permissions";b:0;s:13:"theme_updates";b:0;s:14:"plugin_updates";b:0;s:12:"core_updates";b:0;s:11:"safe_jquery";b:0;s:21:"force_unique_nicename";b:0;}', 'yes'),
(7435, 'wpseo_internallinks', 'a:10:{s:20:"breadcrumbs-404crumb";s:0:"";s:23:"breadcrumbs-blog-remove";b:0;s:20:"breadcrumbs-boldlast";b:0;s:25:"breadcrumbs-archiveprefix";s:0:"";s:18:"breadcrumbs-enable";b:0;s:16:"breadcrumbs-home";s:0:"";s:18:"breadcrumbs-prefix";s:0:"";s:24:"breadcrumbs-searchprefix";s:0:"";s:15:"breadcrumbs-sep";s:7:"&raquo;";s:23:"post_types-post-maintax";i:0;}', 'yes'),
(7442, 'itsec_jquery_version', '1.11.1', 'yes'),
(7452, 'auto_core_update_notified', 'a:4:{s:4:"type";s:6:"manual";s:5:"email";s:18:"reg@criography.com";s:7:"version";s:5:"3.8.2";s:9:"timestamp";i:1397663735;}', 'yes'),
(7459, 'am_options', 'a:1:{s:24:"am_visible_posts_in_grid";s:1:"8";}', 'yes'),
(7460, 'tadv_settings', 'a:6:{s:7:"options";s:15:"menubar,advlist";s:9:"toolbar_1";s:117:"bold,italic,blockquote,bullist,numlist,alignleft,aligncenter,alignright,link,unlink,table,fullscreen,undo,redo,wp_adv";s:9:"toolbar_2";s:121:"formatselect,alignjustify,strikethrough,outdent,indent,pastetext,removeformat,charmap,wp_more,emoticons,forecolor,wp_help";s:9:"toolbar_3";s:0:"";s:9:"toolbar_4";s:0:"";s:7:"plugins";s:107:"anchor,code,insertdatetime,nonbreaking,print,searchreplace,table,visualblocks,visualchars,emoticons,advlist";}', 'yes'),
(7461, 'tadv_admin_settings', 'a:1:{s:7:"options";a:0:{}}', 'yes'),
(7465, 'cpac_options_styleguide', 'a:4:{s:5:"title";a:4:{s:4:"type";s:5:"title";s:5:"clone";s:0:"";s:5:"label";s:5:"Title";s:5:"width";s:0:"";}s:21:"taxonomy-pattern-type";a:4:{s:4:"type";s:21:"taxonomy-pattern-type";s:5:"clone";s:0:"";s:5:"label";s:13:"Pattern Types";s:5:"width";s:0:"";}s:16:"ame_post_actions";a:4:{s:4:"type";s:16:"ame_post_actions";s:5:"clone";s:0:"";s:5:"label";s:348:"<abbr style="cursorhelp;" title="Enhanced by Admin Management Xtended Plugin 2.3.9.2">Actions</abbr> <a href="javascriptvoid(0);" onclick="ame_ajax_toggle_imageset(2);return false;"><img src="http//wordpress.loc/wp-content/plugins/admin-management-xtended/img/set1/changeimgset.gif" border="0" alt="Change image set" title="Change image set" /></a>";s:5:"width";s:0:"";}s:14:"ame_page_order";a:4:{s:4:"type";s:14:"ame_page_order";s:5:"clone";s:0:"";s:5:"label";s:103:"<abbr style="cursorhelp;" title="Enhanced by Admin Management Xtended Plugin 2.3.9.2">Post Order</abbr>";s:5:"width";s:0:"";}}', 'yes'),
(7466, 'cpac_options_styleguide_default', 'a:11:{i:0;s:2:"cb";i:1;s:5:"title";i:2;s:21:"taxonomy-pattern-type";i:3;s:4:"date";i:4;s:15:"ame_tag_actions";i:5;s:16:"ame_post_actions";i:6;s:14:"ame_page_order";i:7;s:11:"wpseo-score";i:8;s:11:"wpseo-title";i:9;s:14:"wpseo-metadesc";i:10;s:13:"wpseo-focuskw";}', 'yes'),
(7517, 'pattern-type_children', 'a:0:{}', 'yes'),
(7521, 'relevanssi_extag', '', 'yes'),
(9827, 'acf_pro_license', 'YToyOntzOjM6ImtleSI7czo3MjoiYjNKa1pYSmZhV1E5TXpnMU1EUjhkSGx3WlQxa1pYWmxiRzl3WlhKOFpHRjBaVDB5TURFMExUQTRMVEk1SURFME9qQTBPakk1IjtzOjM6InVybCI7czoyMDoiaHR0cDovL3dvcmRwcmVzcy5sb2MiO30=', 'yes'),
(10818, 'duplicate_post_copyexcerpt', '1', 'yes'),
(10819, 'duplicate_post_copyattachments', '0', 'yes'),
(10820, 'duplicate_post_copychildren', '0', 'yes'),
(10821, 'duplicate_post_copystatus', '0', 'yes'),
(10822, 'duplicate_post_taxonomies_blacklist', 'a:0:{}', 'yes'),
(10823, 'duplicate_post_show_row', '1', 'yes'),
(10824, 'duplicate_post_show_adminbar', '1', 'yes'),
(10825, 'duplicate_post_show_submitbox', '1', 'yes'),
(10826, 'duplicate_post_version', '2.6', 'yes'),
(11975, 'wpcf7', 'a:1:{s:7:"version";s:5:"3.9.3";}', 'yes'),
(12477, 'theme_mods_twentyfourteen', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1412283158;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";N;s:9:"sidebar-3";N;}}}', 'yes'),
(12629, 'WPLANG', 'en_GB', 'yes'),
(13191, 'itsec_message_queue', 'a:2:{s:9:"last_sent";i:1432326366;s:8:"messages";a:0:{}}', 'yes'),
(13517, 'crontrol_schedules', 'a:1:{s:10:"twicedaily";a:2:{s:8:"interval";i:43200;s:7:"display";s:11:"Twice Daily";}}', 'yes'),
(13629, 'itsec_ipcheck', 'a:1:{s:7:"api_ban";b:0;}', 'yes'),
(13631, 'itsec_malware', 'a:2:{s:7:"api_key";s:0:"";s:7:"enabled";b:0;}', 'yes'),
(13982, 'w3tc_request_data', '', 'no'),
(14423, 'auth_key', '6<`:Y7rk /T?@-Kq1QhPs+KDTz3Y9m8*X$LjJwzbl,Hy%ApTNb4BS0L;a*btW(BV', 'yes'),
(14424, 'auth_salt', 'o1/2<Yn0b[W%84P]lc1sQ6eZYMT57)en .7pBmmb1BX#XX$>e.|E=,B![n!y?6oz', 'yes'),
(14426, 'wpmdb_error_log', '********************************************\n******  Log date: 2014/05/08 12:30:14 ******\n********************************************\n\nWPMDB Error: WP_Error Object\n(\n    [errors] => Array\n        (\n            [http_request_failed] => Array\n                (\n                    [0] => connect() timed out!\n                )\n\n        )\n\n    [error_data] => Array\n        (\n        )\n\n)\n\n\n********************************************\n******  Log date: 2014/05/08 12:30:14 ******\n********************************************\n\nWPMDB Error: Error trying to get upgrade data.\n\nArray\n(\n    [connection_failed] => <div class="updated warning inline-message"><strong>Could not connect to deliciousbrains.com</strong> &mdash; You will not receive update notifications or be able to activate your license until this is fixed. This issue is often caused by an improperly configured SSL server (https). We recommend <a href="https://deliciousbrains.com/wp-migrate-db-pro/documentation/#could-no-connect" target="_blank">fixing the SSL configuration on your server</a>, but if you need a quick fix you can:<p><a href="http://wordpress.loc/wp-admin/tools.php?page=wp-migrate-db-pro&nonce=67c4f6f773&wpmdb-disable-ssl=1" class="temporarily-disable-ssl button">Temporarily disable SSL for connections to deliciousbrains.com</a></p></div>\n)\n\n\n********************************************\n******  Log date: 2014/05/08 12:30:17 ******\n********************************************\n\nWPMDB Error: WP_Error Object\n(\n    [errors] => Array\n        (\n            [http_request_failed] => Array\n                (\n                    [0] => SSL connection timeout\n                )\n\n        )\n\n    [error_data] => Array\n        (\n        )\n\n)\n\n\n********************************************\n******  Log date: 2014/05/08 12:30:17 ******\n********************************************\n\nWPMDB Error: Error trying to get upgrade data.\n\nArray\n(\n    [connection_failed] => <div class="updated warning inline-message"><strong>Could not connect to deliciousbrains.com</strong> &mdash; You will not receive update notifications or be able to activate your license until this is fixed. This issue is often caused by an improperly configured SSL server (https). We recommend <a href="https://deliciousbrains.com/wp-migrate-db-pro/documentation/#could-no-connect" target="_blank">fixing the SSL configuration on your server</a>, but if you need a quick fix you can:<p><a href="http://wordpress.loc/wp-admin/tools.php?page=wp-migrate-db-pro&nonce=67c4f6f773&wpmdb-disable-ssl=1" class="temporarily-disable-ssl button">Temporarily disable SSL for connections to deliciousbrains.com</a></p></div>\n)\n\n\n********************************************\n******  Log date: 2014/05/08 12:30:50 ******\n********************************************\n\nWPMDB Error: WP_Error Object\n(\n    [errors] => Array\n        (\n            [http_request_failed] => Array\n                (\n                    [0] => SSL connection timeout\n                )\n\n        )\n\n    [error_data] => Array\n        (\n        )\n\n)\n\n\n********************************************\n******  Log date: 2014/05/08 12:30:50 ******\n********************************************\n\nWPMDB Error: Error trying to get upgrade data.\n\nArray\n(\n    [connection_failed] => <div class="updated warning inline-message"><strong>Could not connect to deliciousbrains.com</strong> &mdash; You will not receive update notifications or be able to activate your license until this is fixed. This issue is often caused by an improperly configured SSL server (https). We recommend <a href="https://deliciousbrains.com/wp-migrate-db-pro/documentation/#could-no-connect" target="_blank">fixing the SSL configuration on your server</a>, but if you need a quick fix you can:<p><a href="http://wordpress.loc/wp-admin/tools.php?page=wp-migrate-db-pro&nonce=67c4f6f773&wpmdb-disable-ssl=1" class="temporarily-disable-ssl button">Temporarily disable SSL for connections to deliciousbrains.com</a></p></div>\n)\n\n\n********************************************\n******  Log date: 2014/05/08 12:34:58 ******\n********************************************\n\nWPMDB Error: WP_Error Object\n(\n    [errors] => Array\n        (\n            [http_request_failed] => Array\n                (\n                    [0] => Operation timed out after 30000 milliseconds with 0 bytes received\n                )\n\n        )\n\n    [error_data] => Array\n        (\n        )\n\n)\n\n\n********************************************\n******  Log date: 2014/05/08 12:34:58 ******\n********************************************\n\nWPMDB Error: Error trying to get upgrade data.\n\nArray\n(\n    [connection_failed] => <div class="updated warning inline-message"><strong>Could not connect to deliciousbrains.com</strong> &mdash; You will not receive update notifications or be able to activate your license until this is fixed. This issue is often caused by an improperly configured SSL server (https). We recommend <a href="https://deliciousbrains.com/wp-migrate-db-pro/documentation/#could-no-connect" target="_blank">fixing the SSL configuration on your server</a>, but if you need a quick fix you can:<p><a href="http://wordpress.loc/wp-admin/tools.php?page=wp-migrate-db-pro&nonce=67c4f6f773&wpmdb-disable-ssl=1" class="temporarily-disable-ssl button">Temporarily disable SSL for connections to deliciousbrains.com</a></p></div>\n)\n\n\n********************************************\n******  Log date: 2014/08/29 20:55:54 ******\n********************************************\n\nWPMDB Error: WP_Error Object\n(\n    [errors] => Array\n        (\n            [http_request_failed] => Array\n                (\n                    [0] => Failed connect to deliciousbrains.com:80; No error\n                )\n\n        )\n\n    [error_data] => Array\n        (\n        )\n\n)\n\n\n********************************************\n******  Log date: 2014/08/29 20:55:54 ******\n********************************************\n\nWPMDB Error: Error trying to get upgrade data.\n\nArray\n(\n    [connection_failed] => <div class="updated warning inline-message"><strong>Could not connect to deliciousbrains.com</strong> &mdash; You will not receive update notifications or be able to activate your license until this is fixed. This issue is often caused by an improperly configured SSL server (https). We recommend <a href="https://deliciousbrains.com/wp-migrate-db-pro/documentation/#could-no-connect" target="_blank">fixing the SSL configuration on your server</a>, but if you need a quick fix you can:<p><a href="http://wordpress.loc/wp-admin/tools.php?page=wp-migrate-db-pro&nonce=dd2d55c7ec&wpmdb-disable-ssl=1" class="temporarily-disable-ssl button">Temporarily disable SSL for connections to deliciousbrains.com</a></p></div>\n)\n\n\n********************************************\n******  Log date: 2014/08/29 20:56:21 ******\n********************************************\n\nWPMDB Error: WP_Error Object\n(\n    [errors] => Array\n        (\n            [http_request_failed] => Array\n                (\n                    [0] => Failed connect to deliciousbrains.com:80; No error\n                )\n\n        )\n\n    [error_data] => Array\n        (\n        )\n\n)\n\n\n********************************************\n******  Log date: 2014/08/29 20:56:21 ******\n********************************************\n\nWPMDB Error: Error trying to get upgrade data.\n\nArray\n(\n    [connection_failed] => <div class="updated warning inline-message"><strong>Could not connect to deliciousbrains.com</strong> &mdash; You will not receive update notifications or be able to activate your license until this is fixed. This issue is often caused by an improperly configured SSL server (https). We recommend <a href="https://deliciousbrains.com/wp-migrate-db-pro/documentation/#could-no-connect" target="_blank">fixing the SSL configuration on your server</a>, but if you need a quick fix you can:<p><a href="http://wordpress.loc/wp-admin/tools.php?page=wp-migrate-db-pro&nonce=dd2d55c7ec&wpmdb-disable-ssl=1" class="temporarily-disable-ssl button">Temporarily disable SSL for connections to deliciousbrains.com</a></p></div>\n)\n\n\n********************************************\n******  Log date: 2014/08/29 20:56:52 ******\n********************************************\n\nWPMDB Error: WP_Error Object\n(\n    [errors] => Array\n        (\n            [http_request_failed] => Array\n                (\n                    [0] => Failed connect to deliciousbrains.com:80; No error\n                )\n\n        )\n\n    [error_data] => Array\n        (\n        )\n\n)\n\n\n********************************************\n******  Log date: 2014/08/29 20:56:52 ******\n********************************************\n\nWPMDB Error: Error trying to get upgrade data.\n\nArray\n(\n    [connection_failed] => <div class="updated warning inline-message"><strong>Could not connect to deliciousbrains.com</strong> &mdash; You will not receive update notifications or be able to activate your license until this is fixed. This issue is often caused by an improperly configured SSL server (https). We recommend <a href="https://deliciousbrains.com/wp-migrate-db-pro/documentation/#could-no-connect" target="_blank">fixing the SSL configuration on your server</a>, but if you need a quick fix you can:<p><a href="http://wordpress.loc/wp-admin/tools.php?page=wp-migrate-db-pro&nonce=dd2d55c7ec&wpmdb-disable-ssl=1" class="temporarily-disable-ssl button">Temporarily disable SSL for connections to deliciousbrains.com</a></p></div>\n)\n\n\n', 'no'),
(14427, 'wpmdb_schema_version', '1', 'yes'),
(14428, 'nonce_key', '(.f.g:|c:>Kv>z4N,IyKA/Z9l%l;.tLer9-+v:kpB0`GYPuhjqhvH,`&XI%Bo|2]', 'yes'),
(14429, 'nonce_salt', '!3Ql%8gK^D.Lr{<.ih |zD$t{oT<6%ph!e(ylN5Zd*=iYs[:#N[#D#>^l*R69eDG', 'yes'),
(14431, 'logged_in_key', 'wL&fZ9~k(?@.kiDav-=iakqu4O),mJ}Ly-VN:{-~ Zu*G%m`HPRg8G5M:a$/mqc2', 'yes'),
(14432, 'logged_in_salt', '<G3l+hvoz!g(46=M|*0M LpN0l6K.ctD]gf?9N9XD>g9z-Oaq*H9JX,KRa~i`8:`', 'yes'),
(14433, 'rewrite_rules', 'a:77:{s:19:"sitemap_index\\.xml$";s:19:"index.php?sitemap=1";s:31:"([^/]+?)-sitemap([0-9]+)?\\.xml$";s:51:"index.php?sitemap=$matches[1]&sitemap_n=$matches[2]";s:24:"([a-z]+)?-?sitemap\\.xsl$";s:25:"index.php?xsl=$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:27:"comment-page-([0-9]{1,})/?$";s:40:"index.php?&page_id=301&cpage=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:31:".+?/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:41:".+?/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:61:".+?/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:".+?/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:".+?/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:26:"(.+?)/([^/]+)/trackback/?$";s:57:"index.php?category_name=$matches[1]&name=$matches[2]&tb=1";s:46:"(.+?)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:69:"index.php?category_name=$matches[1]&name=$matches[2]&feed=$matches[3]";s:41:"(.+?)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:69:"index.php?category_name=$matches[1]&name=$matches[2]&feed=$matches[3]";s:34:"(.+?)/([^/]+)/page/?([0-9]{1,})/?$";s:70:"index.php?category_name=$matches[1]&name=$matches[2]&paged=$matches[3]";s:41:"(.+?)/([^/]+)/comment-page-([0-9]{1,})/?$";s:70:"index.php?category_name=$matches[1]&name=$matches[2]&cpage=$matches[3]";s:26:"(.+?)/([^/]+)(/[0-9]+)?/?$";s:69:"index.php?category_name=$matches[1]&name=$matches[2]&page=$matches[3]";s:20:".+?/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:30:".+?/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:50:".+?/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:45:".+?/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:45:".+?/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:38:"(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:33:"(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:26:"(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:33:"(.+?)/comment-page-([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&cpage=$matches[2]";s:8:"(.+?)/?$";s:35:"index.php?category_name=$matches[1]";}', 'yes'),
(14434, 'cpac-install-timestamp', '1432327394', 'yes'),
(14436, 'can_compress_scripts', '0', 'yes'),
(14438, 'w3tc_edge_remainder_period', '2592000', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_postmeta`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1430 ;

--
-- Dumping data for table `uo6g6en_postmeta`
--

INSERT INTO `uo6g6en_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(19, 5, '_edit_last', '2'),
(20, 5, '_edit_lock', '1409654963:2'),
(21, 5, '_rawhtml_settings', '0,0,0,0'),
(22, 5, '_wp_page_template', 'default'),
(52, 9, '_menu_item_type', 'custom'),
(53, 9, '_menu_item_menu_item_parent', '0'),
(54, 9, '_menu_item_object_id', '9'),
(55, 9, '_menu_item_object', 'custom'),
(56, 9, '_menu_item_target', ''),
(57, 9, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(58, 9, '_menu_item_xfn', ''),
(59, 9, '_menu_item_url', 'http://facebook.com'),
(61, 10, '_menu_item_type', 'custom'),
(62, 10, '_menu_item_menu_item_parent', '0'),
(63, 10, '_menu_item_object_id', '10'),
(64, 10, '_menu_item_object', 'custom'),
(65, 10, '_menu_item_target', ''),
(66, 10, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(67, 10, '_menu_item_xfn', ''),
(68, 10, '_menu_item_url', 'http://twitter.com'),
(70, 11, '_menu_item_type', 'custom'),
(71, 11, '_menu_item_menu_item_parent', '0'),
(72, 11, '_menu_item_object_id', '11'),
(73, 11, '_menu_item_object', 'custom'),
(74, 11, '_menu_item_target', ''),
(75, 11, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(76, 11, '_menu_item_xfn', ''),
(77, 11, '_menu_item_url', 'http://pinterest.com'),
(79, 12, '_menu_item_type', 'custom'),
(80, 12, '_menu_item_menu_item_parent', '0'),
(81, 12, '_menu_item_object_id', '12'),
(82, 12, '_menu_item_object', 'custom'),
(83, 12, '_menu_item_target', ''),
(84, 12, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(85, 12, '_menu_item_xfn', ''),
(86, 12, '_menu_item_url', 'http://google.com'),
(939, 299, '_edit_lock', '1412519757:2'),
(940, 299, '_edit_last', '2'),
(941, 299, '_wp_page_template', 'page-styleGuide.php'),
(942, 299, '_rawhtml_settings', '1,1,1,1'),
(958, 301, '_edit_last', '2'),
(959, 301, '_edit_lock', '1409916080:2'),
(960, 301, '_wp_page_template', 'page-homepage.php'),
(961, 301, '_rawhtml_settings', '0,0,0,0'),
(1263, 387, '_edit_last', '2'),
(1264, 387, '_edit_lock', '1407881817:2'),
(1265, 387, '_wp_old_slug', '555'),
(1266, 390, '_edit_lock', '1407881751:2'),
(1267, 390, '_edit_last', '2'),
(1268, 392, '_edit_lock', '1407881780:2'),
(1269, 392, '_edit_last', '2'),
(1270, 394, '_edit_lock', '1407881870:2'),
(1271, 394, '_edit_last', '2'),
(1272, 396, '_edit_lock', '1407881915:2'),
(1273, 396, '_edit_last', '2'),
(1274, 398, '_edit_lock', '1407881960:2'),
(1275, 398, '_edit_last', '2'),
(1276, 400, '_edit_lock', '1407882043:2'),
(1277, 400, '_edit_last', '2'),
(1278, 402, '_edit_lock', '1407882119:2'),
(1279, 402, '_edit_last', '2'),
(1280, 402, '_wp_old_slug', 'vertical-form'),
(1281, 405, '_edit_lock', '1407882152:2'),
(1282, 405, '_edit_last', '2'),
(1283, 407, '_edit_lock', '1407882182:2'),
(1284, 407, '_edit_last', '2'),
(1285, 409, '_edit_lock', '1407882246:2'),
(1286, 409, '_edit_last', '2'),
(1302, 301, 'xxx', ''),
(1303, 301, '_xxx', 'field_53fb711f82134'),
(1306, 417, '_edit_lock', '1409322610:2'),
(1307, 417, '_edit_last', '2'),
(1308, 417, 'field_54008574adcf0', 'a:14:{s:3:"key";s:19:"field_54008574adcf0";s:5:"label";s:3:"Rel";s:4:"name";s:3:"rel";s:4:"type";s:12:"relationship";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:9:"post_type";a:1:{i:0;s:3:"all";}s:8:"taxonomy";a:1:{i:0;s:3:"all";}s:7:"filters";a:1:{i:0;s:6:"search";}s:15:"result_elements";a:1:{i:0;s:9:"post_type";}s:3:"max";s:0:"";s:13:"return_format";s:6:"object";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}'),
(1310, 417, 'position', 'normal'),
(1311, 417, 'layout', 'no_box'),
(1312, 417, 'hide_on_screen', ''),
(1313, 417, 'rule', 'a:5:{s:5:"param";s:4:"page";s:8:"operator";s:2:"==";s:5:"value";s:3:"301";s:8:"order_no";i:0;s:8:"group_no";i:0;}'),
(1326, 301, 'old', ''),
(1327, 301, '_old', 'field_5400da8cad6b9'),
(1357, 301, 'rel', ''),
(1358, 301, '_rel', 'field_54008574adcf0'),
(1405, 450, 'rel', 'a:1:{i:0;s:3:"426";}'),
(1406, 450, '_rel', 'field_54008574adcf0'),
(1407, 450, 'old', 'a:2:{i:0;s:1:"2";i:1;s:1:"3";}'),
(1408, 450, '_old', 'field_5400da8cad6b9'),
(1409, 451, 'rel', 'a:1:{i:0;s:3:"420";}'),
(1410, 451, '_rel', 'field_54008574adcf0'),
(1411, 451, 'old', 'a:2:{i:0;s:1:"2";i:1;s:1:"3";}'),
(1412, 451, '_old', 'field_5400da8cad6b9'),
(1413, 452, 'rel', 'a:2:{i:0;s:3:"420";i:1;s:3:"426";}'),
(1414, 452, '_rel', 'field_54008574adcf0'),
(1415, 452, 'old', 'a:2:{i:0;s:1:"2";i:1;s:1:"3";}'),
(1416, 452, '_old', 'field_5400da8cad6b9'),
(1417, 453, 'rel', 'a:1:{i:0;s:3:"430";}'),
(1418, 453, '_rel', 'field_54008574adcf0'),
(1419, 453, 'old', ''),
(1420, 453, '_old', 'field_5400da8cad6b9'),
(1421, 454, 'rel', ''),
(1422, 454, '_rel', 'field_54008574adcf0'),
(1423, 454, 'old', ''),
(1424, 454, '_old', 'field_5400da8cad6b9'),
(1425, 455, '_form', '<p>Your Name (required)<br />\n    [text* your-name] </p>\n\n<p>Your Email (required)<br />\n    [email* your-email] </p>\n\n<p>Subject<br />\n    [text your-subject] </p>\n\n<p>Your Message<br />\n    [textarea your-message] </p>\n\n<p>[submit "Send"]</p>'),
(1426, 455, '_mail', 'a:8:{s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:26:"[your-name] <[your-email]>";s:4:"body";s:0:"";s:9:"recipient";s:18:"reg@criography.com";s:18:"additional_headers";s:0:"";s:11:"attachments";s:0:"";s:8:"use_html";b:1;s:13:"exclude_blank";b:0;}'),
(1427, 455, '_mail_2', 'a:9:{s:6:"active";b:0;s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:26:"[your-name] <[your-email]>";s:4:"body";s:110:"Message Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on Site Title (http://wordpress.loc)";s:9:"recipient";s:12:"[your-email]";s:18:"additional_headers";s:0:"";s:11:"attachments";s:0:"";s:8:"use_html";b:0;s:13:"exclude_blank";b:0;}'),
(1428, 455, '_messages', 'a:21:{s:12:"mail_sent_ok";s:43:"Your message was sent successfully. Thanks.";s:12:"mail_sent_ng";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:16:"validation_error";s:74:"Validation errors occurred. Please confirm the fields and submit it again.";s:4:"spam";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:12:"accept_terms";s:35:"Please accept the terms to proceed.";s:16:"invalid_required";s:31:"Please fill the required field.";s:17:"captcha_not_match";s:31:"Your entered code is incorrect.";s:14:"invalid_number";s:28:"Number format seems invalid.";s:16:"number_too_small";s:25:"This number is too small.";s:16:"number_too_large";s:25:"This number is too large.";s:13:"invalid_email";s:28:"Email address seems invalid.";s:11:"invalid_url";s:18:"URL seems invalid.";s:11:"invalid_tel";s:31:"Telephone number seems invalid.";s:23:"quiz_answer_not_correct";s:27:"Your answer is not correct.";s:12:"invalid_date";s:26:"Date format seems invalid.";s:14:"date_too_early";s:23:"This date is too early.";s:13:"date_too_late";s:22:"This date is too late.";s:13:"upload_failed";s:22:"Failed to upload file.";s:24:"upload_file_type_invalid";s:30:"This file type is not allowed.";s:21:"upload_file_too_large";s:23:"This file is too large.";s:23:"upload_failed_php_error";s:38:"Failed to upload file. Error occurred.";}'),
(1429, 455, '_additional_settings', '');

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_posts`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_name` (`post_name`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=462 ;

--
-- Dumping data for table `uo6g6en_posts`
--

INSERT INTO `uo6g6en_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(5, 2, '2012-11-09 19:38:10', '2012-11-09 19:38:10', '', 'Under Construction', '', 'publish', 'open', 'open', '', 'under-construction', '', '', '2012-11-09 19:38:10', '2012-11-09 19:38:10', '', 0, 'http://wordpress.loc/?page_id=5', 1, 'page', '', 0),
(9, 2, '2012-11-11 17:09:52', '2012-11-11 17:09:52', '', 'Facebook', 'Like this Page', 'publish', 'open', 'open', '', 'facebook', '', '', '2012-11-11 17:13:01', '2012-11-11 17:13:01', '', 0, 'http://wordpress.loc/?p=9', 1, 'nav_menu_item', '', 0),
(10, 2, '2012-11-11 17:09:52', '2012-11-11 17:09:52', '', 'Twitter', 'Share this with your Twitter Followers', 'publish', 'open', 'open', '', 'twitter', '', '', '2012-11-11 17:13:01', '2012-11-11 17:13:01', '', 0, 'http://wordpress.loc/?p=10', 2, 'nav_menu_item', '', 0),
(11, 2, '2012-11-11 17:09:52', '2012-11-11 17:09:52', '', 'Pinterest', 'Add this  to your pins', 'publish', 'open', 'open', '', 'pinterest', '', '', '2012-11-11 17:13:01', '2012-11-11 17:13:01', '', 0, 'http://wordpress.loc/?p=11', 3, 'nav_menu_item', '', 0),
(12, 2, '2012-11-11 17:13:01', '2012-11-11 17:13:01', '', 'Google+', 'Like it on Google Plus', 'publish', 'open', 'open', '', 'google', '', '', '2012-11-11 17:13:01', '2012-11-11 17:13:01', '', 0, 'http://wordpress.loc/?p=12', 4, 'nav_menu_item', '', 0),
(299, 2, '2013-11-01 11:43:56', '2013-11-01 11:43:56', '<h2><a id="semantic-text-formatting">Semantic Text Formatting</a></h2>\r\n<h3><a id="semantic-text-formatting:headings">Headings</a></h3>\r\n<p>Each page on a website can be structure based on importance of content, furthermore it''s often the case that each of these emerged sections can be made even more readable by introducing <code>h1</code> to <code>h6</code> elements, where the lower number signifies the most important heading while higher numbers mark the lower or the more inner subsections.</p>\r\n<pre class="language-markup"><code class="language-markup">\r\n<h1>Level One Heading</h1>\r\n<p>This Heading is used mainly for main page titles. In some rare cases it''s also used for defining main sections of the page, though in these cases it may be styled differently as it carries a different weight (local to the section rather than to the whole document).</p>\r\n\r\n<h2>Level Two Heading</h2>\r\n<p>All the detective''s hopes and wishes were now centred on Hong Kong; for the steamer''s stay at Singapore would be too brief to enable him to take any steps there. The arrest must be made at Hong Kong, or the robber would probably escape him for ever.</p>\r\n\r\n<h3>Level Three Heading</h3>\r\n<p>Fix thought over these probabilities during the long hours which he spent in his cabin, and kept repeating to himself, "Now, either the warrant will be at Hong Kong, in which case I shall arrest my man, or it will not be there; and this time it is absolutely necessary that I should delay his departure.</p>\r\n\r\n<h4>Level Four Heading</h4>\r\n<p>Fix made up his mind that, if worst came to worst, he would make a confidant of Passepartout, and tell him what kind of a fellow his master really was. That Passepartout was not Fogg''s accomplice, he was very certain.</p>\r\n\r\n<h5>Level Five Heading</h5>\r\n<p>Who was this woman? What combination of events had made her Fogg''s travelling companion? They had evidently met somewhere between Bombay and Calcutta; but where? Had they met accidentally, or had Fogg gone into the interior purposely in quest of this charming damsel? </p>\r\n\r\n<h6>Level Six Heading</h6>\r\n<p>But could he even wait till they reached Hong Kong? Fogg had an abominable way of jumping from one boat to another, and, before anything could be effected, might get full under way again for Yokohama.</p>\r\n</code></pre>\r\n\r\n\r\n<h3><a id="semantic-text-formatting:paragraphs">Paragraphs</a></h3>\r\n<pre class="language-markup"><code class="language-markup">\r\n<p class="paragraph-opening">Certain articles will require initial paragraph to carry more importance and introduce the reader to the rest of the story. (…) Who was this woman? What combination of events had made her Fogg''s travelling companion? They had evidently met somewhere between Bombay and Calcutta; but where?</p>\r\n<p>Fix was fairly puzzled. He asked himself whether there had not been a wicked elopement; and this idea so impressed itself upon his mind that he determined to make use of the supposed intrigue. Whether the young woman were married or not, he would be able to create such difficulties for Mr. Fogg at Hong Kong that he could not escape by paying any amount of money.</p>\r\n<hr />\r\n<p>There were sad, haggard women tramping by, well dressed, with children that cried and stumbled, their dainty clothes smothered in dust, their weary faces smeared with tears. With many of these came men, sometimes helpful, sometimes lowering and savage.</p>\r\n</code></pre>\r\n\r\n\r\n<h3><a id="semantic-text-formatting:links-and-anchors">Links</a></h3>\r\n<p>There are few different types of hyperlinks available. Although structure-wise they are almost identical they may serve different purpose, e.g. linking to a different section within same page, pointing to a related page either under the same or different domain, or establishing connection with another applications through one of supported protocols.</p>\r\n<p>Please note: <code>br</code> tags used in the code below are for presentational values only.</p>\r\n<pre class="language-markup"><code class="language-markup">\r\n<a href="#anchor" title="Description of the link and where it points to">A link pointing to a specific [destination] section of the same page.</a><br/>\r\n<a href="http://current-domain.com/url/" title="Description of the link and where it points to">An internal link</a><br/>\r\n<a href="http://current-domain.com/file.zip" title="Description of the link and where it points to">A file download link</a><br/>\r\n<a href="http://external-domain.com/url/" title="Description of the link and where it points to" rel="external">An external link</a><br/>\r\n<a href="mailto:my@email.com" title="Send me an email">Clicking this link will open your default email client</a><br/>\r\n<a href="skype:testuser?call" title="Call testuser">Initiate Skype call with Testuser</a><br/>\r\n<section id="anchor">Generic [destination] Section </section>\r\n</code></pre>\r\n\r\n\r\n<h3><a id="semantic-text-formatting:emphasis-and-importance">Emphasis and Importance</a></h3>\r\n<p>Use <code><i></i></code> and <code><b></b></code> if it''s only visual change you''re after. For both visual and semantic values, go with <code><em></em></code> and <code><strong></strong></code> instead.</p>\r\n<pre class="language-markup"><code class="language-markup">\r\n<p>This <em>must have been</em> a family, running away from the contagion and perishing here on the <i>Cliff House beach</i>.</p>\r\n<p>You <strong>will</strong> appear before Judge Obadiah at half-past eight"</p>\r\n</code></pre>\r\n\r\n\r\n<h3><a id="semantic-text-formatting:definitions-and-abbreviations">Definitions and Abbreviations</a></h3>\r\n<p>Use <code>dfn</code> on the first occurrence of the word/phrase and <code>abbr</code> on the first occurrence of the abbreviated text. In both cases the explanation should be entered inside the <code>title</code> attribute and will be visible on mouse-over event.</p>\r\n<pre class="language-markup"><code class="language-markup">\r\n<p>This happens even though these systems are <dfn title="Deterministic: meaning that their future behavior is fully determined by their initial conditions, with no random elements involved. Source: Wikipedia">deterministic</dfn>. (…) Thus any real time series, even if mostly <dfn>deterministic</dfn>, will contain some randomness.</p>\r\n<p>Most recently, <abbr title="NASA: The National Aeronautics and Space Administration">NASA</abbr> announced a new Space Launch System that it said would take the agency''s astronauts farther into space than ever before and provide the cornerstone for future human space exploration efforts by the U.S. (…) The most notable <abbr>NASA</abbr> activities are its space flight programs, both manned and unmanned.</p>\r\n</code></pre>\r\n\r\n\r\n<h2><a id="content-grouping">Content Grouping</a></h2>\r\n<h3><a id="content-grouping:lists">Lists</a></h3>\r\n<p>Very often your content will require a way to list a number of items. While it can be done by simple use of comma, for better user experience and increased readability you may want to use one of the available list types.</p>\r\n<h4><a id="content-grouping:lists:ordered-lists">Ordered Lists</a></h4>\r\n<pre class="language-markup"><code class="language-markup">\r\n<ol>\r\n  <li>This is an ordered list.</li>\r\n  <li>This is another list item containing a sublist:\r\n    <ol>\r\n      <li>This is the sub list</li>\r\n      <li>and this is its second item</li>\r\n    </ol>\r\n  </li>\r\n  <li>This is the last item of the main list.</li>\r\n</ol>\r\n</code></pre>\r\n\r\n<h4><a id="content-grouping:lists:unordered-lists">Unordered Lists</a></h4>\r\n<pre class="language-markup"><code class="language-markup">\r\n<ul>\r\n  <li>This is an unordered list.</li>\r\n  <li>This is another list item containing a sublist:\r\n    <ul>\r\n      <li>This is the sub list,</li>\r\n      <li>and this is its second item.</li>\r\n    </ul>\r\n  </li>\r\n  <li>This is the last item of the main list.</li>\r\n</ul>\r\n</code></pre>\r\n\r\n\r\n<h3><a id="content-grouping:definition-lists">Definition Lists</a></h3>\r\n<p>Sometimes instead of just listing items, you need to assign or organise them under specific terms—that''s exactly what <code>dl</code> element is for.</p>\r\n<pre class="language-markup"><code class="language-markup">\r\n<dl>\r\n  <dt>This is a term</dt>\r\n    <dd>This is the definition of that term</dd>\r\n  <dt>Here is a term that shares a definition with another term.</dt>\r\n  <dt>Here is a that another term</dt>\r\n    <dd>Here''s the common definition for these 2 terms above.</dd>\r\n</dl>\r\n</code></pre>\r\n\r\n<p>There''s also a way to lay it out slightly differently by adding a specific <code>class="dl-inline"</code> attribute.</p>\r\n<pre class="language-markup"><code class="language-markup">\r\n<dl class="dl-inline">\r\n  <dt>This is a term</dt>\r\n    <dd>This is the definition of that term.</dd>\r\n  <dt>Here is a another term</dt>\r\n    <dd>This is the definition of the second term.</dd>\r\n</dl>\r\n</code></pre>\r\n\r\n\r\n<h3><a id="content-grouping:tabular-data">Tabular Data</a></h3>\r\n<p>If semantically reasonable, tabular data should be always placed within <code>table</code> elements, instead of other elements with overcomplicated styling resembling them. For responsive design pleas use <code>data-label</code> attributes, otherwise they should be omitted.</p>\r\n<pre class="language-markup"><code class="language-markup">\r\n<table>\r\n  <caption>Monitor Color Depth Statistics</caption>\r\n  <colgroup>\r\n    <col style="width:12em;">\r\n    <col style="width:4em;">\r\n    <col style="width:4em;">\r\n    <col style="width:4em;">\r\n  </colgroup>\r\n  <thead>\r\n    <tr>\r\n      <th scope="col">Date</th>\r\n      <th scope="col">16,777,216</th>\r\n      <th scope="col">65,536</th>\r\n      <th scope="col">256</th>\r\n    </tr>\r\n  </thead>\r\n  <tfoot>\r\n    <tr>\r\n      <th scope="row" data-label="Date">Average</th>\r\n      <th data-label="16,777,216">93.83%</th>\r\n      <th data-label="65,536">5.17%</th>\r\n      <th data-label="256">0.83%</th>\r\n    </tr>\r\n  </tfoot>\r\n  <tbody>\r\n    <tr>\r\n      <td scope="row" data-label="Date">January 2012</td>\r\n      <td data-label="16,777,216">98%</td>\r\n      <td data-label="65,536">2%</td>\r\n      <td data-label="256">0%</td>\r\n    </tr>\r\n    <tr>\r\n      <td scope="row" data-label="Date">January 2011</td>\r\n      <td data-label="16,777,216">97%</td>\r\n      <td data-label="65,536">3%</td>\r\n      <td data-label="256">0%</td>\r\n    </tr>\r\n    <tr>\r\n      <td scope="row" data-label="Date">January 2010</td>\r\n      <td data-label="16,777,216">97%</td>\r\n      <td data-label="65,536">3%</td>\r\n      <td data-label="256">0%</td>\r\n    </tr>\r\n    <tr>\r\n      <td scope="row" data-label="Date">January 2009</td>\r\n      <td data-label="16,777,216">95%</td>\r\n      <td data-label="65,536">4%</td>\r\n      <td data-label="256">1%</td>\r\n    </tr>\r\n    <tr>\r\n      <td scope="row" data-label="Date">January 2008</td>\r\n      <td data-label="16,777,216">90%</td>\r\n      <td data-label="65,536">8%</td>\r\n      <td data-label="256">2%</td>\r\n    </tr>\r\n  </tbody>\r\n</table>\r\n</code></pre>\r\n\r\n\r\n\r\n<h2><a id="media">Media</a></h2>\r\n<h3><a id="media:figures">Figures</a></h3>\r\n<p>The <code>figure</code> tag specifies self-contained content, like illustrations, diagrams, photos, code listings, etc. While the content of the element is related to the main flow, its position is independent of the main flow, and if removed it should not affect the flow of the document.</p>\r\n<p>The most common use of figure involves images, as shown below:</p>\r\n<pre class="language-markup"><code class="language-markup">\r\n<figure>\r\n  <img alt="Image Description" src="/_incs/images/style-guide/placeholder-slider-1.png">\r\n  <figcaption>This is a caption describing image contents or introducing content directly related to the visuals</figcaption>\r\n</figure>\r\n</code></pre>\r\n\r\n\r\n<p>But as mentioned above it''s semantically correct to use it for other purposes, e.g. quotes:</p>\r\n<pre class="language-markup"><code class="language-markup">\r\n<figure>\r\n  <blockquote>Few stopped and came aside from that flood. The lane opened slantingly into the main road with a narrow opening, and had a delusive appearance of coming from the direction of London. </blockquote>\r\n  <figcaption><i>H. G. Wells</i> in <cite>The War of the World</cite></figcaption>\r\n</figure>\r\n</code></pre>\r\n\r\n\r\n<h3><a id="media:audio-and-video">Audio and Video</a></h3>\r\n<p>Similarly these 2 types of media should be also contained in the <code>figure</code> element:</p>\r\n<pre class="language-markup"><code class="language-markup">\r\n  <figure>\r\n    <iframe width="1280" height="720" src="" frameborder="0" allowfullscreen>[video]</iframe>\r\n    <figcaption>An animated short set in a post-apocalyptic universe by <i>Wes Ball</i></figcaption>\r\n  </figure>\r\n</code></pre>\r\n\r\n<h3><a id="media:inline-galleries">Inline Galleries</a></h3>\r\n<p>Depending on the content it may be required to display a set of images as a gallery. There are two ways to do it—either as a inline slider:</p>\r\n<pre class="language-markup"><code class="language-markup">\r\n<div class="gallery-inline">\r\n  <a href="/_incs/images/style-guide/placeholder-slider-1.png">\r\n    <img data-title="Image Title" data-description="Image Description" alt="Image Description" src="/_incs/images/style-guide/placeholder-slider-1-thumb.png">\r\n  </a>\r\n\r\n  <a href="/_incs/images/style-guide/placeholder-slider-2.png">\r\n    <img data-title="Image Title" data-description="Image Description" alt="Image Description" src="/_incs/images/style-guide/placeholder-slider-2-thumb.png">\r\n  </a>\r\n\r\n  <a href="/_incs/images/style-guide/placeholder-slider-3.png">\r\n    <img data-title="Image Title" data-description="Image Description" alt="Image Description" src="/_incs/images/style-guide/placeholder-slider-3-thumb.png">\r\n  </a>\r\n\r\n  <a href="/_incs/images/style-guide/placeholder-slider-4.png">\r\n    <img data-title="Image Title" data-description="Image Description" alt="Image Description" src="/_incs/images/style-guide/placeholder-slider-4-thumb.png">\r\n  </a>\r\n\r\n  <a href="/_incs/images/style-guide/placeholder-slider-5.png">\r\n    <img data-title="Image Title" data-description="Image Description" alt="Image Description" src="/_incs/images/style-guide/placeholder-slider-5-thumb.png">\r\n  </a>\r\n</div>\r\n</code></pre>\r\n<p>or as a thumbnail list with <dfn title="Lightbox: A simple, unobtrusive overlay for presenting images on a web page. Source: Wikipedia">lightbox</dfn> support:</p>\r\n<pre class="language-markup"><code class="language-markup">\r\n</code></pre>\r\n\r\n\r\n<h2><a id="Forms">Forms</a></h2>\r\n<pre class="language-markup"><code class="language-markup">\r\n<form action="#" method="POST">\r\n  <fieldset>\r\n    <label for="name">Name</label>\r\n    <input type="text" id="name" placeholder="e.g.: John Smith" data-validate="validate(required)">\r\n    <p class="form-help">This is help text under the form field.</p>\r\n  </fieldset>\r\n\r\n  <fieldset>\r\n    <label for="email">Email</label>\r\n    <input type="email" id="email" placeholder="e.g.: name@myoffice.com"  data-validate="validate(required, email)">\r\n  </fieldset>\r\n\r\n  <fieldset>\r\n    <label for="gender">Gender</label>\r\n    <select id="gender" data-validate="validate(required)">\r\n      <option value="">--- Please Select ---</option>\r\n      <option value="m">Male</option>\r\n      <option value="f">Female</option>\r\n      <option value="c">Cylon</option>\r\n    </select>\r\n  </fieldset>\r\n  \r\n  <fieldset>\r\n    <label for="operating-system">Operating System</label>\r\n    <select id="operating-system" class="input-combobox" data-validate="validate(required)">\r\n      <option value="">--- Please Select ---</option>\r\n      <option value="w95">Windows 95</option>\r\n      <option value="w98">Windows 98</option>\r\n      <option value="wme">Windows ME</option>\r\n      <option value="wv32">Windows Vista x32</option>\r\n      <option value="wv64">Windows Vista x64</option>\r\n      <option value="w732">Windows 7 x32</option>\r\n      <option value="w764">Windows 7 x64</option>\r\n      <option value="w832">Windows 8 x32</option>\r\n      <option value="w864">Windows 7 x64</option>\r\n      <option value="ld">Linux Debian</option>\r\n      <option value="ls">Linux Suse</option>\r\n      <option value="los">Linux OpenSuse</option>\r\n      <option value="lr">Linux Redhat</option>\r\n      <option value="m9">Mac OS 9</option>\r\n      <option value="mx1">OS X: Puma</option>\r\n      <option value="mx2">OS X: Jaguar</option>\r\n      <option value="mx3">OS X: Panther</option>\r\n      <option value="mx4">OS X: Tiger</option>\r\n      <option value="mx5">OS X: Leopard</option>\r\n      <option value="mx6">OS X: Snow Leopard</option>\r\n      <option value="mx7">OS X: Lion</option>\r\n      <option value="mx8">OS X: Mountain Lion</option>\r\n    </select>\r\n  </fieldset>\r\n\r\n  <fieldset class="fieldset-list">\r\n    <legend>Notifications</legend>\r\n    <ul>\r\n      <li><label><input type="radio" name="notifications" value="e" data-validate="validate(required)">Send me email</label></li>\r\n      <li><label><input type="radio" name="notifications" value="no">Don''t send me email</label></li>\r\n      <li><label><input type="radio" name="notifications" value="f">Send me flowers</label></li>\r\n    </ul>\r\n  </fieldset>\r\n\r\n  <fieldset class="fieldset-list">\r\n    <legend>Music</legend>\r\n    <ul>\r\n      <li><label><input type="checkbox" name="music" value="blues" data-validate="validate(required)">Blues</label></li>\r\n      <li><label><input type="checkbox" name="music" value="jazz">Jazz</label></li>\r\n      <li><label><input type="checkbox" name="music" value="rock">Rock</label></li>\r\n      <li><label><input type="checkbox" name="music" value="hiphop">Hip-Hop</label></li>\r\n      <li><label><input type="checkbox" name="music" value="dubstep">Dubstep</label></li>\r\n    </ul>\r\n  </fieldset>\r\n\r\n  <fieldset>\r\n    <label for="url">URL</label>\r\n    <input type="url" id="url" placeholder="e.g.: http://yourdomain.com"  data-validate="validate(required, url)">\r\n  </fieldset>\r\n\r\n  <fieldset>\r\n    <label for="bio">Bio</label>\r\n    <textarea id="bio"  data-validate="validate(required)"></textarea>\r\n  </fieldset>\r\n\r\n  <fieldset>\r\n    <label for="range">Range</label>\r\n    <input type="range" id="range" min="0" max="40" step="4" data-validate="validate(required, range(1,40))">\r\n  </fieldset>\r\n\r\n  <fieldset>\r\n    <label for="orderDate">Order Date</label>\r\n    <input type="text" id="orderDate" class="input-datepicker" placeholder="dd/mm/yyyy" title="Please enter the date in dd/mm/yyyy format." data-validate="validate(required, date)">\r\n  </fieldset>\r\n\r\n  <fieldset>\r\n    <label for="holidayDuration-from">HolidayDuration</label>\r\n    <input type="text" id="holidayDuration-from" class="input-datepicker-range" placeholder="dd/mm/yyyy" title="Please enter the date in dd/mm/yyyy format." data-validate="validate(required, date)">\r\n    <input type="text" id="holidayDuration-end" class="input-datepicker-range" placeholder="dd/mm/yyyy" title="Please enter the date in dd/mm/yyyy format." data-validate="validate(required, date)">\r\n  </fieldset>\r\n\r\n  <fieldset class="fieldset-disclaimer">\r\n    <label><input type="checkbox" data-validate="validate(required)" />I accept the terms of service and lorem ipsum.</label>\r\n  </fieldset>\r\n\r\n  <fieldset class="fieldset-file">\r\n    <label for="file">File</label>\r\n    <input type="file" id="file" accept="image/*" multiple>\r\n  </fieldset>\r\n\r\n  <fieldset class="fieldset-actions">\r\n    <input type="submit" class="button" value="Submit" />\r\n  </fieldset>\r\n</form>\r\n</code></pre>\r\n<h3>Buttons</h3>\r\n<pre class="language-markup"><code class="language-markup">\r\n<button class="button-grey">Button</button>\r\n<button class="button-yellow">Button</button>\r\n<button class="button-grey" disabled>Button</button>\r\n<button class="button-3d">Button</button>\r\n</code></pre>\r\n\r\n\r\n<h2><a id="navigaton">Navigation</a></h2>\r\n<h3><a id="navigaton:breadcrumbs">Breadcrumbs</a></h3>\r\n<p>Please note that unless specified otherwise, breadcrumbs are not shown on smaller screens.</p>\r\n<pre class="language-markup"><code class="language-markup">\r\n<nav class="breadcrumbs">\r\n  <a href="#">This is main parent</a> /\r\n  <a href="#">Tertiary Parent</a> /\r\n  <a href="#">Secondary Parent</a> /\r\n  <a href="#">Direct Parent</a> /\r\n  <strong>Current Link</strong>\r\n</nav>\r\n</code></pre>\r\n\r\n\r\n<h3><a id="navigaton:pagination">Pagination</a></h3>\r\n<pre class="language-markup"><code class="language-markup">\r\n<nav class="pagination">\r\n  <a href="#" title="Proceed to Previous Page" class="pagination-link">Previous</a>\r\n  <ol class="pagination-list">\r\n    <li><a href="#" title="Proceed to page#1">1</a></li>\r\n    <li><a href="#" title="Proceed to page#2">2</a></li>\r\n    <li><a href="#" title="Proceed to page#3">3</a></li>\r\n    <li><a href="#" title="Proceed to page#4">4</a></li>\r\n    <li>5</li>\r\n    <li><a href="#" title="Proceed to page#6">6</a></li>\r\n    <li><a href="#" title="Proceed to page#7">7</a></li>\r\n    <li><a href="#" title="Proceed to page#8">8</a></li>\r\n    <li><a href="#" title="Proceed to page#9">9</a></li>\r\n    <li><a href="#" title="Proceed to page#10">10</a></li>\r\n  </ol>\r\n  <a href="#" title="Proceed to Next Page" class="pagination-link">Next</a>\r\n</nav>\r\n</code></pre>\r\n\r\n\r\n<h3><a id="navigaton:tag-lists">Tag Lists</a></h3>\r\n<p>A very special type of unordered list you often see on websites is a <em>Tag List</em>. It allows for further, more abstract categorisation of each article and/or product, enriching it with keywords and ideally connecting to other content items. Although structurally it doesn''t differ much from the usual <code>ul</code> element, the applied styling often varies.</p>\r\n<pre class="language-markup"><code class="language-markup">\r\nThis product was tagged as:\r\n<ol class="tag-list">\r\n  <li>#<a href="#">tag1</a>, </li>\r\n  <li>#<a href="#">tag2</a>, </li>\r\n  <li>#<a href="#">tag3</a>, </li>\r\n  <li>#<a href="#">tag4</a>, </li>\r\n  <li>#<a href="#">tag5</a>.</li>\r\n</ol>\r\n</code></pre>\r\n\r\n\r\n\r\n<h2><a id="ui-patterns">UI Patterns</a></h2>\r\n<h3><a id="ui-patters:accordion">Accordion</a></h3>\r\n<p>A simple CSS only Accordion menu consistent across all screen sizes</p>\r\n<pre class="language-markup"><code class="language-markup">\r\n<section class="accordion">\r\n  <div>\r\n    <input type="radio" class="hidden" name="accordion-default" id="accordion-section1" checked>\r\n    <article class="accordion-content-wrapper">\r\n      <h3 class="accordion-header"><label for="accordion-section1">Label 1</label></h3>\r\n      <div class="accordion-content"><p>Alice was beginning to get very tired of sitting by her sister on the bank, and of having nothing to do: once or twice she had peeped into the book her sister was reading, but it had no pictures or conversations in it, ''and what is the use of a book,'' thought Alice ''without pictures or conversation?''</p></div>\r\n    </article>\r\n  </div>\r\n  <div>\r\n    <input type="radio" class="hidden" name="accordion-default" id="accordion-section2">\r\n    <article class="accordion-content-wrapper">\r\n      <h3 class="accordion-header"><label for="accordion-section2">Label 2</label></h3>\r\n      <div class="accordion-content"><p>So she was considering in her own mind (as well as she could, for the hot day made her feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be worth the trouble of getting up and picking the daisies, when suddenly a White Rabbit with pink eyes ran close by her.</p></div>\r\n    </article>\r\n  </div>\r\n  <div>\r\n    <input type="radio" class="hidden" name="accordion-default" id="accordion-section3">\r\n    <article class="accordion-content-wrapper">\r\n      <h3 class="accordion-header"><label for="accordion-section3">Label 3</label></h3>\r\n      <div class="accordion-content"><p>In another moment down went Alice after it, never once considering how in the world she was to get out again.</p>\r\n      <p>The rabbit-hole went straight on like a tunnel for some way, and then dipped suddenly down, so suddenly that Alice had not a moment to think about stopping herself before she found herself falling down a very deep well.</p></div>\r\n    </article>\r\n  </div>\r\n</section>\r\n</code></pre>\r\n\r\n\r\n<h3><a id="ui-patters:tabs">Tabs</a></h3>\r\n<p>A simple CSS only Tabs menu consistent across all screen sizes. It is JS enhanceable to support sliding''</p>\r\n<pre class="language-markup"><code class="language-markup">\r\n<section id="tabs-slideMe" data-label-next="&gt;" data-label-prev="&lt;" class="tabs">\r\n    <input type="radio" value="0" role="presentation" aria-hidden="true" id="tab-1" name="tabs--isSliding" class="removed tab__input" checked="checked" />\r\n    <input type="radio" value="1" role="presentation" aria-hidden="true" id="tab-2" name="tabs--isSliding" class="removed tab__input" />\r\n    <input type="radio" value="2" role="presentation" aria-hidden="true" id="tab-3" name="tabs--isSliding" class="removed tab__input" />\r\n\r\n    <ol class="list--inlineBlock tabs__labels ">\r\n        <li class="tab__labelContainer">\r\n            <label onclick="" class="tab__label" for="tab-1">Label 1</label>\r\n        </li>\r\n        <li class="tab__labelContainer">\r\n            <label onclick="" class="tab__label" for="tab-2">Label 2</label>\r\n        </li>\r\n        <li class="tab__labelContainer">\r\n            <label onclick="" class="tab__label" for="tab-3">Label 3</label>\r\n        </li>\r\n    </ol>\r\n\r\n    <ol class="list--block tabs__contentWrapper tabs__contentWrapper--3">\r\n        <li class="tab__content">\r\n            <h3 class="tab__heading">\r\n                Title 1\r\n            </h3>\r\n            <div class="tab__column">\r\n                <p>In another moment down went Alice after it, never once considering how in the world she was to get out again.</p><p>The rabbit-hole went straight on like a tunnel for some way, and then dipped suddenly down, so suddenly that Alice had not a moment to think about stopping herself before she found herself falling down a very deep well.</p>\r\n            </div>\r\n        </li>\r\n\r\n        <li class="tab__content">\r\n            <h3 class="tab__heading">\r\n                Title 2\r\n            </h3>\r\n            <div class="tab__column">\r\n                <p>So she was considering in her own mind (as well as she could, for the hot day made her feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be worth the trouble of getting up and picking the daisies, when suddenly a White Rabbit with pink eyes ran close by her.</p>\r\n            </div>\r\n        </li>\r\n\r\n        <li class="tab__content">\r\n            <h3 class="tab__heading">\r\n                Title 3\r\n            </h3>\r\n            <div class="tab__column">\r\n                <p>Alice was beginning to get very tired of sitting by her sister on the bank, and of having nothing to do: once or twice she had peeped into the book her sister was reading, but it had no pictures or conversations in it, ''and what is the use of a book,'' thought Alice ''without pictures or conversation?''</p>\r\n            </div>\r\n        </li>\r\n    </ol>\r\n</section>\r\n\r\n<section data-label-next="&gt;" data-label-prev="&lt;" class="tabs">\r\n    <input type="radio" value="4" role="presentation" aria-hidden="true" id="tab-4" name="tabs--basic" class="removed tab__input" checked="checked" />\r\n    <input type="radio" value="5" role="presentation" aria-hidden="true" id="tab-5" name="tabs--basic" class="removed tab__input" />\r\n    <input type="radio" value="6" role="presentation" aria-hidden="true" id="tab-6" name="tabs--basic" class="removed tab__input" />\r\n\r\n    <ol class="list--inlineBlock tabs__labels ">\r\n        <li class="tab__labelContainer">\r\n            <label onclick="" class="tab__label" for="tab-4">Label 4</label>\r\n        </li>\r\n        <li class="tab__labelContainer">\r\n            <label onclick="" class="tab__label" for="tab-5">Label 5</label>\r\n        </li>\r\n        <li class="tab__labelContainer">\r\n            <label onclick="" class="tab__label" for="tab-6">Label 6</label>\r\n        </li>\r\n    </ol>\r\n\r\n    <ol class="list--block tabs__contentWrapper tabs__contentWrapper--3">\r\n        <li class="tab__content">\r\n            <h3 class="tab__heading">\r\n                Title 4\r\n            </h3>\r\n            <div class="tab__column">\r\n                <p>In another moment down went Alice after it, never once considering how in the world she was to get out again.</p><p>The rabbit-hole went straight on like a tunnel for some way, and then dipped suddenly down, so suddenly that Alice had not a moment to think about stopping herself before she found herself falling down a very deep well.</p>\r\n            </div>\r\n        </li>\r\n\r\n        <li class="tab__content">\r\n            <h3 class="tab__heading">\r\n                Title 5\r\n            </h3>\r\n            <div class="tab__column">\r\n                <p>So she was considering in her own mind (as well as she could, for the hot day made her feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be worth the trouble of getting up and picking the daisies, when suddenly a White Rabbit with pink eyes ran close by her.</p>\r\n            </div>\r\n        </li>\r\n\r\n        <li class="tab__content">\r\n            <h3 class="tab__heading">\r\n                Title 6\r\n            </h3>\r\n            <div class="tab__column">\r\n                <p>Alice was beginning to get very tired of sitting by her sister on the bank, and of having nothing to do: once or twice she had peeped into the book her sister was reading, but it had no pictures or conversations in it, ''and what is the use of a book,'' thought Alice ''without pictures or conversation?''</p>\r\n            </div>\r\n        </li>\r\n    </ol>\r\n</code></pre>\r\n</section>\r\n\r\n\r\n\r\n<h2><a id="other-patterns-and-microformats">Other Patterns and Microformats</a></h2>\r\n<h3><a id="other-patters:address">Address</a></h3>\r\n<p>Refer to <a href="http://microformats.org/wiki/hcard" rel="external" title="Proceed to vcard documentation">vcard documentation</a> for details on usage.</p>\r\n<pre class="language-markup"><code class="language-markup">\r\n<address class="vcard">\r\n  <a class="url fn org" href="http://website.com/">Website</a>\r\n  <div class="adr">\r\n    <span class="street-address">665 3rd St.</span>\r\n    <span class="extended-address">Suite 207</span>\r\n    <div>\r\n      <span class="locality">San Francisco</span>,\r\n      <span class="region">CA</span>\r\n      <span class="postal-code">94107</span>\r\n    </div>\r\n    <span class="country-name">United States</span>\r\n  </div>\r\n  <div class="tel">+44 (0)XXXX XXXXXX</div>\r\n  <a class="email" href="mailto:sally@example.com">email@address.com</a>\r\n</address>\r\n</code></pre>', 'Style Guide', '', 'publish', 'open', 'open', '', 'style-guide', '', '', '2014-10-05 15:36:54', '2014-10-05 14:36:54', '', 0, 'http://wordpress.loc/?page_id=299', 2, 'page', '', 0),
(301, 2, '2013-11-01 11:52:07', '2013-11-01 11:52:07', 'Hello World!', 'Homepage', '', 'publish', 'open', 'open', '', 'homepage', '', '', '2014-08-30 00:41:19', '2014-08-29 23:41:19', '', 0, 'http://wordpress.loc/?page_id=301', 10, 'page', '', 0),
(387, 2, '2014-08-12 21:47:00', '2014-08-12 20:47:00', '', 'ooo', '', 'publish', 'closed', 'closed', '', 'ooo', '', '', '2014-08-12 23:16:57', '2014-08-12 22:16:57', '', 0, 'http://wordpress.loc/?post_type=styleguide&#038;p=387', 0, 'styleguide', '', 0),
(390, 2, '2014-08-12 23:18:03', '2014-08-12 22:18:03', '', 'Colours', '', 'publish', 'closed', 'closed', '', 'colours', '', '', '2014-08-12 23:18:03', '2014-08-12 22:18:03', '', 0, 'http://wordpress.loc/?post_type=styleguide&#038;p=390', 0, 'styleguide', '', 0),
(392, 2, '2014-08-12 23:18:28', '2014-08-12 22:18:28', '', 'Logo', '', 'publish', 'closed', 'closed', '', 'logo', '', '', '2014-08-12 23:18:28', '2014-08-12 22:18:28', '', 0, 'http://wordpress.loc/?post_type=styleguide&#038;p=392', 0, 'styleguide', '', 0),
(394, 2, '2014-08-12 23:18:58', '2014-08-12 22:18:58', '', 'Typefaces', '', 'publish', 'closed', 'closed', '', 'typefaces', '', '', '2014-08-12 23:18:58', '2014-08-12 22:18:58', '', 0, 'http://wordpress.loc/?post_type=styleguide&#038;p=394', 0, 'styleguide', '', 0),
(396, 2, '2014-08-12 23:20:43', '2014-08-12 22:20:43', '', 'Solid Colour', '', 'publish', 'closed', 'closed', '', 'solid-colour', '', '', '2014-08-12 23:20:43', '2014-08-12 22:20:43', '', 0, 'http://wordpress.loc/?post_type=styleguide&#038;p=396', 0, 'styleguide', '', 0),
(398, 2, '2014-08-12 23:21:31', '2014-08-12 22:21:31', '', 'Paragraphs', '', 'publish', 'closed', 'closed', '', 'paragraphs', '', '', '2014-08-12 23:21:31', '2014-08-12 22:21:31', '', 0, 'http://wordpress.loc/?post_type=styleguide&#038;p=398', 0, 'styleguide', '', 0),
(400, 2, '2014-08-12 23:22:03', '2014-08-12 22:22:03', '', 'Links', '', 'publish', 'closed', 'closed', '', 'links', '', '', '2014-08-12 23:22:03', '2014-08-12 22:22:03', '', 0, 'http://wordpress.loc/?post_type=styleguide&#038;p=400', 0, 'styleguide', '', 0),
(402, 2, '2014-08-12 23:23:26', '2014-08-12 22:23:26', '', 'Vertical, Single Column Form', '', 'publish', 'closed', 'closed', '', 'vertical-single-column', '', '', '2014-08-12 23:24:10', '2014-08-12 22:24:10', '', 0, 'http://wordpress.loc/?post_type=styleguide&#038;p=402', 0, 'styleguide', '', 0),
(405, 2, '2014-08-12 23:24:43', '2014-08-12 22:24:43', '', 'Default Input Types', '', 'publish', 'closed', 'closed', '', 'default-input-types', '', '', '2014-08-12 23:24:43', '2014-08-12 22:24:43', '', 0, 'http://wordpress.loc/?post_type=styleguide&#038;p=405', 0, 'styleguide', '', 0),
(407, 2, '2014-08-12 23:25:12', '2014-08-12 22:25:12', '', 'Datepicker', '', 'publish', 'closed', 'closed', '', 'datepicker', '', '', '2014-08-12 23:25:12', '2014-08-12 22:25:12', '', 0, 'http://wordpress.loc/?post_type=styleguide&#038;p=407', 0, 'styleguide', '', 0),
(409, 2, '2014-08-12 23:25:48', '2014-08-12 22:25:48', '', 'Range Slider', '', 'publish', 'closed', 'closed', '', 'range-slider', '', '', '2014-08-12 23:25:48', '2014-08-12 22:25:48', '', 0, 'http://wordpress.loc/?post_type=styleguide&#038;p=409', 0, 'styleguide', '', 0),
(417, 2, '2014-08-29 14:52:20', '2014-08-29 13:52:20', '', 'Home', '', 'publish', 'closed', 'closed', '', 'acf_home', '', '', '2014-08-29 15:24:59', '2014-08-29 14:24:59', '', 0, 'http://wordpress.loc/?post_type=acf&#038;p=417', 0, 'acf', '', 0),
(455, 2, '2014-08-31 21:15:41', '2014-08-31 20:15:41', '<p>Your Name (required)<br />\r\n    [text* your-name] </p>\r\n\r\n<p>Your Email (required)<br />\r\n    [email* your-email] </p>\r\n\r\n<p>Subject<br />\r\n    [text your-subject] </p>\r\n\r\n<p>Your Message<br />\r\n    [textarea your-message] </p>\r\n\r\n<p>[submit "Send"]</p>\n[your-subject]\n[your-name] <[your-email]>\n\nreg@criography.com\n\n\n1\n\n\n[your-subject]\n[your-name] <[your-email]>\nMessage Body:\r\n[your-message]\r\n\r\n--\r\nThis e-mail was sent from a contact form on Site Title (http://wordpress.loc)\n[your-email]\n\n\n\n\nYour message was sent successfully. Thanks.\nFailed to send your message. Please try later or contact the administrator by another method.\nValidation errors occurred. Please confirm the fields and submit it again.\nFailed to send your message. Please try later or contact the administrator by another method.\nPlease accept the terms to proceed.\nPlease fill the required field.\nYour entered code is incorrect.\nNumber format seems invalid.\nThis number is too small.\nThis number is too large.\nEmail address seems invalid.\nURL seems invalid.\nTelephone number seems invalid.\nYour answer is not correct.\nDate format seems invalid.\nThis date is too early.\nThis date is too late.\nFailed to upload file.\nThis file type is not allowed.\nThis file is too large.\nFailed to upload file. Error occurred.', 'Contact form 1', '', 'publish', 'closed', 'open', '', 'contact-form-1', '', '', '2014-09-05 15:30:39', '2014-09-05 14:30:39', '', 0, 'http://wordpress.loc/?post_type=wpcf7_contact_form&#038;p=455', 0, 'wpcf7_contact_form', '', 0),
(461, 2, '2015-05-18 21:56:20', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'open', '', '', '', '', '2015-05-18 21:56:20', '0000-00-00 00:00:00', '', 0, 'http://wordpress.loc/?p=461', 0, 'post', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_redirection_404`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_redirection_404` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `agent` varchar(255) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `ip` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created` (`created`),
  KEY `url` (`url`),
  KEY `ip` (`ip`),
  KEY `referrer` (`referrer`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=202 ;

--
-- Dumping data for table `uo6g6en_redirection_404`
--

INSERT INTO `uo6g6en_redirection_404` (`id`, `created`, `url`, `agent`, `referrer`, `ip`) VALUES
(193, '2013-11-06 17:30:32', '/wp-content/themes/theme-name/_incs/images/admin/icon-customs.png', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:24.0) Gecko/20100101 Firefox/24.0', 'http://wordpress.loc/wp-admin/tools.php?page=redirection.php&sub=404s', 2130706433),
(194, '2013-11-06 17:30:36', '/wp-content/themes/theme-name/_incs/images/admin/icon-customs.png', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:24.0) Gecko/20100101 Firefox/24.0', 'http://wordpress.loc/wp-admin/tools.php?page=redirection.php&sub=options', 2130706433),
(195, '2013-11-06 17:31:00', '/wp-content/themes/theme-name/_incs/images/admin/icon-customs.png', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:24.0) Gecko/20100101 Firefox/24.0', 'http://wordpress.loc/wp-admin/tools.php?page=redirection.php&sub=options', 2130706433),
(196, '2013-11-06 17:31:12', '/wp-content/themes/theme-name/_incs/images/admin/icon-customs.png', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:24.0) Gecko/20100101 Firefox/24.0', 'http://wordpress.loc/wp-admin/plugins.php', 2130706433),
(197, '2014-01-28 13:57:25', '/wp-content/themes/theme-name/_incs/images/admin/icon-customs.png', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0', 'http://wordpress.loc/wp-admin/plugins.php?activate-multi=true&plugin_status=all&paged=1&s=', 2130706433),
(198, '2014-01-28 13:59:04', '/wp-content/themes/theme-name/_incs/images/admin/icon-customs.png', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0', 'http://wordpress.loc/wp-admin/plugins.php', 2130706433),
(199, '2014-01-28 13:59:11', '/wp-content/themes/theme-name/_incs/images/admin/icon-customs.png', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0', 'http://wordpress.loc/wp-admin/plugins.php?deactivate=true&plugin_status=all&paged=1&s=', 2130706433),
(200, '2014-01-28 13:59:17', '/wp-content/themes/theme-name/_incs/images/admin/icon-customs.png', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0', 'http://wordpress.loc/wp-admin/update.php?action=upgrade-plugin&plugin=acf-options-page%2Facf-options-page.php&_wpnonce=cee9132a61', 2130706433),
(201, '2014-01-28 13:59:29', '/wp-content/themes/theme-name/_incs/images/admin/icon-customs.png', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0', 'http://wordpress.loc/wp-admin/plugins.php?activate=true&plugin_status=all&paged=1&s=', 2130706433);

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_redirection_groups`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_redirection_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tracking` int(11) NOT NULL DEFAULT '1',
  `module_id` int(11) unsigned NOT NULL DEFAULT '0',
  `status` enum('enabled','disabled') NOT NULL DEFAULT 'enabled',
  `position` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `module_id` (`module_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `uo6g6en_redirection_groups`
--

INSERT INTO `uo6g6en_redirection_groups` (`id`, `name`, `tracking`, `module_id`, `status`, `position`) VALUES
(1, 'Redirections', 1, 1, 'enabled', 0),
(2, 'Modified Posts', 1, 1, 'enabled', 1);

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_redirection_items`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_redirection_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` mediumtext NOT NULL,
  `regex` int(11) unsigned NOT NULL DEFAULT '0',
  `position` int(11) unsigned NOT NULL DEFAULT '0',
  `last_count` int(10) unsigned NOT NULL DEFAULT '0',
  `last_access` datetime NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `status` enum('enabled','disabled') NOT NULL DEFAULT 'enabled',
  `action_type` varchar(20) NOT NULL,
  `action_code` int(11) unsigned NOT NULL,
  `action_data` mediumtext,
  `match_type` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `url` (`url`(200)),
  KEY `status` (`status`),
  KEY `regex` (`regex`),
  KEY `group_idpos` (`group_id`,`position`),
  KEY `group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_redirection_logs`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_redirection_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `url` mediumtext NOT NULL,
  `sent_to` mediumtext,
  `agent` mediumtext NOT NULL,
  `referrer` mediumtext,
  `redirection_id` int(11) unsigned DEFAULT NULL,
  `ip` varchar(17) NOT NULL DEFAULT '',
  `module_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created` (`created`),
  KEY `redirection_id` (`redirection_id`),
  KEY `ip` (`ip`),
  KEY `group_id` (`group_id`),
  KEY `module_id` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_redirection_modules`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_redirection_modules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `options` mediumtext,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `uo6g6en_redirection_modules`
--

INSERT INTO `uo6g6en_redirection_modules` (`id`, `type`, `name`, `options`) VALUES
(1, 'wp', 'WordPress', ''),
(2, 'apache', 'Apache', '');

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_terms`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `name` (`name`(191)),
  KEY `slug` (`slug`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `uo6g6en_terms`
--

INSERT INTO `uo6g6en_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'General', 'general', 0),
(2, 'Blogroll', 'blogroll', 0),
(3, 'Top Navigation', 'top-navigation', 0),
(4, 'Footer Navigation', 'footer-navigation', 0),
(5, 'Social Network Buttons', 'social-network-buttons', 0),
(13, 'tag1', 'tag1', 0),
(14, 'tag2', 'tag2', 0),
(15, 'tag3', 'tag3', 0),
(16, 'tag4', 'tag4', 0),
(17, 'tag5', 'tag5', 0),
(18, 'tag6', 'tag6', 0),
(19, 'tag7', 'tag7', 0),
(26, 'Copy', 'copy', 0),
(27, 'Lists', 'lists', 0),
(28, 'Branding', 'branding', 0),
(29, 'Grids', 'grids', 0),
(30, 'Containers', 'containers', 0),
(31, 'Panels', 'panels', 0),
(32, 'Forms', 'forms', 0),
(33, 'Sliders', 'sliders', 0),
(34, 'Galleries', 'galleries', 0),
(35, 'Navigation', 'navigation', 0),
(36, 'Location', 'location', 0);

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_term_relationships`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `uo6g6en_term_relationships`
--

INSERT INTO `uo6g6en_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(9, 5, 0),
(10, 5, 0),
(11, 5, 0),
(12, 5, 0),
(30, 1, 0),
(31, 1, 0),
(32, 1, 0),
(33, 1, 0),
(34, 1, 0),
(35, 1, 0),
(36, 1, 0),
(37, 1, 0),
(38, 1, 0),
(39, 1, 0),
(40, 1, 0),
(41, 1, 0),
(42, 1, 0),
(43, 1, 0),
(44, 1, 0),
(45, 1, 0),
(46, 1, 0),
(47, 1, 0),
(48, 1, 0),
(49, 1, 0),
(50, 1, 0),
(51, 1, 0),
(52, 1, 0),
(53, 1, 0),
(54, 1, 0),
(55, 1, 0),
(57, 1, 0),
(58, 1, 0),
(60, 1, 0),
(62, 1, 0),
(64, 1, 0),
(66, 1, 0),
(68, 1, 0),
(70, 1, 0),
(73, 1, 0),
(75, 1, 0),
(76, 1, 0),
(77, 1, 0),
(78, 1, 0),
(80, 1, 0),
(82, 1, 0),
(387, 28, 0),
(390, 28, 0),
(392, 28, 0),
(394, 28, 0),
(396, 30, 0),
(398, 26, 0),
(400, 26, 0),
(402, 32, 0),
(405, 32, 0),
(407, 32, 0),
(409, 32, 0);

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `uo6g6en_term_taxonomy`
--

INSERT INTO `uo6g6en_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'link_category', '', 0, 0),
(3, 3, 'nav_menu', '', 0, 0),
(4, 4, 'nav_menu', '', 0, 0),
(5, 5, 'nav_menu', '', 0, 4),
(13, 13, 'post_tag', '', 0, 0),
(14, 14, 'post_tag', '', 0, 0),
(15, 15, 'post_tag', '', 0, 0),
(16, 16, 'post_tag', '', 0, 0),
(17, 17, 'post_tag', '', 0, 0),
(18, 18, 'post_tag', '', 0, 0),
(19, 19, 'post_tag', '', 0, 0),
(26, 26, 'pattern-type', '', 0, 2),
(27, 27, 'pattern-type', '', 0, 0),
(28, 28, 'pattern-type', '', 0, 4),
(29, 29, 'pattern-type', '', 0, 0),
(30, 30, 'pattern-type', '', 0, 1),
(31, 31, 'pattern-type', '', 0, 0),
(32, 32, 'pattern-type', '', 0, 4),
(33, 33, 'pattern-type', '', 0, 0),
(34, 34, 'pattern-type', '', 0, 0),
(35, 35, 'pattern-type', '', 0, 0),
(36, 36, 'pattern-type', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_usermeta`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=124 ;

--
-- Dumping data for table `uo6g6en_usermeta`
--

INSERT INTO `uo6g6en_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 2, 'first_name', ''),
(2, 2, 'last_name', ''),
(3, 2, 'nickname', 'Marek'),
(4, 2, 'description', ''),
(5, 2, 'rich_editing', 'true'),
(6, 2, 'comment_shortcuts', 'false'),
(7, 2, 'admin_color', 'fresh'),
(8, 2, 'use_ssl', '0'),
(9, 2, 'show_admin_bar_front', 'true'),
(10, 2, 'uo6g6en_capabilities', 'a:1:{s:13:"administrator";s:1:"1";}'),
(11, 2, 'uo6g6en_user_level', '10'),
(12, 2, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_media_uploader,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media,wp360_revisions,wp390_widgets'),
(13, 2, 'show_welcome_panel', '0'),
(14, 2, 'uo6g6en_dashboard_quick_press_last_post_id', '461'),
(15, 2, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(16, 2, 'metaboxhidden_nav-menus', 'a:2:{i:0;s:8:"add-post";i:1;s:12:"add-post_tag";}'),
(17, 2, 'nav_menu_recently_edited', '3'),
(30, 2, 'closedpostboxes_post', 'a:0:{}'),
(31, 2, 'metaboxhidden_post', 'a:8:{i:0;s:6:"acf_25";i:1;s:13:"trackbacksdiv";i:2;s:10:"postcustom";i:3;s:16:"commentstatusdiv";i:4;s:11:"commentsdiv";i:5;s:7:"slugdiv";i:6;s:9:"authordiv";i:7;s:12:"revisionsdiv";}'),
(32, 2, 'meta-box-order_post', 'a:3:{s:4:"side";s:55:"submitdiv,categorydiv,tagsdiv-post_tag,rawhtml_meta_box";s:6:"normal";s:114:"postexcerpt,wpseo_meta,acf_25,trackbacksdiv,postcustom,commentstatusdiv,commentsdiv,slugdiv,authordiv,revisionsdiv";s:8:"advanced";s:0:"";}'),
(33, 2, 'screen_layout_post', '2'),
(34, 2, 'closedpostboxes_news', 'a:1:{i:0;s:16:"tagsdiv-post_tag";}'),
(35, 2, 'metaboxhidden_news', 'a:3:{i:0;s:6:"acf_25";i:1;s:10:"postcustom";i:2;s:7:"slugdiv";}'),
(36, 2, 'meta-box-order_news', 'a:3:{s:4:"side";s:81:"submitdiv,categorydiv,tagsdiv-post_tag,postimagediv,revisionsdiv,commentstatusdiv";s:6:"normal";s:60:"postexcerpt,wpseo_meta,acf_25,postcustom,commentsdiv,slugdiv";s:8:"advanced";s:0:"";}'),
(37, 2, 'screen_layout_news', '2'),
(38, 2, 'uo6g6en_user-settings', 'imgsize=thumbnail&libraryContent=browse&editor=html&dfw_width=822&hidetb=0'),
(39, 2, 'uo6g6en_user-settings-time', '1399219150'),
(40, 2, 'closedpostboxes_product', 'a:0:{}'),
(41, 2, 'metaboxhidden_product', 'a:3:{i:0;s:6:"acf_25";i:1;s:10:"postcustom";i:2;s:7:"slugdiv";}'),
(42, 2, 'meta-box-order_product', 'a:3:{s:4:"side";s:92:"submitdiv,postimagediv,product-categorydiv,tagsdiv-product-tag,commentstatusdiv,revisionsdiv";s:6:"normal";s:60:"postexcerpt,wpseo_meta,acf_25,postcustom,commentsdiv,slugdiv";s:8:"advanced";s:0:"";}'),
(43, 2, 'screen_layout_product', '2'),
(44, 2, 'cpac_sorting_preference', 'a:2:{s:4:"page";a:2:{s:7:"orderby";s:16:"menu_order title";s:5:"order";s:3:"asc";}s:3:"acf";a:2:{s:7:"orderby";s:16:"menu_order title";s:5:"order";s:3:"asc";}}'),
(45, 2, 'closedpostboxes_page', 'a:0:{}'),
(46, 2, 'metaboxhidden_page', 'a:4:{i:0;s:16:"commentstatusdiv";i:1;s:11:"commentsdiv";i:2;s:7:"slugdiv";i:3;s:9:"authordiv";}'),
(47, 2, 'meta-box-order_page', 'a:3:{s:4:"side";s:53:"submitdiv,pageparentdiv,rawhtml_meta_box,postimagediv";s:6:"normal";s:96:"acf_25,acf_155,wpseo_meta,postcustom,commentstatusdiv,commentsdiv,slugdiv,authordiv,revisionsdiv";s:8:"advanced";s:0:"";}'),
(48, 2, 'screen_layout_page', '2'),
(49, 2, 'closedpostboxes_dashboard', 'a:0:{}'),
(50, 2, 'metaboxhidden_dashboard', 'a:5:{i:0;s:17:"dashboard_plugins";i:1;s:21:"dashboard_quick_press";i:2;s:24:"dashboard_incoming_links";i:3;s:17:"dashboard_primary";i:4;s:19:"dashboard_secondary";}'),
(51, 2, 'meta-box-order_dashboard', 'a:4:{s:6:"normal";s:19:"dashboard_right_now";s:4:"side";s:58:"dashboard_quick_press,dashboard_activity,dashboard_primary";s:7:"column3";s:0:"";s:7:"column4";s:0:"";}'),
(52, 2, 'screen_layout_dashboard', '3'),
(53, 2, '_yoast_wpseo_profile_updated', '1412283159'),
(54, 2, 'wpseo_title', ''),
(55, 2, 'wpseo_metadesc', ''),
(56, 2, 'wpseo_metakey', ''),
(57, 2, 'googleplus', ''),
(58, 2, 'twitter', 'criography'),
(59, 2, 'facebook', ''),
(60, 4, 'first_name', 'Andy'),
(61, 4, 'last_name', ''),
(62, 4, 'nickname', 'Andy'),
(63, 4, 'description', ''),
(64, 4, 'rich_editing', 'true'),
(65, 4, 'comment_shortcuts', 'false'),
(66, 4, 'admin_color', 'fresh'),
(67, 4, 'use_ssl', '0'),
(68, 4, 'show_admin_bar_front', 'true'),
(69, 4, 'uo6g6en_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(70, 4, 'uo6g6en_user_level', '10'),
(71, 4, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media,wp360_revisions,wp360_locks'),
(72, 5, 'first_name', 'Max'),
(73, 5, 'last_name', ''),
(74, 5, 'nickname', 'Max'),
(75, 5, 'description', ''),
(76, 5, 'rich_editing', 'true'),
(77, 5, 'comment_shortcuts', 'false'),
(78, 5, 'admin_color', 'fresh'),
(79, 5, 'use_ssl', '0'),
(80, 5, 'show_admin_bar_front', 'true'),
(81, 5, 'uo6g6en_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(82, 5, 'uo6g6en_user_level', '10'),
(83, 5, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media,wp360_revisions,wp360_locks'),
(84, 6, 'first_name', 'Alison Patricia'),
(85, 6, 'last_name', 'O''Reilly'),
(86, 6, 'nickname', 'Alison'),
(87, 6, 'description', ''),
(88, 6, 'rich_editing', 'true'),
(89, 6, 'comment_shortcuts', 'false'),
(90, 6, 'admin_color', 'fresh'),
(91, 6, 'use_ssl', '0'),
(92, 6, 'show_admin_bar_front', 'true'),
(93, 6, 'uo6g6en_capabilities', 'a:1:{s:6:"editor";b:1;}'),
(94, 6, 'uo6g6en_user_level', '7'),
(95, 6, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media,wp360_revisions,wp360_locks'),
(96, 6, 'wpseo_title', ''),
(97, 6, 'wpseo_metadesc', ''),
(98, 6, 'wpseo_metakey', ''),
(99, 6, '_yoast_wpseo_profile_updated', '1412283159'),
(100, 6, 'googleplus', ''),
(101, 6, 'twitter', ''),
(102, 6, 'facebook', ''),
(103, 4, '_yoast_wpseo_profile_updated', '1412283159'),
(104, 5, '_yoast_wpseo_profile_updated', '1412283159'),
(105, 2, 'closedpostboxes_styleguide', 'a:0:{}'),
(106, 2, 'metaboxhidden_styleguide', 'a:1:{i:0;s:7:"slugdiv";}'),
(108, 2, 'screen_layout_styleguide', '2'),
(109, 2, 'session_tokens', 'a:2:{s:64:"287dac62f61fed613cd1c0ec24d00440756f6a492dc9a788a7f101df58a34598";a:1:{s:10:"expiration";i:1433192173;}s:64:"ce7c9a68a10f080abd24a8765e2d3dd45091729ddca0cc407c06a037637fc15c";a:4:{s:10:"expiration";i:1433536988;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0";s:5:"login";i:1432327388;}}'),
(110, 7, 'nickname', 'Ben'),
(111, 7, 'first_name', 'Ben'),
(112, 7, 'last_name', ''),
(113, 7, 'description', ''),
(114, 7, 'rich_editing', 'true'),
(115, 7, 'comment_shortcuts', 'false'),
(116, 7, 'admin_color', 'fresh'),
(117, 7, 'use_ssl', '0'),
(118, 7, 'show_admin_bar_front', 'true'),
(119, 7, 'uo6g6en_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(120, 7, 'uo6g6en_user_level', '10'),
(121, 7, 'dismissed_wp_pointers', 'wp350_media,wp360_revisions,wp360_locks,wp390_widgets'),
(122, 2, 'wpcf7_hide_welcome_panel_on', 'a:1:{i:0;s:5:"3.9.3";}'),
(123, 7, '_yoast_wpseo_profile_updated', '1412283159');

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_users`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `uo6g6en_users`
--

INSERT INTO `uo6g6en_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(2, 'Marek', '$P$Bk9/bjlmLYR1bkSlEX37J5xxK6bqp00', 'marek', 'marek@aardvarklondon.com', '', '2012-11-09 19:16:36', '', 0, 'Marek'),
(4, 'Andy', '$P$Bi/x409Y0k1Cdzu5iYJbCbLWtC1xxM1', 'andy', 'andy@aardvarkmedia.co.uk', '', '2013-11-01 16:45:32', '', 0, 'Andy'),
(5, 'Max', '$P$Ba5wBelIJdyZbyc1hUQuZAsp7O.D.K1', 'max', 'max@aardvarklondon.com', '', '2013-11-01 16:46:12', '', 0, 'Max'),
(6, 'Alison', '$P$BO5MAo8gOW9N/u8apAA1im1h5iKdlK1', 'alison', 'alison@aardvarklondon.com', '', '2014-04-01 13:53:20', '', 0, 'Alison Patricia O''Reilly'),
(7, 'Ben', '$P$BJhwijzMG/pbYhP.6x.WNS7M7OehWc1', 'ben', 'ben@aardvarklondon.com', '', '2014-09-05 10:27:24', '', 0, 'Ben'),
(8, '', '', '', '', '', '0000-00-00 00:00:00', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_wfBadLeechers`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_wfBadLeechers` (
  `eMin` int(10) unsigned NOT NULL,
  `IP` int(10) unsigned NOT NULL,
  `hits` int(10) unsigned NOT NULL,
  PRIMARY KEY (`eMin`,`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_wfBlocks`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_wfBlocks` (
  `IP` int(10) unsigned NOT NULL,
  `blockedTime` bigint(20) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `lastAttempt` int(10) unsigned DEFAULT '0',
  `blockedHits` int(10) unsigned DEFAULT '0',
  `wfsn` tinyint(3) unsigned DEFAULT '0',
  `permanent` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`IP`),
  KEY `k1` (`wfsn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_wfBlocksAdv`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_wfBlocksAdv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blockType` char(2) NOT NULL,
  `blockString` varchar(255) NOT NULL,
  `ctime` int(10) unsigned NOT NULL,
  `reason` varchar(255) NOT NULL,
  `totalBlocked` int(10) unsigned DEFAULT '0',
  `lastBlocked` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_wfConfig`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_wfConfig` (
  `name` varchar(100) NOT NULL,
  `val` longblob,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `uo6g6en_wfConfig`
--

INSERT INTO `uo6g6en_wfConfig` (`name`, `val`) VALUES
('actUpdateInterval', 0x32),
('addCacheComment', 0x30),
('advancedCommentScanning', 0x30),
('alertEmailMsgCount', 0x30),
('alertEmails', 0x64657369676e65727340616172647661726b6c6f6e646f6e2e636f6d),
('alertOn_adminLogin', 0x30),
('alertOn_block', 0x31),
('alertOn_critical', 0x31),
('alertOn_loginLockout', 0x31),
('alertOn_lostPasswdForm', 0x31),
('alertOn_nonAdminLogin', 0x30),
('alertOn_throttle', 0x30),
('alertOn_update', 0x30),
('alertOn_warnings', 0x31),
('alert_maxHourly', 0x30),
('allowHTTPSCaching', 0x30),
('apiKey', 0x3564333737653233363137376164663266623130346363663665616361316430656539633538653861393935626664663766633935663061646264303463363334396662626138376531373462386664666437363830363431346663633730306334363832656134353238646663656466646631616466343635383063303038),
('autoBlockScanners', 0x30),
('autoUpdate', 0x30),
('autoUpdateChoice', 0x31),
('bannedURLs', ''),
('blockedTime', 0x32353932303030),
('blockFakeBots', 0x31),
('cbl_restOfSiteBlocked', 0x31),
('checkSpamIP', 0x30),
('cronSendHeader', 0x30),
('cronTestID', 0x3263353230303030623233303030303138323030303030),
('cronURL', 0x687474703a2f2f776f726470726573732e6c6f632f77702d636f6e74656e742f706c7567696e732f776f726466656e63652f77667363616e2e706870),
('currentCronKey', ''),
('debugOn', 0x30),
('deleteTablesOnDeact', 0x30),
('disableConfigCaching', 0x30),
('disableCookies', 0x30),
('emailedIssuesList', 0x613a34333a7b693a303b613a323a7b733a373a2269676e6f726543223b733a33323a223732323461616666616361326634363530363235313331643937666263326263223b733a373a2269676e6f726550223b733a33323a226465346363363431313734303732323432306137366332386230316439656633223b7d693a313b613a323a7b733a373a2269676e6f726543223b733a33323a223763316338663962653035623962336338363335313361353634623566633136223b733a373a2269676e6f726550223b733a33323a226464633434646534326531663466383266386463323131346438393162323931223b7d693a323b613a323a7b733a373a2269676e6f726543223b733a33323a223665393733353631653866663365366631343235643563636564333533316331223b733a373a2269676e6f726550223b733a33323a223237643537663061613637613635353333303132316539303034633230333133223b7d693a333b613a323a7b733a373a2269676e6f726543223b733a33323a223666633431613333353730303932616665346336636261323465633734613835223b733a373a2269676e6f726550223b733a33323a223636313132393164343534613836326130636561373230303537363233396466223b7d693a343b613a323a7b733a373a2269676e6f726543223b733a33323a226366616363383237373962343466356337333635653865366665333539393163223b733a373a2269676e6f726550223b733a33323a226439383663643431373132373132666235653739643934613663393765633332223b7d693a353b613a323a7b733a373a2269676e6f726543223b733a33323a226665643366666336623636376262663930376664653035646238343831396362223b733a373a2269676e6f726550223b733a33323a223433613432306433396563333065326164353662626239353834373732643161223b7d693a363b613a323a7b733a373a2269676e6f726543223b733a33323a226537316562323666633431376433333330373430633130323065306434393633223b733a373a2269676e6f726550223b733a33323a223765626265383761343935643566626430393138303065373865313561303764223b7d693a373b613a323a7b733a373a2269676e6f726543223b733a33323a226235636362646632666663663533663964613366386536346538343066313363223b733a373a2269676e6f726550223b733a33323a226139616334656535356665383236386531323130613439653166343365653235223b7d693a383b613a323a7b733a373a2269676e6f726543223b733a33323a226534373631353566376464316630323663306532663339653138303334653636223b733a373a2269676e6f726550223b733a33323a223832303763353335356639386333343964623936316263636334373135646538223b7d693a393b613a323a7b733a373a2269676e6f726543223b733a33323a226465656131336661353365306164393733333865313835356661383861363863223b733a373a2269676e6f726550223b733a33323a223338383537356333643039393166623265353831666539393331353837333865223b7d693a31303b613a323a7b733a373a2269676e6f726543223b733a33323a223038623761333237363861386336336538353733373033353736323033663761223b733a373a2269676e6f726550223b733a33323a223132616365663134646237353662356236333431333162663066363561383532223b7d693a31313b613a323a7b733a373a2269676e6f726543223b733a33323a223963633238653265623433383138373532626431646437356434326632363736223b733a373a2269676e6f726550223b733a33323a226162653630376366353864303561386637343265366238346536346632646165223b7d693a31323b613a323a7b733a373a2269676e6f726543223b733a33323a223339303032356466333237633264356131333766353061313766636535396166223b733a373a2269676e6f726550223b733a33323a223338313739663635366138666562376632373037653531396537323133616363223b7d693a31333b613a323a7b733a373a2269676e6f726543223b733a33323a226639393763636334613965303730383538626264316537303936623331303133223b733a373a2269676e6f726550223b733a33323a223639613632363531633038663133333466643530616166636264613734303265223b7d693a31343b613a323a7b733a373a2269676e6f726543223b733a33323a226430646130333164393532646532623931376666653735333036376266646135223b733a373a2269676e6f726550223b733a33323a223232663233323231633264353739643066393036616165323164356232613233223b7d693a31353b613a323a7b733a373a2269676e6f726543223b733a33323a223362643934613262396662383361323963663335636233643338646332376638223b733a373a2269676e6f726550223b733a33323a223439316231623135353765333132663963303062633561633733393961393531223b7d693a31363b613a323a7b733a373a2269676e6f726543223b733a33323a226134303963346231356361636466616134363966643263386230373065303465223b733a373a2269676e6f726550223b733a33323a226132326132636536633038623162613564336437623837383466353731313566223b7d693a31373b613a323a7b733a373a2269676e6f726543223b733a33323a223736386531636538313161633730313334626262363531353465353838363830223b733a373a2269676e6f726550223b733a33323a223635656464386161656464396165383333383735663132623861663939636536223b7d693a31383b613a323a7b733a373a2269676e6f726543223b733a33323a223634373164393231333032643866353962663465636437623633646139383232223b733a373a2269676e6f726550223b733a33323a223831396662393733613166323866316633353038613435666532393562663737223b7d693a31393b613a323a7b733a373a2269676e6f726543223b733a33323a223365633961646539376338646531383331396161353332633066393039343839223b733a373a2269676e6f726550223b733a33323a223937646336343432393331376330376236333730333534353334326130323031223b7d693a32303b613a323a7b733a373a2269676e6f726543223b733a33323a226539626534636563363333343234333762326466633134643330393932383734223b733a373a2269676e6f726550223b733a33323a226434376566643835303633643731353766393163366163613235383366353666223b7d693a32313b613a323a7b733a373a2269676e6f726543223b733a33323a226233373034303735633839366431343035663739656666343362353461373562223b733a373a2269676e6f726550223b733a33323a223965396635356333346634643035626631363563376236363834616239626530223b7d693a32323b613a323a7b733a373a2269676e6f726543223b733a33323a223938313930313737616232653366373437316264643631316432306239353436223b733a373a2269676e6f726550223b733a33323a223632313730316633326463316439306434633334333133353661373030653864223b7d693a32333b613a323a7b733a373a2269676e6f726543223b733a33323a223635343336663464663132663934306263306632656166663065373261353564223b733a373a2269676e6f726550223b733a33323a223436316536613931306432366361323233303035343432663034346631393437223b7d693a32343b613a323a7b733a373a2269676e6f726543223b733a33323a223537626233396137666463666230663330663536303663346634333936333838223b733a373a2269676e6f726550223b733a33323a223030633662633166333961346232373731376439656531643631323663616133223b7d693a32353b613a323a7b733a373a2269676e6f726543223b733a33323a223237333931663865343532666362373762613233643331343938343332386363223b733a373a2269676e6f726550223b733a33323a226634353636646136623535653337303435366362616532386238373261303861223b7d693a32363b613a323a7b733a373a2269676e6f726543223b733a33323a226465613865346232353534363335633763393566353438396437636365326637223b733a373a2269676e6f726550223b733a33323a226531313532613137336333363039663237636535333532636535323938313232223b7d693a32373b613a323a7b733a373a2269676e6f726543223b733a33323a223633356461336639666433323236333764393839393061343866363630666438223b733a373a2269676e6f726550223b733a33323a223163646664306134316437383339646266326363303738303839383734353135223b7d693a32383b613a323a7b733a373a2269676e6f726543223b733a33323a223532616335663735353234323037366631366332336666393563336166643732223b733a373a2269676e6f726550223b733a33323a226638393165383536643239613439313263306166393761393130383335356365223b7d693a32393b613a323a7b733a373a2269676e6f726543223b733a33323a223638656230353531323931363137663662363939306436633431343862363637223b733a373a2269676e6f726550223b733a33323a223134383562643965373539656562373030313539636531333430306365633165223b7d693a33303b613a323a7b733a373a2269676e6f726543223b733a33323a223764393135373835323331396264386363333030303363333438646132666534223b733a373a2269676e6f726550223b733a33323a223565333838633464363331376166653563336531616138323530396432636531223b7d693a33313b613a323a7b733a373a2269676e6f726543223b733a33323a223537303566663061393363356237313936383163653061623962616262646665223b733a373a2269676e6f726550223b733a33323a223066316662666261373136323962336534366265386235383935353132313336223b7d693a33323b613a323a7b733a373a2269676e6f726543223b733a33323a223133353832623766373930336137633662353164366161393163376336663566223b733a373a2269676e6f726550223b733a33323a223437623837323030383030666365393762373233623836353063303162336331223b7d693a33333b613a323a7b733a373a2269676e6f726543223b733a33323a223432353434643662323663353261396535343037393537303661343337333239223b733a373a2269676e6f726550223b733a33323a223331626233343135616332333464646333383566306464663536613064366139223b7d693a33343b613a323a7b733a373a2269676e6f726543223b733a33323a223938323836343430313366323131653238313162623663653533316638663764223b733a373a2269676e6f726550223b733a33323a223663653039626264623732623138396135303466356635376336633133613533223b7d693a33353b613a323a7b733a373a2269676e6f726543223b733a33323a223165366561643033663931623364346266313937346261313661323237633134223b733a373a2269676e6f726550223b733a33323a226630363537393063613964653864313339353866323133396233656466343834223b7d693a33363b613a323a7b733a373a2269676e6f726543223b733a33323a226261646231353563386533323430643431643839373435646536306166353665223b733a373a2269676e6f726550223b733a33323a226464353430313031613963643235373330616564356665353335396665633939223b7d693a33373b613a323a7b733a373a2269676e6f726543223b733a33323a223831616465653361386631663865626530303161336435653463323231613036223b733a373a2269676e6f726550223b733a33323a226465376634636634333231313162653561363366383563376533383535373637223b7d693a33383b613a323a7b733a373a2269676e6f726543223b733a33323a223164396239373139356532396439663136343835626362663964666230383635223b733a373a2269676e6f726550223b733a33323a223231333836386630616630343366393532316661656164616166373831663331223b7d693a33393b613a323a7b733a373a2269676e6f726543223b733a33323a223433373735356331353731626663623734396466393463346339383431326531223b733a373a2269676e6f726550223b733a33323a223666666563663566393534366562313935646633636262623235623632623932223b7d693a34303b613a323a7b733a373a2269676e6f726543223b733a33323a226364633365326436643732376361663862343161343232656436343262613563223b733a373a2269676e6f726550223b733a33323a223064643535663930393830623135393563353961336564346331663363663331223b7d693a34313b613a323a7b733a373a2269676e6f726543223b733a33323a223863613333353339663131666533646234363763633830633361653537336535223b733a373a2269676e6f726550223b733a33323a223236623766353963336532643138333461623132353666346662326239393135223b7d693a34323b613a323a7b733a373a2269676e6f726543223b733a33323a226165313531656532636163306564346263313732363231376439636631313736223b733a373a2269676e6f726550223b733a33323a226131393538623337343761323633626163633465633332303064653961616461223b7d7d),
('encKey', 0x65363336313638363462323766616637),
('firewallEnabled', 0x31),
('howGetIPs', 0x52454d4f54455f41444452),
('lastScanCompleted', 0x6f6b),
('lastScheduledScanStart', 0x31333833333031363533),
('liveTrafficEnabled', 0x31),
('liveTraf_ignoreIPs', ''),
('liveTraf_ignorePublishers', 0x31),
('liveTraf_ignoreUA', ''),
('liveTraf_ignoreUsers', ''),
('loginSecurityEnabled', 0x30),
('loginSec_blockAdminReg', 0x31),
('loginSec_countFailMins', 0x31343430),
('loginSec_disableAuthorScan', 0x31),
('loginSec_lockInvalidUsers', 0x30),
('loginSec_lockoutMins', 0x3836343030),
('loginSec_maskLoginErrors', 0x30),
('loginSec_maxFailures', 0x34),
('loginSec_maxForgotPasswd', 0x33),
('loginSec_strongPasswds', 0x70756273),
('loginSec_userBlacklist', ''),
('max404Crawlers', 0x323430),
('max404Crawlers_action', 0x7468726f74746c65),
('max404Humans', 0x3330),
('max404Humans_action', 0x626c6f636b),
('maxExecutionTime', ''),
('maxGlobalRequests', 0x393630),
('maxGlobalRequests_action', 0x7468726f74746c65),
('maxMem', 0x323536),
('maxRequestsCrawlers', 0x393630),
('maxRequestsCrawlers_action', 0x7468726f74746c65),
('maxRequestsHumans', 0x313230),
('maxRequestsHumans_action', 0x626c6f636b),
('maxScanHits', 0x3135),
('maxScanHits_action', 0x626c6f636b),
('neverBlockBG', 0x6e65766572426c6f636b5665726966696564),
('other_hideWPVersion', 0x30),
('other_noAnonMemberComments', 0x30),
('other_pwStrengthOnUpdate', 0x30),
('other_scanComments', 0x30),
('other_scanOutside', 0x30),
('other_WFNet', 0x30),
('scansEnabled_comments', 0x31),
('scansEnabled_core', 0x31),
('scansEnabled_diskSpace', 0x31),
('scansEnabled_dns', 0x31),
('scansEnabled_fileContents', 0x31),
('scansEnabled_heartbleed', 0x31),
('scansEnabled_highSense', 0x30),
('scansEnabled_malware', 0x31),
('scansEnabled_oldVersions', 0x31),
('scansEnabled_options', 0x31),
('scansEnabled_passwds', 0x31),
('scansEnabled_plugins', 0x30),
('scansEnabled_posts', 0x31),
('scansEnabled_public', 0x30),
('scansEnabled_scanImages', 0x30),
('scansEnabled_themes', 0x30),
('scan_exclude', ''),
('schedScanArgs', 0x613a303a7b7d),
('scheduledScansEnabled', 0x31),
('securityLevel', 0x435553544f4d),
('spamvertizeCheck', 0x30),
('startScansRemotely', 0x30),
('tourClosed', 0x31),
('vulnRegex', 0x2f283f3a776f726466656e63655f746573745f76756c6e5f6d617463687c5c2f74696d7468756d625c2e7068707c5c2f7468756d625c2e7068707c5c2f7468756d62735c2e7068707c5c2f7468756d626e61696c5c2e7068707c5c2f7468756d626e61696c735c2e7068707c5c2f7468756d6e61696c735c2e7068707c5c2f63726f707065725c2e7068707c5c2f70696373697a655c2e7068707c5c2f726573697a65725c2e7068707c636f6e6e6563746f72735c2f75706c6f6164746573745c2e68746d6c7c636f6e6e6563746f72735c2f746573745c2e68746d6c7c6d696e676c65666f72756d616374696f6e7c75706c6f61646966795c2e7068707c616c6c7765626d656e75732d776f726470726573732d6d656e752d706c7567696e7c77702d6379636c652d706c61796c6973747c636f756e742d7065722d6461797c77702d6175746f796f75747562657c7061792d776974682d74776565747c636f6d6d656e742d726174696e675c2f636b2d70726f636573736b61726d615c2e706870292f69),
('wfKillRequested', 0x30),
('wfPeakMemory', 0x3538323734333132),
('wfsd_engine', ''),
('wfStatusStartMsgs', 0x613a31323a7b693a303b733a303a22223b693a313b733a303a22223b693a323b733a303a22223b693a333b733a303a22223b693a343b733a303a22223b693a353b733a303a22223b693a363b733a303a22223b693a373b733a303a22223b693a383b733a303a22223b693a393b733a303a22223b693a31303b733a303a22223b693a31313b733a303a22223b7d),
('wf_dnsA', 0x776f726470726573732e6c6f6320706f696e747320746f203132372e302e302e31),
('wf_dnsCNAME', ''),
('wf_dnsLogged', 0x31),
('wf_dnsMX', ''),
('wf_scanRunning', ''),
('wf_summaryItems', 0x613a31363a7b733a31303a22746f74616c5573657273223b693a323b733a31303a22746f74616c5061676573223b733a323a223133223b733a31303a22746f74616c506f737473223b733a313a2230223b733a31333a22746f74616c436f6d6d656e7473223b733a323a223135223b733a31353a22746f74616c43617465676f72696573223b733a313a2238223b733a31313a22746f74616c5461626c6573223b693a33363b733a393a22746f74616c526f7773223b693a31303931373b733a31323a22746f74616c506c7567696e73223b693a32363b733a31303a226c617374557064617465223b693a313338333330313638333b733a31313a22746f74616c5468656d6573223b693a333b733a393a22746f74616c44617461223b733a383a2234352e3339204d42223b733a31303a22746f74616c46696c6573223b693a323937373b733a393a22746f74616c44697273223b693a3439323b733a31303a226c696e65734f66504850223b693a3538333631383b733a31303a226c696e65734f664a4348223b693a3131393637363b733a383a227363616e54696d65223b643a313338333330313638332e31393238333239343637373733343337353b7d),
('whitelisted', '');

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_wfCrawlers`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_wfCrawlers` (
  `IP` int(10) unsigned NOT NULL,
  `patternSig` binary(16) NOT NULL,
  `status` char(8) NOT NULL,
  `lastUpdate` int(10) unsigned NOT NULL,
  `PTR` varchar(255) DEFAULT '',
  PRIMARY KEY (`IP`,`patternSig`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_wfFileMods`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_wfFileMods` (
  `filenameMD5` binary(16) NOT NULL,
  `filename` varchar(1000) NOT NULL,
  `knownFile` tinyint(3) unsigned NOT NULL,
  `oldMD5` binary(16) NOT NULL,
  `newMD5` binary(16) NOT NULL,
  PRIMARY KEY (`filenameMD5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_wfHits`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_wfHits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` double(17,6) unsigned NOT NULL,
  `IP` int(10) unsigned NOT NULL,
  `jsRun` tinyint(4) DEFAULT '0',
  `is404` tinyint(4) NOT NULL,
  `isGoogle` tinyint(4) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `newVisit` tinyint(3) unsigned NOT NULL,
  `URL` text,
  `referer` text,
  `UA` text,
  PRIMARY KEY (`id`),
  KEY `k1` (`ctime`),
  KEY `k2` (`IP`,`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_wfHoover`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_wfHoover` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` text,
  `host` text,
  `path` text,
  `hostKey` binary(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `k2` (`hostKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_wfIssues`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_wfIssues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(10) unsigned NOT NULL,
  `status` varchar(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `severity` tinyint(3) unsigned NOT NULL,
  `ignoreP` char(32) NOT NULL,
  `ignoreC` char(32) NOT NULL,
  `shortMsg` varchar(255) NOT NULL,
  `longMsg` text,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_wfLeechers`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_wfLeechers` (
  `eMin` int(10) unsigned NOT NULL,
  `IP` int(10) unsigned NOT NULL,
  `hits` int(10) unsigned NOT NULL,
  PRIMARY KEY (`eMin`,`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_wfLockedOut`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_wfLockedOut` (
  `IP` int(10) unsigned NOT NULL,
  `blockedTime` bigint(20) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `lastAttempt` int(10) unsigned DEFAULT '0',
  `blockedHits` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_wfLocs`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_wfLocs` (
  `IP` int(10) unsigned NOT NULL,
  `ctime` int(10) unsigned NOT NULL,
  `failed` tinyint(3) unsigned NOT NULL,
  `city` varchar(255) DEFAULT '',
  `region` varchar(255) DEFAULT '',
  `countryName` varchar(255) DEFAULT '',
  `countryCode` char(2) DEFAULT '',
  `lat` float(10,7) DEFAULT '0.0000000',
  `lon` float(10,7) DEFAULT '0.0000000',
  PRIMARY KEY (`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_wfLogins`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_wfLogins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` double(17,6) unsigned NOT NULL,
  `fail` tinyint(3) unsigned NOT NULL,
  `action` varchar(40) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `IP` int(10) unsigned NOT NULL,
  `UA` text,
  PRIMARY KEY (`id`),
  KEY `k1` (`IP`,`fail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_wfNet404s`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_wfNet404s` (
  `sig` binary(16) NOT NULL,
  `ctime` int(10) unsigned NOT NULL,
  `URI` varchar(1000) NOT NULL,
  PRIMARY KEY (`sig`),
  KEY `k1` (`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_wfReverseCache`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_wfReverseCache` (
  `IP` int(10) unsigned NOT NULL,
  `host` varchar(255) NOT NULL,
  `lastUpdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_wfScanners`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_wfScanners` (
  `eMin` int(10) unsigned NOT NULL,
  `IP` int(10) unsigned NOT NULL,
  `hits` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`eMin`,`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_wfStatus`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_wfStatus` (
  `ctime` double(17,6) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `type` char(5) NOT NULL,
  `msg` varchar(1000) NOT NULL,
  KEY `k1` (`ctime`),
  KEY `k2` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_wfThrottleLog`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_wfThrottleLog` (
  `IP` int(10) unsigned NOT NULL,
  `startTime` int(10) unsigned NOT NULL,
  `endTime` int(10) unsigned NOT NULL,
  `timesThrottled` int(10) unsigned NOT NULL,
  `lastReason` varchar(255) NOT NULL,
  PRIMARY KEY (`IP`),
  KEY `k2` (`endTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `uo6g6en_wfVulnScanners`
--

CREATE TABLE IF NOT EXISTS `uo6g6en_wfVulnScanners` (
  `IP` int(10) unsigned NOT NULL,
  `ctime` int(10) unsigned NOT NULL,
  `hits` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
