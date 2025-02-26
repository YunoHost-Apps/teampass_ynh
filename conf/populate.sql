-- Infos à charger en base de donnée tirée du fichier install/install.queries.php. A partir de la ligne 295 (step_5)
-- Use the script teampass_pre_upgrade_ynh/conf/diff_populate_sql.sh and search step_5 to find what's new.

ALTER DATABASE `__APP__` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `__APP__`;

CREATE TABLE IF NOT EXISTS `teampass_defuse_passwords` (
	`increment_id` int(12) NOT NULL AUTO_INCREMENT,
	`type` varchar(100) NOT NULL,
	`object_id` int(12) NOT NULL,
	`password` text NOT NULL,
	PRIMARY KEY (`increment_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_notification` (
	`increment_id` INT(12) NOT NULL AUTO_INCREMENT,
	`item_id` INT(12) NOT NULL,
	`user_id` INT(12) NOT NULL,
	PRIMARY KEY (`increment_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_sharekeys_items` (
	`increment_id` int(12) NOT NULL AUTO_INCREMENT,
	`object_id` int(12) NOT NULL,
	`user_id` int(12) NOT NULL,
	`share_key` text NOT NULL,
	PRIMARY KEY (`increment_id`),
	INDEX idx_object_user (`object_id`, `user_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_sharekeys_logs` (
	`increment_id` int(12) NOT NULL AUTO_INCREMENT,
	`object_id` int(12) NOT NULL,
	`user_id` int(12) NOT NULL,
	`share_key` text NOT NULL,
	PRIMARY KEY (`increment_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_sharekeys_fields` (
	`increment_id` int(12) NOT NULL AUTO_INCREMENT,
	`object_id` int(12) NOT NULL,
	`user_id` int(12) NOT NULL,
	`share_key` text NOT NULL,
	PRIMARY KEY (`increment_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_sharekeys_suggestions` (
	`increment_id` int(12) NOT NULL AUTO_INCREMENT,
	`object_id` int(12) NOT NULL,
	`user_id` int(12) NOT NULL,
	`share_key` text NOT NULL,
	PRIMARY KEY (`increment_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_sharekeys_files` (
	`increment_id` int(12) NOT NULL AUTO_INCREMENT,
	`object_id` int(12) NOT NULL,
	`user_id` int(12) NOT NULL,
	`share_key` text NOT NULL,
	PRIMARY KEY (`increment_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_items` (
	`id` int(12) NOT null AUTO_INCREMENT,
	`label` varchar(500) NOT NULL,
	`description` text DEFAULT NULL,
	`pw` text DEFAULT NULL,
	`pw_iv` text DEFAULT NULL,
	`pw_len` int(5) NOT NULL DEFAULT '0',
	`url` text DEFAULT NULL,
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
	`fa_icon` varchar(100) DEFAULT NULL,
	`item_key` varchar(500) NOT NULL DEFAULT '-1',
	`created_at` varchar(30) NULL,
	`updated_at` varchar(30) NULL,
	`deleted_at` varchar(30) NULL,
	PRIMARY KEY (`id`),
	KEY `restricted_inactif_idx` (`restricted_to`,`inactif`),
	INDEX items_perso_id_idx (`perso`, `id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_log_items` (
	`increment_id` int(12) NOT NULL AUTO_INCREMENT,
	`id_item` int(8) NOT NULL,
	`date` varchar(50) NOT NULL,
	`id_user` int(8) NOT NULL,
	`action` varchar(250) NULL,
	`raison` text NULL,
	`old_value` MEDIUMTEXT NULL DEFAULT NULL,
	`encryption_type` VARCHAR(20) NOT NULL DEFAULT 'not_set',
	PRIMARY KEY (`increment_id`),
	INDEX log_items_item_action_user_idx (`id_item`, `action`, `id_user`)
) CHARSET=utf8;

CREATE INDEX `teampass_log_items_id_item_IDX` ON `teampass_log_items` (`id_item`,`date`);

CREATE TABLE IF NOT EXISTS `teampass_misc` (
	`increment_id` int(12) NOT null AUTO_INCREMENT,
	`type` varchar(50) NOT NULL,
	`intitule` varchar(100) NOT NULL,
	`valeur` varchar(500) NOT NULL,
	`created_at` varchar(255) NULL DEFAULT NULL,
	`updated_at` varchar(255) NULL DEFAULT NULL,
	`is_encrypted` tinyint(1) NOT NULL DEFAULT '0',
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
('admin', 'cpassman_dir', '__INSTALL_DIR__'),
('admin', 'cpassman_url', 'https://__DOMAIN____PATH__'),
('admin', 'favicon', 'https://__DOMAIN____PATH__/favicon.ico'),
('admin', 'path_to_upload_folder', '__INSTALL_DIR__/upload'),
('admin', 'path_to_files_folder', '__INSTALL_DIR__/files'),
('admin', 'url_to_files_folder', 'https://__DOMAIN____PATH__/files'),
('admin', 'activate_expiration', '0'),
('admin', 'pw_life_duration', '0'),
('admin', 'maintenance_mode', '0'),
('admin', 'enable_sts', '0'),
('admin', 'encryptClientServer', '1'),
('admin', 'teampass_version', '__VERSION__'),
('admin', 'ldap_mode', '1'),
('admin', 'ldap_type', 'OpenLDAP'),
('admin', 'ldap_user_attribute', 'uid'),
('admin', 'ldap_ssl', '0'),
('admin', 'ldap_tls', '0'),
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
('admin', 'default_language', '__LANGUE__'),
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
('admin', 'bck_script_path', '__INSTALL_DIR__/backups'),
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
('admin', 'ldap_and_local_authentication', '0'),
('admin', 'secure_display_image', '1'),
('admin', 'upload_zero_byte_file', '0'),
('admin', 'upload_all_extensions_file', '0'),
('admin', 'bck_script_passkey', ''),
('admin', 'admin_2fa_required', '1'),
('admin', 'password_overview_delay', '4'),
('admin', 'copy_to_clipboard_small_icons', '1'),
('admin', 'duo_ikey', ''),
('admin', 'duo_skey', ''),
('admin', 'duo_host', ''),
('admin', 'duo_failmode', 'secure'),
('admin', 'roles_allowed_to_print_select', ''),
('admin', 'clipboard_life_duration', '30'),
('admin', 'mfa_for_roles', ''),
('admin', 'tree_counters', '0'),
('admin', 'settings_offline_mode', '0'),
('admin', 'settings_tree_counters', '0'),
('admin', 'enable_massive_move_delete', '0'),
('admin', 'email_debug_level', '0'),
('admin', 'ga_reset_by_user', ''),
('admin', 'onthefly-backup-key', ''),
('admin', 'onthefly-restore-key', ''),
('admin', 'ldap_user_dn_attribute', 'dn'),
('admin', 'ldap_dn_additional_user_dn', ''),
('admin', 'ldap_user_object_filter', ''),
('admin', 'ldap_bdn', 'ou=users,dc=yunohost,dc=org'),
('admin', 'ldap_hosts', 'localhost'),
('admin', 'ldap_password', ''),
('admin', 'ldap_username', ''),
('admin', 'api_token_duration', '60'),
('timestamp', 'last_folder_change', ''),
('admin', 'enable_tasks_manager', '1'),
('admin', 'task_maximum_run_time', '300'),
('admin', 'tasks_manager_refreshing_period', '20'),
('admin', 'maximum_number_of_items_to_treat', '100'),
('admin', 'number_users_build_cache_tree', '10'),
('admin', 'ldap_tls_certifacte_check', 'LDAP_OPT_X_TLS_NEVER'),
('admin', 'enable_tasks_log', '0'),
('admin', 'upgrade_timestamp', '__TIME__'),
('admin', 'enable_ad_users_with_ad_groups', '0'),
('admin', 'enable_ad_user_auto_creation', '0'),
('admin', 'ldap_guid_attibute', 'objectguid'),
('admin', 'sending_emails_job_frequency', '2'),
('admin', 'user_keys_job_frequency', '1'),
('admin', 'items_statistics_job_frequency', '5'),
('admin', 'users_personal_folder_task', ''),
('admin', 'clean_orphan_objects_task', ''),
('admin', 'purge_temporary_files_task', ''),
('admin', 'rebuild_config_file', ''),
('admin', 'reload_cache_table_task', ''),
('admin', 'maximum_session_expiration_time', '60'),
('admin', 'items_ops_job_frequency', '1'),
('admin', 'enable_refresh_task_last_execution', '1'),
('admin', 'ldap_group_objectclasses_attibute', 'posixGroup'),
('admin', 'pwd_default_length', '14'),
('admin', 'tasks_log_retention_delay', '30'),
('admin', 'oauth2_enabled', '0'),
('admin', 'oauth2_client_id', ''),
('admin', 'oauth2_client_secret', ''),
('admin', 'oauth2_client_endpoint', ''),
('admin', 'oauth2_client_urlResourceOwnerDetails', ''),
('admin', 'oauth2_client_token', ''),
('admin', 'oauth2_client_scopes', 'openid,profile,email,User.Read,Group.Read.All'),
('admin', 'oauth2_client_appname', 'Login with Azure'),
('admin', 'show_item_data', '0'),
('admin', 'oauth2_tenant_id', ''),
('admin', 'limited_search_default', '0'),
('admin', 'highlight_selected', '0'),
('admin', 'highlight_favorites', '0');

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
	`renewal_period` int(5) NOT null DEFAULT '0',
	`fa_icon` VARCHAR(100) NOT NULL DEFAULT 'fas fa-folder',
	`fa_icon_selected` VARCHAR(100) NOT NULL DEFAULT 'fas fa-folder-open',
	`categories` longtext NOT NULL,
	`nb_items_in_folder` int(10) NOT NULL DEFAULT '0',
	`nb_subfolders` int(10) NOT NULL DEFAULT '0',
	`nb_items_in_subfolders` int(10) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`),
	KEY `nested_tree_parent_id` (`parent_id`),
	KEY `nested_tree_nleft` (`nleft`),
	KEY `nested_tree_nright` (`nright`),
	KEY `nested_tree_nlevel` (`nlevel`),
	KEY `personal_folder_idx` (`personal_folder`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_rights` (
	`id` int(12) NOT null AUTO_INCREMENT,
	`tree_id` int(12) NOT NULL,
	`fonction_id` int(12) NOT NULL,
	`authorized` tinyint(1) NOT null DEFAULT '0',
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_users` (
	`id` int(12) NOT null AUTO_INCREMENT,
	`login` varchar(500) NOT NULL,
	`pw` varchar(400) NOT NULL,
	`groupes_visibles` varchar(1000) NOT NULL,
	`derniers` text NULL DEFAULT NULL,
	`key_tempo` varchar(100) NULL DEFAULT NULL,
	`last_pw_change` varchar(30) NULL DEFAULT NULL,
	`last_pw` text NULL DEFAULT NULL,
	`admin` tinyint(1) NOT null DEFAULT '0',
	`fonction_id` varchar(1000) NULL DEFAULT NULL,
	`groupes_interdits` varchar(1000) NULL DEFAULT NULL,
	`last_connexion` varchar(30) NULL DEFAULT NULL,
	`gestionnaire` int(11) NOT null DEFAULT '0',
	`email` varchar(300) NOT NULL DEFAULT 'none',
	`favourites` varchar(1000) NULL DEFAULT NULL,
	`latest_items` varchar(1000) NULL DEFAULT NULL,
	`personal_folder` int(1) NOT null DEFAULT '0',
	`disabled` tinyint(1) NOT null DEFAULT '0',
	`can_create_root_folder` tinyint(1) NOT null DEFAULT '0',
	`read_only` tinyint(1) NOT null DEFAULT '0',
	`timestamp` varchar(30) NOT null DEFAULT '0',
	`user_language` varchar(50) NOT null DEFAULT '0',
	`name` varchar(100) NULL DEFAULT NULL,
	`lastname` varchar(100) NULL DEFAULT NULL,
	`session_end` varchar(30) NULL DEFAULT NULL,
	`isAdministratedByRole` tinyint(5) NOT null DEFAULT '0',
	`psk` varchar(400) NULL DEFAULT NULL,
	`ga` varchar(50) NULL DEFAULT NULL,
	`ga_temporary_code` VARCHAR(20) NOT NULL DEFAULT 'none',
	`avatar` varchar(1000) NULL DEFAULT NULL,
	`avatar_thumb` varchar(1000) NULL DEFAULT NULL,
	`upgrade_needed` BOOLEAN NOT NULL DEFAULT FALSE,
	`treeloadstrategy` varchar(30) NOT null DEFAULT 'full',
	`can_manage_all_users` tinyint(1) NOT NULL DEFAULT '0',
	`usertimezone` VARCHAR(50) NOT NULL DEFAULT 'not_defined',
	`agses-usercardid` VARCHAR(50) NOT NULL DEFAULT '0',
	`encrypted_psk` text NULL DEFAULT NULL,
	`user_ip` varchar(400) NOT null DEFAULT 'none',
	`user_ip_lastdate` varchar(50) NULL DEFAULT NULL,
	`yubico_user_key` varchar(100) NOT null DEFAULT 'none',
	`yubico_user_id` varchar(100) NOT null DEFAULT 'none',
	`public_key` TEXT NULL DEFAULT NULL,
	`private_key` TEXT NULL DEFAULT NULL,
	`special` VARCHAR(250) NOT NULL DEFAULT 'none',
	`auth_type` VARCHAR(200) NOT NULL DEFAULT 'local',
	`is_ready_for_usage` BOOLEAN NOT NULL DEFAULT FALSE,
	`otp_provided` BOOLEAN NOT NULL DEFAULT FALSE,
	`roles_from_ad_groups` varchar(1000) NULL DEFAULT NULL,
	`ongoing_process_id` VARCHAR(100) NULL DEFAULT NULL,
	`mfa_enabled` tinyint(1) NOT null DEFAULT '1',
	`created_at` varchar(30) NULL DEFAULT NULL,
	`updated_at` varchar(30) NULL DEFAULT NULL,
	`deleted_at` varchar(30) NULL DEFAULT NULL,
	`keys_recovery_time` VARCHAR(500) NULL DEFAULT NULL,
	`aes_iv` TEXT NULL DEFAULT NULL,
	`split_view_mode` tinyint(1) NOT null DEFAULT '0',
	PRIMARY KEY (`id`),
	UNIQUE KEY `login` (`login`)
) CHARSET=utf8;



INSERT INTO `teampass_users` (`id`, `login`, `pw`, `admin`, `gestionnaire`, `personal_folder`, `groupes_visibles`, `email`, `encrypted_psk`, `last_pw_change`, `name`, `lastname`, `can_create_root_folder`, `public_key`, `private_key`, `is_ready_for_usage`, `otp_provided`, `created_at`) VALUES
(1, 'admin', '__BCRYPT_MDP__', '1', '0', '0', '0', '', '', '__TIME__', '', '', '1', 'none', 'none', '1', '1', '__TIME__');

INSERT INTO `teampass_users` (`id`, `login`, `pw`, `groupes_visibles`, `derniers`, `key_tempo`, `last_pw_change`, `last_pw`, `admin`, `fonction_id`, `groupes_interdits`, `last_connexion`, `gestionnaire`, `email`, `favourites`, `latest_items`, `personal_folder`, `is_ready_for_usage`, `otp_provided`, `created_at`) VALUES
(9999991, 'API', '', '', '', '', '', '', '1', '', '', '', '0', '', '', '', '0', '0', '1', '__TIME__');

INSERT INTO `teampass_users` (`id`, `login`, `pw`, `groupes_visibles`, `derniers`, `key_tempo`, `last_pw_change`, `last_pw`, `admin`, `fonction_id`, `groupes_interdits`, `last_connexion`, `gestionnaire`, `email`, `favourites`, `latest_items`, `personal_folder`, `is_ready_for_usage`, `otp_provided`, `created_at`) VALUES
(9999999, 'OTV', '', '', '', '', '', '', '1', '', '', '', '0', '', '', '', '0', '0', '1', '__TIME__');

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
	`name` TEXT NOT NULL,
	`size` int(10) NOT NULL,
	`extension` varchar(10) NOT NULL,
	`type` varchar(255) NOT NULL,
	`file` varchar(50) NOT NULL,
	`status` varchar(50) NOT NULL DEFAULT '0',
	`content` longblob DEFAULT NULL,
	`confirmed` INT(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_cache` (
	`increment_id`INT(12) NOT NULL AUTO_INCREMENT,
	`id` int(12) NOT NULL,
	`label` varchar(500) NOT NULL,
	`description` MEDIUMTEXT NULL DEFAULT NULL,
	`tags` text DEFAULT NULL,
	`id_tree` int(12) NOT NULL,
	`perso` tinyint(1) NOT NULL,
	`restricted_to` varchar(200) DEFAULT NULL,
	`login` text DEFAULT NULL,
	`folder` text NOT NULL,
	`author` varchar(50) NOT NULL,
	`renewal_period` tinyint(4) NOT NULL DEFAULT '0',
	`timestamp` varchar(50) DEFAULT NULL,
	`url` text NULL DEFAULT NULL,
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

INSERT INTO `teampass_roles_title` (`id`, `title`, `allow_pw_change`, `complexity`, `creator_id`) VALUES (NULL, 'Default', '0', '48', '0');

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
	`flag` VARCHAR(50) NOT NULL,
	`code_poeditor` VARCHAR(30) NOT NULL,
	PRIMARY KEY (`id`)
) CHARSET=utf8;

INSERT INTO `teampass_languages` (`id`, `name`, `label`, `code`, `flag`, `code_poeditor`) VALUES
(1, 'french', 'French', 'fr', 'fr.png', 'fr'),
(2, 'english', 'English', 'us', 'us.png', 'en'),
(3, 'spanish', 'Spanish', 'es', 'es.png', 'es'),
(4, 'german', 'German', 'de', 'de.png', 'de'),
(5, 'czech', 'Czech', 'cs', 'cz.png', 'cs'),
(6, 'italian', 'Italian', 'it', 'it.png', 'it'),
(7, 'russian', 'Russian', 'ru', 'ru.png', 'ru'),
(8, 'turkish', 'Turkish', 'tr', 'tr.png', 'tr'),
(9, 'norwegian', 'Norwegian', 'no', 'no.png', 'no'),
(10, 'japanese', 'Japanese', 'ja', 'ja.png', 'ja'),
(11, 'portuguese', 'Portuguese', 'pr', 'pr.png', 'pt'),
(12, 'portuguese_br', 'Portuguese (Brazil)', 'pr-bt', 'pr-bt.png', 'pt-br'),
(13, 'chinese', 'Chinese', 'zh-Hans', 'cn.png', 'zh-Hans'),
(14, 'swedish', 'Swedish', 'se', 'se.png', 'sv'),
(15, 'dutch', 'Dutch', 'nl', 'nl.png', 'nl'),
(16, 'catalan', 'Catalan', 'ca', 'ct.png', 'ca'),
(17, 'bulgarian', 'Bulgarian', 'bg', 'bg.png', 'bg'),
(18, 'greek', 'Greek', 'gr', 'gr.png', 'el'),
(19, 'hungarian', 'Hungarian', 'hu', 'hu.png', 'hu'),
(20, 'polish', 'Polish', 'pl', 'pl.png', 'pl'),
(21, 'romanian', 'Romanian', 'ro', 'ro.png', 'ro'),
(22, 'ukrainian', 'Ukrainian', 'ua', 'ua.png', 'uk'),
(23, 'vietnamese', 'Vietnamese', 'vi', 'vi.png', 'vi'),
(24, 'estonian', 'Estonian', 'et', 'ee.png', 'et');

CREATE TABLE IF NOT EXISTS `teampass_emails` (
	`increment_id` int(12) NOT NULL AUTO_INCREMENT,
	`timestamp` INT(30) NOT null ,
	`subject` TEXT NOT null ,
	`body` TEXT NOT null ,
	`receivers` TEXT NOT null ,
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
	`masked` tinyint(1) NOT NULL default '0',
	`order` int(12) NOT NULL default '0',
	`encrypted_data` tinyint(1) NOT NULL default '1',
	`role_visibility` varchar(255) NOT NULL DEFAULT 'all',
	`is_mandatory` tinyint(1) NOT NULL DEFAULT '0',
	`regex` varchar(255) NULL default '',
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_categories_items` (
	`id` int(12) NOT NULL AUTO_INCREMENT,
	`field_id` int(11) NOT NULL,
	`item_id` int(11) NOT NULL,
	`data` text NOT NULL,
	`data_iv` text NOT NULL,
	`encryption_type` VARCHAR(20) NOT NULL DEFAULT 'not_set',
	`is_mandatory` BOOLEAN NOT NULL DEFAULT FALSE ,
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_categories_folders` (
	`increment_id` int(12) NOT NULL AUTO_INCREMENT,
	`id_category` int(12) NOT NULL,
	`id_folder` int(12) NOT NULL,
	PRIMARY KEY (`increment_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_api` (
	`increment_id` int(20) NOT NULL AUTO_INCREMENT,
	`type` varchar(15) NOT NULL,
	`label` varchar(255) DEFAULT NULL,
	`value` text DEFAULT NULL,
	`timestamp` varchar(50) NOT NULL,
	`user_id` int(13) DEFAULT NULL,
	`allowed_folders` text NULL DEFAULT NULL,
	`enabled` int(1) NOT NULL DEFAULT '0',
	`allowed_to_create` int(1) NOT NULL DEFAULT '0',
	`allowed_to_read` int(1) NOT NULL DEFAULT '1',
	`allowed_to_update` int(1) NOT NULL DEFAULT '0',
	`allowed_to_delete` int(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`increment_id`),
	KEY `USER` (`user_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_otv` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`timestamp` text NOT NULL,
	`code` varchar(100) NOT NULL,
	`item_id` int(12) NOT NULL,
	`originator` int(12) NOT NULL,
	`encrypted` text NOT NULL,
	`views` INT(10) NOT NULL DEFAULT '0',
	`max_views` INT(10) NULL DEFAULT NULL,
	`time_limit` varchar(100) DEFAULT NULL,
	`shared_globaly` INT(1) NOT NULL DEFAULT '0',
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
	`encryption_type` varchar(20) NOT NULL default 'not_set',
	PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_export` (
	`increment_id` int(12) NOT NULL AUTO_INCREMENT,
	`export_tag` varchar(20) NOT NULL,
	`item_id` int(12) NOT NULL,
	`label` varchar(500) NOT NULL,
	`login` varchar(100) NOT NULL,
	`description` text NOT NULL,
	`pw` text NOT NULL,
	`path` varchar(500) NOT NULL,
	`email` varchar(500) NOT NULL default 'none',
	`url` varchar(500) NOT NULL default 'none',
	`kbs` varchar(500) NOT NULL default 'none',
	`tags` varchar(500) NOT NULL default 'none',
	`folder_id` varchar(10) NOT NULL,
	`perso` tinyint(1) NOT NULL default '0',
	`restricted_to` varchar(200) DEFAULT NULL,
	PRIMARY KEY (`increment_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_tokens` (
	`id` int(12) NOT NULL AUTO_INCREMENT,
	`user_id` int(12) NOT NULL,
	`token` varchar(255) NOT NULL,
	`reason` varchar(255) NOT NULL,
	`creation_timestamp` varchar(50) NOT NULL,
	`end_timestamp` varchar(50) DEFAULT NULL,
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

CREATE TABLE IF NOT EXISTS `teampass_templates` (
	`increment_id` int(12) NOT NULL AUTO_INCREMENT,
	`item_id` int(12) NOT NULL,
	`category_id` int(12) NOT NULL,
	PRIMARY KEY (`increment_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_cache_tree` (
	`increment_id` smallint(32) NOT NULL AUTO_INCREMENT,
	`data` longtext DEFAULT NULL CHECK (json_valid(`data`)),
	`visible_folders` longtext NOT NULL,
	`timestamp` varchar(50) NOT NULL,
	`user_id` int(12) NOT NULL,
	`folders` longtext DEFAULT NULL,
	PRIMARY KEY (`increment_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_background_subtasks` (
	`increment_id` int(12) NOT NULL AUTO_INCREMENT,
	`task_id` int(12) NOT NULL,
	`created_at` varchar(50) NOT NULL,
	`updated_at` varchar(50) DEFAULT NULL,
	`finished_at` varchar(50) DEFAULT NULL,
	`task` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`task`)),
	`process_id` varchar(100) NULL DEFAULT NULL,
	`is_in_progress` tinyint(1) NOT NULL DEFAULT 0,
	`sub_task_in_progress` tinyint(1) NOT NULL DEFAULT 0,
	PRIMARY KEY (`increment_id`)
) CHARSET=utf8;

ALTER TABLE `teampass_background_subtasks` 
    ADD KEY `task_id_idx` (`task_id`);

CREATE TABLE IF NOT EXISTS `teampass_background_tasks` (
	`increment_id` int(12) NOT NULL AUTO_INCREMENT,
	`created_at` varchar(50) NOT NULL,
	`started_at` varchar(50) DEFAULT NULL,
	`updated_at` varchar(50) DEFAULT NULL,
	`finished_at` varchar(50) DEFAULT NULL,
	`process_id` int(12) DEFAULT NULL,
	`process_type` varchar(100) NOT NULL,
	`output` text DEFAULT NULL,
	`arguments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`arguments`)),
	`is_in_progress` tinyint(1) NOT NULL DEFAULT 0,
	`item_id` INT(12) NULL,
	PRIMARY KEY (`increment_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_background_tasks_logs` (
	`increment_id` int(12) NOT NULL AUTO_INCREMENT,
	`created_at` INT NOT NULL,
	`job` varchar(50) NOT NULL,
	`status` varchar(10) NOT NULL,
	`updated_at` INT DEFAULT NULL,
	`finished_at` INT DEFAULT NULL,
	`treated_objects` varchar(20) DEFAULT NULL,
	PRIMARY KEY (`increment_id`),
	INDEX idx_created_at (`created_at`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_ldap_groups_roles` (
	`increment_id` INT(12) NOT NULL AUTO_INCREMENT,
	`role_id` INT(12) NOT NULL,
	`ldap_group_id` VARCHAR(500) NOT NULL,
	`ldap_group_label` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`increment_id`),
	KEY `ROLE` (`role_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_items_otp` (
	`increment_id` int(12) NOT NULL AUTO_INCREMENT,
	`item_id` int(12) NOT NULL,
	`secret` text NOT NULL,
	`timestamp` varchar(100) NOT NULL,
	`enabled` tinyint(1) NOT NULL DEFAULT 0,
	`phone_number` varchar(25) NOT NULL,
	PRIMARY KEY (`increment_id`),
	KEY `ITEM` (`item_id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `teampass_auth_failures` (
	`id` int(12) NOT NULL AUTO_INCREMENT,
	`source` ENUM('login', 'remote_ip') NOT NULL,
	`value` VARCHAR(500) NOT NULL,
	`date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`unlock_at` TIMESTAMP NULL DEFAULT NULL,
	`unlock_code` VARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
) CHARSET=utf8;
