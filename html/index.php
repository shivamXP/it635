#!/usr/bin/php
<?php
	require_once('./MongodbDatabase.php');
	function desMongo($item_no,$description){
        $db = new MongodbDatabase;
        $db->insertNewItem($item_no,$description);
}
desMongo("5","check if that works");
?>

