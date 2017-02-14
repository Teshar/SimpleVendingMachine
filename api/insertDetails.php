<?php 
// Including database connections
require_once 'database.php';
// Fetching and decoding the inserted data
$data = json_decode(file_get_contents("php://input")); 
// Escaping special characters from submitting data & storing in new variables.
$name = mysqli_real_escape_string($con, $data->name);
$desc = mysqli_real_escape_string($con, $data->desc);
$price = mysqli_real_escape_string($con, $data->price);
$qty = mysqli_real_escape_string($con, $data->qty);

// mysqli insert query
$query = "INSERT into products (product_name,product_desc,product_price,product_qty) VALUES ('$name','$desc','$price','$qty')";
// Inserting data into database
mysqli_query($con, $query);
echo true;
//echo "added";
?>