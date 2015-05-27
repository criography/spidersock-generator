<?php
require_once 'wp-config.php';
//ini_set('display_errors','On');
if(mysql_connect(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME))
{
    echo 'OK';
    die();
}