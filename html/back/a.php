#!/usr/bin/php

<?php
require_once('/home/ubuntu/vendor/autoload.php');

	class mongo{
	public $db;
	function __construct(){
	$this->$db= new MongoDB\Client("mongodb://root:toor@ds251799.mlab.com:51799/project");
	}

	function insert(){
	$this->$db->insertOne([
	'name' => "shivam",
	'last' => "patel"
	]);
	
	}

}
?>

