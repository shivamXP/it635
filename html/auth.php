<?php
require_once("/var/www/studentDB.inc");
function doLogin($username,$password)
{
	$studentDB = new StudentAccess("project1");
	return $studentDB->validateUser($username,$password);
}

function getItems(){
   $db = new StudentAccess("project1");
   return $db->getItems();
}
function buy($item_id,$quantity,$user){
$db = new StudentAccess("project1");
   $db->buy($item_id,$quantity,$user);
}
if(!isset($_POST))
{
	echo "error: expected POST data!";
	exit(0);
}
if(!isset($_POST["type"]))
{
	echo "error: no type specified";
	exit(0);
}
$response = "unsupported request type";
switch($_POST["type"])
{
	case "auth":
	    $auth = doLogin($_POST["username"],$_POST["password"]);
	    if ($auth)
	    {
		$response = "successful";
	    }
	    else
	    {
		$response = "failed";
	    }
	break;
 	
	case "getItems":
		$response=getItems();
 	break;
	
	case "buy":
 	         buy($_POST["item_id"],$_POST["quantity"],$_POST["user"]);
	break;	   
}

echo json_encode($response);
?>
