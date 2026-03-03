<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$active_group = 'default';
$query_builder = TRUE;

$db['default'] = array(
	'dsn'	=> '',
	'hostname' => 'localhost', 
	'username' => 'root',
	'password' => '',
	'database' => 'belfoods',
	'dbdriver' => 'mysqli',
	'dbprefix' => '',
	'pconnect' => FALSE,
	'db_debug' => (ENVIRONMENT !== 'production'),
	'cache_on' => FALSE,
	'cachedir' => '',
	'char_set' => 'utf8',
	'dbcollat' => 'utf8_general_ci',
	'swap_pre' => '',
	'encrypt' => FALSE,
	'compress' => FALSE,
	'stricton' => FALSE,
	'failover' => array(),
	'save_queries' => TRUE,
	'https'	=> FALSE,
	'key' => '12ul3Xz8WI-hHeh06cD1Z-Wo6TouEHuh-VIhcIbTEV4-LJkrGOm2Pq-0OUMS6bSDJ-dqv5GRR9Iy-44djYFZREp-Ys7egftRwL-YzfwnDlYqR'
);
