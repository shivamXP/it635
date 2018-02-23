<?php
require_once("/var/www/studentDB.inc");
function addUser($user_id,$password)
{
        $studentDB = new StudentAccess("project1");
        $studentDB->addUser($user_id,$password);
}

switch($_POST["type"])
{
        case "addUser":
            addUser($_POST["username"],$_POST["password"]);
 	break;
}

?>

