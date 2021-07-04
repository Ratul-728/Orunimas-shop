<?php

error_reporting(E_ALL);
ini_set('display_errors', 0);


$db_name="orunimasshop";
$mysql_username="root";
$mysql_password="";

$server_name="localhost";

$conn=mysqli_connect($server_name,$mysql_username,$mysql_password,$db_name);

?>