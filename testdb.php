#!/usr/bin/php
<?php

require_once("studentDB.inc");

		$DB = new StudentAccess("project1");
	      $var=$DB->buy('3','5','user');

?>
