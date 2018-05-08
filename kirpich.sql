-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 08 2018 г., 16:24
-- Версия сервера: 5.7.18
-- Версия PHP: 7.1.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kirpich`
--

-- --------------------------------------------------------

--
-- Структура таблицы `evo_active_users`
--

CREATE TABLE `evo_active_users` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `action` varchar(10) NOT NULL DEFAULT '',
  `id` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data about last user action.';

--
-- Дамп данных таблицы `evo_active_users`
--

INSERT INTO `evo_active_users` (`sid`, `internalKey`, `username`, `lasthit`, `action`, `id`) VALUES
('cdpo66arovbgnjd5du9ee8eteu', 1, 'admin', 1525537597, '67', 59);

-- --------------------------------------------------------

--
-- Структура таблицы `evo_active_user_locks`
--

CREATE TABLE `evo_active_user_locks` (
  `id` int(10) NOT NULL,
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `elementType` int(1) NOT NULL DEFAULT '0',
  `elementId` int(10) NOT NULL DEFAULT '0',
  `lasthit` int(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data about locked elements.';

-- --------------------------------------------------------

--
-- Структура таблицы `evo_active_user_sessions`
--

CREATE TABLE `evo_active_user_sessions` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data about valid user sessions.';

--
-- Дамп данных таблицы `evo_active_user_sessions`
--

INSERT INTO `evo_active_user_sessions` (`sid`, `internalKey`, `lasthit`, `ip`) VALUES
('cdpo66arovbgnjd5du9ee8eteu', 1, 1525537596, '::1');

-- --------------------------------------------------------

--
-- Структура таблицы `evo_categories`
--

CREATE TABLE `evo_categories` (
  `id` int(11) NOT NULL,
  `category` varchar(45) NOT NULL DEFAULT '',
  `rank` int(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Categories to be used snippets,tv,chunks, etc';

--
-- Дамп данных таблицы `evo_categories`
--

INSERT INTO `evo_categories` (`id`, `category`, `rank`) VALUES
(1, 'SEO', 0),
(2, 'Templates', 0),
(3, 'Js', 0),
(4, 'Manager and Admin', 0),
(5, 'Navigation', 0),
(6, 'Content', 0),
(7, 'Блоки', 0),
(8, 'Шапка', 0),
(9, 'Слайды', 0),
(10, 'Элементы', 0),
(11, 'Формы', 0),
(12, 'Товары', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `evo_documentgroup_names`
--

CREATE TABLE `evo_documentgroup_names` (
  `id` int(10) NOT NULL,
  `name` varchar(245) NOT NULL DEFAULT '',
  `private_memgroup` tinyint(4) DEFAULT '0' COMMENT 'determine whether the document group is private to manager users',
  `private_webgroup` tinyint(4) DEFAULT '0' COMMENT 'determines whether the document is private to web users'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

--
-- Дамп данных таблицы `evo_documentgroup_names`
--

INSERT INTO `evo_documentgroup_names` (`id`, `name`, `private_memgroup`, `private_webgroup`) VALUES
(1, 'Site Admin Pages', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `evo_document_groups`
--

CREATE TABLE `evo_document_groups` (
  `id` int(10) NOT NULL,
  `document_group` int(10) NOT NULL DEFAULT '0',
  `document` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

--
-- Дамп данных таблицы `evo_document_groups`
--

INSERT INTO `evo_document_groups` (`id`, `document_group`, `document`) VALUES
(1, 1, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `evo_event_log`
--

CREATE TABLE `evo_event_log` (
  `id` int(11) NOT NULL,
  `eventid` int(11) DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1- information, 2 - warning, 3- error',
  `user` int(11) NOT NULL DEFAULT '0' COMMENT 'link to user table',
  `usertype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - manager, 1 - web',
  `source` varchar(50) NOT NULL DEFAULT '',
  `description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores event and error logs';

--
-- Дамп данных таблицы `evo_event_log`
--

INSERT INTO `evo_event_log` (`id`, `eventid`, `createdon`, `type`, `user`, `usertype`, `source`, `description`) VALUES
(1, 0, 1525118020, 3, 1, 0, 'Системные файлы были изменены.', 'Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php) index.php, .htaccess, manager/index.php, manager/includes/config.inc.php');

-- --------------------------------------------------------

--
-- Структура таблицы `evo_jot_content`
--

CREATE TABLE `evo_jot_content` (
  `id` int(10) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tagid` varchar(50) DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  `uparent` int(10) NOT NULL DEFAULT '0',
  `parent` int(10) NOT NULL DEFAULT '0',
  `flags` varchar(25) DEFAULT NULL,
  `secip` varchar(32) DEFAULT NULL,
  `sechash` varchar(32) DEFAULT NULL,
  `content` mediumtext,
  `customfields` mediumtext,
  `mode` int(1) NOT NULL DEFAULT '1',
  `createdby` int(10) NOT NULL DEFAULT '0',
  `createdon` int(20) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  `editedon` int(20) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `deletedon` int(20) NOT NULL DEFAULT '0',
  `deletedby` int(10) NOT NULL DEFAULT '0',
  `publishedon` int(20) NOT NULL DEFAULT '0',
  `publishedby` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `evo_jot_content`
--

INSERT INTO `evo_jot_content` (`id`, `title`, `tagid`, `published`, `uparent`, `parent`, `flags`, `secip`, `sechash`, `content`, `customfields`, `mode`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`) VALUES
(9, 'The first comment', '', 1, 9, 0, '', '87.211.130.14', 'edb75dab198ff302efbf2f60e548c0b3', 'This is the first comment.', '<custom><name></name><email></email></custom>', 0, 0, 1160420310, 0, 0, 0, 0, 0, 0, 0),
(10, 'Second comment', '', 1, 9, 0, '', '87.211.130.14', 'edb75dab198ff302efbf2f60e548c0b3', 'This is the second comment and uses an alternate row color. I also supplied a name, but i\'m not logged in.', '<custom><name>Armand</name><email></email></custom>', 0, 0, 1160420453, 0, 0, 0, 0, 0, 0, 0),
(11, 'No abuse', '', 1, 9, 0, '', '87.211.130.14', 'edb75dab198ff302efbf2f60e548c0b3', 'Notice that I can\'t abuse <b>html</b>, ,  or [+placeholder+] tags.\r\n\r\nA new line also doesn\'t come unnoticed.', '<custom><name>Armand</name><email></email></custom>', 0, 0, 1160420681, 0, 0, 0, 0, 0, 0, 0),
(12, 'Posting when logged in', '', 1, 9, 0, '', '87.211.130.14', '58fade927c1df50ba6131f2b0e53c120', 'When you are logged in your own posts have a special color so you can easily spot them from the comment view. \r\n\r\nThe form also does not display any guest fields when logged in.', '<custom></custom>', 0, -1, 1160421310, 0, 0, 0, 0, 0, 0, 0),
(13, 'Managers', '', 1, 9, 0, '', '87.211.130.14', '91e230cf219e3ade10f32d6a41d0bd4d', 'Comments posted when only logged in as a manager user will use your manager name.\r\n\r\nModerators options are always shown when you are logged in as manager user.', '<custom></custom>', 0, 1, 1160421487, 0, 0, 0, 0, 0, 0, 0),
(14, 'Moderation', '', 1, 9, 0, '', '87.211.130.14', '58fade927c1df50ba6131f2b0e53c120', 'In this setup the Site Admins group is defined as being the moderator for this particular comment view. These users will have extra moderation options \r\n\r\nManager users, Moderators or Trusted users can post bad words like: dotNet.', '<custom></custom>', 0, -1, 1160422081, 0, 0, 0, 0, 0, 0, 0),
(15, 'I\'m untrusted', '', 0, 9, 0, '', '87.211.130.14', 'edb75dab198ff302efbf2f60e548c0b3', 'Untrusted users however can NOT post bad words like: dotNet. When they do the posts will be unpublished.', '<custom><name></name><email></email></custom>', 0, 0, 1160422167, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `evo_jot_subscriptions`
--

CREATE TABLE `evo_jot_subscriptions` (
  `id` mediumint(10) NOT NULL,
  `uparent` mediumint(10) NOT NULL DEFAULT '0',
  `tagid` varchar(50) NOT NULL DEFAULT '',
  `userid` mediumint(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `evo_manager_log`
--

CREATE TABLE `evo_manager_log` (
  `id` int(10) NOT NULL,
  `timestamp` int(20) NOT NULL DEFAULT '0',
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `action` int(10) NOT NULL DEFAULT '0',
  `itemid` varchar(10) DEFAULT '0',
  `itemname` varchar(255) DEFAULT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(15) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains a record of user interaction.';

--
-- Дамп данных таблицы `evo_manager_log`
--

INSERT INTO `evo_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(1, 1524839269, 1, 'admin', 58, '-', 'MODX', 'Logged in', NULL, NULL),
(2, 1524839273, 1, 'admin', 17, '-', '-', 'Editing settings', NULL, NULL),
(3, 1524839383, 1, 'admin', 30, '-', '-', 'Saving settings', NULL, NULL),
(4, 1524840002, 1, 'admin', 58, '-', 'MODX', 'Logged in', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(5, 1524840004, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(6, 1524840013, 1, 'admin', 27, '1', 'Home', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(7, 1524840037, 1, 'admin', 27, '2', 'Blog', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(8, 1524840049, 1, 'admin', 27, '1', 'Home', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(9, 1524840054, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(10, 1524840104, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(11, 1524841167, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(12, 1524841173, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(13, 1524841700, 1, 'admin', 20, '-', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(14, 1524841700, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(15, 1524841739, 1, 'admin', 27, '1', 'Home', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(16, 1524841748, 1, 'admin', 27, '1', 'Home', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(17, 1524841753, 1, 'admin', 5, '1', 'Home', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(18, 1524841753, 1, 'admin', 3, '1', 'Home', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(19, 1524841867, 1, 'admin', 27, '1', 'Home', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(20, 1524841879, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(21, 1524841882, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(22, 1524842295, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(23, 1524842295, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(24, 1524842298, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(25, 1524842323, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(26, 1524842324, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(27, 1524846670, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(28, 1524846684, 1, 'admin', 27, '1', 'Home', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(29, 1524846692, 1, 'admin', 27, '1', 'Home', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(30, 1524846748, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(31, 1524846790, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(32, 1524846794, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(33, 1524846806, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(34, 1524846841, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(35, 1524846841, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(36, 1524847016, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(37, 1524847019, 1, 'admin', 16, '3', 'Minimal Template', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(38, 1524847023, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(39, 1524847024, 1, 'admin', 16, '4', 'EVO startup - Bootstrap', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(40, 1524847063, 1, 'admin', 27, '32', 'Design', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(41, 1524847081, 1, 'admin', 27, '15', 'EVO Features', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(42, 1524847086, 1, 'admin', 27, '22', 'Menus and Lists', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(43, 1524847108, 1, 'admin', 27, '16', 'Ajax', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(44, 1524847110, 1, 'admin', 27, '14', 'Content Management', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(45, 1524847117, 1, 'admin', 27, '1', 'Home', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(46, 1524847147, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(47, 1524847172, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(48, 1524847172, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(49, 1524847180, 1, 'admin', 16, '3', 'Minimal Template', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(50, 1524847186, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(51, 1524847196, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(52, 1524847204, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(53, 1524847204, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(54, 1524847216, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(55, 1524847231, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(56, 1524847231, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(57, 1524847325, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(58, 1524847335, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(59, 1524847335, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(60, 1524847350, 1, 'admin', 16, '3', 'Minimal Template', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(61, 1524847355, 1, 'admin', 20, '3', 'Minimal Template', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(62, 1524847355, 1, 'admin', 16, '3', 'Minimal Template', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(63, 1524847364, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(64, 1524847513, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(65, 1524847513, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(66, 1524847744, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(67, 1524847744, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(68, 1524847806, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(69, 1524847806, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(70, 1524847938, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(71, 1524847938, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(72, 1524848335, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(73, 1524848345, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(74, 1524848374, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(75, 1524848394, 1, 'admin', 79, '-', 'header_kirpich', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(76, 1524848394, 1, 'admin', 78, '16', 'header_kirpich', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(77, 1524848406, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(78, 1524848406, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(79, 1524848437, 1, 'admin', 79, '16', 'header_kirpich', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(80, 1524848437, 1, 'admin', 78, '16', 'header_kirpich', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(81, 1524848979, 1, 'admin', 79, '16', 'header_kirpich', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(82, 1524848979, 1, 'admin', 78, '16', 'header_kirpich', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(83, 1524849748, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(84, 1524849748, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(85, 1524849797, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(86, 1524849798, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(87, 1524849814, 1, 'admin', 27, '1', 'Home', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(88, 1524849894, 1, 'admin', 5, '1', 'Кирпич', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(89, 1524849894, 1, 'admin', 27, '1', 'Кирпич', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(90, 1524850150, 1, 'admin', 22, '2', 'DLMenu', 'Editing Snippet', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(91, 1524850171, 1, 'admin', 78, '14', 'ContactForm', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(92, 1524850207, 1, 'admin', 102, '12', 'evoAjax', 'Edit plugin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(93, 1524850235, 1, 'admin', 27, '1', 'Кирпич', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(94, 1524850245, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(95, 1524850500, 1, 'admin', 106, '-', '-', 'Viewing Modules', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(96, 1524850510, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(97, 1524850544, 1, 'admin', 102, '13', 'CodeMirror', 'Edit plugin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(98, 1524850567, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(99, 1524868794, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(100, 1524868867, 1, 'admin', 27, '1', 'Кирпич', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(101, 1524868891, 1, 'admin', 120, '-', '-', 'Idle (unknown)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(102, 1524868905, 1, 'admin', 120, '-', '-', 'Idle (unknown)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(103, 1524868941, 1, 'admin', 106, '-', '-', 'Viewing Modules', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(104, 1524868944, 1, 'admin', 107, '-', 'Новый модуль', 'Create new module', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(105, 1524870305, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(106, 1524870401, 1, 'admin', 5, '-', 'Телефон', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(107, 1524870401, 1, 'admin', 27, '50', 'Телефон', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(108, 1524870422, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(109, 1524870497, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(110, 1524870504, 1, 'admin', 6, '50', 'Телефон', 'Deleting resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(111, 1524870504, 1, 'admin', 3, '1', 'Кирпич', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(112, 1524870517, 1, 'admin', 3, '1', 'Кирпич', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(113, 1524870520, 1, 'admin', 27, '50', 'Телефон', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(114, 1524870524, 1, 'admin', 6, '50', 'Телефон', 'Deleting resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(115, 1524870524, 1, 'admin', 3, '1', 'Кирпич', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(116, 1524870531, 1, 'admin', 3, '1', 'Кирпич', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(117, 1524870542, 1, 'admin', 27, '50', 'Телефон', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(118, 1524870545, 1, 'admin', 64, '-', '-', 'Removing deleted content', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(119, 1524870645, 1, 'admin', 27, '1', 'Кирпич', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(120, 1524870657, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(121, 1524870676, 1, 'admin', 5, '-', 'Слайдер в шапке', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(122, 1524870676, 1, 'admin', 27, '51', 'Слайдер в шапке', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(123, 1524870679, 1, 'admin', 27, '1', 'Кирпич', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(124, 1524870682, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(125, 1524870699, 1, 'admin', 5, '-', '1 слайд', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(126, 1524870699, 1, 'admin', 27, '52', '1 слайд', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(127, 1524870737, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(128, 1524870804, 1, 'admin', 302, '-', 'slider_header_img', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(129, 1524870804, 1, 'admin', 301, '5', 'slider_header_img', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(130, 1524870812, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(131, 1524870848, 1, 'admin', 20, '-', 'header_slider', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(132, 1524870848, 1, 'admin', 16, '6', 'header_slider', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(133, 1524870866, 1, 'admin', 27, '52', '1 слайд', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(134, 1524870889, 1, 'admin', 301, '5', 'slider_header_img', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(135, 1524870894, 1, 'admin', 302, '5', 'slider_header_img', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(136, 1524870894, 1, 'admin', 301, '5', 'slider_header_img', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(137, 1524870922, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(138, 1524870936, 1, 'admin', 301, '5', 'slider_header_img', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(139, 1524870936, 1, 'admin', 301, '5', 'slider_header_img', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(140, 1524870947, 1, 'admin', 78, '16', 'header_kirpich', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(141, 1524870962, 1, 'admin', 79, '16', 'header_kirpich', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(142, 1524870962, 1, 'admin', 78, '16', 'header_kirpich', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(143, 1524870998, 1, 'admin', 79, '-', 'header_slider', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(144, 1524870998, 1, 'admin', 78, '17', 'header_slider', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(145, 1524871072, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(146, 1524871160, 1, 'admin', 79, '17', 'header_slider', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(147, 1524871160, 1, 'admin', 78, '17', 'header_slider', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(148, 1524871174, 1, 'admin', 78, '17', 'header_slider', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(149, 1524871200, 1, 'admin', 79, '-', 'header_slider_slide', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(150, 1524871200, 1, 'admin', 78, '18', 'header_slider_slide', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(151, 1524871268, 1, 'admin', 79, '17', 'header_slider', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(152, 1524871268, 1, 'admin', 78, '17', 'header_slider', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(153, 1524871277, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(154, 1524871286, 1, 'admin', 78, '16', 'header_kirpich', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(155, 1524871314, 1, 'admin', 79, '16', 'header_kirpich', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(156, 1524871315, 1, 'admin', 78, '16', 'header_kirpich', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(157, 1524871365, 1, 'admin', 27, '52', '1 слайд', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(158, 1524871373, 1, 'admin', 27, '52', '1 слайд', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(159, 1524871376, 1, 'admin', 5, '52', '1 слайд', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(160, 1524871376, 1, 'admin', 27, '52', '1 слайд', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(161, 1524871512, 1, 'admin', 27, '52', '1 слайд', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(162, 1524871516, 1, 'admin', 5, '52', '1 слайд', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(163, 1524871517, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(164, 1524871522, 1, 'admin', 27, '52', '1 слайд', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(165, 1524871525, 1, 'admin', 27, '52', '1 слайд', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(166, 1524871536, 1, 'admin', 5, '52', '1 слайд', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(167, 1524871536, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(168, 1524871555, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(169, 1524871563, 1, 'admin', 80, '1', 'header', 'Deleting Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(170, 1524871563, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(171, 1524871573, 1, 'admin', 78, '17', 'header_slider', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(172, 1524871586, 1, 'admin', 79, '17', 'header_slider', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(173, 1524871586, 1, 'admin', 78, '17', 'header_slider', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(174, 1524871587, 1, 'admin', 79, '17', 'header_slider', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(175, 1524871588, 1, 'admin', 78, '17', 'header_slider', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(176, 1524871636, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(177, 1524871653, 1, 'admin', 27, '51', 'Слайдер в шапке', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(178, 1524871659, 1, 'admin', 27, '51', 'Слайдер в шапке', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(179, 1524871732, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(180, 1524871738, 1, 'admin', 301, '5', 'slider_header_img', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(181, 1524871867, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(182, 1524871879, 1, 'admin', 16, '6', 'header_slider', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(183, 1524871881, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(184, 1524871902, 1, 'admin', 301, '5', 'slider_header_img', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(185, 1524871911, 1, 'admin', 302, '5', 'slider_header_img', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(186, 1524871911, 1, 'admin', 301, '5', 'slider_header_img', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(187, 1524871966, 1, 'admin', 27, '52', '1 слайд', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(188, 1524871980, 1, 'admin', 5, '52', '1 слайд', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(189, 1524871980, 1, 'admin', 27, '52', '1 слайд', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(190, 1524871999, 1, 'admin', 27, '51', 'Слайдер в шапке', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(191, 1524872023, 1, 'admin', 5, '51', 'Слайдер в шапке', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(192, 1524872024, 1, 'admin', 27, '51', 'Слайдер в шапке', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(193, 1524872043, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(194, 1524872065, 1, 'admin', 78, '17', 'header_slider', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(195, 1524872111, 1, 'admin', 27, '51', 'Слайдер в шапке', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(196, 1524872160, 1, 'admin', 16, '6', 'header_slider', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(197, 1524872246, 1, 'admin', 78, '17', 'header_slider', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(198, 1524872252, 1, 'admin', 80, '17', 'header_slider', 'Deleting Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(199, 1524872252, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(200, 1524872263, 1, 'admin', 78, '16', 'header_kirpich', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(201, 1524872273, 1, 'admin', 79, '16', 'header_kirpich', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(202, 1524872273, 1, 'admin', 78, '16', 'header_kirpich', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(203, 1524872307, 1, 'admin', 23, '-', 'Новый сниппет', 'Creating a new Snippet', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(204, 1524874146, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(205, 1524874165, 1, 'admin', 78, '18', 'header_slider_slide', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(206, 1524874174, 1, 'admin', 78, '16', 'header_kirpich', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(207, 1524874452, 1, 'admin', 79, '16', 'header_kirpich', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(208, 1524874452, 1, 'admin', 78, '16', 'header_kirpich', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(209, 1524874474, 1, 'admin', 27, '52', '1 слайд', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(210, 1524874491, 1, 'admin', 27, '51', 'Слайдер в шапке', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(211, 1524874497, 1, 'admin', 27, '52', '1 слайд', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(212, 1524874515, 1, 'admin', 78, '16', 'header_kirpich', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(213, 1524874520, 1, 'admin', 79, '16', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(214, 1524874520, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(215, 1524874530, 1, 'admin', 79, '16', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(216, 1524874531, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(217, 1524874546, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(218, 1524874555, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(219, 1524874555, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(220, 1524874603, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(221, 1524874630, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(222, 1524874630, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(223, 1524874646, 1, 'admin', 20, '-', 'products', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(224, 1524874647, 1, 'admin', 16, '7', 'products', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(225, 1524874659, 1, 'admin', 21, '7', 'products', 'Deleting template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(226, 1524874659, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(227, 1524874664, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(228, 1524874681, 1, 'admin', 79, '-', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(229, 1524874681, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(230, 1524902728, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(231, 1524902728, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(232, 1524902949, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(233, 1524902974, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(234, 1524902993, 1, 'admin', 79, '-', 'sertifics', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(235, 1524902994, 1, 'admin', 78, '20', 'sertifics', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(236, 1524902997, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(237, 1524902997, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(238, 1524903015, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(239, 1524903015, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(240, 1524903020, 1, 'admin', 79, '20', 'sertifics', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(241, 1524903021, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(242, 1524903048, 1, 'admin', 79, '-', 'calc', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(243, 1524903048, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(244, 1524903082, 1, 'admin', 79, '-', 'partners', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(245, 1524903082, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(246, 1524903128, 1, 'admin', 79, '-', 'guarant', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(247, 1524903129, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(248, 1524917374, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(249, 1524917375, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(250, 1524917420, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36');
INSERT INTO `evo_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(251, 1524917420, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(252, 1524917436, 1, 'admin', 301, '5', 'slider_header_img', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(253, 1524917445, 1, 'admin', 303, '5', 'slider_header_img', 'Delete Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(254, 1524917446, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(255, 1524917460, 1, 'admin', 80, '18', 'header_slider_slide', 'Deleting Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(256, 1524917460, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(257, 1524917487, 1, 'admin', 120, '-', '-', 'Idle (unknown)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(258, 1524917526, 1, 'admin', 120, '-', '-', 'Idle (unknown)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(259, 1524917535, 1, 'admin', 120, '-', '-', 'Idle (unknown)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(260, 1524917592, 1, 'admin', 6, '51', 'Слайдер в шапке', 'Deleting resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(261, 1524917592, 1, 'admin', 3, '51', 'Слайдер в шапке', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(262, 1524917596, 1, 'admin', 64, '-', '-', 'Removing deleted content', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(263, 1524917598, 1, 'admin', 27, '1', 'Кирпич', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(264, 1524917600, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(265, 1524917615, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(266, 1524917618, 1, 'admin', 5, '-', 'Шапка', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(267, 1524917618, 1, 'admin', 27, '53', 'Шапка', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(268, 1524917641, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(269, 1524917939, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(270, 1524917968, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(271, 1524917971, 1, 'admin', 5, '-', 'Слайдер', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(272, 1524917971, 1, 'admin', 27, '54', 'Слайдер', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(273, 1524917977, 1, 'admin', 27, '54', 'Слайдер', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(274, 1524917994, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(275, 1524918005, 1, 'admin', 79, '16', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(276, 1524918005, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(277, 1524918032, 1, 'admin', 79, '16', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(278, 1524918032, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(279, 1524918082, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(280, 1524918087, 1, 'admin', 5, '-', 'Слайд 1', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(281, 1524918087, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(282, 1524918092, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(283, 1524918103, 1, 'admin', 5, '55', 'Слайд 1', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(284, 1524918103, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(285, 1524918110, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(286, 1524918114, 1, 'admin', 5, '-', 'Слайд 2', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(287, 1524918114, 1, 'admin', 27, '56', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(288, 1524918125, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(289, 1524918146, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(290, 1524918160, 1, 'admin', 16, '6', 'header_slider', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(291, 1524918183, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(292, 1524918220, 1, 'admin', 79, '16', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(293, 1524918220, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(294, 1524918228, 1, 'admin', 79, '16', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(295, 1524918228, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(296, 1524918274, 1, 'admin', 20, '6', 'header_slider__elem', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(297, 1524918274, 1, 'admin', 16, '6', 'header_slider__elem', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(298, 1524918279, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(299, 1524918283, 1, 'admin', 5, '55', 'Слайд 1', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(300, 1524918283, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(301, 1524918362, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(302, 1524918373, 1, 'admin', 22, '5', 'DocLister', 'Editing Snippet', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(303, 1524918422, 1, 'admin', 16, '6', 'header_slider__elem', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(304, 1524918431, 1, 'admin', 120, '-', '-', 'Idle (unknown)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(305, 1524918457, 1, 'admin', 120, '-', '-', 'Idle (unknown)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(306, 1524918478, 1, 'admin', 120, '-', '-', 'Idle (unknown)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(307, 1524918498, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(308, 1524918513, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(309, 1524918534, 1, 'admin', 79, '-', 'header_slider__elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(310, 1524918534, 1, 'admin', 78, '24', 'header_slider__elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(311, 1524918539, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(312, 1524918544, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(313, 1524918547, 1, 'admin', 27, '56', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(314, 1524918551, 1, 'admin', 27, '56', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(315, 1524918584, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(316, 1524918648, 1, 'admin', 302, '-', 'Изображения слайда в шапке', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(317, 1524918648, 1, 'admin', 301, '6', 'Изображения слайда в шапке', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(318, 1524918661, 1, 'admin', 78, '24', 'header_slider__elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(319, 1524918689, 1, 'admin', 79, '24', 'header_slider__elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(320, 1524918689, 1, 'admin', 78, '24', 'header_slider__elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(321, 1524918704, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(322, 1524918741, 1, 'admin', 20, '-', 'Слайд в слайдере (шапка)', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(323, 1524918741, 1, 'admin', 16, '8', 'Слайд в слайдере (шапка)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(324, 1524918744, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(325, 1524918752, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(326, 1524918764, 1, 'admin', 16, '8', 'Слайд в слайдере (шапка)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(327, 1524918769, 1, 'admin', 20, '8', 'Слайд в слайдере (шапка)', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(328, 1524918769, 1, 'admin', 16, '8', 'Слайд в слайдере (шапка)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(329, 1524918771, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(330, 1524918771, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(331, 1524918777, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(332, 1524918807, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(333, 1524918819, 1, 'admin', 5, '55', 'Слайд 1', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(334, 1524918819, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(335, 1524918979, 1, 'admin', 78, '24', 'header_slider__elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(336, 1524918985, 1, 'admin', 79, '24', 'header_slider__elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(337, 1524918985, 1, 'admin', 78, '24', 'header_slider__elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(338, 1524919017, 1, 'admin', 5, '55', 'Слайд 1', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(339, 1524919017, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(340, 1524919041, 1, 'admin', 79, '24', 'header_slider__elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(341, 1524919041, 1, 'admin', 78, '24', 'header_slider__elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(342, 1524919108, 1, 'admin', 79, '24', 'header_slider__elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(343, 1524919108, 1, 'admin', 78, '24', 'header_slider__elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(344, 1524919122, 1, 'admin', 79, '24', 'header_slider__elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(345, 1524919122, 1, 'admin', 78, '24', 'header_slider__elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(346, 1524919223, 1, 'admin', 79, '24', 'header_slider__elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(347, 1524919224, 1, 'admin', 78, '24', 'header_slider__elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(348, 1524919252, 1, 'admin', 79, '24', 'header_slider__elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(349, 1524919253, 1, 'admin', 78, '24', 'header_slider__elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(350, 1524919597, 1, 'admin', 79, '24', 'header_slider__elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(351, 1524919597, 1, 'admin', 78, '24', 'header_slider__elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(352, 1524919623, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(353, 1524919648, 1, 'admin', 79, '24', 'header_slider__elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(354, 1524919649, 1, 'admin', 78, '24', 'header_slider__elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(355, 1524919679, 1, 'admin', 79, '24', 'header_slider__elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(356, 1524919679, 1, 'admin', 78, '24', 'header_slider__elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(357, 1524919687, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(358, 1524919710, 1, 'admin', 78, '24', 'header_slider__elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(359, 1524919715, 1, 'admin', 79, '24', 'header_slider__elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(360, 1524919715, 1, 'admin', 78, '24', 'header_slider__elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(361, 1524919760, 1, 'admin', 16, '6', 'header_slider__elem', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(362, 1524919796, 1, 'admin', 16, '6', 'header_slider__elem', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(363, 1524919803, 1, 'admin', 27, '56', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(364, 1524919809, 1, 'admin', 27, '56', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(365, 1524919811, 1, 'admin', 5, '56', 'Слайд 2', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(366, 1524919811, 1, 'admin', 27, '56', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(367, 1524919814, 1, 'admin', 16, '6', 'header_slider__elem', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(368, 1524919817, 1, 'admin', 21, '6', 'header_slider__elem', 'Deleting template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(369, 1524919818, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(370, 1524919854, 1, 'admin', 120, '-', '-', 'Idle (unknown)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(371, 1524919878, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(372, 1524919885, 1, 'admin', 79, '16', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(373, 1524919885, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(374, 1524919929, 1, 'admin', 79, '16', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(375, 1524919929, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(376, 1524919936, 1, 'admin', 16, '8', 'Слайд в слайдере (шапка)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(377, 1524919948, 1, 'admin', 78, '24', 'header_slider__elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(378, 1524919959, 1, 'admin', 79, '24', 'header_slider__elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(379, 1524919959, 1, 'admin', 78, '24', 'header_slider__elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(380, 1524919966, 1, 'admin', 16, '8', 'Слайд в слайдере (шапка)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(381, 1524919968, 1, 'admin', 20, '8', 'Слайд в слайдере (шапка)', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(382, 1524919968, 1, 'admin', 16, '8', 'Слайд в слайдере (шапка)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(383, 1524920008, 1, 'admin', 79, '24', 'header_slider__elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(384, 1524920008, 1, 'admin', 78, '24', 'header_slider__elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(385, 1524920236, 1, 'admin', 27, '56', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(386, 1524920264, 1, 'admin', 5, '56', 'Слайд 2', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(387, 1524920264, 1, 'admin', 27, '56', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(388, 1524920286, 1, 'admin', 301, '6', 'Изображения слайда в шапке', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(389, 1524920311, 1, 'admin', 20, '8', 'Слайд в слайдере (шапка)', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(390, 1524920311, 1, 'admin', 16, '8', 'Слайд в слайдере (шапка)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(391, 1524920330, 1, 'admin', 20, '8', 'Слайд в слайдере (шапка)', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(392, 1524920330, 1, 'admin', 16, '8', 'Слайд в слайдере (шапка)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(393, 1524920338, 1, 'admin', 78, '24', 'header_slider__elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(394, 1524920346, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(395, 1524920347, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(396, 1524920356, 1, 'admin', 16, '8', 'Слайд в слайдере (шапка)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(397, 1524920365, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(398, 1524920370, 1, 'admin', 79, '16', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(399, 1524920370, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(400, 1524920412, 1, 'admin', 79, '16', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(401, 1524920412, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(402, 1524920422, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(403, 1524920427, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(404, 1524920427, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(405, 1524920444, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(406, 1524920444, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(407, 1524920449, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(408, 1524920452, 1, 'admin', 79, '16', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(409, 1524920452, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(410, 1524920501, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(411, 1524920510, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(412, 1524920511, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(413, 1524920702, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(414, 1524920702, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(415, 1524920704, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(416, 1524920793, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(417, 1524920793, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(418, 1524920820, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(419, 1524920820, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(420, 1524920827, 1, 'admin', 301, '6', 'Изображения слайда в шапке', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(421, 1524920841, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(422, 1524920865, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(423, 1524920869, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(424, 1524920869, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(425, 1524920905, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(426, 1524921116, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(427, 1524921117, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(428, 1524921139, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(429, 1524921139, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(430, 1524921162, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(431, 1524921189, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(432, 1524921189, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(433, 1524921225, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(434, 1524921226, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(435, 1524921307, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(436, 1524921307, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(437, 1524921330, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(438, 1524921330, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(439, 1524921335, 1, 'admin', 301, '6', 'Изображения слайда в шапке', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(440, 1524921340, 1, 'admin', 302, '6', 'Изображения слайда в шапке', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(441, 1524921340, 1, 'admin', 301, '6', 'Изображения слайда в шапке', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(442, 1524921367, 1, 'admin', 27, '56', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(443, 1524921389, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(444, 1524921393, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(445, 1524921393, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(446, 1524921415, 1, 'admin', 301, '6', 'Изображения слайда в шапке', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(447, 1524921437, 1, 'admin', 302, '6', 'Изображения слайда в шапке', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(448, 1524921437, 1, 'admin', 301, '6', 'Изображения слайда в шапке', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(449, 1524921489, 1, 'admin', 302, '6', 'Изображения слайда в шапке', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(450, 1524921489, 1, 'admin', 301, '6', 'Изображения слайда в шапке', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(451, 1524921497, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(452, 1524921506, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(453, 1524921615, 1, 'admin', 302, '6', 'Изображения слайда в шапке', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(454, 1524921615, 1, 'admin', 301, '6', 'Изображения слайда в шапке', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(455, 1524921623, 1, 'admin', 16, '8', 'Слайд в слайдере (шапка)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(456, 1524921631, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(457, 1524921665, 1, 'admin', 79, '16', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(458, 1524921665, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(459, 1524921729, 1, 'admin', 79, '16', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(460, 1524921729, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(461, 1524921771, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(462, 1524921771, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(463, 1524924573, 1, 'admin', 27, '56', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(464, 1524924574, 1, 'admin', 27, '56', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(465, 1524924589, 1, 'admin', 27, '56', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(466, 1524924600, 1, 'admin', 5, '56', 'Слайд 2', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(467, 1524924600, 1, 'admin', 27, '56', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(468, 1524924615, 1, 'admin', 5, '56', 'Слайд 2', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(469, 1524924615, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(470, 1524924619, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(471, 1524924622, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(472, 1524924650, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(473, 1524924671, 1, 'admin', 5, '-', 'Слайд 3', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(474, 1524924671, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(475, 1524924681, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(476, 1524924701, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(477, 1524924719, 1, 'admin', 5, '-', 'Слайд 4', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(478, 1524924719, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(479, 1524924722, 1, 'admin', 27, '54', 'Слайдер', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(480, 1524924763, 1, 'admin', 27, '54', 'Слайдер', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(481, 1524924770, 1, 'admin', 5, '54', 'Слайдер', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(482, 1524924770, 1, 'admin', 27, '54', 'Слайдер', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(483, 1524924820, 1, 'admin', 27, '54', 'Слайдер', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(484, 1524924844, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(485, 1524924849, 1, 'admin', 27, '58', 'Слайд 4', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(486, 1524924860, 1, 'admin', 27, '57', 'Слайд 3', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(487, 1524924862, 1, 'admin', 27, '56', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(488, 1524924866, 1, 'admin', 27, '58', 'Слайд 4', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(489, 1524924877, 1, 'admin', 27, '58', 'Слайд 4', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(490, 1524924882, 1, 'admin', 5, '58', 'Слайд 4', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(491, 1524924882, 1, 'admin', 27, '58', 'Слайд 4', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36');
INSERT INTO `evo_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(492, 1524925025, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(493, 1524925087, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(494, 1524925087, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(495, 1524925104, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(496, 1524925105, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(497, 1524925132, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(498, 1524925132, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(499, 1524925145, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(500, 1524925145, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(501, 1524925219, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(502, 1524925219, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(503, 1524925275, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(504, 1524925276, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(505, 1524925290, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(506, 1524925290, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(507, 1524925304, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(508, 1524925304, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(509, 1524925430, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(510, 1524925430, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(511, 1524925462, 1, 'admin', 27, '57', 'Слайд 3', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(512, 1524925474, 1, 'admin', 27, '57', 'Слайд 3', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(513, 1524925483, 1, 'admin', 27, '56', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(514, 1524925490, 1, 'admin', 27, '56', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(515, 1524925496, 1, 'admin', 27, '58', 'Слайд 4', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(516, 1524925501, 1, 'admin', 27, '58', 'Слайд 4', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(517, 1524925535, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(518, 1524925535, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(519, 1524925550, 1, 'admin', 27, '56', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(520, 1524925553, 1, 'admin', 27, '56', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(521, 1524925565, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(522, 1524925569, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(523, 1524925572, 1, 'admin', 27, '57', 'Слайд 3', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(524, 1524925575, 1, 'admin', 27, '57', 'Слайд 3', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(525, 1524925580, 1, 'admin', 27, '58', 'Слайд 4', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(526, 1524925583, 1, 'admin', 27, '58', 'Слайд 4', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(527, 1524925587, 1, 'admin', 5, '58', 'Слайд 4', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(528, 1524925587, 1, 'admin', 27, '58', 'Слайд 4', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(529, 1524925679, 1, 'admin', 79, '24', 'header_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(530, 1524925680, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(531, 1524925697, 1, 'admin', 27, '58', 'Слайд 4', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(532, 1524927725, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(533, 1524927732, 1, 'admin', 78, '24', 'header_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(534, 1524927760, 1, 'admin', 5, '58', 'Слайд 4', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(535, 1524927761, 1, 'admin', 27, '58', 'Слайд 4', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(536, 1524927779, 1, 'admin', 27, '56', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(537, 1524927784, 1, 'admin', 27, '56', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(538, 1524927792, 1, 'admin', 5, '56', 'Слайд 2', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(539, 1524927792, 1, 'admin', 27, '56', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(540, 1524927808, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(541, 1524927815, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(542, 1524927821, 1, 'admin', 5, '55', 'Слайд 1', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(543, 1524927821, 1, 'admin', 27, '55', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(544, 1524928298, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(545, 1524928315, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(546, 1524928351, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(547, 1524928374, 1, 'admin', 20, '-', 'Слайд в слайдере (сертификаты)', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(548, 1524928374, 1, 'admin', 16, '9', 'Слайд в слайдере (сертификаты)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(549, 1524928379, 1, 'admin', 5, '-', 'Сертификаты', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(550, 1524928379, 1, 'admin', 27, '59', 'Сертификаты', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(551, 1524928407, 1, 'admin', 20, '9', 'Слайд в слайдере (сертификаты)', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(552, 1524928407, 1, 'admin', 16, '9', 'Слайд в слайдере (сертификаты)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(553, 1524928412, 1, 'admin', 16, '8', 'Слайд в слайдере (шапка)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(554, 1524928417, 1, 'admin', 20, '8', 'Слайд в слайдере (шапка)', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(555, 1524928417, 1, 'admin', 16, '8', 'Слайд в слайдере (шапка)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(556, 1524928423, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(557, 1524928432, 1, 'admin', 27, '59', 'Сертификаты', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(558, 1524928435, 1, 'admin', 5, '59', 'Сертификаты', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(559, 1524928436, 1, 'admin', 27, '59', 'Сертификаты', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(560, 1524928447, 1, 'admin', 27, '59', 'Сертификаты', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(561, 1524928449, 1, 'admin', 5, '59', 'Сертификаты', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(562, 1524928450, 1, 'admin', 27, '59', 'Сертификаты', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(563, 1524928456, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(564, 1524928466, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(565, 1524928517, 1, 'admin', 302, '-', 'sertSliderImg', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(566, 1524928518, 1, 'admin', 301, '7', 'sertSliderImg', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(567, 1524928532, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(568, 1524928574, 1, 'admin', 5, '-', 'Сертификат 1', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(569, 1524928574, 1, 'admin', 27, '60', 'Сертификат 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(570, 1524928588, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(571, 1524928616, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(572, 1524928619, 1, 'admin', 78, '20', 'sertifics', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(573, 1524928682, 1, 'admin', 79, '-', 'sert_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(574, 1524928682, 1, 'admin', 78, '25', 'sert_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(575, 1524928686, 1, 'admin', 79, '20', 'sertifics', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(576, 1524928686, 1, 'admin', 78, '20', 'sertifics', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(577, 1524928803, 1, 'admin', 16, '8', 'Слайд в слайдере (шапка)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(578, 1524928808, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(579, 1524928810, 1, 'admin', 16, '9', 'Слайд в слайдере (сертификаты)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(580, 1524928928, 1, 'admin', 27, '60', 'Сертификат 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(581, 1524928934, 1, 'admin', 5, '60', 'Сертификат 1', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(582, 1524928934, 1, 'admin', 27, '60', 'Сертификат 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(583, 1524935800, 1, 'admin', 5, '60', 'Сертификат 1', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(584, 1524935801, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(585, 1524935810, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(586, 1524935815, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(587, 1524935860, 1, 'admin', 5, '-', 'Сертификат 2', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(588, 1524935863, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(589, 1524935877, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(590, 1524935901, 1, 'admin', 5, '-', 'Сертификат 3', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(591, 1524935902, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(592, 1524937515, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(593, 1524937544, 1, 'admin', 5, '-', 'Наши партнеры', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(594, 1524937544, 1, 'admin', 27, '63', 'Наши партнеры', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(595, 1524937554, 1, 'admin', 27, '63', 'Наши партнеры', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(596, 1524937558, 1, 'admin', 5, '63', 'Наши партнеры', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(597, 1524937559, 1, 'admin', 27, '63', 'Наши партнеры', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(598, 1524937563, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(599, 1524937579, 1, 'admin', 5, '-', 'Optima', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(600, 1524937579, 1, 'admin', 27, '64', 'Optima', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(601, 1524937587, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(602, 1524937590, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(603, 1524937592, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(604, 1524937602, 1, 'admin', 78, '22', 'partners', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(605, 1524937617, 1, 'admin', 79, '22', 'partners', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(606, 1524937618, 1, 'admin', 78, '22', 'partners', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(607, 1524937694, 1, 'admin', 79, '-', 'partner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(608, 1524937694, 1, 'admin', 78, '26', 'partner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(609, 1524937746, 1, 'admin', 20, '-', 'Партнер', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(610, 1524937746, 1, 'admin', 16, '10', 'Партнер', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(611, 1524937752, 1, 'admin', 302, '-', 'Логотип партнера', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(612, 1524937752, 1, 'admin', 301, '8', 'Логотип партнера', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(613, 1524937757, 1, 'admin', 302, '8', 'Логотип партнера', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(614, 1524937757, 1, 'admin', 301, '8', 'Логотип партнера', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(615, 1524937790, 1, 'admin', 20, '10', 'Партнер', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(616, 1524937790, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(617, 1524937801, 1, 'admin', 78, '20', 'sertifics', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(618, 1524937897, 1, 'admin', 79, '22', 'partners', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(619, 1524937897, 1, 'admin', 78, '22', 'partners', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(620, 1524937901, 1, 'admin', 27, '64', 'Optima', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(621, 1524937906, 1, 'admin', 27, '64', 'Optima', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(622, 1524937911, 1, 'admin', 120, '-', '-', 'Idle (unknown)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(623, 1524937929, 1, 'admin', 120, '-', '-', 'Idle (unknown)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(624, 1524937993, 1, 'admin', 120, '-', '-', 'Idle (unknown)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(625, 1524938004, 1, 'admin', 27, '64', 'Optima', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(626, 1524938012, 1, 'admin', 27, '64', 'Optima', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(627, 1524938015, 1, 'admin', 5, '64', 'Optima', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(628, 1524938015, 1, 'admin', 27, '64', 'Optima', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(629, 1524938034, 1, 'admin', 5, '64', 'Optima', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(630, 1524938034, 1, 'admin', 27, '64', 'Optima', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(631, 1524938049, 1, 'admin', 5, '64', 'Optima', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(632, 1524938050, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(633, 1524938087, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(634, 1524938103, 1, 'admin', 5, '-', 'Авто кореец', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(635, 1524938103, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(636, 1524938108, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(637, 1524938133, 1, 'admin', 5, '-', 'Авто японец', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(638, 1524938134, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(639, 1524938140, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(640, 1524938167, 1, 'admin', 5, '-', 'Инжстройснаб', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(641, 1524938167, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(642, 1524938172, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(643, 1524938196, 1, 'admin', 5, '-', 'Сбербанк', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(644, 1524938196, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(645, 1524938200, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(646, 1524938232, 1, 'admin', 5, '-', 'РоссельхозБанк', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(647, 1524938232, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(648, 1524938251, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(649, 1524938322, 1, 'admin', 5, '-', 'Альфа-банк', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(650, 1524938322, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(651, 1524938345, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(652, 1524938359, 1, 'admin', 5, '-', 'УралБизнесЛизинг', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(653, 1524938359, 1, 'admin', 27, '71', 'УралБизнесЛизинг', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(654, 1524938361, 1, 'admin', 5, '71', 'УралБизнесЛизинг', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(655, 1524938361, 1, 'admin', 27, '71', 'УралБизнесЛизинг', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(656, 1524938417, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(657, 1524938444, 1, 'admin', 302, '-', 'phone', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(658, 1524938444, 1, 'admin', 301, '9', 'phone', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(659, 1524938453, 1, 'admin', 27, '53', 'Шапка', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(660, 1524938468, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(661, 1524938530, 1, 'admin', 79, '16', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(662, 1524938530, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(663, 1524938538, 1, 'admin', 27, '1', 'Кирпич', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(664, 1524938557, 1, 'admin', 5, '1', 'Кирпич', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(665, 1524938557, 1, 'admin', 27, '1', 'Кирпич', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(666, 1524938656, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(667, 1524938675, 1, 'admin', 79, '16', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(668, 1524938675, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(669, 1524939063, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(670, 1524939079, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(671, 1524939079, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(672, 1524939120, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(673, 1524939120, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(674, 1524939124, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(675, 1524939142, 1, 'admin', 79, '-', 'work', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(676, 1524939142, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(677, 1524939169, 1, 'admin', 79, '-', 'offers', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(678, 1524939169, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(679, 1524939184, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(680, 1524939184, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(681, 1524939205, 1, 'admin', 79, '-', 'ask', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(682, 1524939205, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(683, 1524939659, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(684, 1524939660, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(685, 1524939675, 1, 'admin', 79, '-', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(686, 1524939675, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(687, 1524939690, 1, 'admin', 78, '14', 'ContactForm', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(688, 1524939709, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(689, 1524939709, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(690, 1524939794, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(691, 1524939924, 1, 'admin', 302, '-', 'Карта', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(692, 1524939924, 1, 'admin', 301, '10', 'Карта', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(693, 1524939938, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(694, 1524939938, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(695, 1524939941, 1, 'admin', 27, '1', 'Кирпич', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(696, 1524939970, 1, 'admin', 5, '1', 'Кирпич', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(697, 1524939970, 1, 'admin', 27, '1', 'Кирпич', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(698, 1524939972, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(699, 1524939979, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(700, 1524939979, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(701, 1524940035, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(702, 1524940035, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(703, 1524940069, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(704, 1524940084, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(705, 1524940097, 1, 'admin', 5, '-', 'Отзывы', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(706, 1524940097, 1, 'admin', 27, '72', 'Отзывы', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(707, 1524940101, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(708, 1524940174, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(709, 1524940189, 1, 'admin', 5, '-', 'Игорь Тюлькин', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(710, 1524940189, 1, 'admin', 27, '73', 'Игорь Тюлькин', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(711, 1524940204, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(712, 1524940235, 1, 'admin', 20, '-', 'Слайд в слайдере (отзывы)', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(713, 1524940235, 1, 'admin', 16, '11', 'Слайд в слайдере (отзывы)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(714, 1524940238, 1, 'admin', 20, '11', 'Слайд в слайдере (отзывы)', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(715, 1524940238, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(716, 1524940240, 1, 'admin', 20, '-', 'Untitled template', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(717, 1524940240, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(718, 1524940268, 1, 'admin', 120, '-', '-', 'Idle (unknown)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(719, 1524940285, 1, 'admin', 120, '-', '-', 'Idle (unknown)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(720, 1524940313, 1, 'admin', 120, '-', '-', 'Idle (unknown)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(721, 1524940319, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(722, 1524940327, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(723, 1524940363, 1, 'admin', 302, '-', 'Изображение слайда с отзывами', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(724, 1524940364, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(725, 1524940380, 1, 'admin', 78, '28', 'offers', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(726, 1524940413, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(727, 1524940492, 1, 'admin', 79, '-', 'offer_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(728, 1524940492, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(729, 1524940510, 1, 'admin', 78, '22', 'partners', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(730, 1524940553, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(731, 1524940560, 1, 'admin', 78, '31', 'offer_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(732, 1524940569, 1, 'admin', 27, '2', 'Blog', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(733, 1524940570, 1, 'admin', 27, '72', 'Отзывы', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(734, 1524940574, 1, 'admin', 27, '73', 'Игорь Тюлькин', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(735, 1524940580, 1, 'admin', 27, '73', 'Игорь Тюлькин', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(736, 1524940592, 1, 'admin', 79, '28', 'offers', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36');
INSERT INTO `evo_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(737, 1524940592, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(738, 1524940618, 1, 'admin', 78, '31', 'offer_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(739, 1524940632, 1, 'admin', 79, '31', 'offer_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(740, 1524940632, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(741, 1524940655, 1, 'admin', 78, '28', 'offers', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(742, 1524940661, 1, 'admin', 79, '28', 'offers', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(743, 1524940661, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(744, 1524940667, 1, 'admin', 78, '31', 'offer_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(745, 1524940674, 1, 'admin', 79, '31', 'offer_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(746, 1524940675, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(747, 1524940700, 1, 'admin', 5, '73', 'Игорь Тюлькин', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(748, 1524940700, 1, 'admin', 3, '73', 'Игорь Тюлькин', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(749, 1524940717, 1, 'admin', 78, '31', 'offer_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(750, 1524940723, 1, 'admin', 79, '31', 'offer_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(751, 1524940723, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(752, 1524940754, 1, 'admin', 27, '73', 'Игорь Тюлькин', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(753, 1524940775, 1, 'admin', 78, '31', 'offer_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(754, 1524940815, 1, 'admin', 79, '31', 'offer_slider_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(755, 1524940815, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(756, 1524940874, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(757, 1524940962, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(758, 1524940980, 1, 'admin', 5, '-', 'Денис Белоусов', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(759, 1524940980, 1, 'admin', 3, '74', 'Денис Белоусов', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(760, 1524940983, 1, 'admin', 27, '72', 'Отзывы', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(761, 1524940985, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(762, 1524941001, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(763, 1524941017, 1, 'admin', 5, '-', 'Григорий Макаров', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(764, 1524941017, 1, 'admin', 3, '75', 'Григорий Макаров', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(765, 1524941040, 1, 'admin', 27, '72', 'Отзывы', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(766, 1524943724, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(767, 1524943744, 1, 'admin', 302, '-', 'address', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(768, 1524943744, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(769, 1524943747, 1, 'admin', 27, '53', 'Шапка', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(770, 1524943749, 1, 'admin', 27, '1', 'Кирпич', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(771, 1524943770, 1, 'admin', 5, '1', 'Кирпич', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(772, 1524943770, 1, 'admin', 3, '1', 'Кирпич', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(773, 1524943773, 1, 'admin', 27, '1', 'Кирпич', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(774, 1524943790, 1, 'admin', 78, '30', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(775, 1524943814, 1, 'admin', 79, '30', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(776, 1524943814, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(777, 1524943827, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(778, 1524943851, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(779, 1524943860, 1, 'admin', 78, '30', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(780, 1524943872, 1, 'admin', 79, '30', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(781, 1524943872, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(782, 1524954948, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(783, 1524955025, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(784, 1524955065, 1, 'admin', 79, '-', 'Untitled chunk', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(785, 1524955066, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(786, 1524955070, 1, 'admin', 78, '32', 'Untitled chunk', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(787, 1524955092, 1, 'admin', 79, '32', 'form_callme_tpl', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(788, 1524955092, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(789, 1524955121, 1, 'admin', 78, '32', 'form_callme_tpl', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(790, 1524955131, 1, 'admin', 79, '32', 'form_callme_tpl', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(791, 1524955131, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(792, 1524955136, 1, 'admin', 78, '32', 'form_callme_tpl', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(793, 1524955143, 1, 'admin', 79, '32', 'form_callme_tpl', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(794, 1524955143, 1, 'admin', 78, '32', 'form_callme_tpl', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(795, 1524955153, 1, 'admin', 79, '32', 'form_callme_tpl', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(796, 1524955153, 1, 'admin', 78, '32', 'form_callme_tpl', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(797, 1524955333, 1, 'admin', 79, '32', 'form_callme_tpl', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(798, 1524955333, 1, 'admin', 78, '32', 'form_callme_tpl', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(799, 1524955352, 1, 'admin', 79, '32', 'form_callme_tpl', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(800, 1524955352, 1, 'admin', 78, '32', 'form_callme_tpl', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(801, 1524955432, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(802, 1524955432, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(803, 1524955440, 1, 'admin', 79, '32', 'form_callme_tpl', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(804, 1524955441, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(805, 1524955470, 1, 'admin', 79, '-', 'successTpl', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(806, 1524955470, 1, 'admin', 78, '33', 'successTpl', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(807, 1524955473, 1, 'admin', 79, '33', 'successTpl', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(808, 1524955473, 1, 'admin', 78, '33', 'successTpl', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(809, 1524955693, 1, 'admin', 78, '32', 'form_callme_tpl', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(810, 1524955706, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(811, 1524955713, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(812, 1524955714, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(813, 1524955993, 1, 'admin', 79, '33', 'successTpl', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(814, 1524955993, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(815, 1524955998, 1, 'admin', 78, '32', 'form_callme_tpl', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(816, 1524956029, 1, 'admin', 79, '32', 'form_callme_tpl', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(817, 1524956029, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(818, 1524956139, 1, 'admin', 78, '32', 'form_callme_tpl', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(819, 1524956181, 1, 'admin', 79, '32', 'form_callme_tpl', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(820, 1524956181, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(821, 1524957224, 1, 'admin', 27, '1', 'Кирпич', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(822, 1524957229, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(823, 1524957238, 1, 'admin', 5, '-', 'Плитка', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(824, 1524957238, 1, 'admin', 3, '76', 'Плитка', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(825, 1524957242, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(826, 1524957248, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(827, 1524957330, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(828, 1524957406, 1, 'admin', 20, '-', 'Товар', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(829, 1524957406, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(830, 1524957417, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(831, 1524957451, 1, 'admin', 79, '-', 'product_plit', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(832, 1524957451, 1, 'admin', 78, '34', 'product_plit', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(833, 1524957461, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(834, 1524957469, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(835, 1524957680, 1, 'admin', 79, '34', 'product_plit', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(836, 1524957681, 1, 'admin', 78, '34', 'product_plit', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(837, 1524957736, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(838, 1524957736, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(839, 1524957746, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(840, 1524957780, 1, 'admin', 302, '-', 'Изображение товара (плитка)', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(841, 1524957780, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(842, 1524957812, 1, 'admin', 302, '-', 'Цвет товара (плитка)', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(843, 1524957813, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(844, 1524957840, 1, 'admin', 302, '-', 'Размеры товара (плитка)', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(845, 1524957840, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(846, 1524957880, 1, 'admin', 302, '-', 'Вес товара', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(847, 1524957880, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(848, 1524957926, 1, 'admin', 302, '-', 'Количество товара (плитка)', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(849, 1524957926, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(850, 1524957972, 1, 'admin', 302, '-', 'Вес поддона (плитка)', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(851, 1524957972, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(852, 1524958043, 1, 'admin', 302, '-', 'Стоимость товара (плитка)', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(853, 1524958043, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(854, 1524958051, 1, 'admin', 301, '14', 'Цвет товара (плитка)', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(855, 1524958070, 1, 'admin', 302, '14', 'Цвет товара (плитка)', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(856, 1524958070, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(857, 1524958074, 1, 'admin', 301, '17', 'Количество товара (плитка)', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(858, 1524958083, 1, 'admin', 302, '17', 'Количество товара (плитка)', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(859, 1524958083, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(860, 1524958086, 1, 'admin', 301, '17', 'Количество товара (плитка)', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(861, 1524958104, 1, 'admin', 302, '17', 'Количество товара (плитка)', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(862, 1524958104, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(863, 1524958108, 1, 'admin', 301, '18', 'Вес поддона (плитка)', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(864, 1524958116, 1, 'admin', 302, '18', 'Вес поддона (плитка)', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(865, 1524958116, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(866, 1524958119, 1, 'admin', 301, '13', 'Изображение товара (плитка)', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(867, 1524958129, 1, 'admin', 302, '13', 'Изображение товара (плитка)', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(868, 1524958130, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(869, 1524958132, 1, 'admin', 301, '15', 'Размеры товара (плитка)', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(870, 1524958144, 1, 'admin', 302, '15', 'Размеры товара (плитка)', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(871, 1524958144, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(872, 1524958146, 1, 'admin', 301, '15', 'Размеры товара (плитка)', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(873, 1524958154, 1, 'admin', 302, '15', 'Размеры товара (плитка)', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(874, 1524958154, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(875, 1524958158, 1, 'admin', 301, '16', 'Вес товара', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(876, 1524958170, 1, 'admin', 302, '16', 'Вес товара', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(877, 1524958170, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(878, 1524958173, 1, 'admin', 301, '11', 'Изображение слайда с отзывами', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(879, 1524958179, 1, 'admin', 302, '11', 'Изображение слайда с отзывами', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(880, 1524958179, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(881, 1524958200, 1, 'admin', 5, '-', 'Цокольная плитка', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(882, 1524958200, 1, 'admin', 27, '77', 'Цокольная плитка', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(883, 1524958209, 1, 'admin', 27, '77', 'Цокольная плитка', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(884, 1524958249, 1, 'admin', 16, '12', 'Untitled template', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(885, 1524958260, 1, 'admin', 79, '34', 'product_plit', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(886, 1524958260, 1, 'admin', 78, '34', 'product_plit', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(887, 1524958270, 1, 'admin', 16, '13', 'Товар', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(888, 1524958284, 1, 'admin', 20, '13', 'Товар (плитка)', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(889, 1524958284, 1, 'admin', 16, '13', 'Товар (плитка)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(890, 1524958338, 1, 'admin', 5, '77', 'Цокольная плитка', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(891, 1524958338, 1, 'admin', 27, '77', 'Цокольная плитка', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(892, 1524958370, 1, 'admin', 78, '34', 'product_plit', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(893, 1524958384, 1, 'admin', 79, '34', 'product_plit', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(894, 1524958384, 1, 'admin', 78, '34', 'product_plit', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(895, 1524958426, 1, 'admin', 79, '34', 'product_plit', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(896, 1524958426, 1, 'admin', 78, '34', 'product_plit', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(897, 1524958495, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(898, 1524958498, 1, 'admin', 27, '1', 'Кирпич', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(899, 1525015524, 1, 'admin', 58, '-', 'MODX', 'Logged in', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(900, 1525015528, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(901, 1525033208, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(902, 1525033455, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(903, 1525087185, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(904, 1525087202, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(905, 1525091085, 1, 'admin', 8, '-', '-', 'Logged out', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(906, 1525091096, 1, 'admin', 58, '-', 'MODX', 'Logged in', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(907, 1525091098, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(908, 1525091701, 1, 'admin', 8, '-', '-', 'Logged out', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(909, 1525096880, 1, 'admin', 58, '-', 'MODX', 'Logged in', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(910, 1525096883, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(911, 1525097472, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(912, 1525097485, 1, 'admin', 5, '-', 'Кирпич', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(913, 1525097485, 1, 'admin', 3, '78', 'Кирпич', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(914, 1525097489, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(915, 1525097538, 1, 'admin', 5, '-', 'Размеры', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(916, 1525097538, 1, 'admin', 3, '79', 'Размеры', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(917, 1525097542, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(918, 1525097593, 1, 'admin', 5, '-', '1.4', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(919, 1525097593, 1, 'admin', 3, '80', '1.4', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(920, 1525097604, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(921, 1525097645, 1, 'admin', 20, '-', 'Размер кирпича', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(922, 1525097646, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(923, 1525097650, 1, 'admin', 27, '80', '1.4', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(924, 1525100587, 1, 'admin', 27, '80', '1.4', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(925, 1525100594, 1, 'admin', 16, '14', 'Размер кирпича', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(926, 1525100602, 1, 'admin', 20, '14', 'Размер кирпича', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(927, 1525100603, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(928, 1525100613, 1, 'admin', 5, '80', '1.4', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(929, 1525100613, 1, 'admin', 3, '80', '1.4', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(930, 1525100616, 1, 'admin', 27, '79', 'Размеры', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(931, 1525100632, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(932, 1525100670, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(933, 1525100745, 1, 'admin', 79, '-', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(934, 1525100745, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(935, 1525100750, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(936, 1525100807, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(937, 1525100881, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(938, 1525100881, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(939, 1525101144, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(940, 1525101144, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(941, 1525101235, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(942, 1525101239, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(943, 1525101239, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(944, 1525101241, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(945, 1525101245, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(946, 1525101245, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(947, 1525101278, 1, 'admin', 5, '79', 'Размеры', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(948, 1525101278, 1, 'admin', 3, '79', 'Размеры', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(949, 1525101283, 1, 'admin', 27, '80', '1.4', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(950, 1525101286, 1, 'admin', 5, '80', '1.4', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(951, 1525101286, 1, 'admin', 27, '80', '1.4', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(952, 1525101293, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(953, 1525101293, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(954, 1525101369, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(955, 1525101369, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(956, 1525101405, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(957, 1525101405, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(958, 1525101417, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(959, 1525101417, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(960, 1525101422, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(961, 1525101793, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(962, 1525101796, 1, 'admin', 5, '-', '1.0', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(963, 1525101796, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(964, 1525101818, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(965, 1525101821, 1, 'admin', 5, '-', '0.7', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(966, 1525101821, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(967, 1525101835, 1, 'admin', 5, '-', '0.5', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(968, 1525101836, 1, 'admin', 27, '83', '0.5', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(969, 1525102299, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(970, 1525102311, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(971, 1525102311, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(972, 1525102337, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(973, 1525102337, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(974, 1525102359, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(975, 1525102360, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(976, 1525102365, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(977, 1525102365, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(978, 1525102369, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(979, 1525102369, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36');
INSERT INTO `evo_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(980, 1525102373, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(981, 1525102373, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(982, 1525102414, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(983, 1525102414, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(984, 1525102436, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(985, 1525102437, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(986, 1525102542, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(987, 1525102542, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(988, 1525102572, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(989, 1525102572, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(990, 1525102603, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(991, 1525102604, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(992, 1525102634, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(993, 1525102634, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(994, 1525102686, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(995, 1525102687, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(996, 1525102704, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(997, 1525102704, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(998, 1525105410, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(999, 1525105411, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1000, 1525105479, 1, 'admin', 16, '13', 'Товар (плитка)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1001, 1525105486, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1002, 1525105504, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1003, 1525105504, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1004, 1525105531, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1005, 1525105532, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1006, 1525105539, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1007, 1525105539, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1008, 1525105652, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1009, 1525105653, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1010, 1525105679, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1011, 1525105679, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1012, 1525105762, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1013, 1525105763, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1014, 1525105784, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1015, 1525105784, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1016, 1525105799, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1017, 1525105799, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1018, 1525105814, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1019, 1525105814, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1020, 1525105967, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1021, 1525105967, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1022, 1525106436, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1023, 1525106437, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1024, 1525106453, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1025, 1525106453, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1026, 1525106699, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1027, 1525106699, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1028, 1525107060, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1029, 1525107060, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1030, 1525107076, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1031, 1525107077, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1032, 1525107086, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1033, 1525107086, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1034, 1525107437, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1035, 1525107437, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1036, 1525107578, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1037, 1525107578, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1038, 1525107646, 1, 'admin', 79, '-', 'stone_color', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1039, 1525107646, 1, 'admin', 78, '36', 'stone_color', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1040, 1525107654, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1041, 1525107666, 1, 'admin', 5, '-', 'Цвета', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1042, 1525107666, 1, 'admin', 27, '84', 'Цвета', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1043, 1525107670, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1044, 1525109071, 1, 'admin', 79, '36', 'stone_color', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1045, 1525109072, 1, 'admin', 78, '36', 'stone_color', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1046, 1525109090, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1047, 1525109163, 1, 'admin', 5, '-', 'Золотистый', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1048, 1525109164, 1, 'admin', 27, '85', 'Золотистый', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1049, 1525109173, 1, 'admin', 79, '36', 'stone_color', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1050, 1525109173, 1, 'admin', 78, '36', 'stone_color', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1051, 1525109182, 1, 'admin', 5, '85', 'Золотистый', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1052, 1525109182, 1, 'admin', 27, '85', 'Золотистый', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1053, 1525109255, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1054, 1525112765, 1, 'admin', 5, '-', 'Полузолотой', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1055, 1525112766, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1056, 1525112788, 1, 'admin', 5, '-', 'Светло серый', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1057, 1525112788, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1058, 1525112820, 1, 'admin', 5, '-', 'Коричневый', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1059, 1525112820, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1060, 1525112832, 1, 'admin', 5, '-', 'Светло бежевый', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1061, 1525112833, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1062, 1525112844, 1, 'admin', 5, '-', 'Серый', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1063, 1525112844, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1064, 1525112855, 1, 'admin', 5, '-', 'Темно оранжевый', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1065, 1525112855, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1066, 1525112865, 1, 'admin', 5, '-', 'Болотный', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1067, 1525112865, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1068, 1525112875, 1, 'admin', 5, '-', 'Светло серый', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1069, 1525112876, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1070, 1525112896, 1, 'admin', 5, '-', 'Светло золотой', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1071, 1525112896, 1, 'admin', 27, '94', 'Светло золотой', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1072, 1525112899, 1, 'admin', 27, '87', 'Светло серый', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1073, 1525112914, 1, 'admin', 5, '87', 'Светло коричневый', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1074, 1525112914, 1, 'admin', 27, '87', 'Светло коричневый', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1075, 1525112960, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1076, 1525112987, 1, 'admin', 79, '36', 'stone_color', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1077, 1525112987, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1078, 1525113020, 1, 'admin', 20, '-', 'Вид кирпича', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1079, 1525113020, 1, 'admin', 16, '15', 'Вид кирпича', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1080, 1525113024, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1081, 1525113094, 1, 'admin', 302, '-', 'Изображение черно белое', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1082, 1525113094, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1083, 1525113119, 1, 'admin', 78, '36', 'stone_color', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1084, 1525113138, 1, 'admin', 79, '36', 'stone_color', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1085, 1525113138, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1086, 1525113168, 1, 'admin', 16, '14', 'Размер кирпича', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1087, 1525113183, 1, 'admin', 20, '14', 'Размер кирпича', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1088, 1525113183, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1089, 1525113189, 1, 'admin', 16, '15', 'Вид кирпича', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1090, 1525113198, 1, 'admin', 20, '15', 'Вид кирпича', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1091, 1525113198, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1092, 1525113265, 1, 'admin', 302, '-', 'Изображение вида кирпича - цветное', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1093, 1525113266, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1094, 1525113305, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1095, 1525113319, 1, 'admin', 301, '21', 'Изображение вида кирпича - цветное', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1096, 1525113328, 1, 'admin', 302, '21', 'Изображение вида кирпича - цветное', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1097, 1525113328, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1098, 1525113331, 1, 'admin', 301, '20', 'Изображение черно белое', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1099, 1525113335, 1, 'admin', 302, '20', 'Изображение черно белое', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1100, 1525113335, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1101, 1525113355, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1102, 1525113375, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1103, 1525113378, 1, 'admin', 5, '-', 'Вид', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1104, 1525113379, 1, 'admin', 3, '95', 'Вид', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1105, 1525113397, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1106, 1525113452, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1107, 1525113489, 1, 'admin', 301, '21', 'Изображение вида кирпича - цветное', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1108, 1525113519, 1, 'admin', 301, '20', 'Изображение черно белое', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1109, 1525113535, 1, 'admin', 301, '21', 'Изображение вида кирпича - цветное', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1110, 1525113541, 1, 'admin', 301, '21', 'Изображение вида кирпича - цветное', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1111, 1525113545, 1, 'admin', 301, '20', 'Изображение черно белое', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1112, 1525113556, 1, 'admin', 302, '20', 'Изображение вида кирпича - черно белое', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1113, 1525113556, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1114, 1525113592, 1, 'admin', 79, '-', 'stone_view', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1115, 1525113592, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1116, 1525113600, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1117, 1525113604, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1118, 1525113618, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1119, 1525113670, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1120, 1525113688, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1121, 1525113689, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1122, 1525113707, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1123, 1525113745, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1124, 1525113782, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1125, 1525113809, 1, 'admin', 30, '-', '-', 'Saving settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1126, 1525113829, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1127, 1525113942, 1, 'admin', 26, '-', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1128, 1525113994, 1, 'admin', 93, '-', '-', 'Backup Manager', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1129, 1525114032, 1, 'admin', 67, '-', '-', 'Removing locks', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1130, 1525114126, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1131, 1525114130, 1, 'admin', 30, '-', '-', 'Saving settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1132, 1525114142, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1133, 1525114148, 1, 'admin', 30, '-', '-', 'Saving settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1134, 1525117369, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1135, 1525117411, 1, 'admin', 30, '-', '-', 'Saving settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1136, 1525117419, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1137, 1525117436, 1, 'admin', 30, '-', '-', 'Saving settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1138, 1525117442, 1, 'admin', 27, '95', 'Вид', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1139, 1525117449, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1140, 1525117562, 1, 'admin', 5, '-', 'Полнотелый', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1141, 1525117562, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1142, 1525117615, 1, 'admin', 5, '-', 'Пустотелый', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1143, 1525117615, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1144, 1525117649, 1, 'admin', 5, '-', 'Фасонный', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1145, 1525117649, 1, 'admin', 27, '98', 'Фасонный', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1146, 1525117653, 1, 'admin', 27, '96', 'Полнотелый', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1147, 1525117672, 1, 'admin', 5, '96', 'Полнотелый', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1148, 1525117672, 1, 'admin', 27, '96', 'Полнотелый', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1149, 1525118019, 1, 'admin', 58, '-', 'MODX', 'Logged in', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1150, 1525118057, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1151, 1525118067, 1, 'admin', 30, '-', '-', 'Saving settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1152, 1525118072, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1153, 1525118083, 1, 'admin', 30, '-', '-', 'Saving settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1154, 1525118130, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1155, 1525118343, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1156, 1525118356, 1, 'admin', 301, '21', 'Изображение вида кирпича - цветное', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1157, 1525118367, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1158, 1525118371, 1, 'admin', 301, '20', 'Изображение вида кирпича - черно белое', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1159, 1525118377, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1160, 1525118377, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1161, 1525118393, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1162, 1525118403, 1, 'admin', 78, '37', 'stone_view', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1163, 1525118412, 1, 'admin', 79, '37', 'stone_view', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1164, 1525118413, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1165, 1525121410, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1166, 1525121438, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1167, 1525121441, 1, 'admin', 5, '-', 'Форма', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1168, 1525121441, 1, 'admin', 3, '99', 'Форма', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1169, 1525121448, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1170, 1525121467, 1, 'admin', 20, '-', 'Форма крипича', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1171, 1525121468, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1172, 1525121471, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1173, 1525121511, 1, 'admin', 302, '-', 'Изображение формы кирпича - черно белое', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1174, 1525121511, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1175, 1525121513, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1176, 1525121549, 1, 'admin', 302, '-', 'Изображение формы кирпича - цветное', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1177, 1525121549, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1178, 1525121564, 1, 'admin', 301, '23', 'Изображение формы кирпича - цветное', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1179, 1525121573, 1, 'admin', 302, '23', 'Изображение формы кирпича - цветное', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1180, 1525121573, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1181, 1525121575, 1, 'admin', 301, '22', 'Изображение формы кирпича - черно белое', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1182, 1525121582, 1, 'admin', 302, '22', 'Изображение формы кирпича - черно белое', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1183, 1525121582, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1184, 1525121653, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1185, 1525121674, 1, 'admin', 78, '33', 'successTpl', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1186, 1525121681, 1, 'admin', 79, '33', 'successTpl', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1187, 1525121681, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1188, 1525121685, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1189, 1525121902, 1, 'admin', 79, '-', 'stone_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1190, 1525121903, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1191, 1525121913, 1, 'admin', 301, '22', 'Изображение формы кирпича - черно белое', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1192, 1525121921, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1193, 1525121924, 1, 'admin', 301, '21', 'Изображение вида кирпича - цветное', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1194, 1525121928, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1195, 1525121928, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1196, 1525121930, 1, 'admin', 302, '21', 'Изображение вида кирпича - цветное', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1197, 1525121931, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1198, 1525121943, 1, 'admin', 78, '38', 'stone_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1199, 1525121963, 1, 'admin', 301, '20', 'Изображение вида кирпича - черно белое', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1200, 1525121993, 1, 'admin', 79, '38', 'stone_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1201, 1525121993, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1202, 1525121998, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1203, 1525122003, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1204, 1525122083, 1, 'admin', 5, '-', 'Угловой', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1205, 1525122083, 1, 'admin', 3, '100', 'Угловой', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1206, 1525122087, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1207, 1525122099, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1208, 1525122166, 1, 'admin', 5, '-', 'Брусок угловой', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1209, 1525122166, 1, 'admin', 3, '101', 'Брусок угловой', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1210, 1525122169, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1211, 1525122174, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1212, 1525122199, 1, 'admin', 5, '-', 'Двусторонный', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1213, 1525122199, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1214, 1525122221, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1215, 1525122235, 1, 'admin', 5, '-', 'Фигурный №1', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1216, 1525122235, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1217, 1525122239, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1218, 1525122262, 1, 'admin', 5, '-', 'Фигурный №2', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1219, 1525122262, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1220, 1525122274, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1221, 1525122296, 1, 'admin', 5, '-', 'Трапеция №1', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36');
INSERT INTO `evo_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(1222, 1525122296, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1223, 1525122313, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1224, 1525122328, 1, 'admin', 5, '-', 'Трапеция №2', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1225, 1525122328, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1226, 1525122342, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1227, 1525122362, 1, 'admin', 5, '-', 'Трапеция №3', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1228, 1525122362, 1, 'admin', 3, '107', 'Трапеция №3', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1229, 1525122399, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1230, 1525122419, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1231, 1525122419, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1232, 1525122464, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1233, 1525122465, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1234, 1525122492, 1, 'admin', 78, '38', 'stone_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1235, 1525122503, 1, 'admin', 78, '38', 'stone_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1236, 1525122505, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1237, 1525122508, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1238, 1525122512, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1239, 1525122517, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1240, 1525122523, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1241, 1525122523, 1, 'admin', 78, '35', 'stone_size', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1242, 1525122528, 1, 'admin', 79, '35', 'stone_size', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1243, 1525122529, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1244, 1525122536, 1, 'admin', 78, '37', 'stone_view', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1245, 1525122553, 1, 'admin', 79, '37', 'stone_view', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1246, 1525122553, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1247, 1525122558, 1, 'admin', 78, '38', 'stone_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1248, 1525122567, 1, 'admin', 79, '38', 'stone_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1249, 1525122567, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1250, 1525122588, 1, 'admin', 78, '22', 'partners', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1251, 1525122590, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1252, 1525122593, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1253, 1525122619, 1, 'admin', 27, '100', 'Угловой', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1254, 1525122646, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1255, 1525122652, 1, 'admin', 78, '38', 'stone_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1256, 1525122664, 1, 'admin', 79, '38', 'stone_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1257, 1525122665, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1258, 1525122684, 1, 'admin', 78, '38', 'stone_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1259, 1525122688, 1, 'admin', 79, '38', 'stone_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1260, 1525122688, 1, 'admin', 78, '38', 'stone_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1261, 1525122695, 1, 'admin', 79, '38', 'stone_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1262, 1525122695, 1, 'admin', 78, '38', 'stone_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1263, 1525122705, 1, 'admin', 79, '38', 'stone_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1264, 1525122705, 1, 'admin', 78, '38', 'stone_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1265, 1525122724, 1, 'admin', 79, '38', 'stone_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1266, 1525122724, 1, 'admin', 78, '38', 'stone_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1267, 1525122759, 1, 'admin', 79, '38', 'stone_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1268, 1525122759, 1, 'admin', 78, '38', 'stone_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1269, 1525122781, 1, 'admin', 79, '38', 'stone_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1270, 1525122781, 1, 'admin', 78, '38', 'stone_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1271, 1525122784, 1, 'admin', 79, '38', 'stone_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1272, 1525122784, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1273, 1525122789, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1274, 1525122799, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1275, 1525122799, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1276, 1525122846, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1277, 1525122900, 1, 'admin', 5, '-', 'Как можно использовать нашу продукцию - слайдер', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1278, 1525122900, 1, 'admin', 3, '108', 'Как можно использовать нашу продукцию - слайдер', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1279, 1525122908, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1280, 1525122944, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1281, 1525122967, 1, 'admin', 20, '-', 'Слайд в слайдере (кирпич)', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1282, 1525122967, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1283, 1525122970, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1284, 1525123041, 1, 'admin', 79, '-', 'stone_slide', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1285, 1525123041, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1286, 1525123044, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1287, 1525123088, 1, 'admin', 302, '-', 'Слайд в слайдере \\\"Как можно использовать нашу продукцию\\\"  (кирпич)', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1288, 1525123088, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1289, 1525123099, 1, 'admin', 78, '39', 'stone_slide', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1290, 1525123109, 1, 'admin', 79, '39', 'stone_slide', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1291, 1525123109, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1292, 1525123121, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1293, 1525123136, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1294, 1525123142, 1, 'admin', 5, '-', 'Слайд 1', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1295, 1525123142, 1, 'admin', 3, '109', 'Слайд 1', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1296, 1525123146, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1297, 1525123158, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1298, 1525123163, 1, 'admin', 5, '-', 'Слайд 2', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1299, 1525123163, 1, 'admin', 3, '110', 'Слайд 2', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1300, 1525123166, 1, 'admin', 27, '108', 'Как можно использовать нашу продукцию - слайдер', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1301, 1525123182, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1302, 1525123264, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1303, 1525123264, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1304, 1525123304, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1305, 1525123311, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1306, 1525123320, 1, 'admin', 78, '39', 'stone_slide', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1307, 1525123371, 1, 'admin', 27, '108', 'Как можно использовать нашу продукцию - слайдер', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1308, 1525123374, 1, 'admin', 5, '108', 'Как можно использовать нашу продукцию - слайдер', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1309, 1525123374, 1, 'admin', 3, '108', 'Как можно использовать нашу продукцию - слайдер', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1310, 1525123408, 1, 'admin', 16, '8', 'Слайд в слайдере (шапка)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1311, 1525123413, 1, 'admin', 16, '17', 'Слайд в слайдере (кирпич)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1312, 1525123422, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1313, 1525123516, 1, 'admin', 27, '110', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1314, 1525123534, 1, 'admin', 5, '110', 'Слайд 2', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1315, 1525123534, 1, 'admin', 3, '110', 'Слайд 2', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1316, 1525123558, 1, 'admin', 27, '2', 'Blog', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1317, 1525123558, 1, 'admin', 27, '110', 'Слайд 2', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1318, 1525123580, 1, 'admin', 5, '110', 'Слайд 2', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1319, 1525123580, 1, 'admin', 3, '110', 'Слайд 2', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1320, 1525124036, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1321, 1525124048, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1322, 1525124051, 1, 'admin', 5, '-', 'Как можно использовать нашу продукцию - слайдер', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1323, 1525124051, 1, 'admin', 3, '111', 'Как можно использовать нашу продукцию - слайдер', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1324, 1525124065, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1325, 1525124074, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1326, 1525124078, 1, 'admin', 5, '-', 'Товары', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1327, 1525124078, 1, 'admin', 3, '112', 'Товары', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1328, 1525124095, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1329, 1525124106, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1330, 1525124106, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1331, 1525124155, 1, 'admin', 27, '111', 'Как можно использовать нашу продукцию - слайдер', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1332, 1525124157, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1333, 1525124162, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1334, 1525124177, 1, 'admin', 16, '17', 'Слайд в слайдере (кирпич)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1335, 1525124194, 1, 'admin', 20, '17', 'Слайд в слайдере (кирпич + плитка + элементы)', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1336, 1525124194, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1337, 1525124200, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1338, 1525124205, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1339, 1525124223, 1, 'admin', 5, '-', 'Слайд 1', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1340, 1525124224, 1, 'admin', 3, '113', 'Слайд 1', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1341, 1525124227, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1342, 1525124242, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1343, 1525124264, 1, 'admin', 5, '-', 'Слайд 2', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1344, 1525124264, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1345, 1525124268, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1346, 1525124285, 1, 'admin', 5, '-', 'Слайд 3', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1347, 1525124285, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1348, 1525124300, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1349, 1525124320, 1, 'admin', 5, '-', 'Слайд 4', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1350, 1525124321, 1, 'admin', 3, '116', 'Слайд 4', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1351, 1525124333, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1352, 1525124335, 1, 'admin', 3, '116', 'Слайд 4', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1353, 1525124345, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1354, 1525124395, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1355, 1525124395, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1356, 1525124436, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1357, 1525124495, 1, 'admin', 78, '39', 'stone_slide', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1358, 1525124501, 1, 'admin', 97, '39', 'stone_slide Копия', 'Duplicate Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1359, 1525124501, 1, 'admin', 78, '40', 'stone_slide Копия', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1360, 1525124550, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1361, 1525124550, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1362, 1525124576, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1363, 1525124607, 1, 'admin', 79, '40', 'plit_slide', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1364, 1525124607, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1365, 1525124627, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1366, 1525124627, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1367, 1525124667, 1, 'admin', 78, '39', 'stone_slide', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1368, 1525124673, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1369, 1525124679, 1, 'admin', 78, '39', 'stone_slide', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1370, 1525124688, 1, 'admin', 79, '39', 'stone_slide', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1371, 1525124688, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1372, 1525124692, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1373, 1525124706, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1374, 1525124707, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1375, 1525124751, 1, 'admin', 27, '113', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1376, 1525124769, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1377, 1525124827, 1, 'admin', 16, '17', 'Слайд в слайдере (кирпич + плитка + элементы)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1378, 1525124866, 1, 'admin', 27, '113', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1379, 1525124872, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1380, 1525124873, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1381, 1525124881, 1, 'admin', 301, '24', 'Слайд в слайдере \"Как можно использовать нашу продукцию\"  (кирпич)', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1382, 1525124896, 1, 'admin', 302, '24', 'Слайд в слайдере \\\"Как можно использовать нашу продукцию\\\"  (кирпич)', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1383, 1525124896, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1384, 1525124919, 1, 'admin', 301, '24', 'Слайд в слайдере \"Как можно использовать нашу продукцию\"  (кирпич)', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1385, 1525124921, 1, 'admin', 27, '113', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1386, 1525124943, 1, 'admin', 78, '39', 'stone_slide', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1387, 1525124948, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1388, 1525124978, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1389, 1525124992, 1, 'admin', 78, '39', 'stone_slide', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1390, 1525124997, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1391, 1525125000, 1, 'admin', 78, '40', 'plit_slide', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1392, 1525125014, 1, 'admin', 79, '40', 'plit_slide', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1393, 1525125014, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1394, 1525125073, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1395, 1525125108, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1396, 1525125108, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1397, 1525127740, 1, 'admin', 78, '33', 'successTpl', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1398, 1525175514, 1, 'admin', 78, '33', 'successTpl', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1399, 1525175528, 1, 'admin', 27, '113', 'Слайд 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1400, 1525175605, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1401, 1525175613, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1402, 1525175616, 1, 'admin', 5, '-', 'Элементы', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1403, 1525175617, 1, 'admin', 3, '117', 'Элементы', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1404, 1525175620, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1405, 1525175628, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1406, 1525175631, 1, 'admin', 5, '-', 'Товары', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1407, 1525175631, 1, 'admin', 3, '118', 'Товары', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1408, 1525175636, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1409, 1525175844, 1, 'admin', 5, '-', 'Колпак из гладкого кирпича', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1410, 1525175845, 1, 'admin', 3, '119', 'Колпак из гладкого кирпича', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1411, 1525175911, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1412, 1525175958, 1, 'admin', 20, '-', 'Товар (елемент)', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1413, 1525175959, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1414, 1525175964, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1415, 1525176052, 1, 'admin', 302, '-', 'Размер товара (элемент)', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1416, 1525176052, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1417, 1525176114, 1, 'admin', 302, '-', 'Размер товара (элемент)', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1418, 1525176114, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1419, 1525176157, 1, 'admin', 301, '25', 'Размер товара (элемент)', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1420, 1525176157, 1, 'admin', 301, '26', 'Размер товара (элемент)', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1421, 1525176180, 1, 'admin', 302, '25', 'Изображение товара (элемент)', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1422, 1525176180, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1423, 1525176200, 1, 'admin', 302, '26', 'Размер товара (элемент)', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1424, 1525176201, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1425, 1525176236, 1, 'admin', 302, '-', 'Вес товара (элемент)', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1426, 1525176236, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1427, 1525176286, 1, 'admin', 27, '119', 'Колпак из гладкого кирпича', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1428, 1525176295, 1, 'admin', 27, '119', 'Колпак из гладкого кирпича', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1429, 1525176298, 1, 'admin', 5, '119', 'Колпак из гладкого кирпича', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1430, 1525176298, 1, 'admin', 3, '119', 'Колпак из гладкого кирпича', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1431, 1525176304, 1, 'admin', 16, '18', 'Товар (елемент)', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1432, 1525176309, 1, 'admin', 20, '18', 'Товар (элемент)', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1433, 1525176309, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1434, 1525176313, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1435, 1525176322, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1436, 1525176383, 1, 'admin', 79, '33', 'successTpl', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1437, 1525176383, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1438, 1525176420, 1, 'admin', 78, '34', 'product_plit', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1439, 1525176428, 1, 'admin', 79, '34', 'product_plit', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1440, 1525176429, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1441, 1525176471, 1, 'admin', 79, '-', 'product_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1442, 1525176471, 1, 'admin', 78, '41', 'product_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1443, 1525176492, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1444, 1525176497, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1445, 1525176717, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1446, 1525176717, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1447, 1525176760, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1448, 1525176774, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1449, 1525176774, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1450, 1525176785, 1, 'admin', 79, '41', 'product_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1451, 1525176785, 1, 'admin', 78, '41', 'product_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1452, 1525192115, 1, 'admin', 78, '41', 'product_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1453, 1525192126, 1, 'admin', 27, '119', 'Колпак из гладкого кирпича', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1454, 1525192878, 1, 'admin', 79, '41', 'product_elem', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1455, 1525192879, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1456, 1525192899, 1, 'admin', 301, '19', 'Стоимость товара (плитка)', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1457, 1525192905, 1, 'admin', 302, '19', 'Стоимость товара (плитка)', 'Save Template Variable', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1458, 1525192905, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1459, 1525192908, 1, 'admin', 5, '119', 'Колпак из гладкого кирпича', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1460, 1525192908, 1, 'admin', 27, '119', 'Колпак из гладкого кирпича', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36');
INSERT INTO `evo_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(1461, 1525192915, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1462, 1525192925, 1, 'admin', 5, '119', 'Колпак из гладкого кирпича', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1463, 1525192925, 1, 'admin', 27, '119', 'Колпак из гладкого кирпича', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1464, 1525192950, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1465, 1525192955, 1, 'admin', 5, '-', 'Как можно использовать нашу продукцию - слайдер', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1466, 1525192956, 1, 'admin', 27, '120', 'Как можно использовать нашу продукцию - слайдер', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1467, 1525192959, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1468, 1525192971, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1469, 1525193217, 1, 'admin', 5, '-', 'Слайд 1', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1470, 1525193218, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1471, 1525193269, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1472, 1525193285, 1, 'admin', 5, '-', 'Слайд 2', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1473, 1525193286, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1474, 1525193297, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1475, 1525193321, 1, 'admin', 5, '-', 'Слайд 3', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1476, 1525193321, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1477, 1525193361, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1478, 1525193382, 1, 'admin', 5, '-', 'Слайд 4', 'Saving resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1479, 1525193382, 1, 'admin', 27, '124', 'Слайд 4', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1480, 1525193396, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1481, 1525193425, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1482, 1525193425, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1483, 1525193466, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1484, 1525193466, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1485, 1525193790, 1, 'admin', 78, '32', 'form_callme_tpl', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1486, 1525193814, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1487, 1525193825, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1488, 1525193842, 1, 'admin', 78, '30', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1489, 1525193847, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1490, 1525193859, 1, 'admin', 78, '32', 'form_callme_tpl', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1491, 1525193861, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1492, 1525193873, 1, 'admin', 78, '30', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1493, 1525193881, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1494, 1525193890, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1495, 1525193960, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1496, 1525193967, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1497, 1525193982, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1498, 1525193983, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1499, 1525194030, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1500, 1525194030, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1501, 1525194035, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1502, 1525194067, 1, 'admin', 79, '-', 'header_callback_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1503, 1525194068, 1, 'admin', 78, '42', 'header_callback_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1504, 1525194156, 1, 'admin', 79, '32', 'form_callme_tpl', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1505, 1525194156, 1, 'admin', 78, '32', 'form_callme_tpl', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1506, 1525194264, 1, 'admin', 79, '42', 'header_callback_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1507, 1525194264, 1, 'admin', 78, '42', 'header_callback_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1508, 1525194281, 1, 'admin', 79, '32', 'form_callme_tpl', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1509, 1525194281, 1, 'admin', 78, '32', 'form_callme_tpl', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1510, 1525194286, 1, 'admin', 79, '16', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1511, 1525194286, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1512, 1525194318, 1, 'admin', 79, '16', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1513, 1525194318, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1514, 1525194327, 1, 'admin', 79, '42', 'header_callback_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1515, 1525194327, 1, 'admin', 78, '42', 'header_callback_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1516, 1525194334, 1, 'admin', 79, '42', 'header_callback_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1517, 1525194334, 1, 'admin', 78, '42', 'header_callback_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1518, 1525194485, 1, 'admin', 79, '42', 'header_callback_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1519, 1525194485, 1, 'admin', 78, '42', 'header_callback_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1520, 1525194498, 1, 'admin', 79, '42', 'header_callback_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1521, 1525194499, 1, 'admin', 78, '42', 'header_callback_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1522, 1525199554, 1, 'admin', 78, '42', 'header_callback_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1523, 1525199937, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1524, 1525199951, 1, 'admin', 22, '6', 'FormLister', 'Editing Snippet', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1525, 1525256387, 1, 'admin', 22, '6', 'FormLister', 'Editing Snippet', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1526, 1525256397, 1, 'admin', 27, '79', 'Размеры', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1527, 1525262072, 1, 'admin', 58, '-', 'MODX', 'Logged in', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1528, 1525262139, 1, 'admin', 99, '-', '-', 'Manage Web Users', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1529, 1525263035, 1, 'admin', 78, '14', 'ContactForm', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1530, 1525263062, 1, 'admin', 16, '4', 'EVO startup - Bootstrap', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1531, 1525263337, 1, 'admin', 78, '42', 'header_callback_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1532, 1525263338, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1533, 1525263386, 1, 'admin', 16, '3', 'Minimal Template', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1534, 1525263396, 1, 'admin', 78, '9', 'Comments_tplForm', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1535, 1525263696, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1536, 1525263775, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1537, 1525263801, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1538, 1525263801, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1539, 1525263805, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1540, 1525263808, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1541, 1525263945, 1, 'admin', 79, '-', 'modals', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1542, 1525263946, 1, 'admin', 78, '43', 'modals', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1543, 1525263956, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1544, 1525263956, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1545, 1525263967, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1546, 1525263972, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1547, 1525263990, 1, 'admin', 79, '43', 'modals', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1548, 1525263990, 1, 'admin', 78, '43', 'modals', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1549, 1525263994, 1, 'admin', 78, '32', 'form_callme_tpl', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1550, 1525264036, 1, 'admin', 79, '43', 'modals', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1551, 1525264036, 1, 'admin', 78, '43', 'modals', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1552, 1525264105, 1, 'admin', 79, '43', 'modals', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1553, 1525264105, 1, 'admin', 78, '43', 'modals', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1554, 1525264150, 1, 'admin', 79, '32', 'form_callme_tpl', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1555, 1525264150, 1, 'admin', 78, '32', 'form_callme_tpl', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1556, 1525264190, 1, 'admin', 79, '32', 'form_modal_cb', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1557, 1525264190, 1, 'admin', 78, '32', 'form_modal_cb', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1558, 1525264209, 1, 'admin', 79, '43', 'modals', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1559, 1525264209, 1, 'admin', 78, '43', 'modals', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1560, 1525264215, 1, 'admin', 79, '32', 'form_modal_cb', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1561, 1525264215, 1, 'admin', 78, '32', 'form_modal_cb', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1562, 1525264274, 1, 'admin', 79, '32', 'form_modal_cb', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1563, 1525264274, 1, 'admin', 78, '32', 'form_modal_cb', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1564, 1525265897, 1, 'admin', 27, '78', 'Кирпич', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1565, 1525266582, 1, 'admin', 79, '43', 'modals', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1566, 1525266582, 1, 'admin', 78, '43', 'modals', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1567, 1525266592, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1568, 1525266598, 1, 'admin', 78, '33', 'successTpl', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1569, 1525266604, 1, 'admin', 79, '33', 'form_modal_cb_success', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1570, 1525266604, 1, 'admin', 78, '33', 'form_modal_cb_success', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1571, 1525273185, 1, 'admin', 78, '43', 'modals', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1572, 1525273193, 1, 'admin', 79, '43', 'modals', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1573, 1525273193, 1, 'admin', 78, '43', 'modals', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1574, 1525273357, 1, 'admin', 79, '43', 'modals', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1575, 1525273358, 1, 'admin', 78, '43', 'modals', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1576, 1525273452, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1577, 1525273498, 1, 'admin', 79, '43', 'modals', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1578, 1525273498, 1, 'admin', 78, '43', 'modals', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1579, 1525273573, 1, 'admin', 78, '42', 'header_callback_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1580, 1525273580, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1581, 1525273585, 1, 'admin', 78, '32', 'form_modal_cb', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1582, 1525273609, 1, 'admin', 79, '42', 'header_callback_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1583, 1525273609, 1, 'admin', 78, '42', 'header_callback_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1584, 1525273619, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1585, 1525273646, 1, 'admin', 79, '16', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1586, 1525273646, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1587, 1525273658, 1, 'admin', 78, '33', 'form_modal_cb_success', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1588, 1525273669, 1, 'admin', 79, '16', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1589, 1525273669, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1590, 1525273729, 1, 'admin', 79, '16', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1591, 1525273729, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1592, 1525273757, 1, 'admin', 79, '42', 'header_callback_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1593, 1525273757, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1594, 1525273763, 1, 'admin', 78, '21', 'calc', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1595, 1525273814, 1, 'admin', 79, '-', 'calc_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1596, 1525273814, 1, 'admin', 78, '44', 'calc_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1597, 1525273969, 1, 'admin', 79, '21', 'calc', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1598, 1525273969, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1599, 1525273975, 1, 'admin', 79, '-', 'Untitled chunk', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1600, 1525273976, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1601, 1525273983, 1, 'admin', 78, '44', 'calc_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1602, 1525273988, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1603, 1525273991, 1, 'admin', 78, '21', 'calc', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1604, 1525274091, 1, 'admin', 79, '44', 'calc_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1605, 1525274091, 1, 'admin', 78, '44', 'calc_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1606, 1525274188, 1, 'admin', 79, '44', 'calc_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1607, 1525274188, 1, 'admin', 78, '44', 'calc_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1608, 1525274205, 1, 'admin', 97, '33', 'form_modal_cb_success Копия', 'Duplicate Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1609, 1525274205, 1, 'admin', 78, '46', 'form_modal_cb_success Копия', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1610, 1525274219, 1, 'admin', 79, '21', 'calc', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1611, 1525274219, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1612, 1525274269, 1, 'admin', 79, '46', 'calc_success', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1613, 1525274270, 1, 'admin', 78, '46', 'calc_success', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1614, 1525274283, 1, 'admin', 80, '45', 'Untitled chunk', 'Deleting Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1615, 1525274283, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1616, 1525274301, 1, 'admin', 78, '44', 'calc_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1617, 1525274332, 1, 'admin', 79, '44', 'calc_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1618, 1525274332, 1, 'admin', 78, '44', 'calc_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1619, 1525274475, 1, 'admin', 78, '21', 'calc', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1620, 1525274490, 1, 'admin', 79, '21', 'calc', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1621, 1525274490, 1, 'admin', 78, '21', 'calc', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1622, 1525274553, 1, 'admin', 79, '21', 'calc', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1623, 1525274553, 1, 'admin', 78, '21', 'calc', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1624, 1525274583, 1, 'admin', 79, '44', 'calc_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1625, 1525274583, 1, 'admin', 78, '44', 'calc_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1626, 1525274761, 1, 'admin', 79, '44', 'calc_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1627, 1525274761, 1, 'admin', 78, '44', 'calc_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1628, 1525274841, 1, 'admin', 79, '46', 'calc_success', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1629, 1525274841, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1630, 1525274849, 1, 'admin', 78, '32', 'form_modal_cb', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1631, 1525274851, 1, 'admin', 78, '42', 'header_callback_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1632, 1525274866, 1, 'admin', 79, '32', 'form_modal_cb', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1633, 1525274867, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1634, 1525274872, 1, 'admin', 78, '42', 'header_callback_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1635, 1525274893, 1, 'admin', 79, '42', 'header_callback_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1636, 1525274893, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1637, 1525275130, 1, 'admin', 79, '44', 'calc_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1638, 1525275130, 1, 'admin', 78, '44', 'calc_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1639, 1525275133, 1, 'admin', 78, '32', 'form_modal_cb', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1640, 1525275147, 1, 'admin', 79, '32', 'form_modal_cb', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1641, 1525275147, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1642, 1525275152, 1, 'admin', 78, '42', 'header_callback_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1643, 1525275160, 1, 'admin', 79, '42', 'header_callback_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1644, 1525275160, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1645, 1525277360, 1, 'admin', 79, '21', 'calc', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1646, 1525277360, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1647, 1525277367, 1, 'admin', 79, '44', 'calc_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1648, 1525277367, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1649, 1525277374, 1, 'admin', 78, '29', 'ask', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1650, 1525277462, 1, 'admin', 79, '-', 'ask_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1651, 1525277462, 1, 'admin', 78, '47', 'ask_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1652, 1525277490, 1, 'admin', 78, '21', 'calc', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1653, 1525277522, 1, 'admin', 79, '29', 'ask', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1654, 1525277522, 1, 'admin', 78, '29', 'ask', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1655, 1525277536, 1, 'admin', 79, '29', 'ask', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1656, 1525277536, 1, 'admin', 78, '29', 'ask', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1657, 1525277549, 1, 'admin', 79, '29', 'ask', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1658, 1525277549, 1, 'admin', 78, '29', 'ask', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1659, 1525277563, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1660, 1525277592, 1, 'admin', 79, '-', 'ask_success', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1661, 1525277592, 1, 'admin', 78, '48', 'ask_success', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1662, 1525277609, 1, 'admin', 79, '21', 'calc', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1663, 1525277609, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1664, 1525277628, 1, 'admin', 78, '46', 'calc_success', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1665, 1525277657, 1, 'admin', 79, '48', 'ask_success', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1666, 1525277657, 1, 'admin', 78, '48', 'ask_success', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1667, 1525277719, 1, 'admin', 79, '42', 'header_callback_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1668, 1525277719, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1669, 1525277832, 1, 'admin', 79, '47', 'ask_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1670, 1525277832, 1, 'admin', 78, '47', 'ask_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1671, 1525278038, 1, 'admin', 78, '44', 'calc_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1672, 1525278063, 1, 'admin', 79, '47', 'ask_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1673, 1525278064, 1, 'admin', 78, '47', 'ask_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1674, 1525278069, 1, 'admin', 79, '44', 'calc_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1675, 1525278070, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1676, 1525278078, 1, 'admin', 78, '32', 'form_modal_cb', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1677, 1525278085, 1, 'admin', 79, '32', 'form_modal_cb', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1678, 1525278085, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1679, 1525278092, 1, 'admin', 78, '42', 'header_callback_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1680, 1525278100, 1, 'admin', 79, '42', 'header_callback_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1681, 1525278100, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1682, 1525278480, 1, 'admin', 102, '12', 'evoAjax', 'Edit plugin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1683, 1525278505, 1, 'admin', 78, '3', 'AjaxSearch_tplInput', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1684, 1525278510, 1, 'admin', 78, '9', 'Comments_tplForm', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1685, 1525278510, 1, 'admin', 78, '14', 'ContactForm', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1686, 1525278555, 1, 'admin', 78, '15', 'ContactFormReport', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1687, 1525278556, 1, 'admin', 78, '14', 'ContactForm', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1688, 1525278556, 1, 'admin', 78, '9', 'Comments_tplForm', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1689, 1525278559, 1, 'admin', 78, '13', 'Comments', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1690, 1525278565, 1, 'admin', 78, '4', 'AjaxSearch_tplAjaxResult', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1691, 1525278645, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1692, 1525278653, 1, 'admin', 78, '13', 'Comments', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1693, 1525278665, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1694, 1525278683, 1, 'admin', 16, '3', 'Minimal Template', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1695, 1525278686, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1696, 1525278689, 1, 'admin', 16, '4', 'EVO startup - Bootstrap', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1697, 1525278734, 1, 'admin', 78, '9', 'Comments_tplForm', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1698, 1525278740, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1699, 1525278750, 1, 'admin', 78, '14', 'ContactForm', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36');
INSERT INTO `evo_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(1700, 1525278818, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1701, 1525278829, 1, 'admin', 78, '44', 'calc_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1702, 1525278950, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1703, 1525278984, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1704, 1525279003, 1, 'admin', 78, '29', 'ask', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1705, 1525279013, 1, 'admin', 79, '29', 'ask', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1706, 1525279013, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1707, 1525279017, 1, 'admin', 78, '21', 'calc', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1708, 1525279024, 1, 'admin', 79, '21', 'calc', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1709, 1525279024, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1710, 1525281196, 1, 'admin', 78, '16', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1711, 1525281207, 1, 'admin', 79, '16', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1712, 1525281207, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1713, 1525281216, 1, 'admin', 78, '43', 'modals', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1714, 1525281225, 1, 'admin', 79, '43', 'modals', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1715, 1525281225, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1716, 1525281304, 1, 'admin', 103, '12', 'evoAjax', 'Saving plugin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1717, 1525281305, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1718, 1525281375, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1719, 1525281383, 1, 'admin', 30, '-', '-', 'Saving settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1720, 1525281578, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1721, 1525289933, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1722, 1525289952, 1, 'admin', 30, '-', '-', 'Saving settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1723, 1525289978, 1, 'admin', 10, '-', '-', 'Viewing/ composing messages', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1724, 1525290085, 1, 'admin', 10, '-', '-', 'Viewing/ composing messages', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1725, 1525291037, 1, 'admin', 102, '12', 'evoAjax', 'Edit plugin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1726, 1525291090, 1, 'admin', 79, '44', 'calc_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1727, 1525291090, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1728, 1525292479, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1729, 1525292506, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1730, 1525292506, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1731, 1525292643, 1, 'admin', 16, '5', 'electron', 'Editing template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1732, 1525292652, 1, 'admin', 20, '5', 'electron', 'Saving template', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1733, 1525292652, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1734, 1525298596, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1735, 1525302741, 1, 'admin', 78, '43', 'modals', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1736, 1525302758, 1, 'admin', 79, '43', 'modals', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1737, 1525302758, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1738, 1525302813, 1, 'admin', 78, '19', 'products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1739, 1525302832, 1, 'admin', 79, '19', 'products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1740, 1525302832, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1741, 1525304611, 1, 'admin', 78, '30', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1742, 1525304652, 1, 'admin', 79, '30', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1743, 1525304652, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1744, 1525304854, 1, 'admin', 78, '30', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1745, 1525304872, 1, 'admin', 79, '30', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1746, 1525304872, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1747, 1525305385, 1, 'admin', 102, '12', 'evoAjax', 'Edit plugin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1748, 1525305388, 1, 'admin', 102, '12', 'evoAjax', 'Edit plugin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1749, 1525305424, 1, 'admin', 78, '42', 'header_callback_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1750, 1525305433, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1751, 1525305436, 1, 'admin', 78, '47', 'ask_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1752, 1525305442, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1753, 1525305445, 1, 'admin', 78, '48', 'ask_success', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1754, 1525305446, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1755, 1525305449, 1, 'admin', 78, '44', 'calc_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1756, 1525305471, 1, 'admin', 17, '-', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1757, 1525305572, 1, 'admin', 78, '14', 'ContactForm', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1758, 1525305771, 1, 'admin', 103, '12', 'evoAjax', 'Saving plugin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1759, 1525305771, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1760, 1525305779, 1, 'admin', 102, '12', 'evoAjax', 'Edit plugin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1761, 1525305795, 1, 'admin', 103, '12', 'evoAjax', 'Saving plugin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1762, 1525305795, 1, 'admin', 102, '12', 'evoAjax', 'Edit plugin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1763, 1525305827, 1, 'admin', 103, '12', 'evoAjax', 'Saving plugin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1764, 1525305827, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1765, 1525305839, 1, 'admin', 78, '43', 'modals', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1766, 1525305868, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1767, 1525305901, 1, 'admin', 79, '-', 'Untitled chunk', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1768, 1525305901, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1769, 1525305904, 1, 'admin', 78, '49', 'Untitled chunk', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1770, 1525305938, 1, 'admin', 79, '49', 'product_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1771, 1525305938, 1, 'admin', 78, '49', 'product_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1772, 1525305946, 1, 'admin', 78, '43', 'modals', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1773, 1525305956, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1774, 1525305997, 1, 'admin', 79, '43', 'modals', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1775, 1525305997, 1, 'admin', 78, '43', 'modals', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1776, 1525306015, 1, 'admin', 79, '49', 'form_product', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1777, 1525306016, 1, 'admin', 78, '49', 'form_product', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1778, 1525306035, 1, 'admin', 78, '47', 'ask_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1779, 1525306177, 1, 'admin', 79, '49', 'form_product', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1780, 1525306177, 1, 'admin', 78, '49', 'form_product', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1781, 1525306189, 1, 'admin', 79, '43', 'modals', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1782, 1525306189, 1, 'admin', 78, '43', 'modals', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1783, 1525306264, 1, 'admin', 79, '47', 'ask_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1784, 1525306264, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1785, 1525306271, 1, 'admin', 78, '48', 'ask_success', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1786, 1525306275, 1, 'admin', 97, '48', 'ask_success Копия', 'Duplicate Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1787, 1525306275, 1, 'admin', 78, '50', 'ask_success Копия', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1788, 1525306329, 1, 'admin', 79, '49', 'form_product', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1789, 1525306329, 1, 'admin', 78, '49', 'form_product', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1790, 1525306401, 1, 'admin', 79, '50', 'form_product_success', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1791, 1525306401, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1792, 1525306423, 1, 'admin', 79, '49', 'form_product', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1793, 1525306423, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1794, 1525306457, 1, 'admin', 79, '43', 'modals', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1795, 1525306457, 1, 'admin', 78, '43', 'modals', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1796, 1525306465, 1, 'admin', 79, '-', 'production', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1797, 1525306465, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1798, 1525306467, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1799, 1525306472, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1800, 1525306476, 1, 'admin', 78, '51', 'production', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1801, 1525306480, 1, 'admin', 79, '51', 'production', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1802, 1525306480, 1, 'admin', 78, '51', 'production', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1803, 1525306505, 1, 'admin', 78, '47', 'ask_form', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1804, 1525306529, 1, 'admin', 79, '51', 'production', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1805, 1525306529, 1, 'admin', 78, '51', 'production', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1806, 1525306615, 1, 'admin', 79, '51', 'production', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1807, 1525306615, 1, 'admin', 78, '51', 'production', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1808, 1525306712, 1, 'admin', 79, '43', 'modals', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1809, 1525306712, 1, 'admin', 78, '43', 'modals', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1810, 1525306730, 1, 'admin', 79, '47', 'ask_form', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1811, 1525306730, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1812, 1525306968, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1813, 1525306971, 1, 'admin', 78, '43', 'modals', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1814, 1525307009, 1, 'admin', 79, '51', 'production', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1815, 1525307009, 1, 'admin', 78, '51', 'production', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1816, 1525307027, 1, 'admin', 79, '43', 'modals', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1817, 1525307027, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1818, 1525307036, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1819, 1525307060, 1, 'admin', 79, '-', 'production_success', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1820, 1525307060, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1821, 1525307064, 1, 'admin', 78, '33', 'form_modal_cb_success', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1822, 1525307070, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1823, 1525307076, 1, 'admin', 78, '52', 'production_success', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1824, 1525307094, 1, 'admin', 79, '52', 'production_success', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1825, 1525307094, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1826, 1525537269, 1, 'admin', 27, '60', 'Сертификат 1', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1827, 1525537283, 1, 'admin', 76, '-', '-', 'Element management', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1828, 1525537289, 1, 'admin', 78, '25', 'sert_slider_elem', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(1829, 1525537311, 1, 'admin', 27, '59', 'Сертификаты', 'Editing resource', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36');

-- --------------------------------------------------------

--
-- Структура таблицы `evo_manager_users`
--

CREATE TABLE `evo_manager_users` (
  `id` int(10) NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains login information for backend users.';

--
-- Дамп данных таблицы `evo_manager_users`
--

INSERT INTO `evo_manager_users` (`id`, `username`, `password`) VALUES
(1, 'admin', '$P$Byt//VpWtqRr3BLnGo6Blo4Dt0xNfk1');

-- --------------------------------------------------------

--
-- Структура таблицы `evo_membergroup_access`
--

CREATE TABLE `evo_membergroup_access` (
  `id` int(10) NOT NULL,
  `membergroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `evo_membergroup_names`
--

CREATE TABLE `evo_membergroup_names` (
  `id` int(10) NOT NULL,
  `name` varchar(245) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `evo_member_groups`
--

CREATE TABLE `evo_member_groups` (
  `id` int(10) NOT NULL,
  `user_group` int(10) NOT NULL DEFAULT '0',
  `member` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `evo_site_content`
--

CREATE TABLE `evo_site_content` (
  `id` int(10) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'document',
  `contentType` varchar(50) NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(255) NOT NULL DEFAULT '',
  `longtitle` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(245) DEFAULT '',
  `link_attributes` varchar(255) NOT NULL DEFAULT '' COMMENT 'Link attriubtes',
  `published` int(1) NOT NULL DEFAULT '0',
  `pub_date` int(20) NOT NULL DEFAULT '0',
  `unpub_date` int(20) NOT NULL DEFAULT '0',
  `parent` int(10) NOT NULL DEFAULT '0',
  `isfolder` int(1) NOT NULL DEFAULT '0',
  `introtext` text COMMENT 'Used to provide quick summary of the document',
  `content` mediumtext,
  `richtext` tinyint(1) NOT NULL DEFAULT '1',
  `template` int(10) NOT NULL DEFAULT '0',
  `menuindex` int(10) NOT NULL DEFAULT '0',
  `searchable` int(1) NOT NULL DEFAULT '1',
  `cacheable` int(1) NOT NULL DEFAULT '1',
  `createdby` int(10) NOT NULL DEFAULT '0',
  `createdon` int(20) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  `editedon` int(20) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `deletedon` int(20) NOT NULL DEFAULT '0',
  `deletedby` int(10) NOT NULL DEFAULT '0',
  `publishedon` int(20) NOT NULL DEFAULT '0' COMMENT 'Date the document was published',
  `publishedby` int(10) NOT NULL DEFAULT '0' COMMENT 'ID of user who published the document',
  `menutitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title',
  `donthit` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disable page hit count',
  `privateweb` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private web document',
  `privatemgr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private manager document',
  `content_dispo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-inline, 1-attachment',
  `hidemenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hide document from menu',
  `alias_visible` int(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains the site document tree.';

--
-- Дамп данных таблицы `evo_site_content`
--

INSERT INTO `evo_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `donthit`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `alias_visible`) VALUES
(1, 'document', 'text/html', 'Кирпич', 'Добро пожаловать на сайт кирпичей', 'Купить кирпичи', 'index', '', 1, 0, 0, 0, 1, 'Главная страница сайта компании \"КирпичЪ\"', '', 1, 5, 1, 1, 1, 1, 1144904400, 1, 1524943770, 0, 0, 0, 0, 0, 'Home', 0, 0, 0, 0, 0, 1),
(56, 'document', 'text/html', 'Слайд 2', '', '', 'slajd-2', '', 1, 0, 0, 54, 0, '', 'Доставка товара за 5 дней <br /> до строительной площадки <br /> заказчика', 1, 8, 0, 0, 1, 1, 1524918114, 1, 1524927791, 0, 0, 0, 1524918114, 1, '', 0, 0, 0, 0, 1, 1),
(55, 'document', 'text/html', 'Слайд 1', '', '', 'slajd-1', '', 1, 0, 0, 54, 0, '', 'Индивидуальный подход <br /> к каждому клиенту', 1, 8, 0, 0, 1, 1, 1524918087, 1, 1524927820, 0, 0, 0, 1524918087, 1, '', 0, 0, 0, 0, 0, 1),
(57, 'document', 'text/html', 'Слайд 3', '', '', 'slajd-3', '', 1, 0, 0, 54, 0, '', 'Яркие и насыщенные <br> цвета', 1, 8, 0, 0, 1, 1, 1524924671, 1, 1524924671, 0, 0, 0, 1524924671, 1, '', 0, 0, 0, 0, 0, 1),
(58, 'document', 'text/html', 'Слайд 4', '', '', 'slajd-4', '', 1, 0, 0, 54, 0, '', 'Собственное <br /> производство', 1, 8, 0, 0, 1, 1, 1524924719, 1, 1524927760, 0, 0, 0, 1524924719, 1, '', 0, 0, 0, 0, 1, 1),
(59, 'document', 'text/html', 'Сертификаты', '', '', 'sertifikaty', '', 1, 0, 0, 1, 1, '', '', 1, 0, 0, 0, 1, 1, 1524928379, 1, 1524928449, 0, 0, 0, 1524928379, 1, '', 0, 0, 0, 0, 1, 1),
(60, 'document', 'text/html', 'Сертификат 1', '', '', 'sertifikat-1', '', 1, 0, 0, 59, 0, '', '', 1, 9, 0, 0, 1, 1, 1524928574, 1, 1524935795, 0, 0, 0, 1524928574, 1, '', 0, 0, 0, 0, 1, 1),
(61, 'document', 'text/html', 'Сертификат 2', '', '', 'sertifikat-2', '', 1, 0, 0, 59, 0, '', '', 1, 9, 0, 0, 1, 1, 1524935857, 1, 1524935857, 0, 0, 0, 1524935857, 1, '', 0, 0, 0, 0, 0, 1),
(62, 'document', 'text/html', 'Сертификат 3', '', '', 'sertifikat-3', '', 1, 0, 0, 59, 0, '', '', 1, 9, 0, 0, 1, 1, 1524935901, 1, 1524935901, 0, 0, 0, 1524935901, 1, '', 0, 0, 0, 0, 0, 1),
(63, 'document', 'text/html', 'Наши партнеры', '', '', 'nashi-partnery', '', 1, 0, 0, 1, 1, '', '', 1, 0, 0, 0, 1, 1, 1524937544, 1, 1524937558, 0, 0, 0, 1524937544, 1, '', 0, 0, 0, 0, 0, 1),
(64, 'document', 'text/html', 'Optima', '', '', 'optima', '', 1, 0, 0, 63, 0, '', '', 1, 10, 0, 0, 1, 1, 1524937579, 1, 1524938049, 0, 0, 0, 1524937579, 1, '', 0, 0, 0, 0, 0, 1),
(65, 'document', 'text/html', 'Авто кореец', '', '', 'avto-koreec', '', 1, 0, 0, 63, 0, '', '', 1, 10, 0, 0, 1, 1, 1524938103, 1, 1524938103, 0, 0, 0, 1524938103, 1, '', 0, 0, 0, 0, 0, 1),
(66, 'document', 'text/html', 'Авто японец', '', '', 'avto-yaponec', '', 1, 0, 0, 63, 0, '', '', 1, 10, 0, 0, 1, 1, 1524938133, 1, 1524938133, 0, 0, 0, 1524938133, 1, '', 0, 0, 0, 0, 0, 1),
(67, 'document', 'text/html', 'Инжстройснаб', '', '', 'inzhstrojsnab', '', 1, 0, 0, 63, 0, '', '', 1, 10, 0, 0, 1, 1, 1524938167, 1, 1524938167, 0, 0, 0, 1524938167, 1, '', 0, 0, 0, 0, 0, 1),
(68, 'document', 'text/html', 'Сбербанк', '', '', 'sberbank', '', 1, 0, 0, 63, 0, '', '', 1, 10, 0, 0, 1, 1, 1524938196, 1, 1524938196, 0, 0, 0, 1524938196, 1, '', 0, 0, 0, 0, 0, 1),
(69, 'document', 'text/html', 'РоссельхозБанк', '', '', 'rosselhozbank', '', 1, 0, 0, 63, 0, '', '', 1, 10, 0, 0, 1, 1, 1524938232, 1, 1524938232, 0, 0, 0, 1524938232, 1, '', 0, 0, 0, 0, 0, 1),
(70, 'document', 'text/html', 'Альфа-банк', '', '', 'alfa-bank', '', 1, 0, 0, 63, 0, '', '', 1, 10, 0, 0, 1, 1, 1524938322, 1, 1524938322, 0, 0, 0, 1524938322, 1, '', 0, 0, 0, 0, 0, 1),
(71, 'document', 'text/html', 'УралБизнесЛизинг', '', '', 'uralbizneslizing', '', 1, 0, 0, 63, 0, '', '', 1, 10, 0, 0, 1, 1, 1524938358, 1, 1524938361, 0, 0, 0, 1524938358, 1, '', 0, 0, 0, 0, 0, 1),
(72, 'document', 'text/html', 'Отзывы', '', '', 'otzyvy', '', 1, 0, 0, 1, 1, '', '', 1, 0, 0, 0, 1, 1, 1524940097, 1, 1524940097, 0, 0, 0, 1524940097, 1, '', 0, 0, 0, 0, 0, 1),
(73, 'document', 'text/html', 'Игорь Тюлькин', '', '', 'igor-tyulkin', '', 1, 0, 0, 72, 0, '', '<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров обеспечивает широкому кругу (специалистов) участие в формировании позиций, занимаемых участниками в отношении поставленных задач. С другой стороны новая модель организационной деятельности обеспечивает широкому</p>', 1, 11, 1, 0, 1, 1, 1524940189, 1, 1524940700, 0, 0, 0, 1524940189, 1, '', 0, 0, 0, 0, 0, 1),
(2, 'document', 'text/html', 'Blog', 'My Blog', '', 'blog', '', 1, 0, 0, 0, 1, '', '[[DocLister? \n	&jotcount=`1`\n	&parents=`2` \n	&display=`2`\n	&tvPrefix=``\n	&tvList=`image`\n	&prepare=`prepareBlog`\n	&summary=`notags,len:350` \n	&tpl=`@CODE:\n		<div class=\"dl_summaryPost\">\n			[+blog-image+]	\n			<h3><a href=\"[~[+id+]~]\" title=\"[+e.title+]\">[+e.title+]</a></h3>\n			<div class=\"dl_info\">\n				By <strong>[+author+]</strong> on [+date+].\n				<a href=\"[+url+]#commentsAnchor\">Comments <span class=\"badge\">[+jotcount+]</span></a>\n			</div>\n			[+summary+]\n			<p class=\"dl_link\">[+link+]</p>\n		</div>` \n	&paginate=`1` \n]]\n\n<p>Showing <strong>[+current+]</strong> of <strong>[+totalPages+]</strong> Pages</p>\n<div id=\"dl_pages\">[+pages+]</div>\n<p>&nbsp;</p>', 0, 4, 2, 0, 1, 1, 1144904400, 1, 1507727477, 0, 0, 0, 0, 0, 'Blog', 0, 0, 0, 0, 0, 1),
(4, 'document', 'text/html', 'Profile', 'User profile', '', 'profile', '', 1, 0, 0, 0, 1, '', '[!FormLister?\n&debug=`1`\n&formid=`login`\n&controller=`Login`\n&loginField=`email`\n&redirectTo=`49`\n&defaults=`{\"rememberme\":1}`\n&rules=`{\n	\"email\":{\n		\"required\":\"Enter your Email\"\n	},\n	\"password\":{\n		\"required\":\"Enter your password\"\n	}\n}`\n&formTpl=`@CODE:\n\n<p>In order to comment on blog entries, you must be a registered user of [(site_name)]. If you haven\'t already registered, you can <a href=\"[~5~]\">request an account</a>.</p>\n\n<form class=\"form-horizontal\" method=\"post\" action=\"[(site_url)][~[*id*]~]\">\n	[+form.messages+]\n	<input type=\"hidden\" name=\"formid\" value=\"login\">\n	<div class=\"form-group [+email.classname+] row\">\n		<div class=\"col-sm-12\">\n			<label for=\"email\">Email:</label>\n			<input class=\"form-control\" name=\"email\" value=\"[+email.value+]\" id=\"email\" placeholder=\"Email\">\n		</div>\n	</div>\n	<div class=\"form-group [+password.classname+]\">\n		<div class=\"col-sm-12\">\n			<label for=\"password\">Password:</label>\n			<input type=\"password\" class=\"form-control\" name=\"password\" id=\"password\" placeholder=\"Password\" value=\"[+password.value+]\">\n		</div>\n	</div>\n\n	<div class=\"form-group\">\n		<div class=\"col-sm-8 col-xs-8 sign-in-block\">\n			<a href=\"[~37~]\">Forgot Password</a>\n		</div>\n		<div class=\"col-sm-4 col-xs-4 login-button\">\n			<button type=\"submit\" class=\"btn btn-primary pull-right\"><i class=\"glyphicon glyphicon-log-in\"></i> Login</button>\n		</div>\n	</div>\n</form>\n`\n&skipTpl=`@CODE:\n	<div class=\"text-center\">Hello!</div>\n	<div class=\"text-center\">\n		<a class=\"btn btn-primary\" href=\"[~49~]\"> Edit profile</a> \n		<a class=\"btn btn-primary\" href=\"?logout\"> Logout</a>\n	</div>`\n\n&allowedFields=`email,password`\n&errorTpl=`@CODE:<p>[+message+]</p>`\n&messagesOuterTpl=`@CODE:\n	<div class=\"text-danger\">[+messages+]</div>`\n\n&errorClass=` has-error` \n&requiredClass=` has-warning`\n!]		\n', 0, 4, 7, 0, 1, 1, 1144904400, 1, 1509817775, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0),
(5, 'document', 'text/html', 'Request an Account', 'Sign Up for Full Site Privileges', '', 'request-an-account', '', 1, 0, 0, 4, 0, '', '  [!FormLister?\n	&formid=`registerForm`\n	&controller=`Register`\n	&requiredClass=`has-warning`\n	&errorClass=`has-error`\n	&errorTpl=`@CODE:<small class=\"help-block\">[+message+]</small>`\n	&allowedFields=`email,username,fullname,country`\n	&rules=`{\n		\"username\":{\n			\"required\":\"Enter your username\",\n			\"alphaNumeric\":\"Only letters and numbers\",\n			\"custom\":{\n				\"function\":\"\\\\FormLister\\\\Register::uniqueUsername\",\n				\"message\":\"Name already taken\"\n			}\n		},\n		\"email\":{\n			\"required\":\"Enter email\",\n			\"email\":\"Incorrect email\",\n			\"custom\":{\n				\"function\":\"\\\\FormLister\\\\Register::uniqueEmail\",\n				\"message\":\"This email is already in use by another user\"\n			}\n		},\n		\"password\":{\n			\"required\":\"Enter password\"\n		},\n		\"repeatPassword\":{\n			\"required\":\"Retype password\",\n			\"equals\":{\n				\"message\":\"Passwords do not match\"\n			}\n		}\n	}`\n	&captcha=`modxCaptcha`\n	&formTpl=`@CODE: \n\n<form role=\"form\" id=\"websignupfrm\" method=\"post\" name=\"websignupfrm\" action=\"[+action+]\">\n	<input type=\"hidden\" name=\"formid\" value=\"registerForm\"/>\n    <h3>User Details</h3>\n	<div class=\"alert alert-warning\">\n		<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n		Items marked by * are required\n	</div>\n	\n	<div class=\"form-group [+username.classname+]\">\n		<label class=\"control-label\" for=\"su_username\">User name:*</label> \n		<input type=\"text\" name=\"username\" id=\"su_username\" class=\"form-control\" maxlength=\"30\" value=\"[+username.value+]\" placeholder=\"Enter Username\"/>\n		[+username.error+]\n	</div>\n	\n	<div class=\"form-group [+fullname.classname+]\">\n        <label class=\"control-label\" for=\"fullname\">Full name:</label> \n		<input type=\"text\" name=\"fullname\" id=\"fullname\" class=\"form-control\" maxlength=\"100\" value=\"[+fullname.value+]\" placeholder=\"Enter fullname\"/>\n		[+fullname.error+]\n	</div>\n	\n	<div class=\"form-group  [+email.classname+]\">\n		<label class=\"control-label\" for=\"email\">Email address:*</label> \n		<input type=\"text\" name=\"email\" id=\"email\" class=\"form-control\" value=\"[+email.value+]\" placeholder=\"Enter email\"/>\n		[+email.error+]\n	</div>\n\n	<div class=\"form-group [+password.classname+]\">\n	    <h3>Password</h3>\n	    <label class=\"control-label\" for=\"su_password\">Password:*</label> \n		<input type=\"password\" name=\"password\" id=\"su_password\" class=\"form-control\" placeholder=\"Enter password\"/>\n		[+password.error+]\n	</div>\n	<div class=\"form-group [+repeatPassword.classname+]\">\n	    <label class=\"control-label\" for=\"confirmpassword\">Confirm password:*</label> \n		<input type=\"password\" name=\"repeatPassword\" id=\"confirmpassword\" class=\"form-control\" placeholder=\"Confirm password\"/>\n		[+repeatPassword.error+]\n	</div>\n	\n	<div class=\"form-group [+country.classname+]\">\n		<h3>Optional Account Profile Info</h3>\n		<label class=\"control-label\" for=\"country\">Country:</label>\n		<select size=\"1\" name=\"country\" id=\"country\" class=\"form-control\" >\n			<option value=\"\" selected=\"selected\">&nbsp;</option>\n			<option value=\"1\">Afghanistan</option>\n			<option value=\"2\">Albania</option>\n			<option value=\"3\">Algeria</option>\n			<option value=\"4\">American Samoa</option>\n			<option value=\"5\">Andorra</option>\n			<option value=\"6\">Angola</option>\n			<option value=\"7\">Anguilla</option>\n			<option value=\"8\">Antarctica</option>\n			<option value=\"9\">Antigua and Barbuda</option>\n			<option value=\"10\">Argentina</option>\n			<option value=\"11\">Armenia</option>\n			<option value=\"12\">Aruba</option>\n			<option value=\"13\">Australia</option>\n			<option value=\"14\">Austria</option>\n			<option value=\"15\">Azerbaijan</option>\n			<option value=\"16\">Bahamas</option>\n			<option value=\"17\">Bahrain</option>\n			<option value=\"18\">Bangladesh</option>\n			<option value=\"19\">Barbados</option>\n			<option value=\"20\">Belarus</option>\n			<option value=\"21\">Belgium</option>\n			<option value=\"22\">Belize</option>\n			<option value=\"23\">Benin</option>\n			<option value=\"24\">Bermuda</option>\n			<option value=\"25\">Bhutan</option>\n			<option value=\"26\">Bolivia</option>\n			<option value=\"27\">Bosnia and Herzegowina</option>\n			<option value=\"28\">Botswana</option>\n			<option value=\"29\">Bouvet Island</option>\n			<option value=\"30\">Brazil</option>\n			<option value=\"31\">British Indian Ocean Territory</option>\n			<option value=\"32\">Brunei Darussalam</option>\n			<option value=\"33\">Bulgaria</option>\n			<option value=\"34\">Burkina Faso</option>\n			<option value=\"35\">Burundi</option>\n			<option value=\"36\">Cambodia</option>\n			<option value=\"37\">Cameroon</option>\n			<option value=\"38\">Canada</option>\n			<option value=\"39\">Cape Verde</option>\n			<option value=\"40\">Cayman Islands</option>\n			<option value=\"41\">Central African Republic</option>\n			<option value=\"42\">Chad</option>\n			<option value=\"43\">Chile</option>\n			<option value=\"44\">China</option>\n			<option value=\"45\">Christmas Island</option>\n			<option value=\"46\">Cocos (Keeling) Islands</option>\n			<option value=\"47\">Colombia</option>\n			<option value=\"48\">Comoros</option>\n			<option value=\"49\">Congo</option>\n			<option value=\"50\">Cook Islands</option>\n			<option value=\"51\">Costa Rica</option>\n			<option value=\"52\">Cote D&#39;Ivoire</option>\n			<option value=\"53\">Croatia</option>\n			<option value=\"54\">Cuba</option>\n			<option value=\"55\">Cyprus</option>\n			<option value=\"56\">Czech Republic</option>\n			<option value=\"57\">Denmark</option>\n			<option value=\"58\">Djibouti</option>\n			<option value=\"59\">Dominica</option>\n			<option value=\"60\">Dominican Republic</option>\n			<option value=\"61\">East Timor</option>\n			<option value=\"62\">Ecuador</option>\n			<option value=\"63\">Egypt</option>\n			<option value=\"64\">El Salvador</option>\n			<option value=\"65\">Equatorial Guinea</option>\n			<option value=\"66\">Eritrea</option>\n			<option value=\"67\">Estonia</option>\n			<option value=\"68\">Ethiopia</option>\n			<option value=\"69\">Falkland Islands (Malvinas)</option>\n			<option value=\"70\">Faroe Islands</option>\n			<option value=\"71\">Fiji</option>\n			<option value=\"72\">Finland</option>\n			<option value=\"73\">France</option>\n			<option value=\"74\">France, Metropolitan</option>\n			<option value=\"75\">French Guiana</option>\n			<option value=\"76\">French Polynesia</option>\n			<option value=\"77\">French Southern Territories</option>\n			<option value=\"78\">Gabon</option>\n			<option value=\"79\">Gambia</option>\n			<option value=\"80\">Georgia</option>\n			<option value=\"81\">Germany</option>\n			<option value=\"82\">Ghana</option>\n			<option value=\"83\">Gibraltar</option>\n			<option value=\"84\">Greece</option>\n			<option value=\"85\">Greenland</option>\n			<option value=\"86\">Grenada</option>\n			<option value=\"87\">Guadeloupe</option>\n			<option value=\"88\">Guam</option>\n			<option value=\"89\">Guatemala</option>\n			<option value=\"90\">Guinea</option>\n			<option value=\"91\">Guinea-bissau</option>\n			<option value=\"92\">Guyana</option>\n			<option value=\"93\">Haiti</option>\n			<option value=\"94\">Heard and Mc Donald Islands</option>\n			<option value=\"95\">Honduras</option>\n			<option value=\"96\">Hong Kong</option>\n			<option value=\"97\">Hungary</option>\n			<option value=\"98\">Iceland</option>\n			<option value=\"99\">India</option>\n			<option value=\"100\">Indonesia</option>\n			<option value=\"101\">Iran (Islamic Republic of)</option>\n			<option value=\"102\">Iraq</option>\n			<option value=\"103\">Ireland</option>\n			<option value=\"104\">Israel</option>\n			<option value=\"105\">Italy</option>\n			<option value=\"106\">Jamaica</option>\n			<option value=\"107\">Japan</option>\n			<option value=\"108\">Jordan</option>\n			<option value=\"109\">Kazakhstan</option>\n			<option value=\"110\">Kenya</option>\n			<option value=\"111\">Kiribati</option>\n			<option value=\"112\">Korea, Democratic People&#39;s Republic of</option>\n			<option value=\"113\">Korea, Republic of</option>\n			<option value=\"114\">Kuwait</option>\n			<option value=\"115\">Kyrgyzstan</option>\n			<option value=\"116\">Lao People&#39;s Democratic Republic</option>\n			<option value=\"117\">Latvia</option>\n			<option value=\"118\">Lebanon</option>\n			<option value=\"119\">Lesotho</option>\n			<option value=\"120\">Liberia</option>\n			<option value=\"121\">Libyan Arab Jamahiriya</option>\n			<option value=\"122\">Liechtenstein</option>\n			<option value=\"123\">Lithuania</option>\n			<option value=\"124\">Luxembourg</option>\n			<option value=\"125\">Macau</option>\n			<option value=\"126\">Macedonia, The Former Yugoslav Republic of</option>\n			<option value=\"127\">Madagascar</option>\n			<option value=\"128\">Malawi</option>\n			<option value=\"129\">Malaysia</option>\n			<option value=\"130\">Maldives</option>\n			<option value=\"131\">Mali</option>\n			<option value=\"132\">Malta</option>\n			<option value=\"133\">Marshall Islands</option>\n			<option value=\"134\">Martinique</option>\n			<option value=\"135\">Mauritania</option>\n			<option value=\"136\">Mauritius</option>\n			<option value=\"137\">Mayotte</option>\n			<option value=\"138\">Mexico</option>\n			<option value=\"139\">Micronesia, Federated States of</option>\n			<option value=\"140\">Moldova, Republic of</option>\n			<option value=\"141\">Monaco</option>\n			<option value=\"142\">Mongolia</option>\n			<option value=\"143\">Montserrat</option>\n			<option value=\"144\">Morocco</option>\n			<option value=\"145\">Mozambique</option>\n			<option value=\"146\">Myanmar</option>\n			<option value=\"147\">Namibia</option>\n			<option value=\"148\">Nauru</option>\n			<option value=\"149\">Nepal</option>\n			<option value=\"150\">Netherlands</option>\n			<option value=\"151\">Netherlands Antilles</option>\n			<option value=\"152\">New Caledonia</option>\n			<option value=\"153\">New Zealand</option>\n			<option value=\"154\">Nicaragua</option>\n			<option value=\"155\">Niger</option>\n			<option value=\"156\">Nigeria</option>\n			<option value=\"157\">Niue</option>\n			<option value=\"158\">Norfolk Island</option>\n			<option value=\"159\">Northern Mariana Islands</option>\n			<option value=\"160\">Norway</option>\n			<option value=\"161\">Oman</option>\n			<option value=\"162\">Pakistan</option>\n			<option value=\"163\">Palau</option>\n			<option value=\"164\">Panama</option>\n			<option value=\"165\">Papua New Guinea</option>\n			<option value=\"166\">Paraguay</option>\n			<option value=\"167\">Peru</option>\n			<option value=\"168\">Philippines</option>\n			<option value=\"169\">Pitcairn</option>\n			<option value=\"170\">Poland</option>\n			<option value=\"171\">Portugal</option>\n			<option value=\"172\">Puerto Rico</option>\n			<option value=\"173\">Qatar</option>\n			<option value=\"174\">Reunion</option>\n			<option value=\"175\">Romania</option>\n			<option value=\"176\">Russian Federation</option>\n			<option value=\"177\">Rwanda</option>\n			<option value=\"178\">Saint Kitts and Nevis</option>\n			<option value=\"179\">Saint Lucia</option>\n			<option value=\"180\">Saint Vincent and the Grenadines</option>\n			<option value=\"181\">Samoa</option>\n			<option value=\"182\">San Marino</option>\n			<option value=\"183\">Sao Tome and Principe</option>\n			<option value=\"184\">Saudi Arabia</option>\n			<option value=\"185\">Senegal</option>\n			<option value=\"186\">Seychelles</option>\n			<option value=\"187\">Sierra Leone</option>\n			<option value=\"188\">Singapore</option>\n			<option value=\"189\">Slovakia (Slovak Republic)</option>\n			<option value=\"190\">Slovenia</option>\n			<option value=\"191\">Solomon Islands</option>\n			<option value=\"192\">Somalia</option>\n			<option value=\"193\">South Africa</option>\n			<option value=\"194\">South Georgia and the South Sandwich Islands</option>\n			<option value=\"195\">Spain</option>\n			<option value=\"196\">Sri Lanka</option>\n			<option value=\"197\">St. Helena</option>\n			<option value=\"198\">St. Pierre and Miquelon</option>\n			<option value=\"199\">Sudan</option>\n			<option value=\"200\">Suriname</option>\n			<option value=\"201\">Svalbard and Jan Mayen Islands</option>\n			<option value=\"202\">Swaziland</option>\n			<option value=\"203\">Sweden</option>\n			<option value=\"204\">Switzerland</option>\n			<option value=\"205\">Syrian Arab Republic</option>\n			<option value=\"206\">Taiwan</option>\n			<option value=\"207\">Tajikistan</option>\n			<option value=\"208\">Tanzania, United Republic of</option>\n			<option value=\"209\">Thailand</option>\n			<option value=\"210\">Togo</option>\n			<option value=\"211\">Tokelau</option>\n			<option value=\"212\">Tonga</option>\n			<option value=\"213\">Trinidad and Tobago</option>\n			<option value=\"214\">Tunisia</option>\n			<option value=\"215\">Turkey</option>\n			<option value=\"216\">Turkmenistan</option>\n			<option value=\"217\">Turks and Caicos Islands</option>\n			<option value=\"218\">Tuvalu</option>\n			<option value=\"219\">Uganda</option>\n			<option value=\"220\">Ukraine</option>\n			<option value=\"221\">United Arab Emirates</option>\n			<option value=\"222\">United Kingdom</option>\n			<option value=\"223\">United States</option>\n			<option value=\"224\">United States Minor Outlying Islands</option>\n			<option value=\"225\">Uruguay</option>\n			<option value=\"226\">Uzbekistan</option>\n			<option value=\"227\">Vanuatu</option>\n			<option value=\"228\">Vatican City State (Holy See)</option>\n			<option value=\"229\">Venezuela</option>\n			<option value=\"230\">Viet Nam</option>\n			<option value=\"231\">Virgin Islands (British)</option>\n			<option value=\"232\">Virgin Islands (U.S.)</option>\n			<option value=\"233\">Wallis and Futuna Islands</option>\n			<option value=\"234\">Western Sahara</option>\n			<option value=\"235\">Yemen</option>\n			<option value=\"236\">Yugoslavia</option>\n			<option value=\"237\">Zaire</option>\n			<option value=\"238\">Zambia</option>\n			<option value=\"239\">Zimbabwe</option>\n			</select>\n			[+country.error+]\n     </div>\n        \n     <div class=\"form-group [+vericode.classname+]\">\n            <h3>Bot-Patrol</h3>\n            <p>Enter the word/number combination shown in the image below.</p>\n		 	\n            <p><a href=\"[+action+]\"><img align=\"top\" src=\"[+captcha+]\" width=\"148\" height=\"60\" alt=\"If you have trouble reading the code, click on the code itself to generate a new random code.\" style=\"border: 1px solid #039\" /></a></p>\n        <label class=\"control-label\">Form code:* \n        <input type=\"text\" name=\"vericode\" class=\"form-control\" size=\"20\" /></label>\n		 [+vericode.error+]\n     </div>\n        \n     <div class=\"form-group\">\n         <input type=\"submit\" class=\"btn btn-success btn-lg\" value=\"Submit\" name=\"cmdwebsignup\" />\n	 </div>\n\n</form>\n\n<script language=\"javascript\" type=\"text/javascript\"> \n	var id = \"[+country.value+]\";\n	var f = document.websignupfrm;\n	var i = parseInt(id);	\n	if (!isNaN(i)) f.country.options[i].selected = true;\n</script>\n\n	`\n	&successTpl=`@CODE:\n		<p class=\"message\">Signup completed successfully!<br />\n		Your account was created. A copy of your signup information was sent to your email address.</p>\n	`\n	&subject=`New registration, [(site_name)]`\n	&ccSender=`1`\n	&ccSenderTpl=`@CODE:\n		<h3>[+fullname.value+], signup completed successfully!</h3>\n		Login: [+email.value+]<br>\n		Password: [+user.password+]<br>\n	`\n	!]', 0, 4, 1, 0, 1, 1, 1144904400, 1, 1515584252, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 1, 1),
(6, 'document', 'text/html', 'Contact Us', 'Contact [(site_name)]', '', 'contact-us', '', 1, 0, 0, 0, 0, '', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m16!1m10!1m3!1d3352.3801198226956!2d-96.80891138449205!3d32.8355068809543!2m1!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x864e9eee5c9601d9%3A0x5b1cf098be385cee!2s25+Highland+Park+Village+%23100%2C+Dallas%2C+TX+75205%2C+USA!5e0!3m2!1sde!2sde!4v1457530640363\" width=\"100%\" height=\"240\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>\n\n\n<div id=\"ajaxForm\">\n	{{ContactForm}}\n</div>\n<script type=\"text/javascript\">\n	//see plugin evoAjax\n	 $(document).on(\'submit\',\'#ajaxForm form\',function(ev){\n        var frm = $(\'#ajaxForm form\');\n        $(\'#submit\').prop( \"disabled\", true );\n        $.ajax({\n            type: \'post\',\n            url: \'[(site_url)]feedbackajaxform\', \n            data: frm.serialize(),\n            success: function (data) {\n   				$(\'#ajaxForm\').empty();\n                $(\'#ajaxForm\').html( data ); \n            }\n        });\n        ev.preventDefault();\n    });\n</script>', 0, 4, 6, 1, 1, 1, 1144904400, 1, 1507815490, 0, 0, 0, 0, 0, 'Contact us', 0, 0, 0, 0, 0, 1),
(7, 'document', 'text/html', '404 - Document Not Found', 'Uh oh ... it\'s a 404! (Page Not Found)', '', 'doc-not-found', '', 1, 0, 0, 0, 0, '', '<p>Looks like you tried to go somewhere that does not exist... perhaps you <a>need to login</a> or you\'d like one of the following pages instead:</p>\n<p>[[DLMenu? &amp;parents=`0`]]</p>\n<h3>Want to find it the old fashioned way? Use the site search at the top of this site to find what you seek.</h3>', 1, 4, 10, 0, 1, 1, 1144904400, 1, 1507728168, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 1, 1),
(8, 'document', 'text/html', 'Search Results', 'Your Search Results', '', 'search-results', '', 1, 0, 0, 0, 0, '', '[!AjaxSearch? &showInputForm=`0` &ajaxSearch=`0`!]', 0, 4, 8, 0, 1, 1, 1144904400, 1, 1507728119, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 1, 1),
(9, 'document', 'text/html', 'Mini-Blog HOWTO', 'How to Start Posting with EVO Mini-Blogs', '', 'article-1126081344', '', 1, 0, 0, 2, 0, '', '<p>Setting up a mini-blog is relatively simple. Here\'s what you need to do to get started with making new posts:</p>\n<ol>\n<li>Login to the <a href=\"[(site_manager_url)]\">EVO Control Panel</a>.</li>\n<li>Press the plus-sign next to the Blog(2) container resource to see the blog entries posted there.</li>\n<li>To make a new Blog entry, simply right-click the Blog container document and choose the \"Create Resource here\" menu option. To edit an existing blog article, right click the entry and choose the \"Edit Resource\" menu option.</li>\n<!-- splitter -->\n<li>Write or edit the content and press save, making sure the document is published.</li>\n<li>Everything else is automatic; you\'re done!</li>\n</ol>', 1, 4, 0, 1, 1, -1, 1144904400, 1, 1509818890, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 1, 1),
(11, 'document', 'application/rss+xml', 'RSS Feed', '[(site_name)] RSS Feed', '', 'feed.rss', '', 1, 0, 0, 0, 0, '', '<!--<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<rss version=\"2.0\">-->\n\n<channel>\n  <title>[(site_name)]</title>\n  <link>[(site_url)]</link>\n  <description>Evolution CMS demo site Feed</description>\n  [[DocLister? \n	&parents=`2`  \n	&display=`20`\n	&summary=`notags,len:350` \n	&tpl=`@CODE:<item>\n			<title>[+e.title+]</title>\n			<link>[(site_url)][~[+id+]~]</link>\n			<description><! [CDATA[ [+summary+] ] ]></description>\n			<pubDate>[+date+]</pubDate>\n			<guid isPermaLink=\"false\">[(site_url)][~[+id+]~]</guid>\n			<dc:creator>[+author+]</dc:creator>\n		</item>`\n	]]\n</channel>\n</rss>', 0, 0, 9, 0, 1, 1, 1144904400, 1, 1507728107, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 1, 1),
(14, 'document', 'text/html', 'Content Management', 'Ways to manage content', '', 'cms', '', 1, 0, 0, 15, 0, '', '<h2>Manage your content in the backend</h2>\n<p>The Manager is a skinnable feature-packed tool for admin users. You can add extra users and limit what functions they can access. EVO\'s Manager makes creating content and managing templates and reusable elements easy. Modules can be added to work with other datasets or make management tasks easier.</p>\n<h2>Manage your content in the frontend</h2>\n<p>The QuickEdit bar lets manager users edit content whilst browsing the site. Most content fields and template variables can be edited quickly and easily.</p>\n<h2>Enable web users to add content</h2>\n<p>Custom data entry is easy to code using the EVO API - so you can design forms and collect whatever information you need.</p>', 1, 4, 3, 1, 1, 1, 1144904400, 1, 1378086298, 0, 0, 0, 1378086298, 1, 'Manage Content', 0, 0, 0, 0, 0, 1),
(15, 'document', 'text/html', 'EVO Features', 'EVO Features', '', 'features', '', 1, 0, 0, 0, 1, '', '[[Wayfinder?startId=`[*id*]` &outerClass=`topnav`]]', 1, 4, 3, 1, 1, 1, 1144904400, 1, 1158452722, 0, 0, 0, 1144777367, 1, 'Features', 0, 0, 0, 0, 0, 1),
(16, 'document', 'text/html', 'Ajax', 'Ajax and Web 2.0 ready', '', 'ajax', '', 1, 1159264800, 0, 15, 0, '', '<p><b>Ajax ready out-of-the-box</b></p>\n<p>EVO empowers users to build engaging sites today, with its pre-integrated <a href=\"http://jquery.com/\" target=\"_blank\" rel=\"noopener\">jQuery</a> javascript library.</p>\n<p>Check out the Ajax-powered search in this example site. The libraries are also used with QuickEdit, our front-end editing tool.</p>\n<p>Smart integration means the scripts are only included in the document head when needed - no unnecessary bloat on simple pages!</p>\n<p><b>Web 2.0 today</b></p>\n<p>EVO makes child\'s play of building content managed sites with validating, accessible CSS layouts - so web standards compliance is easy. (You can create a site with excessively nested tables too, if you really want to).</p>', 1, 4, 1, 1, 1, 1, 1144904400, 1, 1507726420, 0, 0, 0, 1159264800, 1, 'Ajax', 0, 0, 0, 0, 0, 1),
(18, 'document', 'text/html', 'Just a pretend, older post', 'This post should in fact be archived', '', 'article-1128398162', '', 1, 0, 0, 2, 0, '', '<p>Not so exciting, after all, eh?</p>', 1, 4, 2, 1, 1, -1, 1144904400, 1, 1509818884, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 1, 1),
(22, 'document', 'text/html', 'Menus and Lists', 'Flexible Menus and Lists', '', 'menus', '', 1, 1159178400, 0, 15, 0, '', '<h2>Your documents - listed how you want them</h2>\n<p>EVO\'s document data structure has been designed to allow many different routines to redisplay the information in ways that suit your needs, such as a dynamic menu in your template.</p>\n<p>Since the last release of EVO, the community has produced many great snippets - reusable functions that you can call in your content or template. Two of the most widely useful are Ditto and Wayfinder.</p>\n<h2>Wayfinder - the menu builder</h2>\n<p>Allows you to template every part of the menu. On this site, Wayfinder is being used to generate the drop-down menus, but many types of menus and sitemaps are possible.</p>\n<h2>Ditto - the document lister</h2>\n<p>Uses include listing the most recent blog posts, producing a site map, listing related documents (using a TV filter) and generating an RSS feed. You could even write a menu with it. On this site, Ditto is being used for the blog posts list on the Blog page, and the list on the right of some templates.</p>\n<h2>Unlimited Customization</h2>\n<p>If you can\'t quite get your desired effect using templating and the many options of Ditto and Wayfinder, you can write your own routine, or look for other snippets in <a href=\"http://extras.evolution-cms.com/\">the EVO repository</a>. EVO\'s fields for Menu Title, summaries, menu position etc can be used via the API to produce anything you can imagine.</p>', 1, 4, 2, 1, 1, 1, 1144904400, 1, 1160148522, 0, 0, 0, 0, 0, 'Menus and Lists', 0, 0, 0, 0, 0, 1),
(24, 'document', 'text/html', 'Extendable by design', 'Extendable by design', '', 'extendable', '', 1, 1159092732, 0, 15, 0, '', '<p>The EVO community has created many add-ons which can be found in the <a href=\"http://extras.evolution-cms.com/\">Repository</a>, from image galleries and e-commerce to smaller utilities.</p>\n<h2>Template Variables with Bindings</h2>\n<p>TVs - Template Variables - are powerful extra fields that you can use with your documents. As an example of an advanced template element that returns a different thing dependent on code or data, we created an @BINDING for the name of the Login menu item. This changes the menu name from Login to Logout based on your logged in state. The @BINDING as follows was placed in the default value as: <code>@EVAL if ($modx-&gt;getLoginUserID()) return \'Logout\'; else return \'Login\';</code></p>\n<h2>Using jQuery-effects</h2>\n<p>We used some simple effects to highlight various things on the front/home page to demonstrate how easy it is to create a useful way to draw attention to things. To see them in action on the home page, click the Integrated Site Search, Related Links or Newest Documents headers.</p>\n<h2>Custom Forms</h2>\n<p>To demonstrate how to link to custom forms, we customized the calls to the Webuser Registration system and the Login system.</p>\n<h2>And more</h2>\n<p><strong>Rich Text Editor for blog entries.</strong> To make it easier to format blog posts with simple text formatting, we modified the blog to use a custom RTE-enabled Template Variable (TV).</p>\n<p><strong>Smart-Summary logic.</strong> When splitting the full blog/news posts you simply insert a \"&lt;!-- splitter --&gt;\" where you want the break to occur. In addition, if that leaves any important tags open, it will try to match them and close them so it doesn\'t mess up your site layout with unclosed OL, UL or DIV tags.</p>', 1, 4, 4, 1, 1, 2, 1144904400, 1, 1159309971, 0, 0, 0, 0, 0, 'Extendability', 0, 0, 0, 0, 0, 1),
(32, 'document', 'text/html', 'Design', 'Site Design', '', 'design', '', 1, 0, 0, 0, 0, '', '<h3>Credits</h3>\n<p>The EVO Starter-theme is&nbsp;based on Bootstrap 3.3.6 and made by graffx.nl and fuseit.de.</p>', 1, 4, 5, 1, 1, 2, 1144904400, 1, 1160112322, 0, 0, 0, 1144912754, 1, 'Design', 0, 0, 0, 0, 0, 1),
(33, 'document', 'text/html', 'Getting Help', 'Getting Help with EVO', '', 'getting-help', '', 1, 0, 0, 0, 0, '', '<p>The <a href=\"https://github.com/orgs/evolution-cms/teams/\" target=\"_blank\" rel=\"noopener\">team behind EVO</a> strives to constantly add to and refine the documentation to help you get up to speed with EVO:</p>\n<ul>\n<li>For basic instructions on integrating custom templates into EVO, please see the <a href=\"http://www.evolution-docs.com/documentation/designing/\" target=\"_blank\" rel=\"noopener\">Designer\'s Guide</a>.</li>\n<li>For an introduction to working in EVO from the content editors perspectve, see the <a href=\"http://www.evolution-docs.com/documentation/content-editing/\" target=\"_blank\" rel=\"noopener\">Content Editor\'s Guide</a>.</li>\n<li>For a detailed overview of the backend \"manager\" and setting up Users and Groups, please peruse the <a href=\"http://www.evolution-docs.com/documentation/administration/\" target=\"_blank\" rel=\"noopener\">Administration Guide</a>.</li>\n<li>For developers, architecture and API documentation can be found in the <a href=\"http://www.evolution-docs.com/documentation/developers-guide/\" target=\"_blank\" rel=\"noopener\">Developer\'s Guide</a>.</li>\n<li>And if someone has installed this site for you, but you\'re curious as to the steps they went through, please see the <a href=\"http://www.evolution-docs.com/documentation/getting-started/\" target=\"_blank\" rel=\"noopener\">Getting Started Guide</a>.</li>\n</ul>\n<p>And don\'t forget, you can always learn and ask questions at the <a href=\"http://forum.evolution-cms.com/\" target=\"_blank\" rel=\"noopener\">EVO forums</a>.</p>', 1, 4, 4, 1, 1, 2, 1144904400, 1, 1507728208, 0, 0, 0, 0, 0, 'Getting Help', 0, 0, 0, 0, 0, 1),
(37, 'document', 'text/html', 'Forgot Password', '', '', 'forgot-password', '', 1, 0, 0, 4, 0, '', '[!FormLister?\n&controller=`Reminder`\n&formid=`remind`\n&rules=`{\n	\"email\":{\n		\"required\":\"Be sure to enter email\",\n		\"email\":\"Enter email correctly\"\n	}\n}`\n&resetRules=`{\n	\"password\":{\n		\"required\":\"Be sure to enter the password\",\n		\"minLength\":{\n			\"params\":6,\n			\"message\":\"Password must be longer than 6 characters\"\n		}\n	},\n	\"repeatPassword\":{\n		\"required\":\"Repeat password\",\n		\"equals\":{\n			\"message\":\"Passwords do not match\"\n		}\n	}\n}`\n&formTpl=`@CODE:\n\n<div class=\"form-remind\">\n	[+form.messages+]\n	<h2 class=\"form-signin-heading\">[*pagetitle*]</h2>\n	<form method=\"post\">\n		<input type=\"hidden\" name=\"formid\" value=\"remind\">\n		<div class=\"form-group\">\n			<input type=\"text\" class=\"form-control\" id=\"email\" placeholder=\"Email\" name=\"email\" value=\"[+email.value+]\">\n			[+email.error+]\n		</div>\n\n		<div class=\"form-group\">\n			<button type=\"submit\" class=\"btn btn-primary\"><i class=\"glyphicon glyphicon-ok-sign\"></i> Submit</button>\n		</div>\n	</form>\n</div>`\n\n&resetTpl=`@CODE:\n<div class=\"form-remind\">\n	[+form.messages+]\n	<h2 class=\"form-signin-heading\">[*pagetitle*]</h2>\n	<form method=\"post\" class=\"\">\n		<input type=\"hidden\" name=\"formid\" value=\"remind\">\n		<div class=\"form-group\">\n			<input type=\"password\" class=\"form-control\" id=\"password1\" placeholder=\"New password\" name=\"password\" value=\"\">\n			[+password.error+]\n			<input type=\"password\" class=\"form-control\" id=\"password2\" placeholder=\"Repeat Password\" name=\"repeatPassword\" value=\"\">\n			[+repeatPassword.error+]\n		</div>\n		<div class=\"form-group\">\n			<button type=\"submit\" class=\"btn btn-primary\"><i class=\"glyphicon glyphicon-floppy-disk\"></i> Save</button>\n		</div>\n	</form>\n</div>\n`\n&messagesOuterTpl=`@CODE:<div class=\"alert alert-danger\" role=\"alert\">[+messages+]</div>`\n&successTpl=`@CODE:\n<div class=\"form-reg\">\n	<div class=\"text-center\">An email with the instructions has been sent to the email you specified when registering!</div>\n</div>`\n\n&subject=`Password recovery, [(site_name)]`\n&reportTpl=`@CODE:<p>To recover your password, click on the link <a href=\"[+reset.url+]\">[+reset.url+]</a></p>`\n&resetReportTpl=`@CODE:<p>Hello, [+fullname.value+]!</p><p>Your new password: [+newpassword+]</p>`\n&resetTo=`37`\n&redirectTo=`4`\n&errorTpl=`@CODE:<span class=\"help-block\">[+message+]</span>`\n!]', 0, 4, 2, 0, 1, 1, 1144904400, 1, 1509806093, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 1, 1),
(47, 'document', 'text/html', 'New documentation site: docs.evo.im', 'Multilingual documentation for Evolution CMS ', '', 'new-documentation-site-docs.evo.im', '', 1, 0, 0, 2, 0, 'You can get documentation here: http://docs.evo.im', '<p>You can get documentation here: <a href=\"http://docs.evo.im\">http://docs.evo.im</a></p>\n<h2>Evolution CMS Docs</h2>\n<p><em>Evolution is a professional website development tool that allows you to manage content (and the site itself) absolutely 100%! This system is open source, and therefore free. Unlike most free CMS (English Content Management System) - on EVO you can build a site of any complexity, with almost any set of functions, and the system will not in any way influence your html code.</em></p>\n<h2>How to contribute</h2>\n<ol>\n<li>First of all, you must have an account on GitHub, if not - <a href=\"https://github.com/join\">then it\'s very simple</a>.</li>\n<li>Make a fork <a href=\"https://github.com/evolution-cms/docs/\">https://github.com/evolution-cms/docs/</a> to yourself by clicking the \"Fork\" button on the top right.</li>\n<li>Clone the repository to your disk and work with it locally, like everyone else (if you are a developer)</li>\n<li>If you are not a developer, you can simply edit the * .md files directly on GitHub.</li>\n<li>When you have done everything, you should <a href=\"https://help.github.com/articles/creating-a-pull-request\">make a \"Pull Request\"</a> and send it by sending changes to this repository.</li>\n</ol>', 1, 4, 2, 1, 1, 1, 1507724288, 1, 1509818879, 0, 0, 0, 1507724288, 1, '', 0, 0, 0, 0, 1, 1),
(48, 'document', 'text/xml', 'sitemap.xml', '', '', 'sitemap.xml', '', 1, 0, 0, 0, 0, '', '[[DLSitemap]]', 0, 0, 11, 1, 1, 1, 1507726985, 1, 1507727020, 0, 0, 0, 1507726985, 1, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `evo_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `donthit`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `alias_visible`) VALUES
(49, 'document', 'text/html', 'Edit profile', 'User profile', '', 'editprofile', '', 1, 0, 0, 4, 0, '', '<a class=\"btn btn-primary\" href=\"?logout\"> Logout</a>\n  [!FormLister?\n	&formid=`registerForm`\n	&controller=`Profile`\n	&requiredClass=`has-warning`\n	&errorClass=`has-error`\n	&errorTpl=`@CODE:<small class=\"help-block\">[+message+]</small>`\n	&allowedFields=`email,username,fullname,country`\n	&rules=`{\n		\"username\":{\n			\"required\":\"Enter your username\",\n			\"alphaNumeric\":\"Only letters and numbers\",\n			\"custom\":{\n				\"function\":\"\\\\FormLister\\\\Register::uniqueUsername\",\n				\"message\":\"Name already taken\"\n			}\n		},\n		\"email\":{\n			\"required\":\"Enter email\",\n			\"email\":\"Incorrect email\",\n			\"custom\":{\n				\"function\":\"\\\\FormLister\\\\Register::uniqueEmail\",\n				\"message\":\"This email is already in use by another user\"\n			}\n		},\n		\"password\":{\n			\"required\":\"Enter password\"\n		},\n		\"repeatPassword\":{\n			\"required\":\"Retype password\",\n			\"equals\":{\n				\"message\":\"Passwords do not match\"\n			}\n		}\n	}`\n	&formTpl=`@CODE: \n\n<form role=\"form\" id=\"websignupfrm\" method=\"post\" name=\"websignupfrm\" action=\"[+action+]\">\n	<input type=\"hidden\" name=\"formid\" value=\"registerForm\"/>\n    <h3>User Details</h3>\n	\n	<div class=\"form-group [+username.classname+]\">\n		<label class=\"control-label\" for=\"su_username\">User name:</label> \n		<input type=\"text\" name=\"username\" id=\"su_username\" class=\"form-control\" maxlength=\"30\" value=\"[+username.value+]\" placeholder=\"Enter Username\"/>\n		[+username.error+]\n	</div>\n	\n	<div class=\"form-group [+fullname.classname+]\">\n        <label class=\"control-label\" for=\"fullname\">Full name:</label> \n		<input type=\"text\" name=\"fullname\" id=\"fullname\" class=\"form-control\" maxlength=\"100\" value=\"[+fullname.value+]\" placeholder=\"Enter fullname\"/>\n		[+fullname.error+]\n	</div>\n	\n	<div class=\"form-group  [+email.classname+]\">\n		<label class=\"control-label\" for=\"email\">Email address:</label> \n		<input type=\"text\" name=\"email\" id=\"email\" class=\"form-control\" value=\"[+email.value+]\" placeholder=\"Enter email\"/>\n		[+email.error+]\n	</div>\n\n	<div class=\"form-group [+password.classname+]\">\n	    <h3>Password</h3>\n	    <label class=\"control-label\" for=\"su_password\">Password:</label> \n		<input type=\"password\" name=\"password\" id=\"su_password\" class=\"form-control\" placeholder=\"Enter password\"/>\n		[+password.error+]\n	</div>\n	<div class=\"form-group [+repeatPassword.classname+]\">\n	    <label class=\"control-label\" for=\"confirmpassword\">Confirm password:</label> \n		<input type=\"password\" name=\"repeatPassword\" id=\"confirmpassword\" class=\"form-control\" placeholder=\"Confirm password\"/>\n		[+repeatPassword.error+]\n	</div>\n	\n	<div class=\"form-group [+country.classname+]\">\n		<h3>Optional Account Profile Info</h3>\n		<label class=\"control-label\" for=\"country\">Country:</label>\n		<select size=\"1\" name=\"country\" id=\"country\" class=\"form-control\" >\n			<option value=\"\" selected=\"selected\">&nbsp;</option>\n			<option value=\"1\">Afghanistan</option>\n			<option value=\"2\">Albania</option>\n			<option value=\"3\">Algeria</option>\n			<option value=\"4\">American Samoa</option>\n			<option value=\"5\">Andorra</option>\n			<option value=\"6\">Angola</option>\n			<option value=\"7\">Anguilla</option>\n			<option value=\"8\">Antarctica</option>\n			<option value=\"9\">Antigua and Barbuda</option>\n			<option value=\"10\">Argentina</option>\n			<option value=\"11\">Armenia</option>\n			<option value=\"12\">Aruba</option>\n			<option value=\"13\">Australia</option>\n			<option value=\"14\">Austria</option>\n			<option value=\"15\">Azerbaijan</option>\n			<option value=\"16\">Bahamas</option>\n			<option value=\"17\">Bahrain</option>\n			<option value=\"18\">Bangladesh</option>\n			<option value=\"19\">Barbados</option>\n			<option value=\"20\">Belarus</option>\n			<option value=\"21\">Belgium</option>\n			<option value=\"22\">Belize</option>\n			<option value=\"23\">Benin</option>\n			<option value=\"24\">Bermuda</option>\n			<option value=\"25\">Bhutan</option>\n			<option value=\"26\">Bolivia</option>\n			<option value=\"27\">Bosnia and Herzegowina</option>\n			<option value=\"28\">Botswana</option>\n			<option value=\"29\">Bouvet Island</option>\n			<option value=\"30\">Brazil</option>\n			<option value=\"31\">British Indian Ocean Territory</option>\n			<option value=\"32\">Brunei Darussalam</option>\n			<option value=\"33\">Bulgaria</option>\n			<option value=\"34\">Burkina Faso</option>\n			<option value=\"35\">Burundi</option>\n			<option value=\"36\">Cambodia</option>\n			<option value=\"37\">Cameroon</option>\n			<option value=\"38\">Canada</option>\n			<option value=\"39\">Cape Verde</option>\n			<option value=\"40\">Cayman Islands</option>\n			<option value=\"41\">Central African Republic</option>\n			<option value=\"42\">Chad</option>\n			<option value=\"43\">Chile</option>\n			<option value=\"44\">China</option>\n			<option value=\"45\">Christmas Island</option>\n			<option value=\"46\">Cocos (Keeling) Islands</option>\n			<option value=\"47\">Colombia</option>\n			<option value=\"48\">Comoros</option>\n			<option value=\"49\">Congo</option>\n			<option value=\"50\">Cook Islands</option>\n			<option value=\"51\">Costa Rica</option>\n			<option value=\"52\">Cote D&#39;Ivoire</option>\n			<option value=\"53\">Croatia</option>\n			<option value=\"54\">Cuba</option>\n			<option value=\"55\">Cyprus</option>\n			<option value=\"56\">Czech Republic</option>\n			<option value=\"57\">Denmark</option>\n			<option value=\"58\">Djibouti</option>\n			<option value=\"59\">Dominica</option>\n			<option value=\"60\">Dominican Republic</option>\n			<option value=\"61\">East Timor</option>\n			<option value=\"62\">Ecuador</option>\n			<option value=\"63\">Egypt</option>\n			<option value=\"64\">El Salvador</option>\n			<option value=\"65\">Equatorial Guinea</option>\n			<option value=\"66\">Eritrea</option>\n			<option value=\"67\">Estonia</option>\n			<option value=\"68\">Ethiopia</option>\n			<option value=\"69\">Falkland Islands (Malvinas)</option>\n			<option value=\"70\">Faroe Islands</option>\n			<option value=\"71\">Fiji</option>\n			<option value=\"72\">Finland</option>\n			<option value=\"73\">France</option>\n			<option value=\"74\">France, Metropolitan</option>\n			<option value=\"75\">French Guiana</option>\n			<option value=\"76\">French Polynesia</option>\n			<option value=\"77\">French Southern Territories</option>\n			<option value=\"78\">Gabon</option>\n			<option value=\"79\">Gambia</option>\n			<option value=\"80\">Georgia</option>\n			<option value=\"81\">Germany</option>\n			<option value=\"82\">Ghana</option>\n			<option value=\"83\">Gibraltar</option>\n			<option value=\"84\">Greece</option>\n			<option value=\"85\">Greenland</option>\n			<option value=\"86\">Grenada</option>\n			<option value=\"87\">Guadeloupe</option>\n			<option value=\"88\">Guam</option>\n			<option value=\"89\">Guatemala</option>\n			<option value=\"90\">Guinea</option>\n			<option value=\"91\">Guinea-bissau</option>\n			<option value=\"92\">Guyana</option>\n			<option value=\"93\">Haiti</option>\n			<option value=\"94\">Heard and Mc Donald Islands</option>\n			<option value=\"95\">Honduras</option>\n			<option value=\"96\">Hong Kong</option>\n			<option value=\"97\">Hungary</option>\n			<option value=\"98\">Iceland</option>\n			<option value=\"99\">India</option>\n			<option value=\"100\">Indonesia</option>\n			<option value=\"101\">Iran (Islamic Republic of)</option>\n			<option value=\"102\">Iraq</option>\n			<option value=\"103\">Ireland</option>\n			<option value=\"104\">Israel</option>\n			<option value=\"105\">Italy</option>\n			<option value=\"106\">Jamaica</option>\n			<option value=\"107\">Japan</option>\n			<option value=\"108\">Jordan</option>\n			<option value=\"109\">Kazakhstan</option>\n			<option value=\"110\">Kenya</option>\n			<option value=\"111\">Kiribati</option>\n			<option value=\"112\">Korea, Democratic People&#39;s Republic of</option>\n			<option value=\"113\">Korea, Republic of</option>\n			<option value=\"114\">Kuwait</option>\n			<option value=\"115\">Kyrgyzstan</option>\n			<option value=\"116\">Lao People&#39;s Democratic Republic</option>\n			<option value=\"117\">Latvia</option>\n			<option value=\"118\">Lebanon</option>\n			<option value=\"119\">Lesotho</option>\n			<option value=\"120\">Liberia</option>\n			<option value=\"121\">Libyan Arab Jamahiriya</option>\n			<option value=\"122\">Liechtenstein</option>\n			<option value=\"123\">Lithuania</option>\n			<option value=\"124\">Luxembourg</option>\n			<option value=\"125\">Macau</option>\n			<option value=\"126\">Macedonia, The Former Yugoslav Republic of</option>\n			<option value=\"127\">Madagascar</option>\n			<option value=\"128\">Malawi</option>\n			<option value=\"129\">Malaysia</option>\n			<option value=\"130\">Maldives</option>\n			<option value=\"131\">Mali</option>\n			<option value=\"132\">Malta</option>\n			<option value=\"133\">Marshall Islands</option>\n			<option value=\"134\">Martinique</option>\n			<option value=\"135\">Mauritania</option>\n			<option value=\"136\">Mauritius</option>\n			<option value=\"137\">Mayotte</option>\n			<option value=\"138\">Mexico</option>\n			<option value=\"139\">Micronesia, Federated States of</option>\n			<option value=\"140\">Moldova, Republic of</option>\n			<option value=\"141\">Monaco</option>\n			<option value=\"142\">Mongolia</option>\n			<option value=\"143\">Montserrat</option>\n			<option value=\"144\">Morocco</option>\n			<option value=\"145\">Mozambique</option>\n			<option value=\"146\">Myanmar</option>\n			<option value=\"147\">Namibia</option>\n			<option value=\"148\">Nauru</option>\n			<option value=\"149\">Nepal</option>\n			<option value=\"150\">Netherlands</option>\n			<option value=\"151\">Netherlands Antilles</option>\n			<option value=\"152\">New Caledonia</option>\n			<option value=\"153\">New Zealand</option>\n			<option value=\"154\">Nicaragua</option>\n			<option value=\"155\">Niger</option>\n			<option value=\"156\">Nigeria</option>\n			<option value=\"157\">Niue</option>\n			<option value=\"158\">Norfolk Island</option>\n			<option value=\"159\">Northern Mariana Islands</option>\n			<option value=\"160\">Norway</option>\n			<option value=\"161\">Oman</option>\n			<option value=\"162\">Pakistan</option>\n			<option value=\"163\">Palau</option>\n			<option value=\"164\">Panama</option>\n			<option value=\"165\">Papua New Guinea</option>\n			<option value=\"166\">Paraguay</option>\n			<option value=\"167\">Peru</option>\n			<option value=\"168\">Philippines</option>\n			<option value=\"169\">Pitcairn</option>\n			<option value=\"170\">Poland</option>\n			<option value=\"171\">Portugal</option>\n			<option value=\"172\">Puerto Rico</option>\n			<option value=\"173\">Qatar</option>\n			<option value=\"174\">Reunion</option>\n			<option value=\"175\">Romania</option>\n			<option value=\"176\">Russian Federation</option>\n			<option value=\"177\">Rwanda</option>\n			<option value=\"178\">Saint Kitts and Nevis</option>\n			<option value=\"179\">Saint Lucia</option>\n			<option value=\"180\">Saint Vincent and the Grenadines</option>\n			<option value=\"181\">Samoa</option>\n			<option value=\"182\">San Marino</option>\n			<option value=\"183\">Sao Tome and Principe</option>\n			<option value=\"184\">Saudi Arabia</option>\n			<option value=\"185\">Senegal</option>\n			<option value=\"186\">Seychelles</option>\n			<option value=\"187\">Sierra Leone</option>\n			<option value=\"188\">Singapore</option>\n			<option value=\"189\">Slovakia (Slovak Republic)</option>\n			<option value=\"190\">Slovenia</option>\n			<option value=\"191\">Solomon Islands</option>\n			<option value=\"192\">Somalia</option>\n			<option value=\"193\">South Africa</option>\n			<option value=\"194\">South Georgia and the South Sandwich Islands</option>\n			<option value=\"195\">Spain</option>\n			<option value=\"196\">Sri Lanka</option>\n			<option value=\"197\">St. Helena</option>\n			<option value=\"198\">St. Pierre and Miquelon</option>\n			<option value=\"199\">Sudan</option>\n			<option value=\"200\">Suriname</option>\n			<option value=\"201\">Svalbard and Jan Mayen Islands</option>\n			<option value=\"202\">Swaziland</option>\n			<option value=\"203\">Sweden</option>\n			<option value=\"204\">Switzerland</option>\n			<option value=\"205\">Syrian Arab Republic</option>\n			<option value=\"206\">Taiwan</option>\n			<option value=\"207\">Tajikistan</option>\n			<option value=\"208\">Tanzania, United Republic of</option>\n			<option value=\"209\">Thailand</option>\n			<option value=\"210\">Togo</option>\n			<option value=\"211\">Tokelau</option>\n			<option value=\"212\">Tonga</option>\n			<option value=\"213\">Trinidad and Tobago</option>\n			<option value=\"214\">Tunisia</option>\n			<option value=\"215\">Turkey</option>\n			<option value=\"216\">Turkmenistan</option>\n			<option value=\"217\">Turks and Caicos Islands</option>\n			<option value=\"218\">Tuvalu</option>\n			<option value=\"219\">Uganda</option>\n			<option value=\"220\">Ukraine</option>\n			<option value=\"221\">United Arab Emirates</option>\n			<option value=\"222\">United Kingdom</option>\n			<option value=\"223\">United States</option>\n			<option value=\"224\">United States Minor Outlying Islands</option>\n			<option value=\"225\">Uruguay</option>\n			<option value=\"226\">Uzbekistan</option>\n			<option value=\"227\">Vanuatu</option>\n			<option value=\"228\">Vatican City State (Holy See)</option>\n			<option value=\"229\">Venezuela</option>\n			<option value=\"230\">Viet Nam</option>\n			<option value=\"231\">Virgin Islands (British)</option>\n			<option value=\"232\">Virgin Islands (U.S.)</option>\n			<option value=\"233\">Wallis and Futuna Islands</option>\n			<option value=\"234\">Western Sahara</option>\n			<option value=\"235\">Yemen</option>\n			<option value=\"236\">Yugoslavia</option>\n			<option value=\"237\">Zaire</option>\n			<option value=\"238\">Zambia</option>\n			<option value=\"239\">Zimbabwe</option>\n			</select>\n			[+country.error+]\n     </div>\n      \n     <div class=\"form-group\">\n         <input type=\"submit\" class=\"btn btn-success btn-lg\" value=\"Submit\" name=\"cmdwebsignup\" />\n	 </div>\n\n</form>\n\n<script language=\"javascript\" type=\"text/javascript\"> \n	var id = \"[+country.value+]\";\n	var f = document.websignupfrm;\n	var i = parseInt(id);	\n	if (!isNaN(i)) f.country.options[i].selected = true;\n</script>\n\n	`!]\n', 0, 4, 0, 1, 1, 1, 1509808504, 1, 1509817993, 0, 0, 0, 1509808504, 1, '', 0, 0, 0, 0, 1, 1),
(53, 'document', 'text/html', 'Шапка', '', '', 'shapka', '', 1, 0, 0, 1, 1, '', '', 1, 0, 0, 0, 1, 1, 1524917617, 1, 1524917617, 0, 0, 0, 1524917617, 1, '', 0, 0, 0, 0, 0, 1),
(54, 'document', 'text/html', 'Слайдер', '', '', 'slajder', '', 1, 0, 0, 53, 1, '', 'Собственное <br>производство', 1, 0, 0, 0, 1, 1, 1524917970, 1, 1524924770, 0, 0, 0, 1524917970, 1, '', 0, 0, 0, 0, 1, 1),
(74, 'document', 'text/html', 'Денис Белоусов', '', '', 'denis-belousov', '', 1, 0, 0, 72, 0, '', '<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров обеспечивает широкому кругу (специалистов) участие в формировании позиций, занимаемых участниками в отношении поставленных задач. С другой стороны новая модель организационной деятельности обеспечивает широкому</p>', 1, 11, 2, 0, 1, 1, 1524940980, 1, 1524940980, 0, 0, 0, 1524940980, 1, '', 0, 0, 0, 0, 0, 1),
(75, 'document', 'text/html', 'Григорий Макаров', '', '', 'grigorij-makarov', '', 1, 0, 0, 72, 0, '', '<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров обеспечивает широкому кругу (специалистов) участие в формировании позиций, занимаемых участниками в отношении поставленных задач. С другой стороны новая модель организационной деятельности обеспечивает широкому</p>', 1, 11, 0, 0, 1, 1, 1524941017, 1, 1524941017, 0, 0, 0, 1524941017, 1, '', 0, 0, 0, 0, 0, 1),
(76, 'document', 'text/html', 'Плитка', '', '', 'plitka', '', 1, 0, 0, 1, 1, '', '', 1, 5, 0, 0, 1, 1, 1524957238, 1, 1524957238, 0, 0, 0, 1524957238, 1, '', 0, 0, 0, 0, 0, 1),
(77, 'document', 'text/html', 'Цокольная плитка', '', '', 'cokolnaya-plitka', '', 1, 0, 0, 112, 0, '', '', 1, 13, 0, 0, 1, 1, 1524958200, 1, 1524958337, 0, 0, 0, 1524958200, 1, '', 0, 0, 0, 0, 0, 1),
(78, 'document', 'text/html', 'Кирпич', '', '', 'kirpich', '', 1, 0, 0, 1, 1, '', '', 1, 5, 0, 0, 1, 1, 1525097483, 1, 1525097483, 0, 0, 0, 1525097483, 1, '', 0, 0, 0, 0, 0, 1),
(79, 'document', 'text/html', 'Размеры', '', 'Выберите размер', 'razmery', '', 1, 0, 0, 78, 1, '', '', 1, 5, 0, 0, 1, 1, 1525097537, 1, 1525101277, 0, 0, 0, 1525097537, 1, '', 0, 0, 0, 0, 1, 1),
(80, 'document', 'text/html', '1.4', '', 'полуторный', '1.4', '', 1, 0, 0, 79, 0, '', '', 1, 14, 0, 0, 1, 1, 1525097592, 1, 1525101286, 0, 0, 0, 1525097592, 1, '', 0, 0, 0, 0, 0, 1),
(81, 'document', 'text/html', '1.0', '', 'одинарный', '1.0', '', 1, 0, 0, 79, 0, '', '', 1, 14, 0, 0, 1, 1, 1525101796, 1, 1525101796, 0, 0, 0, 1525101796, 1, '', 0, 0, 0, 0, 0, 1),
(82, 'document', 'text/html', '0.7', '', 'брусок полуторный', '0.7', '', 1, 0, 0, 79, 0, '', '', 1, 14, 0, 0, 1, 1, 1525101821, 1, 1525101821, 0, 0, 0, 1525101821, 1, '', 0, 0, 0, 0, 0, 1),
(83, 'document', 'text/html', '0.5', '', 'брусок одинарный', '0.5', '', 1, 0, 0, 79, 0, '', '', 1, 5, 0, 0, 1, 1, 1525101835, 1, 1525101835, 0, 0, 0, 1525101835, 1, '', 0, 0, 0, 0, 0, 1),
(84, 'document', 'text/html', 'Цвета', '', '', 'cveta', '', 1, 0, 0, 78, 1, '', '', 1, 5, 0, 0, 1, 1, 1525107665, 1, 1525107665, 0, 0, 0, 1525107665, 1, '', 0, 0, 0, 0, 0, 1),
(85, 'document', 'text/html', 'Золотистый', '#f4d773', '', 'zolotistyj', '', 1, 0, 0, 84, 0, '', '', 1, 5, 0, 0, 1, 1, 1525109162, 1, 1525109182, 0, 0, 0, 1525109162, 1, '', 0, 0, 0, 0, 0, 1),
(86, 'document', 'text/html', 'Полузолотой', '#c7b65c', '', 'poluzolotoj', '', 1, 0, 0, 84, 0, '', '', 1, 5, 0, 0, 1, 1, 1525112765, 1, 1525112765, 0, 0, 0, 1525112765, 1, '', 0, 0, 0, 0, 0, 1),
(87, 'document', 'text/html', 'Светло коричневый', '#9b7f69', '', 'svetlo-seryj', '', 1, 0, 0, 84, 0, '', '', 1, 5, 0, 0, 1, 1, 1525112788, 1, 1525112914, 0, 0, 0, 1525112788, 1, '', 0, 0, 0, 0, 0, 1),
(88, 'document', 'text/html', 'Коричневый', '#8c6d58', '', 'korichnevyj', '', 1, 0, 0, 84, 0, '', '', 1, 5, 0, 0, 1, 1, 1525112819, 1, 1525112819, 0, 0, 0, 1525112819, 1, '', 0, 0, 0, 0, 0, 1),
(89, 'document', 'text/html', 'Светло бежевый', '#ede1b9', '', 'svetlo-bezhevyj', '', 1, 0, 0, 84, 0, '', '', 1, 5, 0, 0, 1, 1, 1525112832, 1, 1525112832, 0, 0, 0, 1525112832, 1, '', 0, 0, 0, 0, 0, 1),
(90, 'document', 'text/html', 'Серый', '#545452', '', 'seryj', '', 1, 0, 0, 84, 0, '', '', 1, 5, 0, 0, 1, 1, 1525112843, 1, 1525112843, 0, 0, 0, 1525112843, 1, '', 0, 0, 0, 0, 0, 1),
(91, 'document', 'text/html', 'Темно оранжевый', '#b25840', '', 'temno-oranzhevyj', '', 1, 0, 0, 84, 0, '', '', 1, 5, 0, 0, 1, 1, 1525112855, 1, 1525112855, 0, 0, 0, 1525112855, 1, '', 0, 0, 0, 0, 0, 1),
(92, 'document', 'text/html', 'Болотный', '#95a26a', '', 'bolotnyj', '', 1, 0, 0, 84, 0, '', '', 1, 5, 0, 0, 1, 1, 1525112865, 1, 1525112865, 0, 0, 0, 1525112865, 1, '', 0, 0, 0, 0, 0, 1),
(93, 'document', 'text/html', 'Светло серый', '#c6c5ba', '', 'svetlo-seryj1', '', 1, 0, 0, 84, 0, '', '', 1, 5, 0, 0, 1, 1, 1525112875, 1, 1525112875, 0, 0, 0, 1525112875, 1, '', 0, 0, 0, 0, 0, 1),
(94, 'document', 'text/html', 'Светло золотой', '#ecb678', '', 'svetlo-zolotoj', '', 1, 0, 0, 84, 0, '', '', 1, 5, 0, 0, 1, 1, 1525112896, 1, 1525112896, 0, 0, 0, 1525112896, 1, '', 0, 0, 0, 0, 0, 1),
(95, 'document', 'text/html', 'Вид', '', '', 'vid', '', 1, 0, 0, 78, 1, '', '', 1, 15, 0, 0, 1, 1, 1525113378, 1, 1525113378, 0, 0, 0, 1525113378, 1, '', 0, 0, 0, 0, 0, 1),
(96, 'document', 'text/html', 'Полнотелый', '', '', 'polnotelyj', '', 1, 0, 0, 95, 0, '', '', 1, 15, 0, 0, 1, 1, 1525117562, 1, 1525117672, 0, 0, 0, 1525117562, 1, '', 0, 0, 0, 0, 0, 1),
(97, 'document', 'text/html', 'Пустотелый', '', '', 'pustotelyj', '', 1, 0, 0, 95, 0, '', '', 1, 15, 0, 0, 1, 1, 1525117615, 1, 1525117615, 0, 0, 0, 1525117615, 1, '', 0, 0, 0, 0, 0, 1),
(98, 'document', 'text/html', 'Фасонный', '', '', 'fasonnyj', '', 1, 0, 0, 95, 0, '', '', 1, 15, 0, 0, 1, 1, 1525117649, 1, 1525117649, 0, 0, 0, 1525117649, 1, '', 0, 0, 0, 0, 0, 1),
(99, 'document', 'text/html', 'Форма', '', '', 'forma', '', 1, 0, 0, 78, 1, '', '', 1, 0, 0, 0, 1, 1, 1525121441, 1, 1525121441, 0, 0, 0, 1525121441, 1, '', 0, 0, 0, 0, 0, 1),
(100, 'document', 'text/html', 'Угловой', '', '', 'uglovoj', '', 1, 0, 0, 99, 0, '', '', 1, 16, 0, 0, 1, 1, 1525122083, 1, 1525122083, 0, 0, 0, 1525122083, 1, '', 0, 0, 0, 0, 0, 1),
(101, 'document', 'text/html', 'Брусок угловой', '', '', 'brusok-uglovoj', '', 1, 0, 0, 99, 0, '', '', 1, 16, 0, 0, 1, 1, 1525122166, 1, 1525122166, 0, 0, 0, 1525122166, 1, '', 0, 0, 0, 0, 0, 1),
(102, 'document', 'text/html', 'Двусторонный', '', '', 'dvustoronnyj', '', 1, 0, 0, 99, 0, '', '', 1, 16, 0, 0, 1, 1, 1525122198, 1, 1525122198, 0, 0, 0, 1525122198, 1, '', 0, 0, 0, 0, 0, 1),
(103, 'document', 'text/html', 'Фигурный №1', '', '', 'figurnyj-n1', '', 1, 0, 0, 99, 0, '', '', 1, 16, 0, 0, 1, 1, 1525122234, 1, 1525122234, 0, 0, 0, 1525122234, 1, '', 0, 0, 0, 0, 0, 1),
(104, 'document', 'text/html', 'Фигурный №2', '', '', 'figurnyj-n2', '', 1, 0, 0, 99, 0, '', '', 1, 16, 0, 0, 1, 1, 1525122262, 1, 1525122262, 0, 0, 0, 1525122262, 1, '', 0, 0, 0, 0, 0, 1),
(105, 'document', 'text/html', 'Трапеция №1', '', '', 'trapeciya-n1', '', 1, 0, 0, 99, 0, '', '', 1, 16, 0, 0, 1, 1, 1525122296, 1, 1525122296, 0, 0, 0, 1525122296, 1, '', 0, 0, 0, 0, 0, 1),
(106, 'document', 'text/html', 'Трапеция №2', '', '', 'trapeciya-n2', '', 1, 0, 0, 99, 0, '', '', 1, 16, 0, 0, 1, 1, 1525122328, 1, 1525122328, 0, 0, 0, 1525122328, 1, '', 0, 0, 0, 0, 0, 1),
(107, 'document', 'text/html', 'Трапеция №3', '', '', 'trapeciya-n3', '', 1, 0, 0, 99, 0, '', '', 1, 16, 0, 0, 1, 1, 1525122362, 1, 1525122362, 0, 0, 0, 1525122362, 1, '', 0, 0, 0, 0, 0, 1),
(108, 'document', 'text/html', 'Как можно использовать нашу продукцию - слайдер', '', '', 'kak-mozhno-ispolzovat-nashu-produkciyu-slajder', '', 1, 0, 0, 78, 1, '', '', 1, 0, 0, 0, 1, 1, 1525122900, 1, 1525123374, 0, 0, 0, 1525122900, 1, '', 0, 0, 0, 0, 0, 1),
(109, 'document', 'text/html', 'Слайд 1', '', '', 'slajd-11', '', 1, 0, 0, 108, 0, '', '', 1, 17, 0, 0, 1, 1, 1525123142, 1, 1525123142, 0, 0, 0, 1525123142, 1, '', 0, 0, 0, 0, 0, 1),
(111, 'document', 'text/html', 'Как можно использовать нашу продукцию - слайдер', '', '', 'kak-mozhno-ispolzovat-nashu-produkciyu-slajder1', '', 1, 0, 0, 76, 1, '', '', 1, 0, 0, 0, 1, 1, 1525124051, 1, 1525124051, 0, 0, 0, 1525124051, 1, '', 0, 0, 0, 0, 0, 1),
(110, 'document', 'text/html', 'Слайд 2', '', '', 'slajd-21', '', 1, 0, 0, 108, 0, '', '', 1, 17, 0, 0, 1, 1, 1525123163, 1, 1525123580, 0, 0, 0, 1525123163, 1, '', 0, 0, 0, 0, 0, 1),
(112, 'document', 'text/html', 'Товары', '', '', 'tovary', '', 1, 0, 0, 76, 1, '', '', 1, 0, 0, 0, 1, 1, 1525124078, 1, 1525124078, 0, 0, 0, 1525124078, 1, '', 0, 0, 0, 0, 0, 1),
(113, 'document', 'text/html', 'Слайд 1', '', '', 'slajd-12', '', 1, 0, 0, 111, 0, '', '', 1, 17, 0, 0, 1, 1, 1525124223, 1, 1525124223, 0, 0, 0, 1525124223, 1, '', 0, 0, 0, 0, 0, 1),
(114, 'document', 'text/html', 'Слайд 2', '', '', 'slajd-22', '', 1, 0, 0, 111, 0, '', '', 1, 17, 0, 0, 1, 1, 1525124264, 1, 1525124264, 0, 0, 0, 1525124264, 1, '', 0, 0, 0, 0, 0, 1),
(115, 'document', 'text/html', 'Слайд 3', '', '', 'slajd-31', '', 1, 0, 0, 111, 0, '', '', 1, 17, 0, 0, 1, 1, 1525124285, 1, 1525124285, 0, 0, 0, 1525124285, 1, '', 0, 0, 0, 0, 0, 1),
(116, 'document', 'text/html', 'Слайд 4', '', '', 'slajd-41', '', 1, 0, 0, 111, 0, '', '', 1, 17, 0, 0, 1, 1, 1525124320, 1, 1525124320, 0, 0, 0, 1525124320, 1, '', 0, 0, 0, 0, 0, 1),
(117, 'document', 'text/html', 'Элементы', '', '', 'elementy', '', 1, 0, 0, 1, 1, '', '', 1, 0, 0, 0, 1, 1, 1525175616, 1, 1525175616, 0, 0, 0, 1525175616, 1, '', 0, 0, 0, 0, 0, 1),
(118, 'document', 'text/html', 'Товары', '', '', 'tovary1', '', 1, 0, 0, 117, 1, '', '', 1, 0, 0, 0, 1, 1, 1525175630, 1, 1525175630, 0, 0, 0, 1525175630, 1, '', 0, 0, 0, 0, 0, 1),
(119, 'document', 'text/html', 'Колпак из гладкого кирпича', '', '', 'kolpak-iz-gladkogo-kirpicha', '', 1, 0, 0, 118, 0, '', '', 1, 18, 0, 0, 1, 1, 1525175843, 1, 1525192924, 0, 0, 0, 1525175843, 1, '', 0, 0, 0, 0, 0, 1),
(120, 'document', 'text/html', 'Как можно использовать нашу продукцию - слайдер', '', '', 'kak-mozhno-ispolzovat-nashu-produkciyu-slajder2', '', 1, 0, 0, 117, 1, '', '', 1, 3, 0, 0, 1, 1, 1525192955, 1, 1525192955, 0, 0, 0, 1525192955, 1, '', 0, 0, 0, 0, 0, 1),
(121, 'document', 'text/html', 'Слайд 1', '', '', 'slajd-13', '', 1, 0, 0, 120, 0, '', '', 1, 17, 0, 0, 1, 1, 1525193216, 1, 1525193216, 0, 0, 0, 1525193216, 1, '', 0, 0, 0, 0, 0, 1),
(122, 'document', 'text/html', 'Слайд 2', '', '', 'slajd-23', '', 1, 0, 0, 120, 0, '', '', 1, 17, 0, 0, 1, 1, 1525193285, 1, 1525193285, 0, 0, 0, 1525193285, 1, '', 0, 0, 0, 0, 0, 1),
(123, 'document', 'text/html', 'Слайд 3', '', '', 'slajd-32', '', 1, 0, 0, 120, 0, '', '', 1, 17, 0, 0, 1, 1, 1525193321, 1, 1525193321, 0, 0, 0, 1525193321, 1, '', 0, 0, 0, 0, 0, 1),
(124, 'document', 'text/html', 'Слайд 4', '', '', 'slajd-42', '', 1, 0, 0, 120, 0, '', '', 1, 17, 0, 0, 1, 1, 1525193381, 1, 1525193381, 0, 0, 0, 1525193381, 1, '', 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `evo_site_htmlsnippets`
--

CREATE TABLE `evo_site_htmlsnippets` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `editor_name` varchar(50) NOT NULL DEFAULT 'none',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the snippet'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains the site chunks.';

--
-- Дамп данных таблицы `evo_site_htmlsnippets`
--

INSERT INTO `evo_site_htmlsnippets` (`id`, `name`, `description`, `editor_type`, `editor_name`, `category`, `cache_type`, `snippet`, `locked`, `createdon`, `editedon`, `disabled`) VALUES
(2, 'mm_rules', 'Default ManagerManager rules.', 0, 'none', 3, 0, '// more example rules are in assets/plugins/managermanager/example_mm_rules.inc.php\r\n// example of how PHP is allowed - check that a TV named documentTags exists before creating rule\r\n\r\nif ($modx->db->getValue($modx->db->select(\'count(id)\', $modx->getFullTableName(\'site_tmplvars\'), \"name=\'documentTags\'\"))) {\r\n	mm_widget_tags(\'documentTags\', \' \'); // Give blog tag editing capabilities to the \'documentTags (3)\' TV\r\n}\r\nmm_widget_showimagetvs(); // Always give a preview of Image TVs\r\n\r\nmm_createTab(\'SEO\', \'seo\', \'\', \'\', \'\', \'\');\r\nmm_moveFieldsToTab(\'titl,keyw,desc,seoOverride,noIndex,sitemap_changefreq,sitemap_priority,sitemap_exclude\', \'seo\', \'\', \'\');\r\nmm_widget_tags(\'keyw\',\',\'); // Give blog tag editing capabilities to the \'documentTags (3)\' TV\r\n\r\n\r\n//mm_createTab(\'Images\', \'photos\', \'\', \'\', \'\', \'850\');\r\n//mm_moveFieldsToTab(\'images,photos\', \'photos\', \'\', \'\');\r\n\r\n//mm_hideFields(\'longtitle,description,link_attributes,menutitle,content\', \'\', \'6,7\');\r\n\r\n//mm_hideTemplates(\'0,5,8,9,11,12\', \'2,3\');\r\n\r\n//mm_hideTabs(\'settings, access\', \'2\');\r\n', 0, 0, 0, 0),
(3, 'AjaxSearch_tplInput', 'Input-Form for AjaxSearch', 0, 'none', 1, 0, '[+as.showInputForm:is=`1`:then=`\n<form id=\"[+as.formId+]\" action=\"[+as.formAction+]\" method=\"post\">\n    [+as.showAsId:is=`1`:then=`<input type=\"hidden\" name=\"[+as.asName+]\" value=\"[+as.asId+]\" />`+]\n    <input type=\"hidden\" name=\"advsearch\" value=\"[+as.advSearch+]\" />\n	<div class=\"input-group\">\n		<input id=\"[+as.inputId+]\" class=\"form-control cleardefault\" type=\"text\" name=\"search\" value=\"[+as.inputValue+]\"[+as.inputOptions+] />\n		[+as.liveSearch:is=`0`:then=`\n		<span class=\"input-group-btn\">\n			<button class=\"btn btn-primary\" type=\"submit\"><i class=\"fa fa-search\"></i></button>	\n		</span>\n		`:else=`\n		<div class=\"input-group-addon\"><i class=\"fa fa-search\"></i></div>\n		`+]		\n	</div>\n</form>\n`+]\n[+as.showIntro:is=`1`:then=`\n<p class=\"ajaxSearch_intro\" id=\"ajaxSearch_intro\">[+as.introMessage+]</p>\n`+]', 0, 0, 0, 0),
(4, 'AjaxSearch_tplAjaxResult', 'Result Tpl for AjaxSearch', 0, 'none', 1, 0, '<div class=\"[+as.resultClass+]\">\n  <strong><a class=\"[+as.resultLinkClass+]\" href=\"[+as.resultLink+]\" title=\"[+as.longtitle+]\">[+as.pagetitle+]</a></strong>\n[+as.descriptionShow:is=`1`:then=`\n  <small><span class=\"[+as.descriptionClass+]\">[+as.description+]</span></small>\n`+]\n[+as.extractShow:is=`1`:then=`\n  <div class=\"[+as.extractClass+]\"><p>[+as.extract+]</p></div>\n`+]\n[+as.breadcrumbsShow:is=`1`:then=`\n  <span class=\"[+as.breadcrumbsClass+]\">[+as.breadcrumbs+]</span>\n`+]\n</div>', 0, 0, 0, 0),
(6, 'AjaxSearch_tplAjaxGrpResult', 'Grp Result Tpl for AjaxSearch', 0, 'none', 1, 0, '[+as.grpResultsDef:is=`1`:then=`\n<div id=\"[+as.grpResultId+]\" class=\"AS_ajax_grpResult\">\n[+as.headerGrpResult+]\n[+as.listResults+]\n[+as.footerGrpResult+]\n</div>\n`:else=`\n<div class=\"AS_ajax_grpResultName\">[+as.grpResultNameShow:is=`1`:then=`[+as.grpResultName+]`+]\n<span class=\"ajaxSearch_grpResultsDisplayed\">[+as.grpResultsDisplayedText+]</span></div>\n`+]', 0, 0, 0, 0),
(8, 'AjaxSearch_tplAjaxResults', 'Results Tpl for AjaxSearch', 0, 'none', 1, 0, '<div id=\"search_results\" class=\"modal fade\" tabindex=\"-1\" role=\"dialog\">\n  <div class=\"modal-dialog\">\n    <div class=\"modal-content\">\n      <div class=\"modal-header\">\n        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n        <h3 class=\"modal-title\">Search Results</h3>\n      </div>\n      <div class=\"modal-body\">\n        [+as.noResults:is=`1`:then=`\n		  <div class=\"[+as.noResultClass+]\">\n			[+as.noResultText+]\n		  </div>\n		`:else=`\n		<p class=\"AS_ajax_resultsInfos\">[+as.resultsFoundText+]<span class=\"AS_ajax_resultsDisplayed\">[+as.resultsDisplayedText+]</span></p>\n		[+as.listGrpResults+]\n		`+]\n		[+as.moreResults:is=`1`:then=`\n		  <div class=\"[+as.moreClass+]\">\n			<a href=\"[+as.moreLink+]\" title=\"[+as.moreTitle+]\">[+as.moreText+]</a>\n		  </div>\n		`+]\n		[+as.showCmt:is=`1`:then=`\n		[+as.comment+]\n		`+]\n      </div>\n      <div class=\"modal-footer\">\n        <button type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\">Close</button>\n      </div>\n    </div><!-- /.modal-content -->\n  </div><!-- /.modal-dialog -->\n</div><!-- /.modal -->\n<script>$(\'#search_results\').modal(\'show\')</script>', 0, 0, 0, 0),
(9, 'Comments_tplForm', 'Comments (Jot) Form-Template', 0, 'none', 1, 0, '<a name=\"jf[+jot.link.id+]\"></a>\n<h2>[+form.edit:is=`1`:then=`Edit comment`:else=`Write a comment`+]</h2>\n<div class=\"jot-list\">\n<ul>\n	<li>Required fields are marked with <b>*</b>.</li>\n</ul>\n</div>\n[+form.error:isnt=`0`:then=`\n<div class=\"jot-err\">\n[+form.error:select=`\n&-3=You are trying to re-submit the same post. You have probably clicked the submit button more than once.\n&-2=Your comment has been rejected.\n&-1=Your comment has been saved, it will first be reviewed before it is published.\n&1=You are trying to re-submit the same post. You have probably clicked the submit button more than once.\n&2=The security code you entered was incorrect.\n&3=You can only post once each [+jot.postdelay+] seconds.\n&4=Your comment has been rejected.\n&5=[+form.errormsg:ifempty=`You didn\'t enter all the required fields`+]\n`+]\n</div>\n`:strip+]\n[+form.confirm:isnt=`0`:then=`\n<div class=\"jot-cfm\">\n[+form.confirm:select=`\n&1=Your comment has been published.\n&2=Your comment has been saved, it will first be reviewed before it is published.\n&3=Comment saved.\n`+]\n</div>\n`:strip+]\n<form method=\"post\" action=\"[+form.action:esc+]#jf[+jot.link.id+]\" class=\"jot-form\">\n	<fieldset>\n	<input name=\"JotForm\" type=\"hidden\" value=\"[+jot.id+]\" />\n	<input name=\"JotNow\" type=\"hidden\" value=\"[+jot.seed+]\" />\n	<input name=\"parent\" type=\"hidden\" value=\"[+form.field.parent+]\" />\n	\n	[+form.moderation:is=`1`:then=`\n		<div class=\"jot-row\">\n			<b>Created on:</b> [+form.field.createdon:date=`%a %B %d, %Y at %H:%M`+]<br />\n			<b>Created by:</b> [+form.field.createdby:userinfo=`username`:ifempty=`[+jot.guestname+]`+]<br />\n			<b>IP address:</b> [+form.field.secip+]<br />\n			<b>Published:</b> [+form.field.published:select=`0=No&1=Yes`+]<br />\n			[+form.field.publishedon:gt=`0`:then=`\n				<b>Published on:</b> [+form.field.publishedon:date=`%a %B %d, %Y at %H:%M`+]<br />\n				<b>Published by:</b> [+form.field.publishedby:userinfo=`username`:ifempty=` - `+]<br />\n			`+]\n			[+form.field.editedon:gt=`0`:then=`\n				<b>Edited on:</b> [+form.field.editedon:date=`%a %B %d, %Y at %H:%M`+]<br />\n				<b>Edited by:</b> [+form.field.editedby:userinfo=`username`:ifempty=` -`+]<br />\n			`+]\n		</div>\n	`:strip+]\n	\n	[+form.guest:is=`1`:then=`\n		<div class=\"form-group\">\n			<label for=\"name[+jot.id+]\">Name:</label>\n			<input tabindex=\"[+jot.seed:math=`?+1`+]\" name=\"name\" class=\"form-control\" type=\"text\" size=\"40\" value=\"[+form.field.custom.name:esc+]\" id=\"name[+jot.id+]\" />\n		</div>\n		<div class=\"form-group\">\n			<label for=\"email[+jot.id+]\">Email:</label>\n			<input tabindex=\"[+jot.seed:math=`?+2`+]\" name=\"email\" class=\"form-control\" type=\"text\" size=\"40\" value=\"[+form.field.custom.email:esc+]\" id=\"email[+jot.id+]\"/>\n		</div>\n	`:strip+]\n	<div class=\"form-group\">\n		<label for=\"title[+jot.id+]\">Subject:</label>\n		<input tabindex=\"[+jot.seed:math=`?+3`+]\" name=\"title\" class=\"form-control\" type=\"text\" size=\"40\" value=\"[+form.field.title:esc+]\" id=\"title[+jot.id+]\"/>\n	</div>\n	<div class=\"form-group\">\n		<label for=\"content[+jot.id+]\">Comment: *</label>\n		<textarea tabindex=\"[+jot.seed:math=`?+4`+]\" name=\"content\" class=\"form-control\" rows=\"8\" id=\"content[+jot.id+]\">[+form.field.content:esc+]</textarea>\n	</div>\n	\n[+jot.captcha:is=`1`:then=`\n	<div style=\"width:150px;margin-top: 5px;margin-bottom: 5px;\">\n		<a href=\"[+jot.link.current:esc+]\">\n			<img src=\"[(modx_manager_url)]includes/veriword.php?rand=[+jot.seed+]\" width=\"148\" height=\"60\" alt=\"If you have trouble reading the code, click on the code itself to generate a new random code.\" style=\"border: 1px solid #003399\" />\n		</a>\n	</div>\n	<div class=\"form-group\">\n		<label for=\"vericode[+jot.id+]\">Help prevent spam - enter security code above:</label>\n		<input type=\"text\" name=\"vericode\" style=\"width:150px;\" size=\"20\" id=\"vericode[+jot.id+]\" />\n	</div>\n`:strip+]\n\n	<input tabindex=\"[+jot.seed:math=`?+5`+]\" name=\"submit\" class=\"btn btn-primary\" type=\"submit\" value=\"[+form.edit:is=`1`:then=`Save Comment`:else=`Post Comment`+]\" />\n	[+form.edit:is=`1`:then=`\n		<input tabindex=\"[+jot.seed:math=`?+5`+]\" name=\"submit\" class=\"btn btn-default\" type=\"submit\" value=\"Cancel\" onclick=\"history.go(-1);return false;\" />\n	`+] \n	</fieldset>\n</form>', 0, 0, 0, 0),
(13, 'Comments', 'Comments (JotX) showing beneath a blog entry.', 2, 'none', 1, 0, '<div id=\"commentsAnchor\">\n[[ifsnippet? &name=`JotX`]]	\n[!JotX? &customfields=`name,email` &subscribe=`1` &pagination=`4` &badwords=`dotNet` &canmoderate=`Site Admins` &tplForm=`Comments_tplForm` &tplComments=`Comments_tplComments`!]\n</div>', 0, 1507723259, 1509825745, 0),
(14, 'ContactForm', 'eForm-template for showing contact-form', 2, 'none', 1, 0, '<form id=\"EmailForm\">\n	<input type=\"hidden\" name=\"formid\" value=\"ContactForm\">\n	<p>[+form.messages+]</p>\n	<div class=\"form-group [+name.classname+]\">\n		<label for=\"cfName\">Your name:</label>\n		<input type=\"text\" class=\"form-control\" name=\"name\" id=\"cfName\" value=\"[+name.value+]\" placeholder=\"Your Name\"/>\n		<div class=\"invalid-feedback\">[+name.error+]</div>\n	</div>\n	<div class=\"form-group [+email.classname+]\">\n		<label for=\"cfEmail\">Your Email Address:</label>\n		<input type=\"text\" class=\"form-control\" name=\"email\" id=\"cfEmail\" value=\"[+email.value+]\" placeholder=\"Email Address\"/>\n		<div class=\"invalid-feedback\">[+email.error+]</div>\n	</div>\n	\n	<div class=\"form-group [+subject.classname+]\">\n		<label for=\"cfRegarding\">Regarding:</label>\n		<select class=\"form-control\" name=\"subject\" id=\"cfRegarding\">\n			<option value=\"General Inquiries\" [+s.subject.General Inquiries+] >General Inquiries</option>\n			<option value=\"Press\" [+s.subject.Press+] >Press or Interview Request</option>\n			<option value=\"Partnering\" [+s.subject.Partnering+] >Partnering Opportunities</option>\n		</select>\n		<div class=\"invalid-feedback\">[+subject.error+]</div>\n	</div>\n	\n	<div class=\"form-group [+message.classname+]\">\n		<label for=\"cfMessage\">Message:</label>\n		<textarea name=\"message\" id=\"cfMessage\" class=\"form-control\">[+message.value+]</textarea>\n		<div class=\"invalid-feedback\">[+message.error+]</div>\n	</div>\n	\n	<div class=\"form-group\">\n		<input type=\"submit\" name=\"contact\" id=\"submit\" class=\"btn btn-primary\" value=\"Send This Message\" />\n	</div>\n\n</form>', 0, 1507723259, 1507816800, 0),
(15, 'ContactFormReport', 'eForm-template for sending form-data by mail', 0, 'none', 1, 0, '<p>This is a response sent by <b>[+name+]</b> using the feedback form on the website. The details of the message follow below:</p>\n\n\n<p>Name: [+name+]</p>\n<p>Email: [+email+]</p>\n<p>Regarding: [+subject+]</p>\n<p>comments:<br />[+message+]</p>\n\n<p>You can use this link to reply: <a href=\"mailto:[+email+]?subject=RE: [+subject+]\">[+email+]</a></p>\n', 0, 1507723259, 0, 0),
(16, 'header', 'Шапка главной', 2, 'none', 7, 0, '<header class=\"header\" id=\"header\">\r\n	<div class=\"container\">\r\n		<div class=\"row header__top\">\r\n			<div class=\"col-xl-3 col-lg-6 col-6 order-1 logo__box\">\r\n				<div class=\"logo\">\r\n					<h2 class=\"logo__caption\">КИРПИЧЪ</h2>\r\n					<p class=\"logo__subtitle\">Производство и продажа <br> облицовочного кирпича</p>\r\n				</div>\r\n			</div>\r\n			<div class=\"col-xl-6 menu__pc order-2\">\r\n				<div class=\"menu\">\r\n					<div class=\"geolocation\">\r\n						<img class=\"modal__region\" src=\"assets/images/geolocation.svg\">\r\n						<p class=\"modal__region geolocation__city\">г. Ижевск</p>\r\n					</div>\r\n					<nav class=\"nav\">\r\n						<a href=\"#\" data-anchor=\"#work\" class=\"nav__link\">Преимущества</a>\r\n						<a href=\"#\" data-anchor=\"#products\" class=\"nav__link\">Купить</a>\r\n						<a href=\"#\" data-anchor=\"#offers\" class=\"nav__link\">Отзывы</a>\r\n						<a href=\"#\" data-anchor=\"#guarant\" class=\"nav__link\">Гарантия</a>\r\n						<a href=\"#\" data-anchor=\"#footer\" class=\"nav__link\">Контакты</a>\r\n					</nav>\r\n				</div>\r\n			</div>\r\n			<div class=\"col-xl-3 col-lg-5 col-5 order-2 header__cb__hidden\">\r\n				<div class=\"header__callback\">\r\n					<p class=\"callback__caption\">звонок по России бесплатно</p>\r\n					<a href=\"tel: [*phone*]\" class=\"callback__number\">[*phone*]</a>\r\n					<a href=\"#\" class=\"btn callback__btn\">ПЕРЕЗВОНИТЕ МНЕ</a>\r\n				</div>\r\n			</div>\r\n			<div class=\"col-lg-1 col-1 menu__btn order-3\">\r\n				<button class=\"c-hamburger c-hamburger--htx\" id=\"mobile_menu\">\r\n					<span>toggle menu</span>\r\n				</button>\r\n			</div>\r\n		</div>\r\n		<div class=\"row header__content\">\r\n			<div class=\"col-lg-6\">\r\n				<h2 class=\"content__caption\">\r\n					<span class=\"yellow\">Закажите бесплатную пробную партию кирпича</span> и убедитесь в нашем качестве\r\n				</h2>\r\n			</div>\r\n			<div class=\"col-lg-6 header__form__wrap\">\r\n				<div class=\"header__form__box\">\r\n					[!FormLister?\r\n						&formid=`header_form_cb`\r\n						&rules=`{\"name\":{\"required\":\"Введите имя\"},\"phone\":{\"required\":\"Введите номер телефона\",\"phone\":\"Введите номер правильно\"}}`\r\n						&formTpl=`header_callback_form`\r\n						&subject=`Запрос обратного звонка с сайта`\r\n						&successTpl=`form_modal_cb_success`\r\n						&parseDocumentSource=`1`\r\n					!]\r\n				</div>\r\n				<img src=\"assets/images/kirp_header.png\" alt=\"\" class=\"header__kirp__form\">\r\n			</div>\r\n		</div>\r\n		<div class=\"row header__slider slider\">\r\n			<div class=\"slider__content slick__header\">\r\n				[[DocLister? \r\n					&parents=`54` \r\n					&tpl=`header_slider_elem`\r\n					&tvPrefix=``\r\n					&tvList=`headerSliderImg`\r\n				]]\r\n			</div>\r\n		</div>\r\n	</div>\r\n</header>\r\n<div class=\"menu__mob__right non-active\" style=\"z-index: 1010;\">\r\n	<div class=\"geolocation\">\r\n		<img class=\"modal__region\" src=\"assets/images/geolocation_black.svg\">\r\n		<p class=\"modal__region geolocation__city\">г. Ижевск</p>\r\n		<div class=\"close\"></div>\r\n	</div>\r\n	<nav class=\"nav\">\r\n		<a href=\"#\" data-anchor=\"#work\" class=\"nav__link\">Преимущества</a>\r\n		<a href=\"#\" data-anchor=\"#products\" class=\"nav__link\">Купить</a>\r\n		<a href=\"#\" data-anchor=\"#offers\" class=\"nav__link\">Отзывы</a>\r\n		<a href=\"#\" data-anchor=\"#guarant\" class=\"nav__link\">Гарантия</a>\r\n		<a href=\"#\" data-anchor=\"#footer\" class=\"nav__link\">Контакты</a>\r\n	</nav>\r\n</div>', 0, 1524848394, 1525281207, 0),
(19, 'products', '', 2, 'none', 7, 0, '<section class=\"products\" id=\"products\">\r\n	<div class=\"container products__wrap wrap\">\r\n		<div class=\"row wrap__row\">\r\n			<div class=\"col-12\">  \r\n				<div class=\"products__menu\">\r\n					<a href=\"#\" data-to=\"#stone\" class=\"products__punkt active__products\">Кирпич</a>\r\n					<a href=\"#\" data-to=\"#plit\" class=\"products__punkt\">Плитка</a>\r\n					<a href=\"#\" data-to=\"#elements\" class=\"products__punkt\">Элементы</a>\r\n				</div>\r\n			</div>\r\n			<div class=\"col-12 products__content\">\r\n				<div class=\"stone\" id=\"stone\">\r\n					<div class=\"row justify-content-center\">\r\n						<div class=\"col-12\">\r\n							<h2 class=\"products__caption\">Облицовочный камень</h2>\r\n						</div>\r\n						<div class=\"col-xl-6 col-md-8 col stone__demo\">\r\n							<div class=\"stone__image\">\r\n								<img src=\"assets/images/bricks.jpg\" class=\"stone__img\">\r\n							</div>\r\n							<div class=\"stone__demo__slider\">\r\n								<h4 class=\"stone__demo__slider__caption\">Как можно использовать нашу продукцию</h4>\r\n								<div class=\"stone__slider\">\r\n									[[DocLister? \r\n										&parents=`108` \r\n										&tpl=`stone_slide`\r\n										&tvPrefix=``\r\n										&tvList=`stoneSlideImg`\r\n									]]\r\n								</div>\r\n							</div>\r\n						</div>\r\n						<div class=\"col-xl-6 col-md-8 col stone__info\">\r\n							<div class=\"stone__size\">\r\n								<h5>Выберите размер</h5>\r\n								<div class=\"stone__size__box\">\r\n									[[DocLister? \r\n										&parents=`79` \r\n										&tpl=`stone_size`\r\n									]]\r\n								</div>\r\n							</div>\r\n							<div class=\"stone__color\">\r\n								<h5>Выберите цвет</h5>\r\n								<div class=\"stone__color__box\">\r\n									[[DocLister? \r\n										&parents=`84` \r\n										&tpl=`stone_color`\r\n									]]\r\n								</div>\r\n							</div>\r\n							<div class=\"stone__view\">\r\n								<h5>Выберите вид</h5>\r\n								<div class=\"stone__view__box\">\r\n									[[DocLister? \r\n										&parents=`95` \r\n										&tpl=`stone_view`\r\n										&tvPrefix=``\r\n										&tvList=`stoneViewImgColor, stoneViewImgWB`\r\n									]]\r\n								</div>\r\n							</div>\r\n							<div class=\"stone__form\">\r\n								<h5>Выберите форму</h5>\r\n								<div class=\"row stone__form__box\">\r\n									[[DocLister? \r\n										&parents=`99` \r\n										&tpl=`stone_form`\r\n										&tvPrefix=``\r\n										&tvList=`stoneFormImgWB, stoneFormImgColor`\r\n									]]\r\n								</div>\r\n							</div>\r\n							<div class=\"stone__type\">\r\n								<h5>Тех. характеристики:</h5>\r\n								<table class=\"stone__type__table\">\r\n									<tr class=\"stoneWeight\">\r\n										<td><p class=\"stone__name\">Вес(кг):</p></td>\r\n										<td><p class=\"stone__value\">4,0</p></td>\r\n									</tr>\r\n									<tr class=\"stoneMark\">\r\n										<td><p class=\"stone__name\">Марка прочности:</p></td>\r\n										<td><p class=\"stone__value\">200</p></td>\r\n									</tr>\r\n									<tr class=\"stoneQu\">\r\n										<td><p class=\"stone__name\">Морозостойкость:</p></td>\r\n										<td>100</td>\r\n									</tr>\r\n									<tr class=\"stoneWater\">\r\n										<td><p class=\"stone__name\">Влагопоглощение (%):</p></td>\r\n										<td><p class=\"stone__value\">до 8%</p></td>\r\n									</tr>\r\n									<tr class=\"stoneFire\">\r\n										<td><p class=\"stone__name\">Теплопроводимость (вт/м°с):</p></td>\r\n										<td><p class=\"stone__value\">0,84 вт/м°с</p></td>\r\n									</tr>\r\n									<tr class=\"stoneCount\">\r\n										<td><p class=\"stone__name\">Кол-во на поддоне (шт):</p></td>\r\n										<td><p class=\"stone__value\">336</p></td>\r\n									</tr>\r\n									<tr class=\"stoneWeightP\">\r\n										<td><p class=\"stone__name\">Вес поддона:</p></td>\r\n										<td><p class=\"stone__value\">1350</p></td>\r\n									</tr>\r\n									<tr class=\"stoneColor\">\r\n										<td><p class=\"stone__name\">Цвет:</p></td>\r\n										<td><p class=\"stone__value\">персиковый</p></td>\r\n									</tr>\r\n								</table>\r\n							</div>\r\n							<div class=\"stone__total\">\r\n								<div class=\"stone__price\">\r\n									<h3><span class=\"stonePriceOne\">24.00</span> <span class=\"price__low\">руб./шт</span></h3>\r\n								</div>\r\n								<a href=\"#\" class=\"btn stone__total__btn btn__buy\" data-product=\"#stone\">ЗАКАЗАТЬ</a>\r\n							</div>\r\n						</div>\r\n					</div>\r\n				</div>\r\n				<div class=\"plit\" id=\"plit\">\r\n					<div class=\"row justify-content-md-center\">\r\n						<div class=\"col-12\">\r\n							<h2 class=\"cap__snake plit__caption\">Плитка</h2>\r\n						</div>\r\n						[[DocLister? \r\n							&parents=`112` \r\n							&tpl=`product_plit`\r\n							&tvPrefix=``\r\n							&tvList=`plitImg, plitColor, plitSize, plitWeight, plitCount, plitHeft, plitPrice`\r\n						]]\r\n					</div>\r\n					<div class=\"row\">\r\n						<div class=\"col-12\">\r\n							<h4 class=\"plit__slider__caption\">Как можно использовать нашу продукцию</h4>\r\n						</div>\r\n					</div>\r\n					<div class=\"slider\">\r\n						<div class=\"row slider__content\" id=\"plit__slider\">\r\n							[[DocLister? \r\n								&parents=`111` \r\n								&tpl=`plit_slide`\r\n								&tvPrefix=``\r\n								&tvList=`stoneSlideImg`\r\n							]]\r\n						</div>\r\n					</div>\r\n				</div>\r\n				<div class=\"elements\" id=\"elements\">\r\n					<div class=\"row justify-content-md-center\">\r\n						<div class=\"col-12\">\r\n							<h2 class=\"cap__snake plit__caption\">Элементы</h2>\r\n						</div>\r\n						[[DocLister? \r\n							&parents=`118` \r\n							&tpl=`product_elem`\r\n							&tvPrefix=``\r\n							&tvList=`plitPrice, elemWeight, elemSize, elemImg`\r\n						]]\r\n					</div>\r\n					<div class=\"row\">\r\n						<div class=\"col-12\">\r\n							<h4 class=\"plit__slider__caption\">Как можно использовать нашу продукцию</h4>\r\n						</div>\r\n					</div>\r\n					<div class=\"slider\">\r\n						<div class=\"row slider__content\" id=\"plit__slider\">\r\n							[[DocLister? \r\n								&parents=`120` \r\n								&tpl=`plit_slide`\r\n								&tvPrefix=``\r\n								&tvList=`stoneSlideImg`\r\n							]]\r\n						</div>\r\n					</div>\r\n				</div>\r\n			</div>\r\n\r\n		</div>\r\n	</div>\r\n</section>', 0, 1524874681, 1525302832, 0),
(26, 'partner', '', 2, 'none', 10, 0, '<div class=\"partner col-md-4 col-lg-3 col-sm-6 col\">\r\n	<img src=\"[+partnerImg+]\" alt=\"[+pagetitle+]\">\r\n</div>', 0, 1524937694, 1524937694, 0),
(35, 'stone_size', 'Размер кирпича', 2, 'none', 12, 0, '<a href=\"#\" class=\"stone__size__elem\">\r\n	<span class=\"stone__size__bold\">[+pagetitle+]</span>\r\n	<span class=\"stone__size__name\">[+description+]</span>\r\n</a>', 0, 1525100745, 1525122528, 0),
(24, 'header_slider_elem', '', 2, 'none', 9, 0, '<div class=\"header__slider__elem\">\r\n	<img src=\"[+headerSliderImg+]\" alt=\"\" class=\"header__slider__image\">\r\n	<span class=\"header__slider__text\">[+content+]</span>\r\n</div>', 0, 1524918534, 1524925679, 0),
(41, 'product_elem', 'Товар (элемент)', 2, 'none', 12, 0, '<div class=\"col-lg-4 col-xl-3 col-md-6 col-sm-6 col\">\r\n	<div class=\"plit__elem\">\r\n		<img src=\"[+elemImg+]\" class=\"plit__elem__img\">\r\n		<h5 class=\"plit__elem__caption\">[+pagetitle+]</h5>\r\n		<p class=\"plit__elem__stat\">\r\n			Размер: [+elemSize+] <br>\r\n			Вес: [+elemWeight+] <br>\r\n		</p>\r\n		<h4>[+plitPrice+] <span class=\"price__low\">руб./шт</span></h4>\r\n		<a href=\"\" class=\"plit__elem__btn btn\">ЗАКАЗАТЬ</a>\r\n	</div>\r\n</div>', 0, 1525176471, 1525192877, 0),
(40, 'plit_slide', 'Слайд в слайдере - Как можно использовать нашу продукцию? (кирпич)', 2, 'none', 9, 0, '<div class=\"col-3\">\r\n	<img  class=\"plit__slider__image\" src=\"[+stoneSlideImg+]\" alt=\"/\">\r\n</div>', 0, 0, 1525125014, 0),
(42, 'header_callback_form', 'Форма в шапке', 2, 'none', 11, 0, '<form method=\"POST\" class=\"header__form form__default\" action=\"[~[*id*]~]#header_form_cb\">\r\n	<input type=\"hidden\" name=\"formid\" value=\"header_form_cb\">\r\n	\r\n	<h4 class=\"header__form__caption\">Заказать пробную партию</h4>\r\n	\r\n	<input type=\"text\" class=\"form__input border__input\" placeholder=\"Ваше имя\" name=\"name\" value=\"[+name.value+]\" required>\r\n\r\n	<input type=\"text\" class=\"form__input border__input\" placeholder=\"Ваш номер телефона\" name=\"phone\" value=\"[+phone.value+]\" required>\r\n	\r\n	<input class=\"btn header__form__btn\" type=\"submit\"  name=\"submit\" value=\"Заказать бесплатно\">\r\n	<p class=\"form__politics header__form__polit\">Нажимая на кнопку, вы даете свое согласие на обработку персональных данных. <a href=\"#\">Узнать больше</a></p>\r\n</form>', 0, 1525194067, 1525278100, 0),
(47, 'ask_form', 'Форма - задать вопрос', 2, 'none', 11, 0, '<form action=\"[~[*id*]~]#ask_form\" method=\"POST\" class=\"ask__form form__default\">\r\n	<input type=\"hidden\" name=\"formid\" value=\"ask_form\">\r\n	\r\n	<input type=\"text\" class=\"form__input ask__form__input\" placeholder=\"Ваше имя\" name=\"name\" value=\"[+name.value+]\" required>\r\n	<input type=\"text\" class=\"form__input ask__form__input\" placeholder=\"Ваш номер телефона или email\" name=\"phone\" value=\"[+phone.value+]\" required>\r\n	\r\n	<textarea class=\"form__input ask__form__input\" placeholder=\"Текст сообщения\" name=\"text\" value=\"[+text.value+]\" required></textarea>\r\n	\r\n	<div class=\"form__btn__polit\">\r\n		<input class=\"btn ask__form__btn\" type=\"submit\" name=\"submit\" value=\"Отправить\">\r\n		<p class=\"form__politics\">Нажимая на кнопку, вы даете свое согласие на обработку персональных данных. \r\n			<a href=\"#\">Узнать больше</a></p>\r\n	</div>\r\n</form>', 0, 1525277462, 1525306730, 0),
(38, 'stone_form', 'Форма кирпича ', 2, 'none', 12, 0, '<div class=\"stone__form__elem col-sm-3 col-6\">\r\n	<div class=\"stone__img__wrap\">\r\n		<img src=\"[+stoneFormImgWB+]\" alt=\"\" class=\"stone__form__img-close\">\r\n		<img src=\"[+stoneFormImgColor+]\" alt=\"\" class=\"stone__form__img\">\r\n	</div>\r\n	<p class=\"stone__form__name\">[+pagetitle+]</p>\r\n</div>', 0, 1525121902, 1525122784, 0),
(39, 'stone_slide', 'Слайд в слайдере - Как можно использовать нашу продукцию? (кирпич)', 2, 'none', 9, 0, '<img class=\"stone__demo__slider__image\" src=\"[+stoneSlideImg+]\">', 0, 1525123041, 1525124688, 0),
(36, 'stone_color', 'Цвет кирпича', 2, 'none', 12, 0, '<a href=\"#\" class=\"stone__color__elem\" style=\"background: [+longtitle+]\">\r\n	<img src=\"assets/images/brick_light_shadow.png\" alt=\"\" title=\"[+pagetitle+]\">\r\n</a>', 0, 1525107646, 1525113138, 0),
(37, 'stone_view', 'Вид кирпича', 2, 'none', 12, 0, '<div class=\"stone__view__elem\">\r\n	<img class=\"stone__view__img\" src=\"[+stoneViewImgColor+]\" alt=\"\">\r\n	<img class=\"stone__view__img-close\" src=\"[+stoneViewImgWB+]\" alt=\"\">\r\n	<p class=\"stone__view__name\">[+pagetitle+]</p>\r\n</div>', 0, 1525113592, 1525122553, 0),
(44, 'calc_form', 'Форма - рассчитать стоимость', 2, 'none', 11, 0, '<form action=\"[~[*id*]~]#calc_form\" method=\"POST\" class=\"form__default\">\r\n	<input type=\"hidden\" name=\"formid\" value=\"calc_form\">\r\n\r\n	<div class=\"form__double\">\r\n		<input class=\"calc__form__input form__input\" type=\"text\" name=\"length\" placeholder=\"Длина постройки метров\" value=\"[+length.value+]\" required>\r\n		<input class=\"calc__form__input form__input\" type=\"text\" name=\"height\" placeholder=\"Высота постройки метров\" value=\"[+height.value+]\" required>\r\n	</div>\r\n	<input type=\"text\" class=\"calc__form__input form__input\" placeholder=\"Ваше имя\" name=\"name\" value=\"[+name.value+]\" required>\r\n	<input type=\"text\" class=\"calc__form__input form__input\" placeholder=\"Ваш номер телефона или email\" name=\"phone\" value=\"[+phone.value+]\" required>\r\n	\r\n	<div class=\"form__btn__polit\">\r\n		<input class=\"btn calc__form__btn\" type=\"submit\" name=\"submit\" value=\"Рассчитать стоимость\">\r\n		<p class=\"form__politics\">Нажимая на кнопку, вы даете свое согласие на обработку персональных данных. <a href=\"#\">Узнать больше</a></p>\r\n	</div>\r\n\r\n</form>', 0, 1525273814, 1525291090, 0),
(46, 'calc_success', 'Успешная отправка формы калькулятора', 2, 'none', 11, 0, 'Письмо с сайта\r\nИмя: [+name.value+]\r\nТелефон: [+phone.value+]\r\nДлина: [+length.value+]\r\nВысота: [+height.value+]', 0, 0, 1525274841, 0),
(20, 'sertifics', '', 2, 'none', 7, 0, '<section class=\"sertifics\" id=\"sertifics\">\r\n	<div class=\"container\">\r\n		<div class=\"row\">\r\n			<div class=\"col-12\">\r\n				<h2 class=\"cap__snake\">Сертификаты</h2>\r\n			</div>\r\n			<div class=\"sertifics__box\">\r\n				[[DocLister? \r\n					&parents=`59` \r\n					&tpl=`sert_slider_elem`\r\n					&tvPrefix=``\r\n					&tvList=`sertSliderImg`\r\n				]]\r\n			</div>\r\n		</div>\r\n	</div>\r\n</section>', 0, 1524902993, 1524928686, 0),
(21, 'calc', '', 2, 'none', 7, 0, '<section class=\"calc\" id=\"calc\">\r\n	<div class=\"container wrap calc__wrap\">\r\n		<div class=\"row wrap__row\">\r\n			<div class=\"calc__form__box\">\r\n				<div class=\"calc__form\">\r\n					<div class=\"calc__content\">\r\n						<h3 class=\"yellow\">Рассчет стоимости</h3>\r\n						<p class=\"calc__text\">Мы можем расчитать стоимость и количество материала с учетом параметров вашей постройки. Заполните данную формы и перезвоним вам в течении 10 минут.</p>\r\n						\r\n						[!FormLister?\r\n							&formid=`calc_form`\r\n							&formTpl=`calc_form`\r\n							&subject=`Запрос обратного звонка с сайта`\r\n							&successTpl=`calc_success`\r\n							&parseDocumentSource=`1`\r\n						!]\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</section>', 0, 1524903048, 1525279024, 0),
(22, 'partners', '', 2, 'none', 7, 0, '<section class=\"partners\" id=\"partners\">\r\n	<div class=\"container wrap\">\r\n		<div class=\"row\">\r\n			<h2 class=\"cap__snake partners__caption\">Наши клиенты <br>и партнеры</h2>\r\n			<div class=\"partners__box\">\r\n				[[DocLister? \r\n					&parents=`63` \r\n					&tpl=`partner`\r\n					&tvPrefix=``\r\n					&tvList=`partnerImg`\r\n				]]\r\n			</div>\r\n		</div>\r\n	</div>\r\n</section>', 0, 1524903082, 1524937897, 0),
(27, 'work', '', 2, 'none', 7, 0, '<section class=\"work\" id=\"work\">\r\n	<div class=\"container wrap\">\r\n		<div class=\"row\">\r\n			<div class=\"col-12\">\r\n				<h2 class=\"cap__snake work__caption\">\r\n					Как мы работаем\r\n				</h2>\r\n				<div class=\"row work__box\">\r\n					<div class=\"col-xl-3 col-lg-6 col-12 col-sm-6 work__elem \"> \r\n						<!-- TODO: work__arrow -->\r\n						<img src=\"assets/images/how_01.png\" alt=\"/\">\r\n						<p class=\"work__elem__text\">Вы оставляете <br> заявку на сайте</p>\r\n					</div>\r\n					<div class=\"col-xl-3 col-lg-6 col-12 col-sm-6 work__elem \"> \r\n						<!-- TODO: work__arrow -->\r\n						<img src=\"assets/images/how_02.png\" alt=\"/\">\r\n						<p class=\"work__elem__text\">Наш специалист <br> перезванивает вам и <br>уточняет детали</p>\r\n					</div>\r\n					<div class=\"col-xl-3 col-lg-6 col-12 col-sm-6 work__elem \"> \r\n						<!-- TODO: work__arrow -->\r\n						<img src=\"assets/images/how_03.png\" alt=\"/\">\r\n						<p class=\"work__elem__text\">Доставляем кирпич прямо до <br> вашей стройплощадки всего <br> за 5 дней</p>\r\n					</div>\r\n					<div class=\"col-xl-3 col-lg-6 col-12  work__elem\">\r\n						<img src=\"assets/images/how_04.png\" alt=\"/\">\r\n						<p class=\"work__elem__text\">Отгружаем <br> продукцию</p>\r\n					</div>\r\n				</div>\r\n				<div class=\"btn__wrap\">\r\n					<a href=\"#\" class=\"btn work__btn\">Оставить заявку</a>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</section>', 0, 1524939142, 1524939142, 0),
(23, 'guarant', '', 2, 'none', 7, 0, '<section class=\"guarant\" id=\"guarant\">\r\n	<div class=\"container wrap guarant__box\">\r\n		<div class=\"row\">\r\n			<div class=\"col-12\">\r\n				<h2 class=\"cap__snake guarant__caption\">3 года гарантии</h2>\r\n			</div>\r\n			<div class=\"col-md-6 col-sm-12\">\r\n				<img src=\"assets/images/bricks_guarantee.jpg\" alt=\"/\" class=\"guarant__image\">\r\n			</div>\r\n			<div class=\"col-md-6 col-sm-12\">\r\n				<p class=\"guarant__text\">\r\n					Мы даем 3 годовую гарантию на облицовочный кирпич. В случае выявления производственных дефектов, сколов и т.п., мы заменим поврежденные части плитки за свой счет.\r\n				</p>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</section>', 0, 1524903128, 1524903128, 0),
(43, 'modals', 'Модальные окна проекта', 2, 'none', 7, 0, '<div class=\"modals\">\r\n	<div class=\"callback modal\" id=\"callback\">\r\n		<div class=\"modal__caption\">\r\n			<h3 class=\"modal__title\">Обратный звонок</h3>\r\n			<div class=\"close\" data-izimodal-close=\"\"></div>\r\n		</div>\r\n		<div class=\"modal__body\">\r\n			[!FormLister?\r\n				&formid=`form_callme`\r\n				&rules=`{\"name\":{\"required\":\"Введите имя\"},\"phone\":{\"required\":\"Введите номер телефона\"}}`\r\n				&formTpl=`form_modal_cb`\r\n				&subject=`Запрос обратного звонка с сайта`\r\n				&successTpl=`form_modal_cb_success`\r\n				&parseDocumentSource=`1`\r\n			!]\r\n		</div>\r\n	</div>\r\n	\r\n	<div class=\"region modal\" id=\"region\">\r\n		<div class=\"modal__caption\">\r\n			<h3 class=\"modal__title\">Ваш регион</h3>\r\n			<div class=\"close\" data-izimodal-close=\"\"></div>\r\n		</div>\r\n		<div class=\"modal__body\">\r\n			<div class=\"region__screen__start\">\r\n				<h4 class=\"region__mb\">Ижевск</h4>\r\n				<div class=\"btn__double\">\r\n					<a href=\"#\" class=\"btn region__btn\" id=\"regionYes\">Да, всё верно</a>\r\n					<a href=\"#\" class=\"btn region__btn region__btn__grey\" id=\"regionAny\">Выбрать другой</a>\r\n				</div>\r\n			</div>\r\n			<div class=\"region__screen__select\">\r\n				<form action=\"\" method=\"POST\" class=\"default__form\">\r\n					<div class=\"region__form__group\">\r\n						<input type=\"text\" class=\"form__input region__input border__input\" placeholder=\"Введите название города\">\r\n						<input type=\"text\" class=\"btn region__btn\" value=\"Выбрать\">\r\n					</div>\r\n				</form>\r\n			</div>\r\n		</div>\r\n	</div>\r\n	\r\n	<div class=\"modal buy\" id=\"buy\">\r\n        <div class=\"modal__caption\">\r\n            <h3 class=\"modal__title\"></h3>\r\n            <div class=\"close\" data-izimodal-close=\"\"></div>\r\n        </div>\r\n        <div class=\"modal__body\">\r\n            <p class=\"product__info\"></p>\r\n             [!FormLister?\r\n				&formid=`form_product`\r\n				&formTpl=`form_product`\r\n				&subject=`Запрос обратного звонка с сайта`\r\n				&successTpl=`form_product_success`\r\n				&parseDocumentSource=`1`\r\n			!]\r\n        </div>\r\n    </div>\r\n\r\n    <div class=\"modal success\" id=\"success\">\r\n        <div class=\"modal__caption\">\r\n            <h3 class=\"modal__title\">Ваша заявка принята</h3>\r\n            <div class=\"close\" data-izimodal-close=\"\"></div>\r\n        </div>\r\n        <div class=\"modal__body\">\r\n            <p class=\"modal__success__info\">Ваша заявка принята, наш менеджер перезвонит вам в течении десяти минут.</p>\r\n            <a href=\"#\" class=\"btn modal__succes__btn\" data-izimodal-close=\"\">Закрыть окно</a>\r\n        </div>\r\n    </div>\r\n	\r\n	<div class=\"modal error\" id=\"error\">\r\n        <div class=\"modal__caption\">\r\n            <h3 class=\"modal__title\">Ваша сообщение не отправлено</h3>\r\n            <div class=\"close\" data-izimodal-close=\"\"></div>\r\n        </div>\r\n        <div class=\"modal__body\">При отправке произошла ошибка, попробуйте снова.</p>\r\n            <a href=\"#\" class=\"btn modal__succes__btn\" data-izimodal-close=\"\">Закрыть окно</a>\r\n        </div>\r\n    </div>\r\n\r\n    <div class=\"modal production\" id=\"production\">\r\n        <div class=\"modal__caption\">\r\n            <h3 class=\"modal__title\">Заявка на продукцию</h3>\r\n            <div class=\"close\" data-izimodal-close=\"\"></div>\r\n        </div>\r\n        <div class=\"modal__body\">\r\n            [!FormLister?\r\n				&formid=`production`\r\n				&formTpl=`production`\r\n				&subject=`Запрос обратного звонка с сайта`\r\n				&successTpl=`production_success`\r\n				&parseDocumentSource=`1`\r\n			!]   \r\n        </div>\r\n    </div>\r\n	\r\n</div>', 0, 1525263945, 1525307027, 0),
(25, 'sert_slider_elem', '', 2, 'none', 9, 0, '\r\n<div class=\"sertific__item\">\r\n	<img src=\"[+sertSliderImg+]\" class=\"sertific__image\">\r\n</div>', 0, 1524928682, 1524928682, 0),
(28, 'offers', '', 2, 'none', 7, 0, '<section class=\"offers\" id=\"offers\">\r\n	<div class=\"container wrap\">\r\n		<div class=\"row\">\r\n			<div class=\"col-12\">\r\n				<h2 class=\"cap__snake offers__caption\">Отзывы <br> наших клиентов</h2>\r\n			</div>\r\n		</div>\r\n		<div class=\"slider\">\r\n			<div class=\"slider__content slider__content__offers\">\r\n				<div class=\"row justify-content-center offer__slider\">\r\n					[[DocLister? \r\n						&parents=`72` \r\n						&tpl=`offer_slider_elem`\r\n						&tvPrefix=``\r\n						&tvList=`offerSliderImg`\r\n					]]\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</section>', 0, 1524939169, 1524940661, 0),
(33, 'form_modal_cb_success', 'Успешная отправка заявки на обратный звонок', 2, 'none', 11, 0, 'Письмо с сайта\r\nИмя: [+name.value+]\r\nТелефон: [+phone.value+]', 0, 1524955470, 1525266604, 0),
(34, 'product_plit', '', 2, 'none', 12, 0, '<div class=\"col-lg-4 col-xl-3 col-md-6 col-sm-6 col\">\r\n	<div class=\"plit__elem\">\r\n		<img src=\"[+plitImg+]\" class=\"plit__elem__img\">\r\n		<h5 class=\"plit__elem__caption\">[+pagetitle+]</h5>\r\n		<p class=\"plit__elem__stat\">\r\n			Цвет: [+plitColor+] <br>\r\n			Размер: [+plitSize+] <br>\r\n			Вес: [+plitWeight+] <br>\r\n			В поддоне: [+plitCount+] <br>\r\n			Вес поддона: [+plitHeft+] <br>\r\n		</p>\r\n		<h4>[+plitPrice+] <span class=\"price__low\">руб./м2</span></h4>\r\n		<a href=\"\" class=\"plit__elem__btn btn\">ЗАКАЗАТЬ</a>\r\n	</div>\r\n</div>', 0, 1524957451, 1525176428, 0),
(51, 'production', 'Форма - Заявка на продукцию', 2, 'none', 11, 0, '<form action=\"[~[*id*]~]#production\" method=\"POST\" class=\"callback__form form__default\">\r\n	<input type=\"hidden\" name=\"formid\" value=\"production\">\r\n\r\n	<select name=\"production\" id=\"\" class=\"form__select form__input border__input\" value=\"[+production.value+]\">\r\n		<option>Выберите нужную продукцию</option>\r\n		<option>1</option>\r\n		<option>2</option>\r\n		<option>3</option>\r\n	</select>\r\n	<input type=\"text\" class=\"form__input border__input\" placeholder=\"Ваше имя\" name=\"name\" value=\"[+name.value+]\" required>\r\n	<input type=\"text\" class=\"form__input border__input\" placeholder=\"Ваш номер телефона\" name=\"phone\" value=\"[+phone.value+]\" required>\r\n	<div class=\"form__btn__polit\">\r\n		<input class=\"btn callback__form__btn\" type=\"submit\" name=\"submit\" value=\"Оставить заявку\">\r\n		<p class=\"form__politics callback__polit\">Нажимая на кнопку, вы даете свое согласие на обработку персональных данных. <a href=\"#\">Узнать больше</a></p>\r\n	</div>\r\n</form>', 0, 1525306465, 1525307009, 0),
(50, 'form_product_success', 'Успешная отправка формы - Заказ товара', 2, 'none', 11, 0, 'Письмо с сайта\r\nИмя: [+name.value+]\r\nТелефон: [+phone.value+]\r\nEmail: [+email.value+]\r\nСообщение: [+text.value+]\r\nАдрес доставки: [+address.value+]\r\n\r\nОбщая сумма: [+result.value+]', 0, 0, 1525306400, 0),
(52, 'production_success', 'Успешная отправка формы - Продукция', 2, 'none', 11, 0, 'Письмо с сайта\r\nИмя: [+name.value+]\r\nТелефон: [+phone.value+]\r\nПродукция: [+production.value+]', 0, 1525307060, 1525307094, 0),
(49, 'form_product', 'Форма для модального окна при заказе продукта', 2, 'none', 11, 0, '<form action=\"[~[*id*]~]#form_product\"  method=\"POST\" class=\"callback__form form__default\">\r\n	<input type=\"hidden\" name=\"formid\" value=\"form_product\">\r\n	\r\n	<div class=\"product__sum\">\r\n		<div class=\"result__count\">\r\n			<p class=\"caption__counter\">Количество поддонов:</p>\r\n			<div class=\"counter sumcounter\">\r\n				<span class=\"delCount\"></span>\r\n				<input type=\"text\" name=\"count\" min=\"1\" value=\"1\" disabled=\"\">\r\n				<span class=\"addCount\"></span>\r\n			</div>\r\n		</div>\r\n		<div class=\"result__sum\">\r\n			<p class=\"caption__counter\">Итоговая стоимость:</p>\r\n			<h3 class=\"result__sum__value\">0,00</h3>\r\n			<input type=\"hidden\" name=\"result\" class=\"result__input\" value=\"[+result.value+]\">\r\n		</div>\r\n	</div>\r\n	<input type=\"text\" class=\"form__input border__input\" value=\"[+name.value+]\" name=\"name\" placeholder=\"Ваше имя\" required>\r\n	<input type=\"text\" class=\"form__input border__input\" value=\"[+phone.value+]\" name=\"phone\" placeholder=\"Ваш номер телефона\" required>\r\n	<input type=\"text\" class=\"form__input border__input\" value=\"[+email.value+]\" name=\"email\" placeholder=\"Ваш email\" required>\r\n	<input type=\"text\" class=\"form__input border__input\" value=\"[+address.value+]\" name=\"address\" placeholder=\"Адрес доставки\" required>\r\n	<textarea class=\"form__input ask__form__input\" placeholder=\"Комментарий к заявке\" value=\"[+text.value+]\"></textarea>\r\n	<div class=\"form__btn__polit\">\r\n		<input class=\"btn buy__btn\" type=\"submit\" name=\"submit\" value=\"Заказать\">\r\n		<p class=\"form__politics callback__polit\">Нажимая на кнопку, вы даете свое согласие на обработку персональных данных. <a href=\"#\">Узнать больше</a></p>\r\n	</div>\r\n</form>', 0, 1525305901, 1525306423, 0),
(29, 'ask', 'Задать вопрос', 2, 'none', 7, 0, '<section class=\"ask\" id=\"ask\">\r\n	<div class=\"container wrap ask__wrap\">\r\n		<div class=\"row wrap__row ask__box\">\r\n			<div class=\"ask__name\">\r\n				<img src=\"assets/images/manager.png\" alt=\"/\" class=\"manager__img\">\r\n				<h4 class=\"ask__name__caption yellow\">ФЁДОРОВ МИХАИЛ</h4>\r\n				<p class=\"ask__name__stat\">менеджер по работе с клиентами</p>\r\n			</div>\r\n			<div class=\"ask__form__content\">\r\n				<h3 class=\"yellow ask__form__caption\">Остались вопросы?</h3>\r\n				<p class=\"ask__form__desc\">Оставьте заявку и я с удовольствием ответчу на все ваши <br> вопросы</p>\r\n				[!FormLister?\r\n					&formid=`ask_form`\r\n					&formTpl=`ask_form`\r\n					&subject=`Запрос обратного звонка с сайта`\r\n					&successTpl=`ask_success`\r\n					&parseDocumentSource=`1`\r\n				!]\r\n			</div>\r\n		</div>\r\n	</div>\r\n</section>', 0, 1524939205, 1525279013, 0),
(48, 'ask_success', 'Успешная отправка формы - Задать вопрос', 2, 'none', 11, 0, 'Письмо с сайта\r\nИмя: [+name.value+]\r\nТелефон: [+phone.value+]\r\nСообщение: [+text.value+]', 0, 1525277592, 1525277657, 0),
(30, 'footer', '', 2, 'none', 7, 0, '<footer class=\"footer\" id=\"footer\">\r\n	<div class=\"container\">\r\n		<div class=\"row justify-content-center\">\r\n			<div class=\"col-xl-4 col-md-12\">\r\n				<div class=\"footer__city\">\r\n					<h5>[*address*]</h5>\r\n				</div>\r\n			</div>\r\n			<div class=\"col-xl-5 col-md-12\">\r\n				<div class=\"footer__callback\">\r\n					<div class=\"footer__phone\">\r\n						<p class=\"footer__phone__text\">звонок по России бесплатный</p>\r\n						<h5>[*phone*]</h5>\r\n					</div>\r\n					<div class=\"footer__btn__box\">\r\n						<a href=\"#\" class=\"btn footer__btn callback__btn\">ПЕРЕЗВОНИТЕ МНЕ</a>\r\n					</div>\r\n				</div>\r\n			</div>\r\n			<div class=\"col-xl-3 col-md-12\">\r\n				<div class=\"footer__dev\">\r\n					<a href=\"#\" class=\"footer__dev__link\">\r\n						<img src=\"assets/images/dev.png\" alt=\"Электрон\">\r\n					</a>\r\n				</div>\r\n			</div>\r\n		</div>\r\n		<a href=\"#\" class=\"up\">\r\n			<img src=\"assets/images/up.png\" alt=\"\">\r\n		</a>\r\n	</div>\r\n</footer>', 0, 1524939675, 1525304871, 0),
(32, 'form_modal_cb', 'Форма обратного звонка', 2, 'none', 11, 0, '<form action=\"[~[*id*]~]#form_callme\" method=\"POST\" class=\"callback__form form__default\" >\r\n	<input type=\"hidden\" name=\"formid\" value=\"form_callme\">\r\n	\r\n	<input type=\"text\" class=\"form__input border__input\" placeholder=\"Ваше имя\" name=\"name\" value=\"[+name.value+]\" required>\r\n	<input type=\"text\" class=\"form__input border__input\" placeholder=\"Ваш номер телефона\" name=\"phone\" value=\"[+phone.value+]\" required>\r\n\r\n	<div class=\"form__btn__polit\">\r\n		<input class=\"btn callback__form__btn\" type=\"submit\" name=\"submit\" value=\"Рассчитать стоимость\">\r\n		<p class=\"form__politics callback__polit\">Нажимая на кнопку, вы даете свое согласие на обработку персональных данных. <a href=\"#\">Узнать больше</a></p>\r\n	</div>\r\n</form>  ', 0, 1524955065, 1525278085, 0),
(31, 'offer_slider_elem', 'Слайд в отзывах', 2, 'none', 9, 0, '<div class=\"col-xl-4 col-lg-4 col-sm-10 col-md-6 offer__elem\">\r\n	<div class=\"offer\">\r\n		<img src=\"[+offerSliderImg+]\" class=\"offer__image\">\r\n		<h5 class=\"offer__name\">[+pagetitle+]</h5>\r\n		<p class=\"offer__desc\">\r\n			[+content:strip_tags+]\r\n		</p>\r\n		<a href=\"#\" class=\"btn offer__btn\">Показать весь текст</a>\r\n	</div>\r\n</div>', 0, 1524940492, 1524940814, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `evo_site_modules`
--

CREATE TABLE `evo_site_modules` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `wrap` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to module icon',
  `enable_resource` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'enables the resource file feature',
  `resourcefile` varchar(255) NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `guid` varchar(32) NOT NULL DEFAULT '' COMMENT 'globally unique identifier',
  `enable_sharedparams` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text,
  `modulecode` mediumtext COMMENT 'module boot up code'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Modules';

--
-- Дамп данных таблицы `evo_site_modules`
--

INSERT INTO `evo_site_modules` (`id`, `name`, `description`, `editor_type`, `disabled`, `category`, `wrap`, `locked`, `icon`, `enable_resource`, `resourcefile`, `createdon`, `editedon`, `guid`, `enable_sharedparams`, `properties`, `modulecode`) VALUES
(1, 'Doc Manager', '<strong>1.1</strong> Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions', 0, 0, 4, 0, 0, '', 0, '', 0, 0, 'docman435243542tf542t5t', 1, '', ' \n/**\n * Doc Manager\n * \n * Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions\n * \n * @category	module\n * @version 	1.1\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @internal	@properties\n * @internal	@guid docman435243542tf542t5t	\n * @internal	@shareparams 1\n * @internal	@dependencies requires files located at /assets/modules/docmanager/\n * @internal	@modx_category Manager and Admin\n * @internal    @installset base, sample\n * @lastupdate  09/04/2016\n */\n\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/docmanager.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_frontend.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_backend.class.php\');\n\n$dm = new DocManager($modx);\n$dmf = new DocManagerFrontend($dm, $modx);\n$dmb = new DocManagerBackend($dm, $modx);\n\n$dm->ph = $dm->getLang();\n$dm->ph[\'theme\'] = $dm->getTheme();\n$dm->ph[\'ajax.endpoint\'] = MODX_SITE_URL.\'assets/modules/docmanager/tv.ajax.php\';\n$dm->ph[\'datepicker.offset\'] = $modx->config[\'datepicker_offset\'];\n$dm->ph[\'datetime.format\'] = $modx->config[\'datetime_format\'];\n\nif (isset($_POST[\'tabAction\'])) {\n    $dmb->handlePostback();\n} else {\n    $dmf->getViews();\n    echo $dm->parseTemplate(\'main.tpl\', $dm->ph);\n}'),
(2, 'Extras', '<strong>0.1.3</strong> first repository for Evolution CMS', 0, 0, 4, 0, 0, '', 0, '', 0, 0, 'store435243542tf542t5t', 1, '', ' \r\n/**\r\n * Extras\r\n * \r\n * first repository for Evolution CMS\r\n * \r\n * @category	module\r\n * @version 	0.1.3\r\n * @internal	@properties\r\n * @internal	@guid store435243542tf542t5t	\r\n * @internal	@shareparams 1\r\n * @internal	@dependencies requires files located at /assets/modules/store/\r\n * @internal	@modx_category Manager and Admin\r\n * @internal    @installset base, sample\r\n * @lastupdate  25/11/2016\r\n */\r\n\r\n//AUTHORS: Bumkaka & Dmi3yy \r\ninclude_once(\'../assets/modules/store/core.php\');');

-- --------------------------------------------------------

--
-- Структура таблицы `evo_site_module_access`
--

CREATE TABLE `evo_site_module_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `module` int(11) NOT NULL DEFAULT '0',
  `usergroup` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module users group access permission';

-- --------------------------------------------------------

--
-- Структура таблицы `evo_site_module_depobj`
--

CREATE TABLE `evo_site_module_depobj` (
  `id` int(11) NOT NULL,
  `module` int(11) NOT NULL DEFAULT '0',
  `resource` int(11) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module Dependencies';

-- --------------------------------------------------------

--
-- Структура таблицы `evo_site_plugins`
--

CREATE TABLE `evo_site_plugins` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Plugin',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `plugincode` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains the site plugins.';

--
-- Дамп данных таблицы `evo_site_plugins`
--

INSERT INTO `evo_site_plugins` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `plugincode`, `locked`, `properties`, `disabled`, `moduleguid`, `createdon`, `editedon`) VALUES
(1, 'CodeMirror', '<strong>1.4</strong> JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.12', 0, 4, 0, '\r\n/**\r\n * CodeMirror\r\n *\r\n * JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.12\r\n *\r\n * @category    plugin\r\n * @version     1.4\r\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\r\n * @package     modx\r\n * @internal    @events OnDocFormRender,OnChunkFormRender,OnModFormRender,OnPluginFormRender,OnSnipFormRender,OnTempFormRender,OnRichTextEditorInit\r\n * @internal    @modx_category Manager and Admin\r\n * @internal    @properties &theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;default &darktheme=Dark Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;one-dark &fontSize=Font-size;list;10,11,12,13,14,15,16,17,18;14 &lineHeight=Line-height;list;1,1.1,1.2,1.3,1.4,1.5;1.3 &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;false &indentWithTabs=indentWithTabs;list;true,false;true &undoDepth=undoDepth;int;200 &historyEventDelay=historyEventDelay;int;1250\r\n * @internal    @installset base\r\n * @reportissues https://github.com/evolution-cms/evolution\r\n * @documentation Official docs https://codemirror.net/doc/manual.html\r\n * @author      hansek from http://www.modxcms.cz\r\n * @author      update Mihanik71\r\n * @author      update Deesen\r\n * @author      update 64j\r\n * @lastupdate  3/07/2017\r\n */\r\n\r\n$_CM_BASE = \'assets/plugins/codemirror/\';\r\n\r\n$_CM_URL = $modx->config[\'site_url\'] . $_CM_BASE;\r\n\r\nrequire(MODX_BASE_PATH. $_CM_BASE .\'codemirror.plugin.php\');\r\n', 0, '{\"theme\":[{\"label\":\"Theme\",\"type\":\"list\",\"value\":\"default\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"default\",\"desc\":\"\"}],\"darktheme\":[{\"label\":\"Dark Theme\",\"type\":\"list\",\"value\":\"one-dark\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"one-dark\",\"desc\":\"\"}],\"fontSize\":[{\"label\":\"Font-size\",\"type\":\"list\",\"value\":\"14\",\"options\":\"10,11,12,13,14,15,16,17,18\",\"default\":\"14\",\"desc\":\"\"}],\"lineHeight\":[{\"label\":\"Line-height\",\"type\":\"list\",\"value\":\"1.3\",\"options\":\"1,1.1,1.2,1.3,1.4,1.5\",\"default\":\"1.3\",\"desc\":\"\"}],\"indentUnit\":[{\"label\":\"Indent unit\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"tabSize\":[{\"label\":\"The width of a tab character\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"lineWrapping\":[{\"label\":\"lineWrapping\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"matchBrackets\":[{\"label\":\"matchBrackets\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"activeLine\":[{\"label\":\"activeLine\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"emmet\":[{\"label\":\"emmet\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"search\":[{\"label\":\"search\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"indentWithTabs\":[{\"label\":\"indentWithTabs\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"undoDepth\":[{\"label\":\"undoDepth\",\"type\":\"int\",\"value\":\"200\",\"default\":\"200\",\"desc\":\"\"}],\"historyEventDelay\":[{\"label\":\"historyEventDelay\",\"type\":\"int\",\"value\":\"1250\",\"default\":\"1250\",\"desc\":\"\"}]}', 1, '', 0, 0),
(2, 'ElementsInTree', '<strong>1.5.9</strong> Get access to all Elements and Modules inside Manager sidebar', 0, 4, 0, 'require MODX_BASE_PATH.\'assets/plugins/elementsintree/plugin.elementsintree.php\';\n', 0, '{\"adminRoleOnly\":[{\"label\":\"Administrators only\",\"type\":\"list\",\"value\":\"yes\",\"options\":\"yes,no\",\"default\":\"yes\",\"desc\":\"\"}],\"treeButtonsInTab\":[{\"label\":\"Tree buttons in tab\",\"type\":\"list\",\"value\":\"yes\",\"options\":\"yes,no\",\"default\":\"yes\",\"desc\":\"\"}]}', 1, '', 0, 0),
(3, 'FileSource', '<strong>0.1</strong> Save snippet and plugins to file', 0, 4, 0, 'require MODX_BASE_PATH.\'assets/plugins/filesource/plugin.filesource.php\';', 0, '', 0, '', 0, 0),
(4, 'Forgot Manager Login', '<strong>1.1.6</strong> Resets your manager login when you forget your password via email confirmation', 0, 4, 0, 'require MODX_BASE_PATH.\'assets/plugins/forgotmanagerlogin/plugin.forgotmanagerlogin.php\';', 0, '', 1, '', 0, 0),
(5, 'ManagerManager', '<strong>0.6.3</strong> Customize the EVO Manager to offer bespoke admin functions for end users or manipulate the display of document fields in the manager.', 0, 4, 0, '\n/**\n * ManagerManager\n *\n * Customize the EVO Manager to offer bespoke admin functions for end users or manipulate the display of document fields in the manager.\n *\n * @category plugin\n * @version 0.6.3\n * @license http://creativecommons.org/licenses/GPL/2.0/ GNU Public License (GPL v2)\n * @internal @properties &remove_deprecated_tv_types_pref=Remove deprecated TV types;list;yes,no;yes &config_chunk=Configuration Chunk;text;mm_rules\n * @internal @events OnDocFormRender,OnDocFormPrerender,OnBeforeDocFormSave,OnDocFormSave,OnDocDuplicate,OnPluginFormRender,OnTVFormRender\n * @internal @modx_category Manager and Admin\n * @internal @installset base\n * @internal @legacy_names Image TV Preview, Show Image TVs\n * @reportissues https://github.com/DivanDesign/MODXEvo.plugin.ManagerManager/\n * @documentation README [+site_url+]assets/plugins/managermanager/readme.html\n * @documentation Official docs http://code.divandesign.biz/modx/managermanager\n * @link        Latest version http://code.divandesign.biz/modx/managermanager\n * @link        Additional tools http://code.divandesign.biz/modx\n * @link        Full changelog http://code.divandesign.biz/modx/managermanager/changelog\n * @author      Inspired by: HideEditor plugin by Timon Reinhard and Gildas; HideManagerFields by Brett @ The Man Can!\n * @author      DivanDesign studio http://www.DivanDesign.biz\n * @author      Nick Crossland http://www.rckt.co.uk\n * @author      Many others\n * @lastupdate  22/01/2018\n */\n\n// Run the main code\ninclude($modx->config[\'base_path\'].\'assets/plugins/managermanager/mm.inc.php\');\n', 0, '{\"remove_deprecated_tv_types_pref\":[{\"label\":\"Remove deprecated TV types\",\"type\":\"list\",\"value\":\"yes\",\"options\":\"yes,no\",\"default\":\"yes\",\"desc\":\"\"}],\"config_chunk\":[{\"label\":\"Configuration Chunk\",\"type\":\"text\",\"value\":\"mm_rules\",\"default\":\"mm_rules\",\"desc\":\"\"}]}', 0, '', 0, 0),
(6, 'OutdatedExtrasCheck', '<strong>1.4.0</strong> Check for Outdated critical extras not compatible with EVO 1.4.0', 0, 4, 0, '/**\r\n * OutdatedExtrasCheck\r\n *\r\n * Check for Outdated critical extras not compatible with EVO 1.4.0\r\n *\r\n * @category	plugin\r\n * @version     1.4.0 \r\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\r\n * @package     evo\r\n * @author      Author: Nicola Lambathakis\r\n * @internal    @events OnManagerWelcomeHome\r\n * @internal    @properties &wdgVisibility=Show widget for:;menu;All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly;All &ThisRole=Run only for this role:;string;;;(role id) &ThisUser=Run only for this user:;string;;;(username) &DittoVersion=Min Ditto version:;string;2.1.3 &EformVersion=Min eForm version:;string;1.4.9 &AjaxSearchVersion=Min AjaxSearch version:;string;1.11.0 &WayfinderVersion=Min Wayfinder version:;string;2.0.5 &WebLoginVersion=Min WebLogin version:;string;1.2 &WebSignupVersion=Min WebSignup version:;string;1.1.2 &WebChangePwdVersion=Min WebChangePwd version:;string;1.1.2 &BreadcrumbsVersion=Min Breadcrumbs version:;string;1.0.5 &ReflectVersion=Min Reflect version:;string;2.2 &JotVersion=Min Jot version:;string;1.1.5 &MtvVersion=Min multiTV version:;string;2.0.13 &badthemes=Outdated Manager Themes:;string;MODxRE2_DropdownMenu,MODxRE2,MODxRE,MODxCarbon,D3X,MODxFLAT,wMOD,ScienceStyle\r\n * @internal    @modx_category Manager and Admin\r\n * @internal    @installset base\r\n * @internal    @disabled 0\r\n */\r\n\r\n// get manager role check\r\n$internalKey = $modx->getLoginUserID();\r\n$sid = $modx->sid;\r\n$role = $_SESSION[\'mgrRole\'];\r\n$user = $_SESSION[\'mgrShortname\'];\r\n// show widget only to Admin role 1\r\nif(($role!=1) AND ($wdgVisibility == \'AdminOnly\')) {}\r\n// show widget to all manager users excluded Admin role 1\r\nelse if(($role==1) AND ($wdgVisibility == \'AdminExcluded\')) {}\r\n// show widget only to \"this\" role id\r\nelse if(($role!=$ThisRole) AND ($wdgVisibility == \'ThisRoleOnly\')) {}\r\n// show widget only to \"this\" username\r\nelse if(($user!=$ThisUser) AND ($wdgVisibility == \'ThisUserOnly\')) {}\r\nelse {\r\n// get plugin id and setting button\r\n$result = $modx->db->select(\'id\', $this->getFullTableName(\"site_plugins\"), \"name=\'{$modx->event->activePlugin}\' AND disabled=0\");\r\n$pluginid = $modx->db->getValue($result);\r\nif($modx->hasPermission(\'edit_plugin\')) {\r\n$button_pl_config = \'<a data-toggle=\"tooltip\" href=\"javascript:;\" title=\"\' . $_lang[\"settings_config\"] . \'\" class=\"text-muted pull-right\" onclick=\"parent.modx.popup({url:\\\'\'. MODX_MANAGER_URL.\'?a=102&id=\'.$pluginid.\'&tab=1\\\',title1:\\\'\' . $_lang[\"settings_config\"] . \'\\\',icon:\\\'fa-cog\\\',iframe:\\\'iframe\\\',selector2:\\\'#tabConfig\\\',position:\\\'center center\\\',width:\\\'80%\\\',height:\\\'80%\\\',hide:0,hover:0,overlay:1,overlayclose:1})\" ><i class=\"fa fa-cog fa-spin-hover\" style=\"color:#FFFFFF;\"></i> </a>\';\r\n}\r\n$modx->setPlaceholder(\'button_pl_config\', $button_pl_config);\r\n//plugin lang\r\n$_oec_lang = array();\r\n$plugin_path = $modx->config[\'base_path\'] . \"assets/plugins/extrascheck/\";\r\ninclude($plugin_path . \'lang/english.php\');\r\nif (file_exists($plugin_path . \'lang/\' . $modx->config[\'manager_language\'] . \'.php\')) {\r\ninclude($plugin_path . \'lang/\' . $modx->config[\'manager_language\'] . \'.php\');\r\n}\r\n//run the plugin\r\n// get globals\r\nglobal $modx,$_lang;\r\n//function to extract snippet version from description <strong></strong> tags \r\nif (!function_exists(\'getver\')) {\r\nfunction getver($string, $tag)\r\n{\r\n$content =\"/<$tag>(.*?)<\\/$tag>/\";\r\npreg_match($content, $string, $text);\r\nreturn $text[1];\r\n	}\r\n}\r\n$e = &$modx->Event;\r\n$EVOversion = $modx->config[\'settings_version\'];\r\n$output = \'\';\r\n//get extras module id for the link\r\n$modtable = $modx->getFullTableName(\'site_modules\');\r\n$getExtra = $modx->db->select( \"id, name\", $modtable, \"name=\'Extras\'\" );\r\nwhile( $row = $modx->db->getRow( $getExtra ) ) {\r\n$ExtrasID = $row[\'id\'];\r\n}\r\n//check outdated files\r\n//ajax index\r\n$indexajax = \"../index-ajax.php\";\r\nif (file_exists($indexajax)){\r\n    $output .= \'<div class=\"widget-wrapper alert alert-danger\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>index-ajax.php</b> \'.$_oec_lang[\'not_used\'].\' <b>Evolution \'.$EVOversion.\'</b>.  \'.$_oec_lang[\'if_dont_use\'].\', \'.$_oec_lang[\'please_delete\'].\'.</div>\';\r\n}\r\n//check outdated default manager themes\r\n$oldthemes = explode(\",\",\"$badthemes\");\r\nforeach ($oldthemes as $oldtheme){\r\n	if (file_exists(\'media/style/\'.$oldtheme)){\r\n    $output .= \'<div class=\"widget-wrapper alert alert-danger\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\'.$oldtheme.\'</b> \'.$_lang[\"manager_theme\"].\',  \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>.   \'.$_oec_lang[\'please_delete\'].\' \'.$_oec_lang[\'from_folder\'].\' \' . MODX_MANAGER_PATH . \'media/style/.</div>\';\r\n}\r\n}	\r\n//get site snippets table\r\n$table = $modx->getFullTableName(\'site_snippets\');\r\n//check ditto\r\n//get min version from config\r\n$minDittoVersion = $DittoVersion;\r\n//search the snippet by name\r\n$CheckDitto = $modx->db->select( \"id, name, description\", $table, \"name=\'Ditto\'\" );\r\nif($CheckDitto != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckDitto ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_ditto_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_ditto_version,$minDittoVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_ditto_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minDittoVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a> \'.$_oec_lang[\'or_move_to\'].\' <b>DocLister</b></div>\';\r\n		}\r\n	}\r\n} \r\n//end check ditto\r\n\r\n//check eform\r\n//get min version from config\r\n$minEformVersion = $EformVersion;\r\n//search the snippet by name\r\n$CheckEform = $modx->db->select( \"id, name, description\", $table, \"name=\'eForm\'\" );\r\nif($CheckEform != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckEform ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_Eform_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_Eform_version,$minEformVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_Eform_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minEformVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a> \'.$_oec_lang[\'or_move_to\'].\' <b>FormLister</b></div>\';\r\n		}\r\n	}\r\n} \r\n//end check eform\r\n	\r\n//check AjaxSearch\r\n//get min version from config\r\n$minAjaxSearchVersion = $AjaxSearchVersion;\r\n//search the snippet by name\r\n$CheckAjaxSearch = $modx->db->select( \"id, name, description\", $table, \"name=\'AjaxSearch\'\" );\r\nif($CheckAjaxSearch != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckAjaxSearch ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_AjaxSearch_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_AjaxSearch_version,$minAjaxSearchVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_AjaxSearch_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minAjaxSearchVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a>.</div>\';\r\n		}\r\n	}\r\n} \r\n//end check AjaxSearch	\r\n	\r\n//check Wayfinder\r\n//get min version from config\r\n$minWayfinderVersion = $WayfinderVersion;\r\n//search the snippet by name\r\n$CheckWayfinder = $modx->db->select( \"id, name, description\", $table, \"name=\'Wayfinder\'\" );\r\nif($CheckWayfinder != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckWayfinder ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_Wayfinder_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_Wayfinder_version,$minWayfinderVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_Wayfinder_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minWayfinderVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a>.</div>\';\r\n		}\r\n	}\r\n} \r\n//end check Wayfinder\r\n	\r\n//check WebLogin\r\n//get min version from config\r\n$minWebLoginVersion = $WebLoginVersion;\r\n//search the snippet by name\r\n$CheckWebLogin = $modx->db->select( \"id, name, description\", $table, \"name=\'WebLogin\'\" );\r\nif($CheckWebLogin != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckWebLogin ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_WebLogin_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_WebLogin_version,$minWebLoginVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_WebLogin_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minWebLoginVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a> \'.$_oec_lang[\'or_move_to\'].\' <b>FormLister</b></div>\';\r\n		}\r\n	}\r\n} \r\n//end check WebLogin\r\n\r\n//check WebChangePwd\r\n//get min version from config\r\n$minWebChangePwdVersion = $WebChangePwdVersion;\r\n//search the snippet by name\r\n$CheckWebChangePwd = $modx->db->select( \"id, name, description\", $table, \"name=\'WebChangePwd\'\" );\r\nif($CheckWebLogin != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckWebChangePwd ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_WebChangePwd_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_WebChangePwd_version,$minWebChangePwdVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_WebChangePwd_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minWebChangePwdVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a> \'.$_oec_lang[\'or_move_to\'].\' <b>FormLister</b></div>\';\r\n		}\r\n	}\r\n} \r\n//end check WebChangePwd\r\n	\r\n//check WebSignup\r\n//get min version from config\r\n$minWebSignupVersion = $WebSignupVersion;\r\n//search the snippet by name\r\n$CheckWebSignup = $modx->db->select( \"id, name, description\", $table, \"name=\'WebSignup\'\" );\r\nif($CheckWebSignup != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckWebSignup ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_WebSignup_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_WebSignup_version,$minWebSignupVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_WebSignup_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minWebSignupVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a> \'.$_oec_lang[\'or_move_to\'].\' <b>FormLister</b></div>\';\r\n		}\r\n	}\r\n} \r\n//end check WebSignup\r\n\r\n//check Breadcrumbs\r\n//get min version from config\r\n$minBreadcrumbsVersion = $BreadcrumbsVersion;\r\n//search the snippet by name\r\n$CheckBreadcrumbs = $modx->db->select( \"id, name, description\", $table, \"name=\'Breadcrumbs\'\" );\r\nif($CheckBreadcrumbs != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckBreadcrumbs ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_Breadcrumbs_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_Breadcrumbs_version,$minBreadcrumbsVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_Breadcrumbs_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minBreadcrumbsVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a>.</div>\';\r\n		}\r\n	}\r\n} \r\n//end check Breadcrumbs\r\n\r\n//check Reflect\r\n//get min version from config\r\n$minReflectVersion = $ReflectVersion;\r\n//search the snippet by name\r\n$CheckReflect = $modx->db->select( \"id, name, description\", $table, \"name=\'Reflect\'\" );\r\nif($CheckReflect != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckReflect ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_Reflect_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_Reflect_version,$minReflectVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_Reflect_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minReflectVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a>.</div>\';\r\n		}\r\n	}\r\n} \r\n//end check Reflect\r\n\r\n//check Jot\r\n//get min version from config\r\n$minJotVersion = $JotVersion;\r\n//search the snippet by name\r\n$CheckJot = $modx->db->select( \"id, name, description\", $table, \"name=\'Jot\'\" );\r\nif($CheckJot != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckJot ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_Jot_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_Jot_version,$minJotVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_Jot_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minJotVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a>.</div>\';\r\n		}\r\n	}\r\n} \r\n//end check Jot\r\n	\r\n//check Multitv\r\n//get min version from config\r\n$minMtvVersion = $MtvVersion;\r\n//search the snippet by name\r\n$CheckMtv = $modx->db->select( \"id, name, description\", $table, \"name=\'multiTV\'\" );\r\nif($CheckMtv != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckMtv ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_mtv_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_mtv_version,$minMtvVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_mtv_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minMtvVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a></div>\';\r\n		}\r\n	}\r\n} \r\n//end check Multitv\r\n\r\nif($output != \'\'){\r\nif($e->name == \'OnManagerWelcomeHome\') {\r\n$out = $output;\r\n$wdgTitle = \'EVO \'.$EVOversion.\' - \'.$_oec_lang[\'title\'].\'\';\r\n$widgets[\'xtraCheck\'] = array(\r\n				\'menuindex\' =>\'0\',\r\n				\'id\' => \'xtraCheck\'.$pluginid.\'\',\r\n				\'cols\' => \'col-md-12\',\r\n                \'headAttr\' => \'style=\"background-color:#B60205; color:#FFFFFF;\"\',\r\n				\'bodyAttr\' => \'\',\r\n				\'icon\' => \'fa-warning\',\r\n				\'title\' => \'\'.$wdgTitle.\' \'.$button_pl_config.\'\',\r\n				\'body\' => \'<div class=\"card-body\">\'.$out.\'</div>\',\r\n				\'hide\' => \'0\'\r\n			);	\r\n            $e->output(serialize($widgets));\r\nreturn;\r\n		}\r\n	}\r\n}', 0, '{\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"All\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"All\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Run only for this role:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Run only for this user:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"DittoVersion\":[{\"label\":\"Min Ditto version:\",\"type\":\"string\",\"value\":\"2.1.3\",\"default\":\"2.1.3\",\"desc\":\"\"}],\"EformVersion\":[{\"label\":\"Min eForm version:\",\"type\":\"string\",\"value\":\"1.4.9\",\"default\":\"1.4.9\",\"desc\":\"\"}],\"AjaxSearchVersion\":[{\"label\":\"Min AjaxSearch version:\",\"type\":\"string\",\"value\":\"1.11.0\",\"default\":\"1.11.0\",\"desc\":\"\"}],\"WayfinderVersion\":[{\"label\":\"Min Wayfinder version:\",\"type\":\"string\",\"value\":\"2.0.5\",\"default\":\"2.0.5\",\"desc\":\"\"}],\"WebLoginVersion\":[{\"label\":\"Min WebLogin version:\",\"type\":\"string\",\"value\":\"1.2\",\"default\":\"1.2\",\"desc\":\"\"}],\"WebSignupVersion\":[{\"label\":\"Min WebSignup version:\",\"type\":\"string\",\"value\":\"1.1.2\",\"default\":\"1.1.2\",\"desc\":\"\"}],\"WebChangePwdVersion\":[{\"label\":\"Min WebChangePwd version:\",\"type\":\"string\",\"value\":\"1.1.2\",\"default\":\"1.1.2\",\"desc\":\"\"}],\"BreadcrumbsVersion\":[{\"label\":\"Min Breadcrumbs version:\",\"type\":\"string\",\"value\":\"1.0.5\",\"default\":\"1.0.5\",\"desc\":\"\"}],\"ReflectVersion\":[{\"label\":\"Min Reflect version:\",\"type\":\"string\",\"value\":\"2.2\",\"default\":\"2.2\",\"desc\":\"\"}],\"JotVersion\":[{\"label\":\"Min Jot version:\",\"type\":\"string\",\"value\":\"1.1.5\",\"default\":\"1.1.5\",\"desc\":\"\"}],\"MtvVersion\":[{\"label\":\"Min multiTV version:\",\"type\":\"string\",\"value\":\"2.0.12\",\"default\":\"2.0.12\",\"desc\":\"\"}],\"badthemes\":[{\"label\":\"Outdated Manager Themes:\",\"type\":\"string\",\"value\":\"MODxRE2_DropdownMenu,MODxRE2,MODxRE,MODxCarbon,D3X,MODxFLAT,wMOD,ScienceStyle\",\"default\":\"MODxRE2_DropdownMenu,MODxRE2,MODxRE,MODxCarbon,D3X,MODxFLAT,wMOD,ScienceStyle\",\"desc\":\"\"}]}', 0, '', 0, 0),
(7, 'Quick Manager+', '<strong>1.5.9</strong> Enables QuickManager+ front end content editing support', 0, 4, 0, '\r\n/**\r\n * Quick Manager+\r\n * \r\n * Enables QuickManager+ front end content editing support\r\n *\r\n * @category 	plugin\r\n * @version 	1.5.9\r\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL v3)\r\n * @internal    @properties &jqpath=Path to jQuery;text;assets/js/jquery.min.js &loadmanagerjq=Load jQuery in manager;list;true,false;false &loadfrontendjq=Load jQuery in front-end;list;true,false;false &noconflictjq=jQuery noConflict mode in front-end;list;true,false;false &loadfa=Load Font Awesome css in front-end;list;true,false;true &loadtb=Load modal box in front-end;list;true,false;true &tbwidth=Modal box window width;text;80% &tbheight=Modal box window height;text;90% &hidefields=Hide document fields from front-end editors;text;parent &hidetabs=Hide document tabs from front-end editors;text; &hidesections=Hide document sections from front-end editors;text; &addbutton=Show add document here button;list;true,false;true &tpltype=New document template type;list;parent,id,selected;parent &tplid=New document template id;int;3 &custombutton=Custom buttons;textarea; &managerbutton=Show go to manager button;list;true,false;true &logout=Logout to;list;manager,front-end;manager &disabled=Plugin disabled on documents;text; &autohide=Autohide toolbar;list;true,false;true &position= Toolbar position;list;top,right,bottom,left,before;top &editbuttons=Inline edit buttons;list;true,false;false &editbclass=Edit button CSS class;text;qm-edit &newbuttons=Inline new resource buttons;list;true,false;false &newbclass=New resource button CSS class;text;qm-new &tvbuttons=Inline template variable buttons;list;true,false;false &tvbclass=Template variable button CSS class;text;qm-tv &removeBg=Remove toolbar background;list;yes,no;no &buttonStyle=QuickManager buttons CSS stylesheet;list;actionButtons,navButtons;navButtons  \r\n * @internal	@events OnParseDocument,OnWebPagePrerender,OnDocFormPrerender,OnDocFormSave,OnManagerLogout \r\n * @internal	@modx_category Manager and Admin\r\n * @internal    @legacy_names QM+,QuickEdit\r\n * @internal    @installset base, sample\r\n * @internal    @disabled 1\r\n * @reportissues https://github.com/modxcms/evolution\r\n * @documentation Official docs [+site_url+]assets/plugins/qm/readme.html\r\n * @link        http://www.maagit.fi/modx/quickmanager-plus\r\n * @author      Mikko Lammi\r\n * @author      Since 2011: yama, dmi3yy, segr, Nicola1971.\r\n * @lastupdate  28/09/2017 \r\n */\r\n\r\n// In manager\r\nif (!$modx->checkSession()) return;\r\n\r\n$show = TRUE;\r\n\r\nif ($disabled  != \'\') {\r\n    $arr = array_filter(array_map(\'intval\', explode(\',\', $disabled)));\r\n    if (in_array($modx->documentIdentifier, $arr)) {\r\n        $show = FALSE;\r\n    }\r\n}\r\n\r\nif ($show) {\r\n    // Replace [*#tv*] with QM+ edit TV button placeholders\r\n    if ($tvbuttons == \'true\') {\r\n        if ($modx->event->name == \'OnParseDocument\') {\r\n             $output = &$modx->documentOutput;\r\n             $output = preg_replace(\'~\\[\\*#(.*?)\\*\\]~\', \'<!-- \'.$tvbclass.\' $1 -->[*$1*]\', $output);\r\n             $modx->documentOutput = $output;\r\n         }\r\n     }\r\n    include_once($modx->config[\'base_path\'].\'assets/plugins/qm/qm.inc.php\');\r\n    $qm = new Qm($modx, $jqpath, $loadmanagerjq, $loadfrontendjq, $noconflictjq, $loadfa, $loadtb, $tbwidth, $tbheight, $hidefields, $hidetabs, $hidesections, $addbutton, $tpltype, $tplid, $custombutton, $managerbutton, $logout, $autohide, $position, $editbuttons, $editbclass, $newbuttons, $newbclass, $tvbuttons, $tvbclass, $buttonStyle, $removeBg);\r\n}\r\n', 0, '{\"jqpath\":[{\"label\":\"Path to jQuery\",\"type\":\"text\",\"value\":\"assets\\/js\\/jquery.min.js\",\"default\":\"assets\\/js\\/jquery.min.js\",\"desc\":\"\"}],\"loadmanagerjq\":[{\"label\":\"Load jQuery in manager\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"loadfrontendjq\":[{\"label\":\"Load jQuery in front-end\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"noconflictjq\":[{\"label\":\"jQuery noConflict mode in front-end\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"loadfa\":[{\"label\":\"Load Font Awesome css in front-end\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"loadtb\":[{\"label\":\"Load modal box in front-end\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"tbwidth\":[{\"label\":\"Modal box window width\",\"type\":\"text\",\"value\":\"80%\",\"default\":\"80%\",\"desc\":\"\"}],\"tbheight\":[{\"label\":\"Modal box window height\",\"type\":\"text\",\"value\":\"90%\",\"default\":\"90%\",\"desc\":\"\"}],\"hidefields\":[{\"label\":\"Hide document fields from front-end editors\",\"type\":\"text\",\"value\":\"parent\",\"default\":\"parent\",\"desc\":\"\"}],\"hidetabs\":[{\"label\":\"Hide document tabs from front-end editors\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"hidesections\":[{\"label\":\"Hide document sections from front-end editors\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"addbutton\":[{\"label\":\"Show add document here button\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"tpltype\":[{\"label\":\"New document template type\",\"type\":\"list\",\"value\":\"parent\",\"options\":\"parent,id,selected\",\"default\":\"parent\",\"desc\":\"\"}],\"tplid\":[{\"label\":\"New document template id\",\"type\":\"int\",\"value\":\"3\",\"default\":\"3\",\"desc\":\"\"}],\"custombutton\":[{\"label\":\"Custom buttons\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"managerbutton\":[{\"label\":\"Show go to manager button\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"logout\":[{\"label\":\"Logout to\",\"type\":\"list\",\"value\":\"manager\",\"options\":\"manager,front-end\",\"default\":\"manager\",\"desc\":\"\"}],\"disabled\":[{\"label\":\"Plugin disabled on documents\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"autohide\":[{\"label\":\"Autohide toolbar\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"position\":[{\"label\":\"Toolbar position\",\"type\":\"list\",\"value\":\"top\",\"options\":\"top,right,bottom,left,before\",\"default\":\"top\",\"desc\":\"\"}],\"editbuttons\":[{\"label\":\"Inline edit buttons\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"editbclass\":[{\"label\":\"Edit button CSS class\",\"type\":\"text\",\"value\":\"qm-edit\",\"default\":\"qm-edit\",\"desc\":\"\"}],\"newbuttons\":[{\"label\":\"Inline new resource buttons\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"newbclass\":[{\"label\":\"New resource button CSS class\",\"type\":\"text\",\"value\":\"qm-new\",\"default\":\"qm-new\",\"desc\":\"\"}],\"tvbuttons\":[{\"label\":\"Inline template variable buttons\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"tvbclass\":[{\"label\":\"Template variable button CSS class\",\"type\":\"text\",\"value\":\"qm-tv\",\"default\":\"qm-tv\",\"desc\":\"\"}],\"removeBg\":[{\"label\":\"Remove toolbar background\",\"type\":\"list\",\"value\":\"no\",\"options\":\"yes,no\",\"default\":\"no\",\"desc\":\"\"}],\"buttonStyle\":[{\"label\":\"QuickManager buttons CSS stylesheet\",\"type\":\"list\",\"value\":\"navButtons\",\"options\":\"actionButtons,navButtons\",\"default\":\"navButtons\",\"desc\":\"\"}]}', 1, '', 0, 0),
(8, 'TinyMCE4', '<strong>4.6.3</strong> Javascript WYSIWYG editor', 0, 4, 0, 'require MODX_BASE_PATH.\'assets/plugins/tinymce4/plugin.tinymce.php\';', 0, '{\"styleFormats\":[{\"label\":\"Custom Style Formats <b>RAW<\\/b><br\\/><br\\/><ul><li>leave empty to use below block\\/inline formats<\\/li><li>allows simple-format: <i>Title,cssClass|Title2,cssClass2<\\/i><\\/li><li>Also accepts full JSON-config as per TinyMCE4 docs \\/ configure \\/ content-formating \\/ style_formats<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"styleFormats_inline\":[{\"label\":\"Custom Style Formats <b>INLINE<\\/b><br\\/><br\\/><ul><li>will wrap selected text with span-tag + css-class<\\/li><li>simple-format only<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"InlineTitle,cssClass1|InlineTitle2,cssClass2\",\"default\":\"InlineTitle,cssClass1|InlineTitle2,cssClass2\",\"desc\":\"\"}],\"styleFormats_block\":[{\"label\":\"Custom Style Formats <b>BLOCK<\\/b><br\\/><br\\/><ul><li>will add css-class to selected block-element<\\/li><li>simple-format only<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"BlockTitle,cssClass3|BlockTitle2,cssClass4\",\"default\":\"BlockTitle,cssClass3|BlockTitle2,cssClass4\",\"desc\":\"\"}],\"customParams\":[{\"label\":\"Custom Parameters<br\\/><b>(Be careful or leave empty!)<\\/b>\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"entityEncoding\":[{\"label\":\"Entity Encoding\",\"type\":\"list\",\"value\":\"named\",\"options\":\"named,numeric,raw\",\"default\":\"named\",\"desc\":\"\"}],\"entities\":[{\"label\":\"Entities\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"pathOptions\":[{\"label\":\"Path Options\",\"type\":\"list\",\"value\":\"Site config\",\"options\":\"Site config,Absolute path,Root relative,URL,No convert\",\"default\":\"Site config\",\"desc\":\"\"}],\"resizing\":[{\"label\":\"Advanced Resizing\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"disabledButtons\":[{\"label\":\"Disabled Buttons\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webTheme\":[{\"label\":\"Web Theme\",\"type\":\"test\",\"value\":\"webuser\",\"default\":\"webuser\",\"desc\":\"\"}],\"webPlugins\":[{\"label\":\"Web Plugins\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webButtons1\":[{\"label\":\"Web Buttons 1\",\"type\":\"text\",\"value\":\"bold italic underline strikethrough removeformat alignleft aligncenter alignright\",\"default\":\"bold italic underline strikethrough removeformat alignleft aligncenter alignright\",\"desc\":\"\"}],\"webButtons2\":[{\"label\":\"Web Buttons 2\",\"type\":\"text\",\"value\":\"link unlink image undo redo\",\"default\":\"link unlink image undo redo\",\"desc\":\"\"}],\"webButtons3\":[{\"label\":\"Web Buttons 3\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webButtons4\":[{\"label\":\"Web Buttons 4\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webAlign\":[{\"label\":\"Web Toolbar Alignment\",\"type\":\"list\",\"value\":\"ltr\",\"options\":\"ltr,rtl\",\"default\":\"ltr\",\"desc\":\"\"}],\"width\":[{\"label\":\"Width\",\"type\":\"text\",\"value\":\"100%\",\"default\":\"100%\",\"desc\":\"\"}],\"height\":[{\"label\":\"Height\",\"type\":\"text\",\"value\":\"400px\",\"default\":\"400px\",\"desc\":\"\"}],\"introtextRte\":[{\"label\":\"<b>Introtext RTE<\\/b><br\\/>add richtext-features to \\\"introtext\\\"\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"inlineMode\":[{\"label\":\"<b>Inline-Mode<\\/b>\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"inlineTheme\":[{\"label\":\"<b>Inline-Mode<\\/b><br\\/>Theme\",\"type\":\"text\",\"value\":\"inline\",\"default\":\"inline\",\"desc\":\"\"}],\"browser_spellcheck\":[{\"label\":\"<b>Browser Spellcheck<\\/b><br\\/>At least one dictionary must be installed inside your browser\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"paste_as_text\":[{\"label\":\"<b>Force Paste as Text<\\/b>\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}]}', 1, '', 0, 0),
(9, 'TransAlias', '<strong>1.0.4</strong> Human readible URL translation supporting multiple languages and overrides', 0, 4, 0, 'require MODX_BASE_PATH.\'assets/plugins/transalias/plugin.transalias.php\';', 0, '{\"table_name\":[{\"label\":\"Trans table\",\"type\":\"list\",\"value\":\"russian\",\"options\":\"common,russian,dutch,german,czech,utf8,utf8lowercase\",\"default\":\"russian\",\"desc\":\"\"}],\"char_restrict\":[{\"label\":\"Restrict alias to\",\"type\":\"list\",\"value\":\"lowercase alphanumeric\",\"options\":\"lowercase alphanumeric,alphanumeric,legal characters\",\"default\":\"lowercase alphanumeric\",\"desc\":\"\"}],\"remove_periods\":[{\"label\":\"Remove Periods\",\"type\":\"list\",\"value\":\"No\",\"options\":\"Yes,No\",\"default\":\"No\",\"desc\":\"\"}],\"word_separator\":[{\"label\":\"Word Separator\",\"type\":\"list\",\"value\":\"dash\",\"options\":\"dash,underscore,none\",\"default\":\"dash\",\"desc\":\"\"}],\"override_tv\":[{\"label\":\"Override TV name\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}', 0, '', 0, 0),
(10, 'Updater', '<strong>0.8.3</strong> show message about outdated CMS version', 0, 4, 0, 'require MODX_BASE_PATH.\'assets/plugins/updater/plugin.updater.php\';\r\n\r\n\r\n', 0, '{\"version\":[{\"label\":\"Version:\",\"type\":\"text\",\"value\":\"evolution-cms\\/evolution\",\"default\":\"evolution-cms\\/evolution\",\"desc\":\"\"}],\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"All\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"All\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Show only to this role id:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Show only to this username:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"showButton\":[{\"label\":\"Show Update Button:\",\"type\":\"menu\",\"value\":\"AdminOnly\",\"options\":\"show,hide,AdminOnly\",\"default\":\"AdminOnly\",\"desc\":\"\"}],\"type\":[{\"label\":\"Type:\",\"type\":\"menu\",\"value\":\"tags\",\"options\":\"tags,releases,commits\",\"default\":\"tags\",\"desc\":\"\"}]}', 1, '', 0, 0),
(12, 'evoAjax', '', 0, 1, 0, 'switch($_GET[\'q\']){     \r\n	case \'feedbackajaxform\':\r\n		echo $modx->runSnippet(\'FormLister\', array(\r\n			\'formid\' => \'ContactForm\',\r\n			\'to\' => $modx->config[\'emailsender\'],\r\n			\'replyTo\'=> \'[+email.value+]\',\r\n			\'subjectTpl\' => \'@CODE:[+subject.value+], from: \' . $modx->config[\'site_name\'] ,\r\n			\'ccSender\'=>\'1\',\r\n			\'errorClass\'=> \' has-error\',\r\n			\'requiredClass\'=> \' has-warning\',\r\n			\'rules\'=> \'{\r\n               	\"name\":{\r\n               		\"required\":\"Enter your Name\"\r\n               	},\r\n               	\"email\":{\r\n               		\"required\":\"Enter email\",\r\n               		\"email\":\"Incorrect email\"\r\n               	},\r\n               	\"message\":{\r\n                	\"required\":\"Enter message\"\r\n                }\r\n            }\',\r\n			\'formControls\'=>\'subject\',\r\n			\'messagesTpl\' => \'@CODE:<div class=\"form-messages alert alert-danger\">[+required+]<br>[+errors+]</div>\',\r\n            \'errorTpl\'=>\'@CODE: [+message+]\',\r\n            \'successTpl\'=> \'@CODE: \r\n             	<div class=\"alert alert-success mt-3\">\r\n                 	<h3>Thanks!</h3>\r\n                 	<p>your message has been sent.</p>\r\n             	</div>\',\r\n            \'formTpl\' => \'ContactForm\', \r\n			\'reportTpl\'=>\'ContactFormReport\',\r\n            \'ccSenderTpl\'=>\'ContactFormReport\',	\r\n			));\r\n			die();\r\n        break;\r\n	case \'calcform\':\r\n		echo $modx->runSnippet(\'FormLister\', array(\r\n			\'formid\' => \'calc_form\',\r\n			\'to\' => $modx->config[\'emailsender\'],\r\n			\'replyTo\'=> \'[+email.value+]\',\r\n			\'subjectTpl\' => \'@CODE:[+subject.value+], from: \' . $modx->config[\'site_name\'] ,\r\n			\'ccSender\'=>\'1\',\r\n			\'formControls\'=>\'subject\'\r\n			));\r\n			die();\r\n        break;\r\n	case \'cbform\':\r\n		echo $modx->runSnippet(\'FormLister\', array(\r\n			\'formid\' => \'form_callme\',\r\n			\'to\' => $modx->config[\'emailsender\'],\r\n			\'replyTo\'=> \'[+email.value+]\',\r\n			\'subjectTpl\' => \'@CODE:[+subject.value+], from: \' . $modx->config[\'site_name\'] ,\r\n			\'ccSender\'=>\'1\',\r\n			\'formControls\'=>\'subject\'\r\n			));\r\n			die();\r\n        break;\r\n}\r\n', 0, '{}', 0, ' ', 1507815395, 1525305827);
INSERT INTO `evo_site_plugins` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `plugincode`, `locked`, `properties`, `disabled`, `moduleguid`, `createdon`, `editedon`) VALUES
(13, 'CodeMirror', '<strong>1.5</strong> JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.33 (released on 21-12-2017)', 0, 4, 0, '\r\n/**\r\n * CodeMirror\r\n *\r\n * JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.33 (released on 21-12-2017)\r\n *\r\n * @category    plugin\r\n * @version     1.5\r\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\r\n * @package     evo\r\n * @internal    @events OnDocFormRender,OnChunkFormRender,OnModFormRender,OnPluginFormRender,OnSnipFormRender,OnTempFormRender,OnRichTextEditorInit\r\n * @internal    @modx_category Manager and Admin\r\n * @internal    @properties &theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;default &darktheme=Dark Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;one-dark &fontSize=Font-size;list;10,11,12,13,14,15,16,17,18;14 &lineHeight=Line-height;list;1,1.1,1.2,1.3,1.4,1.5;1.3 &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;false &indentWithTabs=indentWithTabs;list;true,false;true &undoDepth=undoDepth;int;200 &historyEventDelay=historyEventDelay;int;1250\r\n * @internal    @installset base\r\n * @reportissues https://github.com/evolution-cms/evolution/issues/\r\n * @documentation Official docs https://codemirror.net/doc/manual.html\r\n * @author      hansek from http://www.modxcms.cz\r\n * @author      update Mihanik71\r\n * @author      update Deesen\r\n * @author      update 64j\r\n * @lastupdate  08-01-2018\r\n */\r\n\r\n$_CM_BASE = \'assets/plugins/codemirror/\';\r\n\r\n$_CM_URL = $modx->config[\'site_url\'] . $_CM_BASE;\r\n\r\nrequire(MODX_BASE_PATH. $_CM_BASE .\'codemirror.plugin.php\');', 0, '{\"theme\":[{\"label\":\"Theme\",\"type\":\"list\",\"value\":\"default\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"default\",\"desc\":\"\"}],\"darktheme\":[{\"label\":\"Dark Theme\",\"type\":\"list\",\"value\":\"one-dark\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"one-dark\",\"desc\":\"\"}],\"fontSize\":[{\"label\":\"Font-size\",\"type\":\"list\",\"value\":\"14\",\"options\":\"10,11,12,13,14,15,16,17,18\",\"default\":\"14\",\"desc\":\"\"}],\"lineHeight\":[{\"label\":\"Line-height\",\"type\":\"list\",\"value\":\"1.3\",\"options\":\"1,1.1,1.2,1.3,1.4,1.5\",\"default\":\"1.3\",\"desc\":\"\"}],\"indentUnit\":[{\"label\":\"Indent unit\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"tabSize\":[{\"label\":\"The width of a tab character\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"lineWrapping\":[{\"label\":\"lineWrapping\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"matchBrackets\":[{\"label\":\"matchBrackets\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"activeLine\":[{\"label\":\"activeLine\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"emmet\":[{\"label\":\"emmet\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"search\":[{\"label\":\"search\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"indentWithTabs\":[{\"label\":\"indentWithTabs\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"undoDepth\":[{\"label\":\"undoDepth\",\"type\":\"int\",\"value\":\"200\",\"default\":\"200\",\"desc\":\"\"}],\"historyEventDelay\":[{\"label\":\"historyEventDelay\",\"type\":\"int\",\"value\":\"1250\",\"default\":\"1250\",\"desc\":\"\"}]}', 0, '', 0, 0),
(14, 'Forgot Manager Login', '<strong>1.1.7</strong> Resets your manager login when you forget your password via email confirmation', 0, 4, 0, 'require MODX_BASE_PATH.\'assets/plugins/forgotmanagerlogin/plugin.forgotmanagerlogin.php\';', 0, '', 0, '', 0, 0),
(15, 'Quick Manager+', '<strong>1.5.10</strong> Enables QuickManager+ front end content editing support', 0, 4, 0, '\r\n/**\r\n * Quick Manager+\r\n * \r\n * Enables QuickManager+ front end content editing support\r\n *\r\n * @category 	plugin\r\n * @version 	1.5.10\r\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL v3)\r\n * @internal    @properties &jqpath=Path to jQuery;text;assets/js/jquery.min.js &loadmanagerjq=Load jQuery in manager;list;true,false;false &loadfrontendjq=Load jQuery in front-end;list;true,false;false &noconflictjq=jQuery noConflict mode in front-end;list;true,false;false &loadfa=Load Font Awesome css in front-end;list;true,false;true &loadtb=Load modal box in front-end;list;true,false;true &tbwidth=Modal box window width;text;80% &tbheight=Modal box window height;text;90% &hidefields=Hide document fields from front-end editors;text;parent &hidetabs=Hide document tabs from front-end editors;text; &hidesections=Hide document sections from front-end editors;text; &addbutton=Show add document here button;list;true,false;true &tpltype=New document template type;list;parent,id,selected;parent &tplid=New document template id;int;3 &custombutton=Custom buttons;textarea; &managerbutton=Show go to manager button;list;true,false;true &logout=Logout to;list;manager,front-end;manager &disabled=Plugin disabled on documents;text; &autohide=Autohide toolbar;list;true,false;true &position= Toolbar position;list;top,right,bottom,left,before;top &editbuttons=Inline edit buttons;list;true,false;false &editbclass=Edit button CSS class;text;qm-edit &newbuttons=Inline new resource buttons;list;true,false;false &newbclass=New resource button CSS class;text;qm-new &tvbuttons=Inline template variable buttons;list;true,false;false &tvbclass=Template variable button CSS class;text;qm-tv &removeBg=Remove toolbar background;list;yes,no;no &buttonStyle=QuickManager buttons CSS stylesheet;list;actionButtons,navButtons;navButtons  \r\n * @internal	@events OnParseDocument,OnWebPagePrerender,OnDocFormPrerender,OnDocFormSave,OnManagerLogout \r\n * @internal	@modx_category Manager and Admin\r\n * @internal    @legacy_names QM+,QuickEdit\r\n * @internal    @installset base, sample\r\n * @internal    @disabled 1\r\n * @reportissues https://github.com/modxcms/evolution\r\n * @documentation Official docs [+site_url+]assets/plugins/qm/readme.html\r\n * @link        http://www.maagit.fi/modx/quickmanager-plus\r\n * @author      Mikko Lammi\r\n * @author      Since 2011: yama, dmi3yy, segr, Nicola1971.\r\n * @lastupdate  02/02/2018 \r\n */\r\n\r\n// In manager\r\nif (!$modx->checkSession()) return;\r\n\r\n$show = TRUE;\r\n\r\nif ($disabled  != \'\') {\r\n    $arr = array_filter(array_map(\'intval\', explode(\',\', $disabled)));\r\n    if (in_array($modx->documentIdentifier, $arr)) {\r\n        $show = FALSE;\r\n    }\r\n}\r\n\r\nif ($show) {\r\n    // Replace [*#tv*] with QM+ edit TV button placeholders\r\n    if ($tvbuttons == \'true\') {\r\n        if ($modx->event->name == \'OnParseDocument\') {\r\n             $output = &$modx->documentOutput;\r\n             $output = preg_replace(\'~\\[\\*#(.*?)\\*\\]~\', \'<!-- \'.$tvbclass.\' $1 -->[*$1*]\', $output);\r\n             $modx->documentOutput = $output;\r\n         }\r\n     }\r\n    include_once($modx->config[\'base_path\'].\'assets/plugins/qm/qm.inc.php\');\r\n    $qm = new Qm($modx, $jqpath, $loadmanagerjq, $loadfrontendjq, $noconflictjq, $loadfa, $loadtb, $tbwidth, $tbheight, $hidefields, $hidetabs, $hidesections, $addbutton, $tpltype, $tplid, $custombutton, $managerbutton, $logout, $autohide, $position, $editbuttons, $editbclass, $newbuttons, $newbclass, $tvbuttons, $tvbclass, $buttonStyle, $removeBg);\r\n}\r\n', 0, '{\"jqpath\":[{\"label\":\"Path to jQuery\",\"type\":\"text\",\"value\":\"assets\\/js\\/jquery.min.js\",\"default\":\"assets\\/js\\/jquery.min.js\",\"desc\":\"\"}],\"loadmanagerjq\":[{\"label\":\"Load jQuery in manager\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"loadfrontendjq\":[{\"label\":\"Load jQuery in front-end\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"noconflictjq\":[{\"label\":\"jQuery noConflict mode in front-end\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"loadfa\":[{\"label\":\"Load Font Awesome css in front-end\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"loadtb\":[{\"label\":\"Load modal box in front-end\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"tbwidth\":[{\"label\":\"Modal box window width\",\"type\":\"text\",\"value\":\"80%\",\"default\":\"80%\",\"desc\":\"\"}],\"tbheight\":[{\"label\":\"Modal box window height\",\"type\":\"text\",\"value\":\"90%\",\"default\":\"90%\",\"desc\":\"\"}],\"hidefields\":[{\"label\":\"Hide document fields from front-end editors\",\"type\":\"text\",\"value\":\"parent\",\"default\":\"parent\",\"desc\":\"\"}],\"hidetabs\":[{\"label\":\"Hide document tabs from front-end editors\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"hidesections\":[{\"label\":\"Hide document sections from front-end editors\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"addbutton\":[{\"label\":\"Show add document here button\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"tpltype\":[{\"label\":\"New document template type\",\"type\":\"list\",\"value\":\"parent\",\"options\":\"parent,id,selected\",\"default\":\"parent\",\"desc\":\"\"}],\"tplid\":[{\"label\":\"New document template id\",\"type\":\"int\",\"value\":\"3\",\"default\":\"3\",\"desc\":\"\"}],\"custombutton\":[{\"label\":\"Custom buttons\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"managerbutton\":[{\"label\":\"Show go to manager button\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"logout\":[{\"label\":\"Logout to\",\"type\":\"list\",\"value\":\"manager\",\"options\":\"manager,front-end\",\"default\":\"manager\",\"desc\":\"\"}],\"disabled\":[{\"label\":\"Plugin disabled on documents\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"autohide\":[{\"label\":\"Autohide toolbar\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"position\":[{\"label\":\"Toolbar position\",\"type\":\"list\",\"value\":\"top\",\"options\":\"top,right,bottom,left,before\",\"default\":\"top\",\"desc\":\"\"}],\"editbuttons\":[{\"label\":\"Inline edit buttons\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"editbclass\":[{\"label\":\"Edit button CSS class\",\"type\":\"text\",\"value\":\"qm-edit\",\"default\":\"qm-edit\",\"desc\":\"\"}],\"newbuttons\":[{\"label\":\"Inline new resource buttons\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"newbclass\":[{\"label\":\"New resource button CSS class\",\"type\":\"text\",\"value\":\"qm-new\",\"default\":\"qm-new\",\"desc\":\"\"}],\"tvbuttons\":[{\"label\":\"Inline template variable buttons\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"tvbclass\":[{\"label\":\"Template variable button CSS class\",\"type\":\"text\",\"value\":\"qm-tv\",\"default\":\"qm-tv\",\"desc\":\"\"}],\"removeBg\":[{\"label\":\"Remove toolbar background\",\"type\":\"list\",\"value\":\"no\",\"options\":\"yes,no\",\"default\":\"no\",\"desc\":\"\"}],\"buttonStyle\":[{\"label\":\"QuickManager buttons CSS stylesheet\",\"type\":\"list\",\"value\":\"navButtons\",\"options\":\"actionButtons,navButtons\",\"default\":\"navButtons\",\"desc\":\"\"}]}', 0, '', 0, 0),
(16, 'TinyMCE4', '<strong>4.7.4</strong> Javascript rich text editor', 0, 4, 0, '\n/**\n * TinyMCE4\n *\n * Javascript rich text editor\n *\n * @category    plugin\n * @version     4.7.4\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @internal    @properties &styleFormats=Custom Style Formats <b>RAW</b><br/><br/><ul><li>leave empty to use below block/inline formats</li><li>allows simple-format: <i>Title,cssClass|Title2,cssClass2</i></li><li>Also accepts full JSON-config as per TinyMCE4 docs / configure / content-formating / style_formats</li></ul>;textarea; &styleFormats_inline=Custom Style Formats <b>INLINE</b><br/><br/><ul><li>will wrap selected text with span-tag + css-class</li><li>simple-format only</li></ul>;textarea;InlineTitle,cssClass1|InlineTitle2,cssClass2 &styleFormats_block=Custom Style Formats <b>BLOCK</b><br/><br/><ul><li>will add css-class to selected block-element</li><li>simple-format only</li></ul>;textarea;BlockTitle,cssClass3|BlockTitle2,cssClass4 &customParams=Custom Parameters<br/><b>(Be careful or leave empty!)</b>;textarea; &entityEncoding=Entity Encoding;list;named,numeric,raw;named &entities=Entities;text; &pathOptions=Path Options;list;Site config,Absolute path,Root relative,URL,No convert;Site config &resizing=Advanced Resizing;list;true,false;false &disabledButtons=Disabled Buttons;text; &webTheme=Web Theme;test;webuser &webPlugins=Web Plugins;text; &webButtons1=Web Buttons 1;text;bold italic underline strikethrough removeformat alignleft aligncenter alignright &webButtons2=Web Buttons 2;text;link unlink image undo redo &webButtons3=Web Buttons 3;text; &webButtons4=Web Buttons 4;text; &webAlign=Web Toolbar Alignment;list;ltr,rtl;ltr &width=Width;text;100% &height=Height;text;400px &introtextRte=<b>Introtext RTE</b><br/>add richtext-features to \"introtext\";list;enabled,disabled;disabled &inlineMode=<b>Inline-Mode</b>;list;enabled,disabled;disabled &inlineTheme=<b>Inline-Mode</b><br/>Theme;text;inline &browser_spellcheck=<b>Browser Spellcheck</b><br/>At least one dictionary must be installed inside your browser;list;enabled,disabled;disabled &paste_as_text=<b>Force Paste as Text</b>;list;enabled,disabled;disabled\n * @internal    @events OnLoadWebDocument,OnParseDocument,OnWebPagePrerender,OnLoadWebPageCache,OnRichTextEditorRegister,OnRichTextEditorInit,OnInterfaceSettingsRender\n * @internal    @modx_category Manager and Admin\n * @internal    @legacy_names TinyMCE Rich Text Editor\n * @internal    @installset base\n * @logo        /assets/plugins/tinymce4/tinymce/logo.png\n * @reportissues https://github.com/extras-evolution/tinymce4-for-modx-evo\n * @documentation Plugin docs https://github.com/extras-evolution/tinymce4-for-modx-evo\n * @documentation Official TinyMCE4-docs https://www.tinymce.com/docs/\n * @author      Deesen\n * @lastupdate  2018-01-17\n */\nif (!defined(\'MODX_BASE_PATH\')) { die(\'What are you doing? Get out of here!\'); }\n\nrequire(MODX_BASE_PATH.\"assets/plugins/tinymce4/plugin.tinymce.inc.php\");', 0, '{\"styleFormats\":[{\"label\":\"Custom Style Formats <b>RAW<\\/b><br\\/><br\\/><ul><li>leave empty to use below block\\/inline formats<\\/li><li>allows simple-format: <i>Title,cssClass|Title2,cssClass2<\\/i><\\/li><li>Also accepts full JSON-config as per TinyMCE4 docs \\/ configure \\/ content-formating \\/ style_formats<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"styleFormats_inline\":[{\"label\":\"Custom Style Formats <b>INLINE<\\/b><br\\/><br\\/><ul><li>will wrap selected text with span-tag + css-class<\\/li><li>simple-format only<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"InlineTitle,cssClass1|InlineTitle2,cssClass2\",\"default\":\"InlineTitle,cssClass1|InlineTitle2,cssClass2\",\"desc\":\"\"}],\"styleFormats_block\":[{\"label\":\"Custom Style Formats <b>BLOCK<\\/b><br\\/><br\\/><ul><li>will add css-class to selected block-element<\\/li><li>simple-format only<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"BlockTitle,cssClass3|BlockTitle2,cssClass4\",\"default\":\"BlockTitle,cssClass3|BlockTitle2,cssClass4\",\"desc\":\"\"}],\"customParams\":[{\"label\":\"Custom Parameters<br\\/><b>(Be careful or leave empty!)<\\/b>\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"entityEncoding\":[{\"label\":\"Entity Encoding\",\"type\":\"list\",\"value\":\"named\",\"options\":\"named,numeric,raw\",\"default\":\"named\",\"desc\":\"\"}],\"entities\":[{\"label\":\"Entities\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"pathOptions\":[{\"label\":\"Path Options\",\"type\":\"list\",\"value\":\"Site config\",\"options\":\"Site config,Absolute path,Root relative,URL,No convert\",\"default\":\"Site config\",\"desc\":\"\"}],\"resizing\":[{\"label\":\"Advanced Resizing\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"disabledButtons\":[{\"label\":\"Disabled Buttons\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webTheme\":[{\"label\":\"Web Theme\",\"type\":\"test\",\"value\":\"webuser\",\"default\":\"webuser\",\"desc\":\"\"}],\"webPlugins\":[{\"label\":\"Web Plugins\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webButtons1\":[{\"label\":\"Web Buttons 1\",\"type\":\"text\",\"value\":\"bold italic underline strikethrough removeformat alignleft aligncenter alignright\",\"default\":\"bold italic underline strikethrough removeformat alignleft aligncenter alignright\",\"desc\":\"\"}],\"webButtons2\":[{\"label\":\"Web Buttons 2\",\"type\":\"text\",\"value\":\"link unlink image undo redo\",\"default\":\"link unlink image undo redo\",\"desc\":\"\"}],\"webButtons3\":[{\"label\":\"Web Buttons 3\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webButtons4\":[{\"label\":\"Web Buttons 4\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webAlign\":[{\"label\":\"Web Toolbar Alignment\",\"type\":\"list\",\"value\":\"ltr\",\"options\":\"ltr,rtl\",\"default\":\"ltr\",\"desc\":\"\"}],\"width\":[{\"label\":\"Width\",\"type\":\"text\",\"value\":\"100%\",\"default\":\"100%\",\"desc\":\"\"}],\"height\":[{\"label\":\"Height\",\"type\":\"text\",\"value\":\"400px\",\"default\":\"400px\",\"desc\":\"\"}],\"introtextRte\":[{\"label\":\"<b>Introtext RTE<\\/b><br\\/>add richtext-features to \\\"introtext\\\"\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"inlineMode\":[{\"label\":\"<b>Inline-Mode<\\/b>\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"inlineTheme\":[{\"label\":\"<b>Inline-Mode<\\/b><br\\/>Theme\",\"type\":\"text\",\"value\":\"inline\",\"default\":\"inline\",\"desc\":\"\"}],\"browser_spellcheck\":[{\"label\":\"<b>Browser Spellcheck<\\/b><br\\/>At least one dictionary must be installed inside your browser\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"paste_as_text\":[{\"label\":\"<b>Force Paste as Text<\\/b>\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}]}', 0, '', 0, 0),
(17, 'Updater', '<strong>0.8.4</strong> show message about outdated CMS version', 0, 4, 0, 'require MODX_BASE_PATH.\'assets/plugins/updater/plugin.updater.php\';\r\n\r\n\r\n', 0, '{\"version\":[{\"label\":\"Version:\",\"type\":\"text\",\"value\":\"evolution-cms\\/evolution\",\"default\":\"evolution-cms\\/evolution\",\"desc\":\"\"}],\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"All\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"All\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Show only to this role id:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Show only to this username:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"showButton\":[{\"label\":\"Show Update Button:\",\"type\":\"menu\",\"value\":\"AdminOnly\",\"options\":\"show,hide,AdminOnly\",\"default\":\"AdminOnly\",\"desc\":\"\"}],\"type\":[{\"label\":\"Type:\",\"type\":\"menu\",\"value\":\"tags\",\"options\":\"tags,releases,commits\",\"default\":\"tags\",\"desc\":\"\"}],\"branch\":[{\"label\":\"Commit branch:\",\"type\":\"text\",\"value\":\"develop\",\"default\":\"develop\",\"desc\":\"\"}]}', 0, '', 0, 0),
(18, 'userHelper', '<strong>1.7.18</strong> addition to FormLister', 0, 6, 0, '\n/**\n * userHelper\n * \n * addition to FormLister\n * \n * @category    plugin\n * @version     1.7.18\n * @internal    @properties &logoutKey=Request key;text;logout &cookieName=Cookie Name;text;WebLoginPE &cookieLifetime=Cookie Lifetime, seconds;text;157680000 &maxFails=Max failed logins;text;3 &blockTime=Block for, seconds;text;3600\n * @internal    @events OnWebAuthentication,OnWebPageInit,OnPageNotFound,OnWebLogin\n * @internal    @modx_category Content\n * @internal    @disabled 1\n**/\n\nrequire MODX_BASE_PATH.\'assets/snippets/FormLister/plugin.userHelper.php\';\n', 0, '{\"logoutKey\":[{\"label\":\"Request key\",\"type\":\"text\",\"value\":\"logout\",\"default\":\"logout\",\"desc\":\"\"}],\"cookieName\":[{\"label\":\"Cookie Name\",\"type\":\"text\",\"value\":\"WebLoginPE\",\"default\":\"WebLoginPE\",\"desc\":\"\"}],\"cookieLifetime\":[{\"label\":\"Cookie Lifetime, seconds\",\"type\":\"text\",\"value\":\"157680000\",\"default\":\"157680000\",\"desc\":\"\"}],\"maxFails\":[{\"label\":\"Max failed logins\",\"type\":\"text\",\"value\":\"3\",\"default\":\"3\",\"desc\":\"\"}],\"blockTime\":[{\"label\":\"Block for, seconds\",\"type\":\"text\",\"value\":\"3600\",\"default\":\"3600\",\"desc\":\"\"}]}', 1, '', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `evo_site_plugin_events`
--

CREATE TABLE `evo_site_plugin_events` (
  `pluginid` int(10) NOT NULL,
  `evtid` int(10) NOT NULL DEFAULT '0',
  `priority` int(10) NOT NULL DEFAULT '0' COMMENT 'determines plugin run order'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links to system events';

--
-- Дамп данных таблицы `evo_site_plugin_events`
--

INSERT INTO `evo_site_plugin_events` (`pluginid`, `evtid`, `priority`) VALUES
(1, 23, 0),
(1, 29, 0),
(1, 35, 0),
(1, 41, 0),
(1, 47, 0),
(1, 73, 0),
(1, 88, 0),
(2, 211, 0),
(2, 210, 0),
(2, 206, 0),
(2, 77, 0),
(2, 75, 0),
(2, 57, 0),
(2, 55, 0),
(2, 51, 0),
(2, 49, 0),
(2, 45, 0),
(2, 43, 0),
(2, 39, 0),
(2, 37, 0),
(2, 27, 0),
(2, 25, 0),
(3, 42, 0),
(3, 41, 0),
(3, 40, 0),
(3, 36, 0),
(3, 35, 0),
(3, 34, 0),
(4, 80, 0),
(4, 81, 0),
(4, 93, 0),
(5, 205, 0),
(5, 53, 0),
(5, 35, 0),
(5, 31, 0),
(5, 30, 0),
(5, 29, 0),
(5, 28, 0),
(6, 202, 0),
(7, 3, 0),
(7, 13, 0),
(7, 28, 0),
(7, 31, 0),
(7, 92, 0),
(8, 3, 0),
(8, 20, 0),
(8, 85, 0),
(8, 87, 0),
(8, 88, 0),
(8, 91, 0),
(8, 92, 0),
(9, 100, 0),
(10, 70, 0),
(10, 202, 0),
(10, 1000, 0),
(12, 1000, 1),
(13, 23, 0),
(13, 29, 0),
(13, 35, 0),
(13, 41, 0),
(13, 47, 0),
(13, 73, 0),
(13, 88, 0),
(14, 80, 0),
(14, 81, 0),
(14, 93, 0),
(15, 3, 0),
(15, 13, 0),
(15, 28, 0),
(15, 31, 0),
(15, 92, 0),
(16, 3, 0),
(16, 20, 0),
(16, 85, 0),
(16, 87, 0),
(16, 88, 0),
(16, 91, 0),
(16, 92, 0),
(17, 70, 0),
(17, 202, 0),
(17, 1000, 0),
(18, 4, 0),
(18, 79, 0),
(18, 90, 0),
(18, 1000, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `evo_site_snippets`
--

CREATE TABLE `evo_site_snippets` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Snippet',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the snippet'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains the site snippets.';

--
-- Дамп данных таблицы `evo_site_snippets`
--

INSERT INTO `evo_site_snippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`, `createdon`, `editedon`, `disabled`) VALUES
(1, 'DLCrumbs', '<strong>1.2</strong> DLCrumbs', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLCrumbs.php\';', 0, '', '', 0, 0, 0),
(2, 'DLMenu', '<strong>1.3.0</strong> Snippet to build menu with DocLister', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLMenu.php\';\n', 0, '', '', 0, 0, 0),
(3, 'DLSitemap', '<strong>1.0.0</strong> Snippet to build XML sitemap', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLSitemap.php\';\n', 0, '', '', 0, 0, 0),
(4, 'DocInfo', '<strong>1</strong> Take any field from any document (fewer requests than GetField)', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/docinfo/snippet.docinfo.php\';\r\n', 0, '', '', 0, 0, 0),
(5, 'DocLister', '<strong>2.3.14</strong> Snippet to display the information of the tables by the description rules. The main goal - replacing Ditto and CatalogView', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DocLister.php\';\n', 0, '', '', 0, 0, 0),
(6, 'FormLister', '<strong>1.7.18</strong> Form processor', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/FormLister/snippet.FormLister.php\';\n', 0, '', '', 0, 0, 0),
(7, 'if', '<strong>1.3</strong> A simple conditional snippet. Allows for eq/neq/lt/gt/etc logic within templates, resources, chunks, etc.', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/if/snippet.if.php\';', 0, '', '', 0, 0, 0),
(8, 'phpthumb', '<strong>1.3</strong> PHPThumb creates thumbnails and altered images on the fly and caches them', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/phpthumb/snippet.phpthumb.php\';\r\n', 0, '', '', 0, 0, 0),
(9, 'summary', '<strong>2.0.2</strong> Truncates the string to the specified length', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/summary/snippet.summary.php\';', 0, '', '', 0, 0, 0),
(24, 'ifsnippet', '', 0, 1, 0, '\nif (!isset($modx->snippetCache[$name])) {\n	return \'<p class=\"bg-danger\">For work \'.$name.\' in demo site you need install <b>\'.$name.\'</b> from <a href=\"\'.MODX_MANAGER_URL.\'#?a=112&id=2\">Extras</a> module</p>\';\n}', 0, '{}', ' ', 1509819147, 1509826185, 0),
(23, 'prepareBlog', '', 0, 1, 0, '\nif ($data[\'image\'] != \'\'){\n	$data[\'blog-image\'] = \'<img src=\"\'.$modx->runSnippet(\'phpthumb\', array(\'input\'=>$data[\'image\'], \'options\'=>\'w=600,h=280,zc=1\')).\'\" alt=\"\'.$data[\'pagetitle\'].\'\">\';\n}else{\n	$data[\'blog-image\'] = \'\';\n}\nreturn $data;', 0, '{}', ' ', 1507723822, 1509819933, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `evo_site_templates`
--

CREATE TABLE `evo_site_templates` (
  `id` int(10) NOT NULL,
  `templatename` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Template',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to icon file',
  `template_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-page,1-content',
  `content` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `selectable` tinyint(4) NOT NULL DEFAULT '1',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains the site templates.';

--
-- Дамп данных таблицы `evo_site_templates`
--

INSERT INTO `evo_site_templates` (`id`, `templatename`, `description`, `editor_type`, `category`, `icon`, `template_type`, `content`, `locked`, `selectable`, `createdon`, `editedon`) VALUES
(3, 'Minimal Template', 'Default minimal empty template (content returned only)', 0, 0, '', 0, '[*content*]', 0, 1, 0, 1524847355),
(4, 'EVO startup - Bootstrap', '<strong>1.0</strong> Sample template in Bootstrap', 0, 1, '', 0, '<!DOCTYPE html>\n<html lang=\"[(lang_code)]\">\n	<head>\n		<meta http-equiv=\"Content-Type\" content=\"text/html; charset=[(modx_charset)]\" /> \n		<title>[*titl*]</title>\n		[*noIndex*]\n		<meta name=\"keywords\" content=\"[*keyw*]\" />\n		<meta name=\"description\" content=\"[*desc*]\" />\n		<base href=\"[(site_url)]\"/>\n\n		<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n		<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n\n		<link href=\"[(site_url)][[if? &is=[(site_start)]:!=:[*id*] &then=`[~[*id*]~]`]]\" rel=\"canonical\">\n		<link href=\"https://fonts.googleapis.com/css?family=Open+Sans:400,700\" rel=\"stylesheet\" type=\"text/css\">	\n		<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css\">\n		<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css\">\n\n		<style> \n			html, body{background:#eee; font-family:\'Open Sans\',sans-serif; line-height:1.8; font-size:14px;}\n			a:focus{outline:none; outline-offset:0;}\n			h1{margin-top:15px;}\n\n			.logo{float:left;}\n			.logo img{ margin-top:10px; display:block; max-width:256px;}\n			\n			.dropdown-menu{border-radius:0; border:0;}\n			.dropdown-menu > li > a{padding-top:5px; padding-bottom:5px;}\n\n			.navbar-collapse.collapse.in{border-bottom:10px solid #eee;}\n			.navbar{min-height:0; background:#fff; margin-bottom:0;}\n			.navbar.nav{margin-left:0;}\n			.navbar.nav ul{padding-left:0;}\n			.navbar-nav{margin:0;}\n			.navbar-toggle{background:#fff; border:2px solid #eee; border-radius:0; position:fixed; z-index:99; right:0; top:7px; padding:12px 10px; margin-right:10px;}\n			.navbar .navbar-toggle .icon-bar{background-color:#333;}\n\n			.nav li a{text-transform:uppercase; color:#333; font-weight:500; font-size:110%;}\n			.nav li li a{text-transform:none; font-weight:normal; font-size:100%;}\n\n			.navbar{border:none; border-radius:0;}\n			#navbar{padding:0;}\n			ul.nav > li > a:hover{background-color:#f5f5f5;}\n\n			.affix{top:0px; width:100%; z-index:1000; background-color:#eee;}\n			.affix + .affspacer{display:block; height:50px;}\n\n			.box-shadow{-webkit-box-shadow:0 6px 12px rgba(0,0,0,.175); box-shadow:0 6px 12px rgba(0,0,0,.175);}\n\n			.container {max-width:970px; margin:0 12px;}\n			.top .col-sm-12{padding-left:0; padding-right:0;}\n\n			#ajaxSearch_input,\n			#username,\n			#password{width:100%!important;}\n			#forgotpsswd{clear:both;}\n			input.button[type=\"submit\"]{display:block;}\n			label.checkbox{display:inline-block; margin-left:10px;}\n			label, legend{font-weight:400;}\n			#ajaxSearch_form { position:relative; }\n			#searchClose { display:none !important; }\n			#indicator { position:absolute; top:9px; right:12px; z-index:10; opacity:.75; }\n\n			h2{font-size:22px;}\n			.bread{padding:1em 0 0 0;}\n			.mem{color:#aaa; text-align:center; padding:1em 0 2em;}\n\n			section.main .container{background-color:#fff; padding-bottom:20px;}\n			footer.footer .container{background-color:#000; color:#fff; line-height:40px;}\n\n			section.main .content ul{list-style:none; margin:0 0 1em 0; padding:0;}\n			section.main .content ul li{padding-left:1em;}\n			section.main .content ul li:before{content:\'\\2022\'; position:absolute; line-height:1.85em; margin-left:-1em;}\n\n			.breadcrumb {padding: 0px 0px;margin-bottom: 0px;list-style: none;background-color:#fff;border-radius: 0px;}	\n\n			.footer{text-align:center;}\n			.footer .text-right{text-align:center;}\n\n			/* JOT */\n			.jot-comment{padding:5px 10px;}\n			.jot-row-author{background-color:#dddddd;}\n			.jot-row-alt{background-color:#f9f9f9;}\n			.jot-row{background-color:#eeeeee;}\n			.jot-row-up{border:1px solid #333!important;}\n			.jot-row-up.panel-primary > .panel-heading{background-color:#333!important; border-color:#333!important;}\n			.jot-extra{font-size:75%;}\n			.jot-poster{font-size:inherit!important;}\n\n			.dl_summaryPost img{max-width:100%; height:auto; margin:10px 0 5px; display:block;}\n			.dl_summaryPost{padding-top:10px; padding-bottom:15px; border-bottom:1px solid #eee;}\n\n			.pagination b, .pagination a {padding: 5px;}	\n\n			div.errors{ color:#F00; }\n			#EmailForm .invalidValue{ background: #FFDFDF; border:1px solid #F00; }\n			#EmailForm .requiredValue{ background: #FFFFDF; border:1px solid #F00; }	\n\n			/* Larger than mobile */\n			@media (min-width:320px) {\n\n			}\n\n			/* Larger than phablet */\n			@media (min-width:480px) {\n\n			}\n\n			/* Larger than tablet */\n			@media (min-width:768px) {\n\n				.container{margin:0 auto;}\n				.logo{padding-left:15px;}\n				.logo img{ margin-top:10px; display:block; max-width:256px;}\n\n				.navbar{background:transparent;}\n				.navbar.affix{background:#eee;}\n				.navbar-collapse.collapse.in{border-bottom:0;}\n\n				.footer{text-align:left;}\n				.footer .text-right{text-align:right;}\n\n				.col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9 {padding-left:35px; padding-right:35px;}\n\n			}\n		</style>\n\n		<script src=\"https://code.jquery.com/jquery-2.2.3.min.js\"></script>\n	</head>\n	<body>\n		<section class=\"top\">\n			<div class=\"container\">\n				<div class=\"row\">\n					<div class=\"col-sm-12\" itemscope itemtype=\"http://schema.org/Organization\">\n\n						<a class=\"logo\" href=\"[~[(site_start)]~]\" title=\"[(site_name)]\" itemprop=\"url\">\n							<img src=\"[(site_url)]manager/media/style/default/images/misc/login-logo.png\" itemprop=\"logo\" alt=\"[(site_name)]\" />\n						</a>\n\n						<div class=\"clearfix\"></div>\n\n						<nav class=\"navbar\" role=\"navigation\" data-spy=\"affix\" data-offset-top=\"100\">\n\n							<div class=\"navbar-header\">\n								<button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#navbar\" aria-expanded=\"false\" aria-controls=\"navbar\">\n									<span class=\"sr-only\">Toggle navigation</span>\n									<span class=\"icon-bar\"></span>\n									<span class=\"icon-bar\"></span>\n									<span class=\"icon-bar\"></span>\n								</button>\n							</div>\n							<div id=\"navbar\" class=\"navbar-collapse collapse\">\n\n								[[DLMenu? \n								&parents=`0` \n								&maxDepth=`2` \n								&outerClass=`nav navbar-nav`\n								&hereClass=`active`\n								&innerTpl=`@CODE:<ul class=\"dropdown-menu\">[+wrap+]</ul>`\n								&parentRowTpl=`@CODE:<li class=\"dropdown\"><a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" title=\"[+title+]\">[+title+] <b class=\"caret\"></b></a>[+wrap+]</li>`\n								]]\n\n							</div>\n						</nav>\n						<div class=\"affspacer\"></div>\n\n					</div>\n				</div>\n			</div>\n		</section>\n\n		<section class=\"main\">\n			<div class=\"container\">\n\n				<div class=\"row\">\n					<div class=\"col-sm-12\">\n						<div class=\"bread\">\n							[[if? &is=`[*id*]:!=:[(site_start)]` &then=`\n								[[DLCrumbs? &showCurrent=`1`]]\n							`]]\n						</div>\n					</div>\n				</div>\n\n				<div class=\"row content\">\n\n					<div class=\"col-sm-8\">\n						<h1>[*#longtitle*]</h1>\n						[*#content*]\n						\n						[[if? &is=`[*parent*]:=:2` &then=`@TPL:Comments`]]\n					</div>\n\n					<aside class=\"col-sm-4\">\n						<div class=\"search\">\n							<h2>Search</h2>\n							[[ifsnippet? &name=`AjaxSearch`]]\n							[!AjaxSearch? \n							&ajaxSearch=`1` \n							&addJscript=`0` \n							&showIntro=`0` \n							&ajaxMax=`5` \n							&extract=`1`\n							&jscript=`jquery`\n							&tplInput=`AjaxSearch_tplInput`\n							&tplAjaxGrpResult=`AjaxSearch_tplAjaxGrpResult`\n							&tplAjaxResults=`AjaxSearch_tplAjaxResults`\n							&tplAjaxResult=`AjaxSearch_tplAjaxResult`\n							&showResults=`1`\n							&liveSearch=`0`\n							!]\n						</div>\n\n						<h2>News:</h2>\n						[[DocLister? \n						&parents=`2` \n						&display=`2`\n						&total=`20` \n						&tpl=`@CODE:<strong><a href=\"[+url+]\" title=\"[+e.title+]\">[+e.title+]</a></strong><br />\n						[+longtitle+]<br /><br />`\n						]]\n\n						<div>\n							<h2>Most Recent:</h2>\n\n							<ul>\n								[[DocLister? \n								&showInMenuOnly=`1` \n								&parents=`0`\n								&display=`5`\n								&tpl=`@CODE:<li><a href=\"[+url+]\" title=\"[+pagetitle+]\">[+pagetitle+]</a> <span class=\"date\">[+date+]</span></li>`\n								]]\n							</ul>\n\n						</div>\n						\n					</aside>\n				</div>\n			</div>\n\n		</section>\n\n		<footer class=\"footer\">\n			<div class=\"container\">\n				<div class=\"row\">\n					<div class=\"col-sm-6\">\n						<a href=\"https://evo.im\" title=\"Learn more about EVO\">EVO</a> Starter-Template &copy;2006-[[$_SERVER[\'REQUEST_TIME\']:dateFormat=`Y` ]]\n					</div>\n					<div class=\"col-sm-6 text-right\">\n						Built with <a href=\"http://www.getbootstrap.com\" target=\"_blank\">Bootstrap</a> framework.\n					</div>\n				</div>\n			</div>\n		</footer>\n\n		<div class=\"container mem\">\n			<small>Memory: [^m^], MySQL: [^qt^], [^q^] request(s), PHP: [^p^], total: [^t^], document retrieved from [^s^]. </small>\n		</div>\n\n		<!-- Scripts\n–––––––––––––––––––––––––––––––––––––––––––––––––– -->	\n\n		<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js\"></script>\n		<!--[if lt IE 9]>\n<script src=\"https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js\"></script>\n<script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>\n<![endif]-->\n\n	</body>\n</html>', 0, 1, 0, 1509819347),
(5, 'electron', 'Шаблон подготовлен Electron для компании КирпичЪ', 0, 2, '', 0, '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>[* pagetitle *]</title>\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"assets/css/app.css\">\r\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"assets/css/iziModal.min.css\">\r\n	<script type=\"text/javascript\" src=\"assets/js/common.js\"></script>\r\n</head>\r\n<body>\r\n    <div class=\"main\">\r\n        {{header}}\r\n        {{products}}\r\n        {{sertifics}}\r\n        {{calc}}\r\n        {{partners}}\r\n        {{guarant}}\r\n        {{work}}\r\n        {{offers}}\r\n        {{ask}}\r\n        <section class=\"map\" id=\"map\">\r\n            [*mapScript*]\r\n        </section>\r\n        {{footer}}\r\n    </div>\r\n    {{modals}}\r\n\r\n    <script type=\"text/javascript\" src=\"assets/js/app.js\"></script>\r\n</body>\r\n</html>', 0, 1, 1524841700, 1525292652),
(13, 'Товар (плитка)', 'Шаблон товара (плитка)', 0, 12, '', 0, '', 0, 1, 1524957406, 1524958284),
(14, 'Размер кирпича', 'Размер кирпича', 0, 12, '', 0, '', 0, 1, 1525097645, 1525113183),
(15, 'Вид кирпича', 'Выберите вид', 0, 12, '', 0, '', 0, 1, 1525113020, 1525113197),
(16, 'Форма крипича', 'Выберите форму', 0, 12, '', 0, '', 0, 1, 1525121467, 1525121467),
(17, 'Слайд в слайдере (кирпич + плитка + элементы)', '', 0, 9, '', 0, '', 0, 1, 1525122966, 1525124194),
(18, 'Товар (элемент)', 'Шаблон товара (элемент)', 0, 12, '', 0, '', 0, 1, 1525175958, 1525176309),
(11, 'Слайд в слайдере (отзывы)', '', 0, 9, '', 0, '', 0, 1, 1524940235, 1524940238),
(12, 'Untitled template', '', 0, 0, '', 0, '', 0, 1, 1524940240, 1524940240),
(9, 'Слайд в слайдере (сертификаты)', '', 0, 9, '', 0, '', 0, 1, 1524928374, 1524928407),
(10, 'Партнер', '', 0, 10, '', 0, '', 0, 1, 1524937746, 1524937790),
(8, 'Слайд в слайдере (шапка)', 'Слайд в слайдере (шапка)', 0, 9, '', 0, '', 0, 1, 1524918741, 1524928417);

-- --------------------------------------------------------

--
-- Структура таблицы `evo_site_tmplvars`
--

CREATE TABLE `evo_site_tmplvars` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `caption` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `elements` text,
  `rank` int(11) NOT NULL DEFAULT '0',
  `display` varchar(20) NOT NULL DEFAULT '' COMMENT 'Display Control',
  `display_params` text COMMENT 'Display Control Properties',
  `default_text` text,
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables';

--
-- Дамп данных таблицы `evo_site_tmplvars`
--

INSERT INTO `evo_site_tmplvars` (`id`, `type`, `name`, `caption`, `description`, `editor_type`, `category`, `locked`, `elements`, `rank`, `display`, `display_params`, `default_text`, `createdon`, `editedon`) VALUES
(1, 'textarea', 'desc', 'Meta description', 'Meta description', 0, 1, 0, '', 0, '', '', '[*introtext*]', 0, 0),
(2, 'text', 'keyw', 'Meta keywords', 'Meta keywords', 0, 1, 0, '', 0, '', '', '[*pagetitle*]', 0, 0),
(3, 'checkbox', 'noIndex', 'No index page', 'Meta robots', 0, 1, 0, 'Нет==<meta name=\"robots\" content=\"noindex, nofollow\">', 0, '', '', '', 0, 0),
(4, 'text', 'titl', 'Meta title', 'Meta title', 0, 1, 0, '', 0, '', '', '[*pagetitle*] - [(site_name)]', 0, 0),
(6, 'image', 'headerSliderImg', 'Изображения слайда в шапке', '', 0, 9, 0, '', 0, '', '&cpad=1&cspace=1&psize=100&ploc=top-right&egmsg=No records found&w=100%&h=300px&edt=TinyMCE4&output=[+value+]&width=100&height=100&borsize=1&align=none', '', 1524918648, 1524921615),
(7, 'image', 'sertSliderImg', 'sertSliderImg', '', 0, 9, 0, '', 0, '', '', '', 1524928517, 1524928517),
(8, 'image', 'partnerImg', 'Логотип партнера', '', 0, 10, 0, '', 0, '', '', '', 1524937752, 1524937757),
(9, 'text', 'phone', 'phone', '', 0, 10, 0, '', 0, '', '', '', 1524938444, 1524938444),
(10, 'text', 'mapScript', 'Карта', 'Вставьте код карты, полученной путем генерации на Яндекс или Гугл картах (желательна ширина 100%)', 0, 10, 0, '', 2, '', '', '', 1524939924, 1524939924),
(11, 'image', 'offerSliderImg', 'Изображение слайда с отзывами', '', 0, 9, 0, '', 0, '', '', '', 1524940363, 1524958179),
(12, 'text', 'address', 'address', '', 0, 10, 0, '', 0, '', '', '', 1524943744, 1524943744),
(13, 'image', 'plitImg', 'Изображение товара (плитка)', '', 0, 12, 0, '', 0, '', '', '', 1524957780, 1524958129),
(14, 'text', 'plitColor', 'Цвет товара (плитка)', 'К примеру, Серый', 0, 12, 0, '', 0, '', '', '', 1524957812, 1524958070),
(15, 'text', 'plitSize', 'Размеры товара (плитка)', '250x20x120 мм', 0, 12, 0, '', 0, '', '', '', 1524957840, 1524958154),
(16, 'text', 'plitWeight', 'Вес товара', 'К примеру - 1,7 кг', 0, 12, 0, '', 0, '', '', '', 1524957880, 1524958170),
(17, 'text', 'plitCount', 'Количество товара (плитка)', 'В поддоне: 576 шт', 0, 12, 0, '', 0, '', '', '', 1524957926, 1524958104),
(18, 'text', 'plitHeft', 'Вес поддона (плитка)', 'Вес поддона: 950 ', 0, 12, 0, '', 0, '', '', '', 1524957972, 1524958116),
(19, 'text', 'plitPrice', 'Стоимость товара (плитка)', 'Стоимость товара за - руб./м2. К примеру, 544,00', 0, 12, 0, '', 0, '', '', '', 1524958043, 1525192905),
(20, 'image', 'stoneViewImgWB', 'Изображение вида кирпича - черно белое', '', 0, 12, 0, '', 0, '', '', '', 1525113094, 1525113556),
(21, 'image', 'stoneViewImgColor', 'Изображение вида кирпича - цветное', '', 0, 12, 0, '', 0, '', '', '', 1525113265, 1525121930),
(22, 'image', 'stoneFormImgWB', 'Изображение формы кирпича - черно белое', '', 0, 12, 0, '', 0, '', '', '', 1525121511, 1525121582),
(23, 'image', 'stoneFormImgColor', 'Изображение формы кирпича - цветное', '', 0, 12, 0, '', 0, '', '', '', 1525121549, 1525121573),
(24, 'image', 'stoneSlideImg', 'Слайд в слайдере \"Как можно использовать нашу продукцию\"  (кирпич)', '', 0, 9, 0, '', 0, '', '', '', 1525123088, 1525124896),
(25, 'image', 'elemImg', 'Изображение товара (элемент)', '', 0, 12, 0, '', 0, '', '', '', 1525176052, 1525176180),
(26, 'text', 'elemSize', 'Размер товара (элемент)', '', 0, 12, 0, '', 0, '', '', '', 1525176113, 1525176200),
(27, 'text', 'elemWeight', 'Вес товара (элемент)', '', 0, 12, 0, '', 0, '', '', '', 1525176236, 1525176236);

-- --------------------------------------------------------

--
-- Структура таблицы `evo_site_tmplvar_access`
--

CREATE TABLE `evo_site_tmplvar_access` (
  `id` int(10) NOT NULL,
  `tmplvarid` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for template variable access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `evo_site_tmplvar_contentvalues`
--

CREATE TABLE `evo_site_tmplvar_contentvalues` (
  `id` int(11) NOT NULL,
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `contentid` int(10) NOT NULL DEFAULT '0' COMMENT 'Site Content Id',
  `value` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Content Values Link Table';

--
-- Дамп данных таблицы `evo_site_tmplvar_contentvalues`
--

INSERT INTO `evo_site_tmplvar_contentvalues` (`id`, `tmplvarid`, `contentid`, `value`) VALUES
(1, 3, 9, 'demo miniblog howto tutorial posting'),
(2, 3, 18, 'demo older posting'),
(3, 8, 9, 'assets/images/evo-logo.png'),
(5, 6, 55, 'assets/images/icon_01.png'),
(6, 6, 56, 'assets/images/icon_02.png'),
(7, 6, 57, 'assets/images/icon_03.png'),
(8, 6, 58, 'assets/images/icon_04.png'),
(9, 7, 60, 'assets/images/sert_1.png'),
(10, 7, 61, 'assets/images/sert_2.png'),
(11, 7, 62, 'assets/images/sert_3.png'),
(12, 8, 64, 'assets/images/part_01.png'),
(13, 8, 65, 'assets/images/part_02.png'),
(14, 8, 66, 'assets/images/part_03.png'),
(15, 8, 67, 'assets/images/part_04.png'),
(16, 8, 68, 'assets/images/part_05.png'),
(17, 8, 69, 'assets/images/part_06.png'),
(18, 8, 70, 'assets/images/part_07.png'),
(19, 8, 71, 'assets/images/part_08.png'),
(20, 9, 1, '8 800 0123 456'),
(21, 10, 1, '<script type=\"text/javascript\" charset=\"utf-8\" async src=\"https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A62dc1368f1bdc660b2ccef8739b3d8241be7afa5da97d4ee5397e5620012c202&amp;width=100%25&amp;height=700&amp;lang=ru_RU&amp;scroll=true\"></script>'),
(22, 11, 73, 'assets/images/offer_1.png'),
(23, 11, 74, 'assets/images/offer_2.png'),
(24, 11, 75, 'assets/images/offer_3.png'),
(25, 12, 1, 'г. Ижевск, ул. Четырнадцатая, 135'),
(26, 13, 77, 'assets/images/plit_1.png'),
(27, 14, 77, 'Серый'),
(28, 15, 77, '250x20x120 мм'),
(29, 16, 77, '1,7 кг'),
(30, 17, 77, '576 шт'),
(31, 18, 77, '950'),
(32, 19, 77, '544,00'),
(33, 20, 96, 'assets/images/polnotel_no_act.png'),
(34, 21, 96, 'assets/images/polnotel_act.png'),
(35, 20, 97, 'assets/images/pustotel_no_act.png'),
(36, 21, 97, 'assets/images/pustotel_act.png'),
(37, 20, 98, 'assets/images/fason_no_act.png'),
(38, 21, 98, 'assets/images/fason_act.png'),
(39, 22, 100, 'assets/images/ugol_no_act.png'),
(40, 23, 100, 'assets/images/ugol_act.png'),
(41, 22, 101, 'assets/images/brus_no_act.png'),
(42, 23, 101, 'assets/images/brus_act.png'),
(43, 22, 102, 'assets/images/doubleside_no_act.png'),
(44, 23, 102, 'assets/images/doubleside_act.png'),
(45, 22, 103, 'assets/images/fig1_no_act.png'),
(46, 23, 103, 'assets/images/fig1_act.png'),
(47, 22, 104, 'assets/images/fig2_no_act.png'),
(48, 23, 104, 'assets/images/fig2_act.png'),
(49, 22, 105, 'assets/images/trap1_no_act.png'),
(50, 23, 105, 'assets/images/trap1_act.png'),
(51, 22, 106, 'assets/images/trap2_no_act.png'),
(52, 23, 106, 'assets/images/trap2_act.png'),
(53, 22, 107, 'assets/images/trap3_no_act.png'),
(54, 23, 107, 'assets/images/trap3_act.png'),
(55, 24, 109, 'assets/images/stone__img.jpg'),
(56, 24, 110, 'assets/images/stone__img.jpg'),
(57, 24, 113, 'assets/images/plit_slider_1.png'),
(58, 24, 114, 'assets/images/plit_slider_2.png'),
(59, 24, 115, 'assets/images/plit_slider_4.png'),
(60, 24, 116, 'assets/images/plit_slider_4.png'),
(61, 25, 119, 'assets/images/elem_1.png'),
(62, 26, 119, '420х400 мм.'),
(63, 27, 119, '30 кг.'),
(64, 19, 119, '2000'),
(65, 24, 121, 'assets/images/elem_slide_1.png'),
(66, 24, 122, 'assets/images/elem_slide_2.png'),
(67, 24, 123, 'assets/images/elem_slide_3.png'),
(68, 24, 124, 'assets/images/elem_slide_4.png');

-- --------------------------------------------------------

--
-- Структура таблицы `evo_site_tmplvar_templates`
--

CREATE TABLE `evo_site_tmplvar_templates` (
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `templateid` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Templates Link Table';

--
-- Дамп данных таблицы `evo_site_tmplvar_templates`
--

INSERT INTO `evo_site_tmplvar_templates` (`tmplvarid`, `templateid`, `rank`) VALUES
(7, 9, 0),
(6, 8, 1),
(8, 10, 0),
(9, 5, 0),
(10, 5, 0),
(11, 11, 0),
(12, 5, 0),
(13, 13, 0),
(14, 13, 0),
(20, 15, 0),
(16, 13, 0),
(17, 13, 0),
(18, 13, 0),
(19, 13, 0),
(15, 13, 0),
(21, 15, 0),
(22, 16, 0),
(23, 16, 0),
(24, 17, 0),
(25, 18, 0),
(26, 18, 0),
(27, 18, 0),
(19, 18, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `evo_system_eventnames`
--

CREATE TABLE `evo_system_eventnames` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `service` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'System Service number',
  `groupname` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='System Event Names.';

--
-- Дамп данных таблицы `evo_system_eventnames`
--

INSERT INTO `evo_system_eventnames` (`id`, `name`, `service`, `groupname`) VALUES
(1, 'OnDocPublished', 5, ''),
(2, 'OnDocUnPublished', 5, ''),
(3, 'OnWebPagePrerender', 5, ''),
(4, 'OnWebLogin', 3, ''),
(5, 'OnBeforeWebLogout', 3, ''),
(6, 'OnWebLogout', 3, ''),
(7, 'OnWebSaveUser', 3, ''),
(8, 'OnWebDeleteUser', 3, ''),
(9, 'OnWebChangePassword', 3, ''),
(10, 'OnWebCreateGroup', 3, ''),
(11, 'OnManagerLogin', 2, ''),
(12, 'OnBeforeManagerLogout', 2, ''),
(13, 'OnManagerLogout', 2, ''),
(14, 'OnManagerSaveUser', 2, ''),
(15, 'OnManagerDeleteUser', 2, ''),
(16, 'OnManagerChangePassword', 2, ''),
(17, 'OnManagerCreateGroup', 2, ''),
(18, 'OnBeforeCacheUpdate', 4, ''),
(19, 'OnCacheUpdate', 4, ''),
(107, 'OnMakePageCacheKey', 4, ''),
(20, 'OnLoadWebPageCache', 4, ''),
(21, 'OnBeforeSaveWebPageCache', 4, ''),
(22, 'OnChunkFormPrerender', 1, 'Chunks'),
(23, 'OnChunkFormRender', 1, 'Chunks'),
(24, 'OnBeforeChunkFormSave', 1, 'Chunks'),
(25, 'OnChunkFormSave', 1, 'Chunks'),
(26, 'OnBeforeChunkFormDelete', 1, 'Chunks'),
(27, 'OnChunkFormDelete', 1, 'Chunks'),
(28, 'OnDocFormPrerender', 1, 'Documents'),
(29, 'OnDocFormRender', 1, 'Documents'),
(30, 'OnBeforeDocFormSave', 1, 'Documents'),
(31, 'OnDocFormSave', 1, 'Documents'),
(32, 'OnBeforeDocFormDelete', 1, 'Documents'),
(33, 'OnDocFormDelete', 1, 'Documents'),
(1033, 'OnDocFormUnDelete', 1, 'Documents'),
(1034, 'onBeforeMoveDocument', 1, 'Documents'),
(1035, 'onAfterMoveDocument', 1, 'Documents'),
(34, 'OnPluginFormPrerender', 1, 'Plugins'),
(35, 'OnPluginFormRender', 1, 'Plugins'),
(36, 'OnBeforePluginFormSave', 1, 'Plugins'),
(37, 'OnPluginFormSave', 1, 'Plugins'),
(38, 'OnBeforePluginFormDelete', 1, 'Plugins'),
(39, 'OnPluginFormDelete', 1, 'Plugins'),
(40, 'OnSnipFormPrerender', 1, 'Snippets'),
(41, 'OnSnipFormRender', 1, 'Snippets'),
(42, 'OnBeforeSnipFormSave', 1, 'Snippets'),
(43, 'OnSnipFormSave', 1, 'Snippets'),
(44, 'OnBeforeSnipFormDelete', 1, 'Snippets'),
(45, 'OnSnipFormDelete', 1, 'Snippets'),
(46, 'OnTempFormPrerender', 1, 'Templates'),
(47, 'OnTempFormRender', 1, 'Templates'),
(48, 'OnBeforeTempFormSave', 1, 'Templates'),
(49, 'OnTempFormSave', 1, 'Templates'),
(50, 'OnBeforeTempFormDelete', 1, 'Templates'),
(51, 'OnTempFormDelete', 1, 'Templates'),
(52, 'OnTVFormPrerender', 1, 'Template Variables'),
(53, 'OnTVFormRender', 1, 'Template Variables'),
(54, 'OnBeforeTVFormSave', 1, 'Template Variables'),
(55, 'OnTVFormSave', 1, 'Template Variables'),
(56, 'OnBeforeTVFormDelete', 1, 'Template Variables'),
(57, 'OnTVFormDelete', 1, 'Template Variables'),
(58, 'OnUserFormPrerender', 1, 'Users'),
(59, 'OnUserFormRender', 1, 'Users'),
(60, 'OnBeforeUserFormSave', 1, 'Users'),
(61, 'OnUserFormSave', 1, 'Users'),
(62, 'OnBeforeUserFormDelete', 1, 'Users'),
(63, 'OnUserFormDelete', 1, 'Users'),
(64, 'OnWUsrFormPrerender', 1, 'Web Users'),
(65, 'OnWUsrFormRender', 1, 'Web Users'),
(66, 'OnBeforeWUsrFormSave', 1, 'Web Users'),
(67, 'OnWUsrFormSave', 1, 'Web Users'),
(68, 'OnBeforeWUsrFormDelete', 1, 'Web Users'),
(69, 'OnWUsrFormDelete', 1, 'Web Users'),
(70, 'OnSiteRefresh', 1, ''),
(71, 'OnFileManagerUpload', 1, ''),
(72, 'OnModFormPrerender', 1, 'Modules'),
(73, 'OnModFormRender', 1, 'Modules'),
(74, 'OnBeforeModFormDelete', 1, 'Modules'),
(75, 'OnModFormDelete', 1, 'Modules'),
(76, 'OnBeforeModFormSave', 1, 'Modules'),
(77, 'OnModFormSave', 1, 'Modules'),
(78, 'OnBeforeWebLogin', 3, ''),
(79, 'OnWebAuthentication', 3, ''),
(80, 'OnBeforeManagerLogin', 2, ''),
(81, 'OnManagerAuthentication', 2, ''),
(82, 'OnSiteSettingsRender', 1, 'System Settings'),
(83, 'OnFriendlyURLSettingsRender', 1, 'System Settings'),
(84, 'OnUserSettingsRender', 1, 'System Settings'),
(85, 'OnInterfaceSettingsRender', 1, 'System Settings'),
(86, 'OnMiscSettingsRender', 1, 'System Settings'),
(87, 'OnRichTextEditorRegister', 1, 'RichText Editor'),
(88, 'OnRichTextEditorInit', 1, 'RichText Editor'),
(89, 'OnManagerPageInit', 2, ''),
(90, 'OnWebPageInit', 5, ''),
(101, 'OnLoadDocumentObject', 5, ''),
(104, 'OnBeforeLoadDocumentObject', 5, ''),
(105, 'OnAfterLoadDocumentObject', 5, ''),
(91, 'OnLoadWebDocument', 5, ''),
(92, 'OnParseDocument', 5, ''),
(106, 'OnParseProperties', 5, ''),
(108, 'OnBeforeParseParams', 5, ''),
(93, 'OnManagerLoginFormRender', 2, ''),
(94, 'OnWebPageComplete', 5, ''),
(95, 'OnLogPageHit', 5, ''),
(96, 'OnBeforeManagerPageInit', 2, ''),
(97, 'OnBeforeEmptyTrash', 1, 'Documents'),
(98, 'OnEmptyTrash', 1, 'Documents'),
(99, 'OnManagerLoginFormPrerender', 2, ''),
(100, 'OnStripAlias', 1, 'Documents'),
(102, 'OnMakeDocUrl', 5, ''),
(103, 'OnBeforeLoadExtension', 5, ''),
(200, 'OnCreateDocGroup', 1, 'Documents'),
(201, 'OnManagerWelcomePrerender', 2, ''),
(202, 'OnManagerWelcomeHome', 2, ''),
(203, 'OnManagerWelcomeRender', 2, ''),
(204, 'OnBeforeDocDuplicate', 1, 'Documents'),
(205, 'OnDocDuplicate', 1, 'Documents'),
(206, 'OnManagerMainFrameHeaderHTMLBlock', 2, ''),
(207, 'OnManagerPreFrameLoader', 2, ''),
(208, 'OnManagerFrameLoader', 2, ''),
(209, 'OnManagerTreeInit', 2, ''),
(210, 'OnManagerTreePrerender', 2, ''),
(211, 'OnManagerTreeRender', 2, ''),
(212, 'OnManagerNodePrerender', 2, ''),
(213, 'OnManagerNodeRender', 2, ''),
(214, 'OnManagerMenuPrerender', 2, ''),
(215, 'OnManagerTopPrerender', 2, ''),
(224, 'OnDocFormTemplateRender', 1, 'Documents'),
(999, 'OnPageUnauthorized', 1, ''),
(1000, 'OnPageNotFound', 1, ''),
(1001, 'OnFileBrowserUpload', 1, 'File Browser Events');

-- --------------------------------------------------------

--
-- Структура таблицы `evo_system_settings`
--

CREATE TABLE `evo_system_settings` (
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains Content Manager settings.';

--
-- Дамп данных таблицы `evo_system_settings`
--

INSERT INTO `evo_system_settings` (`setting_name`, `setting_value`) VALUES
('settings_version', '1.4.3'),
('manager_theme', 'default'),
('server_offset_time', '0'),
('manager_language', 'russian-UTF8'),
('modx_charset', 'UTF-8'),
('site_name', 'Кирпич'),
('site_start', '1'),
('error_page', '1'),
('unauthorized_page', '1'),
('site_status', '1'),
('auto_template_logic', 'parent'),
('default_template', '3'),
('old_template', '3'),
('publish_default', '1'),
('friendly_urls', '1'),
('friendly_alias_urls', '1'),
('use_alias_path', '1'),
('cache_type', '2'),
('failed_login_attempts', '3'),
('blocked_minutes', '60'),
('use_captcha', '0'),
('emailsender', 'kazanzev2010@yandex.ru'),
('use_editor', '1'),
('use_browser', '1'),
('fe_editor_lang', 'russian-UTF8'),
('fck_editor_toolbar', 'standard'),
('fck_editor_autolang', '0'),
('editor_css_path', ''),
('editor_css_selectors', ''),
('upload_maxsize', '10485760'),
('manager_layout', '4'),
('auto_menuindex', '0'),
('session.cookie.lifetime', '604800'),
('mail_check_timeperiod', '600'),
('manager_direction', 'ltr'),
('xhtml_urls', '0'),
('automatic_alias', '1'),
('datetime_format', 'dd-mm-YYYY'),
('warning_visibility', '0'),
('remember_last_tab', '1'),
('enable_bindings', '1'),
('seostrict', '1'),
('number_of_results', '30'),
('theme_refresher', ''),
('show_picker', '0'),
('show_newresource_btn', '0'),
('show_fullscreen_btn', '0'),
('site_id', '5ae335de954f0'),
('site_unavailable_page', ''),
('reload_site_unavailable', ''),
('site_unavailable_message', 'В настоящее время сайт недоступен.'),
('siteunavailable_message_default', 'В настоящее время сайт недоступен.'),
('enable_filter', '0'),
('enable_at_syntax', '0'),
('cache_default', '1'),
('search_default', '0'),
('custom_contenttype', 'application/rss+xml,application/pdf,application/vnd.ms-word,application/vnd.ms-excel,text/html,text/css,text/xml,text/javascript,text/plain,application/json'),
('docid_incrmnt_method', '0'),
('enable_cache', '1'),
('minifyphp_incache', '0'),
('server_protocol', 'http'),
('rss_url_news', ''),
('track_visitors', '0'),
('top_howmany', '10'),
('friendly_url_prefix', ''),
('friendly_url_suffix', '.html'),
('make_folders', '0'),
('aliaslistingfolder', '0'),
('allow_duplicate_alias', '0'),
('use_udperms', '1'),
('udperms_allowroot', '0'),
('email_method', 'mail'),
('smtp_auth', '0'),
('smtp_secure', 'none'),
('smtp_host', 'smtp.example.com'),
('smtp_port', '25'),
('smtp_username', 'you@example.com'),
('reload_emailsubject', ''),
('emailsubject', 'Данные для авторизации'),
('emailsubject_default', 'Данные для авторизации'),
('reload_signupemail_message', ''),
('signupemail_message', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации в системе управления сайтом [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('system_email_signup_default', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации в системе управления сайтом [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('reload_websignupemail_message', ''),
('websignupemail_message', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('system_email_websignup_default', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('reload_system_email_webreminder_message', ''),
('webpwdreminder_message', 'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
('system_email_webreminder_default', 'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
('tree_page_click', '27'),
('use_breadcrumbs', '0'),
('global_tabs', '0'),
('group_tvs', '0'),
('resource_tree_node_name', 'pagetitle'),
('session_timeout', '15'),
('tree_show_protected', '0'),
('datepicker_offset', '-10'),
('number_of_logs', '100'),
('number_of_messages', '40'),
('which_editor', 'TinyMCE4'),
('tinymce4_theme', 'custom'),
('tinymce4_skin', 'lightgray'),
('tinymce4_template_docs', ''),
('tinymce4_template_chunks', ''),
('tinymce4_entermode', 'p'),
('tinymce4_element_format', 'xhtml'),
('tinymce4_schema', 'html5'),
('tinymce4_custom_plugins', 'advlist autolink lists link image charmap print preview hr anchor pagebreak searchreplace wordcount visualblocks visualchars code fullscreen spellchecker insertdatetime media nonbreaking save table contextmenu directionality emoticons template paste textcolor codesample colorpicker textpattern imagetools paste modxlink youtube'),
('tinymce4_custom_buttons1', 'undo redo | cut copy paste | searchreplace | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent blockquote | styleselect'),
('tinymce4_custom_buttons2', 'link unlink anchor image media codesample table | hr removeformat | subscript superscript charmap | nonbreaking | visualchars visualblocks print preview fullscreen code formatselect'),
('tinymce4_custom_buttons3', ''),
('tinymce4_custom_buttons4', ''),
('tinymce4_blockFormats', 'Paragraph=p;Header 1=h1;Header 2=h2;Header 3=h3'),
('allow_eval', 'with_scan'),
('safe_functions_at_eval', 'time,date,strtotime,strftime'),
('check_files_onlogin', 'index.php\r\n.htaccess\r\nmanager/index.php\r\nmanager/includes/config.inc.php'),
('validate_referer', '1'),
('rss_url_security', 'http://feeds.feedburner.com/evocms-security-news'),
('error_reporting', '1'),
('send_errormail', '0'),
('pwd_hash_algo', 'UNCRYPT'),
('reload_captcha_words', ''),
('captcha_words', 'EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('captcha_words_default', 'EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('filemanager_path', 'C:/server/data/htdocs/kirpich/kirpich/'),
('upload_files', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,fla,flv,swf,aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip,JPG,JPEG,PNG,GIF,svg'),
('upload_images', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,svg'),
('upload_media', 'au,avi,mp3,mp4,mpeg,mpg,wav,wmv'),
('upload_flash', 'fla,flv,swf'),
('new_file_permissions', '0644'),
('new_folder_permissions', '0755'),
('which_browser', 'mcpuk'),
('rb_webuser', '0'),
('rb_base_dir', 'C:/server/data/htdocs/kirpich/kirpich/assets/'),
('rb_base_url', 'assets/'),
('clean_uploaded_filename', '1'),
('strip_image_paths', '1'),
('maxImageWidth', '2600'),
('maxImageHeight', '2200'),
('thumbWidth', '150'),
('thumbHeight', '150'),
('thumbsDir', '.thumbs'),
('jpegQuality', '90'),
('denyZipDownload', '0'),
('denyExtensionRename', '0'),
('showHiddenFiles', '0'),
('lang_code', 'ru'),
('sys_files_checksum', 'a:4:{s:47:\"C:/server/data/htdocs/kirpich/kirpich/index.php\";s:32:\"cdc22609f8a321de87c7305a478d42aa\";s:47:\"C:/server/data/htdocs/kirpich/kirpich/.htaccess\";s:32:\"ca73883cf616cb5e53513ec0202995c9\";s:55:\"C:/server/data/htdocs/kirpich/kirpich/manager/index.php\";s:32:\"95efdfa243c95d259353257ebd2235b1\";s:69:\"C:/server/data/htdocs/kirpich/kirpich/manager/includes/config.inc.php\";s:32:\"9c92ae6ed0f4cd14ee9e4df11f760493\";}'),
('email_sender_method', '1'),
('manager_theme_mode', '3'),
('tinymce4_skintheme', 'inlite');

-- --------------------------------------------------------

--
-- Структура таблицы `evo_user_attributes`
--

CREATE TABLE `evo_user_attributes` (
  `id` int(10) NOT NULL,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(5) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains information about the backend users.';

--
-- Дамп данных таблицы `evo_user_attributes`
--

INSERT INTO `evo_user_attributes` (`id`, `internalKey`, `fullname`, `role`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `country`, `street`, `city`, `state`, `zip`, `fax`, `photo`, `comment`, `createdon`, `editedon`) VALUES
(1, 1, 'Admin', 1, 'kazanzev@ya.ru', '', '', 0, 0, 0, 7, 1525118019, 1525262072, 0, 'cdpo66arovbgnjd5du9ee8eteu', 0, 0, '', '', '', '', '', '', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `evo_user_messages`
--

CREATE TABLE `evo_user_messages` (
  `id` int(10) NOT NULL,
  `type` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(60) NOT NULL DEFAULT '',
  `message` text,
  `sender` int(10) NOT NULL DEFAULT '0',
  `recipient` int(10) NOT NULL DEFAULT '0',
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `postdate` int(20) NOT NULL DEFAULT '0',
  `messageread` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains messages for the Content Manager messaging system.';

-- --------------------------------------------------------

--
-- Структура таблицы `evo_user_roles`
--

CREATE TABLE `evo_user_roles` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `frames` int(1) NOT NULL DEFAULT '0',
  `home` int(1) NOT NULL DEFAULT '0',
  `view_document` int(1) NOT NULL DEFAULT '0',
  `new_document` int(1) NOT NULL DEFAULT '0',
  `save_document` int(1) NOT NULL DEFAULT '0',
  `publish_document` int(1) NOT NULL DEFAULT '0',
  `delete_document` int(1) NOT NULL DEFAULT '0',
  `empty_trash` int(1) NOT NULL DEFAULT '0',
  `action_ok` int(1) NOT NULL DEFAULT '0',
  `logout` int(1) NOT NULL DEFAULT '0',
  `help` int(1) NOT NULL DEFAULT '0',
  `messages` int(1) NOT NULL DEFAULT '0',
  `new_user` int(1) NOT NULL DEFAULT '0',
  `edit_user` int(1) NOT NULL DEFAULT '0',
  `logs` int(1) NOT NULL DEFAULT '0',
  `edit_parser` int(1) NOT NULL DEFAULT '0',
  `save_parser` int(1) NOT NULL DEFAULT '0',
  `edit_template` int(1) NOT NULL DEFAULT '0',
  `settings` int(1) NOT NULL DEFAULT '0',
  `credits` int(1) NOT NULL DEFAULT '0',
  `new_template` int(1) NOT NULL DEFAULT '0',
  `save_template` int(1) NOT NULL DEFAULT '0',
  `delete_template` int(1) NOT NULL DEFAULT '0',
  `edit_snippet` int(1) NOT NULL DEFAULT '0',
  `new_snippet` int(1) NOT NULL DEFAULT '0',
  `save_snippet` int(1) NOT NULL DEFAULT '0',
  `delete_snippet` int(1) NOT NULL DEFAULT '0',
  `edit_chunk` int(1) NOT NULL DEFAULT '0',
  `new_chunk` int(1) NOT NULL DEFAULT '0',
  `save_chunk` int(1) NOT NULL DEFAULT '0',
  `delete_chunk` int(1) NOT NULL DEFAULT '0',
  `empty_cache` int(1) NOT NULL DEFAULT '0',
  `edit_document` int(1) NOT NULL DEFAULT '0',
  `change_password` int(1) NOT NULL DEFAULT '0',
  `error_dialog` int(1) NOT NULL DEFAULT '0',
  `about` int(1) NOT NULL DEFAULT '0',
  `category_manager` int(1) NOT NULL DEFAULT '0',
  `file_manager` int(1) NOT NULL DEFAULT '0',
  `assets_files` int(1) NOT NULL DEFAULT '0',
  `assets_images` int(1) NOT NULL DEFAULT '0',
  `save_user` int(1) NOT NULL DEFAULT '0',
  `delete_user` int(1) NOT NULL DEFAULT '0',
  `save_password` int(11) NOT NULL DEFAULT '0',
  `edit_role` int(1) NOT NULL DEFAULT '0',
  `save_role` int(1) NOT NULL DEFAULT '0',
  `delete_role` int(1) NOT NULL DEFAULT '0',
  `new_role` int(1) NOT NULL DEFAULT '0',
  `access_permissions` int(1) NOT NULL DEFAULT '0',
  `bk_manager` int(1) NOT NULL DEFAULT '0',
  `new_plugin` int(1) NOT NULL DEFAULT '0',
  `edit_plugin` int(1) NOT NULL DEFAULT '0',
  `save_plugin` int(1) NOT NULL DEFAULT '0',
  `delete_plugin` int(1) NOT NULL DEFAULT '0',
  `new_module` int(1) NOT NULL DEFAULT '0',
  `edit_module` int(1) NOT NULL DEFAULT '0',
  `save_module` int(1) NOT NULL DEFAULT '0',
  `delete_module` int(1) NOT NULL DEFAULT '0',
  `exec_module` int(1) NOT NULL DEFAULT '0',
  `view_eventlog` int(1) NOT NULL DEFAULT '0',
  `delete_eventlog` int(1) NOT NULL DEFAULT '0',
  `new_web_user` int(1) NOT NULL DEFAULT '0',
  `edit_web_user` int(1) NOT NULL DEFAULT '0',
  `save_web_user` int(1) NOT NULL DEFAULT '0',
  `delete_web_user` int(1) NOT NULL DEFAULT '0',
  `web_access_permissions` int(1) NOT NULL DEFAULT '0',
  `view_unpublished` int(1) NOT NULL DEFAULT '0',
  `import_static` int(1) NOT NULL DEFAULT '0',
  `export_static` int(1) NOT NULL DEFAULT '0',
  `remove_locks` int(1) NOT NULL DEFAULT '0',
  `display_locks` int(1) NOT NULL DEFAULT '0',
  `change_resourcetype` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains information describing the user roles.';

--
-- Дамп данных таблицы `evo_user_roles`
--

INSERT INTO `evo_user_roles` (`id`, `name`, `description`, `frames`, `home`, `view_document`, `new_document`, `save_document`, `publish_document`, `delete_document`, `empty_trash`, `action_ok`, `logout`, `help`, `messages`, `new_user`, `edit_user`, `logs`, `edit_parser`, `save_parser`, `edit_template`, `settings`, `credits`, `new_template`, `save_template`, `delete_template`, `edit_snippet`, `new_snippet`, `save_snippet`, `delete_snippet`, `edit_chunk`, `new_chunk`, `save_chunk`, `delete_chunk`, `empty_cache`, `edit_document`, `change_password`, `error_dialog`, `about`, `category_manager`, `file_manager`, `assets_files`, `assets_images`, `save_user`, `delete_user`, `save_password`, `edit_role`, `save_role`, `delete_role`, `new_role`, `access_permissions`, `bk_manager`, `new_plugin`, `edit_plugin`, `save_plugin`, `delete_plugin`, `new_module`, `edit_module`, `save_module`, `delete_module`, `exec_module`, `view_eventlog`, `delete_eventlog`, `new_web_user`, `edit_web_user`, `save_web_user`, `delete_web_user`, `web_access_permissions`, `view_unpublished`, `import_static`, `export_static`, `remove_locks`, `display_locks`, `change_resourcetype`) VALUES
(2, 'Editor', 'Limited to managing content', 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1),
(3, 'Publisher', 'Editor with expanded permissions including manage users, update Elements and site settings', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1),
(1, 'Administrator', 'Site administrators have full access to all functions', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `evo_user_settings`
--

CREATE TABLE `evo_user_settings` (
  `user` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains backend user settings.';

-- --------------------------------------------------------

--
-- Структура таблицы `evo_webgroup_access`
--

CREATE TABLE `evo_webgroup_access` (
  `id` int(10) NOT NULL,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.';

--
-- Дамп данных таблицы `evo_webgroup_access`
--

INSERT INTO `evo_webgroup_access` (`id`, `webgroup`, `documentgroup`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `evo_webgroup_names`
--

CREATE TABLE `evo_webgroup_names` (
  `id` int(10) NOT NULL,
  `name` varchar(245) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.';

--
-- Дамп данных таблицы `evo_webgroup_names`
--

INSERT INTO `evo_webgroup_names` (`id`, `name`) VALUES
(1, 'Site Admins'),
(2, 'Registered Users');

-- --------------------------------------------------------

--
-- Структура таблицы `evo_web_groups`
--

CREATE TABLE `evo_web_groups` (
  `id` int(10) NOT NULL,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `webuser` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.';

--
-- Дамп данных таблицы `evo_web_groups`
--

INSERT INTO `evo_web_groups` (`id`, `webgroup`, `webuser`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `evo_web_users`
--

CREATE TABLE `evo_web_users` (
  `id` int(10) NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `cachepwd` varchar(100) NOT NULL DEFAULT '' COMMENT 'Store new unconfirmed password'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `evo_web_users`
--

INSERT INTO `evo_web_users` (`id`, `username`, `password`, `cachepwd`) VALUES
(1, 'siteadmin', '5f4dcc3b5aa765d61d8327deb882cf99', '');

-- --------------------------------------------------------

--
-- Структура таблицы `evo_web_user_attributes`
--

CREATE TABLE `evo_web_user_attributes` (
  `id` int(10) NOT NULL,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(25) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains information for web users.';

--
-- Дамп данных таблицы `evo_web_user_attributes`
--

INSERT INTO `evo_web_user_attributes` (`id`, `internalKey`, `fullname`, `role`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `country`, `street`, `city`, `state`, `zip`, `fax`, `photo`, `comment`, `createdon`, `editedon`) VALUES
(1, 1, 'Site Admin', 0, 'you@example.com', '', '', 0, 0, 0, 25, 1129049624, 1129063123, 0, 'f426f3209310abfddf2ee00e929774b4', 0, 0, '', '', '', '', '', '', '', '', 1524839236, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `evo_web_user_settings`
--

CREATE TABLE `evo_web_user_settings` (
  `webuser` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains web user settings.';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `evo_active_users`
--
ALTER TABLE `evo_active_users`
  ADD PRIMARY KEY (`sid`);

--
-- Индексы таблицы `evo_active_user_locks`
--
ALTER TABLE `evo_active_user_locks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_element_id` (`elementType`,`elementId`,`sid`);

--
-- Индексы таблицы `evo_active_user_sessions`
--
ALTER TABLE `evo_active_user_sessions`
  ADD PRIMARY KEY (`sid`);

--
-- Индексы таблицы `evo_categories`
--
ALTER TABLE `evo_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `evo_documentgroup_names`
--
ALTER TABLE `evo_documentgroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `evo_document_groups`
--
ALTER TABLE `evo_document_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_dg_id` (`document_group`,`document`),
  ADD KEY `document` (`document`),
  ADD KEY `document_group` (`document_group`);

--
-- Индексы таблицы `evo_event_log`
--
ALTER TABLE `evo_event_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Индексы таблицы `evo_jot_content`
--
ALTER TABLE `evo_jot_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `secip` (`secip`),
  ADD KEY `tagidx` (`tagid`),
  ADD KEY `uparent` (`uparent`);

--
-- Индексы таблицы `evo_jot_subscriptions`
--
ALTER TABLE `evo_jot_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uparent` (`uparent`),
  ADD KEY `tagid` (`tagid`),
  ADD KEY `userid` (`userid`);

--
-- Индексы таблицы `evo_manager_log`
--
ALTER TABLE `evo_manager_log`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `evo_manager_users`
--
ALTER TABLE `evo_manager_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `evo_membergroup_access`
--
ALTER TABLE `evo_membergroup_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `evo_membergroup_names`
--
ALTER TABLE `evo_membergroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `evo_member_groups`
--
ALTER TABLE `evo_member_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_group_member` (`user_group`,`member`);

--
-- Индексы таблицы `evo_site_content`
--
ALTER TABLE `evo_site_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `aliasidx` (`alias`),
  ADD KEY `typeidx` (`type`);
ALTER TABLE `evo_site_content` ADD FULLTEXT KEY `content_ft_idx` (`pagetitle`,`description`,`content`);

--
-- Индексы таблицы `evo_site_htmlsnippets`
--
ALTER TABLE `evo_site_htmlsnippets`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `evo_site_modules`
--
ALTER TABLE `evo_site_modules`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `evo_site_module_access`
--
ALTER TABLE `evo_site_module_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `evo_site_module_depobj`
--
ALTER TABLE `evo_site_module_depobj`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `evo_site_plugins`
--
ALTER TABLE `evo_site_plugins`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `evo_site_plugin_events`
--
ALTER TABLE `evo_site_plugin_events`
  ADD PRIMARY KEY (`pluginid`,`evtid`);

--
-- Индексы таблицы `evo_site_snippets`
--
ALTER TABLE `evo_site_snippets`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `evo_site_templates`
--
ALTER TABLE `evo_site_templates`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `evo_site_tmplvars`
--
ALTER TABLE `evo_site_tmplvars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indx_rank` (`rank`);

--
-- Индексы таблицы `evo_site_tmplvar_access`
--
ALTER TABLE `evo_site_tmplvar_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `evo_site_tmplvar_contentvalues`
--
ALTER TABLE `evo_site_tmplvar_contentvalues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_tvid_contentid` (`tmplvarid`,`contentid`),
  ADD KEY `idx_tmplvarid` (`tmplvarid`),
  ADD KEY `idx_id` (`contentid`);
ALTER TABLE `evo_site_tmplvar_contentvalues` ADD FULLTEXT KEY `value_ft_idx` (`value`);

--
-- Индексы таблицы `evo_site_tmplvar_templates`
--
ALTER TABLE `evo_site_tmplvar_templates`
  ADD PRIMARY KEY (`tmplvarid`,`templateid`);

--
-- Индексы таблицы `evo_system_eventnames`
--
ALTER TABLE `evo_system_eventnames`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `evo_system_settings`
--
ALTER TABLE `evo_system_settings`
  ADD PRIMARY KEY (`setting_name`);

--
-- Индексы таблицы `evo_user_attributes`
--
ALTER TABLE `evo_user_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`internalKey`);

--
-- Индексы таблицы `evo_user_messages`
--
ALTER TABLE `evo_user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `evo_user_roles`
--
ALTER TABLE `evo_user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `evo_user_settings`
--
ALTER TABLE `evo_user_settings`
  ADD PRIMARY KEY (`user`,`setting_name`),
  ADD KEY `setting_name` (`setting_name`),
  ADD KEY `user` (`user`);

--
-- Индексы таблицы `evo_webgroup_access`
--
ALTER TABLE `evo_webgroup_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `evo_webgroup_names`
--
ALTER TABLE `evo_webgroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `evo_web_groups`
--
ALTER TABLE `evo_web_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_group_user` (`webgroup`,`webuser`);

--
-- Индексы таблицы `evo_web_users`
--
ALTER TABLE `evo_web_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `evo_web_user_attributes`
--
ALTER TABLE `evo_web_user_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`internalKey`);

--
-- Индексы таблицы `evo_web_user_settings`
--
ALTER TABLE `evo_web_user_settings`
  ADD PRIMARY KEY (`webuser`,`setting_name`),
  ADD KEY `setting_name` (`setting_name`),
  ADD KEY `webuserid` (`webuser`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `evo_active_user_locks`
--
ALTER TABLE `evo_active_user_locks`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;
--
-- AUTO_INCREMENT для таблицы `evo_categories`
--
ALTER TABLE `evo_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `evo_documentgroup_names`
--
ALTER TABLE `evo_documentgroup_names`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `evo_document_groups`
--
ALTER TABLE `evo_document_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `evo_event_log`
--
ALTER TABLE `evo_event_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `evo_jot_content`
--
ALTER TABLE `evo_jot_content`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `evo_jot_subscriptions`
--
ALTER TABLE `evo_jot_subscriptions`
  MODIFY `id` mediumint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `evo_manager_log`
--
ALTER TABLE `evo_manager_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1830;
--
-- AUTO_INCREMENT для таблицы `evo_manager_users`
--
ALTER TABLE `evo_manager_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `evo_membergroup_access`
--
ALTER TABLE `evo_membergroup_access`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `evo_membergroup_names`
--
ALTER TABLE `evo_membergroup_names`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `evo_member_groups`
--
ALTER TABLE `evo_member_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `evo_site_content`
--
ALTER TABLE `evo_site_content`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
--
-- AUTO_INCREMENT для таблицы `evo_site_htmlsnippets`
--
ALTER TABLE `evo_site_htmlsnippets`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT для таблицы `evo_site_modules`
--
ALTER TABLE `evo_site_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `evo_site_module_access`
--
ALTER TABLE `evo_site_module_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `evo_site_module_depobj`
--
ALTER TABLE `evo_site_module_depobj`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `evo_site_plugins`
--
ALTER TABLE `evo_site_plugins`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT для таблицы `evo_site_snippets`
--
ALTER TABLE `evo_site_snippets`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT для таблицы `evo_site_templates`
--
ALTER TABLE `evo_site_templates`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT для таблицы `evo_site_tmplvars`
--
ALTER TABLE `evo_site_tmplvars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT для таблицы `evo_site_tmplvar_access`
--
ALTER TABLE `evo_site_tmplvar_access`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `evo_site_tmplvar_contentvalues`
--
ALTER TABLE `evo_site_tmplvar_contentvalues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT для таблицы `evo_system_eventnames`
--
ALTER TABLE `evo_system_eventnames`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1036;
--
-- AUTO_INCREMENT для таблицы `evo_user_attributes`
--
ALTER TABLE `evo_user_attributes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `evo_user_messages`
--
ALTER TABLE `evo_user_messages`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `evo_user_roles`
--
ALTER TABLE `evo_user_roles`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `evo_webgroup_access`
--
ALTER TABLE `evo_webgroup_access`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `evo_webgroup_names`
--
ALTER TABLE `evo_webgroup_names`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `evo_web_groups`
--
ALTER TABLE `evo_web_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `evo_web_users`
--
ALTER TABLE `evo_web_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `evo_web_user_attributes`
--
ALTER TABLE `evo_web_user_attributes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
