<?php
global $lang, $txt, $pathTeampas, $urlTeampass, $pwComplexity, $mngPages;
global $server, $user, $pass, $database, $pre, $db, $port, $encoding;

### DATABASE connexion parameters ###
$server = "localhost";
$user = "__DBUSER__";
$pass = "__DBPWD__";
$database = "__DBUSER__";
$pre = "teampass_";
$port = 3306;
$encoding = "utf8";

@date_default_timezone_set($_SESSION['settings']['timezone']);
@define('SECUREPATH', '__FINALPATH__/includes');
require_once "__SKPATH__sk.php";
?>
