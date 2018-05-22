-- Infos à charger en base de donnée tirée du fichier install/install.queries.php. A partir de la ligne 295 (step_5)
-- Use the script teampass_pre_upgrade_ynh/conf/diff_populate_sql.sh and search step_5 to find what's new.

ALTER DATABASE `__APP__` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `__APP__`;

CREATE TABLE IF NOT EXISTS `teampass_items` (
	`id` int(12) NOT null AUTO_INCREMENT,
	`label` varchar(500) NOT NULL,
	`description` text DEFAULT NULL,
	`pw` text DEFAULT NULL,
	`pw_iv` text DEFAULT NULL,
	`pw_len` int(5) NOT NULL DEFAULT '0',
	`url` varchar(500) DEFAULT NULL,
	`id_tree` varchar(10) DEFAULT NULL,
	`perso` tinyint(1) NOT null DEFAULT '0',
	`login` varchar(200) DEFAULT NULL,
	`inactif` tinyint(1) NOT null DEFAULT '0',
	`restricted_to` varchar(200) DEFAULT NULL,
	`anyone_can_modify` tinyint(1) NOT null DEFAULT '0',
	`email` varchar(100) DEFAULT NULL,
	`notification` varchar(250) DEFAULT NULL,
	`viewed_no` int(12) NOT null DEFAULT '0',
	`complexity_level` varchar(3) NOT null DEFAULT '-1',
	`auto_update_pwd_frequency` tinyint(2) NOT null DEFAULT '0',
	`auto_update_pwd_next_date` varchar(100) NOT null DEFAULT '0',
	`encryption_type` VARCHAR(20) NOT NULL DEFAULT 'not_set',
	PRIMARY KEY (`id`),
	KEY    `restricted_inactif_idx` (`restricted_to`,`inactif`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_log_items` (
	`increment_id` int(12) NOT NULL AUTO_INCREMENT,
	`id_item` int(8) NOT NULL,
	`date` varchar(50) NOT NULL,
	`id_user` int(8) NOT NULL,
	`action` varchar(250) NULL,
	`raison` text NULL,
	`raison_iv` text NULL,
	`encryption_type` VARCHAR(20) NOT NULL DEFAULT 'not_set',
	PRIMARY KEY (`increment_id`)
) CHARSET=utf8;

CREATE INDEX `teampass_log_items_id_item_IDX` ON `teampass_log_items` (`id_item`,`date`);

CREATE TABLE IF NOT EXISTS `teampass_misc` (
	`increment_id` int(12) NOT null AUTO_INCREMENT,
	`type` varchar(50) NOT NULL,
	`intitule` varchar(100) NOT NULL,
	`valeur` varchar(500) NOT NULL,
	PRIMARY KEY (`increment_id`)
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
('admin', 'duplicate_item', '1'),
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
('admin', 'pw_life_duration', '0'),
('admin', 'maintenance_mode', '0'),
('admin', 'enable_sts', '0'),
('admin', 'encryptClientServer', '1'),
('admin', 'cpassman_version','__VERSION__'),
('admin', 'ldap_mode', '1'),
('admin', 'ldap_type','posix-search'),
('admin', 'ldap_suffix', '0'),
('admin', 'ldap_domain_dn', '0'),
('admin', 'ldap_domain_controler', 'localhost'),
('admin', 'ldap_user_attribute', 'uid'),
('admin', 'ldap_ssl', '0'),
('admin', 'ldap_tls', '0'),
('admin', 'ldap_elusers', '0'),
('admin', 'ldap_search_base', 'ou=users,dc=yunohost,dc=org'),
('admin', 'ldap_port', '389'),
('admin', 'richtext', '0'),
('admin', 'allow_print', '1'),
('admin', 'roles_allowed_to_print', '1'),
('admin', 'show_description', '1'),
('admin', 'anyone_can_modify', '0'),
('admin', 'anyone_can_modify_bydefault', '0'),
('admin', 'nb_bad_authentication', '3'),
('admin', 'utf8_enabled', '1'),
('admin', 'restricted_to', '0'),
('admin', 'restricted_to_roles', '0'),
('admin', 'enable_send_email_on_user_login', '0'),
('admin', 'enable_user_can_create_folders', '1'),
('admin', 'insert_manual_entry_item_history', '0'),
('admin', 'enable_kb', '0'),
('admin', 'enable_email_notification_on_item_shown', '0'),
('admin', 'enable_email_notification_on_user_pw_change', '1'),
('admin', 'custom_logo', ''),
('admin', 'custom_login_text', ''),
('admin', 'default_language', '__LANG__'),
('admin', 'send_stats', '0'),
('admin', 'send_statistics_items', 'stat_country;stat_users;stat_items;stat_items_shared;stat_folders;stat_folders_shared;stat_admins;stat_managers;stat_ro;stat_mysqlversion;stat_phpversion;stat_teampassversion;stat_languages;stat_kb;stat_suggestion;stat_customfields;stat_api;stat_2fa;stat_agses;stat_duo;stat_ldap;stat_syslog;stat_stricthttps;stat_fav;stat_pf;'),
('admin', 'send_stats_time', '3600'),
('admin', 'get_tp_info', '1'),
('admin', 'send_mail_on_user_login', '0'),
('cron', 'sending_emails', '0'),
('admin', 'nb_items_by_query', 'auto'),
('admin', 'enable_delete_after_consultation', '0'),
('admin', 'enable_personal_saltkey_cookie', '0'),
('admin', 'personal_saltkey_cookie_duration', '31'),
('admin', 'email_smtp_server', 'localhost'),
('admin', 'email_smtp_auth', 'false'),
('admin', 'email_auth_username', ''),
('admin', 'email_auth_pwd', ''),
('admin', 'email_port', '465'),
('admin', 'email_security', 'tls'),
('admin', 'email_server_url', 'https://__DOMAIN____PATH__'),
('admin', 'email_from', 'root@__DOMAIN__'),
('admin', 'email_from_name', 'Teampass'),
('admin', 'pwd_maximum_length', '100'),
('admin', 'google_authentication', '0'),
('admin', 'delay_item_edition', '0'),
('admin', 'allow_import', '1'),
('admin', 'proxy_ip', ''),
('admin', 'proxy_port', ''),
('admin', 'upload_maxfilesize', '10mb'),
('admin', 'upload_docext', 'doc,docx,dotx,xls,xlsx,xltx,rtf,csv,txt,pdf,ppt,pptx,pot,dotx,xltx'),
('admin', 'upload_imagesext', 'jpg,jpeg,gif,png'),
('admin', 'upload_pkgext', '7z,rar,tar,zip'),
('admin', 'upload_otherext', 'sql,xml'),
('admin', 'upload_imageresize_options', '1'),
('admin', 'upload_imageresize_width', '800'),
('admin', 'upload_imageresize_height', '600'),
('admin', 'upload_imageresize_quality', '90'),
('admin', 'use_md5_password_as_salt', '1'),
('admin', 'ga_website_name', 'TeamPass for ChangeMe'),
('admin', 'api', '0'),
('admin', 'subfolder_rights_as_parent', '1'),
('admin', 'show_only_accessible_folders', '1'),
('admin', 'enable_suggestion', '0'),
('admin', 'otv_expiration_period', '7'),
('admin', 'default_session_expiration_time', '60'),
('admin', 'duo', '0'),
('admin', 'enable_server_password_change', '0'),
('admin', 'ldap_object_class', 'person'),
('admin', 'bck_script_path', '__FINALPATH__/backups/'),
('admin', 'bck_script_filename', 'bck_teampass'),
('admin', 'syslog_enable', '0'),
('admin', 'syslog_host', 'localhost'),
('admin', 'syslog_port', '514'),
('admin', 'manager_move_item', '0'),
('admin', 'create_item_without_password', '1'),
('admin', 'otv_is_enabled', '1'),
('admin', 'agses_authentication_enabled', '0'),
('admin', 'item_extra_fields', '0'),
('admin', 'saltkey_ante_2127', 'none'),
('admin', 'migration_to_2127', 'done'),
('admin', 'files_with_defuse', 'done'),
('admin', 'timezone', 'UTC'),
('admin', 'enable_attachment_encryption', '1'),
('admin', 'personal_saltkey_security_level', '50'),
('admin', 'ldap_new_user_is_administrated_by', '0'),
('admin', 'disable_show_forgot_pwd_link', '1'),
('admin', 'offline_key_level', '0'),
('admin', 'enable_http_request_login', '0'),
('admin', 'ldap_and_local_authentication', '0');
-- Default value
--('admin', 'enable_pf_feature', '0'),
--('admin', 'log_connections', '1'),
--('admin', 'log_accessed', '1'),
--('admin', 'duplicate_item', '0'),
--('admin', 'maintenance_mode', '1'),
--('admin', 'ldap_mode', '0'),
--('admin', 'ldap_type', '0'),
--('admin', 'ldap_domain_controler', '0'),
--('admin', 'ldap_user_attribute', '0'),
--('admin', 'ldap_search_base', '0'),
--('admin', 'allow_print', '0'),
--('admin', 'roles_allowed_to_print', '0'),
--('admin', 'nb_bad_authentication', '0'),
--('admin', 'enable_user_can_create_folders', '0'),
--('admin', 'enable_email_notification_on_user_pw_change', '0'),
--('admin', 'default_language', 'english'),
--('admin', 'email_smtp_server', ''),
--('admin', 'email_smtp_auth', ''),
--('admin', 'email_port', ''),
--('admin', 'email_security', ''),
--('admin', 'email_server_url', ''),
--('admin', 'email_from', ''),
--('admin', 'email_from_name', ''),
--('admin', 'pwd_maximum_length', '40'),
--('admin', 'allow_import', '0'),
--('admin', 'use_md5_password_as_salt', '0'),
--('admin', 'subfolder_rights_as_parent', '0'),
--('admin', 'show_only_accessible_folders', '0'),
--('admin', 'ldap_object_class', '0'),
--('admin', 'create_item_without_password', '0'),
--('admin', 'otv_is_enabled', '1'),
--('admin', 'disable_show_forgot_pwd_link', '0'),


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
	`derniers` text NULL,
	`key_tempo` varchar(100) NULL,
	`last_pw_change` varchar(30) NULL,
	`last_pw` text NULL,
	`admin` tinyint(1) NOT null DEFAULT '0',
	`fonction_id` varchar(255) NULL,
	`groupes_interdits` varchar(255) NULL,
	`last_connexion` varchar(30) NULL,
	`gestionnaire` int(11) NOT null DEFAULT '0',
	`email` varchar(300) NOT NULL DEFAULT 'none',
	`favourites` varchar(300) NULL,
	`latest_items` varchar(300) NULL,
	`personal_folder` int(1) NOT null DEFAULT '0',
	`disabled` tinyint(1) NOT null DEFAULT '0',
	`no_bad_attempts` tinyint(1) NOT null DEFAULT '0',
	`can_create_root_folder` tinyint(1) NOT null DEFAULT '1',
	`read_only` tinyint(1) NOT null DEFAULT '0',
	`timestamp` varchar(30) NOT null DEFAULT '0',
	`user_language` varchar(50) NOT null DEFAULT '0',
	`name` varchar(100) NULL,
	`lastname` varchar(100) NULL,
	`session_end` varchar(30) NULL,
	`isAdministratedByRole` tinyint(5) NOT null DEFAULT '0',
	`psk` varchar(400) NULL,
	`ga` varchar(50) NULL,
	`ga_temporary_code` VARCHAR(20) NOT NULL DEFAULT 'none',
	`avatar` varchar(255) NULL,
	`avatar_thumb` varchar(255) NULL,
	`upgrade_needed` BOOLEAN NOT NULL DEFAULT FALSE,
	`treeloadstrategy` varchar(30) NOT null DEFAULT 'full',
	`can_manage_all_users` tinyint(1) NOT NULL DEFAULT '0',
	`usertimezone` VARCHAR(50) NOT NULL DEFAULT 'not_defined',
	`agses-usercardid` VARCHAR(50) NOT NULL DEFAULT '0',
	`encrypted_psk` text NULL,
	`user_ip` varchar(400) NOT null DEFAULT 'none',
	`user_api_key` varchar(500) NOT null DEFAULT 'none',
	PRIMARY KEY (`id`),
	UNIQUE KEY `login` (`login`)
) CHARSET=utf8;

INSERT INTO `teampass_users` (`id`, `login`, `pw`, `admin`, `gestionnaire`, `personal_folder`, `groupes_visibles`, `email`, `encrypted_psk`, `last_pw_change`) VALUES
('1', 'admin', '__BCRYPT_MDP__', '1', '0', '0', '', '', '', '__TIME__');

CREATE TABLE IF NOT EXISTS `teampass_tags` (
	`id` int(12) NOT null AUTO_INCREMENT,
	`tag` varchar(30) NOT NULL,
	`item_id` int(12) NOT NULL,
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_log_system` (
	`id` int(12) NOT null AUTO_INCREMENT,
	`type` varchar(20) NOT NULL,
	`date` varchar(30) NOT NULL,
	`label` text NOT NULL,
	`qui` varchar(255) NOT NULL,
	`field_1` varchar(250) DEFAULT NULL,
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_files` (
	`id` int(11) NOT null AUTO_INCREMENT,
	`id_item` int(11) NOT NULL,
	`name` varchar(100) NOT NULL,
	`size` int(10) NOT NULL,
	`extension` varchar(10) NOT NULL,
	`type` varchar(255) NOT NULL,
	`file` varchar(50) NOT NULL,
	`status` varchar(50) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_cache` (
	`increment_id`INT(12) NOT NULL AUTO_INCREMENT,
	`id` int(12) NOT NULL,
	`label` varchar(500) NOT NULL,
	`description` text NOT NULL,
	`tags` text DEFAULT NULL,
	`id_tree` int(12) NOT NULL,
	`perso` tinyint(1) NOT NULL,
	`restricted_to` varchar(200) DEFAULT NULL,
	`login` varchar(200) DEFAULT NULL,
	`folder` varchar(300) NOT NULL,
	`author` varchar(50) NOT NULL,
	`renewal_period` tinyint(4) NOT NULL DEFAULT '0',
	`timestamp` varchar(50) DEFAULT NULL,
	`url` varchar(500) NOT NULL DEFAULT '0',
	`encryption_type` VARCHAR(50) DEFAULT NULL DEFAULT '0',
	PRIMARY KEY (`increment_id`)
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
	`increment_id` int(12) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`role_id` int(12) NOT NULL,
	`folder_id` int(12) NOT NULL,
	`type` varchar(5) NOT NULL DEFAULT 'R',
	KEY `role_id_idx` (`role_id`)
) CHARSET=utf8;

INSERT INTO teampass_roles_values VALUES("1","1","1","W");

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
	`increment_id` int(12) NOT NULL AUTO_INCREMENT,
	`kb_id` int(12) NOT NULL,
	`item_id` int(12) NOT NULL,
	PRIMARY KEY (`increment_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_restriction_to_roles` (
	`increment_id` int(12) NOT NULL AUTO_INCREMENT,
	`role_id` int(12) NOT NULL,
	`item_id` int(12) NOT NULL,
	PRIMARY KEY (`increment_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_languages` (
	`id` INT(10) NOT null AUTO_INCREMENT,
	`name` VARCHAR(50) NOT null ,
	`label` VARCHAR(50) NOT null ,
	`code` VARCHAR(10) NOT null ,
	`flag` VARCHAR(30) NOT NULL,
	PRIMARY KEY (`id`)
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
('portuguese_br', 'Portuguese (Brazil)' , 'pr-bt', 'pr-bt.png'),
('chinese', 'Chinese' , 'cn', 'cn.png'),
('swedish', 'Swedish' , 'se', 'se.png'),
('dutch', 'Dutch' , 'nl', 'nl.png'),
('catalan', 'Catalan' , 'ct', 'ct.png'),
('bulgarian', 'Bulgarian' , 'bg', 'bg.png'),
('greek', 'Greek' , 'gr', 'gr.png'),
('hungarian', 'Hungarian' , 'hu', 'hu.png'),
('polish', 'Polish' , 'pl', 'pl.png'),
('romanian', 'Romanian' , 'ro', 'ro.png'),
('ukrainian', 'Ukrainian' , 'ua', 'ua.png'),
('vietnamese', 'Vietnamese' , 'vi', 'vi.png'),
('estonian', 'Estonian' , 'ee', 'ee.png');

CREATE TABLE IF NOT EXISTS `teampass_emails` (
	`increment_id` int(12) NOT NULL AUTO_INCREMENT,
	`timestamp` INT(30) NOT null ,
	`subject` VARCHAR(255) NOT null ,
	`body` TEXT NOT null ,
	`receivers` VARCHAR(255) NOT null ,
	`status` VARCHAR(30) NOT NULL,
	PRIMARY KEY (`increment_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_automatic_del` (
	`item_id` int(11) NOT NULL,
	`del_enabled` tinyint(1) NOT NULL,
	`del_type` tinyint(1) NOT NULL,
	`del_value` varchar(35) NOT NULL,
	PRIMARY KEY (`item_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_items_edition` (
	`increment_id` int(12) NOT NULL AUTO_INCREMENT,
	`item_id` int(11) NOT NULL,
	`user_id` int(12) NOT NULL,
	`timestamp` varchar(50) NOT NULL,
	KEY `item_id_idx` (`item_id`),
	PRIMARY KEY (`increment_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_categories` (
	`id` int(12) NOT NULL AUTO_INCREMENT,
	`parent_id` int(12) NOT NULL,
	`title` varchar(255) NOT NULL,
	`level` int(2) NOT NULL,
	`description` text NULL,
	`type` varchar(50) NULL default '',
	`order` int(12) NOT NULL default '0',
	`encrypted_data` tinyint(1) NOT NULL default '1',
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_categories_items` (
	`id` int(12) NOT NULL AUTO_INCREMENT,
	`field_id` int(11) NOT NULL,
	`item_id` int(11) NOT NULL,
	`data` text NOT NULL,
	`data_iv` text NOT NULL,
	`encryption_type` VARCHAR(20) NOT NULL DEFAULT 'not_set',
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_categories_folders` (
	`id_category` int(12) NOT NULL,
	`id_folder` int(12) NOT NULL,
	PRIMARY KEY (`id_category`)
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
	`originator` int(12) NOT NULL,
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_suggestion` (
	`id` tinyint(12) NOT NULL AUTO_INCREMENT,
	`label` varchar(255) NOT NULL,
	`pw` text NOT NULL,
	`pw_iv` text NOT NULL,
	`pw_len` int(5) NOT NULL,
	`description` text NOT NULL,
	`author_id` int(12) NOT NULL,
	`folder_id` int(12) NOT NULL,
	`comment` text NOT NULL,
	`suggestion_type` varchar(10) NOT NULL default 'new',
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_export` (
	`increment_id` int(12) NOT NULL AUTO_INCREMENT,
	`id` int(12) NOT NULL,
	`label` varchar(500) NOT NULL,
	`login` varchar(100) NOT NULL,
	`description` text NOT NULL,
	`pw` text NOT NULL,
	`path` varchar(500) NOT NULL,
	`email` varchar(500) NOT NULL default 'none',
	`url` varchar(500) NOT NULL default 'none',
	`kbs` varchar(500) NOT NULL default 'none',
	`tags` varchar(500) NOT NULL default 'none',
	PRIMARY KEY (`increment_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_tokens` (
	`id` int(12) NOT NULL,
	`user_id` int(12) NOT NULL,
	`token` varchar(255) NOT NULL,
	`reason` varchar(255) NOT NULL,
	`creation_timestamp` varchar(50) NOT NULL,
	`end_timestamp` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_items_change` (
	`id` int(12) NOT NULL AUTO_INCREMENT,
	`item_id` int(12) NOT NULL,
	`label` varchar(255) NOT NULL DEFAULT 'none',
	`pw` text NOT NULL,
	`login` varchar(255) NOT NULL DEFAULT 'none',
	`email` varchar(255) NOT NULL DEFAULT 'none',
	`url` varchar(255) NOT NULL DEFAULT 'none',
	`description` text NOT NULL,
	`comment` text NOT NULL,
	`folder_id` tinyint(12) NOT NULL,
	`user_id` int(12) NOT NULL,
	`timestamp` varchar(50) NOT NULL DEFAULT 'none',
	PRIMARY KEY (`id`)
) CHARSET=utf8;
