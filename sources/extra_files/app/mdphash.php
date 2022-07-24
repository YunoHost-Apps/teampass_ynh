<?php
//function bCrypt tirée directement de sources/main.functions.php, ligne 223.
/**
 * genHash().
 *
 * Generate a hash for user login
 *
 * @param string $password
 */
function bCrypt($password, $cost)
{
    $salt = sprintf('$2y$%02d$', $cost);
    if (function_exists('openssl_random_pseudo_bytes')) {
        $salt .= bin2hex(openssl_random_pseudo_bytes(11));
    } else {
        $chars = './ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        for ($i = 0; $i < 22; ++$i) {
            $salt .= $chars[mt_rand(0, 63)];
        }
    }

    return crypt($password, $salt);
}

// Le script prend en argument le mot de passe à chiffrer
echo bCrypt("$argv[1]",'13')."\n";
?>
