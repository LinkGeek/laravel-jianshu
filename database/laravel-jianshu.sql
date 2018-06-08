/*
Navicat MySQL Data Transfer

Source Server         : centos
Source Server Version : 50722
Source Host           : 123.207.66.58:3306
Source Database       : laravel-jianshu

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-06-08 17:37:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_permission_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission_role`;
CREATE TABLE `admin_permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_permission_role
-- ----------------------------
INSERT INTO `admin_permission_role` VALUES ('1', '1', '1', null, null);
INSERT INTO `admin_permission_role` VALUES ('2', '5', '1', null, null);
INSERT INTO `admin_permission_role` VALUES ('3', '3', '2', null, null);
INSERT INTO `admin_permission_role` VALUES ('4', '3', '1', null, null);
INSERT INTO `admin_permission_role` VALUES ('5', '4', '1', null, null);

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES ('1', 'systerm', '系统管理', '2018-06-08 11:39:56', '2018-06-08 11:39:56');
INSERT INTO `admin_permissions` VALUES ('3', 'article', '文章管理', '2018-06-08 11:45:01', '2018-06-08 11:45:01');
INSERT INTO `admin_permissions` VALUES ('4', 'topic', '专题管理', '2018-06-08 11:45:45', '2018-06-08 11:45:45');
INSERT INTO `admin_permissions` VALUES ('5', 'notice', '通知管理', '2018-06-08 11:46:05', '2018-06-08 11:46:05');

-- ----------------------------
-- Table structure for admin_role_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_user`;
CREATE TABLE `admin_role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_role_user
-- ----------------------------
INSERT INTO `admin_role_user` VALUES ('1', '1', '1');
INSERT INTO `admin_role_user` VALUES ('2', '2', '2');
INSERT INTO `admin_role_user` VALUES ('3', '2', '3');

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('1', 'systermManger', '系统管理员', '2018-06-08 13:44:53', '2018-06-08 13:44:53');
INSERT INTO `admin_roles` VALUES ('2', 'articleManager', '文章管理员', '2018-06-08 14:00:40', '2018-06-08 14:00:40');

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('1', 'admin', '$2y$10$g9jNK2NSm0FehYANzOe9Lu.y09mr59W3ivc.vkN3DDvNPOpS.xK3G', '5G5UHbD2BGQA8uYZCHunnGPaX4aUIZ3q7O0Wvb113RGvbNsS2RSpEv1qP3x7', '2018-05-30 10:13:32', '2018-05-30 10:13:35');
INSERT INTO `admin_users` VALUES ('2', 'hezhan', '$2y$10$KTgTWlKko9d8fZ2d6u/FCuJDHLzc7JMbg2dhSAvgpy18z6WFx0q7K', '9qoP9IlDYCAETZbcD8Ppgu1uoA8yIEe8SK8J2GuyyZw0tdPEMkz5tUSMsFoe', '2018-06-05 09:09:10', '2018-06-05 09:09:10');
INSERT INTO `admin_users` VALUES ('3', 'test', '$2y$10$uieYMnJiOmubLsznrBpAPuna/7SDd2pHpnUM2mJyJh80LjPWnhCXi', 'MH8QG0TcOEHJyTcghjwBix1X9KbLgfUHd2MYRlys7XH4LatL3c0XgazAHVBL', '2018-06-05 09:21:09', '2018-06-05 09:21:09');

-- ----------------------------
-- Table structure for article_topics
-- ----------------------------
DROP TABLE IF EXISTS `article_topics`;
CREATE TABLE `article_topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of article_topics
-- ----------------------------
INSERT INTO `article_topics` VALUES ('1', '1', '1', '2018-06-04 11:54:01', '2018-06-04 11:54:05');
INSERT INTO `article_topics` VALUES ('2', '23', '1', '2018-06-04 15:27:15', '2018-06-04 15:27:15');
INSERT INTO `article_topics` VALUES ('3', '20', '1', '2018-06-04 15:27:24', '2018-06-04 15:27:24');
INSERT INTO `article_topics` VALUES ('4', '3', '2', '2018-06-04 15:28:45', '2018-06-04 15:28:45');
INSERT INTO `article_topics` VALUES ('5', '23', '2', '2018-06-04 15:28:45', '2018-06-04 15:28:45');

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES ('1', '这是标题', '这是内容', '1', '2018-05-30 10:13:45', '2018-05-30 10:13:49', '1');
INSERT INTO `articles` VALUES ('2', 'Eum distinctio deserunt voluptatibus possimus.', 'Excepturi sunt magnam ut dolores deserunt est ducimus quo. Magnam ad et laudantium quidem. Rem provident natus quo voluptatem unde dignissimos neque quibusdam. Laboriosam doloribus quam a quidem tempore dolorem sit. Sint sed ea ut sed impedit. Et occaecati omnis et. Soluta temporibus qui recusandae quia impedit. Accusantium repellendus est quis ducimus ut eum. Laudantium consequatur et dolor ea ipsa vero. Distinctio eos quis blanditiis velit ut tenetur blanditiis. Ratione sunt atque sit nihil fugiat. Officia mollitia eius sit praesentium. Laboriosam id quae sed mollitia ex explicabo. Iure iste qui sunt est.', '2', '2018-05-30 13:48:41', '2018-06-05 10:12:49', '1');
INSERT INTO `articles` VALUES ('3', 'Sint aut accusamus suscipit ea.', 'Magnam voluptas aliquid dolores occaecati ducimus sunt. Iure at consequatur ut labore consequuntur itaque. Numquam architecto dolores aut cupiditate dolores eius et. Nemo modi voluptas doloremque modi. Rerum ut rerum et quod dolorem in. Odio qui voluptates quas et sed qui est. Nisi sapiente facere optio est.', '1', '2018-05-30 13:48:41', '2018-06-05 10:15:32', '1');
INSERT INTO `articles` VALUES ('4', 'Nesciunt laborum modi non quia est quia laboriosam.', 'Amet qui neque sint perspiciatis ut. Placeat dolorem quia eos omnis cupiditate eos. Maiores in est voluptatem. Nesciunt rerum cumque ipsam id non aliquam beatae. Accusamus et vero sapiente id expedita. Ipsa explicabo cupiditate aut. Ut ea maiores dolores nihil voluptatem eos est iusto. Ad doloremque unde nostrum debitis maxime praesentium in. Optio in in maxime rerum repudiandae beatae. Quae laboriosam cumque eos eius. Corrupti nulla ut recusandae quis ea aut explicabo dolor. Dolores fugiat sapiente cumque itaque beatae aut alias exercitationem. Ut dolor quis ducimus et. Qui aut aliquid quod.', '1', '2018-05-30 13:48:41', '2018-05-30 13:48:41', '0');
INSERT INTO `articles` VALUES ('5', 'Accusamus adipisci sit qui corporis eum.', 'Qui ullam molestiae praesentium ut consequuntur incidunt facere culpa. Necessitatibus impedit vitae illo explicabo omnis aut architecto. Numquam earum ratione perferendis sit quia qui eum aut. Non ipsum perspiciatis tenetur eveniet. Corrupti fuga qui qui doloribus temporibus. Asperiores expedita quia saepe aliquam blanditiis beatae non. Deserunt commodi inventore nesciunt dolor voluptas. Fuga praesentium sapiente atque temporibus voluptas quae eveniet. Dolor consequuntur expedita ipsa quo officia quos non. Ipsa odit possimus nulla qui omnis dolores at. Dolore qui porro officiis illo eum rem. Modi omnis earum dolores et quia sit. Molestiae iste commodi consequatur provident atque.', '1', '2018-05-30 13:48:41', '2018-05-30 13:48:41', '0');
INSERT INTO `articles` VALUES ('6', 'Consequuntur ab unde perferendis dolores excepturi ut.', 'Non veniam et aliquam reiciendis voluptas et quia. Non quis cumque voluptates nemo autem doloremque. Rem dicta ut velit laboriosam. Cumque magni accusamus fugiat nihil. Voluptatum aperiam omnis voluptatem. Reiciendis esse accusantium nobis nihil sint. Recusandae illum sit quia qui. Id eum nulla nobis doloribus alias. Ipsam enim ullam eligendi aut. Consequatur laborum consequuntur quo qui eaque. Sed modi vel et velit fugit rem porro omnis. Non numquam voluptas necessitatibus impedit harum sit.', '2', '2018-05-30 13:48:41', '2018-05-30 13:48:41', '0');
INSERT INTO `articles` VALUES ('7', 'Est sit quam consequatur deserunt maiores.', 'Accusantium vel reiciendis nostrum enim modi. Impedit quo voluptas quos sint odit iste. Fugiat deserunt vero sit sunt sit. Eveniet non ex voluptates. Corporis sapiente soluta quisquam dolor et tenetur neque. Omnis sunt ut eos nulla consequatur. Incidunt sit accusantium molestias nesciunt.', '2', '2018-05-30 13:48:41', '2018-05-30 13:48:41', '0');
INSERT INTO `articles` VALUES ('8', 'Officiis quasi fugit sit consectetur autem.', 'Aperiam laboriosam excepturi quo dicta non distinctio ipsam. Itaque dolorem animi dolor cumque. Minima dolores quisquam ut similique. Dolorem et voluptatem eaque dignissimos qui ipsam qui nobis. Rem rerum ut nihil porro ea explicabo doloribus numquam. Fugit modi voluptas temporibus sequi. Optio aut ut dolor. Ut aut aut deleniti dolores. Laudantium cumque dicta blanditiis reprehenderit voluptas. Doloribus minus sequi cumque.', '2', '2018-05-30 13:48:41', '2018-05-30 13:48:41', '0');
INSERT INTO `articles` VALUES ('9', 'Similique vel veniam ut reprehenderit.', 'Culpa sit possimus culpa non exercitationem. Nihil ea recusandae accusantium perspiciatis labore quisquam. Illum architecto quas in sequi. Qui maxime ut rerum nihil eaque saepe. Repudiandae ipsam odit molestiae et id asperiores repellendus molestiae. Magni ut perferendis sequi praesentium. Commodi ab pariatur vitae autem iste tenetur provident. Totam voluptatem nemo officiis. Assumenda blanditiis labore voluptatibus veniam. Nulla minima recusandae perferendis placeat. Et et voluptatem voluptatem voluptas ut et aut. Ipsa distinctio repellendus numquam nemo.', '2', '2018-05-30 13:48:41', '2018-05-30 13:48:41', '0');
INSERT INTO `articles` VALUES ('11', 'Fuga sint error ut reiciendis.', 'Quo inventore iure suscipit aut eos aperiam. Quam beatae hic autem repellendus quo quo nemo dolorum. Omnis rerum esse et cum. Sit natus iste accusantium dolorem vel sint. Officia in dolor eius quod voluptatem qui. Qui alias officiis ea ut. Sed ea ut exercitationem sint sint. Exercitationem repudiandae qui est quo culpa delectus qui.', '2', '2018-05-30 13:48:41', '2018-05-30 13:48:41', '0');
INSERT INTO `articles` VALUES ('12', 'Labore voluptas magni temporibus asperiores odit.', 'Velit labore veritatis saepe sequi magnam nam quibusdam explicabo. Quidem hic autem dolores facilis quae magnam. Harum rerum sunt incidunt asperiores dolorem saepe. Explicabo quia nisi dignissimos modi. Quia et quod ex dolor sit nesciunt. Aperiam ducimus impedit labore exercitationem. Dolore corporis modi ut earum in omnis tenetur. Ut consequuntur aut sequi id qui sit et quo. Sint voluptatem cumque asperiores a. Magnam ipsa sunt aut et harum quia aperiam. Dolorem veritatis rerum totam.', '1', '2018-05-30 13:48:41', '2018-05-30 13:48:41', '0');
INSERT INTO `articles` VALUES ('13', 'Non facere voluptas nostrum ut ut sunt dicta.', 'Eveniet cumque qui ut eum adipisci accusamus. In laborum vero architecto laboriosam illo. Nam voluptates ea eveniet cupiditate nam. Quis quas iusto sit accusantium. Beatae est qui sapiente maxime eos. Tempore ut est minima sint autem. Cupiditate nesciunt quae quia vel explicabo dicta. Vero nulla nulla quod modi est. Expedita quo voluptatem facere assumenda temporibus.', '2', '2018-05-30 13:48:41', '2018-05-30 13:48:41', '0');
INSERT INTO `articles` VALUES ('14', 'Ut expedita veniam consequatur tenetur perspiciatis illum.', 'Qui similique omnis qui beatae quasi commodi. Quae quasi ipsum aut dolore. Repellendus vitae dolore error iusto quis rerum. Tenetur repellat voluptas suscipit omnis sit vel sunt. Rerum omnis rem ut et est sed eos. Id dolorum est aut ut. Omnis veniam et iste. Consequatur et doloremque quia modi molestiae rerum. Est quaerat quia ipsa doloremque adipisci quasi. Provident tempora cumque sequi quam dolorem esse sapiente.', '2', '2018-05-30 13:48:41', '2018-05-30 13:48:41', '0');
INSERT INTO `articles` VALUES ('15', 'Nobis esse itaque at accusantium in id vel.', 'Aut inventore fuga voluptatem ut quisquam nulla. Nostrum enim nihil sint ratione magni. Quis praesentium delectus doloremque sed asperiores consequatur. Autem vitae laborum maxime. Qui est voluptatem vitae sint a non. Maiores vel ab voluptates dignissimos repellat nulla eligendi. Vitae asperiores fugiat dolor. Ipsa eum sint nisi tempore est et fuga. Assumenda corporis commodi eligendi tenetur quo. Aut aliquid enim minima voluptatem. Reiciendis voluptatum impedit praesentium et harum. Cupiditate consectetur eos enim reprehenderit unde laboriosam facere debitis. Commodi qui et a et exercitationem magni adipisci. Quasi architecto esse voluptatum expedita aut.', '1', '2018-05-30 13:48:41', '2018-05-30 13:48:41', '0');
INSERT INTO `articles` VALUES ('16', 'Omnis voluptates occaecati aliquam sapiente est odio corrupti.', 'Qui vel aperiam enim molestiae quia. Et ut ullam maxime odio voluptate. Dolore est ut et minus. Sint perferendis numquam ut. Impedit voluptas animi minus fugiat laudantium placeat. Libero iste sit exercitationem perspiciatis qui ut ullam. Rem doloribus quia id quod sed quia. Autem ut veniam modi earum exercitationem. Aliquam ad saepe vero. Ipsa fuga sit omnis dignissimos quaerat ut. Vitae enim occaecati voluptate quo possimus est nisi. Quaerat sunt libero qui occaecati vel. Voluptatem accusantium aut laudantium voluptate voluptatem.', '1', '2018-05-30 13:48:41', '2018-06-05 10:18:43', '-1');
INSERT INTO `articles` VALUES ('17', 'Aspernatur reiciendis quod sunt odio autem laboriosam.', 'Fuga quis eius eligendi numquam voluptatum atque rem. Fugit unde excepturi minima quo perspiciatis non. Possimus ea iusto debitis. Rerum optio et omnis et neque. Voluptatem ipsum et sunt fugiat. Qui in eius id tenetur consequatur non pariatur nemo. Pariatur culpa placeat repudiandae. Adipisci quis debitis rerum nihil odit optio odit nisi.', '2', '2018-05-30 13:48:41', '2018-06-05 10:16:40', '-1');
INSERT INTO `articles` VALUES ('18', 'Numquam magnam et repellendus reprehenderit delectus.', 'Ipsam ex sunt sint vel repudiandae quae. Aut tempore et ut. Dolores quia voluptatem eaque alias. Voluptas dolorum fugiat voluptatem atque. Et optio totam est minus ut. Nihil voluptatem repellat blanditiis. Eveniet magnam et sed fugit rerum amet quis. Corporis et eos voluptas ipsam. Repellat sunt architecto in cupiditate et at. Dolorum ab architecto saepe iste.', '1', '2018-05-30 13:48:41', '2018-06-05 10:11:01', '-1');
INSERT INTO `articles` VALUES ('19', 'Qui eos labore mollitia.', 'Deleniti harum et quas labore earum vero necessitatibus. Corrupti sed quis quidem dolorem ut placeat. Id quibusdam sunt et repellat placeat. Et id voluptate dicta. Nisi omnis laboriosam qui dignissimos voluptatibus. Est vel culpa nostrum. Dolores non ipsa magni fugiat. Aut sed vitae tenetur eos.', '3', '2018-05-30 13:48:41', '2018-06-05 10:08:35', '-1');
INSERT INTO `articles` VALUES ('20', 'Dolorum molestias at rerum sit reprehenderit velit.', 'Amet et fuga id in ut magnam sequi. Qui nisi dolorem consequatur fuga praesentium rem. Illum reprehenderit aut magnam culpa officia non recusandae. Reprehenderit aperiam omnis voluptatem ea enim vel. Vero deserunt quia hic natus omnis et. Quae numquam rerum quod impedit odit. Perspiciatis expedita numquam voluptatibus qui quod dolor. Fugit nihil laborum esse minus ut porro ut. Tenetur quos consequatur sit est dolores deleniti. Aperiam rerum ab recusandae nihil. Eos rerum ut ab nisi optio voluptas. Aliquid dolorem enim vitae nisi et. Et qui voluptates illum magni id. Tempore aliquam unde molestiae.', '1', '2018-05-30 13:48:41', '2018-06-05 10:08:25', '1');
INSERT INTO `articles` VALUES ('24', '打发斯蒂芬', '<p>似懂非懂身份告诉身份告诉似懂非懂身份告诉身份告诉似懂非懂身份告诉身份告诉似懂非懂身份告诉身份告诉似懂非懂身份告诉身份告诉<br></p><p>似懂非懂身份告诉身份告诉</p><p>似懂非懂身份告诉身份告诉似懂非懂身份告诉身份告诉<br></p><p><br></p>', '3', '2018-05-31 10:16:39', '2018-05-31 10:16:39', '-1');
INSERT INTO `articles` VALUES ('23', '111开发商的基本哪受得了立刻改变你是领导222', '<p>222给你上班了吗斯蒂芬本命年说明书阿卡丽你吗打开慢半拍阿克明白asoas卡刷包模块sao杀了不可奥斯卡没安保科</p><p><img src=\"http://laravel-jianshu.com/storage/4d0aafda1a4bd1e8a497ba37a73d79d0/wXdfeZriCAVELZMPuEYAnhtotDoVUlM6RFHL5dFY.jpeg\" alt=\"1433171136139793\" style=\"max-width:100%;\"><br></p><p><img src=\"http://laravel-jianshu.com/storage/2632bd9c672cb6b8511b5682aaf4f308/XZowVV7JBu8JGPny3XdcfR44cptXJk6SPQuRqsfu.jpeg\" alt=\"default\" style=\"max-width:100%;\"><br></p><p><br></p>', '1', '2018-05-30 16:32:02', '2018-05-30 16:54:42', '1');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '20', '社会上跟不上电饭煲', '1', '2018-05-31 11:45:22', '2018-05-31 11:45:22');
INSERT INTO `comments` VALUES ('2', '20', '我是hezhan来评论啦啦啦', '2', '2018-05-31 12:29:51', '2018-05-31 12:29:51');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for fans
-- ----------------------------
DROP TABLE IF EXISTS `fans`;
CREATE TABLE `fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fan_id` int(11) NOT NULL,
  `star_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of fans
-- ----------------------------
INSERT INTO `fans` VALUES ('1', '2', '1', '2018-06-04 10:03:10', '2018-06-04 10:03:14');
INSERT INTO `fans` VALUES ('3', '3', '1', '2018-06-04 10:20:08', '2018-06-04 10:20:10');
INSERT INTO `fans` VALUES ('7', '1', '3', '2018-06-04 11:38:33', '2018-06-04 11:38:33');

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2017_03_26_233534_create_articles_table', '1');
INSERT INTO `migrations` VALUES ('4', '2017_04_04_091147_create_comment_table', '1');
INSERT INTO `migrations` VALUES ('5', '2017_04_04_112227_create_zan_table', '1');
INSERT INTO `migrations` VALUES ('6', '2017_04_05_223606_create_fan_table', '1');
INSERT INTO `migrations` VALUES ('7', '2017_04_06_162830_create_topics_table', '1');
INSERT INTO `migrations` VALUES ('8', '2017_04_08_110156_create_admin_user_table', '1');
INSERT INTO `migrations` VALUES ('9', '2017_04_08_215943_alter_articles_table', '1');
INSERT INTO `migrations` VALUES ('10', '2017_04_09_100358_create_permission_and_roles', '1');
INSERT INTO `migrations` VALUES ('11', '2017_04_11_143417_create_notice_table', '1');
INSERT INTO `migrations` VALUES ('12', '2017_04_11_234527_create_jobs_table', '1');
INSERT INTO `migrations` VALUES ('13', '2017_04_11_234539_create_failed_jobs_table', '1');
INSERT INTO `migrations` VALUES ('14', '2017_05_14_205043_alter_user_table_add_avatar', '1');

-- ----------------------------
-- Table structure for notices
-- ----------------------------
DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of notices
-- ----------------------------
INSERT INTO `notices` VALUES ('1', '高考通知', 'ad噶VB是的', '2018-06-08 15:16:11', '2018-06-08 15:16:11');
INSERT INTO `notices` VALUES ('2', '明天周末', '啦啦啦啦啦啦', '2018-06-08 15:47:27', '2018-06-08 15:47:27');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for topics
-- ----------------------------
DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of topics
-- ----------------------------
INSERT INTO `topics` VALUES ('1', '随言碎语', '2018-06-04 11:53:50', '2018-06-04 11:53:53');
INSERT INTO `topics` VALUES ('2', '经典', '2018-06-04 15:28:24', '2018-06-04 15:28:27');

-- ----------------------------
-- Table structure for user_notice
-- ----------------------------
DROP TABLE IF EXISTS `user_notice`;
CREATE TABLE `user_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `notice_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_notice
-- ----------------------------
INSERT INTO `user_notice` VALUES ('1', '1', '2', null, null);
INSERT INTO `user_notice` VALUES ('2', '2', '2', null, null);
INSERT INTO `user_notice` VALUES ('3', '3', '2', null, null);
INSERT INTO `user_notice` VALUES ('4', '4', '2', null, null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '941192051@qq.com', '$2y$10$g9jNK2NSm0FehYANzOe9Lu.y09mr59W3ivc.vkN3DDvNPOpS.xK3G', 'GbkWqyJ9EK6ebDFbLE1yeprHq8M5KmE5RI5oA3oHKF2CV9S8Q4y30HKcL2Qx', '2018-05-31 09:39:04', '2018-05-31 09:39:04', '');
INSERT INTO `users` VALUES ('2', 'hezhan', '2252827002@qq.com', '$2y$10$T4AFgJNyRUEeF720OUf2ZecwKuYblCn1RiVBTppBK.voqRz7est4K', 'tlFtapCER6cuogtKRJhqwiZFxWb34qUadbM2SAvy1PYcF3FoEoZvPhSS6oQ1', '2018-05-31 10:07:14', '2018-05-31 10:07:14', '');
INSERT INTO `users` VALUES ('3', 'test', '2387989495@qq.com', '$2y$10$A8uFCPgXMBMNtWwF/NxvPOkH8fNXeWsAcO3YA20kbtXtAvZCwjjI2', null, '2018-06-04 10:19:46', '2018-06-04 10:19:46', '');
INSERT INTO `users` VALUES ('4', 'linux', '9411922051@qq.com', '$2y$10$MOY/wsiTh/RyHBJvqu3W3uY4aQWwblbqsTz5dzu10LNeuMA3UIuOu', null, '2018-06-06 18:45:22', '2018-06-06 18:45:22', '');

-- ----------------------------
-- Table structure for zans
-- ----------------------------
DROP TABLE IF EXISTS `zans`;
CREATE TABLE `zans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of zans
-- ----------------------------
INSERT INTO `zans` VALUES ('3', '24', '2', '2018-05-31 14:24:17', '2018-05-31 14:24:17');
INSERT INTO `zans` VALUES ('4', '20', '2', '2018-05-31 14:27:40', '2018-05-31 14:27:40');
