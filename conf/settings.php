<?php
// DATABASE connexion parameters
define("DB_HOST", "localhost");
define("DB_USER", "__DB_USER__");
define("DB_PASSWD", "__DB_PWD__");
define("DB_NAME", "__DB_NAME__");
define("DB_PREFIX", "teampass_");
define("DB_PORT", "3306");
define("DB_ENCODING", "utf8");
define("DB_SSL", false); // if DB over SSL then comment this line
// if DB over SSL then uncomment the following lines
//define("DB_SSL", array(
//    "key" => "",
//    "cert" => "",
//    "ca_cert" => "",
//    "ca_path" => "",
//    "cipher" => ""
//));
define("DB_CONNECT_OPTIONS", array(
    MYSQLI_OPT_CONNECT_TIMEOUT => 10
));

if (isset($_SESSION['settings']['timezone']) === true) {
    date_default_timezone_set($_SESSION['settings']['timezone']);
}
