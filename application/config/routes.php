<?php
defined('BASEPATH') or exit('No direct script access allowed');

$route['default_controller']            = 'beranda';
$route['dashboard']                     = 'beranda';

$route['login']                         = 'auth/login';
$route['logout']                        = 'auth/logout';

// $route['edit-password'] 		= 'auth/edit_password';
// $route['forgot-password'] 	= 'auth/forgot_password';

$route['404_override']                     = '';
$route['translate_uri_dashes']             = FALSE;
