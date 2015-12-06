-- Infos à charger en base de donnée tirée du fichier install/install.queries.php. A partir de ligne 220

ALTER DATABASE `teampass` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `teampass`;

CREATE TABLE IF NOT EXISTS `teampass_items` (
	`id` int(12) NOT null AUTO_INCREMENT,
	`label` varchar(100) NOT NULL,
	`description` text NOT NULL,
	`pw` text NOT NULL,
	`url` varchar(250) DEFAULT NULL,
	`id_tree` varchar(10) DEFAULT NULL,
	`perso` tinyint(1) NOT null DEFAULT '0',
	`login` varchar(200) DEFAULT NULL,
	`inactif` tinyint(1) NOT null DEFAULT '0',
	`restricted_to` varchar(200) NOT NULL,
	`anyone_can_modify` tinyint(1) NOT null DEFAULT '0',
	`email` varchar(100) DEFAULT NULL,
	`notification` varchar(250) DEFAULT NULL,
	`viewed_no` int(12) NOT null DEFAULT '0',
	`complexity_level` varchar(2) NOT null DEFAULT '-1',
	PRIMARY KEY (`id`),
	KEY	`restricted_inactif_idx` (`restricted_to`,`inactif`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_log_items` (
	`id_item` int(8) NOT NULL,
	`date` varchar(50) NOT NULL,
	`id_user` int(8) NOT NULL,
	`action` varchar(250) NOT NULL,
	`raison` text NOT NULL
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_misc` (
	`type` varchar(50) NOT NULL,
	`intitule` varchar(100) NOT NULL,
	`valeur` varchar(100) NOT NULL
) CHARSET=utf8;

INSERT INTO `teampass_misc` (`type`, `intitule`, `valeur`) VALUES
('admin', 'max_latest_items', '10'),
('admin', 'enable_favourites', '1'),
('admin', 'show_last_items', '1'),
('admin', 'enable_pf_feature', '1'),
('admin', 'log_connections', '0'),
('admin', 'log_accessed', '0'),
('admin', 'time_format', 'H:i:s'),
('admin', 'date_format', 'd/m/Y'),
('admin', 'duplicate_folder', '0'),
('admin', 'item_duplicate_in_same_folder', '0'),
('admin', 'duplicate_item', '0'),
('admin', 'number_of_used_pw', '3'),
('admin', 'manager_edit', '1'),
('admin', 'cpassman_dir', '__FINALPATH__'),
('admin', 'cpassman_url', 'https://__DOMAIN____PATH__'),
('admin', 'favicon', 'https://__DOMAIN____PATH__/favico.ico'),
('admin', 'path_to_upload_folder', '__FINALPATH__/upload'),
('admin', 'url_to_upload_folder', 'https://__DOMAIN____PATH__/upload'),
('admin', 'path_to_files_folder', '__FINALPATH__/files'),
('admin', 'url_to_files_folder', 'https://__DOMAIN____PATH__/files'),
('admin', 'activate_expiration', '0'),
('admin','pw_life_duration','0'),
('admin','maintenance_mode','0'),
('admin','enable_sts','0'),
('admin','encryptClientServer','1'),
('admin','cpassman_version','__VERSION__'),
('admin','ldap_mode','1'),
('admin','ldap_type','posix-search'),
('admin','ldap_suffix','0'),
('admin','ldap_domain_dn','0'),
('admin','ldap_domain_controler','localhost'),
('admin','ldap_user_attribute','uid'),
('admin','ldap_search_base','ou=users,dc=yunohost,dc=org'),
('admin','ldap_ssl','0'),
('admin','ldap_tls','0'),
('admin','ldap_elusers','0'),
('admin','richtext','0'),
('admin','allow_print','1'),
('admin','roles_allowed_to_print','1'),
('admin','show_description','1'),
('admin','anyone_can_modify','0'),
('admin','anyone_can_modify_bydefault','0'),
('admin','nb_bad_authentication','0'),
('admin','utf8_enabled','1'),
('admin','restricted_to','0'),
('admin','restricted_to_roles','0'),
('admin','enable_send_email_on_user_login','0'),
('admin','enable_user_can_create_folders','1'),
('admin','insert_manual_entry_item_history','0'),
('admin','enable_kb','0'),
('admin','enable_email_notification_on_item_shown','0'),
('admin','enable_email_notification_on_user_pw_change','1'),
('admin','custom_logo',''),
('admin','custom_login_text',''),
('admin','default_language','__LANG__'),
('admin','send_stats', '0'),
('admin','get_tp_info', '1'),
('admin','send_mail_on_user_login', '0'),
('cron', 'sending_emails', '0'),
('admin','nb_items_by_query', 'auto'),
('admin','enable_delete_after_consultation', '0'),
('admin','enable_personal_saltkey_cookie', '0'),
('admin','personal_saltkey_cookie_duration', '31'),
('admin','email_smtp_server', 'localhost'),
('admin','email_smtp_auth', 'false'),
('admin','email_auth_username', ''),
('admin','email_auth_pwd', ''),
('admin','email_port', '465'),
('admin','email_security', 'ssl'),
('admin','email_server_url', 'https://__DOMAIN____PATH__'),
('admin','email_from', 'admin@__DOMAIN__'),
('admin','email_from_name', 'Teampass'),
('admin','pwd_maximum_length', '100'),
('admin','2factors_authentication', '0'),
('admin','delay_item_edition', '0'),
('admin','allow_import','1'),
('admin','proxy_ip',''),
('admin','proxy_port',''),
('admin','upload_maxfilesize','10mb'),
('admin','upload_docext','doc,docx,dotx,xls,xlsx,xltx,rtf,csv,txt,pdf,ppt,pptx,pot,dotx,xltx'),
('admin','upload_imagesext','jpg,jpeg,gif,png'),
('admin','upload_pkgext','7z,rar,tar,zip'),
('admin','upload_otherext','sql,xml'),
('admin','upload_imageresize_options','1'),
('admin','upload_imageresize_width','800'),
('admin','upload_imageresize_height','600'),
('admin','upload_imageresize_quality','90'),
('admin','use_md5_password_as_salt','1'),
('admin','ga_website_name','TeamPass for ChangeMe'),
('admin','api','0'),
('admin','subfolder_rights_as_parent','1'),
('admin','show_only_accessible_folders','1'),
('admin','enable_suggestion','0'),
('admin','otv_expiration_period','7'),
('admin', 'timezone', '__TIMEZONE__'),
('admin', 'can_create_root_folder', '1'),
('admin', 'settings_offline_mode', '1'),
('admin', 'offline_key_level', '50'),
('admin','default_session_expiration_time','60'),
('admin','bck_script_path','__FINALPATH__/backups/'),
('complex','1','0');


CREATE TABLE IF NOT EXISTS `teampass_nested_tree` (
	`id` bigint(20) unsigned NOT null AUTO_INCREMENT,
	`parent_id` int(11) NOT NULL,
	`title` varchar(255) NOT NULL,
	`nleft` int(11) NOT NULL DEFAULT '0',
	`nright` int(11) NOT NULL DEFAULT '0',
	`nlevel` int(11) NOT NULL DEFAULT '0',
	`bloquer_creation` tinyint(1) NOT null DEFAULT '0',
	`bloquer_modification` tinyint(1) NOT null DEFAULT '0',
	`personal_folder` tinyint(1) NOT null DEFAULT '0',
	`renewal_period` TINYINT(4) NOT null DEFAULT '0',
	PRIMARY KEY (`id`),
	UNIQUE KEY `id` (`id`),
	KEY `nested_tree_parent_id` (`parent_id`),
	KEY `nested_tree_nleft` (`nleft`),
	KEY `nested_tree_nright` (`nright`),
	KEY `nested_tree_nlevel` (`nlevel`),
	KEY `personal_folder_idx` (`personal_folder`)
) CHARSET=utf8;

INSERT INTO teampass_nested_tree VALUES("1","0","__FOLDERS__","1","2","1","0","0","0","0");

CREATE TABLE IF NOT EXISTS `teampass_rights` (
	`id` int(12) NOT null AUTO_INCREMENT,
	`tree_id` int(12) NOT NULL,
	`fonction_id` int(12) NOT NULL,
	`authorized` tinyint(1) NOT null DEFAULT '0',
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_users` (
	`id` int(12) NOT null AUTO_INCREMENT,
	`login` varchar(50) NOT NULL,
	`pw` varchar(400) NOT NULL,
	`groupes_visibles` varchar(250) NOT NULL,
	`derniers` text NOT NULL,
	`key_tempo` varchar(100) NOT NULL,
	`last_pw_change` varchar(30) NOT NULL,
	`last_pw` text NOT NULL,
	`admin` tinyint(1) NOT null DEFAULT '0',
	`fonction_id` varchar(255) NOT NULL,
	`groupes_interdits` varchar(255) NOT NULL,
	`last_connexion` varchar(30) NOT NULL,
	`gestionnaire` int(11) NOT null DEFAULT '0',
	`email` varchar(300) NOT NULL,
	`favourites` varchar(300) NOT NULL,
	`latest_items` varchar(300) NOT NULL,
	`personal_folder` int(1) NOT null DEFAULT '0',
	`disabled` tinyint(1) NOT null DEFAULT '0',
	`no_bad_attempts` tinyint(1) NOT null DEFAULT '0',
	`can_create_root_folder` tinyint(1) NOT null DEFAULT '0',
	`read_only` tinyint(1) NOT null DEFAULT '0',
	`timestamp` varchar(30) NOT null DEFAULT '0',
	`user_language` varchar(30) NOT null DEFAULT 'french',
	`name` varchar(100) NULL,
	`lastname` varchar(100) NULL,
	`session_end` varchar(30) NULL,
	`isAdministratedByRole` tinyint(5) NOT null DEFAULT '0',
	`psk` varchar(400) NULL,
	`ga` varchar(50) NULL,
	`avatar` varchar(255) NOT null,
	`avatar_thumb` varchar(255) NOT null,
	PRIMARY KEY (`id`),
	UNIQUE KEY `login` (`login`)
) CHARSET=utf8;

INSERT INTO `teampass_users` (`id`, `login`, `pw`, `groupes_visibles`, `derniers`, `key_tempo`, `last_pw_change`, `last_pw`, `admin`, `fonction_id`, `groupes_interdits`, `last_connexion`, `gestionnaire`, `email`, `favourites`, `latest_items`, `personal_folder`) VALUES
(NULL, 'admin', '__BCRYPT_MDP__', '', '', '', '', '', '1', '', '', '', '0', '', '', '', '0');

CREATE TABLE IF NOT EXISTS `teampass_tags` (
	`id` int(12) NOT null AUTO_INCREMENT,
	`tag` varchar(30) NOT NULL,
	`item_id` int(12) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `id` (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_log_system` (
	`id` int(12) NOT null AUTO_INCREMENT,
	`type` varchar(20) NOT NULL,
	`date` varchar(30) NOT NULL,
	`label` text NOT NULL,
	`qui` varchar(30) NOT NULL,
	`field_1` varchar(250) DEFAULT NULL,
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_files` (
	`id` int(11) NOT null AUTO_INCREMENT,
	`id_item` int(11) NOT NULL,
	`name` varchar(100) NOT NULL,
	`size` int(10) NOT NULL,
	`extension` varchar(10) NOT NULL,
	`type` varchar(50) NOT NULL,
	`file` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_cache` (
	`id` int(12) NOT NULL,
	`label` varchar(50) NOT NULL,
	`description` text NOT NULL,
	`tags` text NOT NULL,
	`id_tree` int(12) NOT NULL,
	`perso` tinyint(1) NOT NULL,
	`restricted_to` varchar(200) NOT NULL,
	`login` varchar(200) DEFAULT NULL,
	`folder` varchar(300) NOT NULL,
	`author` varchar(50) NOT NULL
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_roles_title` (
	`id` int(12) NOT null AUTO_INCREMENT,
	`title` varchar(50) NOT NULL,
	`allow_pw_change` TINYINT(1) NOT null DEFAULT '0',
	`complexity` INT(5) NOT null DEFAULT '0',
	`creator_id` int(11) NOT null DEFAULT '0',
	PRIMARY KEY (`id`)
) CHARSET=utf8;

INSERT INTO teampass_roles_title VALUES("1","__ROLES__","0","0","1");

CREATE TABLE IF NOT EXISTS `teampass_roles_values` (
	`role_id` int(12) NOT NULL,
	`folder_id` int(12) NOT NULL,
	`type` varchar(1) NOT NULL DEFAULT 'R',
	KEY `role_id_idx` (`role_id`)
) CHARSET=utf8;

INSERT INTO teampass_roles_values VALUES("1","1","W");

CREATE TABLE IF NOT EXISTS `teampass_kb` (
	`id` int(12) NOT null AUTO_INCREMENT,
	`category_id` int(12) NOT NULL,
	`label` varchar(200) NOT NULL,
	`description` text NOT NULL,
	`author_id` int(12) NOT NULL,
	`anyone_can_modify` tinyint(1) NOT null DEFAULT '0',
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_kb_categories` (
	`id` int(12) NOT null AUTO_INCREMENT,
	`category` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_kb_items` (
	`kb_id` tinyint(12) NOT NULL,
	`item_id` tinyint(12) NOT NULL
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_restriction_to_roles` (
	`role_id` int(12) NOT NULL,
	`item_id` int(12) NOT NULL,
	KEY `role_id_idx`  (`role_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_keys` (
	`sql_table` varchar(25) NOT NULL,
	`id` int(20) NOT NULL,
	`rand_key` varchar(25) NOT NULL,
	UNIQUE KEY `rand_key_id_idx` (`rand_key`,`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_languages` (
	`id` INT(10) NOT null AUTO_INCREMENT PRIMARY KEY ,
	`name` VARCHAR(50) NOT null ,
	`label` VARCHAR(50) NOT null ,
	`code` VARCHAR(10) NOT null ,
	`flag` VARCHAR(30) NOT NULL
) CHARSET=utf8;

INSERT INTO `teampass_languages` (`name`, `label`, `code`, `flag`) VALUES
('french', 'French' , 'fr', 'fr.png'),
('english', 'English' , 'us', 'us.png'),
('spanish', 'Spanish' , 'es', 'es.png'),
('german', 'German' , 'de', 'de.png'),
('czech', 'Czech' , 'cz', 'cz.png'),
('italian', 'Italian' , 'it', 'it.png'),
('russian', 'Russian' , 'ru', 'ru.png'),
('turkish', 'Turkish' , 'tr', 'tr.png'),
('norwegian', 'Norwegian' , 'no', 'no.png'),
('japanese', 'Japanese' , 'ja', 'ja.png'),
('portuguese', 'Portuguese' , 'pr', 'pr.png'),
('chinese', 'Chinese' , 'cn', 'cn.png'),
('swedish', 'Swedish' , 'se', 'se.png'),
('dutch', 'Dutch' , 'nl', 'nl.png'),
('catalan', 'Catalan' , 'ct', 'ct.png');

CREATE TABLE IF NOT EXISTS `teampass_emails` (
	`timestamp` INT(30) NOT null ,
	`subject` VARCHAR(255) NOT null ,
	`body` TEXT NOT null ,
	`receivers` VARCHAR(255) NOT null ,
	`status` VARCHAR(30) NOT NULL
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_automatic_del` (
	`item_id` int(11) NOT NULL,
	`del_enabled` tinyint(1) NOT NULL,
	`del_type` tinyint(1) NOT NULL,
	`del_value` varchar(35) NOT NULL
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_items_edition` (
	`item_id` int(11) NOT NULL,
	`user_id` int(11) NOT NULL,
	`timestamp` varchar(50) NOT NULL
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_categories` (
	`id` int(12) NOT NULL AUTO_INCREMENT,
	`parent_id` int(12) NOT NULL,
	`title` varchar(255) NOT NULL,
	`level` int(2) NOT NULL,
	`description` text NOT NULL,
	`type` varchar(50) NOT NULL,
	`order` int(12) NOT NULL,
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_categories_items` (
	`id` int(12) NOT NULL AUTO_INCREMENT,
	`field_id` int(11) NOT NULL,
	`item_id` int(11) NOT NULL,
	`data` text NOT NULL,
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_categories_folders` (
	`id_category` int(12) NOT NULL,
	`id_folder` int(12) NOT NULL
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_api` (
	`id` int(20) NOT NULL AUTO_INCREMENT,
	`type` varchar(15) NOT NULL,
	`label` varchar(255) NOT NULL,
	`value` varchar(255) NOT NULL,
	`timestamp` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_otv` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`timestamp` text NOT NULL,
	`code` varchar(100) NOT NULL,
	`item_id` int(12) NOT NULL,
	`originator` tinyint(12) NOT NULL,
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_suggestion` (
	`id` tinyint(12) NOT NULL AUTO_INCREMENT,
	`label` varchar(255) NOT NULL,
	`password` text NOT NULL,
	`description` text NOT NULL,
	`author_id` int(12) NOT NULL,
	`folder_id` int(12) NOT NULL,
	`comment` text NOT NULL,
	`suggestion_key` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_export` (
	`id` int(12) NOT NULL,
	`label` varchar(255) NOT NULL,
	`login` varchar(100) NOT NULL,
	`description` text NOT NULL,
	`pw` text NOT NULL,
	`path` varchar(255) NOT NULL
) CHARSET=utf8;
