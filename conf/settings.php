<?php
global $lang, $txt, $pathTeampas, $urlTeampass, $pwComplexity, $mngPages;
global $server, $user, $pass, $database, $pre, $db, $port, $encoding;

### DATABASE connexion parameters ###
$server = "localhost";
$user = "__DB_USER__";
$pass = "__DB_PWD__";
$database = "__DB_NAME__";
$pre = "teampass_";
$port = 3306;
$encoding = "utf8";

@date_default_timezone_set($_SESSION['settings']['timezone']);
@define('SECUREPATH', '/etc/__APP__/');
if (file_exists("/etc/__APP__/sk.php")) {
    require_once "/etc/__APP__/sk.php";
}
