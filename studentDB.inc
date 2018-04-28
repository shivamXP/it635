<?php

class StudentAccess
{
private $db;
public function __construct($database)
{
	$this->db = new mysqli("localhost","root","toor",$database);
	if ($this->db->connect_errno != 0)
	{
		echo "error connecting to databse: ".$this->db->connect_error.PHP_EOL;
		exit();
	}
}

public function __destruct()
{
	if (isset($this->db))
	{
		$this->db->close();
	}
}

public function report($date,$month,$year){
if($date!="" and $month!="" and $year!=""){
        $query = "select item_no,quantity,total,user_id,order_no from sales where day='$date' and month='$month'and year='$year';";
	$query2 ="select sum(total) as total_sales where  day='$date' and month='$month'and year='$year' ";
        $queryResponse = $this->db->query($query);
        $response = array();
        while($row = $queryResponse->fetch_assoc())
        {
                $response[] = $row;
        }
        return $response;
}if($month!="" and $date == "" and $year == ""){
	 $query = "select item_no,quantity,total,user_id,order_no from sales where month='$month';";
        $queryResponse = $this->db->query($query);
        $response = array();
        while($row = $queryResponse->fetch_assoc())
        {
                $response[] = $row;
        }
        return $response;
}if($year!="" and $month=="" and $date ==""){
         $query = "select item_no,quantity,total,user_id,order_no from sales where year='$year';";
        $queryResponse = $this->db->query($query);
        $response = array();
        while($row = $queryResponse->fetch_assoc())
        {
                $response[] = $row;
        }
        return $response;

}if($year=="" and $month=="" and $date !=""){
         $query = "select item_no,quantity,total,user_id,order_no from sales where day='$date';";
        $queryResponse = $this->db->query($query);
        $response = array();
        while($row = $queryResponse->fetch_assoc())
        {
                $response[] = $row;
        }
        return $response;

}


}

public function showlowwater(){
        $query = "select markk from lowwater where indexx=1;";

        $queryRes = $this->db->query($query);
        $res = $queryRes->fetch_assoc();
        $mark=$res["markk"];
        $query = "select item_no,name,stock from items where stock<='$mark'";

        $queryResponse = $this->db->query($query);
        $response = array();
        while($row = $queryResponse->fetch_assoc())
        {
                $response[] = $row;
        }
        return $response; 

}

public function lowwater(){
  	$query = "select markk from lowwater where indexx=1;";

        $queryResponse = $this->db->query($query);
        $response = array();
        while($row = $queryResponse->fetch_assoc())
        {
                $response[] = $row;
        }
        return $response;

}
public function changeMark($mark){
	 $query = "update lowwater set markk='$mark' where indexx=1;";

         $this->db->query($query);
        
     
}
public function getDescription($item_no){
 	$query = "select description from discription where item_no='$item_no';";

        $queryResponse = $this->db->query($query);
        $response = array();
        while($row = $queryResponse->fetch_assoc())
        {
                $response[] = $row;
        }
        return $response;

}
public function sold(){


        $query = "select items.name,sales.item_no,SUM(sales.quantity) AS quantity from sales,items where sales.item_no=items.item_no group by sales.item_no;
";

        $queryResponse = $this->db->query($query);
        $response = array();
        while($row = $queryResponse->fetch_assoc())
        {
                $response[] = $row;
        }
        return $response;

}
public function buy($item_id,$quantity,$user){
	$d=date("d");
	$m=date("m");
	$y=date("y");
	$query1 = "select price from items where item_no='$item_id'";
	$pr = $this->db->query($query1);
	$price = $pr->fetch_assoc();
	$total=$price["price"] * $quantity ;
	$query2 = "update items set stock=stock-$quantity where item_no='$item_id'";
	$query3 = "insert into sales(item_no,day,month,year,total,user_id,quantity) VALUES ('$item_id','$d','$m','$y','$total','$user','$quantity');";
	$this->db->query($query2);
	$this->db->query($query3);
}

public function getItems($user,$filter)
{
	if($filter=="all"){
	$query = "select * from items;";
}else{

	$query = "select * from items where category= '$filter' ;";
}
	$queryResponse = $this->db->query($query);
	$response = array();
	while($row = $queryResponse->fetch_assoc())
	{
		$response[] = $row;
	}
	return $response;
}
public function addUser($user_id,$password){
	$id=$this->db->real_escape_string($user_id);
	$pass=$this->db->real_escape_string($password);
	$pass_hash=md5($pass);
	$query = "insert into users(user_id,password) VALUES ('$id','$pass_hash');";
        if (!$this->db->query($query))
        	{
                echo "failed";
        }
		
}
public function addItem($name,$stock,$price,$category)
{
	$nam = $this->db->real_escape_string($name);
	$sto = $this->db->real_escape_string($stock);
	$pri = $this->db->real_escape_string($price);
	$cat = $this->db->real_escape_string($category);
	$query = "insert into items(name,stock,price,category) VALUES ('$nam','$sto','$pri',$cat);";
	echo "executing SQL statement:\n".$query."\n";
	if (!$this->db->query($query))
	{
		echo "failed to insert record for $nam".PHP_EOL;
	}
}

public function validateUser($username,$password)
{
	$un = $this->db->real_escape_string($username);
	$pw = $this->db->real_escape_string($password);

	$query = "select * from users where user_id = '$un';";
	$result = $this->db->query($query);

	while ($row = $result->fetch_assoc())
	{
		if ($row["password"] == md5($pw))
		{
			return true;
		}
	}
	return false;
}

}
?>

