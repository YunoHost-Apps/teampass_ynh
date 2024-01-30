<?php

$SETTINGS['cpassman_dir'] = __DIR__;
$_SESSION['CPM'] = 1 ;
require_once $SETTINGS['cpassman_dir'] . '/includes/config/settings.php';
require_once $SETTINGS['cpassman_dir'] . '/sources/main.functions.php';

handleConfigFile('rebuild', $SETTINGS);
?>
