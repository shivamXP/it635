<?php
	require_once('/home/ubuntu/vendor/autoload.php');
$response="no response is set yet";

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

switch($_POST["type"]){
	
	case "desMongo":
	$client = new MongoDB\Client("mongodb://root:toor@ds251799.mlab.com:51799/project"); 

  	$client=$client->project;
        $client->collection->insertOne([
        "id_no" => $_POST["item_no"], 
	"description" => $_POST["description"]
        ]);
        break;
        
	case "find":
	 $client = new MongoDB\Client("mongodb://root:toor@ds251799.mlab.com:51799/project");

        $client=$client->project;
        $response=$client->collection->findOne([
	'id_no' => $_POST["id"]
	]);
	$response=$response["description"];
	break;

}
echo json_encode($response);
?>
