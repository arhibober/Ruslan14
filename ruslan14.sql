-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2021 at 07:11 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ruslan14`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Мистер WordPress', '', 'https://wordpress.org/', '', '2016-07-03 16:55:44', '2016-07-03 13:55:44', 'Привет! Это комментарий.\nЧтобы удалить его, авторизуйтесь и просмотрите комментарии к записи. Там будут ссылки для их изменения или удаления.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_lightbox_photoswipe_img`
--

CREATE TABLE `wp_lightbox_photoswipe_img` (
  `imgkey` char(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created` datetime DEFAULT NULL,
  `width` mediumint(7) DEFAULT NULL,
  `height` mediumint(7) DEFAULT NULL,
  `exif_camera` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exif_focal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exif_fstop` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exif_shutter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exif_iso` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exif_datetime` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_lightbox_photoswipe_img`
--

INSERT INTO `wp_lightbox_photoswipe_img` (`imgkey`, `created`, `width`, `height`, `exif_camera`, `exif_focal`, `exif_fstop`, `exif_shutter`, `exif_iso`, `exif_datetime`) VALUES
('474c46877f64331dcbfaf3c3b79b9905-1587232019', '2020-04-30 16:10:43', 607, 960, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/Ruslan14', 'yes'),
(2, 'home', 'http://localhost/Ruslan14', 'yes'),
(3, 'blogname', 'Портал художника Руслана Варламова', 'yes'),
(4, 'blogdescription', 'Ещё один сайт на WordPress', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'arhibober@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'd.m.Y', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'd.m.Y H:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:90:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=4&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:8:{i:0;s:51:\"ip2location-redirection/ip2location-redirection.php\";i:1;s:22:\"cyr3lat/cyr-to-lat.php\";i:2;s:41:\"easy-image-gallery/easy-image-gallery.php\";i:3;s:57:\"google-language-translator/google-language-translator.php\";i:4;s:25:\"loftloader/loftloader.php\";i:5;s:24:\"simple-lightbox/main.php\";i:6;s:33:\"theme-my-login/theme-my-login.php\";i:7;s:27:\"wp-super-cache/wp-cache.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '3', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'yan', 'yes'),
(41, 'stylesheet', 'yan', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '47018', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '800', 'yes'),
(66, 'image_default_link_type', 'link', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:4:{i:0;b:0;s:57:\"google-language-translator/google-language-translator.php\";s:14:\"glt_deactivate\";s:33:\"theme-my-login/theme-my-login.php\";a:2:{i:0;s:20:\"Theme_My_Login_Admin\";i:1;s:9:\"uninstall\";}s:27:\"wp-super-cache/wp-cache.php\";s:22:\"wpsupercache_uninstall\";}', 'yes'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '4', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '514', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'initial_db_version', '36686', 'yes'),
(92, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(93, 'WPLANG', 'ru_RU', 'yes'),
(94, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(95, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(96, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(97, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'sidebars_widgets', 'a:4:{s:18:\"orphaned_widgets_1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:1:{i:0;s:12:\"glt_widget-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(100, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'cron', 'a:8:{i:1595108440;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1595123745;a:3:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1595166956;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1595167412;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1595187634;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1595187664;a:1:{s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1595360434;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'yes'),
(773, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:19:\"arhibober@gmail.com\";s:7:\"version\";s:5:\"5.4.2\";s:9:\"timestamp\";i:1591873641;}', 'no'),
(148, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(183, 'easy-image-gallery', 'a:2:{s:8:\"lightbox\";s:8:\"fancybox\";s:10:\"post_types\";a:2:{s:4:\"post\";s:2:\"on\";s:4:\"page\";s:2:\"on\";}}', 'yes'),
(135, '_transient_twentysixteen_categories', '1', 'yes'),
(136, 'theme_mods_twentysixteen', 'a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1467554606;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}', 'yes'),
(137, 'current_theme', 'Yan', 'yes'),
(138, 'theme_mods_yan', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:7:\"primary\";i:2;}s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(139, 'theme_switched', '', 'yes'),
(141, 'recently_activated', 'a:0:{}', 'yes'),
(229, 'googlelanguagetranslator_active', '1', 'yes'),
(230, 'googlelanguagetranslator_language', 'ru', 'yes'),
(231, 'googlelanguagetranslator_language_option', 'all', 'yes'),
(232, 'googlelanguagetranslator_flags', 'show_flags', 'yes'),
(233, 'language_display_settings', 'a:1:{s:2:\"en\";s:1:\"1\";}', 'yes'),
(234, 'flag_display_settings', 'a:16:{s:7:\"flag-af\";s:1:\"1\";s:7:\"flag-sq\";s:1:\"1\";s:7:\"flag-ar\";s:1:\"1\";s:7:\"flag-hy\";s:1:\"1\";s:7:\"flag-az\";s:1:\"1\";s:7:\"flag-eu\";s:1:\"1\";s:10:\"flag-zh-CN\";s:1:\"1\";s:7:\"flag-en\";s:1:\"1\";s:7:\"flag-fr\";s:1:\"1\";s:7:\"flag-de\";s:1:\"1\";s:7:\"flag-it\";s:1:\"1\";s:7:\"flag-pl\";s:1:\"1\";s:7:\"flag-pt\";s:1:\"1\";s:7:\"flag-ru\";s:1:\"1\";s:7:\"flag-es\";s:1:\"1\";s:7:\"flag-uk\";s:1:\"1\";}', 'yes'),
(235, 'googlelanguagetranslator_translatebox', 'no', 'yes'),
(236, 'googlelanguagetranslator_display', 'Vertical', 'yes'),
(237, 'googlelanguagetranslator_toolbar', 'Yes', 'yes'),
(238, 'googlelanguagetranslator_showbranding', 'Yes', 'yes'),
(239, 'googlelanguagetranslator_flags_alignment', 'flags_left', 'yes'),
(240, 'googlelanguagetranslator_analytics', '', 'yes'),
(241, 'googlelanguagetranslator_analytics_id', '', 'yes'),
(242, 'googlelanguagetranslator_css', '', 'yes'),
(243, 'googlelanguagetranslator_multilanguage', '', 'yes'),
(244, 'googlelanguagetranslator_floating_widget', 'yes', 'yes'),
(245, 'googlelanguagetranslator_flag_size', '18', 'yes'),
(246, 'googlelanguagetranslator_flags_order', '', 'yes'),
(247, 'googlelanguagetranslator_english_flag_choice', 'us_flag', 'yes'),
(248, 'googlelanguagetranslator_spanish_flag_choice', 'spanish_flag', 'yes'),
(249, 'googlelanguagetranslator_portuguese_flag_choice', 'portuguese_flag', 'yes'),
(250, 'widget_glt_widget', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(7152, 'easy_fancybox_version', '1.8.18', 'yes'),
(7232, 'mfbfw_active_version', '3.2.7', 'yes'),
(7233, 'mfbfw-rate-time', '1588159698', 'yes'),
(7155, 'ip2location_redirection_enabled', '1', 'yes'),
(7156, 'ip2location_redirection_first_redirect', '0', 'yes'),
(7157, 'ip2location_redirection_lookup_mode', 'bin', 'yes'),
(7158, 'ip2location_redirection_api_key', '', 'yes'),
(7159, 'ip2location_redirection_database', '', 'yes'),
(7160, 'ip2location_redirection_rules', '[]', 'yes'),
(7161, 'ip2location_redirection_noredirect_enabled', '0', 'yes'),
(7162, 'ip2location_redirection_debug_log_enabled', '0', 'yes'),
(7163, 'fancybox_enableImg', '1', 'yes'),
(7164, 'fancybox_enableInline', '1', 'yes'),
(7165, 'fancybox_enablePDF', '', 'yes'),
(7166, 'fancybox_enableSWF', '', 'yes'),
(7167, 'fancybox_enableSVG', '', 'yes'),
(7168, 'fancybox_enableYoutube', '', 'yes'),
(7169, 'fancybox_enableVimeo', '', 'yes'),
(7170, 'fancybox_enableDailymotion', '', 'yes'),
(7171, 'fancybox_enableiFrame', '', 'yes'),
(7172, 'fancybox_overlayShow', '1', 'yes'),
(7173, 'fancybox_hideOnOverlayClick', '1', 'yes'),
(7174, 'fancybox_overlayOpacity', '', 'yes'),
(7175, 'fancybox_overlayColor', '', 'yes'),
(7176, 'fancybox_overlaySpotlight', '', 'yes'),
(7177, 'fancybox_showCloseButton', '1', 'yes'),
(7178, 'fancybox_backgroundColor', '', 'yes'),
(7179, 'fancybox_textColor', '', 'yes'),
(7180, 'fancybox_titleColor', '', 'yes'),
(7181, 'fancybox_paddingColor', '', 'yes'),
(7182, 'fancybox_borderRadius', '', 'yes'),
(7183, 'fancybox_width', '', 'yes'),
(7184, 'fancybox_height', '', 'yes'),
(7185, 'fancybox_padding', '', 'yes'),
(7186, 'fancybox_margin', '20', 'yes'),
(7187, 'fancybox_centerOnScroll', '', 'yes'),
(7188, 'fancybox_enableEscapeButton', '1', 'yes'),
(7189, 'fancybox_autoScale', '1', 'yes'),
(7190, 'fancybox_speedIn', '', 'yes'),
(7191, 'fancybox_speedOut', '', 'yes'),
(7192, 'fancybox_mouseWheel', '', 'yes'),
(7193, 'fancybox_autoClick', '1', 'yes'),
(7194, 'fancybox_delayClick', '1000', 'yes'),
(7195, 'fancybox_minViewportWidth', '', 'yes'),
(7196, 'fancybox_compatIE8', '', 'yes'),
(7197, 'fancybox_scriptPriority', '10', 'yes'),
(7198, 'fancybox_noFooter', '', 'yes'),
(7199, 'fancybox_nojQuery', '', 'yes'),
(7200, 'fancybox_pre45Compat', '', 'yes'),
(7201, 'fancybox_metaData', '', 'yes'),
(7202, 'fancybox_vcMasonryCompat', '', 'yes'),
(7203, 'fancybox_autoAttribute', '.jpg .jpeg .png .webp', 'yes'),
(7204, 'fancybox_autoAttributeLimit', '', 'yes'),
(7205, 'fancybox_classType', 'image', 'yes'),
(7206, 'fancybox_transitionIn', 'elastic', 'yes'),
(7207, 'fancybox_easingIn', 'easeOutBack', 'yes'),
(7208, 'fancybox_transitionOut', 'elastic', 'yes'),
(7209, 'fancybox_easingOut', 'easeInBack', 'yes'),
(7210, 'fancybox_opacity', '', 'yes'),
(7211, 'fancybox_hideOnContentClick', '', 'yes'),
(7212, 'fancybox_titleShow', '1', 'yes'),
(7213, 'fancybox_titlePosition', 'over', 'yes'),
(7214, 'fancybox_titleFromAlt', '1', 'yes'),
(7215, 'fancybox_autoGallery', '1', 'yes'),
(7216, 'fancybox_showNavArrows', '1', 'yes'),
(7217, 'fancybox_enableKeyboardNav', '1', 'yes'),
(7218, 'fancybox_cyclic', '', 'yes'),
(7219, 'fancybox_changeSpeed', '', 'yes'),
(7220, 'fancybox_changeFade', '', 'yes'),
(7221, 'fancybox_autoSelector', '.gallery,.wp-block-gallery,.tiled-gallery,.wp-block-jetpack-tiled-gallery', 'yes'),
(7231, 'mfbfw', 'a:30:{s:11:\"showToolbar\";s:2:\"on\";s:11:\"borderColor\";s:7:\"#BBBBBB\";s:12:\"paddingColor\";s:7:\"#FFFFFF\";s:7:\"padding\";s:2:\"10\";s:11:\"overlayShow\";s:2:\"on\";s:12:\"overlayColor\";s:7:\"#666666\";s:14:\"overlayOpacity\";s:3:\"0.3\";s:9:\"titleShow\";s:2:\"on\";s:9:\"titleSize\";s:2:\"14\";s:13:\"titlePosition\";s:6:\"inside\";s:10:\"titleColor\";s:7:\"#333333\";s:13:\"showNavArrows\";s:2:\"on\";s:11:\"zoomOpacity\";s:2:\"on\";s:12:\"transitionIn\";s:4:\"fade\";s:11:\"zoomSpeedIn\";s:3:\"500\";s:16:\"transitionEffect\";s:4:\"fade\";s:15:\"zoomSpeedChange\";s:3:\"300\";s:18:\"hideOnOverlayClick\";s:2:\"on\";s:18:\"enableEscapeButton\";s:2:\"on\";s:11:\"galleryType\";s:3:\"all\";s:16:\"customExpression\";s:62:\"jQuery(thumbnails).attr(\"data-fancybox\",\"gallery\").getTitle();\";s:14:\"autoDimensions\";s:2:\"on\";s:10:\"frameWidth\";s:3:\"560\";s:11:\"frameHeight\";s:3:\"340\";s:15:\"callbackOnStart\";s:31:\"function() { alert(\"Start!\"); }\";s:16:\"callbackOnCancel\";s:32:\"function() { alert(\"Cancel!\"); }\";s:18:\"callbackOnComplete\";s:34:\"function() { alert(\"Complete!\"); }\";s:17:\"callbackOnCleanup\";s:33:\"function() { alert(\"CleanUp!\"); }\";s:15:\"callbackOnClose\";s:31:\"function() { alert(\"Close!\"); }\";s:14:\"extraCallsData\";s:0:\"\";}', 'yes'),
(1823, 'ossdl_off_cdn_url', 'http://localhost/Ruslan14', 'yes'),
(1824, 'ossdl_off_include_dirs', 'wp-content,wp-includes', 'yes'),
(1825, 'ossdl_off_exclude', '.php', 'yes'),
(1826, 'ossdl_cname', '', 'yes'),
(2329, 'widget_theme-my-login', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(2330, 'theme_my_login', 'a:4:{s:10:\"enable_css\";b:1;s:10:\"login_type\";s:7:\"default\";s:14:\"active_modules\";a:1:{i:0;s:41:\"custom-redirection/custom-redirection.php\";}s:7:\"version\";s:5:\"6.4.9\";}', 'yes'),
(2333, 'theme_my_login_redirection', 'a:5:{s:13:\"administrator\";a:4:{s:10:\"login_type\";s:6:\"custom\";s:9:\"login_url\";s:26:\"http://localhost/Ruslan14/\";s:11:\"logout_type\";s:7:\"default\";s:10:\"logout_url\";s:0:\"\";}s:6:\"editor\";a:4:{s:10:\"login_type\";s:7:\"default\";s:9:\"login_url\";s:0:\"\";s:11:\"logout_type\";s:7:\"default\";s:10:\"logout_url\";s:0:\"\";}s:6:\"author\";a:4:{s:10:\"login_type\";s:7:\"referer\";s:9:\"login_url\";s:0:\"\";s:11:\"logout_type\";s:7:\"default\";s:10:\"logout_url\";s:0:\"\";}s:11:\"contributor\";a:4:{s:10:\"login_type\";s:7:\"referer\";s:9:\"login_url\";s:0:\"\";s:11:\"logout_type\";s:7:\"default\";s:10:\"logout_url\";s:0:\"\";}s:10:\"subscriber\";a:4:{s:10:\"login_type\";s:7:\"referer\";s:9:\"login_url\";s:0:\"\";s:11:\"logout_type\";s:7:\"default\";s:10:\"logout_url\";s:0:\"\";}}', 'yes'),
(6896, 'can_compress_scripts', '1', 'no'),
(6897, 'fresh_site', '0', 'yes'),
(6772, 'category_children', 'a:0:{}', 'yes'),
(6893, 'recovery_keys', 'a:0:{}', 'yes'),
(6883, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(6884, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(6885, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(6891, 'db_upgraded', '', 'yes'),
(7438, 'wp_super_cache_index_detected', '1', 'no'),
(7439, 'wpsupercache_start', '1589365084', 'yes'),
(7440, 'wpsupercache_count', '0', 'yes'),
(7441, 'recovery_mode_email_last_sent', '1589365098', 'yes'),
(7476, 'slb_version', '2.8.1', 'yes'),
(7477, 'slb_options', 'a:27:{s:7:\"enabled\";b:1;s:12:\"enabled_home\";b:1;s:12:\"enabled_post\";b:1;s:12:\"enabled_page\";b:1;s:15:\"enabled_archive\";b:1;s:14:\"enabled_widget\";b:0;s:12:\"enabled_menu\";b:0;s:11:\"group_links\";b:1;s:10:\"group_post\";b:1;s:13:\"group_gallery\";b:0;s:12:\"group_widget\";b:0;s:10:\"group_menu\";b:0;s:10:\"ui_autofit\";b:1;s:10:\"ui_animate\";b:1;s:19:\"slideshow_autostart\";b:1;s:18:\"slideshow_duration\";s:1:\"6\";s:10:\"group_loop\";b:1;s:18:\"ui_overlay_opacity\";s:3:\"0.8\";s:16:\"ui_title_default\";b:0;s:11:\"txt_loading\";s:7:\"Loading\";s:9:\"txt_close\";s:5:\"Close\";s:12:\"txt_nav_next\";s:4:\"Next\";s:12:\"txt_nav_prev\";s:8:\"Previous\";s:19:\"txt_slideshow_start\";s:15:\"Start slideshow\";s:18:\"txt_slideshow_stop\";s:14:\"Stop slideshow\";s:16:\"txt_group_status\";s:25:\"Item %current% of %total%\";s:13:\"theme_default\";s:11:\"slb_default\";}', 'yes'),
(7565, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-5.4.2.zip\";s:6:\"locale\";s:5:\"ru_RU\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-5.4.2.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.4.2\";s:7:\"version\";s:5:\"5.4.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1595095563;s:15:\"version_checked\";s:5:\"5.4.2\";s:12:\"translations\";a:0:{}}', 'no'),
(7566, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1595095564;s:7:\"checked\";a:1:{s:3:\"yan\";s:1:\"1\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(7567, '_site_transient_update_plugins', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1595095564;s:8:\"response\";a:7:{s:41:\"easy-image-gallery/easy-image-gallery.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:32:\"w.org/plugins/easy-image-gallery\";s:4:\"slug\";s:18:\"easy-image-gallery\";s:6:\"plugin\";s:41:\"easy-image-gallery/easy-image-gallery.php\";s:11:\"new_version\";s:5:\"1.4.3\";s:3:\"url\";s:49:\"https://wordpress.org/plugins/easy-image-gallery/\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/plugin/easy-image-gallery.1.4.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:71:\"https://ps.w.org/easy-image-gallery/assets/icon-256x256.png?rev=2235126\";s:2:\"1x\";s:71:\"https://ps.w.org/easy-image-gallery/assets/icon-128x128.png?rev=2235126\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:74:\"https://ps.w.org/easy-image-gallery/assets/banner-1544x500.png?rev=2235126\";s:2:\"1x\";s:73:\"https://ps.w.org/easy-image-gallery/assets/banner-772x250.png?rev=2235126\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.3.4\";s:12:\"requires_php\";s:3:\"5.6\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:57:\"google-language-translator/google-language-translator.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:40:\"w.org/plugins/google-language-translator\";s:4:\"slug\";s:26:\"google-language-translator\";s:6:\"plugin\";s:57:\"google-language-translator/google-language-translator.php\";s:11:\"new_version\";s:5:\"6.0.6\";s:3:\"url\";s:57:\"https://wordpress.org/plugins/google-language-translator/\";s:7:\"package\";s:75:\"https://downloads.wordpress.org/plugin/google-language-translator.6.0.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:79:\"https://ps.w.org/google-language-translator/assets/icon-256x256.png?rev=2124537\";s:2:\"1x\";s:79:\"https://ps.w.org/google-language-translator/assets/icon-256x256.png?rev=2124537\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:82:\"https://ps.w.org/google-language-translator/assets/banner-1544x500.png?rev=1632425\";s:2:\"1x\";s:81:\"https://ps.w.org/google-language-translator/assets/banner-772x250.png?rev=1632425\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:9:\"hello.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.2.7\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:51:\"ip2location-redirection/ip2location-redirection.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:37:\"w.org/plugins/ip2location-redirection\";s:4:\"slug\";s:23:\"ip2location-redirection\";s:6:\"plugin\";s:51:\"ip2location-redirection/ip2location-redirection.php\";s:11:\"new_version\";s:6:\"1.17.4\";s:3:\"url\";s:54:\"https://wordpress.org/plugins/ip2location-redirection/\";s:7:\"package\";s:73:\"https://downloads.wordpress.org/plugin/ip2location-redirection.1.17.4.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:76:\"https://ps.w.org/ip2location-redirection/assets/icon-128x128.png?rev=2121920\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:78:\"https://ps.w.org/ip2location-redirection/assets/banner-772x250.png?rev=1047796\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:43:\"lightbox-photoswipe/lightbox-photoswipe.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:33:\"w.org/plugins/lightbox-photoswipe\";s:4:\"slug\";s:19:\"lightbox-photoswipe\";s:6:\"plugin\";s:43:\"lightbox-photoswipe/lightbox-photoswipe.php\";s:11:\"new_version\";s:5:\"3.0.5\";s:3:\"url\";s:50:\"https://wordpress.org/plugins/lightbox-photoswipe/\";s:7:\"package\";s:68:\"https://downloads.wordpress.org/plugin/lightbox-photoswipe.3.0.5.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:72:\"https://ps.w.org/lightbox-photoswipe/assets/icon-256x256.png?rev=1904144\";s:2:\"1x\";s:72:\"https://ps.w.org/lightbox-photoswipe/assets/icon-128x128.png?rev=1904144\";}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:33:\"theme-my-login/theme-my-login.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:28:\"w.org/plugins/theme-my-login\";s:4:\"slug\";s:14:\"theme-my-login\";s:6:\"plugin\";s:33:\"theme-my-login/theme-my-login.php\";s:11:\"new_version\";s:5:\"7.1.1\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/theme-my-login/\";s:7:\"package\";s:57:\"https://downloads.wordpress.org/plugin/theme-my-login.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/theme-my-login/assets/icon-256x256.png?rev=1891232\";s:2:\"1x\";s:67:\"https://ps.w.org/theme-my-login/assets/icon-128x128.png?rev=1891232\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/theme-my-login/assets/banner-1544x500.png?rev=1891232\";s:2:\"1x\";s:69:\"https://ps.w.org/theme-my-login/assets/banner-772x250.png?rev=1891232\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:27:\"wp-super-cache/wp-cache.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:28:\"w.org/plugins/wp-super-cache\";s:4:\"slug\";s:14:\"wp-super-cache\";s:6:\"plugin\";s:27:\"wp-super-cache/wp-cache.php\";s:11:\"new_version\";s:5:\"1.7.1\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/wp-super-cache/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/wp-super-cache.1.7.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/wp-super-cache/assets/icon-256x256.png?rev=1095422\";s:2:\"1x\";s:67:\"https://ps.w.org/wp-super-cache/assets/icon-128x128.png?rev=1095422\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/wp-super-cache/assets/banner-1544x500.png?rev=1082414\";s:2:\"1x\";s:69:\"https://ps.w.org/wp-super-cache/assets/banner-772x250.png?rev=1082414\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.3.4\";s:12:\"requires_php\";s:5:\"5.2.4\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:7:{s:22:\"cyr3lat/cyr-to-lat.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/cyr3lat\";s:4:\"slug\";s:7:\"cyr3lat\";s:6:\"plugin\";s:22:\"cyr3lat/cyr-to-lat.php\";s:11:\"new_version\";s:3:\"3.5\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/cyr3lat/\";s:7:\"package\";s:54:\"https://downloads.wordpress.org/plugin/cyr3lat.3.5.zip\";s:5:\"icons\";a:1:{s:7:\"default\";s:51:\"https://s.w.org/plugins/geopattern-icon/cyr3lat.svg\";}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}}s:31:\"easy-fancybox/easy-fancybox.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:27:\"w.org/plugins/easy-fancybox\";s:4:\"slug\";s:13:\"easy-fancybox\";s:6:\"plugin\";s:31:\"easy-fancybox/easy-fancybox.php\";s:11:\"new_version\";s:6:\"1.8.18\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/easy-fancybox/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/easy-fancybox.1.8.18.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/easy-fancybox/assets/icon-128x128.png?rev=1112136\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:68:\"https://ps.w.org/easy-fancybox/assets/banner-772x250.jpg?rev=1112136\";}s:11:\"banners_rtl\";a:0:{}}s:22:\"fancy-box/fancybox.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:23:\"w.org/plugins/fancy-box\";s:4:\"slug\";s:9:\"fancy-box\";s:6:\"plugin\";s:22:\"fancy-box/fancybox.php\";s:11:\"new_version\";s:5:\"1.1.0\";s:3:\"url\";s:40:\"https://wordpress.org/plugins/fancy-box/\";s:7:\"package\";s:52:\"https://downloads.wordpress.org/plugin/fancy-box.zip\";s:5:\"icons\";a:1:{s:7:\"default\";s:53:\"https://s.w.org/plugins/geopattern-icon/fancy-box.svg\";}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}}s:35:\"fancybox-for-wordpress/fancybox.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:36:\"w.org/plugins/fancybox-for-wordpress\";s:4:\"slug\";s:22:\"fancybox-for-wordpress\";s:6:\"plugin\";s:35:\"fancybox-for-wordpress/fancybox.php\";s:11:\"new_version\";s:5:\"3.2.7\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/fancybox-for-wordpress/\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.3.2.7.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/fancybox-for-wordpress/assets/icon-256x256.jpg?rev=1864321\";s:2:\"1x\";s:75:\"https://ps.w.org/fancybox-for-wordpress/assets/icon-256x256.jpg?rev=1864321\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:77:\"https://ps.w.org/fancybox-for-wordpress/assets/banner-772x250.jpg?rev=1864321\";}s:11:\"banners_rtl\";a:0:{}}s:25:\"loftloader/loftloader.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:24:\"w.org/plugins/loftloader\";s:4:\"slug\";s:10:\"loftloader\";s:6:\"plugin\";s:25:\"loftloader/loftloader.php\";s:11:\"new_version\";s:5:\"2.2.2\";s:3:\"url\";s:41:\"https://wordpress.org/plugins/loftloader/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/plugin/loftloader.2.2.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/loftloader/assets/icon-256x256.png?rev=1361628\";s:2:\"1x\";s:63:\"https://ps.w.org/loftloader/assets/icon-128x128.png?rev=1361628\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/loftloader/assets/banner-1544x500.png?rev=1361628\";s:2:\"1x\";s:65:\"https://ps.w.org/loftloader/assets/banner-772x250.png?rev=1361628\";}s:11:\"banners_rtl\";a:0:{}}s:35:\"simple-fancybox/simple-fancybox.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:29:\"w.org/plugins/simple-fancybox\";s:4:\"slug\";s:15:\"simple-fancybox\";s:6:\"plugin\";s:35:\"simple-fancybox/simple-fancybox.php\";s:11:\"new_version\";s:3:\"1.0\";s:3:\"url\";s:46:\"https://wordpress.org/plugins/simple-fancybox/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/plugin/simple-fancybox.1.0.zip\";s:5:\"icons\";a:1:{s:7:\"default\";s:59:\"https://s.w.org/plugins/geopattern-icon/simple-fancybox.svg\";}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}}s:24:\"simple-lightbox/main.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:29:\"w.org/plugins/simple-lightbox\";s:4:\"slug\";s:15:\"simple-lightbox\";s:6:\"plugin\";s:24:\"simple-lightbox/main.php\";s:11:\"new_version\";s:5:\"2.8.1\";s:3:\"url\";s:46:\"https://wordpress.org/plugins/simple-lightbox/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/simple-lightbox.zip\";s:5:\"icons\";a:1:{s:7:\"default\";s:59:\"https://s.w.org/plugins/geopattern-icon/simple-lightbox.svg\";}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(7297, 'lightbox_photoswipe_share_facebook', '1', 'yes'),
(7298, 'lightbox_photoswipe_share_pinterest', '1', 'yes'),
(7299, 'lightbox_photoswipe_share_twitter', '1', 'yes'),
(7300, 'lightbox_photoswipe_share_download', '1', 'yes'),
(7325, 'lightbox_photoswipe_share_copyurl', '', 'yes'),
(7302, 'lightbox_photoswipe_close_on_drag', '1', 'yes'),
(7303, 'lightbox_photoswipe_show_counter', '1', 'yes'),
(7304, 'lightbox_photoswipe_skin', '3', 'yes'),
(7305, 'lightbox_photoswipe_show_zoom', '1', 'yes'),
(7306, 'lightbox_photoswipe_show_caption', '1', 'yes'),
(7307, 'lightbox_photoswipe_spacing', '12', 'yes'),
(7308, 'lightbox_photoswipe_loop', '1', 'yes'),
(7309, 'lightbox_photoswipe_pinchtoclose', '1', 'yes'),
(7310, 'lightbox_photoswipe_usepostdata', '1', 'yes'),
(7311, 'lightbox_photoswipe_show_fullscreen', '1', 'yes'),
(7312, 'lightbox_photoswipe_taptotoggle', '1', 'yes'),
(7313, 'lightbox_photoswipe_share_direct', '', 'yes'),
(7314, 'lightbox_photoswipe_close_on_click', '1', 'yes'),
(7315, 'lightbox_photoswipe_fulldesktop', '', 'yes'),
(7316, 'lightbox_photoswipe_use_alt', '', 'yes'),
(7317, 'lightbox_photoswipe_showexif', '', 'yes'),
(7318, 'lightbox_photoswipe_history', '1', 'yes'),
(7319, 'lightbox_photoswipe_separate_galleries', '', 'yes'),
(7320, 'lightbox_photoswipe_desktop_slider', '1', 'yes'),
(7321, 'lightbox_photoswipe_idletime', '4000', 'yes'),
(7322, 'lightbox_photoswipe_add_lazyloading', '', 'yes'),
(7323, 'lightbox_photoswipe_usedescription', '', 'yes'),
(7324, 'lightbox_photoswipe_wheelmode', 'close', 'yes'),
(7326, 'lightbox_photoswipe_share_custom', '', 'yes'),
(7327, 'lightbox_photoswipe_share_custom_label', '', 'yes'),
(7328, 'lightbox_photoswipe_share_custom_link', '', 'yes'),
(7329, 'lightbox_photoswipe_metabox', '1', 'yes'),
(7330, 'lightbox_photoswipe_db_version', '24', 'yes'),
(7332, 'lightbox_photoswipe_disabled_post_ids', '', 'yes'),
(7333, 'lightbox_photoswipe_showexif_date', '', 'yes'),
(7465, 'supercache_stats', 'a:3:{s:9:\"generated\";i:1589380062;s:10:\"supercache\";a:5:{s:7:\"expired\";i:0;s:12:\"expired_list\";a:0:{}s:6:\"cached\";i:0;s:11:\"cached_list\";a:0:{}s:2:\"ts\";i:1589380062;}s:7:\"wpcache\";a:3:{s:6:\"cached\";i:0;s:7:\"expired\";i:0;s:5:\"fsize\";s:3:\"0KB\";}}', 'yes'),
(6886, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(6887, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(6888, 'wp_page_for_privacy_policy', '0', 'yes'),
(6889, 'show_comments_cookies_opt_in', '1', 'yes'),
(6890, 'admin_email_lifespan', '0', 'yes'),
(6962, '_transient_health-check-site-status-result', '{\"good\":9,\"recommended\":8,\"critical\":0}', 'yes'),
(6920, 'loftloader_main_switch', 'on', 'yes'),
(6921, 'loftloader_show_range', 'sitewide', 'yes'),
(6922, 'loftloader_bg_color', '#000000', 'yes'),
(6923, 'loftloader_bg_opacity', '95', 'yes'),
(6924, 'loftloader_bg_animation', 'fade', 'yes'),
(6925, 'loftloader_loader_type', 'imgloading', 'yes'),
(6926, 'loftloader_loader_color', '#248acc', 'yes'),
(6927, 'loftloader_custom_img', 'http://localhost/Ruslan14/wp-content/uploads/2017/01/index-1.jpg', 'yes'),
(6928, 'loftloader_img_width', '76', 'yes'),
(6929, 'loftloader_lite_version', '2.1.9', 'yes'),
(7568, '_site_transient_timeout_php_check_12edeb5890095749089987982a1404ce', '1595700365', 'no'),
(7569, '_site_transient_php_check_12edeb5890095749089987982a1404ce', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(2, 4, '_edit_last', '1'),
(3, 4, '_wp_page_template', 'template-gallery.php'),
(4, 4, '_edit_lock', '1595095532:1'),
(230, 118, '_menu_item_menu_item_parent', '0'),
(231, 118, '_menu_item_object_id', '4'),
(232, 118, '_menu_item_object', 'page'),
(233, 118, '_menu_item_target', ''),
(234, 118, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(235, 118, '_menu_item_xfn', ''),
(236, 118, '_menu_item_url', ''),
(1034, 489, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:104;s:6:\"height\";i:104;s:4:\"file\";s:19:\"2017/01/index-1.jpg\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1033, 489, '_wp_attached_file', '2017/01/index-1.jpg'),
(247, 120, '_menu_item_type', 'post_type'),
(248, 120, '_menu_item_menu_item_parent', '0'),
(249, 120, '_menu_item_object_id', '115'),
(250, 120, '_menu_item_object', 'page'),
(229, 118, '_menu_item_type', 'post_type'),
(880, 428, '_wp_attached_file', '2016/07/1907609_1439721159599367_732292459_n-1.jpg'),
(223, 115, '_edit_last', '1'),
(224, 115, '_edit_lock', '1595095782:1'),
(1094, 402, '_wp_attachment_image_alt', 'Сумская. После дождя'),
(1086, 422, '_wp_attachment_image_alt', 'Зимний лес'),
(1087, 418, '_wp_attachment_image_alt', 'Мыс'),
(1088, 417, '_wp_attachment_image_alt', 'Университетская улица'),
(1089, 416, '_wp_attachment_image_alt', 'У реки'),
(1090, 415, '_wp_attachment_image_alt', 'Берёзовая роща'),
(1091, 412, '_wp_attachment_image_alt', 'Сумерки над Сумской'),
(1092, 408, '_wp_attachment_image_alt', 'Перед закатом'),
(1093, 404, '_wp_attachment_image_alt', 'Парусник'),
(227, 115, '_wp_page_template', 'template-bio.php'),
(228, 115, '_easy_image_gallery_link_images', 'on'),
(845, 418, '_wp_attached_file', '2016/07/y_d30ac715.jpg'),
(846, 418, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:807;s:6:\"height\";i:605;s:4:\"file\";s:22:\"2016/07/y_d30ac715.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"y_d30ac715-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"y_d30ac715-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"y_d30ac715-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:22:\"y_d30ac715-400x300.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:22:\"y_d30ac715-600x450.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:450;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(802, 396, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:2288;s:6:\"height\";i:1564;s:4:\"file\";s:35:\"2016/07/P1010005-2288x1564-50ce.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:35:\"P1010005-2288x1564-50ce-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:35:\"P1010005-2288x1564-50ce-300x205.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:205;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:35:\"P1010005-2288x1564-50ce-768x525.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:525;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:36:\"P1010005-2288x1564-50ce-1024x700.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:700;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:35:\"P1010005-2288x1564-50ce-439x300.jpg\";s:5:\"width\";i:439;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:35:\"P1010005-2288x1564-50ce-600x410.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(801, 396, '_wp_attached_file', '2016/07/P1010005-2288x1564-50ce.jpg'),
(251, 120, '_menu_item_target', ''),
(252, 120, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(253, 120, '_menu_item_xfn', ''),
(254, 120, '_menu_item_url', ''),
(844, 417, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:800;s:6:\"height\";i:602;s:4:\"file\";s:22:\"2016/07/y_cdeb99df.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"y_cdeb99df-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"y_cdeb99df-300x226.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:226;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"y_cdeb99df-768x578.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:578;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:22:\"y_cdeb99df-399x300.jpg\";s:5:\"width\";i:399;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:22:\"y_cdeb99df-600x452.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:452;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(843, 417, '_wp_attached_file', '2016/07/y_cdeb99df.jpg'),
(21, 4, '_easy_image_gallery', '425,424,423,422,418,417,416,415,412,411,408,404,402,398,396,388,387,385,382,381,380,379,377,375,374,371,370,366,362,360,355,354,353,350,349,346,345,343,342,338,337,335,429,428,427'),
(22, 4, '_easy_image_gallery_link_images', 'on'),
(1080, 492, '_wp_attachment_image_alt', 'Сумская. Голубые сумерки'),
(1082, 429, '_wp_attachment_image_alt', 'Дорожка'),
(1083, 427, '_wp_attachment_image_alt', 'Богатыри'),
(1084, 424, '_wp_attachment_image_alt', 'Жемчужное утро'),
(1085, 423, '_wp_attachment_image_alt', 'Утро в лесу'),
(825, 408, '_wp_attached_file', '2016/07/y_10b1c5a9.jpg'),
(826, 408, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:640;s:6:\"height\";i:637;s:4:\"file\";s:22:\"2016/07/y_10b1c5a9.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"y_10b1c5a9-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"y_10b1c5a9-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:22:\"y_10b1c5a9-301x300.jpg\";s:5:\"width\";i:301;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:22:\"y_10b1c5a9-600x597.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:597;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(831, 411, '_wp_attached_file', '2016/07/y_832b953f.jpg'),
(832, 411, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:605;s:6:\"height\";i:807;s:4:\"file\";s:22:\"2016/07/y_832b953f.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"y_832b953f-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"y_832b953f-225x300.jpg\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:22:\"y_832b953f-225x300.jpg\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:22:\"y_832b953f-600x800.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:800;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(833, 412, '_wp_attached_file', '2016/07/y_537939be.jpg'),
(834, 412, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:800;s:6:\"height\";i:619;s:4:\"file\";s:22:\"2016/07/y_537939be.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"y_537939be-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"y_537939be-300x232.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:232;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"y_537939be-768x594.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:594;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:22:\"y_537939be-388x300.jpg\";s:5:\"width\";i:388;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:22:\"y_537939be-600x464.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:464;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(817, 404, '_wp_attached_file', '2016/07/y_05b512d7.jpg'),
(818, 404, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:807;s:6:\"height\";i:605;s:4:\"file\";s:22:\"2016/07/y_05b512d7.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"y_05b512d7-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"y_05b512d7-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"y_05b512d7-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:22:\"y_05b512d7-400x300.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:22:\"y_05b512d7-600x450.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:450;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(956, 465, '_easy_image_gallery', '429,428,424,418,411,408,404,396,382,385,381,380,379,377,375,374,371,370,366,349,346,345'),
(998, 475, '_menu_item_target', ''),
(953, 465, '_edit_last', '1'),
(943, 464, '_menu_item_type', 'post_type'),
(944, 464, '_menu_item_menu_item_parent', '0'),
(945, 464, '_menu_item_object_id', '459'),
(946, 464, '_menu_item_object', 'page'),
(947, 464, '_menu_item_target', ''),
(948, 464, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(949, 464, '_menu_item_xfn', ''),
(950, 464, '_menu_item_url', ''),
(954, 465, '_edit_lock', '1484060832:1'),
(955, 465, '_wp_page_template', 'template-gallery.php'),
(855, 423, '_wp_attached_file', '2016/07/PB293612.jpg'),
(856, 423, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1940;s:6:\"height\";i:1368;s:4:\"file\";s:20:\"2016/07/PB293612.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"PB293612-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"PB293612-300x212.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:212;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:20:\"PB293612-768x542.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:542;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:21:\"PB293612-1024x722.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:722;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:20:\"PB293612-425x300.jpg\";s:5:\"width\";i:425;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:20:\"PB293612-600x423.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:423;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"3.2\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:6:\"C765UZ\";s:7:\"caption\";s:22:\"OLYMPUS DIGITAL CAMERA\";s:17:\"created_timestamp\";s:10:\"1133272994\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:4:\"16.6\";s:3:\"iso\";s:2:\"64\";s:13:\"shutter_speed\";s:5:\"0.025\";s:5:\"title\";s:22:\"OLYMPUS DIGITAL CAMERA\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(857, 424, '_wp_attached_file', '2016/07/sfJ-cJHuaSw.jpg'),
(858, 424, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:850;s:6:\"height\";i:1024;s:4:\"file\";s:23:\"2016/07/sfJ-cJHuaSw.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"sfJ-cJHuaSw-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"sfJ-cJHuaSw-249x300.jpg\";s:5:\"width\";i:249;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:23:\"sfJ-cJHuaSw-768x925.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:925;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:24:\"sfJ-cJHuaSw-850x1024.jpg\";s:5:\"width\";i:850;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:23:\"sfJ-cJHuaSw-249x300.jpg\";s:5:\"width\";i:249;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:23:\"sfJ-cJHuaSw-600x723.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:723;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(853, 422, '_wp_attached_file', '2016/07/QVqZCOjPz04-1.jpg'),
(854, 422, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1280;s:6:\"height\";i:919;s:4:\"file\";s:25:\"2016/07/QVqZCOjPz04-1.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"QVqZCOjPz04-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:25:\"QVqZCOjPz04-1-300x215.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:215;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:25:\"QVqZCOjPz04-1-768x551.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:551;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:26:\"QVqZCOjPz04-1-1024x735.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:735;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:25:\"QVqZCOjPz04-1-418x300.jpg\";s:5:\"width\";i:418;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:25:\"QVqZCOjPz04-1-600x431.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:431;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(813, 402, '_wp_attached_file', '2016/07/QjK8CCIHZMM.jpg'),
(814, 402, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1280;s:6:\"height\";i:878;s:4:\"file\";s:23:\"2016/07/QjK8CCIHZMM.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"QjK8CCIHZMM-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"QjK8CCIHZMM-300x206.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:206;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:23:\"QjK8CCIHZMM-768x527.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:527;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:24:\"QjK8CCIHZMM-1024x702.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:702;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:23:\"QjK8CCIHZMM-437x300.jpg\";s:5:\"width\";i:437;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:23:\"QjK8CCIHZMM-600x412.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:412;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1037, 490, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:27:\"2017/01/cropped-index-1.jpg\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:27:\"cropped-index-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:27:\"cropped-index-1-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:27:\"cropped-index-1-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"site_icon-270\";a:4:{s:4:\"file\";s:27:\"cropped-index-1-270x270.jpg\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"site_icon-192\";a:4:{s:4:\"file\";s:27:\"cropped-index-1-192x192.jpg\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"site_icon-180\";a:4:{s:4:\"file\";s:27:\"cropped-index-1-180x180.jpg\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"site_icon-32\";a:4:{s:4:\"file\";s:25:\"cropped-index-1-32x32.jpg\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1036, 490, '_wp_attachment_context', 'site-icon'),
(997, 475, '_menu_item_object', 'page'),
(996, 475, '_menu_item_object_id', '473'),
(995, 475, '_menu_item_menu_item_parent', '0'),
(994, 475, '_menu_item_type', 'post_type'),
(993, 473, '_easy_image_gallery_link_images', 'on'),
(992, 473, '_easy_image_gallery', '425,417,412,402,388,387,360,492,425'),
(783, 387, '_wp_attached_file', '2016/07/iMm4Ib4c0Xo.jpg'),
(784, 387, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1280;s:6:\"height\";i:865;s:4:\"file\";s:23:\"2016/07/iMm4Ib4c0Xo.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"iMm4Ib4c0Xo-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"iMm4Ib4c0Xo-300x203.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:203;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:23:\"iMm4Ib4c0Xo-768x519.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:519;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:24:\"iMm4Ib4c0Xo-1024x692.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:692;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:23:\"iMm4Ib4c0Xo-444x300.jpg\";s:5:\"width\";i:444;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:23:\"iMm4Ib4c0Xo-600x405.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:405;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(785, 388, '_wp_attached_file', '2016/07/JMXYA-8eG3c.jpg'),
(786, 388, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1280;s:6:\"height\";i:960;s:4:\"file\";s:23:\"2016/07/JMXYA-8eG3c.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"JMXYA-8eG3c-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"JMXYA-8eG3c-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:23:\"JMXYA-8eG3c-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:24:\"JMXYA-8eG3c-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:23:\"JMXYA-8eG3c-400x300.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:23:\"JMXYA-8eG3c-600x450.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:450;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(751, 371, '_wp_attached_file', '2016/07/106384070_large_3623822_vr02.jpg'),
(752, 371, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:601;s:6:\"height\";i:451;s:4:\"file\";s:40:\"2016/07/106384070_large_3623822_vr02.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:40:\"106384070_large_3623822_vr02-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:40:\"106384070_large_3623822_vr02-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:40:\"106384070_large_3623822_vr02-400x300.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:40:\"106384070_large_3623822_vr02-600x450.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:450;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(928, 459, '_easy_image_gallery_link_images', 'on'),
(911, 456, '_edit_last', '1'),
(912, 456, '_edit_lock', '1587068058:1'),
(913, 456, '_wp_page_template', 'template-contact.php'),
(914, 456, '_easy_image_gallery_link_images', 'on'),
(915, 458, '_menu_item_type', 'post_type'),
(916, 458, '_menu_item_menu_item_parent', '0'),
(917, 458, '_menu_item_object_id', '456'),
(918, 458, '_menu_item_object', 'page'),
(919, 458, '_menu_item_target', ''),
(920, 458, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(921, 458, '_menu_item_xfn', ''),
(922, 458, '_menu_item_url', ''),
(924, 459, '_edit_last', '1'),
(925, 459, '_edit_lock', '1484604989:1'),
(926, 459, '_wp_page_template', 'template-gallery.php'),
(927, 459, '_easy_image_gallery', '423,416,415,398,342,354,338,350,337'),
(757, 374, '_wp_attached_file', '2016/07/106384074_large_3623822_rv55.jpg'),
(758, 374, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:640;s:6:\"height\";i:404;s:4:\"file\";s:40:\"2016/07/106384074_large_3623822_rv55.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:40:\"106384074_large_3623822_rv55-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:40:\"106384074_large_3623822_rv55-300x189.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:189;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:40:\"106384074_large_3623822_rv55-475x300.jpg\";s:5:\"width\";i:475;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:40:\"106384074_large_3623822_rv55-600x379.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:379;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(759, 375, '_wp_attached_file', '2016/07/106384075_large_3623822_vr10a.jpg'),
(760, 375, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:695;s:6:\"height\";i:464;s:4:\"file\";s:41:\"2016/07/106384075_large_3623822_vr10a.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:41:\"106384075_large_3623822_vr10a-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:41:\"106384075_large_3623822_vr10a-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:41:\"106384075_large_3623822_vr10a-449x300.jpg\";s:5:\"width\";i:449;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:41:\"106384075_large_3623822_vr10a-600x401.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:401;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(1040, 492, '_wp_attached_file', '2017/01/10442990_1472933146278168_5526490817407186089_n.jpg'),
(1041, 492, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:960;s:6:\"height\";i:889;s:4:\"file\";s:59:\"2017/01/10442990_1472933146278168_5526490817407186089_n.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:59:\"10442990_1472933146278168_5526490817407186089_n-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:59:\"10442990_1472933146278168_5526490817407186089_n-300x278.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:278;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:59:\"10442990_1472933146278168_5526490817407186089_n-768x711.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:711;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:59:\"10442990_1472933146278168_5526490817407186089_n-864x800.jpg\";s:5:\"width\";i:864;s:6:\"height\";i:800;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:59:\"10442990_1472933146278168_5526490817407186089_n-324x300.jpg\";s:5:\"width\";i:324;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:59:\"10442990_1472933146278168_5526490817407186089_n-600x556.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:556;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(763, 377, '_wp_attached_file', '2016/07/106384077_large_3623822_vr6a.jpg'),
(764, 377, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:699;s:6:\"height\";i:506;s:4:\"file\";s:40:\"2016/07/106384077_large_3623822_vr6a.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:40:\"106384077_large_3623822_vr6a-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:40:\"106384077_large_3623822_vr6a-300x217.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:217;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:40:\"106384077_large_3623822_vr6a-414x300.jpg\";s:5:\"width\";i:414;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:40:\"106384077_large_3623822_vr6a-600x434.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:434;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(767, 379, '_wp_attached_file', '2016/07/106384079_large_3623822_vr7a.jpg'),
(768, 379, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:699;s:6:\"height\";i:503;s:4:\"file\";s:40:\"2016/07/106384079_large_3623822_vr7a.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:40:\"106384079_large_3623822_vr7a-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:40:\"106384079_large_3623822_vr7a-300x216.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:216;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:40:\"106384079_large_3623822_vr7a-417x300.jpg\";s:5:\"width\";i:417;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:40:\"106384079_large_3623822_vr7a-600x432.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(769, 380, '_wp_attached_file', '2016/07/106384080_large_3623822_vr8a.jpg'),
(770, 380, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:699;s:6:\"height\";i:497;s:4:\"file\";s:40:\"2016/07/106384080_large_3623822_vr8a.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:40:\"106384080_large_3623822_vr8a-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:40:\"106384080_large_3623822_vr8a-300x213.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:213;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:40:\"106384080_large_3623822_vr8a-422x300.jpg\";s:5:\"width\";i:422;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:40:\"106384080_large_3623822_vr8a-600x427.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:427;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(771, 381, '_wp_attached_file', '2016/07/106384081_large_3623822_vr9a.jpg'),
(772, 381, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:699;s:6:\"height\";i:563;s:4:\"file\";s:40:\"2016/07/106384081_large_3623822_vr9a.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:40:\"106384081_large_3623822_vr9a-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:40:\"106384081_large_3623822_vr9a-300x242.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:242;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:40:\"106384081_large_3623822_vr9a-372x300.jpg\";s:5:\"width\";i:372;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:40:\"106384081_large_3623822_vr9a-600x483.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:483;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(773, 382, '_wp_attached_file', '2016/07/106384082_large_3623822_vr14a.jpg'),
(774, 382, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:700;s:6:\"height\";i:505;s:4:\"file\";s:41:\"2016/07/106384082_large_3623822_vr14a.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:41:\"106384082_large_3623822_vr14a-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:41:\"106384082_large_3623822_vr14a-300x216.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:216;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:41:\"106384082_large_3623822_vr14a-416x300.jpg\";s:5:\"width\";i:416;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:41:\"106384082_large_3623822_vr14a-600x433.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:433;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1113, 510, '_menu_item_type', 'post_type'),
(1114, 510, '_menu_item_menu_item_parent', '0'),
(1115, 510, '_menu_item_object_id', '507'),
(1116, 510, '_menu_item_object', 'page'),
(1117, 510, '_menu_item_target', ''),
(1118, 510, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1119, 510, '_menu_item_xfn', ''),
(1120, 510, '_menu_item_url', ''),
(749, 370, '_wp_attached_file', '2016/07/106384068_large_3623822_vr01.jpg'),
(750, 370, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:618;s:6:\"height\";i:462;s:4:\"file\";s:40:\"2016/07/106384068_large_3623822_vr01.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:40:\"106384068_large_3623822_vr01-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:40:\"106384068_large_3623822_vr01-300x224.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:224;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:40:\"106384068_large_3623822_vr01-401x300.jpg\";s:5:\"width\";i:401;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:40:\"106384068_large_3623822_vr01-600x449.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:449;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(884, 337, '_wp_attachment_image_alt', 'Зимняя мозаика'),
(885, 335, '_wp_attachment_image_alt', 'Утренняя свежесть'),
(886, 425, '_wp_attachment_image_alt', 'Сумерки. Сумская'),
(887, 429, '_wp_attached_file', '2016/07/249106_1383720895199394_448409785_n.jpg'),
(888, 429, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:960;s:6:\"height\";i:718;s:4:\"file\";s:47:\"2016/07/249106_1383720895199394_448409785_n.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:47:\"249106_1383720895199394_448409785_n-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:47:\"249106_1383720895199394_448409785_n-300x224.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:224;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:47:\"249106_1383720895199394_448409785_n-768x574.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:574;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:47:\"249106_1383720895199394_448409785_n-401x300.jpg\";s:5:\"width\";i:401;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:47:\"249106_1383720895199394_448409785_n-600x449.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:449;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(889, 430, '_wp_attached_file', '2016/07/y_ce65c59c.jpg'),
(890, 430, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:752;s:6:\"height\";i:643;s:4:\"file\";s:22:\"2016/07/y_ce65c59c.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"y_ce65c59c-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"y_ce65c59c-300x257.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:257;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:22:\"y_ce65c59c-351x300.jpg\";s:5:\"width\";i:351;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:22:\"y_ce65c59c-600x513.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:513;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(892, 115, '_oembed_630d69fbe1bff8d67f22602c91beeb75', '{{unknown}}'),
(907, 115, '_thumbnail_id', '430'),
(729, 360, '_wp_attached_file', '2016/07/10442990_1472933146278168_5526490817407186089_n.jpg'),
(730, 360, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:960;s:6:\"height\";i:889;s:4:\"file\";s:59:\"2016/07/10442990_1472933146278168_5526490817407186089_n.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:59:\"10442990_1472933146278168_5526490817407186089_n-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:59:\"10442990_1472933146278168_5526490817407186089_n-300x278.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:278;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:59:\"10442990_1472933146278168_5526490817407186089_n-768x711.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:711;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:59:\"10442990_1472933146278168_5526490817407186089_n-324x300.jpg\";s:5:\"width\";i:324;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:59:\"10442990_1472933146278168_5526490817407186089_n-600x556.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:556;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(733, 362, '_wp_attached_file', '2016/07/10802054_1534676230103859_476623033233335784_n.jpg'),
(734, 362, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:749;s:6:\"height\";i:960;s:4:\"file\";s:58:\"2016/07/10802054_1534676230103859_476623033233335784_n.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:58:\"10802054_1534676230103859_476623033233335784_n-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:58:\"10802054_1534676230103859_476623033233335784_n-234x300.jpg\";s:5:\"width\";i:234;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:58:\"10802054_1534676230103859_476623033233335784_n-234x300.jpg\";s:5:\"width\";i:234;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:58:\"10802054_1534676230103859_476623033233335784_n-600x769.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:769;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(741, 366, '_wp_attached_file', '2016/07/10960072_1561425624095586_8082160125660468859_o.jpg'),
(742, 366, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:791;s:6:\"height\";i:960;s:4:\"file\";s:59:\"2016/07/10960072_1561425624095586_8082160125660468859_o.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:59:\"10960072_1561425624095586_8082160125660468859_o-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:59:\"10960072_1561425624095586_8082160125660468859_o-247x300.jpg\";s:5:\"width\";i:247;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:59:\"10960072_1561425624095586_8082160125660468859_o-768x932.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:932;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:59:\"10960072_1561425624095586_8082160125660468859_o-247x300.jpg\";s:5:\"width\";i:247;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:59:\"10960072_1561425624095586_8082160125660468859_o-600x728.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:728;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1098, 385, '_wp_attachment_image_alt', 'Берег'),
(1099, 382, '_wp_attachment_image_alt', 'Море. Закат'),
(1100, 374, '_wp_attachment_image_alt', 'Шторм'),
(1101, 371, '_wp_attachment_image_alt', 'Камни'),
(1102, 370, '_wp_attachment_image_alt', 'Закат'),
(1103, 366, '_wp_attachment_image_alt', 'Утро'),
(1108, 338, '_wp_attachment_image_alt', 'Деревенская тема'),
(977, 470, '_menu_item_object_id', '465'),
(978, 470, '_menu_item_object', 'page'),
(979, 470, '_menu_item_target', ''),
(980, 470, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(981, 470, '_menu_item_xfn', ''),
(982, 470, '_menu_item_url', ''),
(999, 475, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1000, 475, '_menu_item_xfn', ''),
(1001, 475, '_menu_item_url', ''),
(1003, 476, '_menu_item_type', 'post_type'),
(1004, 476, '_menu_item_menu_item_parent', '0'),
(1005, 476, '_menu_item_object_id', '471'),
(1006, 476, '_menu_item_object', 'page'),
(1007, 476, '_menu_item_target', ''),
(1008, 476, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1009, 476, '_menu_item_xfn', ''),
(1010, 476, '_menu_item_url', ''),
(1012, 1, '_wp_old_slug', '%d0%bf%d1%80%d0%b8%d0%b2%d0%b5%d1%82-%d0%bc%d0%b8%d1%80'),
(1013, 4, '_wp_old_slug', '%d0%b3%d0%bb%d0%b0%d0%b2%d0%bd%d0%b0%d1%8f'),
(1014, 115, '_wp_old_slug', '%d0%be%d0%b1-%d0%b0%d0%b2%d1%82%d0%be%d1%80%d0%b5'),
(1015, 456, '_wp_old_slug', '%d0%ba%d0%be%d0%bd%d1%82%d0%b0%d0%ba%d1%82%d1%8b'),
(1016, 459, '_wp_old_slug', '%d0%bf%d0%b5%d0%b9%d0%b7%d0%b0%d0%b6'),
(1017, 473, '_wp_old_slug', '%d0%b3%d0%be%d1%80%d0%be%d0%b4%d1%81%d0%ba%d0%be%d0%b9-%d0%bf%d0%b5%d0%b9%d0%b7%d0%b0%d0%b6'),
(1018, 465, '_wp_old_slug', '%d0%bc%d0%be%d1%80%d1%81%d0%ba%d0%be%d0%b9-%d0%bf%d0%b5%d0%b9%d0%b7%d0%b0%d0%b6'),
(1019, 467, '_wp_old_slug', '%d0%bf%d0%be%d1%80%d1%82%d1%80%d0%b5%d1%82'),
(1020, 471, '_wp_old_slug', '%d0%bd%d0%b0%d1%82%d1%8e%d1%80%d0%bc%d0%be%d1%80%d1%82'),
(1021, 477, '_edit_last', '1'),
(1022, 477, '_edit_lock', '1467836737:1'),
(1023, 477, '_wp_page_template', 'default'),
(1024, 477, '_easy_image_gallery_link_images', 'on'),
(1025, 481, '_edit_last', '1'),
(1026, 481, '_edit_lock', '1484062623:1'),
(1027, 481, '_wp_page_template', 'template-order.php'),
(1028, 481, '_easy_image_gallery_link_images', 'on'),
(1029, 483, '_edit_last', '1'),
(1030, 483, '_edit_lock', '1484604766:1'),
(1031, 483, '_wp_page_template', 'user_list.php'),
(1032, 483, '_easy_image_gallery_link_images', 'on'),
(679, 335, '_wp_attached_file', '2016/07/1460012_1404833479754802_178694986_n.jpg'),
(680, 335, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:960;s:6:\"height\";i:795;s:4:\"file\";s:48:\"2016/07/1460012_1404833479754802_178694986_n.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:48:\"1460012_1404833479754802_178694986_n-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:48:\"1460012_1404833479754802_178694986_n-300x248.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:248;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:48:\"1460012_1404833479754802_178694986_n-768x636.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:636;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:48:\"1460012_1404833479754802_178694986_n-362x300.jpg\";s:5:\"width\";i:362;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:48:\"1460012_1404833479754802_178694986_n-600x497.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:497;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(975, 470, '_menu_item_type', 'post_type'),
(976, 470, '_menu_item_menu_item_parent', '0'),
(957, 465, '_easy_image_gallery_link_images', 'on'),
(1035, 490, '_wp_attached_file', '2017/01/cropped-index-1.jpg'),
(961, 467, '_edit_last', '1'),
(962, 467, '_edit_lock', '1587050378:1'),
(963, 467, '_wp_page_template', 'template-gallery.php'),
(964, 467, '_easy_image_gallery', '427,353'),
(965, 467, '_easy_image_gallery_link_images', 'on'),
(991, 473, '_wp_page_template', 'template-gallery.php'),
(990, 473, '_edit_lock', '1586895974:1'),
(989, 473, '_edit_last', '1'),
(988, 471, '_easy_image_gallery_link_images', 'on'),
(987, 471, '_easy_image_gallery', '362,343,355,335,567,568,569,570,571,572'),
(986, 471, '_wp_page_template', 'template-gallery.php'),
(984, 471, '_edit_last', '1'),
(985, 471, '_edit_lock', '1589381304:1'),
(683, 337, '_wp_attached_file', '2016/07/1551542_1413990135505803_1681945524_n.jpg');
INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(684, 337, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:960;s:6:\"height\";i:575;s:4:\"file\";s:49:\"2016/07/1551542_1413990135505803_1681945524_n.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:49:\"1551542_1413990135505803_1681945524_n-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:49:\"1551542_1413990135505803_1681945524_n-300x180.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:180;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:49:\"1551542_1413990135505803_1681945524_n-768x460.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:460;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:49:\"1551542_1413990135505803_1681945524_n-501x300.jpg\";s:5:\"width\";i:501;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:49:\"1551542_1413990135505803_1681945524_n-600x359.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:359;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(685, 338, '_wp_attached_file', '2016/07/1901644_1519948384909977_4200962525795842063_n.jpg'),
(686, 338, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:960;s:6:\"height\";i:628;s:4:\"file\";s:58:\"2016/07/1901644_1519948384909977_4200962525795842063_n.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:58:\"1901644_1519948384909977_4200962525795842063_n-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:58:\"1901644_1519948384909977_4200962525795842063_n-300x196.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:196;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:58:\"1901644_1519948384909977_4200962525795842063_n-768x502.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:502;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:58:\"1901644_1519948384909977_4200962525795842063_n-459x300.jpg\";s:5:\"width\";i:459;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:58:\"1901644_1519948384909977_4200962525795842063_n-600x393.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:393;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1095, 398, '_wp_attachment_image_alt', 'Осенняя тропинка'),
(1096, 396, '_wp_attachment_image_alt', 'Паруса'),
(1097, 387, '_wp_attachment_image_alt', 'Сумская. Вечерние огни'),
(881, 428, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:800;s:6:\"height\";i:569;s:4:\"file\";s:50:\"2016/07/1907609_1439721159599367_732292459_n-1.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:50:\"1907609_1439721159599367_732292459_n-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:50:\"1907609_1439721159599367_732292459_n-1-300x213.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:213;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:50:\"1907609_1439721159599367_732292459_n-1-768x546.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:546;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:50:\"1907609_1439721159599367_732292459_n-1-422x300.jpg\";s:5:\"width\";i:422;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:50:\"1907609_1439721159599367_732292459_n-1-600x427.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:427;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(861, 350, '_edit_lock', '1467728340:1'),
(862, 362, '_wp_attachment_image_alt', 'Літня мозаїка'),
(863, 354, '_wp_attachment_image_alt', 'Кот на берегу'),
(864, 350, '_wp_attachment_image_alt', 'Утренние берёзы'),
(865, 388, '_wp_attachment_image_alt', 'Городские сумерки'),
(866, 353, '_wp_attachment_image_alt', 'Макар'),
(867, 381, '_wp_attachment_image_alt', 'По Карелии'),
(868, 411, '_wp_attachment_image_alt', 'Над бездной моря...'),
(869, 355, '_wp_attachment_image_alt', 'Ирисы'),
(870, 380, '_wp_attachment_image_alt', 'Серебристый день'),
(871, 379, '_wp_attachment_image_alt', 'Вечер на Осколе'),
(872, 346, '_wp_attachment_image_alt', 'Простор'),
(873, 377, '_wp_attachment_image_alt', 'Розовое утро'),
(874, 349, '_wp_attachment_image_alt', 'Камни. Мыс Ильи'),
(875, 342, '_wp_attachment_image_alt', 'Весна'),
(876, 427, '_wp_attached_file', '2016/07/y_ce85ad7a.jpg'),
(877, 427, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:807;s:6:\"height\";i:476;s:4:\"file\";s:22:\"2016/07/y_ce85ad7a.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"y_ce85ad7a-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"y_ce85ad7a-300x177.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:177;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"y_ce85ad7a-768x453.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:453;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:22:\"y_ce85ad7a-509x300.jpg\";s:5:\"width\";i:509;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:22:\"y_ce85ad7a-600x354.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:354;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(878, 343, '_wp_attachment_image_alt', 'Колокольчики-ромашки'),
(879, 345, '_wp_attachment_image_alt', 'Вечер. Чайки'),
(693, 342, '_wp_attached_file', '2016/07/10002910_1445386735699476_4507018574414674822_n.jpg'),
(694, 342, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:960;s:6:\"height\";i:718;s:4:\"file\";s:59:\"2016/07/10002910_1445386735699476_4507018574414674822_n.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:59:\"10002910_1445386735699476_4507018574414674822_n-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:59:\"10002910_1445386735699476_4507018574414674822_n-300x224.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:224;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:59:\"10002910_1445386735699476_4507018574414674822_n-768x574.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:574;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:59:\"10002910_1445386735699476_4507018574414674822_n-401x300.jpg\";s:5:\"width\";i:401;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:59:\"10002910_1445386735699476_4507018574414674822_n-600x449.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:449;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(695, 343, '_wp_attached_file', '2016/07/10151426_1444753772429439_71413574352553804_n.jpg'),
(696, 343, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:800;s:6:\"height\";i:661;s:4:\"file\";s:57:\"2016/07/10151426_1444753772429439_71413574352553804_n.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:57:\"10151426_1444753772429439_71413574352553804_n-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:57:\"10151426_1444753772429439_71413574352553804_n-300x248.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:248;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:57:\"10151426_1444753772429439_71413574352553804_n-768x635.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:635;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:57:\"10151426_1444753772429439_71413574352553804_n-363x300.jpg\";s:5:\"width\";i:363;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:57:\"10151426_1444753772429439_71413574352553804_n-600x496.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:496;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(883, 375, '_wp_attachment_image_alt', 'Берег. Коктебель'),
(882, 428, '_wp_attachment_image_alt', 'Фиолент'),
(699, 345, '_wp_attached_file', '2016/07/10154298_1439796539591829_254048403_n.jpg'),
(700, 345, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:800;s:6:\"height\";i:610;s:4:\"file\";s:49:\"2016/07/10154298_1439796539591829_254048403_n.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:49:\"10154298_1439796539591829_254048403_n-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:49:\"10154298_1439796539591829_254048403_n-300x229.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:229;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:49:\"10154298_1439796539591829_254048403_n-768x586.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:586;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:49:\"10154298_1439796539591829_254048403_n-393x300.jpg\";s:5:\"width\";i:393;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:49:\"10154298_1439796539591829_254048403_n-600x458.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:458;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(701, 346, '_wp_attached_file', '2016/07/10154926_1447604955477654_6732011238071184111_n.jpg'),
(702, 346, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:960;s:6:\"height\";i:667;s:4:\"file\";s:59:\"2016/07/10154926_1447604955477654_6732011238071184111_n.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:59:\"10154926_1447604955477654_6732011238071184111_n-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:59:\"10154926_1447604955477654_6732011238071184111_n-300x208.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:208;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:59:\"10154926_1447604955477654_6732011238071184111_n-768x534.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:534;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:59:\"10154926_1447604955477654_6732011238071184111_n-432x300.jpg\";s:5:\"width\";i:432;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:59:\"10154926_1447604955477654_6732011238071184111_n-600x417.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:417;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(707, 349, '_wp_attached_file', '2016/07/10290601_1445947255643424_5265523390944141244_n.jpg'),
(708, 349, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:960;s:6:\"height\";i:682;s:4:\"file\";s:59:\"2016/07/10290601_1445947255643424_5265523390944141244_n.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:59:\"10290601_1445947255643424_5265523390944141244_n-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:59:\"10290601_1445947255643424_5265523390944141244_n-300x213.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:213;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:59:\"10290601_1445947255643424_5265523390944141244_n-768x546.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:546;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:59:\"10290601_1445947255643424_5265523390944141244_n-422x300.jpg\";s:5:\"width\";i:422;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:59:\"10290601_1445947255643424_5265523390944141244_n-600x426.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:426;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(709, 350, '_wp_attached_file', '2016/07/10311097_1523978941173588_110585530880077935_n.jpg'),
(710, 350, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:960;s:6:\"height\";i:631;s:4:\"file\";s:58:\"2016/07/10311097_1523978941173588_110585530880077935_n.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:58:\"10311097_1523978941173588_110585530880077935_n-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:58:\"10311097_1523978941173588_110585530880077935_n-300x197.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:197;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:58:\"10311097_1523978941173588_110585530880077935_n-768x505.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:505;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:58:\"10311097_1523978941173588_110585530880077935_n-456x300.jpg\";s:5:\"width\";i:456;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:58:\"10311097_1523978941173588_110585530880077935_n-600x394.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:394;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(715, 353, '_wp_attached_file', '2016/07/10338449_1470509593187190_4441822572503007124_o.jpg'),
(716, 353, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:710;s:6:\"height\";i:960;s:4:\"file\";s:59:\"2016/07/10338449_1470509593187190_4441822572503007124_o.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:59:\"10338449_1470509593187190_4441822572503007124_o-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:59:\"10338449_1470509593187190_4441822572503007124_o-222x300.jpg\";s:5:\"width\";i:222;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:59:\"10338449_1470509593187190_4441822572503007124_o-222x300.jpg\";s:5:\"width\";i:222;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:59:\"10338449_1470509593187190_4441822572503007124_o-600x811.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:811;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(717, 354, '_wp_attached_file', '2016/07/10375496_1523978947840254_2010400255303941574_n.jpg'),
(718, 354, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:960;s:6:\"height\";i:657;s:4:\"file\";s:59:\"2016/07/10375496_1523978947840254_2010400255303941574_n.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:59:\"10375496_1523978947840254_2010400255303941574_n-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:59:\"10375496_1523978947840254_2010400255303941574_n-300x205.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:205;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:59:\"10375496_1523978947840254_2010400255303941574_n-768x526.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:526;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:59:\"10375496_1523978947840254_2010400255303941574_n-438x300.jpg\";s:5:\"width\";i:438;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:59:\"10375496_1523978947840254_2010400255303941574_n-600x411.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:411;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(719, 355, '_wp_attached_file', '2016/07/10376141_1460532724184877_8131905327791330491_n.jpg'),
(720, 355, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:800;s:6:\"height\";i:557;s:4:\"file\";s:59:\"2016/07/10376141_1460532724184877_8131905327791330491_n.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:59:\"10376141_1460532724184877_8131905327791330491_n-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:59:\"10376141_1460532724184877_8131905327791330491_n-300x209.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:209;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:59:\"10376141_1460532724184877_8131905327791330491_n-768x535.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:535;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:59:\"10376141_1460532724184877_8131905327791330491_n-431x300.jpg\";s:5:\"width\";i:431;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:59:\"10376141_1460532724184877_8131905327791330491_n-600x418.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:418;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1109, 507, '_edit_last', '1'),
(1110, 507, '_edit_lock', '1490388952:1'),
(1111, 507, '_wp_page_template', 'template-bio.php'),
(1112, 507, '_easy_image_gallery_link_images', 'on'),
(805, 398, '_wp_attached_file', '2016/07/P1010006-1987x1549-c8f2.jpg'),
(806, 398, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1987;s:6:\"height\";i:1549;s:4:\"file\";s:35:\"2016/07/P1010006-1987x1549-c8f2.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:35:\"P1010006-1987x1549-c8f2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:35:\"P1010006-1987x1549-c8f2-300x234.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:234;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:35:\"P1010006-1987x1549-c8f2-768x599.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:599;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:36:\"P1010006-1987x1549-c8f2-1024x798.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:798;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:35:\"P1010006-1987x1549-c8f2-385x300.jpg\";s:5:\"width\";i:385;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:35:\"P1010006-1987x1549-c8f2-600x468.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:468;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(779, 385, '_wp_attached_file', '2016/07/106384086_large_3623822_vr15a.jpg'),
(780, 385, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:700;s:6:\"height\";i:458;s:4:\"file\";s:41:\"2016/07/106384086_large_3623822_vr15a.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:41:\"106384086_large_3623822_vr15a-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:41:\"106384086_large_3623822_vr15a-300x196.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:196;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:41:\"106384086_large_3623822_vr15a-459x300.jpg\";s:5:\"width\";i:459;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:41:\"106384086_large_3623822_vr15a-600x393.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:393;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(256, 1, '_edit_lock', '1467712820:1'),
(839, 415, '_wp_attached_file', '2016/07/y_be20c792.jpg'),
(840, 415, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:800;s:6:\"height\";i:591;s:4:\"file\";s:22:\"2016/07/y_be20c792.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"y_be20c792-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"y_be20c792-300x222.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:222;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"y_be20c792-768x567.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:567;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:22:\"y_be20c792-406x300.jpg\";s:5:\"width\";i:406;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:22:\"y_be20c792-600x443.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:443;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(841, 416, '_wp_attached_file', '2016/07/y_c8504ded.jpg'),
(842, 416, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:800;s:6:\"height\";i:549;s:4:\"file\";s:22:\"2016/07/y_c8504ded.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"y_c8504ded-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"y_c8504ded-300x206.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:206;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"y_c8504ded-768x527.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:527;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:22:\"y_c8504ded-437x300.jpg\";s:5:\"width\";i:437;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:22:\"y_c8504ded-600x412.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:412;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(859, 425, '_wp_attached_file', '2016/07/SYoXRyJVnjk.jpg'),
(860, 425, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1280;s:6:\"height\";i:862;s:4:\"file\";s:23:\"2016/07/SYoXRyJVnjk.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"SYoXRyJVnjk-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"SYoXRyJVnjk-300x202.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:202;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:23:\"SYoXRyJVnjk-768x517.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:517;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:24:\"SYoXRyJVnjk-1024x690.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:690;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:23:\"SYoXRyJVnjk-445x300.jpg\";s:5:\"width\";i:445;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:23:\"SYoXRyJVnjk-600x404.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:404;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1122, 513, '_wp_attached_file', '2017/01/paint.png'),
(1123, 513, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:16;s:6:\"height\";i:16;s:4:\"file\";s:17:\"2017/01/paint.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1124, 514, '_wp_attached_file', '2017/01/cropped-paint.png'),
(1125, 514, '_wp_attachment_context', 'site-icon'),
(1126, 514, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:25:\"2017/01/cropped-paint.png\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"cropped-paint-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:25:\"cropped-paint-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:25:\"cropped-paint-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-270\";a:4:{s:4:\"file\";s:25:\"cropped-paint-270x270.png\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-192\";a:4:{s:4:\"file\";s:25:\"cropped-paint-192x192.png\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-180\";a:4:{s:4:\"file\";s:25:\"cropped-paint-180x180.png\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"site_icon-32\";a:4:{s:4:\"file\";s:23:\"cropped-paint-32x32.png\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1150, 528, '_edit_last', '1'),
(1149, 522, '_tml_action', 'resetpass'),
(1148, 521, '_tml_action', 'lostpassword'),
(1147, 520, '_tml_action', 'register'),
(1146, 519, '_tml_action', 'logout'),
(1145, 518, '_tml_action', 'login'),
(1164, 533, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1163, 533, '_menu_item_target', ''),
(1162, 533, '_menu_item_object', 'category'),
(1161, 533, '_menu_item_object_id', '3'),
(1160, 533, '_menu_item_menu_item_parent', '0'),
(1159, 533, '_menu_item_type', 'taxonomy'),
(1151, 528, '_edit_lock', '1491249533:1'),
(1152, 528, '_wp_page_template', 'template-frame.php'),
(1153, 528, '_easy_image_gallery_link_images', 'on'),
(1154, 531, '_edit_last', '1'),
(1155, 531, '_edit_lock', '1586809358:1'),
(1166, 533, '_menu_item_url', ''),
(1165, 533, '_menu_item_xfn', ''),
(1158, 531, '_easy_image_gallery_link_images', 'on'),
(1200, 548, '_wp_attachment_image_alt', '1'),
(1201, 549, '_edit_lock', '1587049698:1'),
(1202, 549, '_wp_page_template', 'template-gallery.php'),
(1203, 549, '_edit_last', '1'),
(1204, 549, '_easy_image_gallery', '430,427,353,489'),
(1205, 549, '_easy_image_gallery_link_images', 'on'),
(1222, 561, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:607;s:6:\"height\";i:960;s:4:\"file\";s:58:\"2020/04/40460766_163610361193974_8597909637599068160_n.jpg\";s:5:\"sizes\";a:5:{s:6:\"medium\";a:4:{s:4:\"file\";s:58:\"40460766_163610361193974_8597909637599068160_n-190x300.jpg\";s:5:\"width\";i:190;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:58:\"40460766_163610361193974_8597909637599068160_n-506x800.jpg\";s:5:\"width\";i:506;s:6:\"height\";i:800;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:58:\"40460766_163610361193974_8597909637599068160_n-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:58:\"40460766_163610361193974_8597909637599068160_n-190x300.jpg\";s:5:\"width\";i:190;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:58:\"40460766_163610361193974_8597909637599068160_n-600x949.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:949;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1216, 555, '_edit_lock', '1588194670:1'),
(1221, 561, '_wp_attached_file', '2020/04/40460766_163610361193974_8597909637599068160_n.jpg'),
(1219, 555, '_edit_last', '1'),
(1220, 555, '_easy_image_gallery_link_images', 'on'),
(1185, 544, '_edit_lock', '1586972288:1'),
(1198, 548, '_wp_attached_file', '2020/04/36652582_136900390531638_7590388753240162304_n.jpg'),
(1188, 544, '_oembed_09c7c05288bb5c50b638a3949fe2e128', '<iframe title=\"В ХАРЬКОВЕ ОТКРЫЛАСЬ ВЫСТАВКА КАРТИН &quot;ТАИНСТВО СВЕТА&quot;\" width=\"500\" height=\"281\" src=\"https://www.youtube.com/embed/dI2QZwiUosE?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(1189, 544, '_oembed_time_09c7c05288bb5c50b638a3949fe2e128', '1586809887'),
(1190, 544, '_edit_last', '1'),
(1191, 544, '_easy_image_gallery_link_images', 'on'),
(1199, 548, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:960;s:6:\"height\";i:696;s:4:\"file\";s:58:\"2020/04/36652582_136900390531638_7590388753240162304_n.jpg\";s:5:\"sizes\";a:5:{s:6:\"medium\";a:4:{s:4:\"file\";s:58:\"36652582_136900390531638_7590388753240162304_n-300x218.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:218;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:58:\"36652582_136900390531638_7590388753240162304_n-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:58:\"36652582_136900390531638_7590388753240162304_n-768x557.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:557;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:58:\"36652582_136900390531638_7590388753240162304_n-414x300.jpg\";s:5:\"width\";i:414;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"featured\";a:4:{s:4:\"file\";s:58:\"36652582_136900390531638_7590388753240162304_n-600x435.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:435;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1225, 555, '_oembed_0182b2bcca6911c57bd82a544369bcfd', '<iframe title=\"Схождение Благодатного огня\" width=\"500\" height=\"281\" src=\"https://www.youtube.com/embed/aYofjTVC4O4?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(1226, 555, '_oembed_time_0182b2bcca6911c57bd82a544369bcfd', '1587232591'),
(1231, 567, '_wp_attached_file', '2020/05/56_tn.jpg'),
(1232, 567, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:463;s:6:\"height\";i:348;s:4:\"file\";s:17:\"2020/05/56_tn.jpg\";s:5:\"sizes\";a:3:{s:6:\"medium\";a:4:{s:4:\"file\";s:17:\"56_tn-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:17:\"56_tn-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:17:\"56_tn-399x300.jpg\";s:5:\"width\";i:399;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1233, 568, '_wp_attached_file', '2020/05/193px-Budshir_hatan.jpg'),
(1234, 568, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:193;s:6:\"height\";i:399;s:4:\"file\";s:31:\"2020/05/193px-Budshir_hatan.jpg\";s:5:\"sizes\";a:3:{s:6:\"medium\";a:4:{s:4:\"file\";s:31:\"193px-Budshir_hatan-145x300.jpg\";s:5:\"width\";i:145;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:31:\"193px-Budshir_hatan-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:31:\"193px-Budshir_hatan-145x300.jpg\";s:5:\"width\";i:145;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1235, 569, '_wp_attached_file', '2020/05/200px-YuanEmperorAlbumAyurbarvadaBuyantuPortrait.jpg'),
(1236, 569, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:200;s:6:\"height\";i:252;s:4:\"file\";s:60:\"2020/05/200px-YuanEmperorAlbumAyurbarvadaBuyantuPortrait.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:60:\"200px-YuanEmperorAlbumAyurbarvadaBuyantuPortrait-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1237, 570, '_wp_attached_file', '2020/05/200px-Es-hej_baatar.jpg'),
(1238, 570, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:200;s:6:\"height\";i:163;s:4:\"file\";s:31:\"2020/05/200px-Es-hej_baatar.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:31:\"200px-Es-hej_baatar-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1239, 571, '_wp_attached_file', '2020/05/230px-1000_Rurik.jpg'),
(1240, 571, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:230;s:6:\"height\";i:307;s:4:\"file\";s:28:\"2020/05/230px-1000_Rurik.jpg\";s:5:\"sizes\";a:3:{s:6:\"medium\";a:4:{s:4:\"file\";s:28:\"230px-1000_Rurik-225x300.jpg\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:28:\"230px-1000_Rurik-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"gallery-thumb\";a:4:{s:4:\"file\";s:28:\"230px-1000_Rurik-225x300.jpg\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1241, 572, '_wp_attached_file', '2020/05/267px-Radzivill_Igor-945.jpg'),
(1242, 572, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:266;s:6:\"height\";i:149;s:4:\"file\";s:36:\"2020/05/267px-Radzivill_Igor-945.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:36:\"267px-Radzivill_Igor-945-150x149.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:149;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2016-07-03 16:55:44', '2016-07-03 13:55:44', 'Добро пожаловать в WordPress. Это ваша первая запись. Отредактируйте или удалите её, затем пишите!', 'Привет, мир!', '', 'publish', 'open', 'open', '', 'privet-mir', '', '', '2016-07-03 16:55:44', '2016-07-03 13:55:44', '', 0, 'http://localhost/Ruslan14/?p=1', 0, 'post', '', 1),
(510, 1, '2017-01-10 18:11:45', '2017-01-10 15:11:45', ' ', '', '', 'publish', 'closed', 'closed', '', '510', '', '', '2020-04-04 18:03:03', '2020-04-04 15:03:03', '', 0, 'http://localhost/Ruslan14/?p=510', 6, 'nav_menu_item', '', 0),
(4, 1, '2016-07-03 17:03:47', '2016-07-03 14:03:47', '', 'Главная', '', 'publish', 'closed', 'closed', '', 'glavnaya', '', '', '2020-04-18 20:29:57', '2020-04-18 17:29:57', '', 0, 'http://localhost/Ruslan14/?page_id=4', 0, 'page', '', 0),
(5, 1, '2016-07-03 17:03:47', '2016-07-03 14:03:47', '', 'Главная', '', 'inherit', 'closed', 'closed', '', '4-revision-v1', '', '', '2016-07-03 17:03:47', '2016-07-03 14:03:47', '', 4, 'http://localhost/Ruslan14/2016/07/03/4-revision-v1/', 0, 'revision', '', 0),
(115, 1, '2016-07-03 21:06:16', '2016-07-03 18:06:16', '<p><strong>Руслан Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал - масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.</p>\n<p>Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей, и привычные для городского жителя серые улицы, окрашенные то мартовским низким солнцем, то вечерними фонарями, и внезапное буйство красок в букете весенних цветов. Когда смотришь на эти вроде бы обыденные сюжеты, мимо которых ежедневно проносишься в жизненной суете, то понимаешь, наконец, за что мы так любим наш город, и это серое небо, и эти сумрачные окраины, и весну, и саму жизнь во всех ее разнообразных проявлениях.</p>\n\n<!-- wp:paragraph -->\n<p>Об Р. Валамов<a href=\"https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D1%80%D0%BB%D0%B0%D0%BC%D0%BE%D0%B2,_%D0%A0%D1%83%D1%81%D0%BB%D0%B0%D0%BD_%D0%92%D0%B0%D0%BB%D0%B5%D1%80%D1%8C%D0%B5%D0%B2%D0%B8%D1%87\">е в Википедии</a></p>\n<!-- /wp:paragraph -->', 'Об авторе', '', 'publish', 'closed', 'closed', '', 'ob-avtore', '', '', '2020-07-18 21:09:41', '2020-07-18 18:09:41', '', 0, 'http://localhost/Ruslan14/?page_id=115', 0, 'page', '', 0),
(417, 1, '2016-07-05 16:59:05', '2016-07-05 13:59:05', 'Университетская улица', 'Университетская улица', 'Университетская улица', 'inherit', 'open', 'closed', '', 'y_cdeb99df', '', '', '2017-01-10 17:31:01', '2017-01-10 14:31:01', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/y_cdeb99df.jpg', 0, 'attachment', 'image/jpeg', 0),
(14, 1, '2016-07-03 17:17:50', '2016-07-03 14:17:50', '', 'Главная', '', 'inherit', 'closed', 'closed', '', '4-revision-v1', '', '', '2016-07-03 17:17:50', '2016-07-03 14:17:50', '', 4, 'http://localhost/Ruslan14/2016/07/03/4-revision-v1/', 0, 'revision', '', 0),
(12, 1, '2016-07-03 17:15:44', '2016-07-03 14:15:44', '[gallery ids=\"6,7,8,9,10,11\"]', 'Главная', '', 'inherit', 'closed', 'closed', '', '4-revision-v1', '', '', '2016-07-03 17:15:44', '2016-07-03 14:15:44', '', 4, 'http://localhost/Ruslan14/2016/07/03/4-revision-v1/', 0, 'revision', '', 0),
(508, 1, '2017-01-10 17:44:51', '2017-01-10 14:44:51', 'Заказать картину можно перерисованную настоящими красками (более дорогой вариант) или напечатанную репродукцию на холсте (более дешёвый)', 'Информация', '', 'inherit', 'closed', 'closed', '', '507-revision-v1', '', '', '2017-01-10 17:44:51', '2017-01-10 14:44:51', '', 507, 'http://localhost/Ruslan14/2017/01/10/507-revision-v1/', 0, 'revision', '', 0),
(518, 1, '2017-02-28 20:39:39', '2017-02-28 17:39:39', '[theme-my-login]', 'Войти', '', 'publish', 'closed', 'closed', '', 'login', '', '', '2017-02-28 20:39:39', '2017-02-28 17:39:39', '', 0, 'http://localhost/Ruslan14/login/', 0, 'page', '', 0),
(379, 1, '2016-07-05 16:48:48', '2016-07-05 13:48:48', 'Вечер на Осколе', 'Вечер на Осколе', 'Вечер на Осколе', 'inherit', 'open', 'closed', '', '106384079_large_3623822_vr7a', '', '', '2016-07-05 17:52:44', '2016-07-05 14:52:44', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/106384079_large_3623822_vr7a.jpg', 0, 'attachment', 'image/jpeg', 0),
(380, 1, '2016-07-05 16:48:49', '2016-07-05 13:48:49', 'Серебристый день ', 'Серебристый день', 'Серебристый день ', 'inherit', 'open', 'closed', '', '106384080_large_3623822_vr8a', '', '', '2016-07-05 17:52:03', '2016-07-05 14:52:03', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/106384080_large_3623822_vr8a.jpg', 0, 'attachment', 'image/jpeg', 0),
(416, 1, '2016-07-05 16:59:03', '2016-07-05 13:59:03', 'У реки', 'У реки', 'У реки', 'inherit', 'open', 'closed', '', 'y_c8504ded', '', '', '2017-01-10 17:31:23', '2017-01-10 14:31:23', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/y_c8504ded.jpg', 0, 'attachment', 'image/jpeg', 0),
(432, 1, '2016-07-06 15:01:31', '2016-07-06 12:01:31', '<img class=\"alignnone size-medium wp-image-430\" src=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/y_ce65c59c-300x257.jpg\" alt=\"y_ce65c59c\" width=\"300\" height=\"257\" />\r\n\r\n<strong>Руслан Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал - масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.', 'Об авторе', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2016-07-06 15:01:31', '2016-07-06 12:01:31', '', 115, 'http://localhost/Ruslan14/2016/07/06/115-revision-v1/', 0, 'revision', '', 0),
(492, 1, '2017-01-10 17:17:50', '2017-01-10 14:17:50', 'Сумская. Голубые сумерки', 'Сумская. Голубые сумерки', 'Сумская. Голубые сумерки', 'inherit', 'open', 'closed', '', '10442990_1472933146278168_5526490817407186089_n-2', '', '', '2017-01-10 17:27:56', '2017-01-10 14:27:56', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2017/01/10442990_1472933146278168_5526490817407186089_n.jpg', 0, 'attachment', 'image/jpeg', 0),
(377, 1, '2016-07-05 16:48:45', '2016-07-05 13:48:45', 'Розовое утро', 'Розовое утро', 'Розовое утро', 'inherit', 'open', 'closed', '', '106384077_large_3623822_vr6a', '', '', '2016-07-05 17:54:24', '2016-07-05 14:54:24', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/106384077_large_3623822_vr6a.jpg', 0, 'attachment', 'image/jpeg', 0),
(431, 1, '2016-07-06 15:01:18', '2016-07-06 12:01:18', '&nbsp;\r\n\r\n<img class=\"alignnone size-medium wp-image-430\" src=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/y_ce65c59c-300x257.jpg\" alt=\"y_ce65c59c\" width=\"300\" height=\"257\" />\r\n\r\n<strong>Руслан Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал - масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.', 'Об авторе', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2016-07-06 15:01:18', '2016-07-06 12:01:18', '', 115, 'http://localhost/Ruslan14/2016/07/06/115-revision-v1/', 0, 'revision', '', 0),
(117, 1, '2016-07-03 21:06:16', '2016-07-03 18:06:16', '<img class=\"alignnone size-full wp-image-116\" src=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/1376327_1383381785233305_974238877_n.jpg\" alt=\"1376327_1383381785233305_974238877_n\" width=\"240\" height=\"206\" />\r\n\r\n<strong>Руслан Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал - масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.', 'Об авторе', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2016-07-03 21:06:16', '2016-07-03 18:06:16', '', 115, 'http://localhost/Ruslan14/2016/07/03/115-revision-v1/', 0, 'revision', '', 0),
(418, 1, '2016-07-05 16:59:07', '2016-07-05 13:59:07', 'Мыс', 'Мыс', 'Мыс', 'inherit', 'open', 'closed', '', 'y_d30ac715', '', '', '2017-01-10 17:30:48', '2017-01-10 14:30:48', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/y_d30ac715.jpg', 0, 'attachment', 'image/jpeg', 0),
(360, 1, '2016-07-05 16:45:41', '2016-07-05 13:45:41', 'Сумская. Голубые сумерки', 'Сумская. Голубые сумерки', '', 'inherit', 'open', 'closed', '', '10442990_1472933146278168_5526490817407186089_n', '', '', '2017-01-10 18:05:05', '2017-01-10 15:05:05', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/10442990_1472933146278168_5526490817407186089_n.jpg', 0, 'attachment', 'image/jpeg', 0),
(370, 1, '2016-07-05 16:48:10', '2016-07-05 13:48:10', 'Закат', 'Закат', 'Закат', 'inherit', 'open', 'closed', '', '106384068_large_3623822_vr01', '', '', '2017-01-10 17:36:36', '2017-01-10 14:36:36', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/106384068_large_3623822_vr01.jpg', 0, 'attachment', 'image/jpeg', 0),
(371, 1, '2016-07-05 16:48:15', '2016-07-05 13:48:15', 'Камни', 'Камни', 'Камни', 'inherit', 'open', 'closed', '', '106384070_large_3623822_vr02', '', '', '2017-01-10 17:36:27', '2017-01-10 14:36:27', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/106384070_large_3623822_vr02.jpg', 0, 'attachment', 'image/jpeg', 0),
(422, 1, '2016-07-05 17:04:00', '2016-07-05 14:04:00', 'Зимний лес', 'Зимний лес', 'Зимний лес', 'inherit', 'open', 'closed', '', 'qvqzcojpz04-2', '', '', '2017-01-10 17:30:34', '2017-01-10 14:30:34', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/QVqZCOjPz04-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(362, 1, '2016-07-05 16:46:04', '2016-07-05 13:46:04', 'Літня мозаїка', 'Літня мозаїка', 'Літня мозаїка', 'inherit', 'open', 'closed', '', '10802054_1534676230103859_476623033233335784_n', '', '', '2017-01-10 18:05:17', '2017-01-10 15:05:17', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/10802054_1534676230103859_476623033233335784_n.jpg', 0, 'attachment', 'image/jpeg', 0),
(415, 1, '2016-07-05 16:59:02', '2016-07-05 13:59:02', 'Берёзовая роща', 'Берёзовая роща', 'Берёзовая роща', 'inherit', 'open', 'closed', '', 'y_be20c792', '', '', '2017-01-10 17:31:35', '2017-01-10 14:31:35', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/y_be20c792.jpg', 0, 'attachment', 'image/jpeg', 0),
(338, 1, '2016-07-05 16:44:31', '2016-07-05 13:44:31', 'Деревенская тема', 'Деревенская тема', 'Деревенская тема', 'inherit', 'open', 'closed', '', '1901644_1519948384909977_4200962525795842063_n', '', '', '2017-01-10 17:39:31', '2017-01-10 14:39:31', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/1901644_1519948384909977_4200962525795842063_n.jpg', 0, 'attachment', 'image/jpeg', 0),
(429, 1, '2016-07-05 18:59:24', '2016-07-05 15:59:24', 'Дорожка', 'Дорожка', 'Дорожка', 'inherit', 'open', 'closed', '', '249106_1383720895199394_448409785_n', '', '', '2017-01-10 17:28:31', '2017-01-10 14:28:31', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/249106_1383720895199394_448409785_n.jpg', 0, 'attachment', 'image/jpeg', 0),
(342, 1, '2016-07-05 16:44:42', '2016-07-05 13:44:42', 'Весна', 'Весна', 'Весна', 'inherit', 'open', 'closed', '', '10002910_1445386735699476_4507018574414674822_n', '', '', '2017-01-10 17:39:23', '2017-01-10 14:39:23', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/10002910_1445386735699476_4507018574414674822_n.jpg', 0, 'attachment', 'image/jpeg', 0),
(343, 1, '2016-07-05 16:44:44', '2016-07-05 13:44:44', 'Колокольчики-ромашки\n', 'Колокольчики-ромашки', 'Колокольчики-ромашки\n', 'inherit', 'open', 'closed', '', '10151426_1444753772429439_71413574352553804_n', '', '', '2016-07-05 17:56:23', '2016-07-05 14:56:23', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/10151426_1444753772429439_71413574352553804_n.jpg', 0, 'attachment', 'image/jpeg', 0),
(118, 1, '2016-07-03 21:07:45', '2016-07-03 18:07:45', ' ', '', '', 'publish', 'closed', 'closed', '', '118', '', '', '2020-04-04 18:03:03', '2020-04-04 15:03:03', '', 0, 'http://localhost/Ruslan14/?p=118', 1, 'nav_menu_item', '', 0),
(489, 1, '2017-01-10 17:13:04', '2017-01-10 14:13:04', '', 'index', '', 'inherit', 'open', 'closed', '', 'index', '', '', '2017-01-10 17:13:04', '2017-01-10 14:13:04', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2017/01/index-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(120, 1, '2016-07-03 21:07:45', '2016-07-03 18:07:45', ' ', '', '', 'publish', 'closed', 'closed', '', '120', '', '', '2020-04-04 18:03:03', '2020-04-04 15:03:03', '', 0, 'http://localhost/Ruslan14/?p=120', 7, 'nav_menu_item', '', 0),
(507, 1, '2017-01-10 17:44:51', '2017-01-10 14:44:51', 'Заказать картину можно как оригинальную, так и напечатанную репродукцию на холсте (более дешевый вариант).', 'Информация', '', 'publish', 'closed', 'closed', '', 'informatsiya', '', '', '2017-03-24 23:57:32', '2017-03-24 20:57:32', '', 0, 'http://localhost/Ruslan14/?page_id=507', 0, 'page', '', 0),
(525, 1, '2017-03-24 23:57:32', '2017-03-24 20:57:32', 'Заказать картину можно как оригинальную, так и напечатанную репродукцию на холсте (более дешевый вариант).', 'Информация', '', 'inherit', 'closed', 'closed', '', '507-revision-v1', '', '', '2017-03-24 23:57:32', '2017-03-24 20:57:32', '', 507, 'http://localhost/Ruslan14/2017/03/24/507-revision-v1/', 0, 'revision', '', 0),
(412, 1, '2016-07-05 16:58:46', '2016-07-05 13:58:46', 'Сумерки над Сумской', 'Сумерки над Сумской', 'Сумерки над Сумской', 'inherit', 'open', 'closed', '', 'y_537939be', '', '', '2017-01-10 17:31:46', '2017-01-10 14:31:46', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/y_537939be.jpg', 0, 'attachment', 'image/jpeg', 0),
(374, 1, '2016-07-05 16:48:40', '2016-07-05 13:48:40', 'Шторм', 'Шторм', 'Шторм', 'inherit', 'open', 'closed', '', '106384074_large_3623822_rv55', '', '', '2017-01-10 17:36:19', '2017-01-10 14:36:19', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/106384074_large_3623822_rv55.jpg', 0, 'attachment', 'image/jpeg', 0),
(375, 1, '2016-07-05 16:48:42', '2016-07-05 13:48:42', 'Берег. Коктебель', 'Берег. Коктебель', 'Берег. Коктебель', 'inherit', 'open', 'closed', '', '106384075_large_3623822_vr10a', '', '', '2017-01-10 17:36:09', '2017-01-10 14:36:09', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/106384075_large_3623822_vr10a.jpg', 0, 'attachment', 'image/jpeg', 0),
(366, 1, '2016-07-05 16:46:21', '2016-07-05 13:46:21', 'Утро', 'Утро', 'Утро', 'inherit', 'open', 'closed', '', '10960072_1561425624095586_8082160125660468859_o', '', '', '2017-01-10 17:36:44', '2017-01-10 14:36:44', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/10960072_1561425624095586_8082160125660468859_o.jpg', 0, 'attachment', 'image/jpeg', 0),
(353, 1, '2016-07-05 16:45:28', '2016-07-05 13:45:28', 'Макар', 'Макар', 'Макар', 'inherit', 'open', 'closed', '', '10338449_1470509593187190_4441822572503007124_o', '', '', '2017-01-10 18:04:20', '2017-01-10 15:04:20', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/10338449_1470509593187190_4441822572503007124_o.jpg', 0, 'attachment', 'image/jpeg', 0),
(354, 1, '2016-07-05 16:45:30', '2016-07-05 13:45:30', 'Кот на берегу', 'Кот на берегу', 'Кот на берегу', 'inherit', 'open', 'closed', '', '10375496_1523978947840254_2010400255303941574_n', '', '', '2017-01-10 18:04:36', '2017-01-10 15:04:36', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/10375496_1523978947840254_2010400255303941574_n.jpg', 0, 'attachment', 'image/jpeg', 0),
(355, 1, '2016-07-05 16:45:31', '2016-07-05 13:45:31', 'Ирисы', 'Ирисы', 'Ирисы', 'inherit', 'open', 'closed', '', '10376141_1460532724184877_8131905327791330491_n', '', '', '2017-01-10 18:04:01', '2017-01-10 15:04:01', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/10376141_1460532724184877_8131905327791330491_n.jpg', 0, 'attachment', 'image/jpeg', 0),
(427, 1, '2016-07-05 17:55:33', '2016-07-05 14:55:33', 'Богатыри', 'Богатыри', 'Богатыри', 'inherit', 'open', 'closed', '', 'y_ce85ad7a', '', '', '2017-01-10 17:29:04', '2017-01-10 14:29:04', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/y_ce85ad7a.jpg', 0, 'attachment', 'image/jpeg', 0),
(433, 1, '2016-07-06 15:32:31', '2016-07-06 12:32:31', '<img class=\"alignnone size-full wp-image-116\" src=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/1376327_1383381785233305_974238877_n.jpg\" alt=\"1376327_1383381785233305_974238877_n\" width=\"240\" height=\"206\" />\r\n\r\n<strong>Руслан Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал - масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.\r\n\r\n&nbsp;', 'Об авторе', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2016-07-06 15:32:31', '2016-07-06 12:32:31', '', 115, 'http://localhost/Ruslan14/2016/07/06/115-revision-v1/', 0, 'revision', '', 0),
(335, 1, '2016-07-05 16:44:19', '2016-07-05 13:44:19', 'Утренняя свежесть', 'Утренняя свежесть', 'Утренняя свежесть', 'inherit', 'open', 'closed', '', '1460012_1404833479754802_178694986_n', '', '', '2017-01-10 17:39:54', '2017-01-10 14:39:54', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/1460012_1404833479754802_178694986_n.jpg', 0, 'attachment', 'image/jpeg', 0),
(337, 1, '2016-07-05 16:44:26', '2016-07-05 13:44:26', 'Зимняя мозаика', 'Зимняя мозаика', 'Зимняя мозаика', 'inherit', 'open', 'closed', '', '1551542_1413990135505803_1681945524_n', '', '', '2017-01-10 17:39:43', '2017-01-10 14:39:43', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/1551542_1413990135505803_1681945524_n.jpg', 0, 'attachment', 'image/jpeg', 0),
(481, 1, '2016-07-12 10:40:11', '2016-07-12 07:40:11', '', 'Заказ картины', '', 'publish', 'closed', 'closed', '', 'zakaz-kartiny', '', '', '2017-01-10 18:37:04', '2017-01-10 15:37:04', '', 0, 'http://localhost/Ruslan14/?page_id=481', 0, 'page', '', 0),
(411, 1, '2016-07-05 16:58:40', '2016-07-05 13:58:40', 'Над бездной моря...\n', 'Над бездной моря...', 'Над бездной моря...\n', 'inherit', 'open', 'closed', '', 'y_832b953f', '', '', '2016-07-05 17:51:06', '2016-07-05 14:51:06', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/y_832b953f.jpg', 0, 'attachment', 'image/jpeg', 0),
(408, 1, '2016-07-05 16:58:28', '2016-07-05 13:58:28', 'Перед закатом', 'Перед закатом', 'Перед закатом', 'inherit', 'open', 'closed', '', 'y_10b1c5a9', '', '', '2017-01-10 17:32:09', '2017-01-10 14:32:09', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/y_10b1c5a9.jpg', 0, 'attachment', 'image/jpeg', 0),
(428, 1, '2016-07-05 17:59:50', '2016-07-05 14:59:50', 'Фиолент', 'Фиолент', 'Фиолент', 'inherit', 'open', 'closed', '', '1907609_1439721159599367_732292459_n-2', '', '', '2017-01-10 17:28:51', '2017-01-10 14:28:51', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/1907609_1439721159599367_732292459_n-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(345, 1, '2016-07-05 16:44:52', '2016-07-05 13:44:52', 'Вечер. Чайки', 'Вечер. Чайки', 'Вечер. Чайки', 'inherit', 'open', 'closed', '', '10154298_1439796539591829_254048403_n', '', '', '2017-01-10 17:39:07', '2017-01-10 14:39:07', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/10154298_1439796539591829_254048403_n.jpg', 0, 'attachment', 'image/jpeg', 0),
(346, 1, '2016-07-05 16:44:58', '2016-07-05 13:44:58', 'Простор', 'Простор', 'Простор', 'inherit', 'open', 'closed', '', '10154926_1447604955477654_6732011238071184111_n', '', '', '2016-07-05 17:53:20', '2016-07-05 14:53:20', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/10154926_1447604955477654_6732011238071184111_n.jpg', 0, 'attachment', 'image/jpeg', 0),
(349, 1, '2016-07-05 16:45:16', '2016-07-05 13:45:16', 'Камни. Мыс Ильи', 'Камни. Мыс Ильи', 'Камни. Мыс Ильи', 'inherit', 'open', 'closed', '', '10290601_1445947255643424_5265523390944141244_n', '', '', '2016-07-05 17:54:49', '2016-07-05 14:54:49', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/10290601_1445947255643424_5265523390944141244_n.jpg', 0, 'attachment', 'image/jpeg', 0),
(350, 1, '2016-07-05 16:45:18', '2016-07-05 13:45:18', 'Утренние берёзы', 'Утренние берёзы', 'Утренние берёзы', 'inherit', 'open', 'closed', '', '10311097_1523978941173588_110585530880077935_n', '', '', '2017-01-10 18:03:36', '2017-01-10 15:03:36', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/10311097_1523978941173588_110585530880077935_n.jpg', 0, 'attachment', 'image/jpeg', 0),
(435, 1, '2016-07-06 15:36:21', '2016-07-06 12:36:21', '<img class=\"alignnone size-full wp-image-116\" src=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/1376327_1383381785233305_974238877_n.jpg\" alt=\"1376327_1383381785233305_974238877_n\" width=\"240\" height=\"206\" />\r\n\r\n<strong>Руслан Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал - масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.\r\n\r\n<a href=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/SYoXRyJVnjk.jpg\"><img class=\"size-medium wp-image-425\" src=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/SYoXRyJVnjk-300x202.jpg\" alt=\"Сумерки. Сумская\" width=\"300\" height=\"202\" /></a>', 'Об авторе', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2016-07-06 15:36:21', '2016-07-06 12:36:21', '', 115, 'http://localhost/Ruslan14/2016/07/06/115-revision-v1/', 0, 'revision', '', 0),
(430, 1, '2016-07-06 15:01:05', '2016-07-06 12:01:05', '', 'y_ce65c59c', '', 'inherit', 'open', 'closed', '', 'y_ce65c59c', '', '', '2016-07-06 15:01:05', '2016-07-06 12:01:05', '', 115, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/y_ce65c59c.jpg', 0, 'attachment', 'image/jpeg', 0),
(423, 1, '2016-07-05 17:05:08', '2016-07-05 14:05:08', 'Утро в лесу', 'Утро в лесу', 'Утро в лесу', 'inherit', 'open', 'closed', '', 'olympus-digital-camera-5', '', '', '2017-01-10 17:29:48', '2017-01-10 14:29:48', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/PB293612.jpg', 0, 'attachment', 'image/jpeg', 0),
(381, 1, '2016-07-05 16:48:50', '2016-07-05 13:48:50', 'По Карелии', 'По Карелии', 'По Карелии', 'inherit', 'open', 'closed', '', '106384081_large_3623822_vr9a', '', '', '2016-07-05 17:50:25', '2016-07-05 14:50:25', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/106384081_large_3623822_vr9a.jpg', 0, 'attachment', 'image/jpeg', 0),
(382, 1, '2016-07-05 16:48:52', '2016-07-05 13:48:52', 'Море. Закат', 'Море. Закат', 'Море. Закат', 'inherit', 'open', 'closed', '', '106384082_large_3623822_vr14a', '', '', '2017-01-10 17:35:39', '2017-01-10 14:35:39', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/106384082_large_3623822_vr14a.jpg', 0, 'attachment', 'image/jpeg', 0),
(385, 1, '2016-07-05 16:48:56', '2016-07-05 13:48:56', 'Берег', 'Берег', 'Берег', 'inherit', 'open', 'closed', '', '106384086_large_3623822_vr15a', '', '', '2017-01-10 17:35:28', '2017-01-10 14:35:28', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/106384086_large_3623822_vr15a.jpg', 0, 'attachment', 'image/jpeg', 0),
(387, 1, '2016-07-05 16:49:02', '2016-07-05 13:49:02', 'Сумская. Вечерние огни', 'Сумская. Вечерние огни', 'Сумская. Вечерние огни', 'inherit', 'open', 'closed', '', 'imm4ib4c0xo', '', '', '2017-01-10 17:33:29', '2017-01-10 14:33:29', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/iMm4Ib4c0Xo.jpg', 0, 'attachment', 'image/jpeg', 0),
(388, 1, '2016-07-05 16:49:05', '2016-07-05 13:49:05', 'Городские сумерки', 'Городские сумерки', 'Городские сумерки', 'inherit', 'open', 'closed', '', 'jmxya-8eg3c', '', '', '2016-07-05 17:49:06', '2016-07-05 14:49:06', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/JMXYA-8eG3c.jpg', 0, 'attachment', 'image/jpeg', 0),
(437, 1, '2016-07-06 15:38:24', '2016-07-06 12:38:24', '<img class=\"alignnone size-full wp-image-116\" src=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/1376327_1383381785233305_974238877_n.jpg\" alt=\"1376327_1383381785233305_974238877_n\" width=\"240\" height=\"206\" />\r\n\r\n<strong>Руслан Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал - масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.\r\n\r\n&nbsp;', 'Об авторе', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2016-07-06 15:38:24', '2016-07-06 12:38:24', '', 115, 'http://localhost/Ruslan14/2016/07/06/115-revision-v1/', 0, 'revision', '', 0),
(434, 1, '2016-07-06 15:33:58', '2016-07-06 12:33:58', '<img class=\"alignnone size-full wp-image-116\" src=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/1376327_1383381785233305_974238877_n.jpg\" alt=\"1376327_1383381785233305_974238877_n\" width=\"240\" height=\"206\" />\r\n\r\n<strong>Руслан Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал - масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.\r\n\r\n[caption id=\"attachment_425\" align=\"alignnone\" width=\"300\"]<img class=\"size-medium wp-image-425\" src=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/SYoXRyJVnjk-300x202.jpg\" alt=\"Сумерки. Сумская\" width=\"300\" height=\"202\" /> Харьков[/caption]', 'Об авторе', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2016-07-06 15:33:58', '2016-07-06 12:33:58', '', 115, 'http://localhost/Ruslan14/2016/07/06/115-revision-v1/', 0, 'revision', '', 0),
(396, 1, '2016-07-05 16:52:50', '2016-07-05 13:52:50', 'Паруса', 'Паруса', 'Паруса', 'inherit', 'open', 'closed', '', 'p1010005-2288x1564-50ce', '', '', '2017-01-10 17:33:04', '2017-01-10 14:33:04', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/P1010005-2288x1564-50ce.jpg', 0, 'attachment', 'image/jpeg', 0),
(574, 1, '2020-07-18 21:09:40', '2020-07-18 18:09:40', '<p><strong>Руслан Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал - масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.</p>\n<p>Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей, и привычные для городского жителя серые улицы, окрашенные то мартовским низким солнцем, то вечерними фонарями, и внезапное буйство красок в букете весенних цветов. Когда смотришь на эти вроде бы обыденные сюжеты, мимо которых ежедневно проносишься в жизненной суете, то понимаешь, наконец, за что мы так любим наш город, и это серое небо, и эти сумрачные окраины, и весну, и саму жизнь во всех ее разнообразных проявлениях.</p>\n\n<!-- wp:paragraph -->\n<p>Об Р. Валамов<a href=\"https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D1%80%D0%BB%D0%B0%D0%BC%D0%BE%D0%B2,_%D0%A0%D1%83%D1%81%D0%BB%D0%B0%D0%BD_%D0%92%D0%B0%D0%BB%D0%B5%D1%80%D1%8C%D0%B5%D0%B2%D0%B8%D1%87\">е в Википедии</a></p>\n<!-- /wp:paragraph -->', 'Об авторе', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2020-07-18 21:09:40', '2020-07-18 18:09:40', '', 115, 'http://localhost/Ruslan14/2020/07/18/115-revision-v1/', 0, 'revision', '', 0),
(524, 1, '2017-03-24 23:57:09', '2017-03-24 20:57:09', '<strong>Руслан Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал - масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.\r\n\r\nОсобенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей, и привычные для городского жителя серые улицы, окрашенные то мартовским низким солнцем, то вечерними фонарями, и внезапное буйство красок в букете весенних цветов. Когда смотришь на эти вроде бы обыденные сюжеты, мимо которых ежедневно проносишься в жизненной суете, то понимаешь, наконец, за что мы так любим наш город, и это серое небо, и эти сумрачные окраины, и весну, и саму жизнь во всех ее разнообразных проявлениях.', 'Об авторе', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2017-03-24 23:57:09', '2017-03-24 20:57:09', '', 115, 'http://localhost/Ruslan14/2017/03/24/115-revision-v1/', 0, 'revision', '', 0),
(398, 1, '2016-07-05 16:53:23', '2016-07-05 13:53:23', 'Осенняя тропинка', 'Осенняя тропинка', 'Осенняя тропинка', 'inherit', 'open', 'closed', '', 'p1010006-1987x1549-c8f2', '', '', '2017-01-10 17:32:52', '2017-01-10 14:32:52', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/P1010006-1987x1549-c8f2.jpg', 0, 'attachment', 'image/jpeg', 0),
(402, 1, '2016-07-05 16:56:06', '2016-07-05 13:56:06', 'Сумская. После дождя', 'Сумская. После дождя', 'Сумская. После дождя', 'inherit', 'open', 'closed', '', 'qjk8ccihzmm', '', '', '2017-01-10 17:32:38', '2017-01-10 14:32:38', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/QjK8CCIHZMM.jpg', 0, 'attachment', 'image/jpeg', 0),
(404, 1, '2016-07-05 16:57:54', '2016-07-05 13:57:54', 'Парусник', 'Парусник', 'Парусник', 'inherit', 'open', 'closed', '', 'y_05b512d7', '', '', '2017-01-10 17:32:24', '2017-01-10 14:32:24', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/y_05b512d7.jpg', 0, 'attachment', 'image/jpeg', 0),
(424, 1, '2016-07-05 17:05:12', '2016-07-05 14:05:12', 'Жемчужное утро', 'Жемчужное утро', 'Жемчужное утро', 'inherit', 'open', 'closed', '', 'sfj-cjhuasw', '', '', '2017-01-10 17:29:32', '2017-01-10 14:29:32', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/sfJ-cJHuaSw.jpg', 0, 'attachment', 'image/jpeg', 0),
(425, 1, '2016-07-05 17:05:16', '2016-07-05 14:05:16', 'Сумерки. Сумская', 'Сумерки. Сумская', 'Сумерки. Сумская', 'inherit', 'open', 'closed', '', 'syoxryjvnjk', '', '', '2017-01-10 17:29:17', '2017-01-10 14:29:17', '', 115, 'http://localhost/Ruslan14/wp-content/uploads/2016/07/SYoXRyJVnjk.jpg', 0, 'attachment', 'image/jpeg', 0),
(455, 1, '2016-07-06 18:43:30', '2016-07-06 15:43:30', '<strong>Руслан Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал - масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.\r\n<blockquote>\"Все мои работы отличаются по-своему, но в каждой из них присутствует солнце: и в осенних пейзажах, и зимних, и морских. У меня те картины любимые, которые посвящены теме зимы, поскольку они выполнены в импрессионистической манере. Этим они отличается от всех других моих работ. Импрессионизм - это новый для меня стиль, до этого времени я писал преимущественно в академическом реализме. Считаю, что эксперимент является успешным. В целом, могу сказать, что выставкой я доволен, поскольку здесь собрались художники разного возраста, чувствуется связь поколений и прекрасная школа Сергея Беседина. Приятно, что на таких экспозициях ценятся традиции классической живописи, ценятся традиции, заложенные профессионалами, гениальными людьми искусства.\"</blockquote>\r\n', 'Об авторе', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2016-07-06 18:43:30', '2016-07-06 15:43:30', '', 115, 'http://localhost/Ruslan14/2016/07/06/115-revision-v1/', 0, 'revision', '', 0),
(438, 1, '2016-07-06 15:45:44', '2016-07-06 12:45:44', '<img class=\"alignnone size-full wp-image-116\" src=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/1376327_1383381785233305_974238877_n.jpg\" alt=\"1376327_1383381785233305_974238877_n\" width=\"240\" height=\"206\" />\r\n\r\n<strong>Руслан Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал - масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.\r\n\r\n<blockquote>- Все мои работы отличаются по-своему, но в каждой из них присутствует солнце: и в осенних пейзажах, и зимних, и морских. У меня те картины любимые, которые посвящены теме зимы, поскольку они выполнены в импрессионистической манере. Этим они отличается от всех других моих работ. Импрессионизм - это новый для меня стиль, до этого времени я писал преимущественно в академическом реализме. Считаю, что эксперимент является успешным. В целом, могу сказать, что выставкой я доволен, поскольку здесь собрались художники разного возраста, чувствуется связь поколений и прекрасная школа Сергея Беседина. Приятно, что на таких экспозициях ценятся традиции классической живописи, ценятся традиции, заложенные профессионалами, гениальными людьми искусства.</blockquote>', 'Об авторе', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2016-07-06 15:45:44', '2016-07-06 12:45:44', '', 115, 'http://localhost/Ruslan14/2016/07/06/115-revision-v1/', 0, 'revision', '', 0),
(439, 1, '2016-07-06 15:51:05', '2016-07-06 12:51:05', '<img class=\"alignnone size-full wp-image-116\" src=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/1376327_1383381785233305_974238877_n.jpg\" alt=\"1376327_1383381785233305_974238877_n\" width=\"240\" height=\"206\" />\r\n\r\n<strong>Руслан Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал - масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.\r\n<blockquote>- Все мои работы отличаются по-своему, но в каждой из них присутствует солнце: и в осенних пейзажах, и зимних, и морских. У меня те картины любимые, которые посвящены теме зимы, поскольку они выполнены в импрессионистической манере. Этим они отличается от всех других моих работ. Импрессионизм - это новый для меня стиль, до этого времени я писал преимущественно в академическом реализме. Считаю, что эксперимент является успешным. В целом, могу сказать, что выставкой я доволен, поскольку здесь собрались художники разного возраста, чувствуется связь поколений и прекрасная школа Сергея Беседина. Приятно, что на таких экспозициях ценятся традиции классической живописи, ценятся традиции, заложенные профессионалами, гениальными людьми искусства.</blockquote>\r\nСтраница в контакте\r\n\r\nСтраница в фейсбуке', 'Об авторе', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2016-07-06 15:51:05', '2016-07-06 12:51:05', '', 115, 'http://localhost/Ruslan14/2016/07/06/115-revision-v1/', 0, 'revision', '', 0),
(440, 1, '2016-07-06 15:51:48', '2016-07-06 12:51:48', '<img class=\"alignnone size-full wp-image-116\" src=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/1376327_1383381785233305_974238877_n.jpg\" alt=\"1376327_1383381785233305_974238877_n\" width=\"240\" height=\"206\" />\r\n\r\n<strong>Руслан Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал - масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.\r\n<blockquote>- Все мои работы отличаются по-своему, но в каждой из них присутствует солнце: и в осенних пейзажах, и зимних, и морских. У меня те картины любимые, которые посвящены теме зимы, поскольку они выполнены в импрессионистической манере. Этим они отличается от всех других моих работ. Импрессионизм - это новый для меня стиль, до этого времени я писал преимущественно в академическом реализме. Считаю, что эксперимент является успешным. В целом, могу сказать, что выставкой я доволен, поскольку здесь собрались художники разного возраста, чувствуется связь поколений и прекрасная школа Сергея Беседина. Приятно, что на таких экспозициях ценятся традиции классической живописи, ценятся традиции, заложенные профессионалами, гениальными людьми искусства.</blockquote>\r\n<a href=\"https://vk.com/id124579896\">Страница в контакте</a>\r\n\r\n<a href=\"https://www.facebook.com/profile.php?id=100006844900254\">Страница в фейсбуке</a>', 'Об авторе', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2016-07-06 15:51:48', '2016-07-06 12:51:48', '', 115, 'http://localhost/Ruslan14/2016/07/06/115-revision-v1/', 0, 'revision', '', 0),
(441, 1, '2016-07-06 15:53:17', '2016-07-06 12:53:17', '<img class=\"alignnone size-full wp-image-116\" src=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/1376327_1383381785233305_974238877_n.jpg\" alt=\"1376327_1383381785233305_974238877_n\" width=\"240\" height=\"206\" />\r\n\r\n<strong>Руслан Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал - масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.\r\n<blockquote>\"Все мои работы отличаются по-своему, но в каждой из них присутствует солнце: и в осенних пейзажах, и зимних, и морских. У меня те картины любимые, которые посвящены теме зимы, поскольку они выполнены в импрессионистической манере. Этим они отличается от всех других моих работ. Импрессионизм - это новый для меня стиль, до этого времени я писал преимущественно в академическом реализме. Считаю, что эксперимент является успешным. В целом, могу сказать, что выставкой я доволен, поскольку здесь собрались художники разного возраста, чувствуется связь поколений и прекрасная школа Сергея Беседина. Приятно, что на таких экспозициях ценятся традиции классической живописи, ценятся традиции, заложенные профессионалами, гениальными людьми искусства.\"</blockquote>\r\n<a href=\"https://vk.com/id124579896\">Страница в контакте</a>\r\n\r\n<a href=\"https://www.facebook.com/profile.php?id=100006844900254\">Страница в фейсбуке</a>', 'Об авторе', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2016-07-06 15:53:17', '2016-07-06 12:53:17', '', 115, 'http://localhost/Ruslan14/2016/07/06/115-revision-v1/', 0, 'revision', '', 0),
(454, 1, '2016-07-06 18:01:00', '2016-07-06 15:01:00', '<img class=\"alignnone size-full wp-image-116\" src=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/1376327_1383381785233305_974238877_n.jpg\" alt=\"1376327_1383381785233305_974238877_n\" width=\"240\" height=\"206\" />\r\n\r\n<strong>Руслан Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал - масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.\r\n<blockquote>\"Все мои работы отличаются по-своему, но в каждой из них присутствует солнце: и в осенних пейзажах, и зимних, и морских. У меня те картины любимые, которые посвящены теме зимы, поскольку они выполнены в импрессионистической манере. Этим они отличается от всех других моих работ. Импрессионизм - это новый для меня стиль, до этого времени я писал преимущественно в академическом реализме. Считаю, что эксперимент является успешным. В целом, могу сказать, что выставкой я доволен, поскольку здесь собрались художники разного возраста, чувствуется связь поколений и прекрасная школа Сергея Беседина. Приятно, что на таких экспозициях ценятся традиции классической живописи, ценятся традиции, заложенные профессионалами, гениальными людьми искусства.\"</blockquote>\r\n', 'Об авторе', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2016-07-06 18:01:00', '2016-07-06 15:01:00', '', 115, 'http://localhost/Ruslan14/2016/07/06/115-revision-v1/', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(442, 1, '2016-07-06 16:10:38', '2016-07-06 13:10:38', '<img class=\"alignnone size-full wp-image-116\" src=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/1376327_1383381785233305_974238877_n.jpg\" alt=\"1376327_1383381785233305_974238877_n\" width=\"240\" height=\"206\" />\r\n\r\n<strong>Руслан Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал - масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.\r\n<blockquote>\"Все мои работы отличаются по-своему, но в каждой из них присутствует солнце: и в осенних пейзажах, и зимних, и морских. У меня те картины любимые, которые посвящены теме зимы, поскольку они выполнены в импрессионистической манере. Этим они отличается от всех других моих работ. Импрессионизм - это новый для меня стиль, до этого времени я писал преимущественно в академическом реализме. Считаю, что эксперимент является успешным. В целом, могу сказать, что выставкой я доволен, поскольку здесь собрались художники разного возраста, чувствуется связь поколений и прекрасная школа Сергея Беседина. Приятно, что на таких экспозициях ценятся традиции классической живописи, ценятся традиции, заложенные профессионалами, гениальными людьми искусства.\"</blockquote>\r\n<a href=\"https://vk.com/id124579896\">Страница в контакте</a>\r\n\r\n<a href=\"https://www.facebook.com/profile.php?id=100006844900254\">Страница в фейсбуке</a>\r\n\r\n<a href=\"http://timeua.info/post/kultura/hochu-na-plener-v-ukrainu-hochu-v-gajdary-00737.html\">О пленере в селе Гайдары (Змиевской район) с участием Р. В.</a>\r\n\r\n<a href=\"http://varta.kharkov.ua/news/art/1106384?id=4\">О торжественном вечере Сергея Беседина, коллеги Р. В., где участвовал последний.</a>', 'Об авторе', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2016-07-06 16:10:38', '2016-07-06 13:10:38', '', 115, 'http://localhost/Ruslan14/2016/07/06/115-revision-v1/', 0, 'revision', '', 0),
(447, 1, '2016-07-06 17:13:34', '2016-07-06 14:13:34', '<img class=\"alignnone size-full wp-image-116\" src=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/1376327_1383381785233305_974238877_n.jpg\" alt=\"1376327_1383381785233305_974238877_n\" width=\"240\" height=\"206\" />\r\n\r\n<strong>Руслан Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал - масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.\r\n<blockquote>\"Все мои работы отличаются по-своему, но в каждой из них присутствует солнце: и в осенних пейзажах, и зимних, и морских. У меня те картины любимые, которые посвящены теме зимы, поскольку они выполнены в импрессионистической манере. Этим они отличается от всех других моих работ. Импрессионизм - это новый для меня стиль, до этого времени я писал преимущественно в академическом реализме. Считаю, что эксперимент является успешным. В целом, могу сказать, что выставкой я доволен, поскольку здесь собрались художники разного возраста, чувствуется связь поколений и прекрасная школа Сергея Беседина. Приятно, что на таких экспозициях ценятся традиции классической живописи, ценятся традиции, заложенные профессионалами, гениальными людьми искусства.\"</blockquote>\r\n<a href=\"https://vk.com/id124579896\">Страница в контакте</a>\r\n\r\n<a href=\"https://www.facebook.com/profile.php?id=100006844900254\">Страница в фейсбуке</a>\r\n\r\n<a href=\"http://timeua.info/post/kultura/hochu-na-plener-v-ukrainu-hochu-v-gajdary-00737.html\">О пленере в селе Гайдары (Змиевской район) с участием Р. В.</a>\r\n\r\n<a href=\"http://varta.kharkov.ua/news/art/1106384?id=4\">«З іскри – світло душі і натхнення полум’я»</a>', 'Об авторе', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2016-07-06 17:13:34', '2016-07-06 14:13:34', '', 115, 'http://localhost/Ruslan14/2016/07/06/115-revision-v1/', 0, 'revision', '', 0),
(443, 1, '2016-07-06 16:11:35', '2016-07-06 13:11:35', '<img class=\"alignnone size-full wp-image-116\" src=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/1376327_1383381785233305_974238877_n.jpg\" alt=\"1376327_1383381785233305_974238877_n\" width=\"240\" height=\"206\" />\r\n\r\n<strong>Руслан Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал - масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.\r\n<blockquote>\"Все мои работы отличаются по-своему, но в каждой из них присутствует солнце: и в осенних пейзажах, и зимних, и морских. У меня те картины любимые, которые посвящены теме зимы, поскольку они выполнены в импрессионистической манере. Этим они отличается от всех других моих работ. Импрессионизм - это новый для меня стиль, до этого времени я писал преимущественно в академическом реализме. Считаю, что эксперимент является успешным. В целом, могу сказать, что выставкой я доволен, поскольку здесь собрались художники разного возраста, чувствуется связь поколений и прекрасная школа Сергея Беседина. Приятно, что на таких экспозициях ценятся традиции классической живописи, ценятся традиции, заложенные профессионалами, гениальными людьми искусства.\"</blockquote>\r\n<a href=\"https://vk.com/id124579896\">Страница в контакте</a>\r\n\r\n<a href=\"https://www.facebook.com/profile.php?id=100006844900254\">Страница в фейсбуке</a>\r\n\r\n<a href=\"http://timeua.info/post/kultura/hochu-na-plener-v-ukrainu-hochu-v-gajdary-00737.html\">О пленере в селе Гайдары (Змиевской район) с участием Р. В.</a>\r\n\r\n<a href=\"http://varta.kharkov.ua/news/art/1106384?id=4\">О торжественном вечере Сергея Беседина, коллеги Р. В., в галлерее \"Бузок\", где участвовал последний.</a>', 'Об авторе', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2016-07-06 16:11:35', '2016-07-06 13:11:35', '', 115, 'http://localhost/Ruslan14/2016/07/06/115-revision-v1/', 0, 'revision', '', 0),
(483, 1, '2016-07-15 17:26:10', '2016-07-15 14:26:10', '', 'Письма', '', 'private', 'closed', 'closed', '', 'pisma', '', '', '2016-07-15 17:26:10', '2016-07-15 14:26:10', '', 0, 'http://localhost/Ruslan14/?page_id=483', 0, 'page', '', 0),
(448, 1, '2016-07-06 17:14:01', '2016-07-06 14:14:01', '<img class=\"alignnone size-full wp-image-116\" src=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/1376327_1383381785233305_974238877_n.jpg\" alt=\"1376327_1383381785233305_974238877_n\" width=\"240\" height=\"206\" />\r\n\r\n<strong>Руслан Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал - масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.\r\n<blockquote>\"Все мои работы отличаются по-своему, но в каждой из них присутствует солнце: и в осенних пейзажах, и зимних, и морских. У меня те картины любимые, которые посвящены теме зимы, поскольку они выполнены в импрессионистической манере. Этим они отличается от всех других моих работ. Импрессионизм - это новый для меня стиль, до этого времени я писал преимущественно в академическом реализме. Считаю, что эксперимент является успешным. В целом, могу сказать, что выставкой я доволен, поскольку здесь собрались художники разного возраста, чувствуется связь поколений и прекрасная школа Сергея Беседина. Приятно, что на таких экспозициях ценятся традиции классической живописи, ценятся традиции, заложенные профессионалами, гениальными людьми искусства.\"</blockquote>\r\n<a href=\"https://vk.com/id124579896\">Страница в контакте</a>\r\n\r\n<a href=\"https://www.facebook.com/profile.php?id=100006844900254\">Страница в фейсбуке</a>\r\n\r\n<a href=\"http://timeua.info/post/kultura/hochu-na-plener-v-ukrainu-hochu-v-gajdary-00737.html\">«Хочу на пленэр в Украину, хочу в Гайдары!»</a>\r\n\r\n<a href=\"http://varta.kharkov.ua/news/art/1106384?id=4\">«З іскри – світло душі і натхнення полум’я»</a>', 'Об авторе', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2016-07-06 17:14:01', '2016-07-06 14:14:01', '', 115, 'http://localhost/Ruslan14/2016/07/06/115-revision-v1/', 0, 'revision', '', 0),
(456, 1, '2016-07-06 18:48:06', '2016-07-06 15:48:06', '<!-- wp:paragraph -->\n<p>Контактный e-mail Р. Варламова - r-varlamov@mail.ru</p>\n<!-- /wp:paragraph -->', 'Контакты', '', 'publish', 'closed', 'closed', '', 'kontakty', '', '', '2020-04-16 23:13:57', '2020-04-16 20:13:57', '', 0, 'http://localhost/Ruslan14/?page_id=456', 0, 'page', '', 0),
(457, 1, '2016-07-06 18:48:06', '2016-07-06 15:48:06', '', 'Контакты', '', 'inherit', 'closed', 'closed', '', '456-revision-v1', '', '', '2016-07-06 18:48:06', '2016-07-06 15:48:06', '', 456, 'http://localhost/Ruslan14/2016/07/06/456-revision-v1/', 0, 'revision', '', 0),
(458, 1, '2016-07-06 18:48:41', '2016-07-06 15:48:41', ' ', '', '', 'publish', 'closed', 'closed', '', '458', '', '', '2020-04-04 18:03:03', '2020-04-04 15:03:03', '', 0, 'http://localhost/Ruslan14/?p=458', 8, 'nav_menu_item', '', 0),
(459, 1, '2016-07-06 18:56:02', '2016-07-06 15:56:02', '', 'Пейзаж', '', 'publish', 'closed', 'closed', '', 'pejzazh', '', '', '2017-01-10 18:10:54', '2017-01-10 15:10:54', '', 0, 'http://localhost/Ruslan14/?page_id=459', 0, 'page', '', 0),
(460, 1, '2016-07-06 18:56:02', '2016-07-06 15:56:02', '', 'Пейзаж', '', 'inherit', 'closed', 'closed', '', '459-revision-v1', '', '', '2016-07-06 18:56:02', '2016-07-06 15:56:02', '', 459, 'http://localhost/Ruslan14/2016/07/06/459-revision-v1/', 0, 'revision', '', 0),
(490, 1, '2017-01-10 17:13:29', '2017-01-10 14:13:29', 'http://localhost/Ruslan14/wp-content/uploads/2017/01/cropped-index-1.jpg', 'cropped-index-1.jpg', '', 'inherit', 'open', 'closed', '', 'cropped-index-1-jpg', '', '', '2017-01-10 17:13:29', '2017-01-10 14:13:29', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2017/01/cropped-index-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(473, 1, '2016-07-06 19:04:50', '2016-07-06 16:04:50', '<!-- wp:paragraph -->\n<p>гого</p>\n<!-- /wp:paragraph -->', 'Городской пейзаж', '', 'publish', 'closed', 'closed', '', 'gorodskoj-pejzazh', '', '', '2020-04-14 23:26:14', '2020-04-14 20:26:14', '', 0, 'http://localhost/Ruslan14/?page_id=473', 0, 'page', '', 0),
(464, 1, '2016-07-06 18:57:02', '2016-07-06 15:57:02', ' ', '', '', 'publish', 'closed', 'closed', '', '464', '', '', '2020-04-04 18:03:03', '2020-04-04 15:03:03', '', 0, 'http://localhost/Ruslan14/?p=464', 2, 'nav_menu_item', '', 0),
(465, 1, '2016-07-06 19:01:01', '2016-07-06 16:01:01', '', 'Морской пейзаж', '', 'publish', 'closed', 'closed', '', 'morskoj-pejzazh', '', '', '2017-01-10 18:09:33', '2017-01-10 15:09:33', '', 0, 'http://localhost/Ruslan14/?page_id=465', 0, 'page', '', 0),
(477, 1, '2016-07-06 21:55:21', '2016-07-06 18:55:21', '', 'тест', '', 'publish', 'closed', 'closed', '', 'test', '', '', '2016-07-06 21:55:21', '2016-07-06 18:55:21', '', 0, 'http://localhost/Ruslan14/?page_id=477', 0, 'page', '', 0),
(466, 1, '2016-07-06 19:01:01', '2016-07-06 16:01:01', '', 'Морской пейзаж', '', 'inherit', 'closed', 'closed', '', '465-revision-v1', '', '', '2016-07-06 19:01:01', '2016-07-06 16:01:01', '', 465, 'http://localhost/Ruslan14/2016/07/06/465-revision-v1/', 0, 'revision', '', 0),
(467, 1, '2016-07-06 19:01:51', '2016-07-06 16:01:51', '', 'Портрет', '', 'publish', 'closed', 'closed', '', 'portret', '', '', '2017-01-17 01:17:25', '2017-01-16 22:17:25', '', 0, 'http://localhost/Ruslan14/?page_id=467', 0, 'page', '', 0),
(468, 1, '2016-07-06 19:01:51', '2016-07-06 16:01:51', '', 'Портрет', '', 'inherit', 'closed', 'closed', '', '467-revision-v1', '', '', '2016-07-06 19:01:51', '2016-07-06 16:01:51', '', 467, 'http://localhost/Ruslan14/2016/07/06/467-revision-v1/', 0, 'revision', '', 0),
(472, 1, '2016-07-06 19:04:08', '2016-07-06 16:04:08', '', 'Натюрморт', '', 'inherit', 'closed', 'closed', '', '471-revision-v1', '', '', '2016-07-06 19:04:08', '2016-07-06 16:04:08', '', 471, 'http://localhost/Ruslan14/2016/07/06/471-revision-v1/', 0, 'revision', '', 0),
(470, 1, '2016-07-06 19:02:19', '2016-07-06 16:02:19', ' ', '', '', 'publish', 'closed', 'closed', '', '470', '', '', '2020-04-04 18:03:03', '2020-04-04 15:03:03', '', 0, 'http://localhost/Ruslan14/?p=470', 3, 'nav_menu_item', '', 0),
(471, 1, '2016-07-06 19:04:08', '2016-07-06 16:04:08', '', 'Натюрморт', '', 'publish', 'closed', 'closed', '', 'natyurmort', '', '', '2020-05-13 17:40:12', '2020-05-13 14:40:12', '', 0, 'http://localhost/Ruslan14/?page_id=471', 0, 'page', '', 0),
(474, 1, '2016-07-06 19:04:50', '2016-07-06 16:04:50', '', 'Городской пейзаж', '', 'inherit', 'closed', 'closed', '', '473-revision-v1', '', '', '2016-07-06 19:04:50', '2016-07-06 16:04:50', '', 473, 'http://localhost/Ruslan14/2016/07/06/473-revision-v1/', 0, 'revision', '', 0),
(475, 1, '2016-07-06 19:06:52', '2016-07-06 16:06:52', ' ', '', '', 'publish', 'closed', 'closed', '', '475', '', '', '2020-04-04 18:03:03', '2020-04-04 15:03:03', '', 0, 'http://localhost/Ruslan14/?p=475', 4, 'nav_menu_item', '', 0),
(476, 1, '2016-07-06 19:06:52', '2016-07-06 16:06:52', ' ', '', '', 'publish', 'closed', 'closed', '', '476', '', '', '2020-04-04 18:03:03', '2020-04-04 15:03:03', '', 0, 'http://localhost/Ruslan14/?p=476', 5, 'nav_menu_item', '', 0),
(478, 1, '2016-07-06 21:55:21', '2016-07-06 18:55:21', '', 'тест', '', 'inherit', 'closed', 'closed', '', '477-revision-v1', '', '', '2016-07-06 21:55:21', '2016-07-06 18:55:21', '', 477, 'http://localhost/Ruslan14/2016/07/06/477-revision-v1/', 0, 'revision', '', 0),
(482, 1, '2016-07-12 10:40:11', '2016-07-12 07:40:11', '', 'Заказ картины', '', 'inherit', 'closed', 'closed', '', '481-revision-v1', '', '', '2016-07-12 10:40:11', '2016-07-12 07:40:11', '', 481, 'http://localhost/Ruslan14/2016/07/12/481-revision-v1/', 0, 'revision', '', 0),
(484, 1, '2016-07-15 17:26:10', '2016-07-15 14:26:10', '', 'Письма', '', 'inherit', 'closed', 'closed', '', '483-revision-v1', '', '', '2016-07-15 17:26:10', '2016-07-15 14:26:10', '', 483, 'http://localhost/Ruslan14/2016/07/15/483-revision-v1/', 0, 'revision', '', 0),
(511, 1, '2017-01-11 13:31:00', '2017-01-11 10:31:00', 'Заказать картину можно оригинальную (более дорогой вариант) или напечатанную репродукцию на холсте (более дешёвый)', 'Информация', '', 'inherit', 'closed', 'closed', '', '507-autosave-v1', '', '', '2017-01-11 13:31:00', '2017-01-11 10:31:00', '', 507, 'http://localhost/Ruslan14/2017/01/11/507-autosave-v1/', 0, 'revision', '', 0),
(512, 1, '2017-01-11 13:31:29', '2017-01-11 10:31:29', 'Заказать картину можно как оригинальную (более дорогой вариант), так и напечатанную репродукцию на холсте (более дешевый вариант).', 'Информация', '', 'inherit', 'closed', 'closed', '', '507-revision-v1', '', '', '2017-01-11 13:31:29', '2017-01-11 10:31:29', '', 507, 'http://localhost/Ruslan14/2017/01/11/507-revision-v1/', 0, 'revision', '', 0),
(513, 1, '2017-01-11 17:09:47', '2017-01-11 14:09:47', '', 'paint', '', 'inherit', 'open', 'closed', '', 'paint', '', '', '2017-01-11 17:09:47', '2017-01-11 14:09:47', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2017/01/paint.png', 0, 'attachment', 'image/png', 0),
(514, 1, '2017-01-11 17:09:52', '2017-01-11 14:09:52', 'http://localhost/Ruslan14/wp-content/uploads/2017/01/cropped-paint.png', 'cropped-paint.png', '', 'inherit', 'open', 'closed', '', 'cropped-paint-png', '', '', '2017-01-11 17:09:52', '2017-01-11 14:09:52', '', 0, 'http://localhost/Ruslan14/wp-content/uploads/2017/01/cropped-paint.png', 0, 'attachment', 'image/png', 0),
(519, 1, '2017-02-28 20:39:39', '2017-02-28 17:39:39', '[theme-my-login]', 'Выйти', '', 'publish', 'closed', 'closed', '', 'logout', '', '', '2017-02-28 20:39:39', '2017-02-28 17:39:39', '', 0, 'http://localhost/Ruslan14/logout/', 0, 'page', '', 0),
(533, 1, '2020-04-04 18:03:03', '2020-04-04 15:03:03', ' ', '', '', 'publish', 'closed', 'closed', '', '533', '', '', '2020-04-04 18:03:03', '2020-04-04 15:03:03', '', 0, 'http://localhost/Ruslan14/?p=533', 9, 'nav_menu_item', '', 0),
(520, 1, '2017-02-28 20:39:39', '2017-02-28 17:39:39', '[theme-my-login]', 'Регистрация', '', 'publish', 'closed', 'closed', '', 'register', '', '', '2017-02-28 20:39:39', '2017-02-28 17:39:39', '', 0, 'http://localhost/Ruslan14/register/', 0, 'page', '', 0),
(521, 1, '2017-02-28 20:39:39', '2017-02-28 17:39:39', '[theme-my-login]', 'Забыли пароль?', '', 'publish', 'closed', 'closed', '', 'lostpassword', '', '', '2017-02-28 20:39:39', '2017-02-28 17:39:39', '', 0, 'http://localhost/Ruslan14/lostpassword/', 0, 'page', '', 0),
(522, 1, '2017-02-28 20:39:39', '2017-02-28 17:39:39', '[theme-my-login]', 'Сбросить пароль', '', 'publish', 'closed', 'closed', '', 'resetpass', '', '', '2017-02-28 20:39:39', '2017-02-28 17:39:39', '', 0, 'http://localhost/Ruslan14/resetpass/', 0, 'page', '', 0),
(528, 1, '2017-04-03 21:28:07', '2017-04-03 18:28:07', '', 'Подбор рамы для картины', '', 'publish', 'closed', 'closed', '', 'podbor-ramy-dlya-kartiny', '', '', '2017-04-03 21:28:07', '2017-04-03 18:28:07', '', 0, 'http://localhost/Ruslan14/?page_id=528', 0, 'page', '', 0),
(529, 1, '2017-04-03 21:28:07', '2017-04-03 18:28:07', '', 'Подбор рамы для картины', '', 'inherit', 'closed', 'closed', '', '528-revision-v1', '', '', '2017-04-03 21:28:07', '2017-04-03 18:28:07', '', 528, 'http://localhost/Ruslan14/2017/04/03/528-revision-v1/', 0, 'revision', '', 0),
(531, 1, '2020-04-04 18:02:29', '2020-04-04 15:02:29', '<p>Текст записи.</p>\n\n<!-- wp:image {\"id\":429,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/249106_1383720895199394_448409785_n.jpg\" alt=\"Дорожка\" class=\"wp-image-429\"/><figcaption>Дорожка</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Ещё текст.</p>\n<!-- /wp:paragraph -->', 'Запись блога', '', 'publish', 'open', 'open', '', 'zapis-bloga', '', '', '2020-04-13 23:23:56', '2020-04-13 20:23:56', '', 0, 'http://localhost/Ruslan14/?p=531', 0, 'post', '', 0),
(532, 1, '2020-04-04 18:02:29', '2020-04-04 15:02:29', 'Текст записи.', 'Запись блога', '', 'inherit', 'closed', 'closed', '', '531-revision-v1', '', '', '2020-04-04 18:02:29', '2020-04-04 15:02:29', '', 531, 'http://localhost/Ruslan14/2020/04/04/531-revision-v1/', 0, 'revision', '', 0),
(542, 1, '2020-04-13 23:23:50', '2020-04-13 20:23:50', '<p>Текст записи.</p>\n\n<!-- wp:image {\"id\":429,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/249106_1383720895199394_448409785_n.jpg\" alt=\"Дорожка\" class=\"wp-image-429\"/><figcaption>Дорожка</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Ещё текст.</p>\n<!-- /wp:paragraph -->', 'Запись блога', '', 'inherit', 'closed', 'closed', '', '531-revision-v1', '', '', '2020-04-13 23:23:50', '2020-04-13 20:23:50', '', 531, 'http://localhost/Ruslan14/2020/04/13/531-revision-v1/', 0, 'revision', '', 0),
(541, 1, '2020-04-13 23:23:24', '2020-04-13 20:23:24', '<p>Текст записи.</p>\n\n<!-- wp:image {\"id\":429,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/Ruslan14/wp-content/uploads/2016/07/249106_1383720895199394_448409785_n.jpg\" alt=\"Дорожка\" class=\"wp-image-429\"/><figcaption>Дорожка</figcaption></figure>\n<!-- /wp:image -->', 'Запись блога', '', 'inherit', 'closed', 'closed', '', '531-revision-v1', '', '', '2020-04-13 23:23:24', '2020-04-13 20:23:24', '', 531, 'http://localhost/Ruslan14/2020/04/13/531-revision-v1/', 0, 'revision', '', 0),
(540, 1, '2020-04-13 23:22:22', '2020-04-13 20:22:22', '<p>Текст записи.</p>\n\n<!-- wp:image {\"id\":539,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/Ruslan14/wp-content/uploads/2020/04/33617106_177047612922921_7863127556017356800_n.jpg\" alt=\"\" class=\"wp-image-539\"/></figure>\n<!-- /wp:image -->', 'Запись блога', '', 'inherit', 'closed', 'closed', '', '531-revision-v1', '', '', '2020-04-13 23:22:22', '2020-04-13 20:22:22', '', 531, 'http://localhost/Ruslan14/2020/04/13/531-revision-v1/', 0, 'revision', '', 0),
(543, 1, '2020-04-13 23:27:28', '2020-04-13 20:27:28', '<!-- wp:paragraph -->\n<p>гого</p>\n<!-- /wp:paragraph -->', 'Городской пейзаж', '', 'inherit', 'closed', 'closed', '', '473-revision-v1', '', '', '2020-04-13 23:27:28', '2020-04-13 20:27:28', '', 473, 'http://localhost/Ruslan14/2020/04/13/473-revision-v1/', 0, 'revision', '', 0),
(544, 1, '2020-04-13 23:31:26', '2020-04-13 20:31:26', '<!-- wp:paragraph -->\n<p>Текст 2</p>\n<!-- /wp:paragraph -->\n\n<p>Классический текст</p>\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=dI2QZwiUosE\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=dI2QZwiUosE\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:paragraph -->\n<p><strong>Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал — масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:more -->\n<!--more-->\n<!-- /wp:more -->\n\n<!-- wp:paragraph -->\n<p>Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей, и привычные для городского жителя серые улицы, окрашенные то мартовским низким солнцем, то вечерними фонарями, и внезапное буйство красок в букете весенних цветов. Когда смотришь на эти вроде бы обыденные сюжеты, мимо которых ежедневно проносишься в жизненной суете, то понимаешь, наконец, за что мы так любим наш город, и это серое небо, и эти сумрачные окраины, и весну, и саму жизнь</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей, и привычные для городского жителя серые улицы, окрашенные то мартовским низким солнцем, то вечерними фонарями, и внезапное буйство красок в букете весенних цветов. Когда смотришь на эти вроде бы обыденные сюжеты, мимо которых ежедневно проносишься в жизненной суете, то понимаешь, наконец, за что мы так любим наш город, и это серое небо, и эти сумрачные окраины, и весну, и саму жизнь</p>\n<!-- /wp:paragraph -->', 'Запись 2', '', 'publish', 'open', 'open', '', 'zapis-2', '', '', '2020-04-15 14:53:38', '2020-04-15 11:53:38', '', 0, 'http://localhost/Ruslan14/?p=544', 0, 'post', '', 0),
(545, 1, '2020-04-13 23:31:26', '2020-04-13 20:31:26', '<!-- wp:paragraph -->\n<p>Текст 2</p>\n<!-- /wp:paragraph -->\n\n<p>Классический текст</p>\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=dI2QZwiUosE\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=dI2QZwiUosE\n</div></figure>\n<!-- /wp:core-embed/youtube -->', 'Запись 2', '', 'inherit', 'closed', 'closed', '', '544-revision-v1', '', '', '2020-04-13 23:31:26', '2020-04-13 20:31:26', '', 544, 'http://localhost/Ruslan14/2020/04/13/544-revision-v1/', 0, 'revision', '', 0),
(546, 1, '2020-04-13 23:34:08', '2020-04-13 20:34:08', '<!-- wp:paragraph -->\n<p>Текст 2</p>\n<!-- /wp:paragraph -->\n\n<p>Классический текст</p>\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=dI2QZwiUosE\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=dI2QZwiUosE\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:paragraph -->\n<p><strong>Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал — масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей, и привычные для городского жителя серые улицы, окрашенные то мартовским низким солнцем, то вечерними фонарями, и внезапное буйство красок в букете весенних цветов. Когда смотришь на эти вроде бы обыденные сюжеты, мимо которых ежедневно проносишься в жизненной суете, то понимаешь, наконец, за что мы так любим наш город, и это серое небо, и эти сумрачные окраины, и весну, и саму жизнь</p>\n<!-- /wp:paragraph -->', 'Запись 2', '', 'inherit', 'closed', 'closed', '', '544-revision-v1', '', '', '2020-04-13 23:34:08', '2020-04-13 20:34:08', '', 544, 'http://localhost/Ruslan14/2020/04/13/544-revision-v1/', 0, 'revision', '', 0),
(547, 1, '2020-04-13 23:35:24', '2020-04-13 20:35:24', '<!-- wp:paragraph -->\n<p>Текст 2</p>\n<!-- /wp:paragraph -->\n\n<p>Классический текст</p>\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=dI2QZwiUosE\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=dI2QZwiUosE\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:paragraph -->\n<p><strong>Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал — масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей, и привычные для городского жителя серые улицы, окрашенные то мартовским низким солнцем, то вечерними фонарями, и внезапное буйство красок в букете весенних цветов. Когда смотришь на эти вроде бы обыденные сюжеты, мимо которых ежедневно проносишься в жизненной суете, то понимаешь, наконец, за что мы так любим наш город, и это серое небо, и эти сумрачные окраины, и весну, и саму жизнь</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей, и привычные для городского жителя серые улицы, окрашенные то мартовским низким солнцем, то вечерними фонарями, и внезапное буйство красок в букете весенних цветов. Когда смотришь на эти вроде бы обыденные сюжеты, мимо которых ежедневно проносишься в жизненной суете, то понимаешь, наконец, за что мы так любим наш город, и это серое небо, и эти сумрачные окраины, и весну, и саму жизнь</p>\n<!-- /wp:paragraph -->', 'Запись 2', '', 'inherit', 'closed', 'closed', '', '544-revision-v1', '', '', '2020-04-13 23:35:24', '2020-04-13 20:35:24', '', 544, 'http://localhost/Ruslan14/2020/04/13/544-revision-v1/', 0, 'revision', '', 0),
(548, 1, '2020-04-14 19:18:48', '2020-04-14 16:18:48', '3', '36652582_136900390531638_7590388753240162304_n', '2', 'inherit', 'open', 'closed', '', '36652582_136900390531638_7590388753240162304_n', '', '', '2020-04-14 19:19:02', '2020-04-14 16:19:02', '', 473, 'http://localhost/Ruslan14/wp-content/uploads/2020/04/36652582_136900390531638_7590388753240162304_n.jpg', 0, 'attachment', 'image/jpeg', 0),
(549, 1, '2020-04-14 20:48:20', '2020-04-14 17:48:20', '', 'Портрет', '', 'publish', 'closed', 'closed', '', 'portret-2', '', '', '2020-04-16 18:09:54', '2020-04-16 15:09:54', '', 0, 'http://localhost/Ruslan14/?page_id=549', 0, 'page', '', 0),
(550, 1, '2020-04-14 20:48:20', '2020-04-14 17:48:20', '', 'Портрет', '', 'inherit', 'closed', 'closed', '', '549-revision-v1', '', '', '2020-04-14 20:48:20', '2020-04-14 17:48:20', '', 549, 'http://localhost/Ruslan14/2020/04/14/549-revision-v1/', 0, 'revision', '', 0),
(552, 1, '2020-04-15 14:04:38', '2020-04-15 11:04:38', '<!-- wp:paragraph -->\n<p>Текст 2</p>\n<!-- /wp:paragraph -->\n\n<p>Классический текст</p>\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=dI2QZwiUosE\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=dI2QZwiUosE\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:paragraph -->\n<p><strong>Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал — масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей, и привычные для городского жителя серые улицы, окрашенные то мартовским низким солнцем, то вечерними фонарями, и внезапное буйство красок в букете весенних цветов. Когда смотришь на эти вроде бы обыденные сюжеты, мимо которых ежедневно проносишься в жизненной суете, то понимаешь, наконец, за что мы так любим наш город, и это серое небо, и эти сумрачные окраины, и весну, и саму жизнь</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей, и привычные для городского жителя серые улицы, окрашенные то мартовским низким солнцем, то вечерними фонарями, и внезапное буйство красок в букете весенних цветов. Когда смотришь на эти вроде бы обыденные сюжеты, мимо которых ежедневно проносишься в жизненной суете, то понимаешь, наконец, за что мы так любим наш город, и это серое небо, и эти сумрачные окраины, и весну, и саму жизнь</p>\n<!-- /wp:paragraph -->', 'Запись 2', '', 'inherit', 'closed', 'closed', '', '544-revision-v1', '', '', '2020-04-15 14:04:38', '2020-04-15 11:04:38', '', 544, 'http://localhost/Ruslan14/2020/04/15/544-revision-v1/', 0, 'revision', '', 0),
(551, 1, '2020-04-15 13:59:21', '2020-04-15 10:59:21', '<!-- wp:paragraph -->\n<p>Текст 2</p>\n<!-- /wp:paragraph -->\n\n<p>Классический текст</p>\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=dI2QZwiUosE\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=dI2QZwiUosE\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:paragraph -->\n<p><strong>Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал — масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:nextpage -->\n<!--nextpage-->\n<!-- /wp:nextpage -->\n\n<!-- wp:paragraph -->\n<p>Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей, и привычные для городского жителя серые улицы, окрашенные то мартовским низким солнцем, то вечерними фонарями, и внезапное буйство красок в букете весенних цветов. Когда смотришь на эти вроде бы обыденные сюжеты, мимо которых ежедневно проносишься в жизненной суете, то понимаешь, наконец, за что мы так любим наш город, и это серое небо, и эти сумрачные окраины, и весну, и саму жизнь</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей, и привычные для городского жителя серые улицы, окрашенные то мартовским низким солнцем, то вечерними фонарями, и внезапное буйство красок в букете весенних цветов. Когда смотришь на эти вроде бы обыденные сюжеты, мимо которых ежедневно проносишься в жизненной суете, то понимаешь, наконец, за что мы так любим наш город, и это серое небо, и эти сумрачные окраины, и весну, и саму жизнь</p>\n<!-- /wp:paragraph -->', 'Запись 2', '', 'inherit', 'closed', 'closed', '', '544-revision-v1', '', '', '2020-04-15 13:59:21', '2020-04-15 10:59:21', '', 544, 'http://localhost/Ruslan14/2020/04/15/544-revision-v1/', 0, 'revision', '', 0),
(553, 1, '2020-04-15 14:05:16', '2020-04-15 11:05:16', '<!-- wp:paragraph -->\n<p>Текст 2</p>\n<!-- /wp:paragraph -->\n\n<p>Классический текст</p>\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=dI2QZwiUosE\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=dI2QZwiUosE\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:paragraph -->\n<p><strong>Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал — масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:nextpage -->\n<!--nextpage-->\n<!-- /wp:nextpage -->\n\n<!-- wp:paragraph -->\n<p>Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей, и привычные для городского жителя серые улицы, окрашенные то мартовским низким солнцем, то вечерними фонарями, и внезапное буйство красок в букете весенних цветов. Когда смотришь на эти вроде бы обыденные сюжеты, мимо которых ежедневно проносишься в жизненной суете, то понимаешь, наконец, за что мы так любим наш город, и это серое небо, и эти сумрачные окраины, и весну, и саму жизнь</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей, и привычные для городского жителя серые улицы, окрашенные то мартовским низким солнцем, то вечерними фонарями, и внезапное буйство красок в букете весенних цветов. Когда смотришь на эти вроде бы обыденные сюжеты, мимо которых ежедневно проносишься в жизненной суете, то понимаешь, наконец, за что мы так любим наш город, и это серое небо, и эти сумрачные окраины, и весну, и саму жизнь</p>\n<!-- /wp:paragraph -->', 'Запись 2', '', 'inherit', 'closed', 'closed', '', '544-revision-v1', '', '', '2020-04-15 14:05:16', '2020-04-15 11:05:16', '', 544, 'http://localhost/Ruslan14/2020/04/15/544-revision-v1/', 0, 'revision', '', 0),
(554, 1, '2020-04-15 14:53:29', '2020-04-15 11:53:29', '<!-- wp:paragraph -->\n<p>Текст 2</p>\n<!-- /wp:paragraph -->\n\n<p>Классический текст</p>\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=dI2QZwiUosE\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=dI2QZwiUosE\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:paragraph -->\n<p><strong>Варламов </strong>родился и живет в Харькове. Окончил Харьковское художественное училище, где его руководителем был академик Г.С. Коробов. Работает в области станковой живописи, основной материал — масло. Участник многих всеукраинских и областных выставок. Работы находятся в частных коллекциях в Украине и за рубежом. Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:more -->\n<!--more-->\n<!-- /wp:more -->\n\n<!-- wp:paragraph -->\n<p>Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей, и привычные для городского жителя серые улицы, окрашенные то мартовским низким солнцем, то вечерними фонарями, и внезапное буйство красок в букете весенних цветов. Когда смотришь на эти вроде бы обыденные сюжеты, мимо которых ежедневно проносишься в жизненной суете, то понимаешь, наконец, за что мы так любим наш город, и это серое небо, и эти сумрачные окраины, и весну, и саму жизнь</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Особенно близки художнику жанры романтического пейзажа и натюрморта, в которых его привлекает прежде всего гармония и своеобразие колорита, настроения, заключенное во всем, к чему художник прикасается взглядом. Это и морские пейзажи с внезапно набежавшей волной и осколками солнечной дорожки, и туманные глубины леса средней полосы с узким ручейком между зарослей, и привычные для городского жителя серые улицы, окрашенные то мартовским низким солнцем, то вечерними фонарями, и внезапное буйство красок в букете весенних цветов. Когда смотришь на эти вроде бы обыденные сюжеты, мимо которых ежедневно проносишься в жизненной суете, то понимаешь, наконец, за что мы так любим наш город, и это серое небо, и эти сумрачные окраины, и весну, и саму жизнь</p>\n<!-- /wp:paragraph -->', 'Запись 2', '', 'inherit', 'closed', 'closed', '', '544-revision-v1', '', '', '2020-04-15 14:53:29', '2020-04-15 11:53:29', '', 544, 'http://localhost/Ruslan14/2020/04/15/544-revision-v1/', 0, 'revision', '', 0),
(555, 1, '2020-04-15 19:21:48', '2020-04-15 16:21:48', '<!-- wp:image {\"id\":561,\"sizeSlug\":\"large\",\"linkDestination\":\"media\"} -->\n<figure class=\"wp-block-image size-large\"><a href=\"http://localhost/Ruslan14/wp-content/uploads/2020/04/40460766_163610361193974_8597909637599068160_n.jpg\"><img src=\"http://localhost/Ruslan14/wp-content/uploads/2020/04/40460766_163610361193974_8597909637599068160_n-506x800.jpg\" alt=\"\" class=\"wp-image-561\"/></a></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Текст 3</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=aYofjTVC4O4\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=aYofjTVC4O4\n</div></figure>\n<!-- /wp:core-embed/youtube -->', 'Заголовок 3', '', 'publish', 'open', 'open', '', 'zagolovok-3', '', '', '2020-04-30 00:01:19', '2020-04-29 21:01:19', '', 0, 'http://localhost/Ruslan14/?p=555', 0, 'post', '', 0),
(556, 1, '2020-04-15 19:21:48', '2020-04-15 16:21:48', '<!-- wp:paragraph -->\n<p>Текст 3</p>\n<!-- /wp:paragraph -->', 'Заголовок 3', '', 'inherit', 'closed', 'closed', '', '555-revision-v1', '', '', '2020-04-15 19:21:48', '2020-04-15 16:21:48', '', 555, 'http://localhost/Ruslan14/2020/04/15/555-revision-v1/', 0, 'revision', '', 0),
(557, 1, '2020-04-16 23:13:23', '2020-04-16 20:13:23', '<!-- wp:paragraph -->\n<p>Контактный email Р. Варламова - r-varlamov@mail.ru</p>\n<!-- /wp:paragraph -->', 'Контакты', '', 'inherit', 'closed', 'closed', '', '456-revision-v1', '', '', '2020-04-16 23:13:23', '2020-04-16 20:13:23', '', 456, 'http://localhost/Ruslan14/2020/04/16/456-revision-v1/', 0, 'revision', '', 0),
(558, 1, '2020-04-16 23:13:51', '2020-04-16 20:13:51', '<!-- wp:paragraph -->\n<p>Контактный e-mail Р. Варламова - r-varlamov@mail.ru</p>\n<!-- /wp:paragraph -->', 'Контакты', '', 'inherit', 'closed', 'closed', '', '456-revision-v1', '', '', '2020-04-16 23:13:51', '2020-04-16 20:13:51', '', 456, 'http://localhost/Ruslan14/2020/04/16/456-revision-v1/', 0, 'revision', '', 0),
(559, 1, '2020-04-18 20:31:59', '2020-04-18 17:31:59', '<!-- wp:video -->\n<figure class=\"wp-block-video\"></figure>\n<!-- /wp:video -->', 'Главная', '', 'inherit', 'closed', 'closed', '', '4-autosave-v1', '', '', '2020-04-18 20:31:59', '2020-04-18 17:31:59', '', 4, 'http://localhost/Ruslan14/2020/04/18/4-autosave-v1/', 0, 'revision', '', 0),
(561, 1, '2020-04-18 20:47:02', '2020-04-18 17:47:02', '', '40460766_163610361193974_8597909637599068160_n', '', 'inherit', 'open', 'closed', '', '40460766_163610361193974_8597909637599068160_n', '', '', '2020-04-18 20:47:02', '2020-04-18 17:47:02', '', 555, 'http://localhost/Ruslan14/wp-content/uploads/2020/04/40460766_163610361193974_8597909637599068160_n.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(564, 1, '2020-04-30 00:01:11', '2020-04-29 21:01:11', '<!-- wp:image {\"id\":561,\"sizeSlug\":\"large\",\"linkDestination\":\"media\"} -->\n<figure class=\"wp-block-image size-large\"><a href=\"http://localhost/Ruslan14/wp-content/uploads/2020/04/40460766_163610361193974_8597909637599068160_n.jpg\"><img src=\"http://localhost/Ruslan14/wp-content/uploads/2020/04/40460766_163610361193974_8597909637599068160_n-506x800.jpg\" alt=\"\" class=\"wp-image-561\"/></a></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Текст 3</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=aYofjTVC4O4\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=aYofjTVC4O4\n</div></figure>\n<!-- /wp:core-embed/youtube -->', 'Заголовок 3', '', 'inherit', 'closed', 'closed', '', '555-revision-v1', '', '', '2020-04-30 00:01:11', '2020-04-29 21:01:11', '', 555, 'http://localhost/Ruslan14/2020/04/30/555-revision-v1/', 0, 'revision', '', 0),
(562, 1, '2020-04-18 20:56:31', '2020-04-18 17:56:31', '<!-- wp:image {\"id\":561,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/Ruslan14/wp-content/uploads/2020/04/40460766_163610361193974_8597909637599068160_n-506x800.jpg\" alt=\"\" class=\"wp-image-561\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Текст 3</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=aYofjTVC4O4\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=aYofjTVC4O4\n</div></figure>\n<!-- /wp:core-embed/youtube -->', 'Заголовок 3', '', 'inherit', 'closed', 'closed', '', '555-revision-v1', '', '', '2020-04-18 20:56:31', '2020-04-18 17:56:31', '', 555, 'http://localhost/Ruslan14/2020/04/18/555-revision-v1/', 0, 'revision', '', 0),
(567, 1, '2020-05-13 17:37:58', '2020-05-13 14:37:58', '', '56_tn', '', 'inherit', 'open', 'closed', '', '56_tn', '', '', '2020-05-13 17:37:58', '2020-05-13 14:37:58', '', 471, 'http://localhost/Ruslan14/wp-content/uploads/2020/05/56_tn.jpg', 0, 'attachment', 'image/jpeg', 0),
(568, 1, '2020-05-13 17:37:58', '2020-05-13 14:37:58', '', '193px-Будшир_хатан', '', 'inherit', 'open', 'closed', '', '193px-budshir_hatan', '', '', '2020-05-13 17:37:58', '2020-05-13 14:37:58', '', 471, 'http://localhost/Ruslan14/wp-content/uploads/2020/05/193px-Budshir_hatan.jpg', 0, 'attachment', 'image/jpeg', 0),
(569, 1, '2020-05-13 17:37:59', '2020-05-13 14:37:59', '', '200px-YuanEmperorAlbumAyurbarvadaBuyantuPortrait', '', 'inherit', 'open', 'closed', '', '200px-yuanemperoralbumayurbarvadabuyantuportrait', '', '', '2020-05-13 17:37:59', '2020-05-13 14:37:59', '', 471, 'http://localhost/Ruslan14/wp-content/uploads/2020/05/200px-YuanEmperorAlbumAyurbarvadaBuyantuPortrait.jpg', 0, 'attachment', 'image/jpeg', 0),
(570, 1, '2020-05-13 17:38:00', '2020-05-13 14:38:00', '', '200px-Есүхэй_баатар', '', 'inherit', 'open', 'closed', '', '200px-es-hej_baatar', '', '', '2020-05-13 17:38:00', '2020-05-13 14:38:00', '', 471, 'http://localhost/Ruslan14/wp-content/uploads/2020/05/200px-Es-hej_baatar.jpg', 0, 'attachment', 'image/jpeg', 0),
(571, 1, '2020-05-13 17:38:01', '2020-05-13 14:38:01', '', '230px-1000_Rurik', '', 'inherit', 'open', 'closed', '', '230px-1000_rurik', '', '', '2020-05-13 17:38:01', '2020-05-13 14:38:01', '', 471, 'http://localhost/Ruslan14/wp-content/uploads/2020/05/230px-1000_Rurik.jpg', 0, 'attachment', 'image/jpeg', 0),
(572, 1, '2020-05-13 17:38:02', '2020-05-13 14:38:02', '', '267px-Radzivill_Igor-945', '', 'inherit', 'open', 'closed', '', '267px-radzivill_igor-945', '', '', '2020-05-13 17:38:02', '2020-05-13 14:38:02', '', 471, 'http://localhost/Ruslan14/wp-content/uploads/2020/05/267px-Radzivill_Igor-945.jpg', 0, 'attachment', 'image/jpeg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Без рубрики', 'bez-rubriki', 0),
(2, 'Menu 1', 'menu-1', 0),
(3, 'Блог художника', 'blog-hudozhnika', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(118, 2, 0),
(120, 2, 0),
(458, 2, 0),
(464, 2, 0),
(476, 2, 0),
(470, 2, 0),
(475, 2, 0),
(510, 2, 0),
(531, 3, 0),
(533, 2, 0),
(544, 3, 0),
(555, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 9),
(3, 3, 'category', '', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', ''),
(13, 1, 'show_welcome_panel', '1'),
(15, 1, 'wp_dashboard_quick_press_last_post_id', '573'),
(16, 1, 'wp_user-settings', 'libraryContent=browse&advImgDetails=show&editor=tinymce'),
(17, 1, 'wp_user-settings-time', '1484059486'),
(18, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(19, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:\"add-post_tag\";}'),
(20, 1, 'closedpostboxes_page', 'a:0:{}'),
(21, 1, 'metaboxhidden_page', 'a:0:{}'),
(22, 1, 'nav_menu_recently_edited', '2'),
(33, 1, 'session_tokens', 'a:1:{s:64:\"4d848feed2dd66c0435e0541a4e9a17dd5162ea586c5362b4a5b0aa845f9e796\";a:4:{s:10:\"expiration\";i:1595268399;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101 Firefox/78.0\";s:5:\"login\";i:1595095599;}}'),
(27, 1, 'closedpostboxes_dashboard', 'a:1:{i:0;s:19:\"dashboard_right_now\";}'),
(28, 1, 'metaboxhidden_dashboard', 'a:0:{}'),
(26, 1, 'default_password_nag', ''),
(29, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BIJnbMpxr2qnqjNQvC9gBR9S7NOrql/', 'admin', 'arhibober@gmail.com', '', '2016-07-03 13:55:44', '', 0, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_lightbox_photoswipe_img`
--
ALTER TABLE `wp_lightbox_photoswipe_img`
  ADD PRIMARY KEY (`imgkey`),
  ADD KEY `idx_created` (`created`);

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7573;

--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1243;

--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=575;

--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
