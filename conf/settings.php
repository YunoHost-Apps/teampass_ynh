<?php
global $lang, $txt, $pathTeampas, $urlTeampass, $pwComplexity, $mngPages;
global $server, $user, $pass, $database, $pre, $db, $port, $encoding;

### DATABASE connexion parameters ###
$server = "localhost";
$user = "__DB_NAME__";
$pass = "__DB_PWD__";
$database = "__DB_NAME__";
$pre = "teampass_";
$port = 3306;
$encoding = "utf8";

@date_default_timezone_set($_SESSION['settings']['timezone']);
@define('SECUREPATH', '__PATH_SK_FILE__');
if (file_exists("__PATH_SK_FILE__sk.php")) {
    require_once "__PATH_SK_FILE__sk.php";
}
