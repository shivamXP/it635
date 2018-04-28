<?php
require_once("/var/www/studentDB.inc");


function report($day,$month,$year){
	 $studentDB = new StudentAccess("project1");
        return $studentDB->report($day,$month,$year);
}

function showlowwater(){
	$studentDB = new StudentAccess("project1");
        return $studentDB->showlowwater();
}
function changeMark($mark){
	 $studentDB = new StudentAccess("project1");
	$studentDB->changeMark($mark);
	return "value changed to '$mark' ";
}
function lowwater(){
	$studentDB = new StudentAccess("project1");
	return $studentDB->lowwater();
}

function doLogin($username,$password)
{
	$studentDB = new StudentAccess("project1");
	return $studentDB->validateUser($username,$password);
}
function description($item_no){
 $db = new StudentAccess("project1");
         return $db->getDescription($item_no);
}
function sold(){
	 $db = new StudentAccess("project1");
   	 return $db->sold();
}
function getItems($user,$filter){
   	$db = new StudentAccess("project1");
   	return $db->getItems($user,$filter);
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
		$response=getItems($_POST["username"],$_POST["filter"]);
 	break;
	
	case "buy":
 	         buy($_POST["item_id"],$_POST["quantity"],$_POST["user"]);
	break;	   
	
	case "sold";
		$response=sold();
	break;
	case "description";
		$response=description($_POST["item_no"]);
	break;
	case "lowwater";
		$response=lowwater();
	break;
	case "changeMark";
		$response=changeMark($_POST["mark"]);
	break;
	case "showlowwater";
		$response=showlowwater();	
	break;
	case "report";
		$response=report($_POST["day"],$_POST["month"],$_POST["year"]);
	break;
}

echo json_encode($response);
?>
