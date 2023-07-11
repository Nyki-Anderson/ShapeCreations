<?php

declare(strict_types=1);

$cfg['blowfish_secret'] = ''; // Use OpenSSL to generate 32 chars long

/**
 * Servers configuration
 */
$i = 0;
$i++; // server 1 :

/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'config';
$cfg['Servers'][$i]['user'] = 'pma';
$cfg['Servers'][$i]['password'] = ''; // Use OpenSSL to generate
$cfg['Servers'][$i]['only_db'] = ''; // Name of database
$cfg['Servers'][$i]['AllowRoot'] = false;
$cfg['Servers'][$i]['AllowDeny']['order'] = 'deny,allow';
$cfg['Servers'][$i]['AllowDeny']['rules'] = array(
  // 'deny <INSERT CONTAINER USER> from all',
);

/**
 * Directories for saving/loading files from server
 */
$cfg['SaveDir'] = ''; // Should lead to db/init-scripts (absolute)

/**
 * ReCAPTCHA using gCAPTCHA
 */
$cfg['CaptchaMethod'] = 'checkbox';
// This is the secret key from gCaptcha dashboard
$cfg['CaptchaLoginPrivateKey'] = ''; // Copy from gCapthca
// This is the site key from gCaptcha dashboard
$cfg['CaptchaLoginPublicKey'] = ''; // Copy from gCapthca