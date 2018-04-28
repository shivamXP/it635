#!/usr/bin/php

<?php
require_once('/home/ubuntu/vendor/autoload.php');


	$db= (new MongoDB\Client("mongodb://root:toor@ds251799.mlab.com:51799/project"))->collection;
	$db->insert([
	'name' => "shivam",
	'last' => "patel"
	]);
	
	
?>

