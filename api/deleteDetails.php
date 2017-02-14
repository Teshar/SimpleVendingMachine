<?php 
require_once 'database.php';
$data = json_decode(file_get_contents("php://input")); 
$query = "DELETE FROM products WHERE product_id=$data->del_id";
mysqli_query($con, $query);
echo true;
?>